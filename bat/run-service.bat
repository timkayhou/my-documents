@echo off
title cmd

::Get administrator privileges
PUSHD %~DP0
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)
goto :eof
:runas

set srvice-name=MySQL80
set start-message=The service %srvice-name% has been started.
set stop-message=The service %srvice-name% has been stopped.
set failed-message=The service %srvice-name% run failed.

:: Run service or stop service
sc start %srvice-name% && cls && msg %username% /Time:3 %start-message% || sc stop %srvice-name% && cls && msg %username% /Time:3 %stop-message% || cls && msg %username% %failed-message%
