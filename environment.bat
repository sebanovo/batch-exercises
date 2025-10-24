@echo off

@echo off
for /f "tokens=1* delims==" %%a in (.env) do (
  if not "%%a"=="" (
    set "%%a=%%b"
  )
)

echo Environment variables loaded from .env

echo NAME = %NAME%
