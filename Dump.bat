::Roms
set baseImage=roms\Kaettekita Mario Brothers (Japan) (Disk Writer).fds

::Folders
set projectFolder=%cd%
set spiroFolder=%cd%\tools\spiro

cd "%projectFolder%"

::Dump script
"%spiroFolder%\Spiro.exe" /ProjectDirectory "%projectFolder%" /DumpScript
@pause