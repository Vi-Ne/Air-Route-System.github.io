@echo off
setlocal

:: Get the C++ code sent by the browser
set /p code=<code.txt

:: Save the C++ code to a file
echo %code% > temp.cpp

:: Compile the C++ code
g++ temp.cpp -o temp.out

:: Check if the compilation was successful
if errorlevel 1 (
    echo Compilation failed!
    exit /b 1
)

:: Run the compiled code and output the result
temp.out > output.txt

:: Read and return the output
for /f "delims=" %%i in (output.txt) do set output=%%i
echo %output%

:: Cleanup
del temp.cpp
del temp.out
del output.txt

endlocal
