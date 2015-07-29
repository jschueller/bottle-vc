echo @off

rem FIXME: "%VSSHELL2010INSTALLDIR%VC\bin\vcvars32.bat
rem fails: reg query "HKLM\Software\Microsoft\VisualStudio\SxS\VS7" /v "10.0"
rem https://bugs.winehq.org/show_bug.cgi?id=24017

set VSSHELL2010INSTALLDIR=C:\Program Files\Microsoft Visual Studio 10.0\
set VS100COMNTOOLS=%VSSHELL2010INSTALLDIR%\Common7\Tools\
set VS100COMNTOOLSDIR=%VS100COMNTOOLS%
set VSINSTALLDIR=%VSSHELL2010INSTALLDIR%
set WindowsSdkDir=C:\Program Files\Microsoft SDKs\Windows\v7.0A\
set DevEnvDir=%VSINSTALLDIR%Common7\IDE\
set INCLUDE=%VSINSTALLDIR%VC\INCLUDE;%INCLUDE%
set INCLUDE=%WindowsSdkDir%\Include;%INCLUDE%
set LIB=%VSINSTALLDIR%VC\LIB;%LIB%
set LIB=%WindowsSdkDir%Lib;%LIB%
set PATH=%VSINSTALLDIR%Common7\Tools;%PATH%
set PATH=%VSINSTALLDIR%VC\bin;%PATH%
set PATH=%DevEnvDir%;%PATH%
set PATH=%WindowsSdkDir%bin;%PATH%
