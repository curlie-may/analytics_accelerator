--Data Science Skills
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


--Average Post Hiatus (Part 1)
select user_id, 
       date(max(post_date)) - date(min(post_date)) as number_of_days  --date () removes the time-stamp from the 'post_id' 
from posts
where extract (year from post_date) = 2021 
group by user_id
having count(user_id) >= 2;

--Average Review Ratings
select extract(month from submit_date) as mth, product_id as product, round(avg(stars), 2) as avg_stars
from reviews
group by product_id, mth
order by mth
