USE googleplaystore;
CREATE TABLE application_data (
    app_name VARCHAR(100),
    category VARCHAR(50),
    rating FLOAT,
    reviews INT,
    size VARCHAR(50),
    installs VARCHAR(50),
    type ENUM('Free','Paid'),
    price VARCHAR(50),
    content_rating VARCHAR(50),
    genres VARCHAR(100),
    last_updated DATE,
    current_version VARCHAR(50),
    android_version VARCHAR(50)
);
CREATE TABLE user_reviews (
    app_name VARCHAR(100),
    Translated_Review VARCHAR(50),
    Sentiment ENUM('Positive','Negative','Neutral'),
    Sentiment_Polarity FLOAT,
    Sentiment_Subjectivity FLOAT
);