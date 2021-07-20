## Tasks
1. Get all customers and their addresses.
SELECT *
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;
2. Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, "orders".order_date, "line_items".quantity, "products".description
FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "line_items".product_id = "products".id;

3. Which warehouses have cheetos?
SELECT "products".description, "warehouse".warehouse
FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'cheetos';

4. Which warehouses have diet pepsi?
SELECT "products".description, "warehouse".warehouse
FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".description = 'diet pepsi';
5. Get the number of orders for each customer. 
NOTE: It is OK if those without orders are not included in results.
SELECT count(*), CONCAT("customers".first_name, ' ', "customers".last_name) AS "customers_order"
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers_order";

-- Steve's approach. Looks 
SELECT count(*), "customers".first_name, "customers".last_name
FROM "orders"
JOIN "addresses" ON "orders".address_id = "addresses".id
JOIN "customers" ON "customers".id = "addresses".customer_id
GROUP BY "customers".id; --This one runs well because the names are
--in seperate colums.

6. How many customers do we have?
SELECT count(*)
FROM "customers";

7. How many products do we carry?
SELECT count(*)
FROM "products";

8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand), "products".description
FROM warehouse_product
JOIN products on products.id = warehouse_product.product_id
where products.description = 'diet pepsi'
GROUP BY "products".description;

## Stretch
9. How much was the total cost for each order?


10. How much has each customer spent in total?
11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).