-- Insert Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'Alice', 'Wong', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
    (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host'),
    (gen_random_uuid(), 'Carol', 'Ngugi', 'carol@example.com', 'hashed_pw_3', NULL, 'admin');



-- Insert Properties
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'bob@example.com'), 'Sunny Apartment', 'Modern, cozy apartment with sea view', 'Nairobi, Kenya', 75.00),
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'bob@example.com'), 'Mountain Cabin', 'Rustic cabin in the mountains, perfect for retreats', 'Kisumu, Kenya', 120.00);

-- Insert Bookings
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (gen_random_uuid(),
    (SELECT property_id FROM properties WHERE name = 'Sunny Apartment'),
    (SELECT user_id FROM users WHERE email = 'alice@example.com'),
    '2025-06-01', '2025-06-05', 300.00, 'confirmed');

-- Insert Payments
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (gen_random_uuid(),
    (SELECT booking_id FROM bookings WHERE total_price = 300.00),
    300.00, 'credit_card');

-- Insert Reviews
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (gen_random_uuid(),
    (SELECT property_id FROM properties WHERE name = 'Sunny Apartment'),
    (SELECT user_id FROM users WHERE email = 'alice@example.com'),
    5, 'Amazing stay, loved the view and cleanliness!');

-- Insert Messages
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (gen_random_uuid(),
    (SELECT user_id FROM users WHERE email = 'alice@example.com'),
    (SELECT user_id FROM users WHERE email = 'bob@example.com'),
    'Hi Bob, just wanted to confirm my check-in time.');
