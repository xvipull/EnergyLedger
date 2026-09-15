# Energy Ledger

Energy Ledger reconciles utility consumption, cost, and sustainability metrics into a governed monthly view for facilities, finance, and sustainability leaders. It turns disparate invoices, meter readings, and emissions factors into an auditable operating record.

## What it enables

- Reconcile billed energy costs to consumption and meter data by site, account, and period.
- Identify material cost, consumption, and emissions variances before close.
- Supply finance-ready accrual evidence and sustainability-ready Scope 2 activity data.
- Track exceptions to an accountable owner through resolution.

## Architecture

```text
Utility invoices / meter exports / site master / tariff & emission factors
                                |
                                v
                         data/raw (immutable landing)
                                |
                                v
                    data/staging (standardized records)
                                |
                                v
                 SQL reconciliation & KPI calculation layer
                                |
                   +------------+------------+
                   v                         v
              Power BI models           Excel close packs
                   |                         |
                   +----------- reports -----+
```

## Repository layout

| Path | Purpose |
| --- | --- |
| `docs/` | Business requirements, KPI definitions, assumptions, and data dictionary |
| `data/raw/` | Immutable source-file landing area; never manually transform in place |
| `data/staging/` | Standardized, quality-checked intermediate datasets |
| `sql/` | Reconciliation, transformations, and validation queries |
| `src/` | Reusable ingestion and transformation code |
| `notebooks/` | Exploratory and documented analysis |
| `tests/` | Automated data-quality and transformation tests |
| `powerbi/` | Semantic model and report assets |
| `excel/` | Finance close packs and controlled templates |
| `reports/` | Published extracts and management reports |

## Screenshots

### Executive reconciliation dashboard

`[Placeholder: monthly cost, kWh, and tCO2e variance dashboard]`

### Exception workbench

`[Placeholder: unresolved utility invoice and meter matching exceptions]`

## Getting started

Read [the requirements](docs/requirements.md), validate fields against [the data dictionary](docs/data_dictionary.md), then place approved source extracts in `data/raw/` using the agreed naming convention.

## Status

Business analytics foundation. The first implementation increment will prioritize monthly utility invoice-to-meter reconciliation for owned facilities.
