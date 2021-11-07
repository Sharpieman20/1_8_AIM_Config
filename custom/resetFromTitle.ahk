pid := A_Args[1]
keydelay := A_Args[2]


pid := A_Args[1]
keydelay := A_Args[2]

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

CreateWorld()