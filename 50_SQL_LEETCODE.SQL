-- 1
select product_id from Products
where low_fats = 'Y' and  recyclable = 'Y'


select name from Customer
where referee_id is null or referee_id != 2


-- 2
# Write your MySQL query statement below
select name ,population,area from World
where area>= 3000000 OR population >=25000000

-- 3
# Write your MySQL query statement below
select distinct author_id as id from Views
where author_id =  viewer_id
order by id

-- 4
# Write your MySQL query statement below
select tweet_id from Tweets
where length(content) >15;

-- 5
# Write your MySQL query statement below
select EmployeeUNI.unique_id, Employees.name  from Employees left join  EmployeeUNI 
on EmployeeUNI.id = Employees.id

-- 6
# Write your MySQL query statement below
select Product.product_name, Sales.year,Sales.price from Sales left join Product
on Sales.product_id  = Product.product_id 

-- 7
# Write your MySQL query statement below
select V.customer_id , count(V.visit_id)  as count_no_trans
 from Visits  V left join Transactions t 
on V.visit_id = t.visit_id 
where t.transaction_id is null
group by V.customer_id;

-- 8
# Write your MySQL query statement below
select  W1.id from Weather W1,  Weather W2
where DATEDIFF(W1.recordDate, W2.recordDate)=1 AND W1.temperature > W2.temperature;

# Write your MySQL query statement below
select Employee.name , Bonus.bonus  from Employee left join Bonus on 
 Bonus.empId = Employee.empId 
where bonus<1000 or Bonus is null;


# Write your MySQL query statement below
select s.student_id,s.student_name,sb.subject_name,ifnull(count(e.student_id),0) attended_exams 
from Students s cross join Subjects sb 
left join Examinations e on 
e.student_id = s.student_id  and  e.subject_name=sb.subject_name
group by s.student_id,s.student_name,sb.subject_name
order by s.student_id, sb.subject_name;



# Write your MySQL query statement below
select name
from Employee
where id in
(
select managerId 
from Employee
group by managerId
having count(id)>=5)


# Write your MySQL query statement below
select s.user_id, case when c.time_stamp is null 
then 0.00 else
round(sum(action= "confirmed")/count(*),2) 
end
as confirmation_rate 

from Signups s left join Confirmations c
on s.user_id = c.user_id
group by s.user_id



# Write your MySQL query statement below
select * from  Cinema
where id%2 = 1 and description!="boring"
order by rating desc



# Write your MySQL query statement below
select p.product_id , ifnull(round(sum(price*units)/sum(units),2),0)  average_price
from Prices p left  join UnitsSold us 
on p.product_id = us.product_id
and us.purchase_date between p.start_date and p.end_date
group by p.product_id;

# Write your MySQL query statement below
select a1.machine_id, round(avg(a2.timestamp - a1.timestamp),3)as processing_time
from activity a1 left join activity a2
on a1.machine_id=a2.machine_id and a1.process_id = a2.process_id and a1.timestamp<a2.timestamp
group by a1.machine_id

# Write your MySQL query statement below
select contest_id,round(count(distinct user_id) / (select count(user_id) from users)*100,2) as percentage
from register
group by contest_id
order by percentage desc ,contest_id

# Write your MySQL query statement below
select query_name,
round (sum(rating/position)/ count(query_name) ,2) as quality,
round ((sum(case when rating < 3 then 1 else 0 end) / count(query_name)) * 100 ,2) as poor_query_percentage
from queries
WHERE query_name is not null
group by query_name

# Write your MySQL query statement below
select  substr(trans_date,1,7)  as month, country , count(id) as trans_count,
sum(case when state = "approved" then 1 else 0 end) as approved_count,sum(amount)
as trans_total_amount,sum(case when state= 'approved' then amount else 0 END) as approved_total_amount

from  Transactions
group by month ,country

-- 1174. Immediate Food Delivery II
# Write your MySQL query statement below
select round(sum(if(order_date = customer_pref_delivery_date , 1,0))*100/count(distinct customer_id ),2)
as immediate_percentage
from Delivery
where (customer_id , order_date) in 
(select customer_id , min(order_date) 
from Delivery
group by customer_id)


-- 1729. Find Followers Count
# Write your MySQL query statement below
select distinct user_id,count(follower_id) as followers_count
from Followers
group by user_id ,asc
order by  user_id asc

-- 619. Biggest Single Number
# Write your MySQL query statement below
select max(num) as num
from(
 select num
from MyNumbers
group by  num
having count(num)=1
)as unique_num;

-- 1045. Customers Who Bought All Products
# Write your MySQL query statement below

SELECT  customer_id FROM Customer GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(product_key) FROM Product)



-- 1731. The Number of Employees Which Report to Each Employee
# Write your MySQL query statement below
select e1.employee_id,e1.name,count(e2.reports_to) as reports_count,round(avg(e2.age)) as average_age
from employees e1 inner join employees e2 on 
e1.employee_id = e2.reports_to
group by e1.employee_id
order by e1.employee_id

-- 1070. Product Sales Analysis III
# Write your MySQL query statement below
select product_id, year AS first_year, quantity, price
from sales
where (product_id, year) in (
    select product_id,min(year)
    from sales
    group by product_id
)
