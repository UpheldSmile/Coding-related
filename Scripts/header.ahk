SetWorkingDir %A_ScriptDir%  
#SingleInstance Force
#Persistent
#NoEnv
#InstallKeybdHook
#InstallMouseHook
SendMode Input
Process, Priority,, A
SetBatchLines -1
SetKeyDelay, -1, -1
SetMouseDelay, -1, -1
SetControlDelay -1
SetWinDelay -1
#MaxHotkeysPerInterval 100000
#MaxThreads 255

*F11:: Suspend

*F2::
Suspend Off
Critical
Sleep 100
Reload
return

MoveMouse(x, y) {
    DllCall("mouse_event", "UInt", 0x01, "UInt", x, "UInt", y)
}

;MoveMouse(2739, 0) 
;MoveMouse(6108, 0) ads
; ratio = 2.23, round up