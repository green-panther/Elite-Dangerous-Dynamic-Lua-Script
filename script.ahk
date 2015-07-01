#NoEnv
#Persistent
;#Warn

#SingleInstance force
EnvGet userhomedir, USERPROFILE
SetWorkingDir, %userhomedir%\Documents\EliteOut\
flx := 0
fly := 0
flz := 1

; Credits: Mostly kabachi, Randshot
; Needed Key Bindings:
; x = Speed 0%
; c = Speed 75%
; v = Speed 100%
; j = Enable Frame Shift Drive
; F8/F9/F10 unbound
; Left = Yaw Left
; Right = Yaw Right
; Up = Pitch Up
; Down = Pitch Down
; TAB = Engine Boost
; Lua Script: "Auto Drop Safe" enabled for auto dropping at end (also turn off "show on print" in ce)
; Lua Script: "Compass" and "Navi" enabled

F10::
{
  pause
}

F8::
{
  breakloop := 1
  SendInput {x Down}
  sleep 100
  SendInput {x Up}
  sleep 100
  SendInput {j Down}
  sleep 100
  SendInput {j Up}
  return
}

F9::
{
  InputBox, iterations, Number of required jumps, Enter the number of Jumps (left side panel + 1).
  InputBox, dropatend, Drop at end?, If your destination is a station or similar enter 1, else 0.

  if (dropatend = 1)
  {
    iterations += 1
  }
  iterationIndex := iterations

  sleep 2000

  loop %iterations% {
    SendInput {x Down}
    sleep 100
    SendInput {x Up}
    sleep 100

    Loop
    {
    	FileReadLine, flz, navi.txt, 3
    	if (flz < 1.03) and (flz > 0.97)
      {
        break
      }

    	Loop
    	{
    		FileReadLine, flx, navi.txt, 1
    		if (flx < 0.05) and (flx > -0.05)
        {
          break
        }

        if (flx > 0)
        {
    		  SendInput {Right Down}
    		  sleep 20
    		  SendInput {Right Up}
        }
        else
        {
    		  SendInput {Left Down}
    		  sleep 20
    		  SendInput {Left Up}
        }
    	}

    	Loop
    	{
    		FileReadLine, fly, navi.txt, 2
    		if (fly < 0.05) and (fly > -0.05)
        {
          break
        }

        if (fly > 0)
        {
    		  SendInput {Up Down}
    		  sleep 20
    		  SendInput {Up Up}
        }
        else
        {
    		  SendInput {Down Down}
    		  sleep 20
    		  SendInput {Down Up}
        }
    	}
    }

    if (dropatend = 0) or (iterationIndex > 1)
    {
      sleep 100
      SendInput {j Down}
      sleep 100
      SendInput {j Up}
      sleep 12000
      SendInput {Tab Down}
      sleep 100
      SendInput {Tab Up}
      sleep 100
      SendInput {v Down}
      sleep 100
      SendInput {v Up}
      sleep 3500
      SendInput {x Down}
      sleep 100
      SendInput {x Up}
      sleep 26000
      SendInput {Up Down}
      sleep 14000
      SendInput {Up Up}
      sleep 100
      SendInput {v Down}
      sleep 100
      SendInput {v Up}
      sleep 15000
      SendInput {Up Down}
      sleep 1000
      SendInput {Up Up}
      sleep 5000
      SendInput {x Down}
      sleep 100
      SendInput {x Up}
      sleep 100
    }
    else
    {
      SendInput {c Down}
      sleep 100
      SendInput {c Up}
      sleep 100

      Loop
      {
        if (breakloop = 1)
        {
          break
        }

      	FileReadLine, flz, navi.txt, 3
      	if (flz < 1.03) and (flz > 0.97)
      	{
          ; do nothing
          ; maybe sleep 20
      	}
        else
        {
        	Loop
        	{
        		FileReadLine, flx, navi.txt, 1
        		if (flx < 0.05) and (flx > -0.05)
            {
              break
            }

            if (flx > 0)
            {
              SendInput {Right Down}
        		  sleep 20
        		  SendInput {Right Up}
            }
            else
            {
              SendInput {Left Down}
              sleep 20
              SendInput {Left Up}
            }
          }

        	Loop
        	{
        		FileReadLine, fly, navi.txt, 2
        		if (fly < 0.05) and (fly > -0.05)
            {
              break
            }
            if (fly > 0)
            {
        		  SendInput {Up Down}
        		  sleep 20
        		  SendInput {Up Up}
            }
            else
            {
        		  SendInput {Down Down}
        		  sleep 20
        		  SendInput {Down Up}
            }
        	}
        }
      }
    }
    iterationIndex -= 1
  }
  return
}
