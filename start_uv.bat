@echo off
setlocal

cd /d "%~dp0"

where uv >nul 2>nul
if errorlevel 1 (
    echo [ERROR] uv is not installed or not on PATH.
    echo Install uv first: https://docs.astral.sh/uv/
    exit /b 1
)

set "SECRET_KEY=123456"
set "LOGIN_PASSWORD=admin123"
set "HOST=127.0.0.1"
set "PORT=5000"
set "FLASK_ENV=production"
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"

echo [INFO] Syncing dependencies...
uv sync
if errorlevel 1 exit /b 1

echo [INFO] Starting OutlookEmail...
echo [INFO] URL: http://%HOST%:%PORT%
uv run python web_outlook_app.py
