# 📊 Partitioning Performance Report – Airbnb Clone Database Project

This document outlines how **table partitioning** was used to improve query performance on the large `Bookings` table by splitting it into smaller, more manageable partitions based on the `check_in_date`.

The goal is to reduce query execution time when filtering bookings by date ranges.

---

## 🎯 Objective

To:
- Implement **range-based partitioning** on the `Bookings` table using `check_in_date`
- Test performance before and after partitioning
- Document the observed improvements

---

## 🛠️ Implementation Summary

### Step-by-step actions:

1. Dropped the original `Bookings` table.
2. Created a new **partitioned table** based on `check_in_date`.
3. Defined **four quarterly partitions**:
   - Q1: Jan–Mar
   - Q2: Apr–Jun
   - Q3: Jul–Sep
   - Q4: Oct–Dec
4. Inserted sample booking data across all quarters.
5. Ran `EXPLAIN ANALYZE` queries to compare performance before and after partitioning.

---

## ⚙️ Performance Analysis Using EXPLAIN ANALYZE

### Query 1: Before Partitioning (Simulated Full Table Scan)

```sql
EXPLAIN ANALYZE
SELECT * FROM Bookings WHERE check_in_date BETWEEN '2025-02-01' AND '2025-02-28';