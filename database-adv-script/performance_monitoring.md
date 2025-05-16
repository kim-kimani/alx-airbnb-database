# 📊 Performance Monitoring and Schema Refinement – Airbnb Clone Database Project

This document outlines how we monitored and improved the performance of frequently used queries using tools like `EXPLAIN ANALYZE`. Based on the findings, we identified bottlenecks and implemented schema and index changes that significantly improved execution time.

---

## 🎯 Objective

To:
- Monitor query performance using `EXPLAIN ANALYZE`
- Identify performance bottlenecks
- Propose and implement schema or index changes
- Measure and report performance improvements

---

## 🧾 Step 1: Select Queries for Monitoring

We selected three commonly used queries for performance analysis:

1. **Query A**: Get all bookings for a specific user
2. **Query B**: Get all properties with average rating > 4.0
3. **Query C**: Find payments made within a date range

---

