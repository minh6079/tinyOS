@echo off
chcp 65001 >nul
title TinyOS 2.0
color A
cls

:: Initial password
set password=tinyOS

:logon
color A
cls
echo Please logon first
set /p pass=Enter password:  
if "%pass%"=="%password%" (
    cls
    goto gui
)
color C
echo Incorrect password, please try again.
pause
goto logon

:gui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo ________________________________________________________________________________________________
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                           ____________________________________________________
echo                           ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                           ^|____________________________________________________^|
echo.
echo                          [1] Create file        📄
echo                          [2] Create folder      🗂
echo                          [3] Move file          📤
echo                          [4] Copy file          📋
echo                          [5] Delete folder       🗑
echo                          [6] Format (fun)       💽
echo                          [7] List files         📁
echo                          [8] Restart            🔁
echo                          [9] Shutdown           ⏻
echo                          [10] Change password   🔑
echo                          [11] Log out           🔐
echo                          [12] Reset password    💣
echo.
set /p choice=Enter option:  

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
if "%choice%"=="11" goto logon
if "%choice%"=="12" goto resetPassword

color C
echo Error! Invalid choice. Try again.
pause
goto gui

:createFile
cls
set /p filename=Enter file name (with extension):  
echo. > "%filename%"
echo File "%filename%" created successfully!
pause
cls
goto gui

:createFolder
cls
set /p foldername=Enter folder name:  
mkdir "%foldername%"
echo Folder "%foldername%" created successfully!
pause
cls
goto gui

:moveFile
cls
set /p source=Enter source file path:  
set /p destination=Enter destination folder path:  
move "%source%" "%destination%"
echo File moved successfully!
pause
cls
goto gui

:copyFile
cls
set /p source=Enter source file path:  
set /p destination=Enter destination folder path:  
copy "%source%" "%destination%"
echo File copied successfully!
pause
cls
goto gui

:deleteFolder
cls
set /p folderdel=Enter folder name to delete:  
rmdir /S /Q "%folderdel%"
echo Folder "%folderdel%" deleted successfully!
pause
cls
goto gui

:formatProgress
cls
echo Formatting in progress...
for /L %%i in (0,10,100) do (
    echo Formatting %%i%%...
    ping -n 2 localhost >nul
)
echo Format complete! (Just for fun :) )
pause
cls
goto gui

:tree
cls
tree /f
echo Listing complete
pause
cls
goto gui

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
if /I "%confirm%"=="Y" exit
cls
goto gui

:changePassword
cls
echo Change Password
echo ================
set /p newpass=Enter new password: 
set password=%newpass%
echo Password changed successfully!
pause
cls
goto gui

:resetPassword
cls
echo Reset Password
echo ===============
echo The password is now reset to "tinyOS".
set password=tinyOS
pause
cls
goto gui
