--SELECT all columns FROM accounts tables, limit 10 rows
select *
from accounts
limit 10;

--SELECT 3 columns FROM orders table, all rows
SELECT id, account_id, occurred_at 
     FROM orders;

--SELECT 3 columns FROM web_events table, limit 15 rows 
SELECT occurred_at, account_id, channel
     FROM web_events
     LIMIT 15;

--SELECT 3 columns FROM orders table, ORDER BY earliest purchases to latest for first 10 rows 
SELECT id, occurred_at, total_amt_usd
     FROM orders
     ORDER BY occurred_at
     LIMIT 10

--SELECT 3 columns FROM orders table, ORDER BY latest to earliest total_amt_used for first 10 rows   
SELECT id, account_id, total_amt_usd
     FROM orders
     ORDER BY total_amt_usd DESC 
     LIMIT 5

--SELECT 3 columns FROM orders table, ORDER BY earliest to latest total_amt_used for first 20 rows     
SELECT id, account_id, total_amt_usd
     FROM orders
     ORDER BY total_amt_usd
     LIMIT 20

--Display the order ID, account ID, and total dollar amount for all the orders, 
  --sorted first by the account ID (in ascending order), and then by 
  --the total dollar amount (in descending order)  
  SELECT id, account_ID, total_amt_usd
   FROM orders
   ORDER BY account_ID, total_amt_usd DESC; 

--Write a query that again displays order ID, account ID, and total dollar amount for each order, 
--but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order)    
SELECT id, account_ID, total_amt_usd
   FROM orders
   ORDER BY total_amt_usd DESC, account_ID 

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
    LIMIT 5

--Write query that:  Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
    FROM orders
    WHERE total_amt_usd < 500
    LIMIT 10

  /*Filter the accounts table to include the company (name), (website) and primary point of contact (primary_poc) just
  for the Exxon Mobil company in the accounts table.*/
SELECT name, website, primary_poc
    FROM accounts
    WHERE name = 'Exxon Mobil'

