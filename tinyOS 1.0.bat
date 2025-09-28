@echo off
title TinyOS 1.0
color A
cls

REM ================================
REM  Project Notes
REM  Author: Minh
REM  Date: 2025-09-28
REM  
REM  This script mimics macOS and runs in cmd
REM  Github repo: github.com/minh6079/tinyOS.git
REM ================================

:: Set the initial password
set password=tinyOS

:logon
color A
cls
echo Please logon first
set /p pass=Enter password:  
if "%pass%"=="%password%" (
    cls
    goto menu
)
color C
echo Incorrect password, please try again.
pause
cls
goto logon

:menu
echo Welcome to TinyOS 1.0! - The 4KB OS Emulator
echo ========================================
echo [1] Create file
echo [2] Create folder
echo [3] Move file
echo [4] Copy file
echo [5] Delete folder
echo [6] Format progress (just for fun)
echo [7] List files and folders
echo [8] Restart
echo [9] Shutdown
echo [10] Change password
echo [11] Log out
echo [12] Reset password
echo ========================================
set /p choice=Enter option:  

:: Handling user choices
if "%choice%"=="1" goto createFile
if "%choice%"=="2" goto createFolder
if "%choice%"=="3" goto moveFile
if "%choice%"=="4" goto copyFile
if "%choice%"=="5" goto deleteFolder
if "%choice%"=="6" goto formatProgress
if "%choice%"=="7" goto tree
if "%choice%"=="8" goto restartSystem
if "%choice%"=="9" goto shutdownSystem
if "%choice%"=="10" goto changePassword
if "%choice%"=="11" goto logOut
if "%choice%"=="12" goto resetPassword

:: If input is invalid, print an error message
color C
echo Error! Invalid choice. Try again.
pause
color A
cls
goto menu

:createFile
set /p filename=Enter file name (with extension):  
echo. > "%filename%"
echo File "%filename%" created successfully!
pause
cls
goto menu

:createFolder
set /p foldername=Enter folder name:  
mkdir "%foldername%"
echo Folder "%foldername%" created successfully!
pause
cls
goto menu

:moveFile
set /p source=Enter source file path:  
set /p destination=Enter destination folder path:  
move "%source%" "%destination%"
echo File moved successfully!
pause
cls
goto menu

:copyFile
set /p source=Enter source file path:  
set /p destination=Enter destination folder path:  
copy "%source%" "%destination%"
echo File copied successfully!
pause
cls
goto menu

:deleteFolder
set /p folderdel=Enter folder name to delete:  
rmdir /S /Q "%folderdel%"
echo Folder "%folderdel%" deleted successfully!
pause
cls
goto menu

:formatProgress
echo Formatting in progress...
for /L %%i in (0,10,100) do (
    echo Formatting %%i%%...
    ping -n 2 localhost >nul
)
echo Format complete! (Just for fun :) )
pause
cls
goto menu

:tree
tree /f
echo Listing complete
pause
cls
goto menu

:restartSystem
cls
echo Restarting system...
ping -n 3 localhost > nul
cls
goto logon

:shutdownSystem
cls
echo Are you sure you want to shut down? (Y/N)
set /p confirm=Choice: 
if /I "%confirm%"=="Y" (
    echo Shutting down in 3...
    ping -n 2 localhost > nul
    echo Shutting down in 2...
    ping -n 2 localhost > nul
    echo Shutting down in 1...
    ping -n 2 localhost > nul
    exit
)
goto menu

:changePassword
cls
echo Change Password
echo ================
set /p newpass=Enter new password: 
set password=%newpass%
echo Password changed successfully!
pause
cls
goto menu

:logOut
cls
echo Logging out...

:resetPassword
set password=tinyOS
echo Password has been reset to the default ("tinyOS")
pause
cls
goto logon

