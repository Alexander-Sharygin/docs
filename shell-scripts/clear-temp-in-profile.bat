SetLocal EnableExtensions

For /F "Tokens=2*" %%I In ('Reg Query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList" /V ProfilesDirectory') Do Set Profiles=%%J
Call Set Profiles=%Profiles%

For /F "Delims=" %%I In ('Dir /B /AD-S-H "%Profiles%" ^| FindStr /V /B /I /C:"All Users"') Do (
 Del /F /S /Q "%Profiles%\%%I\AppData\Local\Temp\*.*" >> del_temp.log
)
