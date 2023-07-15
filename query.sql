-- 1 total orders, total sales, total items, average order value
SELECT COUNT(DISTINCT order_id) AS total_orders,	   
	   SUM(quantity) AS total_items,
       SUM(quantity * price) AS total_sales,
       ROUND(SUM(quantity * price) / COUNT(DISTINCT order_id), 2) AS sale_per_order
FROM order_details o
LEFT JOIN pizzas p on o.pizza_id = p.id;

-- sale, # order by size
SELECT size,
	   COUNT(o.order_id) AS num_orders,
	   SUM(quantity * price) AS sales	
FROM order_details o
LEFT JOIN pizzas p on o.pizza_id = p.id
GROUP BY size;

-- orders, sales by category
SELECT category,
	   COUNT(DISTINCT o.order_id) AS num_orders,
	   SUM(quantity * price) AS sales
FROM order_details o
LEFT JOIN pizzas p ON o.pizza_id = p.id
LEFT JOIN recipes r ON p.type_id = r.id
GROUP BY category;

-- orders, sales by days of week
SELECT weekday, 
	   COUNT(DISTINCT od.order_id) AS num_orders,
	   SUM(quantity * price) AS sales
FROM order_details od
LEFT JOIN (SELECT id, DAYNAME(date) AS weekday FROM orders) o 
ON od.order_id = o.id
LEFT JOIN pizzas p on od.pizza_id = p.id
GROUP BY weekday;

-- orders, sales by hour
SELECT hour, 
	   COUNT(DISTINCT od.order_id) AS num_orders,
	   SUM(quantity * price) AS sales
FROM order_details od
LEFT JOIN (SELECT id, HOUR(time) AS hour FROM orders) o 
ON od.order_id = o.id
LEFT JOIN pizzas p on od.pizza_id = p.id
GROUP BY hour;

-- orders, sales by delivery/pick up
with order_tmp AS(
SELECT id,
	   CASE
			WHEN delivery = 1 THEN 'Delivery'
            ELSE 'Pick up'
	   END AS delivery
FROM orders
)
SELECT delivery,
	   COUNT(DISTINCT od.order_id) AS tot_orders,
       SUM(quantity * price) AS sales
FROM order_details od
LEFT JOIN order_tmp o ON od.order_id = o.id
LEFT JOIN pizzas p on od.pizza_id = p.id
GROUP BY delivery;

-- sales by delivery adress
SELECT full_address,
	   SUM(od.quantity * p.price) AS sales
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.id
LEFT JOIN pizzas p on od.pizza_id = p.id
LEFT JOIN (SELECT id, CONCAT_WS(',', address, city, 'ON', zipcode, "Canada") AS full_address FROM address) a 
ON o.address_id = a.id
WHERE o.delivery =1
GROUP BY full_address;

