# Phase 2 — Snowflake Architecture and Compute

## 1. Architecture Overview

Snowflake separates its architecture into three layers:

- Storage: Persists table data in compressed, columnar micro-partitions.
- Compute: Virtual warehouses execute SQL workloads independently.
- Cloud Services: Provides authentication, metadata, access control, and query coordination.

## 2. Warehouse Configuration

Existing learning warehouse: LEARN_WH

- Type: STANDARD
- Size: X-Small
- Minimum clusters: 1
- Maximum clusters: 1
- Auto-suspend: 60 seconds
- Auto-resume: enabled

The warehouse was inspected and its auto-suspend configuration was updated and verified.

## 3. Compute Isolation

Production architecture should separate workloads when justified:

- ETL_WH: Data ingestion and transformation workloads.
- ANALYTICS_WH: Business intelligence and reporting workloads.

These are proposed warehouse names, not deployed resources.

## 4. Database and Schema Architecture

Database: NORTHSTAR_RETAIL_DB

Schemas created and verified:

- RAW: Original ingested retail source data.
- STAGING: Cleaned and standardized datasets.
- CURATED: Business-ready analytics and AI datasets.

PUBLIC and INFORMATION_SCHEMA also exist.

## 5. Micro-Partitions

Snowflake automatically manages micro-partitions.

Micro-partition pruning can reduce data scanned when query filters align with partition metadata.

Clustering should be considered only when performance benefits justify maintenance costs.

## 6. Query Caching

The USE_CACHED_RESULT session parameter was verified as true.

Snowflake performance mechanisms include:

- Persisted query result reuse.
- Warehouse data caching.
- Micro-partition pruning.

## 7. Security and Cost Considerations

- ACCOUNTADMIN was used during initial setup.
- Dedicated least-privilege roles are planned.
- No resource monitor is currently assigned to LEARN_WH.
- Auto-suspend helps reduce idle compute costs but is not a spending limit.
- Separate compute workloads only when operational requirements justify their costs.

## 8. Implementation Status

Completed:

- Inspected existing virtual warehouses.
- Configured LEARN_WH auto-suspend to 60 seconds.
- Verified active warehouse and Snowflake session context.
- Created NORTHSTAR_RETAIL_DB.
- Created RAW, STAGING, and CURATED schemas.
- Verified all three schemas.
- Inspected the USE_CACHED_RESULT parameter.

Pending:

- Reproducible SQL deployment scripts.
- Phase 2 coverage audit.
- GitHub pull request and merge.
