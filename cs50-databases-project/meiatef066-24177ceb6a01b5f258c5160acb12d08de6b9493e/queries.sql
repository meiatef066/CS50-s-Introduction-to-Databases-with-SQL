
-- Query 1: Retrieve Customer Account Details
-- This query will return the account information, including balance and personal details, for a specific customer identified by their national ID.


SELECT c.customer_id, c.account_type, c.balance, a.fname, a.sname, a.email, a.phone_number
FROM Customer c
JOIN Account a ON c.account_id = a.account_id
WHERE c.national_id = 'YOUR_NATIONAL_ID';  -- Replace with the specific national ID
Query 2: Transaction History of a Customer
This query retrieves the transaction history for a customer within a date range, including details like amount and transaction type.


SELECT t.transaction_id, t.from_account_id, t.to_account_id, t.amount, t.transaction_type, t.status, t.timestamp
FROM Transaction t
JOIN Account a ON t.from_account_id = a.account_id OR t.to_account_id = a.account_id
WHERE a.email = 'customer@example.com'  -- Replace with the customer's email
  AND t.timestamp BETWEEN '2025-01-01' AND '2025-01-31'
ORDER BY t.timestamp DESC;

-- Query 3: Loan Status for a Customer
-- This query retrieves the details of all loans for a specific customer, including the status and the loan amount.

SELECT l.loan_id, l.loan_type, l.amount, l.interest_rate, l.start_date, l.end_date, l.status
FROM Loan l
JOIN Customer c ON l.customer_id = c.customer_id
WHERE c.national_id = 'YOUR_NATIONAL_ID';  -- Replace with the specific national ID

--  Recent Transactions for All Customers
-- This query returns the most recent transaction for each customer.

WITH LatestTransaction AS (
    SELECT from_account_id AS account_id, MAX(timestamp) AS latest_timestamp
    FROM Transaction
    GROUP BY from_account_id
    UNION ALL
    SELECT to_account_id AS account_id, MAX(timestamp) AS latest_timestamp
    FROM Transaction
    GROUP BY to_account_id
)

SELECT t.transaction_id, t.from_account_id, t.to_account_id, t.amount, t.transaction_type, t.status, t.timestamp
FROM Transaction t
JOIN LatestTransaction lt ON t.from_account_id = lt.account_id OR t.to_account_id = lt.account_id
WHERE t.timestamp = lt.latest_timestamp
ORDER BY t.timestamp DESC;


--  create a view for the latest transactions for each customer:

CREATE VIEW LatestTransactions AS
WITH LatestTransaction AS (
    SELECT from_account_id AS account_id, MAX(timestamp) AS latest_timestamp
    FROM Transaction
    GROUP BY from_account_id
    UNION ALL
    SELECT to_account_id AS account_id, MAX(timestamp) AS latest_timestamp
    FROM Transaction
    GROUP BY to_account_id
)
SELECT t.transaction_id, t.from_account_id, t.to_account_id, t.amount, t.transaction_type, t.status, t.timestamp
FROM Transaction t
JOIN LatestTransaction lt ON t.from_account_id = lt.account_id OR t.to_account_id = lt.account_id
WHERE t.timestamp = lt.latest_timestamp;
