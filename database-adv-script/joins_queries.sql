-- 1. INNER JOIN: Retrieve all bookings with the respective users who made them.
-- This query returns only those bookings where there is a matching user.

SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price,
    u.id AS user_id,
    u.email AS user_email,
    u.first_name,
    u.last_name
FROM 
    Bookings b
INNER JOIN 
    Users u ON b.guest_id = u.id;


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews.
-- This query ensures all properties appear even if they have no associated reviews.
-- Ordered by property_id for readability.

SELECT 
    p.id AS property_id,
    p.title AS property_title,
    r.id AS review_id,
    r.rating,
    r.comment,
    r.created_at
FROM 
    Properties p
LEFT JOIN 
    Reviews r ON p.id = r.property_id
ORDER BY 
    p.id;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if:
-- - The user has no booking
-- - The booking is not linked to any user

-- This query includes all users and all bookings regardless of matches.

SELECT 
    u.id AS user_id,
    u.email AS user_email,
    u.first_name,
    u.last_name,
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_price
FROM 
    Users u
FULL OUTER JOIN 
    Bookings b ON u.id = b.guest_id;