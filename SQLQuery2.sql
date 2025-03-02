--1.--	Total Number of Customers
select * from Customers
select * from OrderDetails
select * from Orders
select * from Products


select count(CustomerID) as num_of_cus from customers


--2.--	Total Number of Orders
select count(OrderID) as num_of_orders from orders

--3.	Total Revenue
select count(unitprice * quantity) as total_revenue from OrderDetails


--4.	Average Order Value
select avg(totalamount) as average_value from Orders

--5.	Total Number of Products
select count(productid)as num_of_products from Products
	
--6.	Total Products Sold
select count(productid) as total_products_sold from  products


--7.	Most Expensive Product
select top 1 price from Products 
order by Price desc

--8.	Least Expensive Product
select top 1 price from Products 
order by Price asc

--9.	Number of Orders Per Customer
select customerid ,count(Orderid) as num_of_orders  from orders
group by customerid


--10.	Total Stock Quantity
select sum(StockQuantity) as Total_Stock_Quantity from Products 


--11.	Products Out of Stock
select productid from products
where StockQuantity = 0


--12.	Total Orders in ‘2024-04-12’
select count(orderid) as Total_Orders from orders  
where orderdate ='2024-04-12'



--13.	Most Recent Order
select  top 1 orderdate as Most_recent_Order, orderid
from orders
order by orderdate desc 


select MONTH(Orderdate) from orders
--14.	Number of Orders by Month
select count(OrderID) As NumberOfOrders, MONTH(Orderdate)
from orders 
GROUP BY MONTH(Orderdate)
order by count(OrderID) desc


--15.	Find all products that cost less than $50 
select ProductId , ProductName,Price from Products
where Price < 50
order by productId

--16.	Best Selling Product (by quantity)
select top 1 StockQuantity , ProductId, ProductName
from products 
Order by StockQuantity desc


--17.	Find all products that are out of stock:
select productid,ProductName from products
where StockQuantity = 0

--18.	Number of Orders by Day of Week
select Count(orderId) as totalorders , DateName(WeekDay,Orderdate) as DayOfWeek
from orders 
group by DateName(WeekDay,Orderdate)
order by Count(orderId) 


--19.	Average Order Value by Custome
select customerid ,Avg(TotalAmount) from orders 
group by customerid
--20.	Products with Price Above Averag
select productid ,Avg(UnitPrice) from orderdetails where Unitprice > Avg(Unitprice)