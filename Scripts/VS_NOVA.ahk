;-------------------------- VARIABLE INPUT --------------------------

global betweenP_Z := 1612
global betweenP_P := 1100
global betweenP_PZ := 1616
; 220 fps low = 1611
; 120 fps low = 16155
; go higher, ping will bounce

global desiredLimb := 10
global ping := 0
CoordMode,Pixel,Screen
CoordMode,Mouse,Screen
;-------------------------- VARIABLE CALCULATION --------------------------

global baseLimbTime := 17186 - betweenP_Z
global desiredLimbTime := baseLimbTime + desiredLimb
global pingAdjustment := 180 - ping
;global Offset := 0.0000 ; unused

;global diff := 0 ; unused
global CounterBefore, CounterAfter, Frequency
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)


;-------------------------- GUI BACKGROUND --------------------------

g_x := A_ScreenWidth * 0.027
g_y := A_ScreenHeight * 0.22

Gui, bg:+AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, bg:Add, Progress, c839DD5 Background141414, 0f
Gui, bg:Color, 151515
Gui, bg:Show, x%g_x% y%g_y% w110 h50 NoActivate
WinSet, Transparent, 210

;-------------------------- OFFSET DISPLAY --------------------------
Gui, osd:+AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, osd:Color, 000000
Gui, osd:Font, s8 q5, Montserrat Medium
Gui, osd:Add, Text, x29 y4 vOffset cee7dff, ( 0.0000 )
Gui, osd:Show, x%g_x% y%g_y% w125 h50 NoActivate
WinSet, TransColor, 000000
UpdateOffset(begin, end := "") {
   if (end == "")
      DllCall("QueryPerformanceCounter", "Int64*", end)
   Offset := MeasureTime(begin, end)
   GuiControl, osd:Text, Offset, ( %Offset% )
}
;-------------------------- LIMB DISPLAY --------------------------

Gui, lmb:+AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, lmb:Color, 000000
Gui, lmb:Font, s12 q5, Montserrat Medium
Gui, lmb:Add, Text, x12 y20 w50 vdesiredLimbTime cWhite, %desiredLimbTime%
Gui, lmb:Add, Text, x65 y20 w50 vdesiredLimb cffa600, [%desiredLimb%]
Gui, lmb:Show, x%g_x% y%g_y% w125 h50 NoActivate
WinSet, TransColor, 000000


;-------------------------- INCLUDED LIBRARIES --------------------------

#include Lsleep.ahk
#include header.ahk

;-------------------------- MACROS --------------------------

#IfWinActive, Warframe
{

;-------------------------- GUI ADJUSTMENTS --------------------------


*~Up::
desiredLimb++
desiredLimbTime++
GuiControl, lmb:Text, desiredLimbTime, %desiredLimbTime%
GuiControl, lmb:Text, desiredLimb, [%desiredLimb%]
return

*~Down::
desiredLimb--
desiredLimbTime--
GuiControl, lmb:Text, desiredLimbTime, %desiredLimbTime%
GuiControl, lmb:Text, desiredLimb, [%desiredLimb%]
return


;-------------------------- WATERS --------------------------
*x::
;loop
   ;PixelSearch, pX, pY, 0, 500, 700, 1100, 0xB51715, 8, Fast RGB
;until (ErrorLevel == 0)
;lSleep(250)
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SendInput {MButton}  ; MID PROPA
SendInput {h}
lSleep(300)
MoveMouse(0, 65)  ; CLOSE LEFT PROPA
lSleep(520, externalStart)
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SendInput {MButton} ; CLOSE LEFT PROPA
SendInput {h}
lSleep(300)
MoveMouse(492, 193) ; CLOSE RIGHT PROPA CLOSE RIGHT PROPA CLOSE RIGHT PROPA
lSleep(560, externalStart) ; CLOSE RIGHT PROPA CLOSE RIGHT PROPA CLOSE RIGHT PROPA
SendInput {MButton} 
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SetTimer, Shard, 10
lSleep(225, externalStart)
MoveMouse(-1880, 197)
;   MoveMouse(-750, 0)
GoSub, Unstuck
lSleep(520, externalStart)
SendInput {MButton}
SendInput {q}
 ;  MoveMouse(-730, 285)
  ; lSleep(20)
   ;SendInput {]}
   ;lSleep(20)
   ;SendInput {]}
   lSleep(40)
Loop, 100
{
   SendInput {LButton} 
   lSleep(3)
}
SendInput {LButton up}
return

Shard:
SendInput {/}
return

Unstuck:
SetTimer, Shard, Off
SendInput {t}
Sleep 10
SendInput {Backspace}
SendInput {Enter}
Sleep 10
SendInput {t}
Sleep 10
SendInput {Backspace}
Send, /unstuck
Sleep 10
SendInput {Enter}
return

	;-------------------------- LIMB MACRO --------------------------

	*c::
	lSleep(pingAdjustment)
	Loop, 5
	{
	DllCall("QueryPerformanceCounter", "Int64*", ext1)
	SendInput {MButton}
	DllCall("QueryPerformanceCounter", "Int64*", ext2)
	UpdateOffset(ext3, ext2)
	Sleep 100
	GoSub, swap
	lSleep(betweenP_Z, ext1)
	DllCall("QueryPerformanceCounter", "Int64*", ext3)
	SendInput {LButton}
	sleep 10
	SendInput {RButton Up}
	DllCall("QueryPerformanceCounter", "Int64*", ext4)
	Sleep 100
	SendInput {f}
	Sleep 10000
	UpdateOffset(ext1, ext4)
	lSleep(15300, ext3)
	lSleep(desiredLimbTime, ext3)
	}
	ext1 := 0, ext2 := 0, ext3 := 0, ext4 := 0
	return


swap:
	SendInput {5}
	Sleep 600
	SendInput {f}
	Sleep 200
	SendInput {RButton Down}
	return
	}
	;-------------------------- NEW LIMB MACRO --------------------------
;*LAlt::
;lSleep(pingAdjustment)
Loop, 5
{
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SendInput {MButton}
lSleep(betweenP_PZ, externalStart)
DllCall("QueryPerformanqceCounter", "Int64*", externalStart)
SendInput {LButton}
lSleep(15300, externalStart)
lSleep(desiredLimbTime, externalStart)
}
return
	
F1::
SendInput {1}
SendInput {Esc}
lSleep(240)
DllCall("SetCursorPos", "int", 2088, "int", 1212)
SendInput {LButton down}
lSleep(20)
SendInput {LButton up}
lSleep(30)
SendInput {Esc}
lSleep(300)
SendInput {LButton}
return