@echo off

goto :main


:bubbleSort
setlocal enabledelayedexpansion
set ar[0]=5
set ar[1]=4
set ar[2]=3
set ar[3]=2
set ar[4]=1

set n=4
set limiti=!n!-1
for /L %%i in (0,1,!limiti!) do (
  set /a limitj=!n!-%%i-1
  for /L %%j in (0,1,!limitj!) do (
    call set n1=%%ar[%%j]%%
    set /a index=%%j+1
    call set n2=%%ar[!index!]%%
    if !n1! gtr !n2! (
      call set temp=%%ar[%%j]%%
      call set ar[%%j]=%%ar[!index!]%%
      call set ar[!index!]=!temp!
    )
  )
)

rem --- Mostrar el resultado ---
for /L %%k in (0,1,!n!) do (
  if defined ar[%%k] echo !ar[%%k]!
)
goto :eof

:main
call :bubbleSort