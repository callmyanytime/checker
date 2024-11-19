:0
@echo off
mode 87,30
title magics num checker
cls
color 0a

echo magics num checker 
echo.
echo Welcome Message
echo [32m-------------------------------------------------------------------------------------[37m
echo This utility will display HWID serial numbers for components on your PC.
echo Run this tool side-by-side, before and after spoofing and observe changes. 
echo This utility does not make any changes to your system.
echo.
pause

:1
mode 87,52
title magics - Serial Checker 1.1
cls
color 0a
echo %date% %time%
echo [32mUser Accounts and SIDs
echo [32m-------------------------------------------------------------------------------------[37m
wmic useraccount get name,sid

echo [32mSystem Motherboard and BIOS
echo [32m-------------------------------------------------------------------------------------[37m
wmic baseboard get serialnumber
wmic path win32_computersystemproduct get uuid

echo [32mCPU - (Central Processing Unit)
echo [32m-------------------------------------------------------------------------------------[37m
wmic cpu get processorid

echo [32mRAM (System Memory) - This may be all zeros
echo [32m-------------------------------------------------------------------------------------[37m
wmic memorychip get serialnumber

echo [32mSSD/HDD - Solid State and Standard Hard Drive(s)
echo [32m-------------------------------------------------------------------------------------[37m
wmic diskdrive get serialnumber

echo [32mGPU - (Graphical Processing Unit)
echo [32m-------------------------------------------------------------------------------------[37m
wmic PATH Win32_VideoController GET Description,PNPDeviceID

echo [32mMAC - (Network Adapter Physical Media Access Control)
echo [32m-------------------------------------------------------------------------------------[37m
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress
pause
goto :1