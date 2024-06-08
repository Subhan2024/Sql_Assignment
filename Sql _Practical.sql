create database add_to_Cart;

use add_to_cart;

create table Products(
Id int primary key identity(1,1),
Name varchar(200),
Description varchar(200),
Price  float,
Quantity int
);

select * from Products;

insert into Products(Name , Description , Price , Quantity) values('Duster' , 'Good-Duster' , 500 , 10),
('Perfume' , 'Nyc_Perfume' , 5000.00 , 30),
('Bats' , 'Nyc_Bat' , 8000.00 , 50),
('Bolls' , 'Good-bolls' , 300.00 , 100),
('Dell' , 'Good_Company' , 40000.00 , 30);

create Table Cart(
Id int primary key identity(1,1),
Quantity int,
Product_id int,
Status varchar(200)not null check(Status in('new','Cart' , 'Checkout' , 'Paid' , 'Complete' , 'Abandoned')),
foreign key(Product_id) references Products(Id)
);

select * from Cart;

insert into Cart(Quantity , Product_Id , Status) values(10 , 1 , 'new'),
(30 , 2 ,  'Paid'),
(50 , 3 , 'Complete'),
(100 , 4 ,  'Cart'),
(30 , 5 ,  'Abandoned');


Create Table Orders(
id int Primary key identity(1,1),
Cart_Id int,
Product_Id int,
foreign key(Product_id) references Products(Id),
foreign key(Cart_Id) references Cart(Id),
Quantity int
);

insert into Orders(Cart_Id , Product_Id , Quantity) values(2 , 1 , 20),
(3 , 2 , 30),
(4 , 3 , 40),
(5 , 4 , 50),
(6 , 5 , 70);

select * from Orders;
