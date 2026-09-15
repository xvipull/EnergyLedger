# Assumptions, Dependencies, and Risks

## Assumptions

1. An approved in-scope site and utility-account register exists before implementation.
2. Utility invoices are legally valid finance records and meter data is the operational comparison source; neither is automatically treated as the sole truth when they disagree.
3. Finance will approve the treatment of taxes, credits, accruals, FX, and fiscal calendar boundaries before UAT.
4. Facilities will maintain usable floor-area, occupancy, and meter-to-site mappings for intensity analysis.
5. Sustainability will approve factor sources, effective dates, GWP basis, and location-/market-based methodology.
6. Initial source volumes fit a monthly batch process; near-real-time data is not a rollout dependency.

## Risks and mitigations

| Risk | Impact | Mitigation | Owner |
| --- | --- | --- | --- |
| Late or missing utility invoices | Incomplete close and misleading trend | Completeness dashboard, late-file alert, controlled accrual process | Finance |
| Meter/account/site mappings change without notice | False matches and variances | Versioned master data with effective dates and change approval | Facilities |
| Unit or period inconsistencies across utilities | Incorrect standardized consumption | Unit conversion reference, period validation, blocking exceptions | Data Operations |
| Tariff complexity prevents expected-cost calculation | Cost drivers cannot be explained | Phase tariff logic; show invoice-vs-meter reconciliation first and document unsupported structures | Procurement / Finance |
| Emissions factors are outdated or untraceable | Disclosure risk | Version-controlled factor register and Sustainability sign-off | Sustainability |
| Commercial account data is over-shared | Confidentiality breach | Role-based access, raw-zone restriction, audit logs, redaction | Platform owner |
| Manual spreadsheets create uncontrolled changes | Loss of auditability | Lock close snapshots, store controlled templates, reconcile imports | Finance |

## Open decisions

- Confirm initial rollout countries, reporting currency, fiscal calendar, and materiality thresholds.
- Confirm whether estimated reads can be used for close and how later true-ups are represented.
- Define the system of record for exception status and workflow notifications.
