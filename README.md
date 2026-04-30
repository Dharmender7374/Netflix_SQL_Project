# Netflix Movies and TV Shows Data Analysis Using SQL

![Netflix Logo](netflix_logo_main.png)

## Overview
This project involves a comprehensive analysis of Netflix's movies and TV shows data using SQL. The goal is to extract valuable insights and answer various business questions based on the dataset. The following README provides a detailed account of the project's objectives, business problems, solutions, findings, and conclusions.

## Objectives
* Analyze the distribution of content types (movies vs TV shows).
* Identify the most common ratings for movies and TV shows.
* List and analyze content based on release years, countries, and durations.
* Explore and categorize content based on specific criteria and keywords.

## 📊 Content Analysis & Insights

- **Distribution of Content Types**
  - The dataset consists of two primary categories: Movies and TV Shows.
  - Movies dominate the platform, contributing a significantly higher percentage compared to TV Shows.
  - TV Shows form a smaller but steadily growing portion of the content library.

- **Ratings Analysis**
  - **Movies:**
    - The most common ratings are TV-MA and TV-14, indicating a strong presence of mature and teen-oriented content.
  - **TV Shows:**
    - Similarly, TV-MA and TV-14 are the most frequent ratings.
    - A smaller portion includes family-friendly ratings like TV-PG and TV-Y.

- **Release Year Trends**
  - A noticeable increase in content production is observed after 2010.
  - Peak content additions occur in recent years, showing platform expansion.
  - Older content (pre-2000) exists but represents a smaller fraction of the dataset.

- **Country-wise Distribution**
  - The majority of content originates from:
    - United States (largest contributor)
    - India (significant and growing share)
    - United Kingdom and Canada
  - Multi-country collaborations are also present, indicating global production trends.

- **Duration Analysis**
  - **Movies:**
    - Typically range between 80–120 minutes, with most clustering around the 90-minute mark.
  - **TV Shows:**
    - Measured in seasons rather than minutes.
    - Most shows have 1–3 seasons, indicating limited-series popularity.

- **Content Categorization (Keywords & Genres)**
  - Content is categorized based on keywords such as:
    - Drama
    - Comedy
    - Action
    - Thriller
    - Documentary
  - **Popular Trends:**
    - Dramas and Comedies dominate across both Movies and TV Shows.
    - Documentaries and international content have seen recent growth.
    - Action and Thriller genres maintain consistent popularity.

## Dataset
The data for this project is sourced from the Kaggle dataset:

Dataset Link: [Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

## Netflix Database Schema
```sql 

DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix (
      show_id VARCHAR(5),
      type VARCHAR(10),
      title VARCHAR(250),
      director VARCHAR(550),
      casts VARCHAR(1050),
      country VARCHAR(550),
      date_added VARCHAR(55),
      release_year INT,
      rating VARCHAR(15),
      duration VARCHAR(15),
      listed_in VARCHAR(250),
      description VARCHAR(550)
);

SELECT * FROM netflix;
 ```

## Findings and Conclusion
   * Content Distribution: The dataset contains a diverse range of movies and TV shows with varying ratings and genres.
   * Common Ratings: Insights into the most common ratings provide an understanding of the content's target audience.
   * Geographical Insights: The top countries and the average content releases by India highlight regional content distribution.
   * Content Categorization: Categorizing content based on specific keywords helps in understanding the nature of content available on Netflix.
-This analysis provides a comprehensive view of Netflix's content and can help inform content strategy and decision-making.

