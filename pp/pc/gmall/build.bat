if exist ..\..\..\build\pc\static\gmall\ (
rd ..\..\..\build\pc\static\gmall\ /s /q
)
emaop release -compDd ../../../build/pc -f fis-online-conf.js
