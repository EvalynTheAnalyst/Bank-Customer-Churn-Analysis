#Introduction:
In today’s competitive banking landscape, customer retention is critical to maintaining profitability and sustaining growth. High customer churn, where clients leave for competitors, can drastically affect a bank’s revenue. Through this analysis, I aim to identify key drivers behind customer churn by leveraging SQL for data preparation and Power BI for visualization. By analyzing these factors, I can provide actionable insights to help the bank develop strategies to reduce customer attrition, improve satisfaction, and foster long-term relationships.
![image](https://github.com/user-attachments/assets/57bea6b8-ea0f-4d97-a37f-4881d33e134c)


#About the Dataset:
The dataset used for this analysis was sourced from Kaggle, created by Shawanand, and can be accessed here.

#Dataset Overview:

RowNumber: Unique identifier for each record.
CustomerId: Unique customer identification number.
Surname: Customer’s last name (this can be anonymized for privacy).
CreditScore: Customer's credit score at the time of data collection.
Geography: Customer's country/region.
Gender: Customer's gender.
Age: Customer’s age.
Tenure: Number of years the customer has been with the bank.
Balance: Customer’s account balance.
NumOfProducts: Number of products the customer has subscribed to.
HasCrCard: Whether the customer has a credit card (1 = Yes, 0 = No).
IsActiveMember: Whether the customer is an active member (1 = Yes, 0 = No).
EstimatedSalary: Customer’s estimated salary.
Exited: Target variable indicating churn (1 = Yes, 0 = No).
Data Preparation
Step 1: Data Import (Using MySQL)
The dataset was first loaded into MySQL to carry out data cleaning and transformation. Using SQL queries, I ensured the dataset was prepped for analysis in Power BI.

Step 2: Data Cleaning and Transformation
To ensure the dataset's integrity and accuracy, the following steps were applied:

Duplicate Removal: Checked for any duplicate entries based on the CustomerId field to avoid skewing results.

DELETE FROM customer_data
WHERE CustomerId IN (SELECT CustomerId FROM customer_data GROUP BY CustomerId HAVING COUNT(*) > 1);

Handling Missing Values: Inspected for missing data in critical fields such as CreditScore, Balance, and Geography. There was no missing values.
![image](https://github.com/user-attachments/assets/ac66d818-49eb-4fee-a2c8-a83dfcc096e2)

Once the data was cleaned, it was exported for Power BI analysis.

#Analysis and Visualization (Using Power BI)
After cleaning the data with MySQL, I imported the dataset into Power BI for detailed analysis. Below are the key metrics and insights derived from the visualizations:

#Key Metrics Overview:
Total Balance: $764.86 million
Total Customers: 10,000
Churn Rate: 20.37% (approx. 2 out of 10 customers have churned)
Churned Customer Balance: $185.95 million
Detailed Analysis:
Customer Churn by Country:

The pie chart shows that Germany (39.9%) and France (39.76%) have the highest churn rates, with Spain at a lower 20.27%.
Insight: Germany requires immediate attention as it experiences both high churn and significant customer value loss.
Account Balance of Existing and Churned Clients by Country:

Existing Clients: France leads with $0.25 billion, followed by Germany and Spain.
Churned Clients: Germany tops the list with $98 million in lost balances.
Insight: Target high-value German customers for retention initiatives to mitigate loss.
Churn by Credit Score Category:

Customers with "Fair" credit scores churn the most, followed by "Poor" and "Good" credit ratings.
Insight: Focus on retention strategies for customers with mid-range credit scores.
Churned Active Members by Country:

Both France and Germany have a similar number of churned active members.
Insight: Strengthen engagement programs in France and Germany to prevent further churn among active members.
Estimated Salary by Age and Gender:

The peak salary range is in the 50-60 age bracket, with similar trends for both genders.
Insight: Tailor retention strategies to middle-aged, high-income customers.
Churn by Tenure:

Churn is consistent across most tenure lengths, with a slight dip in customers who’ve been with the bank for over 9 years.
Insight: Focus on early intervention to retain newer customers.
Credit Card Ownership and Churn:

Customers without credit cards are more likely to churn.
Insight: Promote credit card products as a retention tool.

#Conclusion
The analysis reveals that customer churn is heavily influenced by geographic factors, credit score, and account balance. Germany, in particular, stands out due to its high churn rate coupled with substantial balance loss, making it a critical area for retention strategies. Additionally, a correlation between credit card ownership and churn suggests opportunities for product promotion to reduce attrition. The consistent churn across tenure lengths also indicates that banks should intervene early in the customer relationship to enhance loyalty.

By leveraging MySQL for data cleaning and Power BI for visual insights, I identified key drivers behind churn and presented actionable recommendations for improving customer retention.












