# E-Commerce Sales Analytics

A MySQL-based SQL project that analyzes e-commerce sales data to generate useful business insights about customers, orders, products, revenue, and sales performance.

## 📌 Project Overview

This project uses a relational MySQL database to store and analyze e-commerce data.

The database contains information about:

- Customers
- Products
- Orders
- Order Items
- Payments

SQL queries are used to analyze sales performance and answer common business questions.

## 🗄️ Database Schema

The project contains 5 tables:

1. **customers** – Customer details and registration information
2. **products** – Product details, categories, prices, and stock
3. **orders** – Customer orders and order status
4. **order_items** – Products purchased in each order
5. **payments** – Payment details for orders

## 🔍 Business Analysis

The project answers questions such as:

- How many customers are in the database?
- How many orders have been placed?
- How many orders are Delivered, Shipped, or Cancelled?
- What is the total revenue?
- Which products have the highest sales?
- Which product categories generate the most revenue?
- Which customers spend the most?
- Which cities generate the most revenue?

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench

## 📊 SQL Concepts Used

- SELECT
- COUNT()
- SUM()
- JOIN
- WHERE
- GROUP BY
- ORDER BY
- LIMIT
- Aggregate Functions

## 📁 Project Files

```text
ecommerce-sales-analytics/
│
├── README.md
├── ecommerce_analytics.sql
└── queries.sql
```

### `ecommerce_analytics.sql`

Contains the database creation, table structures, and sample e-commerce data.

### `queries.sql`

Contains the SQL queries used for business analysis.

## 🚀 How to Run

1. Install MySQL and MySQL Workbench.
2. Open `ecommerce_analytics.sql`.
3. Execute the script to create the database, tables, and data.
4. Open `queries.sql`.
5. Execute the queries to generate sales insights.

## 🎯 Project Objective

The objective of this project is to demonstrate practical SQL skills by designing a relational database and using SQL queries to extract meaningful business insights from e-commerce data.

## 👩‍💻 Author

**Ramya Satya Sree Devi Dwarampudi**

B.Tech – Computer Science & Engineering (Data Science)
