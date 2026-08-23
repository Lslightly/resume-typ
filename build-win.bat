@echo off
del *.pdf

set files=resume-cn
echo Generating...

for %%f in (%files%) do (
  (
    echo #import "main.typ": *;
    echo #show: chicv
  ) > %%f.typ
)

echo #runReader(Chinese) >> resume-cn.typ
@REM echo #runReader(Simplified) >> resume.typ
@REM echo #runReader(EnglishFull) >> resume-elab.typ

for %%f in (%files%) do (
  echo Building %%f.typ
  if defined FONT_PATHS (
    typst compile %%f.typ --font-paths "%FONT_PATHS%"
  ) else (
    typst compile %%f.typ
  )
)
