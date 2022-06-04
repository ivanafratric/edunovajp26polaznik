# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\38591\Documents\GitHub\Vjezbanje\database.sql

select * from products;

select * from products order by productLine desc, productName;

select * from products order by 3 desc, 2;

select sum(buyPrice), min(buyPrice), max(buyPrice), 
avg(buyPrice), count(buyPrice) from products where productLine = 'Vintage Cars';

select productLine, sum(buyPrice), min(buyPrice), max(buyPrice),
avg (buyPrice), count(buyPrice) from products where productLine like '%i%'
group by productLine having avg(buyPrice)>47
order by 5 desc limit 1;

select distinct orderNumber from orderdetails limit 1,7;

select * from offices;

insert into offices (officeCode, city, phone, addressLine1, country, postalCode, territory)
values (8, 'Osijek', '+385 31 225-500', 'Jegerova 9', 'Hrvatska', '31000', 'Europa');

update products set buyPrice=10 where productName not like '%i%';

select sum(2) from products where buyPrice =10;

select * from employees;

insert into employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
values (1, 'Fratric', 'Ivana', '25', 'ivana.fratric1@gmail.com', 4, null, 'sef');

delete from orderdetails where productCode in (select productCode from products where productLine = 'planes');

delete from products where productLine = 'planes';

select a.productName, a.buyPrice 
from products a inner join orderdetails b on a.productCode = b.productCode 
inner join orders c on b.orderNumber = c.orderNumber 
inner join customers d on c.orderNumber = d.customerNumber
where d.city = 'Las Vegas';

update products a inner join orderdetails b on a.productCode = b.productCode 
inner join orders c on b.orderNumber = c.orderNumber 
inner join customers d on c.orderNumber = d.customerNumber
set a.buyPrice = a.buyPrice * 1.1
where d.city = 'Las Vegas';

create table zaobrisati
select distinct a.productCode
from products a inner join orderdetails b 
on a.productCode = b.productCode 
inner join orders c on c.orderNumber = b.orderNumber 
inner join customers d on c.customerNumber = d.customerNumber 
where d.city = 'Las Vegas' order by 1;

select * from zaobrisati;

delete from orderdetails where productCode in 
(select productCode from zaobrisati);

delete from products where productCode in 
(select productCode from zaobrisati);

drop table zaobrisati;

select * from employees where reportsTo = 1002;

select b.firstName, b.lastName 
from employees a inner join employees b on
a.employeeNumber = b.reportsTo 
where a.firstName = 'Diane' and a.lastName = 'Murphy';

select b.firstName, b.lastName 
from offices a inner join employees b on a.officeCode = b.officeCode 
where a.city = 'Tokyo';

alter table products add aktivan boolean;

select productName, 'Ana' from products
union
select firstName, lastName from employees;