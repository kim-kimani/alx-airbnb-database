-- 1. Non-Correlated Subquery:
-- Retrieve all properties where the average rating is greater than 4.0.

SELECT 
    p.id AS property_id,
    p.title AS property_title,
    AVG(r.rating) AS average_rating
FROM 
    Properties p
JOIN 
    Reviews r ON p.id = r.property_id
GROUP BY 
    p.id, p.title
HAVING 
    AVG(r.rating) > 4.0;


-- Alternative version using a subquery (explicitly showing subquery usage):

SELECT 
    id AS property_id,
    title AS property_title
FROM 
    Properties
WHERE 
    id IN (
        SELECT property_id
        FROM Reviews
        GROUP BY property_id
        HAVING AVG(rating) > 4.0
    );


-- 2. Correlated Subquery:
-- Retrieve users who have made more than 3 bookings.

SELECT 
    u.id AS user_id,
    u.email AS user_email,
    u.first_name,
    u.last_name
FROM 
    Users u
WHERE (
    SELECT COUNT(*) 
    FROM Bookings b 
    WHERE b.guest_id = u.id
) > 3;