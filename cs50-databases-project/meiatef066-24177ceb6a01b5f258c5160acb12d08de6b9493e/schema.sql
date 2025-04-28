CREATE TABLE Account (
    account_id UUID PRIMARY KEY,
    fname VARCHAR(50) NOT NULL,
    sname VARCHAR(50) NOT NULL,
    hashed_password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE Customer (
    customer_id UUID PRIMARY KEY,
    account_id UUID NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    national_id VARCHAR(20) UNIQUE NOT NULL,
    account_type ENUM('savings', 'checking') NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);

CREATE TABLE Admin (
    admin_id UUID PRIMARY KEY,
    account_id UUID NOT NULL,
    role ENUM('superadmin', 'support') NOT NULL,
    permissions JSON,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);

CREATE TABLE Branch (
    branch_id UUID PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    branch_code VARCHAR(10) UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    manager_id UUID,
    FOREIGN KEY (manager_id) REFERENCES Admin(admin_id) ON DELETE SET NULL
);

CREATE TABLE Employee (
    employee_id UUID PRIMARY KEY,
    account_id UUID NOT NULL,
    branch_id UUID NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    salary DECIMAL(15, 2) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id) ON DELETE CASCADE
);

CREATE TABLE Transaction (
    transaction_id UUID PRIMARY KEY,
    from_account_id UUID NOT NULL,
    to_account_id UUID NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_type ENUM('deposit', 'withdrawal', 'transfer') NOT NULL,
    status ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (from_account_id) REFERENCES Account(account_id) ON DELETE CASCADE,
    FOREIGN KEY (to_account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);

CREATE TABLE Loan (
    loan_id UUID PRIMARY KEY,
    customer_id UUID NOT NULL,
    loan_type ENUM('personal', 'mortgage', 'auto') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('active', 'paid', 'default') DEFAULT 'active',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    loan_id UUID NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('cash', 'credit_card', 'bank_transfer') NOT NULL,
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id) ON DELETE CASCADE
);

CREATE TABLE Card (
    card_id UUID PRIMARY KEY,
    customer_id UUID NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    card_type ENUM('debit', 'credit') NOT NULL,
    expiry_date DATE NOT NULL,
    status ENUM('active', 'blocked', 'expired') DEFAULT 'active',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);


CREATE TABLE AuditLog (
    audit_log_id UUID PRIMARY KEY,
    account_id UUID NOT NULL,
    action VARCHAR(100) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45) NOT NULL,
    device_info TEXT,
    status ENUM('success', 'failure') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id) ON DELETE CASCADE
);


CREATE INDEX idx_transaction_status ON Transaction(status);
CREATE INDEX idx_transaction_from_account ON Transaction(from_account_id);
CREATE INDEX idx_transaction_to_account ON Transaction(to_account_id);

