/*
CRUD products for a particular vendor
*/
-- Creating (insert) values into userAccounts
insert into users (userID) VALUES('Garfield', 'lasagna23@gmail.com', 12983);
insert into useraccounts VALUES (8000, 'admin');

-- Reading the table
SELECT * from users join useraccounts using(userID);

-- Updating the cart of 3005
UPDATE userAccounts
SET account = 'vendor'
WHERE userID = 8000;

-- Deleting a cart
DELETE FROM userAccounts WHERE userID = 8000;

-- Changing products of Goldstein to be sold by Shenk

UPDATE productvendors
SET PID = 2000, userID = 1008
WHERE userID = 1007;
select * from productvendors;
/*
Filter products-
By Color
By Size
By availability
*/
select * from products
join colors using(pid)
join sizes using(pid)
where title = 'gurgle_pot' 
and quantity > 0 -- for availability.
and color = 'red';

/*
CRUD functions for cart
*/
select * from cart;
-- Creating (insert) into cart
insert into cart VALUES ('XL', 'Gray', 3005);

-- Reading the table
SELECT * from cart;

-- Updating the cart of 3005
UPDATE cart
SET color = 'Black', cartID = 3006
WHERE cartID = 3005;

-- Deleting a cart
DELETE FROM cart WHERE cartID = 3006;

/*
CRUD functions for wish list
*/
-- Creating wish_list

create table wish_list(
	pid int,
    wish varchar(255) DEFAULT 'MARKED'
);
insert into wish_list(pid)
VALUES(2000);

-- Reading the table
SELECT * from wish_list;

select * from wish_list join products using(pid); -- !!!! RUN THIS CODE AFTER ADDING FOREIGN KEY IN UPDATE !!!!

-- Updating wish list to be paired with product, then inserting item
ALTER TABLE wish_list
ADD FOREIGN KEY(pid) REFERENCES products(pid);

UPDATE wish_list SET pid = 2001 WHERE pid = 2000; 

-- Deleting wish_list
DELETE FROM wish_list WHERE pid = 2001;

-- Creating (inserting) into orders
INSERT INTO orders VALUES(1007, '2009-05-12', 'pending');

INSERT INTO order_purchases VALUES(1007, 2003);

-- Reading orders
select * from orders join order_purchases using(orderID);

select sum(price) from orders
join order_purchases
using(orderID)
join products
using(pid)
where orderID = 1007;

-- Updating orders
UPDATE orders SET status = 'shipped' WHERE orderID = 1007;

-- Deleting orders
DELETE FROM order_purchases where orderID = 1007;
DELETE FROM Orders where orderID = 1007;

-- Create (insert) into review
insert into review()
VALUES	(1004, 6.8, 'It\'s okay, I guess.', '2023-04-12')
		;
insert into reviewImages()
VALUES	(1004, 
'https://www.eurway.com/resize/Shared/images/catalog_images/extra_035515si.jpg?bw=595&bh=595');

-- Read reviews
select * from review 
join reviewImages 
using(reviewID)
where image =
'https://www.eurway.com/resize/Shared/images/catalog_images/extra_035515si.jpg?bw=595&bh=595';

select * from review 
join reviewImages 
using(reviewID)
join users
where reviewID = userID
and name = 'Chuck';

select * from review 
join reviewImages 
using(reviewID)
where date = '2023-03-03';

select * from review 
join reviewImages 
using(reviewID)
where rating = 10.0;

-- Update review (image)
UPDATE reviewImages 
SET image = 
'https://www.eurway.com/resize/Shared/Images/Product/Gurgle-Pot/gurgle-pot-lavender.jpg?bw=595&bh=595' 
WHERE reviewID = 1004;

-- Delete review (image)
DELETE FROM reviewimages WHERE reviewID = 1004;

-- Create (insert) into returns
INSERT INTO returns VALUES
(1005, '2010-09-02', 'Not my style.', 'Read title.', 'pending');

INSERT INTO returnImages VALUES
(1005, 
'https://www.eurway.com/resize/Shared/Images/Product/Denmark-50-Glass-Desk/denmark-50-inch-clear-bent-glass-desk.jpg?bw=595&bh=595');

-- Read returns
select * from returns join returnImages using(rid);

-- Updating returns
UPDATE returns SET status = 'handed to delivery partner' WHERE rid = 1005;

-- Deleting from returns (image)
DELETE FROM returnImages WHERE image = 
'https://www.eurway.com/resize/Shared/Images/Product/Denmark-50-Glass-Desk/denmark-50-inch-clear-bent-glass-desk.jpg?bw=595&bh=595';

-- Chat
select * from chat;

insert into chat VALUES
(1008, 'Eh....', null);

insert into chat values
(1002, 'Hi, I like the design of this!', 'https://www.eurway.com/resize/Shared/images/catalog_images/extra_035515si.jpg?bw=595&bh=595');

insert into chat_response VALUES
(1008, 1000, 'Huh? What are you on about? Don\'t waste my time.', null);

insert into chat_response values
(1005, 1007, 'Hi Dante, I did not make that. It looks nice, though.', null);

select name, userID, messageID, account 
from users 
join useraccounts
using(userID)
join chat 
where userID = messageID;

select * from chat join chat_response using(messageID);

delete from chat_response where messageID = 1008;
delete from chat where messageID = 1008;

select * from chat 
join chat_response 
using(messageID)
join useraccounts
where userID = 1005 and userID = 1007 