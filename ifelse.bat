@echo off
set /P nombre=Ingresa tu nombre:
set /P edad=Ingresa tu edad:

if %edad% LSS 18 (
  set mensaje=Menor de edad 
) else (
  set mensaje=Mayor de edad
)

echo Hola %nombre%, tienes %edad% años eres %mensaje%