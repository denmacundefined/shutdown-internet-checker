:START
@echo
PING 8.8.8.8|find "TTL=" >NUL
IF NOT ERRORLEVEL 1 goto :END
IF     ERRORLEVEL 1 goto :TRYAGAIN1

:TRYAGAIN1
timeout 60
@echo
PING 8.8.8.8|find "TTL=" >NUL
IF NOT ERRORLEVEL 1 goto :END
IF     ERRORLEVEL 1 goto :TRYAGAIN2

:TRYAGAIN2
timeout 60
@echo
PING 8.8.8.8|find "TTL=" >NUL
IF NOT ERRORLEVEL 1 goto :END
IF     ERRORLEVEL 1 goto :TRYAGAIN3

:TRYAGAIN3
timeout 60
@echo
PING 8.8.8.8|find "TTL=" >NUL
IF NOT ERRORLEVEL 1 goto :END
IF     ERRORLEVEL 1 goto :FAILURE

:FAILURE
ECHO You do not have an active connection.
ECHO Shutdown PC in 60 seconds.  Run SHUTDOWN -a to abort. 
shutdown /s /t 1 /f

:END
timeout 60
goto :START