-- Avance 2
-- PUNTO 1 - Crear la tabla de monitoreo
CREATE TABLE audit_product_sales_more200000 
(
  Id INT NOT NULL AUTO_INCREMENT,
  ProductID INT NOT NULL,
  ProductName VARCHAR(50) NOT NULL,
  TotalSold INT NOT NULL,
  DateTotalSold DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

  CONSTRAINT pk_audit_product_sales_more200000 PRIMARY KEY (Id)
 );
 */
 
 -- PUNTO 2 - Crear trigger que monitoree cada vez que un producto supere las 200.000 unidades de ventas acumuladas.
 DELIMITER $$
 CREATE	TRIGGER tg_sales_more200000
 AFTER INSERT ON sales
 FOR EACH ROW
 BEGIN
	DECLARE TotalSales INT;
    SELECT SUM(Quantity)
    INTO TotalSales
    FROM sales
    WHERE ProductID = NEW.ProductID;
    IF TotalSales > 200000 AND NOT EXISTS
    (
		SELECT id 
        FROM audit_product_sales_more200000 
        WHERE ProductID = NEW.ProductID
    )
    THEN
		INSERT INTO audit_product_sales_more200000
		(ProductID, ProductName, TotalSold)
		SELECT p.ProductID, p.ProductName, TotalSales
		FROM products p
		WHERE ProductID = NEW.ProductID;
    END IF;
 END$$
 DELIMITER ;
 
-- PUNTO 3 - Probarlo con un insert
INSERT INTO sales VALUES
(6758126, 9, 84, 103, 1876, 0, 1200*1876, now(), 'ZZZZU1ZH70VJUD64X2I3');

-- Verificar si insertó en la tabla de auditoría
SELECT * FROM audit_product_sales_more200000;

-- PUNTO 4 - Mejorar los índices 
EXPLAIN -- ANALYZE
SELECT p.ProductName, p.productID, SUM(s.Quantity) TotalVendido
FROM sales s
INNER JOIN products p on s.ProductID = p.ProductID
GROUP BY p.ProductName, p.productID
ORDER BY SUM(s.quantity) DESC
LIMIT 5;

ALTER TABLE sales 
  ADD INDEX idx_sales_prod_qty (ProductID, Quantity);

ANALYZE TABLE sales, products;

EXPLAIN --  ANALYZE
SELECT ProductID, SUM(Quantity) AS TotalVendido
FROM sales -- FORCE INDEX (idx_sales_prod_qty)   
GROUP BY ProductID
ORDER BY TotalVendido DESC
LIMIT 5;

-- segunda consulta
ALTER TABLE sales ALTER INDEX idx_sales_prod_qty VISIBLE;
EXPLAIN
SELECT p.CategoryID, s.ProductID, SUM(s.Quantity) Cantidad
FROM sales s
INNER JOIN products p ON s.ProductID = p.ProductID
GROUP BY p.CategoryID, s.ProductID
