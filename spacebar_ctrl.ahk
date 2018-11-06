; Recommended, but not required:
SendMode Input
#NoEnv
#SingleInstance force

#Include dual.ahk
dual := new Dual

#Include defaults.ahk

#If true
RWin::RWin
RWin UP::Send {RWin UP}
LWin::LWin
LWin UP::Send {LWin UP}
#If

#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.

;BigCtrl-like.
*Space::
*Space UP::dual.combine("RCtrl", A_ThisHotkey)

#If

*ScrollLock::dual.reset()
