@echo off
setlocal

set SCRIPT_DIR=C:\Scripts\download_ytb

if not exist "%SCRIPT_DIR%" mkdir "%SCRIPT_DIR%"

cd /d "%SCRIPT_DIR%"

echo Baixando arquivos necessários...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/migueldav/download_youtube/refs/heads/main/download_ytb.py', 'download_ytb.py')"
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/migueldav/download_youtube/refs/heads/main/setup.py', 'setup.py')"

if not exist "setup.py" (
    echo Erro: setup.py nao foi baixado corretamente.
    pause
    exit /b 1
)

pip install pytubefix
pip install --upgrade setuptools
pip install --editable .

echo Instalacao concluida! Agora voce pode usar 'download_ytb' no terminal sem aspas!
pause
exit
