USE test;

-- 1. Lấy danh sách các quốc gia duy nhất
SELECT DISTINCT country
FROM Person;

-- 2. Sắp xếp danh sách người theo tên đầy đủ (fullname) theo thứ tự tăng dần
SELECT *
FROM Person
ORDER BY fullname ASC;

-- 3. Sắp xếp danh sách người theo nghề nghiệp (job) theo thứ tự giảm dần
SELECT *
FROM Person
ORDER BY job DESC;

-- 4. Lấy danh sách các nghề nghiệp (job) duy nhất mà người trong bảng đang làm
SELECT DISTINCT job
FROM Person;

-- 5. Đếm số người theo từng quốc gia và sắp xếp theo số lượng người giảm dần
SELECT country, COUNT(*) AS total_people
FROM Person
GROUP BY country
ORDER BY total_people DESC;

-- 6. Tính tổng lương (salary) của tất cả người trong bảng
SELECT SUM(salary) AS total_salary
FROM Person;

-- 7. Tính tổng lương trung bình của người theo từng nghề nghiệp (job) và sắp xếp theo lương trung bình tăng dần
SELECT job, AVG(salary) AS average_salary
FROM Person
GROUP BY job
ORDER BY average_salary ASC;

-- 8. Lấy ra người có lương (salary) lớn hơn 50000 và ngày sinh (birthday) nằm trong khoảng ‘1990-01-01’ đến ‘1995-12-31’
SELECT *
FROM Person
WHERE salary > 50000
  AND birthday BETWEEN '1990-01-01' AND '1995-12-31';

-- 9. Lấy ra người có lương (salary) lớn hơn 60000 và nghề nghiệp (job) là ‘Developer’ hoặc ‘Engineer’
SELECT *
FROM Person
WHERE salary > 60000
  AND job IN ('Developer', 'Engineer');

-- 10. Lấy ra danh sách các nghề nghiệp (job) duy nhất mà có ít nhất 3 người làm
SELECT job
FROM Person
GROUP BY job
HAVING COUNT(*) >= 3;

-- 11. Lấy ra người nam (gender = ‘Male’) có lương (salary) cao nhất
SELECT *
FROM Person
WHERE gender = 'M'
  AND salary = (SELECT MAX(salary) FROM Person WHERE gender = 'M');

-- 12. Lấy ra người nữ (gender = ‘Female’) có lương (salary) thấp nhất
SELECT *
FROM Person
WHERE gender = 'F'
  AND salary = (SELECT MIN(salary) FROM Person WHERE gender = 'F');

-- 13. Lấy danh sách người (không trùng lặp) theo thứ tự tên đầy đủ tăng dần
SELECT DISTINCT fullname
FROM Person
ORDER BY fullname ASC;

-- 14. Đếm số người sinh vào các tháng khác nhau và sắp xếp theo thứ tự số lượng tăng dần
SELECT MONTH(birthday) AS birth_month, COUNT(*) AS total_people
FROM Person
GROUP BY MONTH(birthday)
ORDER BY total_people ASC;

-- 15. Tính tổng lương (salary) của tất cả người trong bảng
SELECT SUM(salary) AS total_salary
FROM Person;
