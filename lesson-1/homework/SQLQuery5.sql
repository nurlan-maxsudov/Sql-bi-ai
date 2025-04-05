DROP TABLE IF EXISTS account

CREATE TABLE account
(
	account_id INT primary key,
	balance NUMERIC check (balance >= 0),
	account_type VARCHAR(50) check (account_type = 'Saving' OR account_type = 'Checking')
);

INSERT INTO account
SELECT 1, 100, 'Saving';

ALTER TABLE account
DROP CONSTRAINT [CK__account__account__49C3F6B7];

ALTER TABLE account
DROP CONSTRAINT [CK__account__balance__48CFD27E];

ALTER TABLE account
ADD CONSTRAINT CK_account_balance CHECK (balance >= 0);

ALTER TABLE account
ADD CONSTRAINT CK_account_account_type CHECK (account_type = 'Saving' OR account_type = 'Checking');


