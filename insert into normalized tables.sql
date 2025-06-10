USE googleplaystore;

INSERT INTO application_name (app_name)
SELECT DISTINCT app_name
FROM application_data;

INSERT INTO user_engagement (app_id, reviews_number, review_average, installs)
SELECT application_name.app_id, application_data.reviews, application_data.rating,
CAST(REPLACE(REPLACE(application_data.installs, '+', ''), ',', '') AS DOUBLE)
FROM application_name
INNER JOIN application_data 
ON application_name.app_name = application_data.app_name;

INSERT INTO financial (app_id, type, price)
SELECT application_name.app_id, application_data.type, CAST(REPLACE(application_data.price, '$', '') AS DECIMAL(10,2))
FROM application_name
INNER JOIN application_data 
ON application_name.app_name = application_data.app_name;

INSERT INTO application_info (app_id, size, category, genres, content_rating)
SELECT application_name.app_id, application_data.size, application_data.category, application_data.genres, application_data.content_rating
FROM application_name
INNER JOIN application_data 
ON application_name.app_name = application_data.app_name;

INSERT INTO feedback (app_id, translated_review, sentiment, sentiment_polarity,  sentiment_subjectivity)
SELECT application_name.app_id, user_reviews.Translated_Review, user_reviews.Sentiment, user_reviews.Sentiment_Polarity, user_reviews. Sentiment_Subjectivity
FROM application_name
INNER JOIN user_reviews
ON application_name.app_name = user_reviews.app_name;


