# DBT_Snowflake

An analytics-engineering project that transforms raw data into clean, tested, and documented marts using **dbt** on **Snowflake**.

## Overview

This project follows a layered modeling approach — from raw sources through staging models to business-ready marts — with data quality enforced by tests and history captured via snapshots.

## Tech stack

- **dbt** — modeling, testing, documentation, and lineage
- **Snowflake** — cloud data warehouse
- **SQL & Jinja** — transformations and reusable macros

## Project structure

```
models/      # staging and marts models
macros/      # reusable SQL macros
seeds/       # static reference data
snapshots/   # slowly changing dimensions
tests/       # custom data tests
analyses/    # ad-hoc analytical queries
```

## Getting started

```bash
dbt deps      # install packages
dbt seed      # load seed data
dbt run       # build models
dbt test      # run data quality tests
dbt docs generate && dbt docs serve   # view docs & lineage
```
