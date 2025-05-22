# CS50's Introduction to Databases with SQL – Project

This repository contains my project for **CS50's Introduction to Databases with SQL** course by Harvard University.

## About the Course

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

##  Project Files

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
### Key Entities

1. **Customer**
   - Stores customer details such as balance, address, and account information.

2. **Account**
   - Manages account details like names, phone numbers, and email.

3. **Admin**
   - Tracks admin roles and permissions.

4. **Employee**
   - Stores employee data, including job title and salary.

5. **Branch**
   - Contains information about different branches.

6. **Card**
   - Tracks customer cards and their statuses.

7. **Transaction**
   - Stores transaction history, including sender, receiver, and amount.

8. **Logs**
   - Keeps logs of account actions, IP addresses, and device information.

Refer to the [`schema.sql`](./cs50-databases-project/schema.sql) file for detailed SQL schema and queries.

---

##  Queries

The `queries.sql` file contains examples of SQL queries demonstrating the interaction with the database. These include:
- Data retrieval
- Updates
- Deletions
- Aggregations

---
