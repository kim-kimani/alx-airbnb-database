-- 🔍 Original Complex Query
-- Retrieves all bookings with user, property, and payment details.

SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    u.email AS user_email,
    p.title AS property_title,
    p.price_per_night,
    pay.amount AS payment_amount
FROM 
    Bookings b
JOIN Users u ON b.guest_id = u.id
JOIN Properties p ON b.property_id = p.id
JOIN Payments pay ON b.id = pay.booking_id
WHERE 
    b.check_in_date >= '2024-01-01' AND b.check_out_date <= '2025-01-01';


-- 📊 Analyze original query performance
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    u.email AS user_email,
    p.title AS property_title,
    p.price_per_night,
    pay.amount AS payment_amount
FROM 
    Bookings b
JOIN Users u ON b.guest_id = u.id
JOIN Properties p ON b.property_id = p.id
JOIN Payments pay ON b.id = pay.booking_id
WHERE 
    b.check_in_date >= '2024-01-01' AND b.check_out_date <= '2025-01-01';


-- 🔧 Refactored Query
-- Reduced unnecessary columns and filtered early

SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    u.email AS user_email,
    p.title AS property_title,
    p.price_per_night,
    pay.amount AS payment_amount
FROM 
    Bookings b
INNER JOIN Users u ON b.guest_id = u.id
INNER JOIN Properties p ON b.property_id = p.id
INNER JOIN Payments pay ON b.id = pay.booking_id
WHERE 
    b.check_in_date >= '2024-01-01' 
    AND b.check_out_date <= '2025-01-01'
    AND pay.status = 'completed';


-- 📊 Analyze refactored query performance
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    u.email AS user_email,
    p.title AS property_title,
    p.price_per_night,
    pay.amount AS payment_amount
FROM 
    Bookings b
INNER JOIN Users u ON b.guest_id = u.id
INNER JOIN Properties p ON b.property_id = p.id
INNER JOIN Payments pay ON b.id = pay.booking_id
WHERE 
    b.check_in_date >= '2024-01-01' 
    AND b.check_out_date <= '2025-01-01'
    AND pay.status = 'completed';