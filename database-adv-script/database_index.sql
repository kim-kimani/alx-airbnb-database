-- Index for guest_id in Bookings (used in JOINs and WHERE clauses)
CREATE INDEX IF NOT EXISTS idx_bookings_guest_id ON Bookings(guest_id);

-- Index for property_id in Bookings (used in JOINs and WHERE clauses)
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON Bookings(property_id);

-- Index for email in Users (used in login and WHERE clauses)
CREATE INDEX IF NOT EXISTS idx_users_email ON Users(email);

-- Index for host_id in Properties (used in filtering by host)
CREATE INDEX IF NOT EXISTS idx_properties_host_id ON Properties(host_id);

-- Index for check_in_date in Bookings (used in availability reports)
CREATE INDEX IF NOT EXISTS idx_bookings_check_in_date ON Bookings(check_in_date);


- Performance Test Queries using EXPLAIN ANALYZE (required for checker)

-- Query 1: Find bookings by guest
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE guest_id = 'user_001';

-- Query 2: Find bookings by property
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE property_id = 'property_101';