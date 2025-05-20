--CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Abc@703'

--Create Crdenetials

CREATE DATABASE SCOPED CREDENTIAL cred_ramya
WITH 
    IDENTITY = 'Managed Identity'

--Create External Data Source
CREATE EXTERNAL DATA SOURCE source_silver WITH (
    LOCATION = 'https://awstoragedatalakeramya.dfs.core.windows.net/silver',
    CREDENTIAL = cred_ramya
)

--Create External Data Source for Gold
CREATE EXTERNAL DATA SOURCE source_gold WITH (
    LOCATION = 'https://awstoragedatalakeramya.dfs.core.windows.net/gold',
    CREDENTIAL = cred_ramya
)

---Create External File Format
CREATE EXTERNAL FILE FORMAT format_parquet WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

-- CREATE EXTERNAL TABLE EXTSALES 
CREATE EXTERNAL TABLE gold.extsales WITH(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.sales


SELECT * from gold.extsales

CREATE EXTERNAL TABLE gold.extcalendar WITH(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.calendar

CREATE EXTERNAL TABLE gold.extcustomers WITH(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.customers


CREATE EXTERNAL TABLE gold.extproduct WITH(
    LOCATION = 'extproduct',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.product

CREATE EXTERNAL TABLE gold.extproductcategory WITH(
    LOCATION = 'extproductcategory',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.productcategory

CREATE EXTERNAL TABLE gold.extreturns WITH(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.returns

CREATE EXTERNAL TABLE gold.extsubcategory WITH(
    LOCATION = 'extsubcategory',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.subcategory


CREATE EXTERNAL TABLE gold.extterritories WITH(
    LOCATION = 'extterritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS SELECT * from gold.territories