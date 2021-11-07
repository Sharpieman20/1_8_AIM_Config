; Pre 1.9 RSG Multi Instance Macro, Created by FinestPigeon. Coding help from: Sheep, Peej, ScarRuns, Specnr, and Four.
; ***READ*** (common issues that need to be addressed)
; If you use a custom texture pack, make sure the title screen's splash text color is default (Yellow). This is used in the macro to make sure you are in the title screen before creating the world
; How do I keep track of attempts? The macro will automatically create 2 txt files (Pre19_Attempts.txt & Pre19_SessionAttempts.txt) These both mark the total attempts and the session attempts which you can display on your OBS using a text source and reading from a file. Make sure to set the total # of attemps in the actual Attempts.txt file as well as setting the AttemptsSession.txt file to 0 whenever you enter a new play session.
; You will need to install the new LiveSplit dll file in order for LiveSplit to reset and start everytime you switch instances. Link to file: https://www.mediafire.com/file/885dazsdmvrbc8d/LiveSplit.Minecraft.dll/file | put this into your "Components" folder in your LiveSplit folder
; You must be on borderless/windowed-fullscreen when using the macro
; If you have any other questions/concerns, message me on discord. FinestPigeon#8738

#NoEnv
#SingleInstance, force
Process, Priority, , A

RAlt:: UnsuspendAll()

Spectator()
{
  SetMouseDelay, -1
  SetKeyDelay, -1
  SetTitleMatchMode, 2
  SetWinDelay, -1
  Send, {Escape}
  Sleep 80
  MouseClick, Left, 1111, 540
  Sleep 80
  MouseClick, Left, 1200, 330
  Sleep 80
  MouseClick, Left, 730, 1030
  Sleep 80
  Send, /
  Sleep 80
  if (1_8 = True) {
    Send, gamemode spectator
    Sleep 80
    Send, {Enter}
    }
  else
    Send, gamemode creative
    Sleep 80
    Send, {Enter}
}

MoveWorlds()
{
  for I, saves in savesDirectories
  {
    Loop, Files, %saves%*, D
    {
      _Check :=SubStr(A_LoopFileName,1,1)
      If (InStr(A_LoopFileName, "New World") || InStr(A_LoopFileName, "Speedrun #"))
        FileMoveDir, %saves%%A_LoopFileName%, %oldWorldsFolder%%A_LoopFileName%%A_NowUTC%, R
    }
  }
}

#IfWinActive, Minecraft
{
  F6::
    Spectator() ; The keybind for going into spectator or creative mode (stop checking FUNgineer)
  return
  
  Numpad0:: ; Manually moves all worlds into your old worlds folder, only use if moveWorlds = False
    MoveWorlds()
  return

  Y::
    ExitApp
  return

}