-- Step 1: Drop existing bookings table if it's not already partitioned
DROP TABLE IF EXISTS Bookings;

-- Step 2: Create the main partitioned table
CREATE TABLE Bookings (
    id TEXT PRIMARY KEY,
    guest_id TEXT NOT NULL,
    property_id TEXT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price NUMERIC(10, 2),
    status TEXT
) PARTITION BY RANGE (check_in_date);


-- Step 3: Create partitions for each quarter of the year

-- Q1: January - March
CREATE TABLE Bookings_2025_Q1 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

-- Q2: April - June
CREATE TABLE Bookings_2025_Q2 PARTITION OF Bookings
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

-- Q3: July - September
CREATE TABLE Bookings_2025_Q3 PARTITION OF Bookings
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

-- Q4: October - December
CREATE TABLE Bookings_2025_Q4 PARTITION OF Bookings
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');


-- Step 4: Insert sample data into the partitioned table

INSERT INTO Bookings (id, guest_id, property_id, check_in_date, check_out_date, total_price, status)
VALUES
('b1', 'u1', 'p1', '2025-02-10', '2025-02-15', 600.00, 'confirmed'),
('b2', 'u2', 'p2', '2025-05-01', '2025-05-08', 980.00, 'completed'),
('b3', 'u3', 'p3', '2025-08-20', '2025-08-25', 750.00, 'pending'),
('b4', 'u4', 'p4', '2025-11-12', '2025-11-18', 840.00, 'confirmed');


-- Step 5: Query performance test using EXPLAIN ANALYZE

-- Before partitioning (simulate full table scan)
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE check_in_date BETWEEN '2025-02-01' AND '2025-02-28';


-- After partitioning (should only scan relevant partition)
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE check_in_date BETWEEN '2025-05-01' AND '2025-05-31';