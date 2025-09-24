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
SELECT t1.tweet_bucket, COUNT(t1.user_id) AS user_num
FROM (
SELECT COUNT(tweet_id) AS tweet_bucket, user_id
FROM tweets
WHERE DATE_TRUNC('year', tweet_date) = '2022-01-01'
GROUP BY user_id
) AS t1
GROUP BY t1.tweet_bucket

--Unfinished Parts: Tesla SQL Interview Question
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS Null AND assembly_step != 1

--Teams Power Users Microsoft SQL Interview Question
select  sender_id, count(content) as number_of_messages
from messages
where extract (year from sent_date) = '2022' and extract (month from sent_date) = '08' 
group by sender_id
order by number_of_messages DESC
limit 2;

--Cities With Completed Trades
select users.city as users_city, count(trades.status) as trade_count   
from trades
join users
on trades.user_id = users.user_id
where status = 'Completed'
group by users_city
order by trade_count desc 
limit 3;

--Laptop vs. Mobile Viewership
select 
  count(case when device_type = 'laptop' then 1 end) as laptop_views,  --Note: do NOT put else 0 because ELSE 0 is counted as a NULL.   
  count(case when device_type in ('tablet', 'phone') then 1 end) as mobile_views --if use ELSE 0 then use SUM as in next example
from viewership
--or another version 
select 
  SUM(case when device_type = 'laptop' then 1 else 0 end) as laptop_views,  
  SUM(case when device_type in ('tablet', 'phone') then 1 else 0 end) as mobile_views
from viewership;

