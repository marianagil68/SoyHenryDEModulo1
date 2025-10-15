-- PI 2 
-- a) •	¿Cuáles fueron los 5 productos más vendidos (por cantidad total), 
-- y cuál fue el vendedor que más unidades vendió de cada uno?

WITH productos_mas_vendidos AS
(
	SELECT TOP 5 p.ProductName, p.productID, SUM(s.Quantity) totalVendido
	FROM sales s
	INNER JOIN products p on s.ProductID = p.ProductID
	GROUP BY p.ProductName, p.productID
	ORDER BY SUM(s.quantity) DESC
),
ventas_por_empleado AS
(
	SELECT e.EmployeeID, e.LastName, e.FirstName, s.ProductID, SUM(s.Quantity) CantidadVendida
    FROM employees e
    INNER JOIN sales s ON e.EmployeeID = s.SalesPersonID
    INNER JOIN productos_mas_vendidos v ON s.ProductID = v.Productid
    GROUP BY e.EmployeeID, e.LastName, e.FirstName, s.ProductID
),
maximos_vendidos AS
(
	SELECT v.ProductID, MAX(CantidadVendida) MaximoVendido
	FROM ventas_por_empleado v
    GROUP BY v.ProductID
)

SELECT p.ProductID, p.ProductName, p.TotalVendido, v.EmployeeID, v.LastName, v.FirstName, m.MaximoVendido
FROM ventas_por_empleado v
INNER JOIN productos_mas_vendidos p ON v.ProductID = p.productID
INNER JOIN maximos_vendidos m ON m.MaximoVendido = v.CantidadVendida
	AND m.ProductID = v.ProductID
ORDER BY p.TotalVendido DESC;

-- b) ¿Hay algún vendedor que aparece más de una vez como el que más vendió un producto? 

WITH productos_mas_vendidos AS
(
	SELECT TOP 5 p.ProductName, p.productID, SUM(s.Quantity) TotalVendido
	FROM sales s
	INNER JOIN products p on s.ProductID = p.ProductID
	GROUP BY p.ProductName, p.productID
	ORDER BY SUM(s.quantity) DESC
),
ventas_por_empleado AS
(
	SELECT e.EmployeeID, e.LastName, e.FirstName, s.ProductID, SUM(s.Quantity) CantidadVendida
    FROM employees e
    INNER JOIN sales s ON e.EmployeeID = s.SalesPersonID
    INNER JOIN productos_mas_vendidos v ON s.ProductID = v.Productid
    GROUP BY e.EmployeeID, e.LastName, e.FirstName, s.ProductID
),
maximos_vendidos AS
(
	SELECT v.ProductID, MAX(CantidadVendida) MaximoVendido
	FROM ventas_por_empleado v
    GROUP BY v.ProductID
)
SELECT LastName, FirstName, COUNT(*) CantidadDeVentas
FROM
(
	SELECT p.ProductID, p.ProductName, p.TotalVendido, v.EmployeeID, v.LastName, v.FirstName, m.MaximoVendido
	FROM ventas_por_empleado v
	INNER JOIN productos_mas_vendidos p ON v.ProductID = p.productID
	INNER JOIN maximos_vendidos m ON m.MaximoVendido = v.CantidadVendida
		AND m.ProductID = v.ProductID
) AS maximos_vendedores 
GROUP BY LastName, FirstName
HAVING COUNT(*) > 1;

-- c) ¿Algunos de estos vendedores representan más del 10% de la ventas de este producto?

WITH productos_mas_vendidos AS
(
	SELECT TOP 5 p.ProductName, p.productID, SUM(s.Quantity) TotalVendido
	FROM sales s
	INNER JOIN products p on s.ProductID = p.ProductID
	GROUP BY p.ProductName, p.productID
	ORDER BY SUM(s.quantity) DESC

),
ventas_por_empleado AS
(
	SELECT e.EmployeeID, e.LastName, e.FirstName, s.ProductID, SUM(s.Quantity) CantidadVendida
    FROM employees e
    INNER JOIN sales s ON e.EmployeeID = s.SalesPersonID
    INNER JOIN productos_mas_vendidos v ON s.ProductID = v.Productid
    GROUP BY e.EmployeeID, e.LastName, e.FirstName, s.ProductID
),
maximos_vendidos AS
(
	SELECT v.ProductID, MAX(CantidadVendida) MaximoVendido
	FROM ventas_por_empleado v
    GROUP BY v.ProductID
)

SELECT p.ProductID, p.ProductName, p.TotalVendido, v.EmployeeID, v.LastName, v.FirstName
, m.MaximoVendido, Porcentaje = m.MaximoVendido * 100 / p.TotalVendido
FROM ventas_por_empleado v
INNER JOIN productos_mas_vendidos p ON v.ProductID = p.productID
INNER JOIN maximos_vendidos m ON m.MaximoVendido = v.CantidadVendida
	AND m.ProductID = v.ProductID
ORDER BY p.TotalVendido DESC;

-- d) •	Entre los 5 productos más vendidos, ¿cuántos clientes únicos compraron cada uno y 
-- qué proporción representa sobre el total de clientes? 

WITH productos_mas_vendidos AS
(
	SELECT TOP 5 p.ProductName, p.productID, SUM(s.Quantity) totalVendido
	FROM sales s
	INNER JOIN products p on s.ProductID = p.ProductID
	GROUP BY p.ProductName, p.productID
	ORDER BY SUM(s.quantity) DESC
),
total_clientes AS
(
	SELECT COUNT(*) TotalClientes
	FROM customers
),
clientes_maximos AS
(
	SELECT DISTINCT s.ProductID, s.CustomerID
	FROM productos_mas_vendidos p
	INNER JOIN sales s ON p.ProductID = s.ProductID
)
SELECT DISTINCT p.ProductID, p.ProductName, COUNT(*) AS CantidadDeClientes, t.TotalClientes
, Porcentaje = COUNT(*) * 100 / T.TotalClientes
FROM productos_mas_vendidos p 
INNER JOIN clientes_maximos c ON p.ProductID = c.ProductID
INNER JOIN total_clientes t ON 1=1
GROUP BY p.ProductID, p.ProductName, t.TotalClientes
ORDER BY COUNT(*) DESC;