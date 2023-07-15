-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Orders` (
    `id` int  NOT NULL ,
    `date` date  NOT NULL ,
    `time` time  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `address_id` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Order_details` (
    `id` int  NOT NULL ,
    `order_id` int  NOT NULL ,
    `pizza_id` varchar(20)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Address` (
    `id` int  NOT NULL ,
    `address` varchar(200)  NULL ,
    `city` varchar(50)  NOT NULL ,
    `zipcode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Pizzas` (
    `id` varchar(20)  NOT NULL ,
    `type_id` varchar(20)  NOT NULL ,
    `size` varchar(10)  NOT NULL ,
    `price` decimal(5,2)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

CREATE TABLE `Recipes` (
    `id` varchar(20)  NOT NULL ,
    `name` varchar(50)  NOT NULL ,
    `category` varchar(20)  NOT NULL ,
    `ingredients` varchar(100)  NOT NULL ,
    PRIMARY KEY (
        `id`
    )
);

ALTER TABLE `Order_details` ADD CONSTRAINT `fk_Order_details_order_id` FOREIGN KEY(`order_id`)
REFERENCES `Orders` (`id`);

ALTER TABLE `Address` ADD CONSTRAINT `fk_Address_id` FOREIGN KEY(`id`)
REFERENCES `Orders` (`address_id`);

ALTER TABLE `Pizzas` ADD CONSTRAINT `fk_Pizzas_id` FOREIGN KEY(`id`)
REFERENCES `Order_details` (`pizza_id`);

ALTER TABLE `Recipes` ADD CONSTRAINT `fk_Recipes_id` FOREIGN KEY(`id`)
REFERENCES `Pizzas` (`type_id`);

