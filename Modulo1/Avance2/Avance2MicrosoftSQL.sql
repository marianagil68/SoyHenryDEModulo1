-- Avance 2
-- Crear la tabla de monitoreo

CREATE TABLE dbo.audit_product_sales_more200000 
(
  id INT IDENTITY(1,1) NOT NULL
    CONSTRAINT PK_ProductSalesThresholdAudit PRIMARY KEY,
  productId INT NOT NULL,
  productName NVARCHAR(50) NOT NULL,
  totalSold INT NOT NULL,
  dateTotalSold DATETIME NOT NULL
);