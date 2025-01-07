USE sakila;

-- Bài Tập 1:
-- Chúng ta áp dụng các hàm SUM, COUNT, AVG, MIN, MAX vào các ví dụ sau. Yêu cầu sử dụng các bảng trong database sakila:

-- Tính số lượng bản ghi ở bảng actor
SELECT COUNT(*) FROM actor;

-- Xác định thời lượng dài nhất và ngắn nhất của các bộ phim trong bảng film
SELECT MIN(length) AS MinLength, MAX(length) AS MaxLength FROM film;

-- Có bao nhiêu bộ phim có rating = R ?
SELECT COUNT(*) FROM film WHERE rating = 'R';

-- Trung bình rental_rate của các bộ phim dài hơn 60 phút ?
SELECT AVG(rental_rate) FROM film WHERE length > 60;

-- Bài Tập 2:
-- Khi sử dụng hàm COUNT trong MySQL, nó trả về gì?
-- b) Số lượng hàng trong kết quả truy vấn

-- Để tính giá trị trung bình của một cột trong MySQL, bạn sử dụng hàm nào?
-- c) AVG

-- Hàm MAX trong MySQL được sử dụng để làm gì?
-- c) Trả về giá trị lớn nhất trong cột

-- Khi bạn muốn tìm giá trị nhỏ nhất trong một cột cụ thể trong MySQL, bạn sử dụng hàm nào?
-- d) MIN

-- Hàm SUM trong MySQL thường được sử dụng để tính tổng của các giá trị trong cột nào?
-- a) Cột chứa các giá trị số nguyên