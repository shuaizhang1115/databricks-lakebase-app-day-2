-- Create watchlist table for tracking ticker symbols
-- This table stores which tickers each user wants to monitor

CREATE TABLE IF NOT EXISTS watchlist (
    symbol TEXT NOT NULL,
    email TEXT NOT NULL,
    latest_price NUMERIC,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (symbol, email)
);

-- Insert sample watchlist entries for testing
-- Replace 'your-email@example.com' with your actual email
INSERT INTO watchlist (symbol, email, latest_price) VALUES
    ('AAPL', 'your-email@example.com', 150.00),
    ('MSFT', 'your-email@example.com', 350.00),
    ('GOOGL', 'your-email@example.com', 140.00),
    ('AMZN', 'your-email@example.com', 180.00),
    ('TSLA', 'your-email@example.com', 250.00)
ON CONFLICT (symbol, email) DO NOTHING;

-- Verify the table was created
SELECT * FROM watchlist;