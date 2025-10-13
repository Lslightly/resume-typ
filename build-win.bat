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
  typst compile %%f.typ
  @REM del %%f.typ
)
