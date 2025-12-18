@echo off
SET THEFILE=c:\tugas2~1\pascal\laundr~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  C:\TUGAS2~1\pascal\rsrc.o -s   -b base.$$$ -o c:\tugas2~1\pascal\laundr~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
