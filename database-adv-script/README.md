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

## 📁 Directory Structure

Ensure your files are placed correctly:
