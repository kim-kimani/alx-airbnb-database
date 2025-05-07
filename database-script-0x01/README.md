# Airbnb Database Schema

This project defines the database schema for a simplified Airbnb-like platform using SQL (PostgreSQL syntax). It covers users, properties, bookings, payments, reviews, and messaging between users.

## Project Structure

- `schema.sql` — Contains SQL `CREATE TABLE` statements with constraints, data types, foreign keys, and indexes.
- `ERD/requirements.md` — ER diagram and explanation of entities and relationships.
- `normalization.md` — Explanation of normalization process (up to 3NF).

## Entities and Attributes

### 1. User
- `user_id` (UUID, Primary Key)
- `first_name`, `last_name`, `email`, `password_hash`, `phone_number`
- `role` (guest, host, admin)
- `created_at`

### 2. Property
- `property_id` (UUID, Primary Key)
- `host_id` (Foreign Key → users)
- `name`, `description`, `location`, `pricepernight`
- `created_at`, `updated_at`

### 3. Booking
- `booking_id` (UUID, Primary Key)
- `property_id`, `user_id` (Foreign Keys)
- `start_date`, `end_date`, `total_price`, `status`
- `created_at`

### 4. Payment
- `payment_id` (UUID, Primary Key)
- `booking_id` (Foreign Key)
- `amount`, `payment_date`, `payment_method`

### 5. Review
- `review_id` (UUID, Primary Key)
- `property_id`, `user_id` (Foreign Keys)
- `rating` (1-5), `comment`, `created_at`

### 6. Message
- `message_id` (UUID, Primary Key)
- `sender_id`, `recipient_id` (Foreign Keys)
- `message_body`, `sent_at`

## Relationships

- A **User** can be a **Guest** or **Host**.
- A **Host** can list multiple **Properties**.
- A **Guest** can make multiple **Bookings** for different **Properties**.
- Each **Booking** can have one **Payment**.
- Guests can leave **Reviews** on **Properties**.
- Users can exchange **Messages** with each other.

## Indexes and Constraints

- Unique: `email` in `users`
- Foreign keys between entities
- Check constraints on:
  - `role`, `status`, `payment_method`, and `rating`
- Indexes on commonly queried fields like:
  - `email`, `host_id`, `property_id`, `user_id`, `booking_id`

