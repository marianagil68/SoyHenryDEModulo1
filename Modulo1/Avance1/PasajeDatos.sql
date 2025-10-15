LOAD DATA LOCAL INFILE 'C:/Users/Mariana/Dropbox/Cursos/SoyHenry/DataEngineering/Modulo01-FundamentosDeIngenieriaDeDatos/ProyectoIntegrador/Data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

SET SESSION local_infile = 1;