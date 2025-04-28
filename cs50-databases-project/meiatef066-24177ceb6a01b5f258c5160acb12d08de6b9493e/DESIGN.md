# Design Document

By *Mai atef elkheshen*

Video overview https://youtu.be/psaEPfQv0dY

## Scope

In this section you should answer the following questions:

* What is the purpose of your database?

Account Management: Handling customer, admin, and employee accounts securely.
Transaction Processing: Recording internal and external money transfers.
Loan & Card Management: Tracking loans, credit/debit cards, and related statuses.
Branch Operations: Managing branch details and employee assignments.
Audit & Security: Logging activities for compliance and fraud detection.

* Which people, places, things, etc. are you including in the scope of your database?

People:

Customers (account holders)
Admins (system administrators)
Employees (working at branches, including managers)
Things:

Accounts (linked to customers, admins, and employees)
Transactions (financial activities between accounts)
Loans (issued to customers)
Cards (credit/debit cards linked to customers)
Audit Logs (for tracking activities)
Places:

Branches (physical banking locations)

* Which people, places, things, etc. are *outside* the scope of your database?

Third-Party Payment Systems
External Bank Networks
Marketing & CRM Systems
ATM Machines

## Functional Requirements

In this section you should answer the following questions:

* What should a user be able to do with your database?

1. Account Management:

2. Transaction Management

3. Branch & Employee Operations

4. Auditlogs

* What's beyond the scope of what a user should be able to do with your database?

## Representation

### Entities

In this section you should answer the following questions:

* Which entities will you choose to represent in your database?

    1. account
    2. customer
    3. employee
    4. transaction
    5. card
    6. loan
    7. branch

* What attributes will those entities have?
 🗂️ Account
account_id (PK) - UUID: Unique identifier for each account.
fname, sname - VARCHAR(50): Stores first and last names.
hashed_password - VARCHAR(255): For secure password storage.
phone_number - VARCHAR(20): Contact number, must be unique.
email - VARCHAR(100): User’s email, unique for login.
created_at, updated_at - DATETIME: Track account creation and modifications.
is_active - BOOLEAN: Indicates if the account is active.
👤 Customer
customer_id (PK) - UUID: Unique customer identifier.
account_id (FK) - UUID: Links to the Account table.
date_of_birth - DATE: For age verification and compliance.
address - TEXT: Customer’s residential address.
national_id - VARCHAR(20): Government-issued ID, must be unique.
account_type - ENUM: Defines type (savings, current, business).
balance - DECIMAL(15, 2): Tracks the current balance with precision.
🔑 Admin
admin_id (PK) - UUID: Unique admin identifier.
account_id (FK) - UUID: Linked to the Account table.
role - VARCHAR(50): Defines administrative roles.
permissions - TEXT: Lists specific access rights.
🏦 Branch
branch_id (PK) - UUID: Unique identifier for each branch.
branch_name - VARCHAR(100): Branch’s official name.
branch_code - VARCHAR(10): Unique code for internal reference.
address - TEXT: Physical location.
phone_number - VARCHAR(20): Contact number.
manager_id (FK) - UUID: References the employee managing the branch.
👔 Employee
employee_id (PK) - UUID: Unique identifier.
account_id (FK) - UUID: Links to the Account table.
branch_id (FK) - UUID: Associates employee with a branch.
job_title - VARCHAR(50): Position title.
salary - DECIMAL(12, 2): Salary details.
hire_date - DATE: Employment start date.
💸 Transaction
transaction_id (PK) - UUID: Unique transaction reference.
from_account_id, to_account_id (FK) - UUID: Involved accounts.
amount - DECIMAL(15, 2): Transferred amount.
transaction_type - ENUM: (deposit, withdrawal, transfer).
status - ENUM: (pending, completed, failed).
timestamp - DATETIME: Date and time of the transaction.
📄 Loan
loan_id (PK) - UUID: Unique loan identifier.
customer_id (FK) - UUID: Linked to the customer.
loan_type - ENUM: (personal, auto, mortgage, etc.).
amount - DECIMAL(15, 2): Loan amount.
interest_rate - DECIMAL(5, 2): Interest percentage.
start_date, end_date - DATE: Loan period.
status - ENUM: (approved, pending, rejected, closed).
💳 Card
card_id (PK) - UUID: Unique identifier.
customer_id (FK) - UUID: Cardholder link.
card_number - VARCHAR(16): Unique card number.
card_type - ENUM: (debit, credit).
expiry_date - DATE: Card validity.
cvv - VARCHAR(4): Security code.
status - ENUM: (active, blocked, expired).
🔍 AuditLog
audit_log_id (PK) - UUID: Unique log identifier.
account_id (FK) - UUID: Tracks user actions.
action - VARCHAR(100): Describes activity (login, transfer, etc.).
timestamp - DATETIME: When the action occurred.
ip_address - VARCHAR(45): Logs IP for security.
device_info - TEXT: Device details.
status - ENUM: (success, failed).

* Why did you choose the types you did?

UUIDs for primary keys: Universally unique, ensuring no collisions even across distributed systems.
VARCHAR for names, emails, and IDs: Flexible, efficient for varying string lengths.
DECIMAL for financial data: High precision, prevents rounding errors common with floating-point types.
ENUMs for fixed categories: Enforces data consistency (e.g., transaction types, statuses).
DATETIME/DATE: Accurate timestamping for tracking changes and events.
BOOLEAN for flags like is_active: Simple true/false checks

* Why did you choose the constraints you did?

Primary Keys (PK): Ensure each record is uniquely identifiable.
Foreign Keys (FK): Maintain referential integrity between related tables.
Unique Constraints: Prevent duplication for critical fields (e.g., email, national_id, card_number).
NOT NULL Constraints: Ensure mandatory data is always provided.
Default Values: For fields like status, improving data consistency without manual input.
Check Constraints (optional for ENUMs): Enforce valid data entry based on predefined values.

### Relationships

ERD :

![alt text](<erd bank.png>)

## Optimizations

In this section you should answer the following questions:

* Which optimizations (e.g., indexes, views) did you create? Why?

CREATE INDEX idx_transaction_status ON Transaction(status);
CREATE INDEX idx_transaction_from_account ON Transaction(from_account_id);
CREATE INDEX idx_transaction_to_account ON Transaction(to_account_id);




## Limitations

In this section you should answer the following questions:

* What are the limitations of your design?

External Systems: The database doesn't handle integration with third-party payment

Real-time Processing: The database may not be optimized for real-time transaction

* What might your database not be able to represent very well?

Data Integrity and Fraud Prevention: While the audit log captures actions, further measures like multi-factor authentication (MFA) or encryption for sensitive data like card_number and national_id may be necessary for security.
