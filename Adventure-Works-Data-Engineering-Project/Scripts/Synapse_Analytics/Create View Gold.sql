---------------------------
-- Create Calendar View
---------------------------
CREATE VIEW gold.calendar as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/Calendar/',
    FORMAT = 'PARQUET'
) AS calendar_data

---------------------------
-- Create customers View
---------------------------
CREATE VIEW gold.customers as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/Customers/',
    FORMAT = 'PARQUET'
) AS customers_data

---------------------------
-- Create Product View
---------------------------
CREATE VIEW gold.product as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/Product/',
    FORMAT = 'PARQUET'
) AS product_data

---------------------------
-- Create ProductCategory View
---------------------------
CREATE VIEW gold.productcategory as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/ProductCategory/',
    FORMAT = 'PARQUET'
) AS productcategory_data

---------------------------
-- Create Returns View
---------------------------
CREATE VIEW gold.returns as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/Returns/',
    FORMAT = 'PARQUET'
) AS returns_data

---------------------------
-- Create Sales View
---------------------------
CREATE VIEW gold.sales as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/Sales/',
    FORMAT = 'PARQUET'
) AS sales_data

---------------------------
-- Create SubCategory View
---------------------------
CREATE VIEW gold.subcategory as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/SubCategory/',
    FORMAT = 'PARQUET'
) AS subcategory_data

---------------------------
-- Create Territories View
---------------------------
CREATE VIEW gold.territories as 
SELECT * FROM OPENROWSET(
    BULK 'https://awstoragedatalakeramya.dfs.core.windows.net/silver/Territories/',
    FORMAT = 'PARQUET'
) AS territories_data



