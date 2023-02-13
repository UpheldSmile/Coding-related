

; 120 fps low = 1615
; go higher, ping will bounce

global desiredLimb := 45
global ping := 0
CoordMode, Pixel, Screen



;-------------------------- INCLUDED LIBRARIES --------------------------

#include Lsleep.ahk
#include header.ahk


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






;-------------------------- NEW PROJECT SOONGE --------------------------

;*x::
loop {
    PixelSearch, PX, PY, 1400, 777, 1486, 811, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
} until (ErrorLevel == 0)
DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-1280), "UInt", (PY-720))
DllCall("Kernel32\Sleep", "UInt", 30)
loop {
    PixelSearch, PX, PY, 1260, 680 , 1320, 751, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
} until (ErrorLevel == 0)
DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-1280), "UInt", (PY-720))
DllCall("Kernel32\Sleep", "UInt", 30)
loop {
    PixelSearch, PX, PY, 1270, 720 , 1300, 751, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
} until (ErrorLevel == 0)
DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-1280), "UInt", (PY-720))
DllCall("Kernel32\Sleep", "UInt", 30)
Return
*l::
loop {
    PixelSearch, PX, PY, 570, 290t, 710, 430, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
} until (ErrorLevel == 0)0
DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
DllCall("Kernel32\Sleep", "UInt", 30)
loop {
    PixelSearch, PX, PY, 580, 300, 700, 420, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
} until (ErrorLevel == 0)
DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
DllCall("Kernel32\Sleep", "UInt", 30)
loop {
    PixelSearch, PX, PY, 600, 320, 680, 400, 0xFFFFFF, 0, Fast ; Lock on to loc-pin
} until (ErrorLevel == 0)
DllCall("mouse_event", "UInt", 0x01, "UInt", (PX-640), "UInt", (PY-360))
DllCall("Kernel32\Sleep", "UInt", 30)


MouseMove(move_x, move_y) 
{
    DllCall("mouse_event", "UInt", 1, "Int", move_x, "Int", move_y, "UInt", 0, "Int", 0)
    return
}
return


;-------------------------- LOC-PIN lock --------------------------
x::
    gScreen := Array( Ceil(A_ScreenWidth), Ceil(A_ScreenHeight) )
    gScreenCenter := Array( Ceil(A_ScreenWidth / 2), Ceil(A_ScreenHeight / 2) )
    halfArea := 300
    startX := gScreenCenter[1] - halfArea
    startY := gScreenCenter[2] - halfArea
    endX := gScreenCenter[1] + halfArea
    endY := gScreenCenter[2] + halfArea
    while GetKeyState("x", "P")
    {
        PixelSearch, newX, newY, startX, startY, endX, endY, FF00D2, 1, Fast RGB
        if(ErrorLevel)
            break
        MouseMove((newX - gScreenCenter[1])/2, (newY - gScreenCenter[2])/2)
        sleep 50
    }


return


	f7::
		mouseGetPos, x, y
		pixelGetColor,color, %x%, %y%
		msgBox, %color%
	
	return

*shift::
SetTimer, Shard, 10
loop
 PixelSearch, pX, pY, 714, 931, 960, 1000, 0x2A27B5, 20, Fast 
until (ErrorLevel == 0)
;MsgBox, I see shrine
GoSub, DPS
Return

Shard:
;SendInput {/}
return

DPS:
SetTimer, Shard, Off
lSleep(11O)
;SendInput { [ Down }
;SendInput {Space Down}
lSleep(50)
;;SendInput {Space Up}
;;SendInput { [ Up }
lSleep(30)
;;SendInput {[}
lSleep(5)
;;SendInput {q}
lSleep(10)
;;SendInput {5}
lSleep(110)
;;SendInput {e}
lSleep(10)
;;SendInput {1}
lSleep(700)
;;SendInput {q}
lSleep(80)
;;SendInput {Tab}
;MoveMouse(1180, 270)
lSleep(900)
loop 5 {
;;SendInput {LButton}
lSleep(10)
}
a:=0
while a < 5
		{
		PixelSearch, pX, pY, 1200, 650, 1250, 700, 0x48F5E4, 10, Fast ; CL
		if (ErrorLevel == 0)
		{
		MsgBox, cl
		Return
		}
		
		a++
	}
b:=0
while b < 30
		{
		PixelSearch, pX, pY, 1550, 500, 1700, 650, 0x87AF98, 25, Fast ; CR
		if (ErrorLevel == 0)
		{
		SendInput {Space}
		MsgBox, cr %pX% %pY%
		Return	
		}
		b++
	}
lSleep(150)
PixelSearch, pX, pY, 0, 530, 50, 580, 0x5A5A52, 5, Fast ;
if (ErrorLevel == 0)
{
	MsgBox, mid
	
		Return
		}
	else If (ErrorLevel == 1)
	{
		MsgBox, long
		Return
	}
Return

;}
Esc::ExitApp