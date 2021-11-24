::------------------------------------------------------------------------------
:: NAME
::     StringWalker Challenge
::
:: DESCRIPTION
::     https://www.dostips.com/forum/viewtopic.php?f=3&t=10290&p=65607#p65607
::     Take a string and an integer and display each character up to the index
::     of the integer provided, assuming the string is 1-indexed (wtf). Literal
::     digits, if statements, for loops, and delayed expansion are not allowed.
::
:: AUTHOR
::     Sintrode/ShadowThief
::------------------------------------------------------------------------------
@echo off

set /a one=number_of_processors/number_of_processors
set /a zero=one-one
set /a two=one+one

set /p "string=Enter a string: "
set /p "limit=Enter the one-indexed character to stop at: "
set "%string%=throw an error if the string is empty" %two%>nul || exit /b
set "%limit%=throw an error if the limit is empty" %two%>nul || exit /b

:: call a subroutine and set the exit /b value to %current_index%/%limit%
set counter=%zero%
:loop
setlocal
call :get_substring || exit /b
endlocal
set /a counter+=one
goto :loop

:get_substring
set /a index_label=counter+one
call set "char=%%string:~%counter%,%one%%%"
set "%char%=throw an error if we've gone past the end of the string" %two%>nul || exit /b %one%
echo %index_label%:"%char%"
set /a exit_code=%index_label%/%limit%
exit /b %exit_code%
