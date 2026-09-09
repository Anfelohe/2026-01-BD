SELECT products.productname
FROM products
JOIN orderdetails
    ON products.productid = orderdetails.productid
JOIN orders
    ON orderdetails.orderid = orders.orderid
GROUP BY products.productid, products.productname
HAVING COUNT(DISTINCT orders.employeeid) = (
    SELECT COUNT(*)
    FROM employees )
ORDER BY products.productname;


SELECT customers.contactname
FROM customers
JOIN orders
    ON customers.customerid = orders.customerid
JOIN orderdetails
    ON orders.orderid = orderdetails.orderid
GROUP BY customers.customerid, customers.contactname
HAVING MAX(orderdetails.unitprice) < 50
ORDER BY customers.contactname;


SELECT DISTINCT employees.title, employees.firstname, employees.lastname
FROM employees
JOIN orders
    ON employees.employeeid = orders.employeeid
JOIN orderdetails
    ON orders.orderid = orderdetails.orderid
JOIN products
    ON orderdetails.productid = products.productid
WHERE products.productname IN ('Gravad lax', 'Mishi Kobe Niku')
ORDER BY employees.firstname, employees.lastname;


SELECT DISTINCT employees.firstname, employees.lastname, customers.contactname
FROM employees
JOIN orders
    ON employees.employeeid = orders.employeeid
JOIN customers
    ON orders.customerid = customers.customerid
JOIN shippers
    ON orders.shipvia = shippers.shipperid
WHERE shippers.companyname = 'Speedy Express'
  AND customers.city = 'Bruxelles'
ORDER BY employees.firstname, employees.lastname;


SELECT DISTINCT employees.firstname, employees.lastname, employees.address, 
                employees.city, employees.region
FROM employees
JOIN orders
    ON employees.employeeid = orders.employeeid
WHERE orders.shipcountry = 'Belgium'
ORDER BY employees.firstname, employees.lastname;