USE coffee_store;

-- 1. Từ bảng customers, chọn tên và số điện thoại của tất cả khách hàng nữ có họ là Bluth.
SELECT first_name, phone_number
FROM customers
WHERE gender = 'F' AND last_name = 'Bluth';

-- 2. Từ bảng products, chọn tên của tất cả sản phẩm có giá lớn hơn 3.00 hoặc xuất xứ cà phê từ Sri Lanka.
SELECT name
FROM products
WHERE price > 3.00 OR coffee_origin = 'Sri Lanka';

-- 3. Đếm số lượng khách hàng nam không có số điện thoại trong bảng customers.
SELECT COUNT(*) AS male_no_phone
FROM customers
WHERE gender = 'M' AND (phone_number IS NULL OR phone_number = '');

-- 4. Từ bảng products, chọn tên và giá của tất cả sản phẩm có xuất xứ từ Colombia hoặc Indonesia, sắp xếp tên từ A-Z.
SELECT name, price
FROM products
WHERE coffee_origin IN ('Colombia', 'Indonesia')
ORDER BY name ASC;

-- 5. Từ bảng orders, chọn tất cả đơn hàng từ tháng 2 năm 2017 của khách hàng có id là 2, 4, 6 hoặc 8.
SELECT *
FROM orders
WHERE customer_id IN (2, 4, 6, 8)
  AND order_time BETWEEN '2017-02-01 00:00:00' AND '2017-02-28 23:59:59';

-- 6. Từ bảng customers, chọn tên và số điện thoại của tất cả khách hàng có họ chứa chuỗi 'ar'.
SELECT first_name, phone_number
FROM customers
WHERE last_name LIKE '%ar%';

-- 7. Từ bảng customers, chọn họ không trùng lặp và sắp xếp theo thứ tự A-Z.
SELECT DISTINCT last_name
FROM customers
ORDER BY last_name ASC;

-- 8. Từ bảng orders, chọn 3 đơn hàng đầu tiên được đặt bởi khách hàng có id là 1 trong tháng 2 năm 2017.
SELECT *
FROM orders
WHERE customer_id = 1
  AND order_time BETWEEN '2017-02-01 00:00:00' AND '2017-02-28 23:59:59'
ORDER BY order_time ASC
LIMIT 3;

-- 9. Từ bảng products, chọn tên, giá và xuất xứ cà phê, nhưng đổi tên cột giá thành retail_price.
SELECT name, price AS retail_price, coffee_origin
FROM products;

-- 10. Chọn id đơn hàng và số điện thoại khách hàng cho tất cả đơn hàng của sản phẩm có id là 4.
SELECT orders.id AS order_id, customers.phone_number
FROM orders
JOIN customers ON orders.customer_id = customers.id
WHERE orders.product_id = 4;

-- 11. Chọn tên sản phẩm và thời gian đặt hàng cho cà phê "filter" được bán từ ngày 15 tháng 1 năm 2017 đến ngày 14 tháng 2 năm 2017.
SELECT products.name AS product_name, orders.order_time
FROM orders
JOIN products ON orders.product_id = products.id
WHERE products.name LIKE '%filter%'
  AND orders.order_time BETWEEN '2017-01-15 00:00:00' AND '2017-02-14 23:59:59';

-- 12. Chọn tên sản phẩm, giá và thời gian đặt hàng cho tất cả đơn hàng của khách hàng nữ trong tháng 1 năm 2017.
SELECT products.name AS product_name, products.price, orders.order_time
FROM orders
JOIN products ON orders.product_id = products.id
JOIN customers ON orders.customer_id = customers.id
WHERE customers.gender = 'F'
  AND orders.order_time BETWEEN '2017-01-01 00:00:00' AND '2017-01-31 23:59:59';







