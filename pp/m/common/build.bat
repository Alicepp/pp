if exist ..\..\..\build\m\static\common\ (
rd ..\..\..\build\m\static\common\ /s /q
)
emaop release -cmopDd ../../../build/m -f fis-online-conf.js
