# Database Design

## 1. Initial Entities

The initial version of the movie ticket booking database contains six
core entities.

### 1.1 User

Represents a person using the movie ticket booking system.

A user can eventually create multiple bookings.

### 1.2 Movie

Represents a movie available for screening.

A movie is independent of a theater because the same movie can be shown
in multiple theaters.

### 1.3 Theater

Represents a physical cinema location.

A theater can contain multiple screens.

### 1.4 Screen

Represents an individual auditorium within a theater.

Each screen belongs to exactly one theater and can have its own seating
arrangement.

### 1.5 Seat

Represents a physical seat within a screen.

Each seat belongs to exactly one screen.

### 1.6 Show

Represents a scheduled screening of a movie.

A show connects a movie with a screen and specifies when the movie will
be shown.

## 2. Initial Entity List

| Entity | Description |
|--------|-------------|
| User | Person using the application |
| Movie | Movie being screened |
| Theater | Physical cinema location |
| Screen | Auditorium within a theater |
| Seat | Physical seat within a screen |
| Show | Scheduled screening of a movie |

## 3. Future Entities

The following entities are intentionally not part of the initial design:

- Booking
- Booking Seat
- Payment
- Seat Hold

These will be introduced when the booking workflow is designed.