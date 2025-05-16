# 🔍 Indexing for Performance – Airbnb Clone Database Project

This document outlines the process of identifying high-usage columns in the **User**, **Booking**, and **Property** tables, creating appropriate **SQL indexes**, and measuring query performance **before and after** index creation using `EXPLAIN ANALYZE`.

The goal is to improve query response time and optimize database performance for frequently accessed data.

---

## 🎯 Objective

To:

* Identify frequently used columns in queries (used in `WHERE`, `JOIN`, `ORDER BY`)
* Create appropriate **indexes** to speed up query execution
* Measure performance improvements using `EXPLAIN ANALYZE`

---

## 📊 Step 1: Identify High-Usage Columns

### Table: `Users`

| Column  | Usage Reason                    |
| ------- | ------------------------------- |
| `id`    | Primary key, used in JOINs      |
| `email` | Used in WHERE clauses for login |

### Table: `Bookings`

| Column          | Usage Reason                                |
| --------------- | ------------------------------------------- |
| `guest_id`      | Used in JOIN with Users                     |
| `property_id`   | Used in JOIN with Properties                |
| `check_in_date` | Filtered in reports and availability checks |

### Table: `Properties`

| Column    | Usage Reason                         |
| --------- | ------------------------------------ |
| `id`      | Primary key, used in JOINs           |
| `host_id` | Used in filtering properties by host |

---

## 🛠️ Step 2: Write CREATE INDEX Commands

Below are the SQL commands used to create indexes on these columns. These should be saved in a file named `database_index.sql`.

```sql
-- Index for guest_id in Bookings
CREATE INDEX idx_bookings_guest_id ON Bookings(guest_id);

-- Index for property_id in Bookings
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index for email in Users
CREATE INDEX idx_users_email ON Users(email);

-- Index for host_id in Properties
CREATE INDEX idx_properties_host_id ON Properties(host_id);

-- Index for check_in_date in Bookings
CREATE INDEX idx_bookings_check_in_date ON Bookings(check_in_date);
