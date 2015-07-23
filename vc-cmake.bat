
set PATH=%PATH%;C:\Program Files\CMake 2.8\bin
set PATH=%PATH%;C:\local\jom

rem bash variables can interfer
set CC=
set CXX=

rem FIXME: https://bugs.winehq.org/show_bug.cgi?id=38859
start mspdbsrv.exe -verbose -start -spawn -shutdowntime 10
