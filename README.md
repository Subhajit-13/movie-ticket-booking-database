# Movie Ticket Booking Database

A relational database design project for a movie ticket booking system, built with **PostgreSQL** and **Docker**.

The project focuses on database design, relationships, constraints, sample data, and SQL queries. There is currently **no backend or frontend application**.

---

## Project Overview

The database models the core structure of a movie ticket booking platform.

It currently supports:

* Users
* Movies
* Theaters
* Screens
* Seats
* Movie shows

The booking-related entities will be added in a later phase.

### Current Database Flow

```text
Theater
   │
   └── Screens
          │
          └── Seats

Movie
   │
   └── Shows
          │
          └── Screen
                 │
                 └── Theater
```

---

## Tech Stack

* **Database:** PostgreSQL 18
* **Containerization:** Docker / Docker Compose
* **Database Client:** DBeaver
* **Version Control:** Git / GitHub
* **Operating System:** macOS

---

## Database Entities

### Users

Stores users who can eventually make movie ticket bookings.

Key fields:

* `user_id`
* `name`
* `email`
* `created_at`

---

### Movies

Stores movie information.

Key fields:

* `movie_id`
* `title`
* `description`
* `duration_minutes`
* `language`
* `release_date`
* `created_at`

---

### Theaters

Stores cinema/theater information.

Key fields:

* `theater_id`
* `name`
* `address`
* `city`
* `created_at`

---

### Screens

Represents individual screens inside a theater.

Each screen belongs to exactly one theater.

Important constraint:

```text
(theater_id, name) must be unique
```

This allows different theaters to have their own `Screen 1`, `Screen 2`, etc.

---

### Seats

Represents the physical seats inside a screen.

Each seat belongs to exactly one screen.

Important constraint:

```text
(screen_id, row_name, seat_number) must be unique
```

The current sample database contains:

* 8 screens
* 15 seats per screen
* 120 seats in total
* Rows A, B and C
* Rows A and B → Regular
* Row C → Premium

A seat does **not** contain an `is_booked` column because a physical seat can be available for one show and booked for another show.

---

### Shows

Represents a scheduled movie screening.

Each show belongs to:

* One movie
* One screen

The theater is derived through:

```text
Show → Screen → Theater
```

The current sample database contains 12 shows.

---

## Relationships

```text
Theater 1 ──── N Screen

Screen  1 ──── N Seat

Movie   1 ──── N Show

Screen  1 ──── N Show

User    1 ──── N Booking       (future)

Show    1 ──── N Booking       (future)
```

Conceptually, a show has a many-to-many relationship with seats because the same physical seats can be associated with different shows.

This will be handled through booking-related tables in the next phase.

---

## Project Structure

```text
movie-ticket-booking-database/
│
├── docker-compose.yml
├── README.md
│
├── docs/
│   ├── requirements.md
│   ├── database-design.md
│   └── er-diagram.png
│
└── sql/
    ├── schema.sql
    └── sample-data.sql
```

---

# Setup

## 1. Clone the repository

```bash
git clone https://github.com/Subhajit-13/movie-ticket-booking-database.git
cd movie-ticket-booking-database
```

## 2. Start PostgreSQL

Make sure Docker Desktop is running, then:

```bash
docker compose up -d
```

Check the container:

```bash
docker ps
```

The PostgreSQL database is exposed on:

```text
localhost:5433
```

---

## 3. Connect to PostgreSQL

Use a database client such as DBeaver with:

```text
Host:     localhost
Port:     5433
Database: movie_ticket_db
Username: movie_user
Password: movie_password
```

---

## 4. Create the database tables

Open:

```text
sql/schema.sql
```

Execute the entire file against `movie_ticket_db`.

This creates:

```text
users
movies
theaters
screens
seats
shows
```

---

## 5. Load sample data

Open:

```text
sql/sample-data.sql
```

Execute the entire file.

This inserts the sample:

* Theaters
* Screens
* Seats
* Movies
* Shows

---

## Current Database State

After running both SQL files:

| Entity   | Records |
| -------- | ------: |
| Users    |       0 |
| Movies   |       4 |
| Theaters |       3 |
| Screens  |       8 |
| Seats    |     120 |
| Shows    |      12 |

---

## Design Decisions

### Why doesn't `seats` have `is_booked`?

A physical seat isn't permanently booked.

For example:

```text
Seat A1

10:00 AM Show → Available
2:00 PM Show  → Booked
8:00 PM Show  → Available
```

Therefore, booking status belongs to the relationship between a **specific show and a specific seat**, rather than to the physical seat itself.

---

### Why doesn't `shows` have `theater_id`?

A show already identifies its screen:

```text
Show
 ↓
Screen
 ↓
Theater
```

Storing `theater_id` again in `shows` would duplicate information and could create inconsistent data.

---

### Why is screen name unique only within a theater?

Different theaters can have:

```text
PVR South City → Screen 1
INOX Quest Mall → Screen 1
Cinepolis → Screen 1
```

Therefore the constraint is:

```text
UNIQUE (theater_id, name)
```

rather than simply:

```text
UNIQUE (name)
```

---

## Future Development

The next phase will introduce the booking system.

Planned entities include:

```text
Booking
Booking Seat
Payment
Seat Hold
```

These will support concepts such as:

* Selecting seats for a specific show
* Preventing duplicate seat bookings
* Booking multiple seats
* Booking status
* Payment status
* Temporary seat holds
* Ticket pricing
* Booking history

The booking model will be designed carefully to maintain database integrity and prevent the same seat from being booked twice for the same show.

---

## Scope

### Currently Included

* Relational database design
* PostgreSQL schema
* Primary keys
* Foreign keys
* Unique constraints
* Check constraints
* Sample data
* Dockerized PostgreSQL environment

### Currently Out of Scope

* Backend APIs
* Frontend application
* Authentication
* Payment gateway integration
* Notifications
* Seat locking implementation
* Production deployment

---

## Author

**Subhajit Biswas**

GitHub: `Subhajit-13`
