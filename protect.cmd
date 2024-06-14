@echo off

title protect

if "%~1"=="" exit /b
if /i "%~x1" neq ".bat" if /i "%~x1" neq ".cmd" exit /b
echo //4mY2xzDQo= > temp.~b64
certutil.exe -f -decode "temp.~b64" "%~n1o%~x1"
del "temp.~b64"
copy /b "%~n1o%~x1" /b + "%~1" /b
