@echo off
:: 1. 檢查 Python 是否安裝
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [Error] Python 未安裝或未加入環境變數！
    pause
    exit /b
)

:: 2. 建立並啟用虛擬環境
if not exist "venv" (
    echo 正在建立虛擬環境...
    python -m venv venv
)

echo 正在啟用虛擬環境...
call venv\Scripts\activate

:: 3. 安裝相依套件
echo 正在檢查/安裝必要套件...
pip install -q flask yt-dlp

:: 4. 設定連接埠並執行
set PORT=8899
echo.
echo ReClip is running at http://localhost:%PORT%
echo.
python app.py

pause