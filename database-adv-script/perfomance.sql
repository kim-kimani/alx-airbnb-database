-- 🔍 Original Complex Query
-- Retrieves all bookings with user, property, and payment details.

SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    u.id AS user_id,
    u.email AS user_email,
    u.first_name,
    u.last_name,
    p.id AS property_id,
    p.title AS property_title,
    p.price_per_night,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    Bookings b
JOIN Users u ON b.guest_id = u.id
JOIN Properties p ON b.property_id = p.id
JOIN Payments pay ON b.id = pay.booking_id;


-- 🔧 Refactored Query
-- Only select necessary columns, reduce JOINs if not always needed

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
    pay.status = 'completed';