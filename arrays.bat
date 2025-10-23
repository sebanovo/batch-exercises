@echo off

set arreglo[0]=Manzana
set arreglo[1]=Naranja
set arreglo[2]=Uva
set arreglo[3]=Pera

echo Primer elemento: %arreglo[0]%
echo Segundo elemento: %arreglo[1]%
echo Tercer elemento: %arreglo[2]%

set i=0
:loop
setlocal EnableDelayedExpansion
if defined arreglo[%i%] (
  echo Elemento %i%: !arreglo[%i%]!
  set /A i+=1
  goto loop
)
setlocal DisableDelayedExpansion