::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBFbSR2VAE+1EbsQ5+n//NaOr0waUec7cZvkiIvZcrVBvRGzJc976Utiq/QFDxRWMBuoYW8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIDLQlCSRbPEGqvCLYUpcX64euAp199
::eg0/rx1wNQPfEVWB+kM9LVsJDDeHLn2/FPgw6f317OLKj0wTVeU6au8=
::fBEirQZwNQPfEVWB+kM9LVsJDDeHLn2/FPgw6f317OLKj0wTVeU6au8=
::cRolqwZ3JBvQF1fEqQIcKQ5aTwyHLiucCadczuHt6sfHkUgPQucta+8=
::dhA7uBVwLU+EWH2L4UA8LVt6SQODKGKsA/Ux7eechoAIfZBR2z3ixWtUBWm5HO2cNZhrqkuiCafVRxYsg8SFbZ10s0q7drM31g==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE02wFaDxxYiGwHUf6NoA+xMHYr8augWgzZ8d/TorJyb2BLqBAig==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdDeDJGqB5lQ1Olt4TRGMP2P6K7QS6e/+/dax8wNNGrJxKLPo36aYJfJexkTxe5Ulm1dblsoLCQkYSEPlPkFk5z4Ms3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983

@echo off
title Server-Launch-Manager 
color F0
mode con: cols=95 lines=25
goto first
:begin
echo ---------------------------------------------
echo --     Welcome To Server Launch Manager    --
echo --          Please Enter Password          --
echo ---------------------------------------------
echo.

C:\Windows\System32\runas.exe /user:%username% "notepad.exe"

echo Wrong password!
pause
cls
goto begin




:first
echo.
echo ---------------------------------------------
echo --     Welcome To Server Launch Manager    --
echo --      Please select an option below      --
echo ---------------------------------------------
echo -- 1. [fivem] Start FiveM Sever            --
echo -- 2. [cache] Clear Server Cache           --
echo -- 3. [config] Open Server.cfg             --
echo -- 4. [data] Open PHPmyadmin               --
echo -- 5. [update] Check for version updates   --
echo -- 6. [discord] Join our Discord           --
echo -- 7. [forum] FiveM Forum                  --
echo -- 8. [dark] Change window to dark mode    --
echo ---------------------------------------------
echo.
set /p PROGRAM= What do you want to do?: 
goto %PROGRAM%
pause




:start
cls
echo ---------------------------------------------
echo --     Welcome To Server Launch Manager    --
echo --      Please select an option below      --
echo ---------------------------------------------
echo -- 1. [fivem] Start FiveM Sever            --
echo -- 2. [cache] Clear Server Cache           --
echo -- 3. [config] Open Server.cfg             --
echo -- 4. [data] Open PHPmyadmin               --
echo -- 5. [update] Check for version updates   --
echo -- 6. [discord] Join our Discord           --
echo -- 7. [forum] FiveM Forum                  --
echo -- 8. [dark] Change window to dark mode    --
echo ---------------------------------------------
echo.
set /p PROGRAM= What do you want to do?: 
goto %PROGRAM%




:password
cls
set /p PASSWORD= What do you want your password to be?: 
echo %PASSWORD% > pass.txt
pause
goto start




:check
cls
set /p PASSWORD1= What is your password?

for /f "Delims=" %%a in (pass.txt) do (

set TEXT=%%a

)

if %PASSWORD1%==%TEXT% goto start
echo you are wrong!!!
pause
goto start



:fivem
cls
echo ---------------------------------------------
echo --    Are you sure you want to start?      --
echo ---------------------------------------------
echo.
set /P c=[Y/N]? 
if /I "%c%" EQU "Y" goto :startfivem
if /I "%c%" EQU "N" goto :start
:startfivem
start run.cmd +exec server.cfg
goto start


:cache
cls
echo ---------------------------------------------
echo --  Are you sure you want to clear cache?  --
echo ---------------------------------------------
echo.
set /P c=[Y/N]? 
if /I "%c%" EQU "Y" goto :clear
if /I "%c%" EQU "N" goto :start
:clear
rd /s /q "C:\FXServer\cache\"
rd /s /q "D:\FXServer\cache\"
rd /s /q "C:\FiveMServer\cache\"
rd /s /q "C:\FiveM\cache\"
rd /s /q "C:\FXServer_ESX\cache\"
cls
echo ---------------------------------------------
echo --             Cache Cleared!              --
echo ---------------------------------------------
echo.
pause
goto start



:config
start server.cfg
goto start



:data
start "" http://localhost/phpmyadmin/
goto start

:discord
start "" https://discord.gg/DvZwE2z
goto start

:forum
start "" https://forum.fivem.net/
goto start


:update
cls
Set "url=https://pastebin.com/raw/2WYhEVKQ"
for %%# in (%url%) do ( set "File=%tmp%\%%~n#.txt" )
Call :Download "%url%" "%File%"
If exist "%File%" Type "%File%"
echo --         Your Version= 1.0.0.0           --
echo ---------------------------------------------
set /P c=Update [Y/N]? 
if /I "%c%" EQU "Y" goto :updaterun
if /I "%c%" EQU "N" goto :start
::*********************************************************************************
:Download <url> <File>
Powershell.exe -command "(New-Object System.Net.WebClient).DownloadFile('%1','%2')"
exit /b
::*********************************************************************************


:updaterun
start "" https://github.com/Windy315/Server-Launch-Manager
goto start

:dark
color 07
goto start

