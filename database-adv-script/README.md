# 🔗 SQL Joins – Airbnb Clone Database Project

This directory contains a single SQL script demonstrating the use of three major join types:
- `INNER JOIN`
- `LEFT JOIN`
- `FULL OUTER JOIN`

These queries help retrieve meaningful data across multiple tables in the Airbnb Clone schema.

---

## 🎯 Objective

To master SQL joins by writing complex queries using different types of joins:
- Understand how each join behaves
- Practice retrieving related data from multiple tables
- Apply joins to real-world scenarios like bookings and property reviews

---

## 🧾 Queries Overview

| Query | Description |
|-------|-------------|
| `INNER JOIN` | Retrieves bookings and the corresponding guest who made the booking |
| `LEFT JOIN` | Retrieves all properties and their reviews, including those without any reviews |
| `FULL OUTER JOIN` | Retrieves all users and all bookings, showing unmatched records |

---

## 🛠️ Requirements

To run these queries:
- A PostgreSQL or MySQL database instance
- The Airbnb Clone schema must be set up with the following tables:
  - `Users`
  - `Bookings`
  - `Properties`
  - `Reviews`

Import the schema and sample data before running the queries.

---

# 🔍 Subqueries – Airbnb Clone Database Project

This directory contains SQL scripts demonstrating the use of **subqueries**, both **non-correlated** and **correlated**, in the Airbnb Clone database.

These queries help analyze data relationships across multiple tables and are essential for advanced reporting and filtering.

---

## 🎯 Objective

To write and understand:
- **Non-correlated subqueries**: Independent of the outer query
- **Correlated subqueries**: Dependent on the outer query, executed row-by-row

---

## 🧾 Queries Overview

| Query Type | Description |
|------------|-------------|
| Non-Correlated Subquery | Find properties with an average rating > 4.0 |
| Correlated Subquery | Find users who have made more than 3 bookings |

---

## 🛠️ Requirements

To run these queries:
- A PostgreSQL or MySQL database instance
- The Airbnb Clone schema must be set up with the following tables:
  - `Users`
  - `Bookings`
  - `Properties`
  - `Reviews`

Import the schema and sample data before running the queries.

---

# 📊 SQL Aggregations and Window Functions – Airbnb Clone Database Project

This directory contains SQL scripts demonstrating the use of **aggregation functions** and **window functions** to analyze Airbnb Clone data.

These queries help extract insights like:
- How many bookings each user has made
- Which properties are most booked
- Ranking properties using `ROW_NUMBER()` and `RANK()`

---

## 🎯 Objective

To use:
- **SQL Aggregation** (`COUNT`, `GROUP BY`) to summarize data
- **Window Functions** (`ROW_NUMBER`, `RANK`) to rank records within datasets

---

## 🧾 Queries Overview

| Query | Description |
|-------|-------------|
| Aggregation | Count total bookings per user |
| Window Function | Rank properties by total number of bookings |

---

## 🛠️ Requirements

To run these queries:
- A PostgreSQL or MySQL database instance
- The Airbnb Clone schema must be set up with the following tables:
  - `Users`
  - `Bookings`
  - `Properties`

Import the schema and sample data before running the queries.

---

