pid := A_Args[1]
keydelay := A_Args[2]

global hardcoreDelay := 80 ; Delay to ensure you activate hardcore
global saveAndQuitDelay := 60 ; The amount of time between the macro pressing "Escape" and it pressing "SaveAndQuit". If you are experiencing crashes, Increase this number
global obsDelay := 50 ; Delay for obs scene switching
global fastReset := False ; Change this to "True" if you use the fastReset mod
global hardcore := False ; Change this to "True" if you play Hardcore mode
global moveWorlds := True ; Change this to "False" if you are experiencing frequent chunk errors
global instanceFreezing := False ; Change this to False if you don't want instance freezing (not reccomended)
global disableTTS := False
global switchDelay := 0 ; Increase this number if the instances arent switching. Set this to 0 if instanceFreezing is off
global beforeFreezeDelay := 200
global scriptBootDelay := 5000
global 1_8 := False ; Change this to "True" if you use version 1.8

; edit at your own risk
global guiScale := getGUIscale()
global instances := savesDirectories.MaxIndex()
global pids := SetupPIDs()
global pid := PIDs[idx]
global currInst := -1
global resetScriptTime := []
global resetIdx := []
global currInst := -1

getGUIscale()
{
   optionsFile := StrReplace(savesDirectories[1], "saves\", "options.txt")
      FileReadLine, guiScale, %optionsFile%, 7
	if InStr(guiScale, 1)
	  return 1
	else if InStr(guiScale, 2)
	  return 2
	else if InStr(guiScale, 3)
	  return 3
	else
	  return 4
}

ExitWorld()
{
  if (guiScale == 4) {
      Send, {Escape} 
      Sleep SaveAndQuitDelay
      if (fastReset == True)
        MouseClick, Left, 960, 820
      else
      MouseClick, Left, 960, 720 
    }
  else if (guiScale == 3) {
      Send, {Escape}
      Sleep SaveAndQuitDelay
      if (fastReset == True) 
        MouseClick, Left, 950, 680
      
      else 
        MouseClick, Left, 950, 610
      }
  else if (guiScale == 2) {
      Send, {Escape}
      Sleep SaveAndQuitDelay
      if fastReset == True) 
        MouseClick, Left, 960, 540
      
      else 
        MouseClick, Left, 960, 500
      }
  else if (guiScale == 1) {
      Send, {Escape}
      Sleep SaveAndQuitDelay
      if (fastReset == True) 
        MouseClick, Left, 960, 410
      else 
        MouseClick, Left, 960, 385
    }
}

CreateWorld()
{
  if (guiScale == 4)
  {
    MouseClick, Left, 950, 500
    loop,
    {
      PixelSearch, Px, Py, 340, 860, 370, 895, 0x000000, 0, Fast RGB
        if (!ErrorLevel)
          break
    }
    MouseClick, Left, 1280, 910
      if (hardcore == True) {
        Sleep HardcoreDelay
        MouseClick, Left, 960, 500
        Sleep hardcoreDelay
    }
    loop,
    {
      PixelSearch, Px, Py, 340, 860, 370, 895, 0x000000, 0, Fast RGB
        if (ErrorLevel)
          break
    }
    Send, {Enter}
  }
  else if (guiScale == 3)
  {
    MouseClick, Left, 950, 450
    loop,
    {
      PixelSearch, Px, Py, 965, 950, 1430, 915, 0x000000, 0, Fast RGB
        if (!ErrorLevel)
          break
    }
    MouseClick, Left, 1190, 955
      if (hardcore == True) {
        Sleep hardcoreDelay
        MouseClick, Left, 960, 370
        Sleep hardcoreDelay
    }
    loop,
    {
      PixelSearch, Px, Py, 730, 560, 1180, 630, 0x000000, 0, Fast RGB
        if (!ErrorLevel)
          break
    }
    Send, {Enter}
  }
  else if (guiScale == 2)
  {
    MouseClick, Left, 955, 385
    loop,
    {
      PixelSearch, Px, Py, 650, 970, 660, 985, 0x000000, 0, Fast RGB
        if (!ErrorLevel)
          break
    }
    MouseClick, Left, 1111, 995
      if (harcore == True) {
        Sleep hardcoreDelay
        MouseClick, Left, 950, 250
        Sleep hardcoreDelay
    }
    loop,
    {
      PixelSearch, Px, Py, 650, 970, 660, 985, 0x000000, 0, Fast RGB
        if (ErrorLevel)
          break
    }
    Send, {Enter}
  }
  else if (guiScale == 1) 
  {
    MouseClick, Left, 960, 325
    loop,
    {
      PixelSearch, Px, Py, 800, 1025, 810, 1035, 0x000000, 0, Fast RGB
        if (!ErrorLevel)
          break
    }
    MouseClick, Left, 1035, 1035
      if (hardcore == True) {
        Sleep hardcoreDelay
        MouseClick, Left, 960, 125
        Sleep hardcoreDelay
    }
    loop,
    {
      PixelSearch, Px, Py, 800, 1025, 810, 1035, 0x000000, 0, Fast RGB
        if (ErrorLevel)
          break
    }
    Send, {Enter}
  }
}

ExitWorld()
CreateWorld()