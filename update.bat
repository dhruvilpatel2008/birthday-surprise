@echo off
title GitHub Auto Update
color 0A

echo ===============================
echo    GITHUB AUTO UPDATE START
echo ===============================

REM Go to current folder where bat file exists
cd /d "%~dp0"

echo.
echo Checking Git installation...
git --version
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Git is not installed or not added to PATH.
    echo Install Git from https://git-scm.com/
    pause
    exit
)

echo.
echo Adding files...
git add .

echo.
echo Enter commit message:
set /p msg=

if "%msg%"=="" (
    set msg=Auto Update
)

echo.
echo Committing...
git commit -m "%msg%"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ===============================
echo        UPDATE COMPLETE
echo ===============================

pause