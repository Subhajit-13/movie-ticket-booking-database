# Movie Ticket Booking System — Database Requirements

## 1. Purpose

The purpose of this project is to design a relational database for a
movie ticket booking system.

The database should support multiple theaters, multiple screens within
each theater, different seating arrangements, movies, and scheduled shows.

This project focuses only on database design and does not include a backend
application.

## 2. Theater Requirements

- The system should support multiple theaters.
- Each theater should have a name and location.
- A theater can contain multiple screens.
- Each screen belongs to exactly one theater.

## 3. Screen Requirements

- Each screen should have a unique identity within its theater.
- A screen can contain multiple seats.
- Different screens may have different seating arrangements.

## 4. Seat Requirements

- Each seat belongs to exactly one screen.
- A seat should have a row identifier and seat number.
- Seats may have different types, such as Regular or Premium.
- The same physical seat can be used for different shows scheduled on
  that screen.

## 5. Movie Requirements

- The system should support multiple movies.
- A movie should store basic information such as title, description,
  duration, language, and release date.
- The same movie can be shown in multiple theaters.
- A movie can have multiple scheduled shows.

## 6. Show Requirements

A show represents a scheduled screening of a movie.

Each show should:

- Belong to exactly one movie.
- Take place on exactly one screen.
- Have a start time.
- Have an end time.

A screen can have multiple shows at different times.

## 7. User Requirements

- The system should support multiple users.
- Each user should have a unique identity.
- A user should have basic information such as name and email.
- A user can eventually make multiple bookings.

## 8. Initial Entities

The initial database design will contain the following entities:

- Users
- Movies
- Theaters
- Screens
- Seats
- Shows

Booking and payment-related entities will be added in later versions.

## 9. Initial Relationships

- One theater can have many screens.
- One screen belongs to one theater.
- One screen can have many seats.
- One seat belongs to one screen.
- One movie can have many shows.
- One show belongs to one movie.
- One screen can host many shows.
- One show takes place on one screen.
- One user can eventually have many bookings.

## 10. Out of Scope for Initial Version

The first version will not include:

- Bookings
- Seat locking
- Payments
- Cancellations
- Discounts
- Coupons
- Food ordering
- Reviews
- Authentication
- Notifications
- Backend APIs