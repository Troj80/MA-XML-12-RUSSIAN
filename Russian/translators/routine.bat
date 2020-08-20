SET _DEVICE=%1
SET _APKFILE=%2

SET xmlcmp=D:\Android\XMLCompare\XMLCompare.exe /au

SET _src=D:\Android\Github\__repo\
SET _dst=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\device\
SET _mnt=D:\Android\Github\MA-XML-12-RUSSIAN\Russian\main

SET _dir=\%_APKFILE%\res\values-ru\

IF EXIST %_mnt%%_dir%strings.xml (
  del %_dst%%_DEVICE%%_dir%strings.xml
  copy %_mnt%%_dir%strings.xml %_dst%%_DEVICE%%_dir% 

  copy %_mnt%%_dir%plurals.xml %_dst%%_DEVICE%%_dir% 
  copy %_mnt%%_dir%arrays.xml %_dst%%_DEVICE%%_dir% 
) ELSE (
  echo result.xml missing
  goto _finish
)

%xmlcmp% /s %_src%%_DEVICE%%_dir%strings.xml /d %_dst%%_DEVICE%%_dir%strings.xml /n 4

IF EXIST %_dst%%_DEVICE%%_dir%result.xml (
  del %_dst%%_DEVICE%%_dir%strings.xml
  ren %_dst%%_DEVICE%%_dir%result.xml strings.xml
) ELSE (
  echo result.xml missing
)

:_finish