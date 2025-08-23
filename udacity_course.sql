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



