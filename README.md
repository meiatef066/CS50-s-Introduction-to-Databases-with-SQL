# CS50's Introduction to Databases with SQL – Project

This repository contains my project for **CS50's Introduction to Databases with SQL** course by Harvard University.

## 📚 About the Course

[CS50's Introduction to Databases with SQL](https://cs50.harvard.edu/sql/) is a free course that teaches database fundamentals, SQL programming, and web development with Python and Flask.

Key topics covered include:
- Relational Databases
- SQL Queries (SELECT, INSERT, UPDATE, DELETE)
- Data Modeling and Normalization
- Indexing and Optimization
- Scalability and Security Concepts

---

## Project Description

In this project, I built a database-driven application demonstrating the skills learned in the course.

It includes:
- Designing a normalized database schema
- Writing advanced SQL queries
- Ensuring security (e.g., preventing SQL Injection)
---
## 🛠 Technologies Used

- **SQLite** (Relational Database)
- **SQL** (Structured Query Language)

---

## 📂 Project Files

| File | Description |
|------|-------------|
| [`DESIGN.md`](./cs50-databases-project/DESIGN.md) | Database design document |
| [`ERD Diagram`](./cs50-databases-project/erd%20bank.png) | Entity-Relationship Diagram (ERD) |
| [`queries.sql`](./cs50-databases-project/queries.sql) | SQL queries for the project |
| [`schema.sql`](./cs50-databases-project/schema.sql) | SQL schema for database setup |

---

## 🗂 Database Design

The database schema for this project is designed with the following considerations:
- **Normalization**: Tables are structured to reduce redundancy and improve data integrity.
- **Relationships**: Key relationships between tables are established to ensure accuracy and consistency.

### Schema Overview

![ERD](./cs50-databases-project/erd%20bank.png)

The schema includes tables such as:
- **Users**: Stores user credentials and profiles.
- **Transactions**: Tracks user transactions.
- **Accounts**: Manages account details.

Refer to the [`schema.sql`](./cs50-databases-project/schema.sql) file for detailed SQL schema and queries.

---

##  Queries

The `queries.sql` file contains examples of SQL queries demonstrating the interaction with the database. These include:
- Data retrieval
- Updates
- Deletions
- Aggregations

---
