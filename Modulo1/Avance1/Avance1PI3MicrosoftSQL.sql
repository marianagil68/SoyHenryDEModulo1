-- PI 3 
-- a) ¿A qué categorías pertenecen los 5 productos más vendidos 
-- y qué proporción representan dentro del total de unidades vendidas de su categoría? 
-- Utiliza funciones de ventana para comparar la relevancia de cada producto dentro de su propia categoría.

WITH productos_mas_vendidos AS
(
	SELECT TOP 5 p.productID, p.ProductName, c.CategoryID, c.CategoryName
    , SUM(s.Quantity) TotalVendido
    , SUM(SUM(s.Quantity)) OVER (PARTITION BY c.CategoryID) as TotalCategoria
	FROM sales s
	INNER JOIN products p on s.ProductID = p.ProductID
    INNER JOIN categories c on p.CategoryID = c.CategoryID
	GROUP BY p.ProductName, p.productID, c.CategoryID, c.CategoryName
	ORDER BY SUM(s.quantity) DESC
)
SELECT *, TotalVendido * 100 / TotalCategoria AS Porcentaje
FROM productos_mas_vendidos;

-- b) ¿Cuáles son los 10 productos con mayor cantidad de unidades vendidas en todo el catálogo 
-- y cuál es su posición dentro de su propia categoría? 
-- Utiliza funciones de ventana para identificar el ranking de cada producto en su categoría. 
-- Luego, analiza si estos productos son también los líderes dentro de sus categorías 
-- o si compiten estrechamente con otros productos de alto rendimiento. 
-- ¿Qué observas sobre la concentración de ventas dentro de algunas categorías?

WITH productos_mas_vendidos AS
(
	SELECT TOP 10 p.productID, p.ProductName, c.CategoryID, c.CategoryName
    , SUM(s.Quantity) TotalVendido
    , SUM(SUM(s.Quantity)) OVER (PARTITION BY c.CategoryID) as TotalCategoria
	FROM sales s
	INNER JOIN products p on s.ProductID = p.ProductID
    INNER JOIN categories c on p.CategoryID = c.CategoryID
	GROUP BY p.ProductName, p.productID, c.CategoryID, c.CategoryName
	ORDER BY SUM(s.Quantity) DESC
), 
ventas_productos_categorias AS
(
	SELECT p.CategoryID, s.ProductID, SUM(s.Quantity) Cantidad
	FROM sales s
	INNER JOIN products p ON s.ProductID = p.ProductID
	GROUP BY p.CategoryID, s.ProductID
),
ranking_productos AS
(
	SELECT vpc.CategoryID, vpc.ProductID, vpc.Cantidad
	, RANK() OVER
	(
		PARTITION BY vpc.CategoryId
		ORDER BY vpc.Cantidad DESC
	) as Ranking_producto
	FROM ventas_productos_categorias vpc
)
SELECT p.ProductID, p.ProductName, p.CategoryID, p.CategoryName
, p.TotalVendido, r.Ranking_producto
FROM productos_mas_vendidos p
INNER JOIN ranking_productos r ON p.ProductID = r.ProductID
ORDER BY p.TotalVendido DESC;