@echo off

call :sumar 17 8
echo %_result%

call :restar 3 4
echo %_result%

:sumar
setlocal
set /a _result=%~1 + %~2
endlocal & set _result=%_result%
goto :eof

:restar
setlocal
set /a _result=%~1 - %~2
endlocal & set _result=%_result%
goto :eof