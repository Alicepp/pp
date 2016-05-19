if exist ..\..\..\build\m\static\gmobile\ (
rd ..\..\..\build\m\static\gmobile\ /s /q
)
emaop release -cmopDd ../../../build/m -f fis-online-conf.js
