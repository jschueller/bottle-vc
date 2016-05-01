echo @off

rem needs reg query from wine 1.9.9
set VSSHELL2010INSTALLDIR=C:\Program Files\Microsoft Visual Studio 10.0\
call "%VSSHELL2010INSTALLDIR%VC\bin\vcvars32.bat"

rem else use this:
rem set VS100COMNTOOLS=%VSSHELL2010INSTALLDIR%\Common7\Tools\
rem set VS100COMNTOOLSDIR=%VS100COMNTOOLS%
rem set VSINSTALLDIR=%VSSHELL2010INSTALLDIR%
rem set WindowsSdkDir=C:\Program Files\Microsoft SDKs\Windows\v7.0A\
rem set DevEnvDir=%VSINSTALLDIR%Common7\IDE\
rem set INCLUDE=%VSINSTALLDIR%VC\INCLUDE;%INCLUDE%
rem set INCLUDE=%WindowsSdkDir%\Include;%INCLUDE%
rem set LIB=%VSINSTALLDIR%VC\LIB;%LIB%
rem set LIB=%WindowsSdkDir%Lib;%LIB%
rem set PATH=%VSINSTALLDIR%Common7\Tools;%PATH%
rem set PATH=%VSINSTALLDIR%VC\bin;%PATH%
rem set PATH=%DevEnvDir%;%PATH%
rem set PATH=%WindowsSdkDir%bin;%PATH%
