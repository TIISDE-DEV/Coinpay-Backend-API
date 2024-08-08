-- Tabela Users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    phone VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    full_name VARCHAR(255),
    username VARCHAR(50),
    date_of_birth DATE,
    country_residence VARCHAR(100),
    address_line VARCHAR(255),
    city VARCHAR(100),
    post_code VARCHAR(20),
    photo BYTEA,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Credit Cards
CREATE TABLE credit_cards (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    account_holder_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    card_number VARCHAR(255) NOT NULL, -- Armazenado de forma criptografada
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Transactions
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(10) NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('spending', 'income', 'bills', 'savings')) NOT NULL,
    purpose VARCHAR(20) CHECK (purpose IN ('personal', 'business', 'payment')),
    contact_id INT,
    card_id INT REFERENCES credit_cards(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Contacts
CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    contact_name VARCHAR(255) NOT NULL,
    contact_phone VARCHAR(20) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS credit_cards;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS users;

