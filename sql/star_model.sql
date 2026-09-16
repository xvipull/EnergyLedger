-- Energy Ledger dimensional model. Fact grain: one utility invoice line.
PRAGMA foreign_keys = ON;

CREATE TABLE dim_site (
  site_key INTEGER PRIMARY KEY,
  site_id TEXT NOT NULL UNIQUE,
  site_name TEXT NOT NULL,
  country_code TEXT NOT NULL,
  floor_area_sqm REAL NOT NULL,
  active_flag TEXT NOT NULL
);

CREATE TABLE dim_date (
  date_key INTEGER PRIMARY KEY,
  calendar_date TEXT NOT NULL UNIQUE,
  calendar_year INTEGER NOT NULL,
  calendar_month INTEGER NOT NULL,
  month_name TEXT NOT NULL
);

CREATE TABLE dim_energy_type (
  energy_type_key INTEGER PRIMARY KEY,
  energy_type TEXT NOT NULL UNIQUE
);

CREATE TABLE dim_currency (
  currency_key INTEGER PRIMARY KEY,
  currency_code TEXT NOT NULL UNIQUE
);

CREATE TABLE dim_emission_factor (
  emission_factor_key INTEGER PRIMARY KEY,
  factor_id TEXT NOT NULL UNIQUE,
  country_code TEXT NOT NULL,
  energy_type TEXT NOT NULL,
  effective_from TEXT NOT NULL,
  effective_to TEXT NOT NULL,
  kgco2e_per_kwh REAL NOT NULL,
  methodology TEXT NOT NULL
);

CREATE TABLE fact_energy_ledger (
  energy_ledger_key INTEGER PRIMARY KEY,
  invoice_line_id TEXT NOT NULL UNIQUE,
  utility_account_id TEXT NOT NULL,
  site_key INTEGER NOT NULL REFERENCES dim_site(site_key),
  billing_start_date_key INTEGER NOT NULL REFERENCES dim_date(date_key),
  billing_end_date_key INTEGER NOT NULL REFERENCES dim_date(date_key),
  invoice_date_key INTEGER NOT NULL REFERENCES dim_date(date_key),
  energy_type_key INTEGER NOT NULL REFERENCES dim_energy_type(energy_type_key),
  currency_key INTEGER NOT NULL REFERENCES dim_currency(currency_key),
  emission_factor_key INTEGER NOT NULL REFERENCES dim_emission_factor(emission_factor_key),
  quantity_native REAL NOT NULL,
  native_unit TEXT NOT NULL,
  quantity_kwh_equivalent REAL NOT NULL,
  invoice_amount_local REAL NOT NULL,
  emissions_kgco2e REAL NOT NULL,
  source_file_name TEXT NOT NULL,
  load_timestamp_utc TEXT NOT NULL
);
