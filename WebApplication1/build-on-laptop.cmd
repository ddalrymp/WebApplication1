@if %_echo%!==! echo off
setlocal

REM C:\windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe C:\Users\ddalrymp.ORADEV\Source\Repos\WebApplication1\WebApplication1\build.xml /p:VisualStudioVersion=14.0 /p:Configuration=Debug;SolutionName=WebApplication1;ProjectName=WebApplication1

REM C:\windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe C:\Users\ddalrymp.ORADEV\Source\Repos\WebApplication1\WebApplication1\build.xml /p:VisualStudioVersion=14.0 /p:Configuration=Release;SolutionName=WebApplication1;ProjectName=WebApplication1

REM reg.exe query "HKLM\SOFTWARE\Microsoft\MSBuild\ToolsVersions\4.0" /v MSBuildToolsPath

if "%MSBuildPath%" == "" (
for /F "usebackq tokens=1,2,*" %%h  in (`reg query "HKLM\SOFTWARE\Microsoft\MSBuild\ToolsVersions\4.0" /s  ^| findstr -i "MSBuildToolsPath"`) do (
if /I "%%h" == "MSBuildToolsPath" ( 
if /I "%%i" == "REG_SZ" ( 
if not "%%j" == "" ( 
if "%%~dpj" == "%%j" ( 
set MSBuildPath=%%j
))))))

if not exist "%MSBuildPath%\MSBuild.exe" (
echo. MSBuild.exe is not found on this machine. Please install MSBuild before execute the script. 
goto :usage
)

echo "Found MSBuild.exe..."
echo "%MSBuildPath%\MSBuild.exe"
echo "Execute on %~dp0\build.xml"

REM %MSBuildPath%\MSBuild.exe %~dp0\build.xml /p:VisualStudioVersion=14.0 /p:Configuration=Release;SolutionName=WebApplication1;ProjectName=WebApplication1

%MSBuildPath%\MSBuild.exe %~dp0\build.xml /p:VisualStudioVersion=10.0 /p:Configuration=Release;SolutionName=WebApplication1;ProjectName=WebApplication1