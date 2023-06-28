create schema ECommerce;
Create table product_category (
id int Not null primary Key,
name varchar(200) null,
`desc` text null,
created_at timestamp ,
modified_at timestamp,
deleted_at timestamp
);

Create table product_inventory (
id int Not null primary Key,
quantity int,
created_at timestamp ,
modified_at timestamp,
deleted_at timestamp
);

Create table discount (
id int Not null primary Key,
name varchar(200) null,
`desc` text null,
discount_percent decimal,
active boolean,
created_at timestamp ,
modified_at timestamp,
deleted_at timestamp
);

Create table product (
id int Not null primary Key,
name varchar(200) null,
`desc` text null,
SKU varchar(500),
category_id int not null ,
inventory_id int,
price decimal,
discount_id int,
created_at timestamp ,
modified_at timestamp,
deleted_at timestamp,
CONSTRAINT fk_category_id foreign key(category_id) references product_category(id),
CONSTRAINT fk_inventory_id foreign key(inventory_id) references product_inventory(id),
CONSTRAINT fk_discount_id foreign key(discount_id) references discount(id)
);

Create table user (
id int Not null primary Key,
username varchar(200) null,
password text null,
firstname varchar(200) null,
lastname varchar(200) null,
telephone int,
created_at timestamp ,
modified_at timestamp
);
select * from user;
Insert into user (userName) values('PallaviSawale');
Create table shopping_session (
id int Not null primary Key,
user_id int not null,
total decimal,
created_at timestamp ,
modified_at timestamp,
CONSTRAINT fk_user_id foreign key(user_id) references user(id)
);

Create table cart_item (
id int Not null primary Key,
session_id int not null,
product_id int not null,
quantity int,
created_at timestamp ,
modified_at timestamp,
CONSTRAINT fk_session_id foreign key(session_id) references user(id),
CONSTRAINT fk_product_id foreign key(product_id) references product(id)
);

Create table user_address (
id int Not null primary Key,
user_id int not null,
adderess_line1 varchar(500),
adderess_line2 varchar(500),
city varchar(100),
postal_code varchar(200),
country varchar(100),
telephone varchar(500),
mobile varchar(50),
CONSTRAINT fk_user_id2 foreign key(user_id) references user(id)
);

Create table user_payment (
id int Not null primary Key,
user_id int not null,
payment_type varchar(50),
provider varchar(100),
account_no int,
expiry date,
CONSTRAINT fk_user_id3 foreign key(user_id) references user(id)
);

Create table payment_deatils (
id int Not null primary Key,
order_id int not null,
amount int,
provider varchar(500),
status varchar(100),
created_at timestamp ,
modified_at timestamp
);

Create table order_deatils (
id int Not null primary Key,
user_id int not null,
total decimal,
payment_id int,
created_at timestamp ,
modified_at timestamp,
CONSTRAINT fk_user_id4 foreign key(user_id) references user(id),
CONSTRAINT fk_payment_id foreign key(payment_id) references payment_deatils(id)
);

Create table order_items (
id int Not null primary Key,
order_id int not null,
product_id int,
quantity int,
created_at timestamp ,
modified_at timestamp,
CONSTRAINT fk_order_id foreign key(order_id) references order_deatils(id),
CONSTRAINT fk_product_id2 foreign key(product_id) references product(id)
);



