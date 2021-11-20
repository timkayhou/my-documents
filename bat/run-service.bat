@echo off
title cmd

::Get administrator privileges
PUSHD %~DP0
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)
goto :eof
:runas

:: Run service or stop service
set srvice-name="MySQL80" 
sc start %srvice-name% || sc stop %srvice-name%
