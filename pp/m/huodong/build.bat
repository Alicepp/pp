if exist ..\..\..\build\m\static\huodong\ (
rd ..\..\..\build\m\static\huodong\ /s /q
)
emaop release -cmpDd ../../../build/m -f fis-online-conf.js
