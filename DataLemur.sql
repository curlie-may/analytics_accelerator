--LinkedIn SQL:  Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
--You want to find candidates who are proficient in Python, Tableau, and PostgreSQL. Write a query to list the candidates who possess 
--all of the required skills for the job. Sort the output by candidate ID in ascending order.
--Assumption: There are no duplicates in the candidates table.
--**********
/*
candidates Table:
Column Name	Type
candidate_id	integer
skill	varchar
candidates Example Input:
candidate_id	skill
123	Python
123	Tableau
123	PostgreSQL
234	R
234	PowerBI
234	SQL Server
345	Python
345	Tableau
*/
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL') 
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;


--Histogram of Tweets: Twitter SQL Interview Question
SELECT t1.tweet_bucket, count(t1.user_id) AS user_num
FROM (
SELECT COUNT(tweet_id) AS tweet_bucket, user_id
FROM tweets
WHERE DATE_TRUNC('year', tweet_date) = '2022-01-01'
GROUP BY user_id
) as t1
GROUP BY t1.tweet_bucket
