-- Create supporter table
CREATE TABLE `practice-tables-donors.crowdfunding.supporter` (
  id INT64 NOT NULL,
  first_name STRING,
  last_name STRING
);

-- Create project table
CREATE TABLE `practice-tables-donors.crowdfunding.project` (
  id INT64 NOT NULL,
  category STRING,
  author_id INT64 NOT NULL,
  minimal_amount NUMERIC(10,2)
);

-- Create donation table
CREATE TABLE `practice-tables-donors.crowdfunding.donation` (
  id INT64 NOT NULL,
  project_id INT64 NOT NULL,
  supporter_id INT64 NOT NULL,
  amount NUMERIC(10,2),
  donated DATE
);

-- Insert supporters
INSERT INTO `practice-tables-donors.crowdfunding.supporter` (id, first_name, last_name)
VALUES 
  (1, 'Marlene', 'Wagner'),
  (2, 'Lonnie', 'Goodwin'),
  (3, 'Sophie', 'Peters'),
  (4, 'Edwin', 'Paul'),
  (5, 'Hugh', 'Thornton');

-- Insert projects
INSERT INTO `practice-tables-donors.crowdfunding.project` (id, category, author_id, minimal_amount)
VALUES 
  (1, 'music', 1, 1677),
  (2, 'music', 5, 21573),
  (3, 'traveling', 2, 4952),
  (4, 'traveling', 5, 3135),
  (5, 'traveling', 2, 8555);

-- Insert donations
INSERT INTO `practice-tables-donors.crowdfunding.donation` (id, project_id, supporter_id, amount, donated)
VALUES 
  (1, 4, 4, 928.40, '2016-09-07'),
  (2, 8, 18, 384.38, '2016-12-16'),
  (3, 6, 12, 367.21, '2016-01-21'),
  (4, 2, 19, 108.62, '2016-12-29'),
  (5, 10, 20, 842.58, '2016-11-30');
