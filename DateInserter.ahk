#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force

FileEncoding, UTF-8

dateToUse := A_Now
global dates := []
separator := " "
generateDates()



return

=::
+::
EnvAdd, dateToUse, 1, Days
generateDates()
return

-::
_::
EnvAdd, dateToUse, -1, Days
generateDates()
return

SetKeyDelay, 50

1:: 
2::
3::
4:: 
5::
6::
hotkey := StrReplace(A_ThisHotkey, "~")
today := ""
if(dates[A_ThisHotkey])
{
	
	today := dates[A_ThisHotkey]

	Clipboard := 
	Clipboard := dates[A_ThisHotkey]
	ClipWait
	send, ^v
	;sleep,100
}
else
	AlertBox("invalid hotkey",,,1,1,0,200)
ExitApp
return

Esc::ExitApp




generateDates()
{
	global dateToUse
	global separator
	global dates := []
	
	;Format: Sun 24 Jan
	FormatTime, TimeString, %dateToUse%, ddd%separator%dd%separator%MMM
	dates.push(TimeString) 
	;Format: 24 Sep
	FormatTime, TimeString, %dateToUse%, dd%separator%MMM
	dates.push(TimeString) 
	;Format: 24 Sep 2021
	FormatTime, TimeString, %dateToUse%, MMM%separator%yyyy
	dates.push(TimeString) 
	;Format: Fri 24 Sep 2021
	FormatTime, TimeString, %dateToUse%, ddd%separator%dd%separator%MMM%separator%yyyy
	dates.push(TimeString)
	
	;Format: 2021-09-24 Fri
	separator := "-"
	FormatTime, TimeString, %dateToUse%, yyyy%separator%MM%separator%dd ddd
	dates.push(TimeString)
	
	;Format: 10/10/2021 excel
	separator := "/"
	FormatTime, TimeString, %dateToUse%, dd%separator%MM%separator%yyyy
	dates.push(TimeString)
	separator := " "
	
	
	tooltiptext := ""
	loop, % dates.MaxIndex()
	{
		;MsgBox % "Line:" A_LineNumber " | " A_ScriptName "`n===========`n`n" dates[A_Index]
		tooltiptext .= A_Index ": " dates[A_Index] "`n"
	}
	tooltiptext .= "`n`n+: increase date"
	tooltiptext .= "`n-: decrease date"
	
	
	
	
	tooltiptext .= "`n`n" TimeString
	
	ToolTip, %tooltiptext%
}

return

