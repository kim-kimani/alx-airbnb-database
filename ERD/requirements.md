# Entity-Relationship (ER) Diagram Requirements - AirBnB Database

This document defines all entities, attributes, and relationships for the AirBnB-style database to be used in creating an Entity-Relationship (ER) diagram.

---

## 📦 Entities and Attributes

### 1. **User**
Represents users of the system who can act as guests, hosts, or admins.

| Attribute Name     | Type             | Constraints                              |
|--------------------|------------------|-------------------------------------------|
| user_id            | UUID             | Primary Key, Indexed                      |
| first_name         | VARCHAR          | NOT NULL                                  |
| last_name          | VARCHAR          | NOT NULL                                  |
| email              | VARCHAR          | UNIQUE, NOT NULL                          |
| password_hash      | VARCHAR          | NOT NULL                                  |
| phone_number       | VARCHAR          | NULL                                      |
| role               | ENUM('guest', 'host', 'admin') | NOT NULL                    |
| created_at         | TIMESTAMP        | DEFAULT CURRENT_TIMESTAMP                 |

> **Constraints**: Unique constraint on `email`. Non-null constraints on required fields.

---

### 2. **Property**
Represents listings available for rent by hosts.

| Attribute Name     | Type             | Constraints                              |
|--------------------|------------------|-------------------------------------------|
| property_id        | UUID             | Primary Key, Indexed                      |
| host_id            | UUID             | Foreign Key → User(user_id)               |
| name               | VARCHAR          | NOT NULL                                  |
| description        | TEXT             | NOT NULL                                  |
| location           | VARCHAR          | NOT NULL                                  |
| pricepernight      | DECIMAL          | NOT NULL                                  |
| created_at         | TIMESTAMP        | DEFAULT CURRENT_TIMESTAMP                 |
| updated_at         | TIMESTAMP        | ON UPDATE CURRENT_TIMESTAMP               |

> **Constraints**: Foreign key constraint on `host_id`.

---

### 3. **Booking**
Represents reservations made by users for properties.

| Attribute Name     | Type             | Constraints                              |
|--------------------|------------------|-------------------------------------------|
| booking_id         | UUID             | Primary Key, Indexed                      |
| property_id        | UUID             | Foreign Key → Property(property_id)       |
| user_id            | UUID             | Foreign Key → User(user_id)               |
| start_date         | DATE             | NOT NULL                                  |
| end_date           | DATE             | NOT NULL                                  |
| total_price        | DECIMAL          | NOT NULL                                  |
| status             | ENUM('pending', 'confirmed', 'canceled') | NOT NULL |
| created_at         | TIMESTAMP        | DEFAULT CURRENT_TIMESTAMP                 |

> **Constraints**: Foreign key constraints on `property_id` and `user_id`. Status must be one of: `pending`, `confirmed`, `canceled`.

---

### 4. **Payment**
Represents payment information related to bookings.

| Attribute Name     | Type             | Constraints                              |
|--------------------|------------------|-------------------------------------------|
| payment_id         | UUID             | Primary Key, Indexed                      |
| booking_id         | UUID             | Foreign Key → Booking(booking_id)         |
| amount             | DECIMAL          | NOT NULL                                  |
| payment_date       | TIMESTAMP        | DEFAULT CURRENT_TIMESTAMP                 |
| payment_method     | ENUM('credit_card', 'paypal', 'stripe') | NOT NULL   |

> **Constraints**: Foreign key constraint on `booking_id`.

---

### 5. **Review**
Represents feedback given by users on properties.

| Attribute Name     | Type             | Constraints                              |
|--------------------|------------------|-------------------------------------------|
| review_id          | UUID             | Primary Key, Indexed                      |
| property_id        | UUID             | Foreign Key → Property(property_id)       |
| user_id            | UUID             | Foreign Key → User(user_id)               |
| rating             | INTEGER          | CHECK (rating BETWEEN 1 AND 5), NOT NULL  |
| comment            | TEXT             | NOT NULL                                  |
| created_at         | TIMESTAMP        | DEFAULT CURRENT_TIMESTAMP                 |

> **Constraints**: Rating must be between 1 and 5. Foreign key constraints on `property_id` and `user_id`.

---

### 6. **Message**
Represents communication between users (e.g., guest and host).

| Attribute Name     | Type             | Constraints                              |
|--------------------|------------------|-------------------------------------------|
| message_id         | UUID             | Primary Key, Indexed                      |
| sender_id          | UUID             | Foreign Key → User(user_id)               |
| recipient_id       | UUID             | Foreign Key → User(user_id)               |
| message_body       | TEXT             | NOT NULL                                  |
| sent_at            | TIMESTAMP        | DEFAULT CURRENT_TIMESTAMP                 |

> **Constraints**: Foreign key constraints on `sender_id` and `recipient_id`.

---

## 🔗 Relationships Between Entities

| Relationship                         | Direction                  | Description                                                                 |
|-------------------------------------|----------------------------|-----------------------------------------------------------------------------|
| User ↔ Property                     | One-to-Many                | A **User** (as a host) can own many **Properties**.                         |
| Property → Booking                  | One-to-Many                | A **Property** can have many **Bookings**.                                  |
| User → Booking                      | One-to-Many                | A **User** (as a guest) can make many **Bookings**.                         |
| Booking → Payment                   | One-to-One                 | Each **Booking** has exactly one associated **Payment**.                    |
| Property → Review                   | One-to-Many                | A **Property** can have many **Reviews**.                                   |
| User → Review                       | One-to-Many                | A **User** can write many **Reviews**.                                      |
| User → Message (sent)               | One-to-Many                | A **User** can send many **Messages**.                                      |
| User → Message (received)           | One-to-Many                | A **User** can receive many **Messages**.                                   |

---

## 🔍 Indexing Strategy

| Table       | Indexed Column(s)    | Purpose                                               |
|-------------|----------------------|--------------------------------------------------------|
| User        | email                | To optimize login and search operations               |
| Property    | property_id          | Primary key index                                     |
| Booking     | property_id, booking_id, user_id | Optimize queries filtering by property, booking, or user |
| Payment     | booking_id           | Efficient lookup of payments per booking              |
| Review      | property_id, user_id | Quick access to reviews by property or user           |
| Message     | sender_id, recipient_id | Improve performance on messaging filters             |

All primary keys are automatically indexed.

---