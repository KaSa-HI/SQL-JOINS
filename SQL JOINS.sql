/* joins: select all the computers from the products table: 
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS product, categories.Name AS category FROM products
LEFT JOIN categories ON products.CategoryID = categories.CategoryID
WHERE products.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT name, price, rating FROM products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, LastName, sum(quantity) FROM sales
JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY sum(quantity) desc;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS 'Department Name', categories.Name AS 'Category Subject ' FROM departments
JOIN categories ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */ 
 SELECT name, sum(quantity), sum(quantity * priceperunit) FROM sales
 JOIN  products ON products.ProductID = sales.ProductID
 WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT  name AS 'Product Name', reviews.Comment, Rating, reviewer FROM products
JOIN reviews ON reviews.ProductID = products.ProductID
WHERE name = 'Visio TV'
ORDER BY rating 
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

 -- SELECT * FROM sales
 SELECT employees.EmployeeID, FirstName, LastName, name AS 'Product Name', sum(Quantity) AS '# Sold' FROM sales
 JOIN  products ON products.ProductID = sales.ProductID
 JOIN  employees ON employees.EmployeeID = sales.EmployeeID
 GROUP BY sales.ProductID
 ORDER BY sum(Quantity) DESC;

