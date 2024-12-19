/*
--Бардык клиенттердин шаарлары уникалдуу чыксын
SELECT DISTINCT City FROM Customers;

--Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
SELECT * FROM Employees WHERE BirthDate BETWEEN 1950 AND 1960;

--Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT SupplierName, Country FROM Suppliers WHERE Country = 'France';

Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
SELECT CustomerName, Address, Country FROM Customers WHERE Country != 'Spain' AND CustomerName LIKE 'A%';

PostalCode бош болгон клиенттер чыксын
SELECT * FROM Customers WHERE PostalCode IS NULL OR PostalCode = '';

Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT * FROM Customers WHERE City = 'London' LIMIT 2;

Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
SELECT FirstName, BirthDate FROM Employees WHERE LENGTH(LastName) = 4;

Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
SELECT Country, COUNT(*) AS SupplierCount FROM Suppliers GROUP BY Country;

Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT Country, COUNT(*) AS SupplierCount FROM Suppliers GROUP BY Country HAVING COUNT(*) = 1 ORDER BY Country ASC;

Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
SELECT CategoryID, SUM(Price) AS TotalPrice FROM Products GROUP BY CategoryID;

6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT ProductName, Price FROM Products WHERE CategoryID IN (6, 8) ORDER BY Price ASC LIMIT 1;

Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT p.ProductName, s.SupplierName FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID ORDER BY p.ProductName ASC;

Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
SELECT s.SupplierName, COUNT(p.ProductID) AS ProductCount FROM Suppliers s LEFT JOIN Products p ON s.SupplierID =
 p.SupplierID GROUP BY s.SupplierName ORDER BY ProductCount DESC;


Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
SELECT c.CustomerName, e.FirstName AS SalespersonFirstName, e.LastName AS SalespersonLastName, o.ShipperName FROM Customers c
JOIN Employees e ON c.ContactName = e.FirstName
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Shippers s ON o.ShipperID = s.ShipperID;

Кайсы ишкер канча клиент обслуживайтеткен чыксын
SELECT e.FirstName, e.LastName, COUNT(o.CustomerID) AS NumberOfCustomers FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID GROUP BY e.EmployeeID;
 */