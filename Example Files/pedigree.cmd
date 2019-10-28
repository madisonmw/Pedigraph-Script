::title				pedigree.cmd
::description		The script automates the output file names of the free-to-use software Pedigraph when creating pedigrees.
::author			Madison M. Watkins
::date				10/28/2019
::notes				Requires Pedigraph software, sed, and their components in directory with input files. Only runs on Windows.

@echo off

type pedigraph.dat > pedigraph1.dat
type pedigraph.dat > backuppedigraph.dat

::"find /c /v """ is the equivalent of the Unix/Linux wc -l. It counts (/c) lines that contain
::the inverse (/v) of nothing, so anything with substance.

for /L %%i in (1,1,4) do (
::The conditional can be changed to whatever so that families may be filtered out.
for /f "tokens=*" %%a in ('type %%i.txt ^| find /c /v ""') do (
if /i %%a GTR 2 (
	sed "s/myoutput.ps/%%i.ps/" pedigraph1.dat > pedigraph.dat
	pedigraph %%i.txt
	
) else (
    echo Pedigree for %%i not drawn, not enough individuals
)
)
)
::Cleaning up extra files and restoring pedigraph.dat to how it originally was.
type backuppedigraph.dat > pedigraph.dat
del pedigraph1.dat
del backuppedigraph.dat
