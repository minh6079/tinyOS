@echo off
chcp 65001 >nul
title TinyOS
color A
cls

:: Set the initial password
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
cls
goto logon

:gui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
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

if "%choice%"=="1" goto createFileGui
if "%choice%"=="2" goto createFolderGui
if "%choice%"=="3" goto moveFileGui
if "%choice%"=="4" goto copyFileGui
if "%choice%"=="5" goto deleteFolderGui
if "%choice%"=="6" goto formatProgressGui
if "%choice%"=="7" goto treeGui
if "%choice%"=="8" goto restartSystemGui
if "%choice%"=="9" goto shutdownSystemGui
if "%choice%"=="10" goto changePasswordGui
if "%choice%"=="11" goto logOutGui
if "%choice%"=="12" goto resetPasswordGui
if "%choice%"=="13" goto textMode

:: If input is invalid, print an error message
color C
echo Error! Invalid choice. Try again.
pause
color A
goto gui

:: Function for text-based file creation in Gui
:createFileGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                             ______________________________________
echo.                            ^|  🖥️  macOS - Create New File      ^|✖️^|
echo.                            ^|--------------------------------------^|
echo.                            ^| File Name: [____________________]    ^|
echo.                            ^| File Type: [ .txt ▼ ]                ^|
echo.                            ^|--------------------------------------^|
echo.                            ^|               [ Create ] [ Cancel ]  ^|
echo.                            ^|______________________________________^|
echo.
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
set /p filename=Enter file name (with extension):  
echo. > "%filename%"
echo File "%filename%" created successfully!
pause
cls
goto gui

:: Function for folder creation in Gui
:createFolderGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                             ______________________________________
echo.                            ^|  🖥️  macOS - Create New Folder    ^|✖️^|
echo.                            ^|--------------------------------------^|
echo.                            ^| Folder Name: [____________________]  ^|
echo.                            ^| Folder Location [ Desktop ▼ ]        ^|
echo.                            ^|--------------------------------------^|
echo.                            ^|               [ Create ] [ Cancel ]  ^|
echo.                            ^|______________________________________^|
echo.
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
set /p foldername=Enter folder name:  
mkdir "%foldername%"
echo Folder "%foldername%" created successfully!
pause
cls
goto gui

:: Function for moving files in Gui
:moveFileGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                  ______________________________________
echo.                                 ^|  🖥️  macOS - Move File            ^|✖️^|
echo.                                 ^|--------------------------------------^|
echo.                                 ^| File Name:   [ ___________ ]         ^|
echo.                                 ^| Current Location: [ ________▼ ]      ^|
echo.                                 ^| New Location:    [ _______ ▼ ]       ^|
echo.                                 ^|--------------------------------------^|
echo.                                 ^|               [ Move ] [ Cancel ]    ^|
echo.                                 ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
set /p source=Enter source file path:  
set /p destination=Enter destination folder path:  
move "%source%" "%destination%"
echo File moved successfully!
pause
cls
goto gui

:: Function for copying files
:copyFileGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                 ______________________________________
echo.                                ^|  🖥️  macOS - Copy File            ^|✖️^|
echo.                                ^|--------------------------------------^|
echo.                                ^| File Name:   [ ___________ ]         ^|
echo.                                ^| Source Location:  [ _________ ▼ ]    ^|
echo.                                ^| Destination:      [ _______ ▼ ]      ^|
echo.                                ^|--------------------------------------^|
echo.                                ^|             [ Copy ] [ Cancel ]      ^|
echo.                                ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
set /p source=Enter source file path:  
set /p destination=Enter destination folder path:  
copy "%source%" "%destination%"
echo File copied successfully!
pause
cls
goto gui

:: Function for deleting folders
:deleteFolderGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                            ______________________________________
echo.                           ^|  🖥️  macOS - Delete Folder        ^|✖️^|
echo.                           ^|--------------------------------------^|
echo.                           ^| ⚠️  Are you sure you want to delete  ^|
echo.                           ^|      the folder "____________"?      ^|
echo.                           ^|                                      ^|
echo.                           ^|  This action cannot be undone.       ^|
echo.                           ^|--------------------------------------^|
echo.                           ^|             [ Delete ] [ Cancel ]    ^|
echo.                           ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
set /p folderdel=Enter folder name to delete:  
rmdir /S /Q "%folderdel%"
echo Folder "%folderdel%" deleted successfully!
pause
cls
goto gui

:: Function for format progress animation
:formatProgressGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                              ______________________________________
echo.                             ^|  🖥️  macOS - Format Drive         ^|✖️^|
echo.                             ^|--------------------------------------^|
echo.                             ^| Select Drive:  [ Macintosh HD ▼ ]    ^|
echo.                             ^| File System:   [ APFS ▼ ]            ^|
echo.                             ^| Volume Name:   [ NewDrive ]          ^|
echo.                             ^|--------------------------------------^|
echo.                             ^| ⚠️  Formatting will erase all data.  ^|
echo.                             ^|      Proceed with caution.           ^|
echo.                             ^|--------------------------------------^|
echo.                             ^|             [ Format ] [ Cancel ]    ^|
echo.                             ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
echo Formatting in progress...
for /L %%i in (0,10,100) do (
    echo Formatting %%i%%...
    ping -n 2 localhost >nul
)
echo Format complete! (Just for fun :) )
pause
cls
goto gui

:: Function for listing files and folders
:treeGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                 ______________________________________
echo.                                ^|  🖥️  macOS - Files List           ^|✖️^|
echo.                                ^|--------------------------------------^|
echo.                                ^| Files and folders listed below...    ^|
echo.                                ^|--------------------------------------^|
echo.                                ^|             [ Back ]                 ^|
echo.                                ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
tree /f
echo Listing complete
pause
cls
goto gui

:: Function for restarting the system (simulation)
:restartSystemGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                ______________________________________
echo.                               ^|  🖥️  macOS - Restart System       ^|✖️^|
echo.                               ^|--------------------------------------^|
echo.                               ^| ⚠️ Are you sure you want to restart? ^|
echo.                               ^|    All unsaved changes will be lost. ^|
echo.                               ^|--------------------------------------^|
echo.                               ^|             [ Restart ] [ Cancel ]   ^|
echo.                               ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
echo Restarting system...
ping -n 3 localhost > nul
cls
goto logon

:: Function for shutting down the system
:shutdownSystemGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                ______________________________________
echo.                               ^|  🖥️  macOS - Shut down System     ^|✖️^|
echo.                               ^|--------------------------------------^|
echo.                               ^|⚠️ Are you sure you want to shut down?^|
echo.                               ^|    All unsaved changes will be lost. ^|
echo.                               ^|--------------------------------------^|
echo.                               ^|           [ Shut down ] [ Cancel ]   ^|
echo.                               ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
echo Are you sure you want to shut down? (Y/N)
set /p confirm=Choice: 
if /I "%confirm%"=="Y" exit
cls
goto gui

:: Function for changing the password
:changePasswordGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                  ______________________________________
echo.                                 ^|  🖥️  macOS - Change Password      ^|✖️^|
echo.                                 ^|--------------------------------------^|
echo.                                 ^| Current Password: [______________]   ^|
echo.                                 ^| New Password:      [______________]  ^|
echo.                                 ^|--------------------------------------^|
echo.                                 ^|       [ Change Password ] [ Cancel ] ^|
echo.                                 ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
echo Change Password
echo ================
set /p newpass=Enter new password: 
set password=%newpass%
echo Password changed successfully!
pause
cls
goto gui

:: Function for logging out
:logOutGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                ______________________________________
echo.                               ^|  🖥️  macOS - Log out System       ^|✖️^|
echo.                               ^|--------------------------------------^|
echo.                               ^|⚠️ Are you sure you want to log out?  ^|
echo.                               ^|    All unsaved changes will be lost. ^|
echo.                               ^|--------------------------------------^|
echo.                               ^|             [ Log out ] [ Cancel ]   ^|
echo.                               ^|______________________________________^|
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
echo Logging out...
pause
goto logon

:: Function for resetting the password to default
:resetPasswordGui
cls
echo 🍎 Finder  File  View  Edit  Go  Help                                     🔘 %time:~0,5%   %date:~7,2%/%date:~4,2%/%date:~10,4%
echo _________________________________________________________________________________________________
echo.                                  ______________________________________
echo.                                 ^|  🖥️  macOS - Confirmation         ^|✖️^|
echo.                                 ^| ⚠️ Are you sure you want to proceed? ^|
echo.                                 ^|      This action cannot be undone.   ^|
echo.                                 ^|--------------------------------------^|
echo.                                 ^|             [ Confirm ] [ Cancel ]   ^|
echo.                                 ^|______________________________________^|
echo.
echo.                        ____________________________________________________
echo                        ^| 📄  🗂   📤  📋  🗑   💽   📁   🔁   ⏻   🔑  🔐   💣 ^|
echo                        ^|____________________________________________________^|
set password=tinyOS
echo Password has been reset to the default ("tinyOS")
pause
cls
goto logon