@echo off
setlocal enabledelayedexpansion
set x=1

echo Fuera del for: %x%

for /l %%i in (1,1,3) do (
  set /a x=x+1
  echo Dentro del for: %x%
  echo Con expansion retardada: !x!
)