@echo off
:: Ensure script is running as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] This script must be run as Administrator!
    echo Right-click the script and select "Run as administrator".
    pause
    exit /b
)

title Windows High-Efficiency System Cleanup
color 0A

echo ============================================================
echo   STARTING HIGH-EFFICIENCY SYSTEM CLEANUP ^& OPTIMIZATION
echo ============================================================
echo.

echo [1/5] Removing leftover cipher temporary directories...
if exist "C:\EFSTMPWP" rmdir /s /q "C:\EFSTMPWP" >nul 2>&1
if exist "D:\EFSTMPWP" rmdir /s /q "D:\EFSTMPWP" >nul 2>&1
echo Done.
echo.

echo [2/5] Cleaning up Windows Update Component Store (C:)...
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
echo Done.
echo.

echo [3/5] Running Windows Disk Cleanup...
cleanmgr /autoclean
echo Done.
echo.

echo [4/5] Clearing Temporary Caches and Temp Folders...
del /q /f /s "%TEMP%\*" >nul 2>&1
del /q /f /s "C:\Windows\Temp\*" >nul 2>&1
ipconfig /flushdns >nul
echo Done.
echo.

echo [5/5] Retrimming and Optimizing Drives (C: and D:)...
echo - Optimizing C: Drive...
defrag C: /O
echo - Optimizing D: Drive...
defrag D: /O
echo Done.
echo.

echo ============================================================
echo   CLEANUP COMPLETE! ALL SYSTEMS OPERATIONAL.
echo ============================================================
pause