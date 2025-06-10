# Google Play Store Database For Dashboard
## Link to short-form video: 
https://youtu.be/5fRO668DAEM
## Link to long-form video: 
https://youtu.be/uI2x8uRGWg0

## Overview
### Objective
Google Play Store or Play Store offers the service as a platform to digitally distribute applications, books, movies, musical singles, television programs, and video games for Android and ChromeOS operating systems (“How Google Play Works”, 2025). 
Android is an operating system that is being used worldwide and has a 71.42% market share worldwide (“IPhone vs. Android User & Revenue Statistics”, 2025). Thus, the Google Play Store is an influential and essential platform to many people who are using Android and ChromeOS. 
In this project, we will use the database that is responsible for storing information related to the applications on the Google Play store, along with the application’s user reviews, to reconstruct into the tables where the data analyst can use to construct a report about the performance of the application to the stakeholders of Google. 
The main things that stakeholders want to know from the Play Store platform are financial metrics such as total revenue of the application, User engagement such as download trends, total downloads, top-performing applications in each category, and customer feedback.

### Description of Data
The database stores information related to the applications on the Google Play Store along with the application’s user reviews. 
There are 2 CSV files, including googleplaystore.csv and googleplaystore_user_reviews.csv. Googleplaystore.csv stores information about applications on Google Play (entity) and their attributes including app, category, number of rating, number of reviews, size of the app, number of installs, Paid or Free, Price of app, Age group of user, Genres, last updated date, current version, and android version. 
Googleplaystore_user_reviews.csv stores the first 100 most relevant reviews for each application (entity) and five other attributes, including app, user review, sentiment, sentiment polarity score, and sentiment subjectivity score. The relationship between these 2 files is a many-to-many relationship between one app's information with many updated dates and many reviews.
The suitable database for this case would be a relational database. Relational database is the right choice because it is a highly structured format with clear entities and attributes, a clear relationship, and SQL queries can support the analysis. The Data for this is from Kaggle: https://www.kaggle.com/datasets/lava18/google-play-store-apps?select=googleplaystore_user_reviews.csv

### Discussion
In this project, I have successfully created the normalised data based on the two-table dataset that contained the information of the applications on the Google Play Store platform. 
The purpose is to create a database that a data analyst can work with to create a dashboard that includes financial, user-engagement, and feedback aspects. 
What I wish I could further improve on this project is I wish to find the column that includes the date for when data is inserted and the versions of the applications. 
By including a date column, we can investigate more into trends of finance, user engagement, and feedback over time. What prevents me from including the date is that the last updated column of the raw dataset contains all the same date, even though the review numbers increase. 
In the future, I would like to improve by spending more time on initial data exploration and data selection before beginning the project. I was also attempting to import a MySQL database into the Power BI desktop, but there were too many complications and not enough time to create a sample dashboard for me. 
Overall, I created the normalised database as I intended to design in the ERD, and it is usable in the real world for querying for data analysis.
