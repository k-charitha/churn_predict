#!/usr/bin/env bash
# macOS/Linux setup. Run from the project root: bash setup.sh
set -e
python3 -m venv .venv
./.venv/bin/python -m pip install --upgrade pip
./.venv/bin/python -m pip install -r requirements.txt
echo "Done. Activate with: source .venv/bin/activate"
