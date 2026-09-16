"""Command-line entry point for the Energy Ledger pipeline."""

from pathlib import Path
from pipeline import run


if __name__ == "__main__":
    root = Path(__file__).resolve().parents[1]
    result = run(root)
    print(f"Loaded {result['fact_rows']} fact rows worth {result['invoice_value']:.2f} INR into {result['database']}")
