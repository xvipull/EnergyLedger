# Project Charter and Requirements

## Purpose

Energy Consumption, Cost & Sustainability Reconciliation Platform (Energy Ledger) will establish a single, auditable monthly record of energy use, utility spend, and market-based Scope 2 emissions. It serves the finance close, facilities operating review, and sustainability disclosure workflows without replacing source operational systems.

## Stakeholder personas

| Persona | Goals | Decisions supported | Success signal |
| --- | --- | --- | --- |
| Facilities Head | Keep sites efficient, prevent bill shocks, and resolve metering gaps | Which sites need investigation; whether usage reflects operating hours; which exception owner to assign | Exceptions resolved before the next bill cycle and normalized kWh declines at priority sites |
| Finance | Close accurately, explain spend variance, and support accruals | Whether an invoice is valid; whether an accrual or adjustment is required; where cost-center variances originate | Reconciled energy spend and traceable variance evidence by close deadline |
| Sustainability Team | Report credible energy and Scope 2 results | Whether activity data is complete; which emissions factors apply; whether data is disclosure-ready | Complete, versioned activity and emissions dataset with documented methodology |

## Business problem

Energy facts are distributed across utility invoices, meter portals, site records, tariffs, and emissions-factor workbooks. Different period boundaries, units, site names, and account identifiers make the monthly view slow to assemble and difficult to audit. Teams spend time reconciling spreadsheets, cannot distinguish usage changes from rate changes reliably, and may report incomplete or inconsistent emissions data.

## Product decisions

The product must allow authorized users to decide:

1. Whether billed cost, metered consumption, and expected tariff cost agree within approved thresholds.
2. Whether a spend variance is driven by consumption, tariff/rate, demand, taxes, or a data-quality issue.
3. Which site/account-period records require correction, accrual, investigation, or approval—and who owns each action.
4. Whether a monthly site and portfolio energy/emissions dataset is sufficiently complete for financial close and sustainability reporting.
5. Which facilities are highest priority for energy-performance intervention based on normalized consumption and cost variance.

## Scope

### In scope

- Monthly ingestion of approved utility invoices, interval/monthly meter exports, site master, cost-center mapping, tariff reference data, and emissions factors.
- Standardization of site, utility account, period, currency, unit, and fuel identifiers.
- Invoice-to-meter reconciliation, rate/cost variance analysis, exception workflow export, and completeness checks.
- Electricity, natural gas, and district energy for owned and operated facilities in the initial rollout geography.
- Location- and market-based Scope 2 calculation where required inputs exist; methodology and factor version capture.
- Power BI dashboard datasets and controlled Excel close-pack extracts.

### Out of scope

- Real-time building management system control, demand-response dispatch, or equipment optimization.
- Utility bill payment, AP posting, procurement, or contract negotiation workflows.
- Scope 1 mobile combustion, Scope 3, water, waste, and renewable certificate procurement accounting.
- Replacing the ERP, utility vendor portal, EHS platform, or corporate data warehouse.
- Automated adjustment journals; recommendations remain reviewable by Finance.

## Data owners and operating cadence

| Dataset | Business owner | Steward / delivery owner | Cadence |
| --- | --- | --- | --- |
| Utility invoices and charges | Finance | Accounts Payable | Monthly; within 3 business days of receipt |
| Meter reads / interval exports | Facilities Head | Energy Operations Analyst | Monthly; by business day 5 |
| Site and floor-area master | Facilities Head | Corporate Real Estate Master Data | Monthly and on site change |
| Cost-center mapping | Finance | Financial Planning & Analysis | Monthly close cycle |
| Tariffs and contract rates | Procurement | Energy Procurement Analyst | Monthly or on contract/rate change |
| Emissions factors and methodology | Sustainability Lead | Sustainability Data Analyst | Annual release; controlled ad hoc updates |

## Functional requirements

- Preserve source-file identity, load timestamp, and original values for every landed record.
- Match invoice and meter records using approved site/account/period rules, retaining match confidence and exception reason.
- Calculate costs, consumption, intensity, emissions, completeness, and variances according to the KPI catalog.
- Show drill-through from portfolio KPI to site/account/period and source reference.
- Allow exception assignment, status, comment, owner, and due date in a governed operational dataset or export.
- Publish a monthly locked close snapshot; corrections after lock must create a new version and audit note.

## Non-functional requirements

- Refresh priority datasets on the cadence above and flag late or missing delivery by 10:00 local time on the next business day.
- Complete the monthly portfolio refresh within 60 minutes after all required inputs are available.
- Retain source and reconciliation evidence for at least seven years, subject to corporate retention policy.
- Make business calculations reproducible from a versioned factor and tariff reference set.

## Security and privacy

The platform holds commercial utility account, site, invoice, and cost-center information; it is not intended to store personal data. Access follows least privilege: Facilities sees assigned sites, Finance sees costs and close evidence, Sustainability sees consumption/emissions, and administrators manage reference data. Encrypt data in transit and at rest, restrict raw folders to approved service accounts, log read/write activity for source and factor changes, and redact any accidental names, phone numbers, or payment data embedded in invoices before broad distribution. Power BI row-level security must be applied where a user is limited to a site or portfolio.

## Assumptions and risks

See [assumptions.md](assumptions.md) for operating assumptions, dependencies, and mitigations.

## Acceptance criteria

| Measure | Acceptance threshold | Evidence |
| --- | --- | --- |
| Invoice coverage | At least 98% of in-scope monthly invoices land by close day 5 | Load completeness report |
| Reconciliation | At least 95% of invoice cost is matched to a site/account/period; unmatched value is categorized | Reconciliation output |
| Calculation accuracy | Sampled KPI, emissions, and variance calculations agree with approved source/workbook calculations to 0.5% or applicable rounding | Signed UAT test pack |
| Traceability | 100% of published monthly records link to a source reference, factor version, and transformation run | Drill-through audit test |
| Timeliness | Monthly dashboard is available within 60 minutes of complete input arrival | Run log |
| Data quality | 100% of records with invalid unit, missing period, or unmapped site are visible as blocking exceptions | Data-quality test report |
| Access control | Persona-based access tests prevent unauthorized raw data and report access | Security/UAT evidence |
| Usability | Each persona can identify a material site variance and source evidence without analyst assistance in UAT | Scenario-based UAT results |
