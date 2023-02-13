;-------------------------- VARIABLE INPUT --------------------------

global betweenP_Z := 1614
global betweenP_P := 1072
global betweenP_R := 1608
; 220 fps low = 1611
MouseMove(move_x, move_y) 
{
    DllCall("mouse_event", "UInt", 1, "Int", move_x, "Int", move_y, "UInt", 0, "Int", 0)
    return
}
BlockInput, Off
 gScreen := Array( Ceil(A_ScreenWidth), Ceil(A_ScreenHeight) )
    gScreenCenter := Array( Ceil(A_ScreenWidth / 2), Ceil(A_ScreenHeight / 2) )
    halfArea := 150
    startX := gScreenCenter[1] - halfArea
    startY := gScreenCenter[2] - halfArea
    endX := gScreenCenter[1] + halfArea
    endY := gScreenCenter[2] + halfArea
; 120 fps low = 1615
; go higher, ping will bounce

global desiredLimb := 45
global ping := 0
CoordMode, Pixel, Screen

;-------------------------- VARIABLE CALCULATION --------------------------

global baseLimbTime := 17186 - betweenP_R
global desiredLimbTime := baseLimbTime + desiredLimb
global pingAdjustment := 260 - ping
;global Offset := 0.0000 ; unused

;global diff := 0 ; unused
global CounterBefore, CounterAfter, Frequency
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)


;-------------------------- GUI BACKGROUND --------------------------

g_x := A_ScreenWidth * 0.027
g_y := A_ScreenHeight * 0.22

Gui, bg:+AlwaysOnTop -Caption +LastFound -SysMenu +ToolWindow -DPIScale +E0x20
Gui, bg:Add, Progress, c839DD5 Background141414, 0
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


*~WheelUp::
desiredLimb++
desiredLimbTime++
GuiControl, lmb:Text, desiredLimbTime, %desiredLimbTime%
GuiControl, lmb:Text, desiredLimb, [%desiredLimb%]
return

*~WheelDown::
desiredLimb--
desiredLimbTime--
GuiControl, lmb:Text, desiredLimbTime, %desiredLimbTime%
GuiControl, lmb:Text, desiredLimb, [%desiredLimb%]
return


;-------------------------- GANTU MACRO --------------------------
*LAlt::
;lSleep(pingAdjustment)
Loop, 5
{
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SendInput {MButton}
lSleep(betweenP_P, externalStart)
DllCall("QueryPerformanqceCounter", "Int64*", externalStart)
SendInput {MButton}
lSleep(betweenP_R, externalStart)
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SendInput {f5}
lSleep(4)
SendInput {q}
lSleep(20)
SendInput {f8}
lSleep(18)

loop 80 {
	SendInput {LButton}
	lSleep(10)
	}
lSleep(15300, externalStart)
lSleep(desiredLimbTime, externalStart)
}
return


;-------------------------- TERRY MACRO --------------------------

*c::
;lSleep(pingAdjustment)
SetTimer, swap, -200
Loop, 4
{
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SendInput {MButton}
lSleep(betweenP_Z, externalStart)
DllCall("QueryPerformanceCounter", "Int64*", externalStart)
SendInput {LButton}
lSleep(20)
SendInput {RButton Up}
SetTimer, swap, -15800
lSleep(15300, externalStart)
lSleep(desiredLimbTime, externalStart)
}
return

swap:
SendInput {q}
Sleep 1
SendInput {f8}
Sleep 50
SendInput {RButton Down}
return


;-------------------------- WATER MACRO --------------------------
*shift::
SetTimer, Shard, Off
BlockInput, On
lSleep(35)
SendInput { [ Down } ;sprint
SendInput {Space Down}
lSleep(35)
SendInput {Space Up}
SendInput { [ Up } ;sprint
lSleep(30)
SendInput {[} ;plinker
lSleep(20)
SendInput {q} ;melee
lSleep(20)
SendInput {W Down} ;saccstech
lSleep(50)
SendInput {5} ;operator
lSleep(110)
SendInput {e} ;propa
SendInput {W Up}
lSleep(10)
SendInput {1} ;VS
lSleep(700)
SendInput {q} ;MELEE
lSleep(80)
SendInput {Tab} ;AW
MoveMouse(1180, 270)
lSleep(900)
loop 5 {
SendInput {LButton}
lSleep(10)
}
;BlockInput, Off

Return


;-------------------------- WATER MACRO test --------------------------
m::
;		BlockInput, On
		MoveMouse(-460,-225)
		lSleep(80)
		SendInput {[ Down}
		SendInput {W Down}
		lSleep(294)
		SendInput {W Up}
		MoveMouse(0, 700)
		lSleep(100)
		SendInput {q}
		lSleep(210)
		SendInput {5}
		lSleep(10)
		;SendInput {w down}
		lSleep(70)
		MoveMouse(0, -280)
		lSleep(150)
		;SendInput {w Up}
		SendInput {e}
		;lSleep(510)
		;SendInput {e}
		lSleep(50)
		SendInput {q}
		MoveMouse(-1480, -330)
		lSleep(100)
		;SendInput {f8}
		lSleep(100)
		;SendInput {RButton Down}
		loop 10 {
			PixelSearch, newX, newY, startX, startY, endX, endY, FF00D2, 3, Fast RGB
        	MouseMove((newX - gScreenCenter[1])/2, (newY - gScreenCenter[2])/2)
			lSleep(10)
		}
		lSleep(100)
		;MoveMouse(-10, 10)
		;lSleep(100)
		BlockInput, Off
		loop 80 {
			SendInput {LButton}
			lSleep(10)
			}
		SendInput {[ Up}
		;SendInput {RButton Up}
		Return
;---------------- Gantu Prefire --------------------------


;*shift::
SetTimer, Shard, 10
loop
 PixelSearch, pX, pY, 714, 931, 960, 1000, 0x2A27B5, 20, Fast 
until (ErrorLevel == 0)
;MsgBox, I see shrine
GoSub, DPS
Return

Shard:
SendInput {/}
return

DPS:
SetTimer, Shard, Off
BlockInput, On
lSleep(15)
SendInput { [ Down } ;sprint
SendInput {Space Down}
lSleep(35)
SendInput {Space Up}
SendInput { [ Up } ;sprint
lSleep(30)
SendInput {[} ;plinker
lSleep(20)
SendInput {q} ;melee
lSleep(20)
SendInput {W Down} ;saccstech
lSleep(50)
SendInput {5} ;operator
lSleep(130)
SendInput {e} ;propa
SendInput {W Up}
lSleep(10)
SendInput {1} ;VS
lSleep(700)
SendInput {q} ;MELEE
lSleep(80)
SendInput {Tab} ;AW
MoveMouse(1180, 270)
lSleep(900)
loop 5 {
SendInput {LButton}
lSleep(10)
}

a:=0
while a < 5
		{
		PixelSearch, pX, pY, 1230, 670, 1330, 770, 0x48F5E4, 10, Fast ; CL
		if (ErrorLevel == 0)
		{
		Return
		}
		
		a++
	}
b:=0
while b < 20
		{
		PixelSearch, pX, pY, 1550, 500, 1700, 650, 0x87AF98, 20, Fast ; CR
		if (ErrorLevel == 0)
		{
			;-------------------------- CR --------------------------
	MoveMouse(-45,-290)
			lSleep(20)
			SendInput {[ Down}
			SendInput {W Down}
			lSleep(275)
			SendInput {W Up}
			MoveMouse(0, 550)
			lSleep(50)
			SendInput {q}
			lSleep(130)
			SendInput {5}
			lSleep(50)
			MoveMouse(-750, -180)
			lSleep(90)
			SendInput {e}
			lSleep(70)
			SendInput {q}
			lSleep(50)
			SendInput {f8}
			lSleep(30)
			SendInput {f8}
			MoveMouse(-1285, -180)
			lSleep(100)
			loop 10 {
			PixelSearch, newX, newY, startX, startY, endX, endY, FF00D2, 3, Fast RGB
        	MouseMove((newX - gScreenCenter[1])/2, (newY - gScreenCenter[2])/2)
			lSleep(10)
		}
			BlockInput, Off
			SendInput {[ Up}
			;SendInput {RButton Down}
			lSleep(0)
			loop 80 {
				SendInput {LButton}
				lSleep(10)
				}
			;SendInput {RButton Up}
				Return
		}
		b++
	}
lSleep(70)   
PixelSearch, pX, pY, 0, 500, 200, 757, 0x203A4D, 15, Fast ;
if (ErrorLevel == 0)
{
	;-------------------------- Mid --------------------------
			BlockInput, On
		MoveMouse(-460,-225)
		lSleep(80)
		SendInput {[ Down}
		SendInput {W Down}
		lSleep(294)
		SendInput {W Up}
		MoveMouse(0, 700)
		lSleep(100)
		SendInput {q}
		lSleep(210)
		SendInput {5}
		lSleep(10)
		;SendInput {w down}
		lSleep(70)
		MoveMouse(0, -320)
		lSleep(150)
		;SendInput {w Up}
		SendInput {e}
		;lSleep(510)
		;SendInput {e}
		lSleep(50)
		SendInput {q}
		MoveMouse(-1480, -330)
		lSleep(100)
		;SendInput {f8}
		lSleep(100)
		;SendInput {RButton Down}
		loop 10 {
			PixelSearch, newX, newY, startX, startY, endX, endY, FF00D2, 3, Fast RGB
        	MouseMove((newX - gScreenCenter[1])/2, (newY - gScreenCenter[2])/2)
			lSleep(10)
		}
		lSleep(100)
		;MoveMouse(-10, 10)
		;lSleep(100)
		BlockInput, Off
		loop 80 {
			SendInput {LButton}
			lSleep(10)
			}
		SendInput {[ Up}
		;SendInput {RButton Up}
		Return
		}
	else If (ErrorLevel == 1)
	{
	;-------------------------- Long --------------------------
			
BlockInput, On
		MoveMouse(-1000,-256)
				lSleep(200)

		SendInput {[ Down}
		SendInput, {Space Down}
		lSleep(50)
		SendInput, {Space Up}
		lSleep(50)
		SendInput {[}
		lSleep(5)
		SendInput {[ Down}
		SendInput {W Down}
		lSleep(256)
		SendInput {W Up}
		SendInput {2}
		lSleep(100)
		MoveMouse(-1020,550)
		lSleep(200)
		loop 10 {
			PixelSearch, newX, newY, startX, startY, endX, endY, FF00D2, 3, Fast RGB
        	MouseMove((newX - gScreenCenter[1])/2, (newY - gScreenCenter[2])/2)
			lSleep(10)

		}
		lSleep(100)
		SendInput {q}
		lSleep(360)
		SendInput {5}
		lSleep(100)
		MoveMouse(-685,-205)
		lSleep(150)
		loop 10 {
			PixelSearch, newX, newY, startX, startY, endX, endY, F4F315, 3, Fast RGB ; change colour, cant be bothered right
        	MouseMove((newX - gScreenCenter[1])/2, (newY - gScreenCenter[2])/2)
			lSleep(1)
		}
		SendInput {e}
   	lSleep(100)
		SendInput {q}
      lSleep(20)
      SendInput {f8}
      lSleep(20)
      ;SendInput {RButton Down}
		BlockInput, Off
		loop 110 {
			SendInput {LButton}
			lSleep(10)
			}
		lSleep(110)
		SendInput {[ Up}
     ; SendInput {RButton Up}
		Return
		
	}
Return



;-------------------------- Hydro Prefire --------------------------

*`::
SetTimer, Shard, 10
loop
 PixelSearch, pX, pY, 714, 931, 960, 1000, 0x2A27B5, 20, Fast 
until (ErrorLevel == 0)
;MsgBox, I see shrine
GoSub, DPS_1
Return



DPS_1:
SetTimer, Shard, Off
BlockInput, On
lSleep(15)
SendInput { [ Down } ;sprint
SendInput {Space Down}
lSleep(35)
SendInput {Space Up}
SendInput { [ Up } ;sprint
lSleep(30)
SendInput {[} ;plinker
lSleep(20)
SendInput {q} ;melee
lSleep(20)
SendInput {W Down} ;saccstech
lSleep(50)
SendInput {5} ;operator
lSleep(130)
SendInput {e} ;propa
SendInput {W Up}
lSleep(10)
SendInput {1} ;VS
lSleep(700)
SendInput {q} ;MELEE
lSleep(80)
SendInput {Tab} ;AW
MoveMouse(1185, 270)
lSleep(900)
loop 5 {
SendInput {LButton}
lSleep(10)
}
BlockInput, Off
d:=0
while d < 5
		{
		PixelSearch, pX, pY, 1230, 670, 1330, 770, 0x48F5E4, 3, Fast ; CL
		if (ErrorLevel == 0)
		{
		Return
		}
		
		d++
	}
e:=0
while e < 30
		{
		PixelSearch, pX, pY, 1550, 500, 1700, 650, 0x87AF98, 25, Fast ; CR
		if (ErrorLevel == 0)
		{
			;-------------------------- HYDRO CR --------------------------
		MoveMouse(-45,-290)
			lSleep(20)
			SendInput {[ Down}
			SendInput {W Down}
			lSleep(275)
			SendInput {W Up}
			MoveMouse(0, 550)
			lSleep(50)
			SendInput {q}
			lSleep(130)
			SendInput {5}
			lSleep(50)
			MoveMouse(-750, -180)
			lSleep(90)
			SendInput {e}
			lSleep(70)
			SendInput {q}
			lSleep(50)
			SendInput {f8}
			lSleep(30)
			SendInput {f8}
			MoveMouse(-1285, -180)
			lSleep(100)
			loop 10 {
			PixelSearch, newX, newY, startX, startY, endX, endY, FF00D2, 3, Fast RGB
        	MouseMove((newX - gScreenCenter[1])/2, (newY - gScreenCenter[2])/2)
			lSleep(10)
		}
			BlockInput, Off
			SendInput {[ Up}
			;SendInput {RButton Down}
			lSleep(0)
			loop 80 {
				SendInput {LButton}
				lSleep(10)
				}
			;SendInput {RButton Up}
				Return
		}
		e++
	}
lSleep(150)   
PixelSearch, pX, pY, 0, 530, 50, 580, 0x5A5A52, 5, Fast ;
if (ErrorLevel == 0)
{
	;-------------------------- Hydro Mid --------------------------
				BlockInput, On
		MoveMouse(-470,-247)
		lSleep(80)
		SendInput {[ Down}
		SendInput {W Down}
		lSleep(295)
		SendInput {W Up}
		MoveMouse(0, 750)
		lSleep(100)
		SendInput {q}
		lSleep(150)
		SendInput {5}
		lSleep(70)
		MoveMouse(0, -300)
		lSleep(60)
		SendInput {e}
		lSleep(510)
		SendInput {e}
		lSleep(50)
		SendInput {q}
		MoveMouse(-1480, -330)
		lSleep(30)
		SendInput {f8}
		lSleep(30)
		SendInput {RButton Down}
		BlockInput, Off
		lSleep(500)
		loop 80 {
			SendInput {LButton}
			lSleep(10)
			}
		SendInput {[ Up}
		SendInput {RButton Up}
		Return
		}
	else If (ErrorLevel == 1)
	{
	;-------------------------- Hydro Long --------------------------
	BlockInput, On
		MoveMouse(-1000,-255)
				lSleep(100)

		SendInput {[ Down}
		SendInput, {Space Down}
		lSleep(50)
		SendInput, {Space Up}
		lSleep(50)
		SendInput {[}
		lSleep(5)
		SendInput {[ Down}
		SendInput {W Down}
		lSleep(261)
		SendInput {W Up}
		lSleep(100)
		MoveMouse(-949,450)
		lSleep(300)
		SendInput {q}
		lSleep(340)
		SendInput {5}
		lSleep(100)
		MoveMouse(-560,-185)
		lSleep(150)
		SendInput {e}
   	lSleep(100)
		SendInput {q}
      lSleep(20)
      SendInput {f8}
      lSleep(20)
      SendInput {RButton Down}
		BlockInput, Off
		loop 110 {
			SendInput {LButton}
			lSleep(10)
			}
		lSleep(110)
		SendInput {[ Up}
      SendInput {RButton Up}
		Return
	
	}
Return
}