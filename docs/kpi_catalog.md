# KPI Catalog

| KPI | Definition and formula | Grain | Owner | Refresh / notes |
| --- | --- | --- | --- |
| Energy consumption | Sum of energy converted to kWh equivalent, by fuel and period | Site, fuel, utility account, month | Facilities | Monthly; preserve native unit alongside conversion |
| Utility cost | Sum of invoice line charges less credits, excluding or including recoverable tax per Finance policy | Site, account, month | Finance | Monthly; invoice currency and FX rate retained |
| Cost variance | Actual utility cost minus expected/budget cost | Site, account, month | Finance | Monthly; decompose rate, volume, demand, and other when data permits |
| Consumption variance | Actual kWh minus comparable baseline or budget kWh | Site, fuel, month | Facilities | Monthly; weather/occupancy normalization is an optional controlled model |
| Energy intensity | Total kWh equivalent divided by occupied floor area | Site, month | Facilities | Do not publish where area is missing or stale |
| Invoice-to-meter variance | `(invoice consumption - matched meter consumption) / matched meter consumption` | Site, account, billing period | Facilities | Exception if absolute variance exceeds approved fuel-specific threshold |
| Reconciliation coverage | Reconciled invoice cost divided by total in-scope invoice cost | Portfolio, month | Finance | Target: >=95% matched value |
| Data completeness | Complete required records divided by expected in-scope site/account-period records | Portfolio, month | Sustainability | Includes source timeliness and required-field validity |
| Location-based Scope 2 | Electricity kWh × grid emission factor | Site, month | Sustainability | Factor geography, source, version, and effective dates required |
| Market-based Scope 2 | Electricity kWh × contractual/supplier/residual mix factor | Site, month | Sustainability | Publish only with eligible instrument/factor evidence |
| Emissions intensity | Scope 2 tCO2e divided by floor area or relevant production denominator | Site, month | Sustainability | Clearly label denominator and methodology |

All percentage variances display as `N/A` when the denominator is zero or unavailable. Thresholds are configuration values, not hard-coded dashboard logic.
