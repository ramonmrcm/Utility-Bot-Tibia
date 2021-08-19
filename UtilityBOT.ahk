#SingleInstance, Force ; Allow only one running instance of script
#Persistent ; Keep script permanently running until terminated
#NoEnv ; Avoid checking empty variables to see if they are environment variables
#Warn ; Enable warnings to assist with detecting common errors
;#NoTrayIcon ; Disable the tray icon of the script
SendMode, Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir, %A_ScriptDir% ; Change the working directory of the script
SetBatchLines, -1 ; Run script at maximum speed
OnExit, ExitSub ; Run a subroutine or function automatically when the script exits
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
; =======================================================================================

; Script ================================================================================

Return ; End automatic execution
; =======================================================================================

; Labels ================================================================================
MenuHandler:
    MsgBox, You selected %A_ThisMenuItem% from menu %A_ThisMenu%.
Return

GuiEscape:
GuiClose:
ExitSub:
    ExitApp ; Terminate the script unconditionally
Return

;========================================================================================================================================

GUIMain() {
        Static GUICreate := GUIMain()
        Global          

;----------------------------------------------------------------------------------
    ;tamanho da gui principal     
    GUIWidth := 500, GUIHeight := 300
    Gui, Show, % " w" GUIWidth " h" GUIHeight, Utility BOT by "Khoriuz"
;----------------------------------------------------------------------------------
    ;Caixas separatórias
    Gui, Add, GroupBox, x5 y5 w400 h150, Utilities
    ;Gui, Add, GroupBox, x5 y150 w400 h120, Support
;----------------------------------------------------------------------------------
    ;Macro de Loot
    Gui, Add, CheckBox, x10 y20 gMacroLoot vMacroLoot, Macro de Loot
    Gui, Add, Text, x150 y20, Botão 5 para ativar o Macro de Loot!
    SetTimer, MacroLoot, 1
    macrolooton := 0
;----------------------------------------------------------------------------------
    ;Combo de Ek
    Gui, Add, CheckBox, x10 y40 gComboEk vComboEk, Auto Combo Ek 
    Gui, Add, Text, x150 y40, Botão 4 ativa e 6 desativa o Combo de Ek!
    SetTimer, ComboEk, 1
    comboekon := 0
;----------------------------------------------------------------------------------
    ;Utani hur
    Gui, Add, CheckBox, x10 y60 gHaste vHaste, Auto Utani hur
    SetTimer, Haste, 150
;----------------------------------------------------------------------------------
    ;Amulet
    Gui, Add, CheckBox, x10 y80 gAmulet vAmulet, Auto Amulet
    SetTimer, Amulet, 150
;----------------------------------------------------------------------------------
    ;Ring
    Gui, Add, CheckBox, x10 y100 gRing vRing, Auto Ring
    Gui, Add, Text, x150 y100, Utilizar com Skill Ring ou Dwarven
    SetTimer, Ring, 150
;----------------------------------------------------------------------------------
    ;Auto Eat
    Gui, Add, CheckBox, x10 y120 gEat vEat, Auto Eat
    SetTimer, Eat, 150
;----------------------------------------------------------------------------------
    ;Healing
    Gui, Add, CheckBox, x15 y150 gHealingHP vHealingHP, Health
    Gui, Add, ComboBox, vPercent, 100|90
;----------------------------------------------------------------------------------

     

}

;Combo de EK (Exori, Exori gran, Exori, Exori Mas)
ComboEk:
GuiControlGet, ComboEk
           if (ComboEk = 1) {
                If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
    
                comboekon := 1

                 }                    
             }   
return

    #If (comboekon = 1)


4::
    StopLoop := False

    Loop {
        if StopLoop {
            Break
        } else {
            Send, {f8}
            Sleep, 2050
            if StopLoop {
                Break
            } else {
                Send, {f7}
                Sleep, 2050
                if StopLoop {
                    Break
                } else {
                    Send {f8}
                    Sleep, 2050
                    if StopLoop {
                        Break
                    } else {
                        Send, {f10}
                        Sleep, 2050
                    }
                }
            }
        }
    }
return

6::
    StopLoop := True
return


;Macro de pegar loot
MacroLoot:
     GuiControlGet, MacroLoot
           if (MacroLoot = 1) {
                If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
    
                macrolooton := 1

                 }    
            } 
return

    #If (macrolooton = 1)

    5::

    macrolooton := 0

    SetMouseDelay, 0
    SetKeyDelay, 0
    SetDefaultMouseSpeed, 5
    MouseGetPos, StartX, StartY

    Send {Shift Down}{Click 955, 436, right}
    Send {Shift Down}{Click 955, 510, right}
    Send {Shift Down}{Click 881, 510, right}
    Send {Shift Down}{Click 807, 510, right}
    Send {Shift Down}{Click 808, 439, right}
    Send {Shift Down}{Click 807, 369, right}
    Send {Shift Down}{Click 882, 364, right}
    Send {Shift Down}{Click 953, 364, right}
    Send {Shift Up}
    MouseMove, StartX, StartY

;Usar Utani hur
Haste:
    GuiControlGet, Haste
            if (Haste = 1){
                If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
                
                    ImageSearch, HurX, HurY, A_ScreenWidth - 368, 0, A_ScreenWidth, A_ScreenHeight + 480, *55, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\Hur.png

                        if (ErrorLevel = 1) {
                            Send, {f11}
                        }
                }
            }
return

;Puxar amulet
Amulet:
    GuiControlGet, Amulet
            if (Amulet = 1){
                If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
                
                    ImageSearch, x, y, 0, 0, 1920, 1080, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\amulet.png

                        if (ErrorLevel = 0) {
                            Send, {l}
                        }
                }
            }
return

;Puxar Ring
Ring:
    GuiControlGet, Ring
            if (Ring = 1){
                If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
                
                    ImageSearch, x, y, 0, 0, 1920, 1080, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\ring.png

                        if (ErrorLevel = 0) {
                            Send, {ç}
                        }
                }
            }
return

;Auto Eat
Eat:
    GuiControlGet, Eat 
        if (Eat = 1){
            If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {

                ImageSearch, x, y, 0, 0, 1920, 1080, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\hungry.png

                    if(ErrorLevel = 0){
                        Send, {[}
                    }
            }
        }
return

;Healar HP
HealingHP:
    GuiControlGet, HealingHP
        if (HealingHP = 1){          
            
                If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
                    
                    ImageSearch, x, y, 0, 0, 1920, 1080, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\health\health100.png

                   if(ErrorLevel = 1){
                      MsgBox, oi
                    }
                }
            }
return

























; função para possibilitar a leitura em fullscreen
isWindowFullScreen( winTitle )
{
    winID := WinExist( winTitle )
    If ( !winID )
        Return false

    WinGet style, Style, ahk_id %WinID%
    WinGetPos ,,,winW,winH, %winTitle%
    Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
}






