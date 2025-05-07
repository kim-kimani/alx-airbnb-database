# Seed Database with Sample Data

This document provides SQL scripts to populate the AirBnB-style database with realistic sample data for testing and demonstration purposes. The script inserts records into the following tables:

- `users`
- `properties`
- `bookings`
- `payments`
- `reviews`
- `messages`

Each dataset reflects real-world usage scenarios, such as guests booking properties, hosts listing homes, payments being made, and users exchanging messages or writing reviews.

---

## 🧾 SQL Scripts

Below are the SQL `INSERT` statements that you can run in your PostgreSQL environment to seed the database.

> 💡 Ensure the tables exist before running these insertions.

### 🔐 Insert Users

```sql
-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(gen_random_uuid(), 'Alice', 'Wong', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
(gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host'),
(gen_random_uuid(), 'Carol', 'Ngugi', 'carol@example.com', 'hashed_pw_3', NULL, 'admin'),
(gen_random_uuid(), 'David', 'Mwangi', 'david@example.com', 'hashed_pw_4', '1122334455', 'guest'),
(gen_random_uuid(), 'Eve', 'Otieno', 'eve@example.com', 'hashed_pw_5', NULL, 'host');

-- Insert Properties (Bob and Eve are hosts)
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
(gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'bob@example.com'), 'Sunny Apartment', 'Modern, cozy apartment with sea view', 'Nairobi, Kenya', 75.00),
(gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'bob@example.com'), 'Mountain Cabin', 'Rustic cabin in the mountains, perfect for retreats', 'Kisumu, Kenya', 120.00),
(gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'eve@example.com'), 'Luxury Villa', 'Spacious villa with private pool and garden', 'Mombasa, Kenya', 200.00);

-- Alice books Sunny Apartment
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(gen_random_uuid(),
(SELECT property_id FROM properties WHERE name = 'Sunny Apartment'),
(SELECT user_id FROM users WHERE email = 'alice@example.com'),
'2025-06-01', '2025-06-05', 300.00, 'confirmed');

-- David books Mountain Cabin
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(gen_random_uuid(),
(SELECT property_id FROM properties WHERE name = 'Mountain Cabin'),
(SELECT user_id FROM users WHERE email = 'david@example.com'),
'2025-07-10', '2025-07-15', 600.00, 'pending');

-- Eve books her own Luxury Villa (for testing edge cases)
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(gen_random_uuid(),
(SELECT property_id FROM properties WHERE name = 'Luxury Villa'),
(SELECT user_id FROM users WHERE email = 'eve@example.com'),
'2025-08-01', '2025-08-04', 600.00, 'confirmed');

-- Payment for Alice's confirmed booking
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(gen_random_uuid(),
(SELECT booking_id FROM bookings WHERE total_price = 300.00),
300.00, 'credit_card');

-- Payment for David's pending booking
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(gen_random_uuid(),
(SELECT booking_id FROM bookings WHERE total_price = 600.00 AND status = 'pending'),
600.00, 'paypal');

-- Payment for Eve's self-booking
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(gen_random_uuid(),
(SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'eve@example.com')),
600.00, 'stripe');

-- Alice reviews Sunny Apartment
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
(gen_random_uuid(),
(SELECT property_id FROM properties WHERE name = 'Sunny Apartment'),
(SELECT user_id FROM users WHERE email = 'alice@example.com'),
5, 'Amazing stay, loved the view and cleanliness!');

-- David reviews Mountain Cabin
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
(gen_random_uuid(),
(SELECT property_id FROM properties WHERE name = 'Mountain Cabin'),
(SELECT user_id FROM users WHERE email = 'david@example.com'),
4, 'Great experience overall, but the heating was a bit faulty.');

-- Alice sends message to Bob (host of Sunny Apartment)
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(gen_random_uuid(),
(SELECT user_id FROM users WHERE email = 'alice@example.com'),
(SELECT user_id FROM users WHERE email = 'bob@example.com'),
'Hi Bob, just wanted to confirm my check-in time.');

-- David sends message to Bob (host of Mountain Cabin)
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(gen_random_uuid(),
(SELECT user_id FROM users WHERE email = 'david@example.com'),
(SELECT user_id FROM users WHERE email = 'bob@example.com'),
'Hello Bob, is there parking available near the cabin?');

-- Eve sends message to Carol (admin)
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(gen_random_uuid(),
(SELECT user_id FROM users WHERE email = 'eve@example.com'),
(SELECT user_id FROM users WHERE email = 'carol@example.com'),
'Hi Carol, I''m having trouble uploading new photos for my property.');