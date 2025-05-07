# Airbnb Database Normalization to 3NF

## Objective
The Airbnb database schema is normalized to Third Normal Form (3NF) to eliminate redundancy and dependency anomalies.

---

## Normalization Overview

### First Normal Form (1NF)
- **Each table has a primary key**.
- **All attribute values are atomic (no repeating groups or arrays)**.
- **Tables like User, Property, Booking, etc., have only atomic fields**.
✅ **The schema satisfies 1NF.**

---

### Second Normal Form (2NF)
- **The database is already in 1NF**.
- **No partial dependency exists**, since:
  - All tables have single-attribute primary keys (e.g., `user_id`, `property_id`).
  - All non-key attributes fully depend on the whole key.
✅ **The schema satisfies 2NF.**

---

### Third Normal Form (3NF)
- **The database is in 2NF**.
- **No transitive dependencies exist**, i.e., no non-key attribute depends on another non-key attribute.

#### Example Checks:
- **User Table**: Attributes like email, name, and phone all depend directly on `user_id`.
- **Booking Table**: `total_price` depends on `booking_id`, not on user or property data.
- **Payment Table**: `payment_method`, `amount` depend directly on `payment_id`, not on `booking_id`.
- **Review Table**: `rating` and `comment` depend only on `review_id`.

✅ **The schema satisfies 3NF.**

---