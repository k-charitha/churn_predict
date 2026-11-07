# Windows setup: creates .venv and installs dependencies. Run from the project root.
$ErrorActionPreference = "Stop"
$py = "python"   # use "py -3.11" if you have several Python versions
Invoke-Expression "$py -m venv .venv"
& .\.venv\Scripts\python.exe -m pip install --upgrade pip
& .\.venv\Scripts\python.exe -m pip install -r requirements.txt
Write-Host "`nDone. In VS Code: Ctrl+Shift+P > 'Python: Select Interpreter' > .venv" -ForegroundColor Green
