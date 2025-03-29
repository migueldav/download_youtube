@echo off
setlocal

set SCRIPT_DIR=C:\Scripts\download_ytb

if not exist "%SCRIPT_DIR%" mkdir "%SCRIPT_DIR%"

cd /d "%SCRIPT_DIR%"

powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/seu-repositorio/download_ytb.py', 'download_ytb.py')"

(
echo from setuptools import setup
echo.
echo setup(
echo     name="download_ytb",
echo     version="1.0",
echo     py_modules=["download_ytb"],
echo     install_requires=[
echo         "pytubefix",
echo     ],
echo     entry_points={
echo         "console_scripts": [
echo             "download_ytb=download_ytb:main",
echo         ],
echo     },
echo )
) > setup.py

pip install pytubefix
pip install --editable .

echo Instalacao concluida! Agora voce pode usar 'download_ytb' no terminal sem aspas!
pause
exit
