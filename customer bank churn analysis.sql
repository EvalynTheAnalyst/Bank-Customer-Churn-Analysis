-- creating a database
 CREATE database CustomerBankChurn;
 USE CustomerBankChurn;

-- creating table
CREATE TABLE Customer_bank_churn_analysis(
RowNumber int,
CustomerId int,
Surname text,
CreditScore int,
Geography text,
Gender text,
Age int,
Tenure int,
Balance double,
NumOfProduct int,
HasCrCard int4,
IsActiveMember int,
EstimatedSalary double,
Exited int4);


SELECT * FROM customerbankchurn.customer_bank_churn_analysis;

-- Distribution of customer by country
Select Geography,
Count(DISTINCT CustomerId) AS num_of_client -- obtain total number of clients
FROM customerbankchurn.customer_bank_churn_analysis
GROUP BY Geography; -- categorizing the total number of clients by country

-- Distribution by customer age across different countries
Select Geography, Age,
Count(DISTINCT CustomerId) AS num_of_client -- obtain total number of clients
FROM customerbankchurn.customer_bank_churn_analysis
GROUP BY Geography,Age; -- categorizing the total number of clients by country and age.

-- Gender Distribution among  country and Total Credit score per Country and Gender.
Select Geography,Gender, 
Count(DISTINCT CustomerId) AS num_of_client, -- obtain total number of clients
sum(CreditScore) As Total_credit_score  -- obtain total number of credit scores
FROM customerbankchurn.customer_bank_churn_analysis
GROUP BY Geography,Gender; -- 

-- Average balance per country
Select Geography, 
Gender,
avg(Balance) AS avg_balance           -- obtaining the average account balance of customers
FROM customerbankchurn.customer_bank_churn_analysis
GROUP BY Geography,Gender;              -- Grouping by country and gender

-- Relationship between tenure and customer_balance
SELECT
    tenure,
    AVG(balance) AS avg_balance,            -- Getting the average, lowest and highest account balance in a the bank
    MIN(balance) AS min_balance,
    MAX(balance) AS max_balance,
    COUNT(*) AS num_customers              -- count number of customers
FROM
  customerbankchurn.customer_bank_churn_analysis
GROUP BY
    tenure                           -- Grouping by Tenure
ORDER BY                              -- Order results by tenure
    tenure;
 # Relation between Product Usage , credit card ownership  and balance per country
SELECT
	Geography,
    Sum(NumOfProduct) As Total_product, -- Obtaining total number of product
    Sum(HasCrCard) As Card_ownership,  -- obtaining total number of clients with card ownership
    COUNT(*) AS num_customers,
    AVG(balance) AS avg_balance,       -- obtaining the average account balance of customers
    MIN(balance) AS min_balance,       -- obtaining the lowest account balance of customers
    MAX(balance) AS max_balance       -- obtaining the highest account balance of customers
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
   Geography                         -- grouping results by country
ORDER BY
    Total_product, Card_ownership;   -- grouping results by sum of num of products and card ownership
    
# OVERALL CHURN PERCENTAGE
SELECT
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_percentage -- obtaining percentage of the customers who have exited the bank
FROM
    customerbankchurn.customer_bank_churn_analysis;
    
    
#CHURN PERCENTAGE PER COUNTRY
SELECT
    Geography,
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_percentage -- obtaining percentage of customers who have exited the bank
FROM
     customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Geography  -- Grouping the results by country
ORDER BY
    churn_percentage DESC; -- order the result by churn percentage

# CHURN PERCENTAGE PER GENDER
SELECT
    Gender,
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_percentage -- obtaining percentage of customers who have exited the bank
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Gender     -- grouping by gender
ORDER BY
    churn_percentage DESC; -- order by churn customer percentage
    
# CHURN PERCENTAGE BY AGE
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'    -- categorizing the result into age groups 
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN Age > 50 THEN 'Above 50'
    END AS age_group,
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_percentage -- obtaining percentage of customers who have exited the bank
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    age_group -- grouping the results by age group
ORDER BY
    churn_percentage DESC;  -- order by churn customer percentage
    
#Average credit score of Customer who have churned and who haven't
SELECT
    Exited,
    AVG(CreditScore) AS avg_credit_score  -- obtaining the average credit score
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Exited  -- grouping the result by the bank's current customers and those client who have churned
ORDER BY
    Exited DESC; -- ordering the result by current customers and those client who have churned
    
#RELATIONSHIP BETWEEN CUSTOMER CHURN AND BALANCE
SELECT
    Exited,
    AVG(Balance) AS avg_balance, -- average total account balance
    MIN(Balance) AS min_balance, -- lowest total account balance
    MAX(Balance) AS max_balance  -- highest account balance
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Exited -- grouping the result by current customers and those client who have churned
ORDER BY
    Exited DESC; -- ordering the results by current customers and those client who have churned

#DOES BEING AN ACTIVE MEMBER AFFECT THE CHURNING RATE?
SELECT
    IsActiveMember,
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_percentage -- obtaining the customer churn percentage
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    IsActiveMember -- grouping the results by active members and dormant members
ORDER BY
    IsActiveMember DESC; -- ordering the results by active members and dormant members
    
#FACTORS AFFECTING CHURNING RATE OF CUSTOMERS

SELECT
    Exited,
    AVG(CreditScore) AS avg_credit_score, -- average CreditScore
    AVG(Balance) AS avg_balance,          -- average account balance
    AVG(Tenure) AS avg_tenure,            -- average tenure
    AVG(EstimatedSalary) AS avg_estimated_salary  -- average estimated salary
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Exited; -- grouping the result by current customers and those client who have churned
    
# Can we identify patterns among customers with high estimated salaries but low product usage?
SELECT
    Geography,
    Gender,
    Age,
    CreditScore,
    Balance,
    Tenure,
    NumOfProduct,
    EstimatedSalary
FROM
    customerbankchurn.customer_bank_churn_analysis
WHERE
    EstimatedSalary > (SELECT AVG(EstimatedSalary) FROM customerbankchurn.customer_bank_churn_analysis)
    AND NumOfProduct <= 1 -- filter the results by estimated salary which is greater than the mean and number of product
ORDER BY
    EstimatedSalary DESC; -- arranging the results by estimated salary from the highest

#COMPARISON BETWEEN CHURNING RATE AND CUSTOMERS BALANCE AMONG COUNTRIES
SELECT
    Geography,
    AVG(Balance) AS avg_balance,    
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_rate -- churned customers percentage
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Geography -- grouping the results by country
ORDER BY
    avg_balance DESC, churn_rate ASC; -- arrange the results by average account balance

#characteristics of the top 10% of customers by balance, and how do they differ from the bottom 10%
WITH balance_ranks AS (
    SELECT
		CustomerId,
        Balance,
        NTILE(10) OVER (ORDER BY Balance DESC) AS decile #Destributing rows of an orderd partition by into the top 10% and bottom 10% customers 
    FROM
        customerbankchurn.customer_bank_churn_analysis
) -- creating a temp table
SELECT
    MIN(Balance) AS bottom_10_percent_threshold, -- obtaining bottom 10 % threshold
    MAX(Balance) AS top_10_percent_threshold -- obtaining top 10% threshold
FROM
    balance_ranks
WHERE
    decile = 1 OR decile = 10; -- filter the result by 10 equal group in which a population can be devided
    
#Average tenure of customers who are active members vs. those who are not
    
Select
	IsActiveMember,
	avg(Tenure) As Avg_tenture -- average tenure
FROM customerbankchurn.customer_bank_churn_analysis
GROUP BY IsActiveMember; -- grouping by active and dormant members

#Number of products used correlate with customer satisfaction 
SELECT
    NumOfProduct,
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_rate -- percentage churn rate
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    NumOfProduct -- grouping by NumOfProduct
ORDER BY
    NumOfProduct ASC; -- arranging by num of products a customer has
    
    
#Are there significant differences in churn rates between male and female customers?
SELECT
    Gender,
    (SUM(Exited) * 100.0 / COUNT(*)) AS churn_rate -- percentage churn rate
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Gender;  -- grouping by gender
    
# How does the balance differ between male and female customers across different age groups?
SELECT
    Gender,
    CASE
        WHEN age < 30 THEN 'Under 30'  -- cartegorizing the results by age groups
        WHEN age BETWEEN 30 AND 40 THEN '30-40'
        WHEN age BETWEEN 41 AND 50 THEN '41-50'
        WHEN age > 50 THEN 'Above 50'
    END AS age_group,
    AVG(Balance) AS avg_balance -- average account balance
FROM
    customerbankchurn.customer_bank_churn_analysis
GROUP BY
    Gender, age_group -- grouping the result by gender and age group
ORDER BY
    Gender, age_group ASC;  -- arrange the results by gender and age group





