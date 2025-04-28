# Design Document

By *Mai Atef Elkheshen*  
Video overview: [https://youtu.be/psaEPfQv0dY](https://youtu.be/psaEPfQv0dY)

---

## Scope

### Purpose of the Database
1. **Account Management**: Handling customer, admin, and employee accounts securely.
2. **Transaction Processing**: Recording internal and external money transfers.
3. **Loan & Card Management**: Tracking loans, credit/debit cards, and related statuses.
4. **Branch Operations**: Managing branch details and employee assignments.
5. **Audit & Security**: Logging activities for compliance and fraud detection.

### Included in Scope
#### People:
- Customers (account holders)
- Admins (system administrators)
- Employees (branch staff, including managers)

#### Things:
- Accounts (for customers, admins, and employees)
- Transactions (financial activities)
- Loans (issued to customers)
- Cards (credit/debit cards linked to customers)
- Audit Logs (for activity tracking)

#### Places:
- Branches (physical banking locations)

### Excluded from Scope
- Third-party payment systems
- External bank networks
- Marketing & CRM systems
- ATM machines

---

## Functional Requirements

### What Users Can Do
1. **Account Management**:
   - Create, update, or deactivate accounts.
   - Log in securely with hashed passwords.
   - Retrieve account details.

2. **Transaction Management**:
   - Record deposits, withdrawals, and transfers.
   - Track transaction statuses (pending, completed, failed).

3. **Branch & Employee Operations**:
   - Manage branch details and assign employees.
   - Track employees' job titles, salaries, and hire dates.

4. **Audit Logs**:
   - Log user actions (e.g., login, transfers).
   - Capture timestamps, IP addresses, and device details.

### Beyond the Scope
- Real-time fraud detection (e.g., suspicious activity alerts).
- External integration with payment gateways or third-party services.

---

## Representation

### Entities and Attributes
#### 🗂️ **Account**
- **account_id (PK)**: UUID
- **fname, sname**: VARCHAR(50)
- **hashed_password**: VARCHAR(255)
- **phone_number**: VARCHAR(20) (unique)
- **email**: VARCHAR(100) (unique)
- **created_at, updated_at**: DATETIME
- **is_active**: BOOLEAN

#### 👤 **Customer**
- **customer_id (PK)**: UUID
- **account_id (FK)**: UUID
- **date_of_birth**: DATE
- **address**: TEXT
- **national_id**: VARCHAR(20) (unique)
- **account_type**: ENUM (savings, current, business)
- **balance**: DECIMAL(15, 2)

#### 🔑 **Admin**
- **admin_id (PK)**: UUID
- **account_id (FK)**: UUID
- **role**: VARCHAR(50)
- **permissions**: TEXT

#### 🏦 **Branch**
- **branch_id (PK)**: UUID
- **branch_name**: VARCHAR(100)
- **branch_code**: VARCHAR(10)
- **address**: TEXT
- **phone_number**: VARCHAR(20)
- **manager_id (FK)**: UUID

#### 👔 **Employee**
- **employee_id (PK)**: UUID
- **account_id (FK)**: UUID
- **branch_id (FK)**: UUID
- **job_title**: VARCHAR(50)
- **salary**: DECIMAL(12, 2)
- **hire_date**: DATE

#### 💸 **Transaction**
- **transaction_id (PK)**: UUID
- **from_account_id, to_account_id (FK)**: UUID
- **amount**: DECIMAL(15, 2)
- **transaction_type**: ENUM (deposit, withdrawal, transfer)
- **status**: ENUM (pending, completed, failed)
- **timestamp**: DATETIME

#### 📄 **Loan**
- **loan_id (PK)**: UUID
- **customer_id (FK)**: UUID
- **loan_type**: ENUM (personal, auto, mortgage)
- **amount**: DECIMAL(15, 2)
- **interest_rate**: DECIMAL(5, 2)
- **start_date, end_date**: DATE
- **status**: ENUM (approved, pending, rejected, closed)

#### 💳 **Card**
- **card_id (PK)**: UUID
- **customer_id (FK)**: UUID
- **card_number**: VARCHAR(16) (unique)
- **card_type**: ENUM (debit, credit)
- **expiry_date**: DATE
- **cvv**: VARCHAR(4)
- **status**: ENUM (active, blocked, expired)

#### 🔍 **AuditLog**
- **audit_log_id (PK)**: UUID
- **account_id (FK)**: UUID
- **action**: VARCHAR(100)
- **timestamp**: DATETIME
- **ip_address**: VARCHAR(45)
- **device_info**: TEXT
- **status**: ENUM (success, failed)

### Design Rationale
- **UUIDs for Primary Keys**: Ensure global uniqueness.
- **VARCHAR for Strings**: Efficient for variable-length data.
- **DECIMAL for Financial Data**: Prevent rounding errors.
- **ENUMs for Fixed Categories**: Enforce consistency in predefined values.
- **BOOLEAN for Flags**: Simple true/false checks (e.g., `is_active`).
- **DATETIME/DATE**: Accurate timestamping of events.

### Constraints
- **Primary Keys (PK)**: Uniquely identify records.
- **Foreign Keys (FK)**: Maintain referential integrity between tables.
- **Unique Constraints**: Prevent duplicates (e.g., `email`, `card_number`).
- **NOT NULL**: Ensure essential data is always provided.
- **Default Values**: Improve data consistency (e.g., default `status`).

---

## Relationships

### Entity-Relationship Diagram (ERD)
![alt text](<erd bank.png>)

---

## Optimizations

### Indexes
- **CREATE INDEX idx_transaction_status ON Transaction(status);**
- **CREATE INDEX idx_transaction_from_account ON Transaction(from_account_id);**
- **CREATE INDEX idx_transaction_to_account ON Transaction(to_account_id);**

### Rationale
- **Transaction Status**: Speeds up queries for specific statuses (e.g., pending).
- **From/To Accounts**: Optimizes lookups for transactions involving specific accounts.

---

## Limitations

### Design Limitations
1. **External Systems**: No integration with third-party payment gateways or external bank networks.
2. **Real-Time Processing**: Not optimized for high-frequency, real-time transactions.

### Representation Challenges
1. **Data Integrity and Fraud Prevention**:
   - Limited to audit logs for activity tracking.
   - Additional measures like multi-factor authentication (MFA) or encryption for sensitive fields (e.g., `card_number`, `national_id`) are recommended.
2. **Scalability**:
   - May require partitioning or replication for large-scale operations.

---