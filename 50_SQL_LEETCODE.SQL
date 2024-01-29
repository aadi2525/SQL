select product_id from Products
where low_fats = 'Y' and  recyclable = 'Y'


select name from Customer
where referee_id is null or referee_id != 2



# Write your MySQL query statement below
select name ,population,area from World
where area>= 3000000 OR population >=25000000

# Write your MySQL query statement below
select distinct author_id as id from Views
where author_id =  viewer_id
order by id

# Write your MySQL query statement below
select tweet_id from Tweets
where length(content) >15;

# Write your MySQL query statement below
select EmployeeUNI.unique_id, Employees.name  from Employees left join  EmployeeUNI 
on EmployeeUNI.id = Employees.id

# Write your MySQL query statement below
select Product.product_name, Sales.year,Sales.price from Sales left join Product
on Sales.product_id  = Product.product_id 


# Write your MySQL query statement below
select V.customer_id , count(V.visit_id)  as count_no_trans
 from Visits  V left join Transactions t 
on V.visit_id = t.visit_id 
where t.transaction_id is null
group by V.customer_id;


# Write your MySQL query statement below
select  W1.id from Weather W1,  Weather W2
where DATEDIFF(W1.recordDate, W2.recordDate)=1 AND W1.temperature > W2.temperature;

