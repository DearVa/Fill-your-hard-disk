You can delete the 'C:\CON' file by executing these commands in cmd  
cacls \\\\?\C:\CON /t /e /c /r (Your user name)  
del \\\\?\C:\CON  
