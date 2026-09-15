# Data Dictionary

| Field | Definition | Format / example | Required | Primary owner |
| --- | --- | --- | --- | --- |
| `source_file_id` | Immutable identifier for landed source file | UUID | Yes | Data Operations |
| `source_record_id` | Source system line/read identifier | `INV-2026-000123-04` | Yes | Source owner |
| `load_timestamp_utc` | Time record entered raw layer | ISO 8601 UTC | Yes | Data Operations |
| `site_id` | Governed facility identifier | `IN-BLR-001` | Yes | Facilities |
| `site_name` | Display name from site master | Bengaluru HQ | Yes | Facilities |
| `utility_account_id` | Utility supplier account identifier | masked display value | Yes for utility data | Finance |
| `billing_period_start` | Start of billed/measurement period | `YYYY-MM-DD` | Yes | Finance / Facilities |
| `billing_period_end` | End of billed/measurement period | `YYYY-MM-DD` | Yes | Finance / Facilities |
| `energy_type` | Commodity/fuel classification | electricity, natural_gas, district_energy | Yes | Facilities |
| `quantity_native` | Measured or billed quantity in native unit | decimal | Yes | Source owner |
| `native_unit` | Original source unit | kWh, MWh, therm, GJ | Yes | Source owner |
| `quantity_kwh_equivalent` | Standardized energy quantity | decimal kWh | Yes after staging | Data Operations |
| `invoice_cost_local` | Invoice amount in local currency | decimal | Required for invoices | Finance |
| `currency_code` | ISO 4217 currency | INR, USD | Required for invoices | Finance |
| `cost_center_id` | Financial attribution code | `CC-4100` | Required when mapped | Finance |
| `meter_id` | Physical/logical meter identifier | `MTR-001879` | Required for meter data | Facilities |
| `tariff_id` | Applicable tariff or contract rate reference | `ELEC-2026-A` | Conditional | Procurement |
| `emission_factor_id` | Versioned factor reference | `IEA-IN-2026-v1` | Required for emissions | Sustainability |
| `emission_factor_kgco2e_per_kwh` | Factor applied to electricity activity | decimal | Required for emissions | Sustainability |
| `scope2_method` | Calculation method | location_based, market_based | Conditional | Sustainability |
| `reconciliation_status` | Result of matching process | matched, partial, unmatched, exception | Yes after staging | Finance |
| `exception_reason` | Coded explanation of exception | period_gap, unit_invalid, variance_high | Conditional | Data Operations |
| `data_version` | Locked monthly snapshot/version | `2026-09.v1` | Yes after publication | Data Operations |
