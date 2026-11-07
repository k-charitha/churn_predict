# Run this project in VS Code

Needs **Python 3.11 or 3.12**. Docker/Kubernetes are optional (only for the deploy stage).

## 1. Open and set up
1. `File > Open Folder...` and choose the `churn-prediction` folder (the one containing `config.yaml`).
2. Open a terminal (`Ctrl+` `` ` ``) and run:
   - **Windows:** `powershell -ExecutionPolicy Bypass -File setup.ps1`
   - **macOS/Linux:** `bash setup.sh`
3. `Ctrl+Shift+P` > **Python: Select Interpreter** > pick `.venv`.
   (On macOS/Linux, also change `python.defaultInterpreterPath` in `.vscode/settings.json` to `.venv/bin/python`.)

## 2. Run (Run and Debug panel, `Ctrl+Shift+D`)
| Launch config | What it does |
|---|---|
| **Pipeline: full run (force, no Docker)** | Runs all 10 stages: validate, preprocess, train, register in MLflow, evaluate, quality gate, promote, inference |
| **API: FastAPI** | Serves the model at http://127.0.0.1:8000/docs (works on its own using `deployment/`) |
| **MLflow UI** | Browse runs and the model registry at http://127.0.0.1:5000 |
| **Monitoring: drift check + retrain trigger** | Drift analysis, retrains only if drift and a new batch exist |

Use `--force` on the first pipeline run: the bundled `new_churn.csv` was already ingested, so a normal run stops after stage 1 by design.

## 3. Test
`python -m pytest` (or the Testing panel). The API tests use the model in `deployment/`.

## Notes
- Always run from the project root (the scripts use relative paths like `config.yaml`).
- MLflow data is stored in `mlflow.db` + `mlruns/`, created on first run. Delete both to reset the registry.
- Quick API check: `curl http://127.0.0.1:8000/health`
