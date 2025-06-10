#What are the top three applications for most review average of each category?
SELECT *
FROM (
SELECT u.review_average, a.app_name, i.category,
	ROW_NUMBER() OVER(PARTITION BY category ORDER BY u.review_average DESC ) AS row_num
FROM user_engagement AS u
INNER JOIN application_name AS a ON u.app_id = a.app_id
INNER JOIN application_info AS i ON u.app_id = i.app_id ) AS ranked_apps WHERE row_num <= 3;

#What are the top three applications for the most amount of review number of each category?
SELECT * FROM (
SELECT distinct(app_name), max_reviews, category,
ROW_NUMBER() OVER(PARTITION BY category, app_name ORDER BY max_reviews DESC) AS name_rank,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY max_reviews DESC ) AS row_num
FROM (
SELECT a.app_name, a.app_id, MAX(u.reviews_number) AS max_reviews
FROM user_engagement AS u
INNER JOIN application_name AS a ON u.app_id = a.app_id
GROUP BY a.app_id, a.app_name) AS ranked_apps
INNER JOIN application_info AS i ON ranked_apps.app_id = i.app_id ) AS ranked_apps2 WHERE name_rank = 1 AND row_num <= 3;

# What are the top installs for each category?
SELECT * FROM(
SELECT a.app_name, i.category, u.installs,
DENSE_RANK() OVER(PARTITION BY i.category ORDER BY u.installs DESC)  AS installs_rank
FROM user_engagement AS u
INNER JOIN application_name AS a ON u.app_id = a.app_id
INNER JOIN application_info AS i ON u.app_id = i.app_id) AS rank_install WHERE installs_rank = 1;

#How many of the applications are paid versus free
SELECT COUNT(app_id), type FROM financial GROUP BY type;

#What is the installed number of the application with the highest price of the category?
SELECT * FROM(
SELECT a.app_name, i.category, f.price, u.installs,
	ROW_NUMBER() OVER(PARTITION BY i.category ORDER BY f.price DESC ) AS max_price
FROM financial AS f
INNER JOIN application_name AS a ON f.app_id = a.app_id
INNER JOIN application_info AS i ON f.app_id = i.app_id
INNER JOIN user_engagement AS u ON f.app_id = u.app_id
) AS high_price WHERE max_price = 1;

#Which top ten applications have the best sentiment polarity from the users?
SELECT a.app_name, max(fb.sentiment_polarity) AS max_sentiment
FROM feedback AS fb
INNER JOIN application_name AS a ON fb.app_id = a.app_id
GROUP BY a.app_name
ORDER BY max_sentiment DESC LIMIT 10;

#How much sentiment is positive vs negative from the users for each application?
SELECT a.app_name, 
SUM(CASE WHEN fb.sentiment = 'Positive' THEN 1 ELSE 0 END) AS Positive,
SUM(CASE WHEN fb.sentiment = 'Negative' THEN 1 ELSE 0 END) AS Negative
FROM feedback AS fb
INNER JOIN application_name AS a ON fb.app_id = a.app_id
GROUP BY a.app_name;