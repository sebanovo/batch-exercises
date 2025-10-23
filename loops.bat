@echo off
echo Contando del 1 al 5:

for /L %%i in (1,1,5) do (
  echo Número: %%i
)

echo Listando archivos:
for %%f in (*.bat) do (
  echo Archivo: %%f
)

