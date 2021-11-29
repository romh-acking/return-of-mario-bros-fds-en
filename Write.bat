::Roms
set baseImage=roms\Kaettekita Mario Brothers (Japan) (Disk Writer).fds
set patchedImage=roms\Kaettekita Mario Brothers (NEW).fds
::Folders
set projectFolder=%cd%
set FDSBuilderFolder=Z:\Link to CODE_Private\FDSBuilderC-Sharp\FDSBuilderC-Sharp\bin\Release\netcoreapp3.1
set SpiroFolder=Z:\Link to CODE_Private\Spiro v2\Spiro\bin\Release
set XkasFolder=C:\Users\PC\Documents

cd "%projectFolder%"
del "%patchedImage%"
copy "%baseImage%" "%patchedImage%"

::Expand into FDS rom
::"%FDSBuilderFolder%\FDSBuilderC-Sharp.exe" ^
::--inputDiskImage "%projectFolder%\%baseImage%"  ^
::--outputDiskImage "%projectFolder%\%patchedImage%"  ^
::--expand "%projectFolder%\expansion.json"

::Delete patched disk files
::echo y | rmdir /S "%projectFolder%\disks\patched\"

::Write script
"%SpiroFolder%\Spiro.exe" /ProjectDirectory "%projectFolder%" /Write

::Apply Patches
"%XkasFolder%\xkas+.exe" -o "%patchedImage%" "asm\mario asm.asm" "asm\register screen.asm" "asm\menu.asm" "asm\milestones.asm" "asm\titlescreen.asm" "asm\intermission.asm" "asm\advert.asm" "asm\credits.asm" 

"%patchedImage%"
