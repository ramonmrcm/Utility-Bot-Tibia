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

    
    ;Gui Tabs
    Gui, add, tab3, x0 y5 w500 h300, Utilities|Healing

;----------------------------------------------------------------------------------
    ;tamanho da gui principal     
    GUIWidth := 500, GUIHeight := 300
    Gui, Show, % " w" GUIWidth " h" GUIHeight, Utility BOT by "Khoriuz"
;----------------------------------------------------------------------------------
    ;Macro de Loot
    Gui, Add, CheckBox, x10 y50 gMacroLoot vMacroLoot, Macro de Loot
    Gui, Add, Text, x150 y50, Botão 5 para ativar o Macro de Loot!
    SetTimer, MacroLoot, 1
    macrolooton := 0
;----------------------------------------------------------------------------------
    ;Combo de Ek
    Gui, Add, CheckBox, x10 y70 gComboEk vComboEk, Auto Combo Ek 
    Gui, Add, Text, x150 y70, Botão 4 ativa e 6 desativa o Combo de Ek!
    SetTimer, ComboEk, 1
    comboekon := 0
;----------------------------------------------------------------------------------
    ;Utani hur
    Gui, Add, CheckBox, x10 y90 gHaste vHaste, Auto Utani hur
    SetTimer, Haste, 300
;----------------------------------------------------------------------------------
    ;Amulet
    Gui, Add, CheckBox, x10 y110 gAmulet vAmulet, Auto Amulet
    SetTimer, Amulet, 150
;----------------------------------------------------------------------------------
    ;Ring
    Gui, Add, CheckBox, x10 y130 gRing vRing, Auto Ring
    Gui, Add, Text, x150 y130, Utilizar com Skill Ring ou Dwarven
    SetTimer, Ring, 150
;----------------------------------------------------------------------------------
    ;Auto Eat
    Gui, Add, CheckBox, x10 y150 gEat vEat, Auto Eat
    SetTimer, Eat, 300
;----------------------------------------------------------------------------------
    ;Healing HP
    Gui, tab, 2 ; o 2 significa a aba em que ele se localiza
    Gui, Add, CheckBox, x15 y30 gHealingHP vHealingHP, Health Spell 
    Gui, Add, ComboBox, x15 y50 w70 vPercentHP, 100|90|80|70|60|50|40|30|20|10 ; Caixa de porcentagem do HP
    Gui, add, combobox, x150 y50 w70 vUserHotkeyHP, F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12 ; caixa de hotkey do usuario
    Gui, Add, Text, x90 y50, Percent
    Gui, add, text, x230 y50, << Hotkey
    SetTimer, HealingHP, 150
;----------------------------------------------------------------------------------
    ;Healing MP
    Gui, tab, 2 ; o 2 significa a aba em que ele se localiza
    Gui, Add, CheckBox, x15 y90 gHealingMP vHealingMP, Mana Potion
    Gui, Add, ComboBox, x15 y110 w70 vPercentMP, 100|90|80|70|60|50|40|30|20|10 ; caixa de porcentagem da MP
    Gui, add, combobox, x150 y110 w70 vUserHotkeyMP, F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12 ; caixa de hotkey do usuario
    Gui, Add, Text, x90 y110, Percent
    gui, add, text, x230 y110, << Hotkey
    SetTimer, HealingMP, 0
;----------------------------------------------------------------------------------
    ;RingUtamo
    ;Gui, tab, 1
    ;Gui, add, Checkbox, x10 y170 gRingUtamo vRingUtamo, Puxar Ring
    ;Gui, Add, text, x150 y170, Puxar ring de Utamo
    ;SetTimer, RingUtamo, 150
;----------------------------------------------------------------------------------
    ;AntiAFK
    Gui, tab, 1
    Gui, add, Checkbox, x10 y170 gAntiAFK vAntiAFK, Anti AFK
    Gui, Add, text, x150 y170, AntiAFK
    SetTimer, AntiAFK, 0
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

    Send {Ctrl Down}{Click 955, 436, right}
    Send {Ctrl Down}{Click 955, 510, right}
    Send {Ctrl Down}{Click 881, 510, right}
    Send {Ctrl Down}{Click 807, 510, right}
    Send {Ctrl Down}{Click 808, 439, right}
    Send {Ctrl Down}{Click 807, 369, right}
    Send {Ctrl Down}{Click 882, 364, right}
    Send {Ctrl Down}{Click 953, 364, right}
    Send {Ctrl Up}
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
                    ImageSearch, Amuletx, Amulety, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\amulet.png
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
                    ImageSearch, Ringx, Ringy, 0, 0, A_ScreenWidth, A_ScreenHeight, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\ring.png
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
                ImageSearch, HungryX, HungryY, A_ScreenWidth - 368, 0, A_ScreenWidth, A_ScreenHeight + 480, *55, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\hungry.png
                if(ErrorLevel = 0){
                    Send, {[}
                }
            }
        }
return

;Healar HP
HealingHP:
    GuiControlGet, HealingHP
    GuiControlGet, PercentHP
    GuiControlGet, UserHotkeyHP
        if (HealingHP = 1){                
            If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
                ImageSearch, HealingHPx, HealingHPy, 0, 0,  A_ScreenWidth, A_ScreenHeight, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\health\health%PercentHP%.png
                if(ErrorLevel = 1){
                    Send, {%UserHotkeyHP%}
                    Sleep, 1000
                }
            }       
        }
return

;Healar MP
HealingMP:
    GuiControlGet, HealingMP
    GuiControlGet, PercentMP
    GuiControlGet, UserHotkeyMP
        if (HealingMP = 1){                
            If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
                ImageSearch, HealingMPx, HealingMPy, 0, 0,  A_ScreenWidth, A_ScreenHeight, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\mana\mana%PercentMP%.png
                if(ErrorLevel = 1){
                    Send, {%UserHotkeyMP%}
                    Sleep, 1000
                }
            }        
        }
return

;Puxar ring de Utamo
;RingUtamo:
;    GuiControlGet, RingUtamo
;    GuiControlGet, PercentHP
;        if(RingUtamo = 1){
;            If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
;                ImageSearch, RingUtamoX, RingUtamoY, 0, 0,  A_ScreenWidth, A_ScreenHeight, C:\Users\ramon\Documents\ProjetoUtilityBOT\Imagens\health\health20.png
;                if(ErrorLevel = 1){
;                    Send, {Ins}
;                }
;            }
;        }
;return

;Anti AFK
AntiAFK:
    GuiControlGet, AntiAFK
        if(AntiAFK = 1){
            If WinActive("ahk_exe Krolork.exe") or isWindowFullScreen("ahk_exe Krolork.exe") or WinActive("ahk_class Qt5QWindowOwnDCIcon") or isWindowFullScreen("ahk_class Qt5QWindowOwnDCIcon")or WinActive("ahk_exe client.exe") or isWindowFullScreen("ahk_exe client.exe") {
                Send, {Ctrl Down} 
                Send, {Down}
                Send, {Ctrl Up}
                Sleep, 30000
                Send, {Ctrl Down}
                Send, {Up}
                Send, {Ctrl Up}
                Sleep, 30000
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






