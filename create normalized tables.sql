USE googleplaystore;
CREATE TABLE application_name (
    app_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    app_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (app_id),
    CONSTRAINT UNIQUE (app_name)
);

CREATE TABLE user_engagement (
    engage_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    app_id INT UNSIGNED NOT NULL,
    installs DOUBLE,
    reviews_number INT,
    review_average DECIMAL(2,1),
    PRIMARY KEY (engage_id),
    FOREIGN KEY (app_id) REFERENCES application_name(app_id) ON DELETE CASCADE
);

CREATE TABLE financial (
    finance_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    app_id INT UNSIGNED NOT NULL,
    type ENUM('Free','Paid'),
    price DECIMAL(10,2),
    PRIMARY KEY (finance_id),
    FOREIGN KEY (app_id) REFERENCES application_name(app_id) ON DELETE CASCADE
);

CREATE TABLE application_info (
    info_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    app_id INT UNSIGNED NOT NULL,
    size VARCHAR(50),
    category VARCHAR(50),
    genres VARCHAR(100),
    content_rating VARCHAR(50),
    PRIMARY KEY (info_id),
    FOREIGN KEY (app_id) REFERENCES application_name(app_id) ON DELETE CASCADE
);

CREATE TABLE feedback (
    feedback_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    app_id INT UNSIGNED NOT NULL,
    translated_review VARCHAR(200),
    sentiment ENUM('Positive','Negative','Neutral'),
    sentiment_polarity FLOAT,
    sentiment_subjectivity FLOAT,
    PRIMARY KEY (feedback_id),
    FOREIGN KEY (app_id) REFERENCES application_name(app_id) ON DELETE CASCADE
);










