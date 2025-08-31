--IN checks if values are within a list.

--SELECT all columns FROM accounts tables, limit 10 rows
SELECT *
FROM accounts
LIMIT 10;

--SELECT 3 columns FROM orders table, all rows
SELECT 
     id, 
     account_id, 
     occurred_at 
FROM orders;

--SELECT 3 columns FROM web_events table, limit 15 rows 
SELECT 
     occurred_at, 
     account_id, 
     channel
FROM web_events
LIMIT 15;

--SELECT 3 columns FROM orders table, ORDER BY earliest purchases to latest for first 10 rows 
SELECT 
     id, 
     occurred_at, 
     total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

--SELECT 3 columns FROM orders table, ORDER BY latest to earliest total_amt_used for first 10 rows   
SELECT 
     id, 
     account_id, 
     total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC 
LIMIT 5;

--SELECT 3 columns FROM orders table, ORDER BY earliest to latest total_amt_used for first 20 rows     
SELECT 
     id, 
     account_id, 
     total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

--Display the order ID, account ID, and total dollar amount for all the orders, 
  --sorted first by the account ID (in ascending order), and then by 
  --the total dollar amount (in descending order)  
SELECT 
     id, 
     account_ID, 
     total_amt_usd
FROM orders
ORDER BY account_ID, total_amt_usd DESC; 

--Write a query that again displays order ID, account ID, and total dollar amount for each order, 
--but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order)    
SELECT 
     id, 
     account_ID, 
     total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_ID; 

/*Compare the results of these two queries above. How are the results different when you switch the column you sort on first?
--Answer:  In query #1, all of the orders for each account ID are grouped together, and then within each of those groupings, 
--the orders appear from the greatest order amount to the least. In query #2, since you sorted by the total dollar amount first, 
--the orders appear from greatest to least regardless of which account ID they were from. Then they are sorted by account ID next. 
--(The secondary sorting by account ID is difficult to see here, since only if there were two orders with equal total dollar amounts 
--would there need to be any sorting by account ID.)*/

--Write query that: Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

--Write query that:  Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

  /*Filter the accounts table to include the company (name), (website) and primary point of contact (primary_poc) just
  for the Exxon Mobil company in the accounts table.*/
SELECT 
     name, 
     website, 
     primary_poc
FROM accounts;
WHERE name = 'Exxon Mobil'

/*Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order.
Limit the results to the first 10 orders, and include the id and account_id fields */
SELECT 
     id, 
     account_id, 
     ROUND(standard_amt_usd/standard_qty, 2) AS unit_price 
FROM orders
LIMIT 10

/*Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with 
_usd. (TRY TO DO THIS WITHOUT USING THE TOTAL COLUMN.) Display the id and account_id fields also.  NOTE - you will receive an error with the correct solution 
to this question. This occurs because at least one of the values in the data creates a division by zero in your formula. You will learn later in the course 
how to fully handle this issue. For now, you can just limit your calculations to the first 10 orders, as we did in question #1, and you'll avoid that 
set of data that causes the problem  */
SELECT id, account_id, standard_amt_usd, ROUND((poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd))*100,2) AS poster_percent_of_revenue 
    FROM orders
    LIMIT 10;


/*Use the accounts table to find:
All the companies whose names start with 'C'.*/
SELECT name
FROM accounts
WHERE name LIKE 'C%';

/*Use the accounts table to find:
All the companies whose names start with 'C'.*/
SELECT name
FROM accounts
WHERE name LIKE '%one%';

/*Use the accounts table to find:
All the companies whose names start with 'C'.*/
SELECT name
FROM accounts
WHERE name LIKE '%s';

--Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target and Norstrom
SELECT 
     name,
     primary_poc,
     sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

--Use the web_events table to find all the informaiton regarding individuals who were contacted via the channel 
--or organic or adwords
SELECT * 
FROM web_events
WHERE channel IN ('organic', 'adwords');

--Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.
SELECT 
    name,
    primary_poc,
    sales_rep_id
FROM accounts
WHERE name NOT IN ('Walmart', 'Target', 'Nordstrom');

--Use the web_events table to find all information regarding individuals who were contacted via any method except using 
--organic or adwords method
SELECT *
FROM web_events
WHERE channel NOT IN ('organic', 'adwords');

--Use the accounts table to find:
--All the companies whose names do not start with 'C'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%';

--Use the accounts table to find:
--All companies whose names do not contain the string 'one' somewhere in the name.
SELECT name
FROM accounts
WHERE name NOT LIKE '%one%';

--Use the accounts table to find:
--All companies whose names do not end with 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE '%s';

--Q1.44: Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, 
--and the gloss_qty is 0.
SELECT *     
FROM orders
WHERE standard_qty > 1000 AND poster_qty = 0 AND gloss_qty = 0;

--Q1.44: Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.
SELECT name
FROM accounts
WHERE name NOT LIKE 'C%' AND name LIKE '%s' ;

--Q1.44 When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? 
--Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data 
--for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included 
--the begin and end values or not
--YES!! 24 and 29 values are included in the BETWEEN statement
SELECT 
      occurred_at,
      gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

--Q1.44 Use the web_events table to find all information regarding individuals who were contacted via the organic or 
--adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01' 
ORDER BY occurred_at DESC;

--Q1.47 Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field 
--in the resulting table.
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000;

--Q1.47 Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty 
--is over 1000.
SELECT *
FROM orders
WHERE standard_qty = 0 AND (gloss_qty > 1000 OR poster_qty > 1000);

--Q1.47 Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', 
--but it doesn't contain 'eana'.
SELECT name
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%') 
AND ((primary_poc LIKE '%ana%' OR primary_poc LIKE 'Ana%') AND primary_poc NOT LIKE '%eana%');

--Q3.4 Try pulling all the data from the accounts table, and all the data from the orders table.
SELECT orders.*, accounts.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;

--Q3.4 Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT orders.standard_qty, orders.gloss_qty, 
          orders.poster_qty,  accounts.website, 
          accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;

--Example JOIN MORE THAN ONE table
SELECT *
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN orders
ON accounts.id = orders.account_id

--Q3.11 Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include 
--the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure 
--only Walmart events were chosen. 
SELECT a.primary_poc,
      w.occurred_at,
      w.channel,
      a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

--Q3.11 Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should 
--include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name. 
SELECT sales_reps.name AS sales_rep_name,  -- ====================================================
       region.name AS region_name,     --MUST HAVE ALIASES since all are .name!!
       accounts.name AS accounts_name  --Don't need the AS!! Can just put: region.name region_name
FROM sales_reps                         -- =========================================================
JOIN region
ON sales_reps.region_id = region.id 
JOIN accounts
ON accounts.sales_rep_id = sales_reps.id
ORDER BY accounts.name  -- Ascending is the default ORDER BY xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

--Q3.11 Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
--Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) 
--to assure not dividing by zero.    ============================================================
SELECT region.name AS region_name,  -- Don't need the AS!! Can just put: region.name region_name
accounts.name AS accounts_name,     -- Don't need the AS!!  ====================================
(orders.total_amt_usd/(orders.total+.01)) AS unit_price -- Remember, don't need the AS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
FROM accounts
JOIN orders
ON accounts.id = orders.account_id 
JOIN sales_reps
ON accounts.sales_rep_id = sales_reps.id
JOIN region
ON sales_reps.region_id = region.id

--Q4.7  Find the total amount of poster_qty paper ordered in the orders table.
SELECT SUM(poster_qty) AS total_poster_qty
FROM orders;

--Q4.7  Find the total amount of standard_qty paper ordered in the orders table.
SELECT SUM(standard_qty) AS total_standard_qty
FROM orders;

--Q4.7  Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT SUM(total_amt_usd) AS total_dollar_sales
FROM orders;

--Q4.7 Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order 
--in the orders table. This should give a dollar amount for each order in the table.
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss 
FROM orders;

--Q4.7 Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit
FROM orders;

--Q4.11 When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at)
FROM orders
LIMIT 1;

--Q4.11 Try performing the same query as in question 1 without using an aggregation function. 
SELECT occurred_at
FROM orders
ORDER BY occurred_at;

--Q4.11 When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at)
FROM orders;

--Q4.11 Try to perform the result of the previous query without using an aggregation function.
SELECT occurred_at
FROM orders
ORDER BY occurred_at DESC
LIMIT 1;

--Q4.11 Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. 
--Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
SELECT AVG(standard_qty) AS avg_stnd, 
       AVG(poster_qty) AS avg_poster,                  
       AVG(gloss_qty) AS avg_gloss 
FROM orders;

--Q4.11 Via the video, you might be interested in how to calculate the MEDIAN. Though this is more advanced than what we have covered so 
--far try finding - what is the MEDIAN total_usd spent on all orders?


--Q4.14 #1  Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
SELECT a.name, o.occurred_at
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id 
ORDER BY occurred_at
LIMIT 1;

--Q4.14 #2 Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders 
--in usd and the company name. 
SELECT a.name, SUM(o.total_amt_usd) as total_sales 
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id 
GROUP BY a.name; 

--Q4.14 #3 Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? 
--Your query should return only three values - the date, channel, and account name.
SELECT w.occurred_at, w.channel, a.name 
FROM web_events AS w
JOIN accounts AS a 
ON a.id = w.account_id
ORDER BY w.occurred_at DESC
LIMIT 1;

--Q4.14 #4 Find the total number of times each type of channel from the web_events was used. Your final table should have 
--two columns - the channel and the number of times the channel was used.
SELECT channel, COUNT(channel) AS channel_count
FROM web_events
GROUP BY channel; 
--#########  OR another solution:
SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel

--Q4.14 #5 Who was the primary contact associated with the earliest web_event?
SELECT a.primary_poc
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id
ORDER BY w.occurred_at
LIMIT 1;

--Q4.14 #6 What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name 
--and the total usd. Order from smallest dollar amounts to largest.
SELECT a.name, MIN(o.total_amt_usd) as smallest_order
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name 
ORDER BY smallest_order;
--OR since "name" and "total_amt_used', show up in only one table, 
--it's ok to omit the table name such as:  
SELECT name, MIN(total_amt_usd) as smallest_order
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name 
ORDER BY smallest_order;

--Q4.14 #7 Find the number of sales reps in each region. Your final table should have two columns - the region and 
--the number of sales_reps. Order from fewest reps to most reps.
SELECT r.name, COUNT(*) AS reps_total
FROM region as r
JOIN sales_reps AS s
ON s.region_id = r.id
GROUP BY r.name
ORDER BY reps_total;

--4.17 #1 For each account, determine the average amount of each type of paper they purchased across their orders. 
--Your result should have four columns - one for the account name and one for the average spent on each of the paper types.
SELECT a.name, 
      ROUND(AVG(o.standard_qty),0) AS standard_avg, 
      ROUND(AVG(o.poster_qty),0) AS poster_avg, 
      ROUND(AVG(o.gloss_qty),0) AS gloss_avg
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
     
--4.17 #2 For each account, determine the average amount spent per order on each paper type. Your result should have 
--four columns - one for the account name and one for the average amount spent on each paper type.
SELECT a.name, 
      ROUND(AVG(o.standard_amt_usd),2) AS standard_amt_usd_avg, 
      ROUND(AVG(o.poster_amt_usd),2) AS poster_amt_usd_avg, 
      ROUND(AVG(o.gloss_amt_usd),2) AS gloss_amt_usd_avg
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name

--4.17 #3 Determine the number of times a particular channel was used in the web_events table for each sales rep. 
--Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. 
--Order your table with the highest number of occurrences first.
SELECT sales_reps.name, w.channel, COUNT(*) AS number_of_occurrences
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
JOIN sales_reps
ON a.sales_rep_id = sales_reps.id
GROUP BY sales_reps.name, w.channel
ORDER BY number_of_occurrences DESC;


--4.17 #4 Determine the number of times a particular channel was used in the web_events table for each region. 
--Your final table should have three columns - the region name, the channel, and the number of occurrences. 
--Order your table with the highest number of occurrences first.
SELECT r.name, w.channel, COUNT(*) AS number_of_occurrences
FROM region r
JOIN sales_reps 
ON r.id = sales_reps.region_id
JOIN accounts a
ON sales_reps.id = a.sales_rep_id 
JOIN web_events w
ON a.id = w.account_id
GROUP BY r.name, w.channel
ORDER BY number_of_occurrences DESC;

--Q4.20 #1 Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT DISTINCT a.name AS account_name, r.name AS region_name  
FROM accounts a 
JOIN sales_reps
ON sales_reps.id = a.sales_rep_id
JOIN region r
ON sales_reps.id = r.id;

--Q4.20 #2 Have any sales reps worked on more than one account?
SELECT sales_reps.name AS rep_name, accounts.name AS account_name  
FROM accounts 
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
ORDER BY rep_name;

--4.23 #1 How many of the sales reps have more than 5 accounts that they manage?
SELECT s.name AS s_name, COUNT(a.name) AS a_number
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
GROUP BY s.name
HAVING COUNT(a.name) > 5

--4.23 #2 How many accounts have more than 20 orders? (ans 120)
-- Use account id AND account name in case account name isn't unique  
SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;

--4.23 #3 Which account has the most orders?
SELECT a.id, a.name, COUNT(*) AS num_orders  
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
ORDER BY num_orders DESC
LIMIT 1;

--4.23 #4 Which accounts spent more than 30,000 usd total across all orders?
SELECT a.id, a.name, SUM(o.total_amt_usd) 
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
HAVING SUM(o.total_amt_usd)  > 30000;

--4.23 #5 Which accounts spent less than 1,000 usd total across all orders?
SELECT a.id, a.name, SUM(o.total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
HAVING SUM(o.total_amt_usd)  < 1000

--4.23 #6 Which account has spent the most with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) AS amt_total
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
ORDER BY amt_total  DESC
LIMIT 1;

--4.23 #7 Which account has spent the least with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) AS amt_total
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name, a.id
ORDER BY amt_total  
LIMIT 1;

--4.23 #8 Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.id, a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6
ORDER BY COUNT(*);

--4.23 #9 Which account used facebook most as a channel? 
SELECT a.id, a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY COUNT(*) DESC
LIMIT 1;

--4.23 #10 Which channel was most frequently used by MOST accounts?
SELECT w.channel, COUNT(*) AS channel_count
FROM accounts a
JOIN web_events w
  ON a.id = w.account_id
GROUP BY w.channel
ORDER BY channel_count DESC
LIMIT 1;
--Udacity answer below...because the question is used by MOST accounts then can go with TOP 10 channels, not exact. ----
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;


--Q4.27 #1 Find the sales in terms of total dollars for all orders in each year, 
--ordered from greatest to least. Do you notice any trends in the yearly sales totals?
SELECT DATE_PART('year', occurred_at) AS year_part, SUM(total_amt_usd) 
FROM orders
GROUP BY year_part
ORDER BY SUM(total_amt_usd) DESC;
--NOTE: Yearly totals show that 2013 and 2017 have much smaller totals than all other years. 
--That's because 2013 and 2017 only have ONE MONTH of data in the table for the years 2013 and 2017. 

--Q4.27 #2 Which month did Parch & Posey have the greatest sales in terms of total dollars? 
--Are all months evenly represented by the dataset?
--Remember from Q 4.27 years 2013 and 2017 only have ONE MONTH of data represented.
SELECT DATE_PART('month', occurred_at) AS month_part, SUM(total_amt_usd) 
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY month_part
ORDER BY SUM(total_amt_usd) DESC;

--Q4.27 #3 Which year did Parch & Posey have the greatest sales in terms of total number of orders? 
--Are all years evenly represented by the dataset?  


--Q4.27 #4 Which month did Parch & Posey have the greatest sales in terms of total number of orders? 
--Are all months evenly represented by the dataset?

--Q4.27 #5 In which month of which year did Walmart spend the most on gloss paper in terms of dollars?




--Q4.31 #1 Write a query to display for each order, the account ID, total amount of the order, 
--and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.

--Q4.31 #2 Write a query to display the number of orders in each of three categories, based on the total number of items 
--in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.

--Q4.31 #3 We would like to understand 3 different levels of customers based on the amount associated with their purchases. 
--The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. 
--The second level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. 
--Provide a table that includes the level associated with each account. You should provide the account name, 
--the total sales of all orders for the customer, and the level. Order with the top spending customers listed first.

--Q4.31 #4  We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers 
--only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers listed first.

--Q4.31 #5 We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders. 
--Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they have more than 200 orders. 
--Place the top sales people first in your final table.

--Q4.31 #6 The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want 
--to see these characteristics represented as well. We would like to identify top performing sales reps, 
--which are sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep with 
--more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales across all orders, 
--and a column with top, middle, or low depending on this criteria. Place the top sales people based on dollar amount of sales first 
--in your final table. You might see a few upset sales people by this criteria!


--Q5.3 Show the average number of events a day for each channel.
SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
                channel, COUNT(*) as events
         FROM web_events 
         GROUP BY 1,2) sub
GROUP BY channel
ORDER BY 2 DESC;

--Q5.3 What was the month/year combo for the first order placed?
SELECT MIN(DATE_TRUNC('month', occurred_at))
FROM orders;

--Q5.3 The average amount of standard paper sold on the first month that any order was placed in the orders table (in terms of quantity).
SELECT AVG(standard_qty), MIN(DATE_TRUNC('month', occurred_at))           FROM orders






--SQL BOLT Problems
--#3 Find all the Toy Story movies
SELECT Title 
FROM Movies
WHERE Title LIKE 'Toy Story%';

--#3 Find all the movies directed by John Lassete
SELECT Title
FROM Movies
WHERE Director = 'John Lasseter';

--#3 Find all the WALL-* movies
SELECT Title 
FROM Movies
WHERE Title LIKE 'WALL-%';

--#4 List all directors of Pixar movies (alphabetically), without duplicates 
SELECT DISTINCT Director 
FROM movies
ORDER BY Director;

--#4List the last four Pixar movies released (ordered from most recent to least) 
SELECT Title, year  
FROM movies
ORDER BY year DESC
LIMIT 4;

--#4 List the first five Pixar movies sorted alphabetically
SELECT Title
FROM movies
ORDER BY Title 
LIMIT 5;

--#4 USE OFFSET!!:  List the next five Pixar movies sorted alphabetically 
SELECT Title
FROM movies
ORDER BY Title 
LIMIT 5 OFFSET 5;

--#6 Show the sales numbers for each movie that did better internationally rather than domestically
SELECT Title, International_sales AS i_sales, Domestic_sales AS d_sales 
FROM movies m
JOIN Boxoffice b
ON m.id = b.Movie_id
WHERE i_sales > d_sales;

--#7 Find the list of all buildings that have employees
--NOTE:  SQL BOLT allows you to only list Buidling_name in GROUP BY!!
--Some databases (like MySQL in “loose mode”) allow this, and they’ll just pick an arbitrary value of e.Name from each group.
--That’s not standard, and results are non-deterministic (it might not be the same row each time).
SELECT b.Building_name, e.Name
FROM Buildings b
JOIN Employees e
ON e.Building = b.Building_name
GROUP BY Building_name;
--Better:  
SELECT b.Building_name, e.Name
FROM Buildings b
JOIN Employees e
ON e.Building = b.Building_name
GROUP BY b.Building_name, e.Name;

--#7 List all buildings and the distinct employee roles in each building (including empty buildings)
SELECT DISTINCT b.Building_name, e.Role
FROM Buildings b
LEFT JOIN  Employees e
ON e.Building = b.Building_name

-- #8  Find the name and role of all employees who have not been assigned to a building 
SELECT Name, Role, Building
FROM Employees 
WHERE Name IS NOT NULL AND Building IS NULL ;

-- #8 Find the names of the buildings that hold no employees 
SELECT b.Building_name, e.Name
FROM Buildings b
LEFT JOIN Employees e
ON e.Building = b.Building_name
WHERE e.Name IS NULL;

--#9 List all movies and their combined sales in millions of dollars
SELECT m.Title, 
(b.Domestic_sales + b.International_sales)/1000000 AS sales_total
FROM Boxoffice b
JOIN Movies m
ON b.Movie_id = m.Id;

--#9 List all movies and their ratings in percent
SELECT title, rating * 10 AS rating_percent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

--#9 FOR EVEN NUMBER: List all movies that were released on even number years 
SELECT title 
FROM movies
WHERE year %2 = 0;   --%2 = 0 indicates it's an EVEN number

--#10 Find the longest time that an employee has been at the studio 
SELECT *, MAX(Years_employed) 
FROM employees;

--#10For each role, find the average number of years employed by employees in that role
SELECT Role,  AVG(Years_employed) 
FROM employees
GROUP BY Role;

--#10 Find the total number of employee years worked in each building 
SELECT Building, SUM(Years_employed)
FROM employees
GROUP BY Building;

-- #11 Find the number of Employees of each role in the studio
SELECT DISTINCT Role, 
        COUNT(*) AS Employees_each_role
FROM Employees
GROUP BY Role;

--# 11 Find the total number of years employed by all Engineers 
SELECT SUM(Years_employed)
FROM Employees
WHERE Role = 'Engineer';

-- #12 Find the number of movies each director has directed 
SELECT Director, COUNT(Title) AS number_of_movies
FROM Movies
GROUP BY Director;

-- #12 Find the total domestic and international sales that can be attributed to each director 
-- NOTE: SUM → needed because directors can have multiple movies. + → needed because each movie 
--has two different columns you want to combine.
-- SUM(Domestic_sales + International_sales) = (300+400) + (250+350) = 1,300
SELECT Director, 
       SUM(Domestic_sales + International_sales) AS total_Dom_Int_Sales
FROM Movies m
JOIN Boxoffice b
ON b.Movie_id = m.Id
GROUP BY Director
ORDER BY total_Dom_Int_Sales;

--BIG QUERY exercises!!
--Warm Up 1
--1) What is the earliest year of purchase?
SELECT MIN(year)
FROM `prework.sales`
/*
Answer:  2011
*/
--************
--2) What is the average customer age per year? Order the years in ascending order.
SELECT year, ROUND(AVG(Customer_Age)) AS year_average
FROM `prework.sales`
GROUP BY year  --or group by 1
ORDER BY year; --or order by 1
/*
Answer:  
year	year_average
2011	34.0
2012	34.0
2013	35.0
2014	37.0
2015	35.0
2016	37.0
*/
--****************
--3) Return all clothing purchases from September 2015 where the cost was at least $70.

SELECT Product, product_category, month, year, cost
FROM `prework.sales`
WHERE Product_Category LIKE 'Clothing' AND month = 'September' AND year = 2015 AND  COST >= 70;
/*
Answer:  
Total = 553 items (below is first 3 items)
Product	product_category	month	year	cost
AWC Logo Cap	Clothing	September	2015	182
AWC Logo Cap	Clothing	September	2015	105
AWC Logo Cap	Clothing	September	2015	175
*/
--****************
--4) What are all the different types of product categories that were sold from 2014 to 2016 in France?
SELECT DISTINCT product_category
FROM `prework.sales`
WHERE Country = 'France' AND year BETWEEN 2014 AND 2016
/*
Answer:
product_category
Accessories
Clothing
Bikes
*/
--******************
--5) Within each product category and age group (combined), what is the average order quantity and total profit?
SELECT DISTINCT product_category,  
                age_group, 
                 ROUND(AVG(order_quantity),0) AS avg_order_quantity,  
                SUM(profit) AS total_profit
FROM `prework.sales`
GROUP BY Product_Category, age_group;  --or GROUP BY 1, 2
/*
Answer: 12 items
product_category	age_group	               avg_order_quantity	total_profit
Accessories	     Youth (<25)	          15.0	               1255267
Accessories	     Adults (35-64)	          15.0	               4611837
Accessories	     Young Adults (25-34)	15.0	               2921240
Accessories	     Seniors (64+)	          15.0	               74033
Clothing	          Young Adults (25-34)	15.0	               884614
Clothing	          Adults (35-64)	          15.0	               1527164
Clothing	          Youth (<25)	          14.0	               410079
Clothing	          Seniors (64+)	          14.0	               17590
Bikes	          Young Adults (25-34)	1.0	               7580907
Bikes	          Youth (<25)	          1.0	               2709246
Bikes	          Adults (35-64)	          1.0	               10182581
Bikes	          Seniors (64+)	          1.0	               46542
*/

--Warm Up 2
--1) Which product category has the highest number of orders among 31-year olds? Return only the top product category.
SELECT Product_Category, SUM(Order_Quantity)
FROM prework.sales
WHERE Customer_Age = 31
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1; 
/*
Answer:  Clothing
*/

--2) Of female customers in the U.S. who purchased bike-related products in 2015, what was the average revenue?
SELECT AVG(revenue) AS Avg_revenue
FROM prework.sales
WHERE Customer_gender = 'F' AND Year = 2015 AND country = 'United States' 
     AND Product_Category LIKE '%Bike%';
/*
Answer:  2424.603.....
*/

--3) Categorize all purchases into bike vs. non-bike related purchases. How many purchases were there in each group among male customers in 2016?
SELECT 
  CASE 
    WHEN Product LIKE '%Bike%' THEN 'Bike'  --This is the Curriculum answer, but I disagree, I htink you need Product_Category too
    ELSE 'Non-Bike'
  END AS category,
  count(*) AS count
FROM prework.sales
WHERE Customer_gender = 'M'
  AND year = 2016
GROUP BY category;
/*
Bike: 411
Non-Bike:  15120
*/

--4) Among people who purchased socks or caps (use sub_category), what was the average profit earned per country per year, ordered by 
--highest average profit to lowest average profit?
SELECT country, year, AVG(profit) AS avg_profit
FROM prework.sales
WHERE Sub_category IN ('Caps', 'Socks')
GROUP by country, year
ORDER by avg_profit DESC;

--5) For male customers who purchased the AWC Logo Cap (use product), use a window function to order the purchase dates 
--from oldest to most recent within each gender.
select *, 
	row_number() over (partition by customer_gender order by date asc ) as date_rank
from prework.sales
where customer_gender = 'M' and product = 'AWC Logo Cap';

