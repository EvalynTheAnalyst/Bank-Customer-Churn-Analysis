# Bank-Customer-Churn-Analysis
In today's competitive banking environment, retaining customers is more crucial than ever for financial institutions. Customer churn, or the loss of clients to competitors, can significantly affect a bank's profitability and long-term growth. This analysis aims to identify the factors that drive customers to end their relationship with the bank. By understanding these underlying reasons, banks can develop strategies to mitigate customer attrition. The purpose of this analysis is to provide insights into customer churn rates and offer recommendations for areas of improvement.

About The Dataset:
The dataset was obtained from  Kaggle by Shawanand. The link to the dataset is as below:
https://www.kaggle.com/datasets/anandshaw2001/customer-churn-dataset

Data Description:

    •	Break down the dataset in detail, describing what each column represents:
    •	RowNumber: A unique identifier for each row in the dataset.
    •	CustomerId: Unique customer identification number.
    •	Surname: The last name of the customer (for privacy reasons, consider anonymizing this data if not already done).
    •	CreditScore: The customer's credit score at the time of data collection.
    •	Geography: The customer's country or region, providing insights into location-based trends in churn.
    •	Gender: The customer's gender.
    •	Age: The customer's age, valuable for demographic analysis.
    •	Tenure: The number of years the customer has been with the bank.
    •	Balance: The customer's account balance.
    •	NumOfProducts: The number of products the customer has purchased or subscribed to.
    •	HasCrCard: Indicates whether the customer has a credit card (1) or not (0).
    •	IsActiveMember: Indicates whether the customer is an active member (1) or not (0).
    •	EstimatedSalary: The customer's estimated salary.
    . Exited: The target variable, indicating whether the customer has churned (1) or not (0).


Primary KPIs:
              •	Determine Customer churning rate per country.
              •	Relationship between Tenure and Customer churning rate.
              •	Average account balance per country.
              •	Overall Churn Percentage
              •	Relationship between customer churn and balance.
              •	Factors affecting churning rate of customers.


Data Cleaning and Transformation:
After loading the data, the next step was data cleaning. Excel was used to check for any missing values and duplicates. To remove duplicates, I selected the data, navigated to the Data Ribbon, and under Data Tools, chose "Remove Duplicates." I then selected the Unique ID and clicked OK. To address any missing values, I applied a filter using conditional formatting to identify blanks in the dataset; however, no missing data was found. I also ensured that all data types were correctly assigned. Finally, the cleaned dataset was saved and uploaded into MySQL for further analysis.

Attached on these repositories are the MYSQL script used to obtain the analysis.
The data was then loaded to POWERBI for visualisation and analysis.

Below are the findings:

https://app.powerbi.com/links/uWIgUWNzIy?ctid=0765532a-06c1-4f0f-9f39-394689f5f8fe&pbi_source=linkShare

Key Metrics Overview
          •	Balance: The total account balance of the bank's customers is $764.86 million.
          •	Total Customers: The bank serves a total of 10,000 customers.
          •	Churn Rate: The customer churn rate stands at 20.37%, indicating that roughly 2 out of every 10 customers have left the bank.
          •	Total Customer Churn Balance. The total balance for the customers who have left is at 185.95M. 
Detailed Analysis
1.	Customer Churned per Country:
      o	The pie chart shows the distribution of churned customers across three countries: Germany (39.9%), France (39.76%), and Spain (20.27%).
      o	Germany has the highest number of churned customers, closely followed by France, with Spain having significantly fewer.
2.	Total Account Balance for Existing and Churned Clients by Country:
     ]o	Existing Clients:France leads with an account balance of $0.25 billion, followed by Germany ($0.20 billion), and Spain ($0.12 billion).
      o	Churned Clients:Germany has the highest churned client balance at $98 million, followed by France ($58 million) and Spain ($30 million).
      o	This suggests that while Germany has the highest churn, it also has a substantial number of high-value customers who are leaving.
3.	Total Churned Customers by Credit Score Category:
      o	Customers with a "Fair credit" rating appear to churn the most, followed by those with "Poor credit" and "Good credit."
      o	Very few customers with "Excellent credit" have churned, indicating that higher credit scores correlate with better customer retention.
4.	Churned Active Members Per Country:
      o	The bar chart indicates that France and Germany have a similar number of churned active members, with Spain significantly lower.
      o	This trend aligns with the overall churn data by country.
5.	Estimated Salary by Age and Gender:
      o	The histogram shows that both male and female customers have similar salary distributions across different age groups, with a peak in the 50-60 age range.
      o	The distribution suggests that middle-aged customers have the highest earning potential, which could be a factor in retention strategies.
6.	Total Churn Customer Per Tenure:
      o	The bar chart indicates that churn is relatively consistent across different tenure lengths, with a slight decrease in customers who have been with the bank for 9-10 years.
      o	This suggests that customers are more likely to churn earlier in their relationship with the bank.
7.	Relationship Between Card Holder and Churning Rate:
      o	A significant portion of churned customers did not have a credit card, indicating a potential correlation between credit card ownership and customer retention.
      o	This insight could guide the bank in promoting credit card products to reduce churn rates.

Conclusion
The Bank Customer Churn Analysis visualisation effectively highlights key factors contributing to customer churn, such as geographic location, credit score, and account balance. Germany, in particular, presents a critical area for the bank, as it has both the highest churn rate and a substantial portion of high-balance accounts leaving the bank. The analysis suggests that focusing on improving customer satisfaction and retention strategies in Germany could significantly reduce overall churn rates.
Furthermore, the relationship between credit card ownership and churn indicates that promoting credit card products could be a strategic move to retain customers. The consistent churn rate across various tenure lengths also suggests that early intervention strategies could be crucial in retaining customers.
In conclusion, this dashboard serves as a valuable tool for understanding and addressing customer churn, offering actionable insights to improve customer retention and enhance overall bank performance.












