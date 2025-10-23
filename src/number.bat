@echo off

goto :main

rem Calcular el factorial de un número n!
:factorial-iterativo
setlocal
set f=1

for /L %%i in (1,1,%1) do (
  set /a f=f * %%i
)
endlocal & set _result=%f%
goto :eof

@REM :main
@REM call :factorial-iterativo 5
@REM echo Factorial de 5: %_result%
@REM goto :eof

:factorial-recursivo
setlocal enabledelayedexpansion

if %1 leq 1 (
  set result=1
) else (
  set /a temp=%1-1
  call :factorial-recursivo !temp!
  set /a result=!_result! * %1
)
endlocal & set _result=%result%
goto :eof

@REM :main
@REM call :factorial-recursivo 5
@REM echo Factorial de 5: %_result%
@REM goto :eof

:fibonacci-iterativo
setlocal enabledelayedexpansion

rem Inicializamos los dos primeros elementos del "pseudo-array"
set fibb[0]=0
set fibb[1]=1

if %1==1 (
  set result=%%fibb[0]%%
) else if %1==2 (
  set result=%%fibb[1]%%
) else (
  set /a lastindex=%1-1
  for /L %%i in (2,1,!lastindex!) do (
    set /a prev1=%%i-1
    set /a prev2=%%i-2
    call set /a fibb[%%i]=%%fibb[!prev1!]%% + %%fibb[!prev2!]%%
  )
  call set result=%%fibb[!lastindex!]%%
)

endlocal & set _result=%result%
goto :eof


@REM :main
@REM call :fibonacci-iterativo 6
@REM echo Fibonacci de 6: %_result%
@REM goto :eof

:fibonacci-recursivo
setlocal enabledelayedexpansion

if %1 == 1 (
  set result=0
) else if %1 == 2 (
  set result=1
) else (
  set /a param1=%1-1
  set /a param2=%1-2

  call :fibonacci-recursivo !param1!
  set result1=!_result!
  call :fibonacci-recursivo !param2!
  set result2=!_result!
  set /a result=!result1! + !result2!
)
endlocal & set _result=%result%
goto :eof

@REM :main
@REM call :fibonacci-recursivo 6
@REM echo Fibonacci de 6: %_result%
@REM goto :eof


:invertir
setlocal enabledelayedexpansion
set /a n=%1
set /a result=0

:invertir_while
if !n! gtr 0 (
  set /a digit=!n! %% 10
  set /a result=!result! * 10
  set /a result=!result! + !digit!
  set /a n=!n! / 10
  goto :invertir_while
)

endlocal & set _result=%result%
goto :eof


@REM :main
@REM call :invertir 12345 
@REM echo %_result%
@REM goto :eof


rem función para sumar los digitos de un número
:sumar-digitos
setlocal enabledelayedexpansion
set /a n=%1
set /a suma=0

:sumar_digitos_while
if !n! gtr 0 (
  set /a digit=!n! %% 10
  set /a suma=!suma! + !digit!
  set /a n=!n! / 10
  goto :sumar_digitos_while
)

endlocal & set _result=%suma%
goto :eof

@REM :main
@REM call :sumar-digitos 12345 
@REM echo %_result%
@REM goto :eof

:sumar-digitos-pares
setlocal enabledelayedexpansion
set /a n=%1
set /a suma=0

:sumar_digitos_pares_while
if !n! gtr 0 (
  set /a digit=!n! %% 10
  set /a par=!digit! %% 2
  if !par! equ 0 (
    set /a suma=!suma! + !digit!
  )
  set /a n=!n! / 10
  goto :sumar_digitos_pares_while
)

endlocal & set _result=%suma%
goto :eof

@REM :main
@REM call :sumar-digitos-pares 12345 
@REM echo %_result%
@REM goto :eof

:sumar-digitos-impares
setlocal enabledelayedexpansion
set /a n=%1
set /a suma=0

:sumar_digitos_impares_while
if !n! gtr 0 (
  set /a digit=!n! %% 10
  set /a par=!digit! %% 2
  if !par! equ 1 (
    set /a suma=!suma! + !digit!
  )
  set /a n=!n! / 10
  goto :sumar_digitos_impares_while
)

endlocal & set _result=%suma%
goto :eof

@REM :main
@REM call :sumar-digitos-impares 12345 
@REM echo %_result%
@REM goto :eof

:menor-digito
setlocal enabledelayedexpansion
set /a n=%1
set menor=%n% %% 10

:menor_digito_while
if !n! gtr 0 (
  set /a actual=!n! %% 10
  if !actual! lss !menor! (
    set menor=!actual!
  )
  set /a n=!n! / 10
  goto :menor_digito_while
)

endlocal & set _result=%menor%
goto :eof

@REM :main
@REM call :menor-digito 12345 
@REM echo %_result%
@REM goto :eof

:mayor-digito
setlocal enabledelayedexpansion
set /a n=%1
set mayor=%n% %% 10

:mayor_digito_while
if !n! gtr 0 (
  set /a actual=!n! %% 10
  if !actual! gtr !mayor! (
    set mayor=!actual!
  )
  set /a n=!n! / 10
  goto :mayor_digito_while
)

endlocal & set _result=%mayor%
goto :eof

@REM :main
@REM call :mayor-digito 12345 
@REM echo %_result%
@REM goto :eof

:eliminar-digito-par
setlocal enabledelayedexpansion
set /a n=%1
set result=0

:eliminar_digito_par_while
if !n! gtr 0 (
  set /a digit=!n! %% 10
  set /a par=!digit! %% 2
  if !par! equ 1 (
    set /a result=!result! * 10
    set /a result=!result! + !digit!
  )
  set /a n=!n! / 10
  goto :eliminar_digito_par_while
)

call :invertir %result%
set result=%_result%
endlocal & set _result=%result%
goto :eof

@REM :main
@REM call :eliminar-digito-par 12345 
@REM echo %_result%
@REM goto :eof

:eliminar-digito-impar
setlocal enabledelayedexpansion
set /a n=%1
set result=0

:eliminar_digito_impar_while
if !n! gtr 0 (
  set /a digit=!n! %% 10
  set /a impar=!digit! %% 2
  if !impar! equ 0 (
    set /a result=!result! * 10
    set /a result=!result! + !digit!
  )
  set /a n=!n! / 10
  goto :eliminar_digito_impar_while
)

call :invertir %result%
set result=%_result%
endlocal & set _result=%result%
goto :eof

@REM :main
@REM call :eliminar-digito-impar 1234548
@REM echo %_result%
@REM goto :eof

:repetir-numero
setlocal enabledelayedexpansion
set /a n=%1
set /a veces=%2
set /a result=0

:repetir_numero_while
if !n! gtr 0 (
  set /a digit=!n! %% 10
  set /a limit=!veces!-1
  for /L %%i in (0, 1, !limit!) do (
    set /a result=!result! * 10
    set /a result=!result! + !digit! 
  )
  set /a n=!n! / 10
  goto :repetir_numero_while
)

call :invertir %result%
set result=%_result%
endlocal & set _result=%result%
goto :eof


@REM :main
@REM call :repetir-numero 123 2
@REM echo %_result%
@REM goto :eof