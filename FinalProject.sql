create database eCommerce;
use ecommerce;

CREATE TABLE users (
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) ,
    userID INT(60) PRIMARY KEY AUTO_INCREMENT
);

ALTER TABLE users 
AUTO_INCREMENT = 1000;

desc cart;
desc cartproducts;
desc cartusers;
desc chat;
desc chat_response;
desc colors;
desc discounts;
desc images;
desc orders;
desc order_purchases;
desc products;
desc productvendors;
desc returnimages;
desc returns;
desc review;
desc reviewimages;
desc sizes;
desc useraccounts;
desc users;


create table userAccounts(
	userID int(60) NOT NULL AUTO_INCREMENT,
    account varchar(255) NOT NULL, -- admins, vendors, customers
	FOREIGN KEY (userID) REFERENCES users(userID)   
);

ALTER TABLE userAccounts
AUTO_INCREMENT = 1000;

-- The 2 users who will soon become admins (users)
insert into users (name, email, password)
VALUES	('Connor', 'Greeneggsandhamilton@icloud.com', 804538),
		('Brody',  'BrodminBobst28@gmail.com', 901111);

-- The 5 users who will soon become customers (users)
insert into users (name, email, password)
VALUES  ('Frank', 'fwest49@gmail.com', 882006),
        ('Chuck',  'road2fortun3@gmail.com', 9242010),
        ('Nick', 'nramos49@gmail.com', 11222013),
        ('Dante', 'tonyredgrave221@gmail.com', 8232001),
        ('Nero', 'd3adw3ight4@gmail.com', 1312008);

-- The 3 users who will soon become vendors (users)
insert into users (name, email, password)
VALUES 	('Goldstein', 'nellgoldstein23@gmail.com', '289100'),
		('Shenk', 'shenkshack41@gmail.com', 27456),
        ('Gure', 'tikiandnesty02@gmail.com', 05012002);

select * from users;

-- admins (userAccounts)
insert into userAccounts (account)
VALUES 	('admin'),
		('admin');
-- customers (userAccounts)        
insert into userAccounts (account)
VALUES 	('customer'),
		('customer'),
        ('customer'),
        ('customer'),
        ('customer');
-- vendors (userAccounts)
insert into userAccounts (account)
VALUES 	('vendor'),
		('vendor'),
        ('vendor');

select * from userAccounts
natural join users 
where userID = ANY
(select userID from users) order by userID;




create table products(
	price decimal(5, 2) NOT NULL,
    title varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    quantity int(60) NOT NULL,
    warranty varchar(255), -- MAKE THIS NULL IF THERE IS NO WARRANTY
    PID int NOT NULL PRIMARY KEY AUTO_INCREMENT
);

ALTER TABLE products
AUTO_INCREMENT = 2000;

-- inserting ten products, will be assigned to vendors
insert into products (price, title, description, quantity, warranty)
VALUES
(12.99, 'mid-back office chair', 'An office chair that comes in 3 different colors.', 6, null), -- PID 2000
(20.00, 'kirby_table_lamp', 'A table lamp that comes in 2 colors, blue or orange.', 28, null), -- PID 2001
(200.00, 'glass_desk', 'A glass desk that can come in small, medium, or large sizes.', 9, 'five years'), -- PID 2002
(60.00, 'bamboo_table_runner', 'A table runner made from bamboo. Simple and nice.', 8, null), -- PID 2003
(8.00, 'skinny_waste_can', 'A skinny waste can. Nothing special.', 16, null), -- PID 2004
(18.00, 'lattice_rectangular_placemat', 'A comfy placemat woven from translucent yarn sure to integrate charisma into any modern table.', 9, 'two months'), -- PID 2005
(269.00, 'mag_table_and_rack_combo', 'A combination of a magazine table and rack allows for easy storage and photogenic comfort.', 12, '2 years'), -- PID 2006
(44.00, 'gurgle_pot', 'A gurgle pot that induces pleasantry when pouring. Makes blurp sounds when pouring.', 7, null), -- PID 2007
(60.00, 'saucedo_bowl', 'A curved aluminum bowl that is great for accessorizing a dinner party or sprucing up your office reception area.', 14, null), -- PID 2008
(51.00, 'bullet_board', 'A metal board that can use either magnets or pushpins. Cool for offices!', 6, null) -- PID 2009
;

-- creating colors
create table colors(
	PID int,
	color ENUM
    ('Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'White', 'Gray', 'Black'),
    FOREIGN KEY (PID) REFERENCES products(PID)
);
insert into colors 
VALUES	(2000, 'Red'),
		(2000, 'White'),
        (2000, 'Black'),
        (2001, 'Blue'),
        (2002, null),
        (2003, 'Green'),
        (2003, 'Blue'),
        (2004, 'Gray'),
        (2004, 'White'),
        (2005, 'Gray'),
        (2006, 'Black'),
        (2006, 'White'),
        (2007, 'Violet'),
        (2007, 'Red'),
        (2007, 'Green'),
        (2008, null),
        (2009, null);

-- Creating a table of sizes
create table sizes(
	PID int,
    size ENUM
    ('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    FOREIGN KEY (PID) REFERENCES products(PID)
);
insert into sizes
VALUES	(2000, 'S'),
		(2000, 'M'),
        (2000, 'L'),
        (2001, null),
        (2002, 'M'),
        (2002, 'L'),
        (2003, 'S'),
        (2003, 'L'),
        (2004, null),
        (2005, null),
        (2006, 'S'),
        (2007, null),
        (2008, 'M'),
        (2009, 'M');

create table images(
    PID int,
	image varchar(255),
    FOREIGN KEY (PID) REFERENCES products(PID)
);
insert images()
VALUES
(2000, 'https://www.eurway.com/resize/Shared/Images/Product/Napoli-Low-Back-Office-Chair-Red/napoli-low-back-chair-red.jpg?bw=595&bh=595'),
(2000, 'https://www.eurway.com/resize/Shared/Images/Product/Napoli-Mid-Back-Office-Chair-White/napoli-mid-back-white-office-chair.jpg?bw=595&bh=595'),
(2000, 'https://www.eurway.com/resize/Shared/Images/Product/Napoli-Low-Back-Office-Chair-Black/napoli-low-back-chair-black.jpg?bw=595&bh=595'),
(2001, 'https://www.eurway.com/resize/Shared/Images/Product/Kirby-Table-Lamp-Aqua/kirby-table-lamp-aqua.jpg?bw=595&bh=595'),
(2001, 'https://www.eurway.com/resize/Shared/Images/Product/Kirby-Table-Lamp-Orange/kirby-table-lamp-orange.jpg?bw=595&bh=595'),
(2002, 'https://www.eurway.com/resize/Shared/Images/Product/Denmark-50-Glass-Desk/denmark-50-inch-clear-bent-glass-desk.jpg?bw=595&bh=595'),
(2003, 'https://www.eurway.com/resize/Shared/images/chilewich-bamboo-runner-spring-green.jpg?bw=595&bh=595'),
(2003, 'https://www.eurway.com/resize/Shared/images/chilewich-bamboo-runner-lapis.jpg?bw=595&bh=595'),
(2004, 'https://www.eurway.com/resize/Shared/Images/Product/Skinny-Waste-Can-Silver/skinny-can-silver.jpg?bw=595&bh=595'),
(2004, 'https://www.eurway.com/resize/Shared/Images/Product/Skinny-Waste-Can-Metallic-White/skinny-can-metallic-white.jpg?bw=595&bh=595'),
(2005, 'https://www.eurway.com/resize/Shared/Images/Product/Lattice-Rectangular-Placemat/lattice-placemat-silver.jpg?bw=595&bh=595'),
(2005, 'https://www.eurway.com/resize/Shared/Images/Product/Bamboo-Table-Runner/chilewich-bamboo-runner-cranberry-lifestyle.jpg?bw=595&bh=595'),
(2005, 'https://www.eurway.com/resize/Shared/Images/Product/Lattice-Rectangular-Placemat/latice-placemat-runner-silver-lifestyle.jpg?bw=595&bh=595'),
(2006, 'https://www.eurway.com/resize/Shared/Images/Product/Mag-Table-Magazine-Rack-Black/mag-table-black.jpg?bw=595&bh=595'),
(2006, 'https://www.eurway.com/resize/Shared/Images/Product/Mag-Table-Magazine-Rack-White/mag-table-white.jpg?bw=595&bh=595'),
(2007, 'https://www.eurway.com/resize/Shared/Images/Product/Gurgle-Pot/gurgle-pot-lavender.jpg?bw=595&bh=595'),
(2007, 'https://www.eurway.com/resize/Shared/images/gurgle-pot-bright-red.jpg?bw=595&bh=595'),
(2007, 'https://www.eurway.com/resize/Shared/images/gurgle-pot-kiwi.jpg?bw=595&bh=595'),
(2008, 'https://www.eurway.com/resize/Shared/Images/Product/Saucedo-Bowl/saucedo-decorative-bowl.jpg?bw=595&bh=595'),
(2009, 'https://www.eurway.com/resize/Shared/images/catalog_images/extra_035515si.jpg?bw=595&bh=595');

select * from images;

select * from users a1
natural join userAccounts a2
where a2.account LIKE ('%vendor%') and a1.userID = a2.userID;

create table productVendors(
	PID int,
    userID int,
    FOREIGN KEY (PID) REFERENCES products(PID),
    FOREIGN KEY (userID) REFERENCES users(userID)
);

insert into productVendors()
VALUES
	(2000, 1007),
    (2001, 1007),
    (2002, 1007),
    (2003, 1008),
    (2004, 1008),
    (2005, 1008),
    (2006, 1008),
    (2007, 1009),
    (2008, 1009),
    (2009, 1009);


select * from products 
join colors 
using (pid)
join sizes
using (pid)
join images
using (pid)
join productvendors
using (pid);
-- alternate select
select * from products
natural join colors
natural join sizes
natural join images
join productvendors
using (pid);

create table discounts(
	PID int NOT NULL,
    discount_amount decimal(5, 2),
    new_price decimal(5, 2) NOT NULL,
    timeTilExpire date,
    FOREIGN KEY (PID) REFERENCES products(PID)
);

insert into discounts()
VALUES	
(2002, 0.50, (select price * discount_amount from products where discounts.pid = products.pid), '9999-01-01'),
(2006, 0.70, (select price * discount_amount from products where discounts.pid = products.pid), '9999-01-01'),
(2003, 0.25, (select price * discount_amount from products where discounts.pid = products.pid), null),
(2009, 0.30, (select price * discount_amount from products where discounts.pid = products.pid), null)
;

/* 
Updating prices from products 
using discount from table discounts WITHOUT using UPDATE statement
to preserve original price without adding a new column to products. 
*/
select * from products
join discounts
using(pid);


create table cart(
	size enum('XS', 'S', 'M', 'L', 'XL', 'XXL'),
    color enum('Red', 'Orange', 'Yellow', 'Green', 'Blue', 'Violet', 'White', 'Gray', 'Black'),
    cartID int PRIMARY KEY AUTO_INCREMENT
);

ALTER TABLE cart AUTO_INCREMENT = 3000;

insert into cart(size, color)
VALUES	('S', 'Green'),
		('L', 'Yellow'),
        ('L', 'Blue'),
        ('M', 'Red'),
        ('S', 'Blue');

select * from cart;

create table cartUsers(
	userID int UNIQUE,
    cartID int,
    FOREIGN KEY (cartID) REFERENCES cart(cartID),
    FOREIGN KEY (userID) REFERENCES users(userID)
);

select * from users join useraccounts using(userID) where account = 'customer';

insert into cartUsers(userID, cartID)
VALUES	(1002, 3000),
		(1003, 3001),
        (1004, 3002),
        (1005, 3003),
        (1006, 3004);

create table cartProducts(
	cartID int, 
    PID int,
    FOREIGN KEY (cartID) REFERENCES cartUsers(cartID), 
    FOREIGN KEY (PID) REFERENCES products(PID)
);

-- items added into 3 customer accounts
insert into cartProducts(cartID, PID)
VALUES	(3001, 2000),
		(3001, 2001),
        (3001, 2009),
        (3003, 2007),
        (3003, 2006),
        (3004, 2008),
        (3004, 2003);

select * from cart 
join cartUsers 
using(cartID)
join cartProducts
using(cartID)
join users 
using(userID)
join useraccounts
using(userID)
join products
using(pid);

create table orders(
	orderID int PRIMARY KEY,
    date date,
    status enum('pending', 'confirm', 'handed to delivery partner', 'shipped'),
    FOREIGN KEY (orderID) REFERENCES users(userID)
);

insert into orders(orderID, date, status)
VALUES	(1003, '2004-05-29', 'shipped'),
		(1006, '2008-08-24', 'shipped'),
        (1005, '2016-03-03', 'shipped'),
        (1002, '2023-02-25', 'handed to delivery partner'),
        (1004, '2023-03-03', 'pending'),
        (1001, '2023-03-01', 'confirm'),
        (1000, '2023-04-02', 'confirm')
		;

select pid, price, title from products;

select * from orders
natural join users 
where orderID = userID;

create table order_purchases(
	orderID int,
    pid int,
    FOREIGN KEY(orderID) REFERENCES orders(orderID),
    FOREIGN KEY(pid) REFERENCES products(pid)
);

insert into order_purchases()
VALUES	(1003, 2000),
		(1003, 2000),
        (1005, 2005),
        (1002, 2007),
        (1004, 2009),
        (1001, 2006),
        (1000, 2005);


select sum(price) from orders
join order_purchases
using(orderID)
join products
using(pid)
where orderID = 1003;

select * from orders where status = 'shipped';

create table review(
	reviewID int(255) PRIMARY KEY,
    rating decimal(5, 1),
	description varchar(255),
    date date,
    FOREIGN KEY(reviewID) REFERENCES orders(orderID)
);

insert into review (reviewID, rating, description, date)
VALUES
(1003, 6.5, 'The chair does not feel comfortable to my standards.', '2023-03-03'),
(1005, 10, 'This gurgle pot is great! Wears a little, but still great!', '2023-03-03'),
(1006, 8.0, 'The bullet board isn\'t perfect, but it works decently.', '2023-03-03');

create table reviewImages(
	reviewID int(255),
    image varchar(255),
    FOREIGN KEY (reviewID) REFERENCES review(reviewID)
);

insert into reviewImages
VALUES
(1003, 'https://www.eurway.com/resize/Shared/Images/Product/Napoli-Mid-Back-Office-Chair-White/napoli-mid-back-white-office-chair.jpg?bw=595&bh=595'),
(1005, 'https://www.eurway.com/resize/Shared/Images/Product/Gurgle-Pot/gurgle-pot-lavender.jpg?bw=595&bh=595'),
(1006, 'https://www.eurway.com/resize/Shared/images/catalog_images/extra_035515si.jpg?bw=595&bh=595');

select * from review 
join reviewImages 
using(reviewID)
join users
where reviewID = userID;


create table returns(
	rid int PRIMARY KEY AUTO_INCREMENT,
    date varchar(255),
    title varchar(255),
    description varchar(255),
    status enum('pending', 'confirm', 'handed to delivery partner', 'shipped'),
    FOREIGN KEY(rid) REFERENCES users(userID)
);

ALTER TABLE returns AUTO_INCREMENT = 1000;

select * from users;

insert into returns()
VALUES
	(1000, 
    '2009-02-16', 
    'Bullet board is hard to set-up.',
    'I have no idea how to set this board up.',
    'shipped');

create table returnImages(
	rid int PRIMARY KEY AUTO_INCREMENT,
    image varchar(255),
    FOREIGN KEY (rid) references returns(rid)
);

insert into returnImages()
VALUES (1000, 
'https://www.eurway.com/resize/Shared/images/catalog_images/extra_035515si.jpg?bw=595&bh=595');

select * from returns 
join returnImages
using(rid);

select * from users;

create table chat(
	messageID int PRIMARY KEY ,
    text varchar(255),
    image varchar(255),
    FOREIGN KEY(messageID) REFERENCES users(userID)
);

INSERT INTO chat()
VALUES
(1005, 'This gurgle pot is amazing!', 
'https://www.eurway.com/resize/Shared/Images/Product/Gurgle-Pot/gurgle-pot-lavender.jpg?bw=595&bh=595'),

(1002, null, null),

(1000, 'Do you know how I can hang this up?',
'https://www.eurway.com/resize/Shared/images/catalog_images/extra_035515si.jpg?bw=595&bh=595'),

(1007, 'Hey, let\'s meet up after I\'m done shopping and talk business.', null);

create table chat_response(
	messageID int,
	replyID int,
    reply varchar(255),
    image varchar(255),
    FOREIGN KEY(messageID) REFERENCES chat(messageID),
    FOREIGN KEY(replyID) REFERENCES users(userID)
);

select * from users join useraccounts using(userID);

INSERT INTO chat_response()
VALUES
(1005, 1006, 'I agree. It\'s so practical but fun when it pours!', null),
(1002, 1003, 'Hey Frank, you can\'t just send me nothing and expect to get an answer from me. -Chuck', null),
(1000, 1001, 'Hello Connor, I have no idea how it even works. Good luck!', null),
(1007, 1009, 'Got it. I have a new business idea that needs to be kept secret.', null);

select * from chat
join chat_response 
using(messageID);