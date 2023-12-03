`::
    afk := !afk
    if (afk){
        CenteredToolTip("On")
;-------------------------- 1 hour in milliseconds: 3600000 --------------------------
;-------------------------- 1.5 hours in milliseconds: 5400000 --------------------------
;-------------------------- 2 hours in milliseconds: 7,200,000 --------------------------	
        SetTimer, StartMacro2, 3600000 ; Set a timer to trigger StartMacro2 after 1 hour
    }
    Else {
        CenteredToolTip("Off")
        SetTimer, StartMacro2, Off ; Turn off the timer if ` is pressed again
    }
    While (afk){
        Send q
        Sleep 100
        Send 5
        Sleep 4000
        Random, rand, -5000, 5000
        SendInput, {o Down}
        Sleep (20000 + rand)
        SendInput, {o Up}   
        Sleep 100
    }
Return

StartMacro2:
    ; Define the search area
    XStart := 1230
    YStart := 600
    XEnd := 1320
    YEnd := 700 

    Loop {
        ; Search for the target color within the specified area
        PixelSearch, FoundX, FoundY, XStart, YStart, XEnd, YEnd, 0x0520FF, 15, Fast
        If (ErrorLevel = 0) {
            MouseMove, FoundX, FoundY
            ; MsgBox, Target color found!
            Sleep, 2000 ; Allow it to get to position
            Send {a}
            Sleep, 2000
            Send {LButton}
            Break       
        }
        Else {
           ;  MsgBox, Target color not found, continuing the search...
        }
        Sleep, 1000 
    }
    SetTimer, StartMacro2, Off ; Turn off the timer after executing once
    return

CenteredToolTip(text, duration = 999){ ; Duration in ms (MilliSeconds). Default value can be optionally overridden
    ToolTip, %text%, A_ScreenWidth/2, A_ScreenHeight/2
    SetTimer, RemoveToolTip, -%duration% ; Negative to only trigger once
}
RemoveToolTip(){
    ToolTip
}