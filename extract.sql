USE ROLE ACCOUNTADMIN;

CREATE OR ALTER WAREHOUSE QUICKSTART_WH 
  WAREHOUSE_SIZE = XSMALL 
  AUTO_SUSPEND = 300 
  AUTO_RESUME= TRUE;


-- Separate database for git repository
CREATE OR ALTER DATABASE SnowflakeTest;

-- DB level objects
CREATE OR ALTER SCHEMA bronze;
CREATE OR ALTER SCHEMA silver;
CREATE OR ALTER SCHEMA gold;


CREATE OR REPLACE FILE FORMAT bronze.json_format TYPE = 'csv'; -- file format
CREATE OR ALTER STAGE bronze.bronzeStage; -- stage object

