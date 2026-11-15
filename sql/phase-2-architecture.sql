-- NorthStar Retail — Phase 2
-- Snowflake architecture and compute configuration
-- Run with an authorized deployment role.
-- LEARN_WH must already exist.

CREATE DATABASE IF NOT EXISTS NORTHSTAR_RETAIL_DB
  COMMENT = 'NorthStar Retail enterprise data and AI platform';

CREATE SCHEMA IF NOT EXISTS NORTHSTAR_RETAIL_DB.RAW
  COMMENT = 'Raw ingested retail source data';

CREATE SCHEMA IF NOT EXISTS NORTHSTAR_RETAIL_DB.STAGING
  COMMENT = 'Cleaned and standardized retail data';

CREATE SCHEMA IF NOT EXISTS NORTHSTAR_RETAIL_DB.CURATED
  COMMENT = 'Business-ready retail analytics and AI datasets';

ALTER WAREHOUSE LEARN_WH
  SET AUTO_SUSPEND = 60
      AUTO_RESUME = TRUE;

-- Read-only verification
SHOW SCHEMAS IN DATABASE NORTHSTAR_RETAIL_DB;
SHOW WAREHOUSES LIKE 'LEARN_WH';
