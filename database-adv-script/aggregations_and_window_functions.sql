-- 1. Aggregation: Total number of bookings per user
-- Use COUNT() and GROUP BY to summarize booking data.

SELECT 
    u.id AS user_id,
    u.email AS user_email,
    COUNT(b.id) AS total_bookings
FROM 
    Users u
LEFT JOIN 
    Bookings b ON u.id = b.guest_id
GROUP BY 
    u.id, u.email
ORDER BY 
    total_bookings DESC;


-- 2. Window Function: Rank properties based on total number of bookings
-- Using ROW_NUMBER() and RANK()

WITH PropertyBookingCounts AS (
    SELECT 
        b.property_id,
        COUNT(b.id) AS total_bookings
    FROM 
        Bookings b
    GROUP BY 
        b.property_id
),
PropertyRanking AS (
    SELECT 
        pbc.property_id,
        p.title AS property_title,
        pbc.total_bookings,
        ROW_NUMBER() OVER (ORDER BY pbc.total_bookings DESC) AS row_number_rank,
        RANK() OVER (ORDER BY pbc.total_bookings DESC) AS rank
    FROM 
        PropertyBookingCounts pbc
    JOIN 
        Properties p ON pbc.property_id = p.id
)
SELECT 
    property_id,
    property_title,
    total_bookings,
    row_number_rank,
    rank
FROM 
    PropertyRanking
ORDER BY 
    total_bookings DESC;