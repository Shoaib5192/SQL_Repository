-- E-COMMERCE SALES ANALYSIS--

select * from SalesOrder

-- Q1 : Calculate the monthly sales of the store and identify which month had the highest sale 
--     and which month had the lowest sale?

select DATENAME(Month, [order date]) as Month,sum(Sales) as Tot_sale from SalesOrder
group by DATENAME(Month, [order date]) order by Tot_sale

--(select Month([order date]) as Month,sum(Sales) as Tot_sale from SalesOrder
--group by Month([order date]) order by Tot_sale)
--	select Year([order date]) as year,sum(Sales) as Tot_sale from SalesOrder
--	group by year([order date]) order by Tot_sale

--Heighest Sale
select top 1 DATENAME(Month, [order date]) as Month,sum(Sales) as Tot_sale from SalesOrder
group by DATENAME(Month, [order date]) order by Tot_sale desc

--Lowest Sale
select top 1 DATENAME(Month, [order date]) as Month,sum(Sales) as Tot_sale from SalesOrder
group by DATENAME(Month, [order date]) order by Tot_sale asc

--Q2 : Analyze Sales based on product categories and determine which category has the lowest Sales 
--     and which category has the highest Sales?
 select Category,sum(sales) as Tot_Sale from SalesOrder
 group by Category

 -- Q3 : Sales Analysis need to be done based on sub-categories?
 select [Sub-Category], sum(sales) as Tot_sale from SalesOrder
 group by [Sub-Category] order by [Sub-Category] asc

 --Q4 : Analyze the monthly profit from sales and determine which month had the highest profit?
 select datename(month, [Order Date]) as Month, SUM(Profit) as Tot_Profit from SalesOrder
 group by datename(month,[Order Date]) order by Tot_Profit desc

 --Highest Profit
 select top 1 datename(month, [Order Date]) as Month, SUM(Profit) as Tot_Profit from SalesOrder
 group by datename(month,[Order Date]) order by Tot_Profit desc

 -- Q5 : Analyze the Profit by Category and Sub-Category.
 select Category,[Sub-Category],SUM(Profit) as Profit_Category from SalesOrder
 group by Category,[Sub-Category] order by Profit_Category

 -- Profit by Category
 select Category,SUM(Profit) as Profit_Category from SalesOrder
 group by Category order by Profit_Category

 -- Profit by Sub-Category
 select [Sub-Category],SUM(Profit) as Profit_Category from SalesOrder
 group by [Sub-Category] order by Profit_Category

 -- Q6 : Analyze the Sales and profit by Customer Segment?
 select Segment, SUM(sales) as tot_sale, sum(profit) as tot_profit from SalesOrder
 group by Segment order by tot_sale, tot_profit

 --Q7 : Analyze the sales to profit ratio?
 select segment,(SUM(sales)/SUM(profit)) as profit_ratio from SalesOrder
 group by Segment


