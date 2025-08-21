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


