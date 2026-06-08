# DORA Metrics Warehouse

A warehouse schema and metric view set for deployment frequency, lead time, change failure rate, and incident restore-time analytics.

## Stack

SQL warehouse modeling, engineering productivity analytics

## Problem

Engineering leadership dashboards need stable definitions, not ad hoc spreadsheet formulas. This project captures DORA metric rules as versioned SQL.

## Architecture

- sql/001_create_tables.sql defines services, deployments, and incidents.
- sql/010_metric_views.sql builds a service-level DORA view.
- The project is database-neutral enough to adapt to Snowflake, BigQuery, Redshift, or PostgreSQL.

## Implemented Production Readiness

- CI verifies required SQL artifacts are present.
- Metric logic is centralized and reviewable.
- Schema separates facts from service ownership dimensions.

## Run And Test

```powershell
Review SQL files under sql/
```

## Quality Gates

- Project-specific GitHub Actions workflow included under .github/workflows/ci.yml.
- Generated build outputs and dependency folders are excluded through .gitignore.
- Tests and validation commands are intentionally small enough to run during code review.

## Production Extension Points

- Add dbt project metadata.
- Add warehouse-specific profiles.
- Add synthetic event fixtures for regression testing.

## Repository Hygiene

This repository contains original portfolio code only. It does not include employer source code, private resumes, generated binaries, local credentials, or large media files.

