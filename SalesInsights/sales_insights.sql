show tables;
select * from customers;
select * from markets;
select * from products;
select * from date;
select * from transactions;

select count(*) from transactions;
select count(*) from customers;

# all transactions in chennai
select * from transactions where market_code = "Mark001";

# all transactions in USD currency
select * from transactions where currency like "USD";

select sum(sales_amount) from transactions;
select sum(sales_qty) from transactions;

#all transactions in 2020
select * from transactions where year(order_date)="2020";

# total revenue in 2020
select sum(sales_amount) from transactions where year(order_date) = "2020";

select sum(sales_amount) from transactions where year(order_date) ="2020" and month(order_date)="1"
and  currency in ( "USD\r","INR\r") ;

select distinct currency from transactions;

# total revenue in 2019
select sum(sales_amount) from transactions where year(order_date) = "2019";
# revenue has decreased

#revenue in chennai in 2020
select sum(sales_amount) from transactions where market_code="Mark001" and year(order_date) ="2020";

select distinct(product_code) from transactions where market_code="Mark001" ;

select count(*) from transactions where sales_amount <=0;

select distinct(currency) from transactions;

select count(*) from transactions where currency = 'INR\r';
select count(*) from transactions where currency = 'INR';

select * from transactions where currency = 'USD\r' or currency = 'USD';

select product_code,sum(sales_amount) from transactions where year(order_date) = "2020" 
group by product_code order by sum(sales_amount)desc;

select c.custmer_name ,sum(tr.sales_amount) from transactions tr
inner join customers c on tr.customer_code =c.customer_code
where year(tr.order_date) = "2020" 
group by c.customer_code order by sum(tr.sales_amount)desc;
