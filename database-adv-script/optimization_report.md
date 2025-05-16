# 🚀 Query Optimization Report – Airbnb Clone Database Project

This document outlines the process of identifying performance issues in a complex SQL query, analyzing it using `EXPLAIN ANALYZE`, and refactoring it to improve execution time.

---

## 🎯 Objective

To:
- Write and analyze a complex query retrieving booking data with related tables
- Identify inefficiencies using `EXPLAIN ANALYZE`
- Refactor the query to improve performance

---

## 🧾 Original Query

The original query joins four tables (`Bookings`, `Users`, `Properties`, `Payments`) and selects many fields. While functional, it may cause unnecessary overhead due to:

- Large number of joined rows
- Retrieving unused or redundant fields
- Lack of filtering clauses

### Query:

```sql
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