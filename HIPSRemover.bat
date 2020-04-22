@echo off
cls
echo McAfee Host Instrusion Prevention Software (HIPS) Removal Tool
echo (Only for use on CWOPA Windows XP computers)
echo.
echo.
echo Step 1 - Disabling the Host Intrusion Prevention agent...
net stop hips
net stop enterceptagent
net stop firepm
taskkill /f /im firetray.exe
echo.
echo Step 2 - Unloading the ePO plugin...
regedit /s Step2.reg
regsvr32 /u /s fireepo.dll
echo.
echo Step 3 - Removing Talkback...
C:\Program Files\Common Files\McAfee Inc\TalkBack\tbmon.exe -delref
rd C:\Program Files\Common Files\McAfee Inc\Talkback /s /q
regedit /s Step3.reg
echo.
echo Step 4 - Removing the firehk driver...
C:\Program Files\McAfee\Host Intrusion Prevention\Inf\installfirehk.bat /u
regedit /s Step4.reg
del C:\windows\system32\drivers\firehk.sys
echo.
echo Step 5 - Deleting the HIPSCore service and removing the drivers...
regedit /s Step5a.reg
C:\Program Files\McAfee\Host Intrusion Prevention\HIPSCore\mfehidin.exe -u HIPK.sys HIPPSK.sys HIPQK.sys
regedit /s Step5b.reg
del C:\windows\system32\drivers\HIPK.sys
del C:\windows\system32\drivers\HIPPSK.sys
del C:\windows\system32\drivers\HIPQK.sys
del C:\windows\system32\hipqa.dll
del C:\windows\system32\hipis.dll
del C:\windows\system32\mfehida.dll 
C:\Program Files\McAfee\Host Intrusion Prevention\HIPSCore\HIPSCoreReg.exe -u
regedit /s Step5c.reg
echo.
echo Step 6 - Deleting services and drivers...
regedit /s Step6.reg
del C:\WINDOWS\system32\drivers\firelm01.sys
del C:\WINDOWS\system32\drivers\FirePM.sys
del C:\WINDOWS\system32\drivers\FireTDI.sys
echo.
echo Step 7 - Removing the Host Intrusion Prevention registy entries...
regedit /s Step7.reg
echo.
echo Step 8 - Removing Host Intrustion Prevention files...
rd C:\Program Files\McAfee\Host Intrusion Prevention /s /q
del C:\WINDOWS\system32\FireCL.dll
del C:\WINDOWS\system32\FireCNL.dll
del C:\WINDOWS\system32\FireComm.dll
del C:\WINDOWS\system32\FireCore.dll
del C:\WINDOWS\system32\FireEpo.dll
del C:\WINDOWS\system32\FireNHC.dll
del C:\WINDOWS\system32\FireSCV.dll 
echo.
echo Step 9...
echo.
echo Step 10 - Additional clean up...
msizap.exe TW! {B332732A-4958-41DD-B439-DDA2D32753C5}
echo.
echo.
echo If no error messages appear above, the removal was successful.
echo Please restart the system to complete the uninstallation.
echo Thank you for using the CWOPA HIPS Removal Tool! --Selanda
echo.
pause