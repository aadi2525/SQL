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