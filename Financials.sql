Select *
From Portfolio.dbo.Financials

-- Total Sales, Profit, and COGS Summary
Select SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit,SUM(COGS) AS Total_COGS
From Portfolio.dbo.Financials

--Sales Trend overtime
Select [Year], Month_Number AS Month,  DATENAME(MONTH, DATEFROMPARTS([Year], Month_Number, 1)) AS Month_Name  ,SUM(Sales) AS Monthly_Sales
From Portfolio.dbo.Financials
Group by [Year], Month_Number
Order by [Year], Monthly_Sales Desc;

--Top Performing Countries by Profit
SELECT  Country,SUM(Profit) AS Total_Profit
From	Portfolio.dbo.Financials
Group by Country
Order by Total_Profit DESC;


--Sales and Profit by Product
Select		Product, SUM(Sales) AS Total_Sales,SUM(Profit) AS Total_Profit
From		Portfolio.dbo.Financials
Group by	Product
Order by	Total_Sales DESC;

--Segment-Wise Sales Performance
Select		Segment, SUM(Sales) AS Segment_Sales,SUM(Profit) AS Segment_Profit
From		Portfolio.dbo.Financials
Group by	Segment
Order by	Segment_Sales DESC;


--Discount Impact Analysis
Select      Discount_Band,COUNT(*) AS Transactions,AVG(Discounts) AS Avg_Discount,SUM(Sales) AS Total_Sales,SUM(Profit) AS Total_Profit
From		Portfolio.dbo.Financials
Group by	Discount_Band
Order by	Total_Profit DESC;


---Year on Year Growth
Select		[Year],  SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
From		Portfolio.dbo.Financials
Group by	[Year]
Order by	[Year];

--Product Profitability by country
Select     Country,Product,SUM(Profit) AS Total_Profit
From	   Portfolio.dbo.Financials
Group by   Country, Product
Order by   Country, Total_Profit DESC;


--Best Month to launch a product based on highest average profit
Select     Month_Name, AVG(Profit) AS Avg_Monthly_Profit
From	   Portfolio.dbo.Financials
Group by   Month_Name
Order by   Avg_Monthly_Profit DESC;

--Detecting Underperforming Products
Select		Product, SUM(Sales) AS Total_Sales,SUM(Profit) AS Total_Profit, (SUM(Profit) * 1.0 / NULLIF(SUM([Sales]), 0)) AS Profit_Margin
From	    Portfolio.dbo.Financials
Group by	Product
Order by	Profit_Margin ASC;
