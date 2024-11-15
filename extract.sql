USE ROLE ACCOUNTADMIN;

CREATE OR ALTER WAREHOUSE SNOW_WH 
  WAREHOUSE_SIZE = XSMALL 
  AUTO_SUSPEND = 300 
  AUTO_RESUME= TRUE;


-- Separate database for git repository
CREATE OR ALTER DATABASE SnowflakeTest;

-- API integration is needed for GitHub integration
CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/Simran-git2604') 
  ENABLED = TRUE;


-- Git repository object is similar to external stage
CREATE OR REPLACE GIT REPOSITORY SnowflakeTest.public.repo
  API_INTEGRATION = git_api_integration
  ORIGIN = 'https://github.com/Simran-git2604/Snowflake'; 
-- DB level objects
CREATE OR ALTER SCHEMA bronze;


CREATE OR REPLACE FILE FORMAT bronze.csv_format TYPE = 'csv'; -- file format
CREATE OR ALTER STAGE bronze.bronzeStage; -- stage object

