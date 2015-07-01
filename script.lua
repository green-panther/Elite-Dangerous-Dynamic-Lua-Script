--
-- The MIT License (MIT)
--
-- Copyright (c) 2015 by Randshot
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

----------------------------------------------------------------------------------------------
-- Credits: Randshot, Apeman, kabachi, laji, djdoom32, hasson, Hans211, hoki, Jamesc00ls and Dark Byte
-- Note: Only use in Solo mode
-- Important: YOU HAVE TO COPY THE WHOLE SCRIPT FOR IT TO WORK!
-- Changelog can be found here: http://www.unknowncheats.me/wiki/Elite:_Dangerous_Dynamic_Lua_Script#Changelog
-- Questions and Bug Reports go to Randshot
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- Hotkey configuration
-- You can change the hotkeys to toggle the cheats here
-- Write nil for no hotkey
----------------------------------------------------------------------------------------------
hLogOffSky = { VK_LCONTROL, VK_F1 }
hDamage = nil
hDamageBoost = { VK_LCONTROL, VK_F2 }
hDamageSource = nil
hNoHullD = nil
hSomeShieldD = nil
hNoShieldD = nil
hNoModD = nil
hPowerOutput = nil
hEnRedUse = nil
hEnNoUse = nil
hHDCharge = { VK_LCONTROL, VK_F3 }
hSCCharge = { VK_LCONTROL, VK_F4 }
hNoCooldown = { VK_LCONTROL, VK_F5 }
hNoMasslock = { VK_LCONTROL, VK_F6 }
hHyFuelRange = nil
hHyFuelUsage = nil
hHyFuelInf = nil
hMining = nil
hCSV = nil
hBPC = nil
hTDP = nil
hFixedD = nil
hAutoD = nil
hManualD = { VK_LCONTROL, VK_F7 }
hScoop = nil
hHeatsink = nil
hFuel = nil
hNoFuel = nil
hRedFuel = nil
hNoWarning = nil
hDebug = { VK_LCONTROL, VK_F8 }
hOut = { VK_LCONTROL, VK_F9 }

----------------------------------------------------------------------------------------------
-- Logging for debugging purposes
-- Note 1: You can find the logs in "~\Documents\EliteOut\"
-- Note 2: The log files will be sorted by the date of script execution
----------------------------------------------------------------------------------------------
function exist(f) return type(f) == 'string' and os.rename(f, f) and true or false end
function readFile(f, mode) local r = io.open(f, mode or 'rb') local ret = r:read('*all') r:close() return ret end
function writeFile(f, mode, str) local r = io.open(f, mode or 'w+') r:write(str) r:close() end

settings = getSettings('EDScript')
foundError = false
pendingDeletion = false
debugmode = true

userdir = os.getenv("USERPROFILE")
eliteoutdir = userdir .. [[\Documents\EliteOut\]]
os.execute([[md "]] .. eliteoutdir .. [["]])

datadir = eliteoutdir .. [[Data\]]
os.execute([[md "]] .. datadir .. [["]])

logfiledir = eliteoutdir .. [[Logs\]]
os.execute([[md "]] .. logfiledir .. [["]])

logfilename = logfiledir .. 'debugLog.' .. os.date('%y%m%d%H%M') .. '.log'
udpfilename = logfiledir .. 'udpLog.' .. os.date('%y%m%d%H%M') .. '.log'

function printDBG(str)
  if (ctable['debug'].on == true or debugmode == true) then
    safe.execute(writeFile, logfilename, "a+", string.format("[%s] %s", tostring(os.date()), str))
  end
end

function printDual(str)
  if (ctable['disableOutput'].on == false) then
    print(str)
  end
  printDBG(str)
end

----------------------------------------------------------------------------------------------
-- For error handling
----------------------------------------------------------------------------------------------
safe = {};
safe.execution = function (...)
  local _status, _func, _error = pcall(...)
  if (_error) then
    return (function () error(" safe.execution error : " .. _error,3) end);
  end
  return _func
end

----------------------------------------------------------------------------------------------
-- Makeshift HTTP GET
----------------------------------------------------------------------------------------------
function httpGet(url, file)
  assert(type(url) == 'string', 'has to be an url')
  local tmpfile = datadir .. "_tmp.data"
  file = type(file) == 'string' and datadir .. file or tmpfile
  local result = string.format("printDual('ERROR: %s --> %s')", url, file)

  local cmd = string.format([[powershell -command "& { (New-Object Net.WebClient).DownloadFile('%s', '%s') }"]], url, tmpfile)
  cmd = assert(io.popen(cmd, 'r'))
  local response = cmd:read('*all')
  local requestGood = response:len() == 0
  cmd:close()

  if (requestGood) then
    result = safe.execute(readFile, tmpfile)
    safe.execute(writeFile, file, "w+", tmpfile)
    if (exist(tmpfile)) then
      os.remove(file)
    end
    printDual(string.format("Updated file: %s", file))

  else
    if (exist(file)) then
      result = safe.execute(readFile, file)
      printDual(string.format("Couldn't update file! Using saved one!"))

    else
      printDual(string.format("Couldn't update file! No saved file found!"))
    end
  end

  return result
end

----------------------------------------------------------------------------------------------
-- Update related
----------------------------------------------------------------------------------------------
gitDataUrl = [[https://raw.githubusercontent.com/Randshot/Elite-Dangerous-Dynamic-Lua-Script/master/Data/]]

function updateData()
  safe.execute(httpGet, gitDataUrl .. "version.data", "version.data")
  safe.execute(httpGet, gitDataUrl .. "ctable.data", "ctable.data")
  safe.execute(httpGet, gitDataUrl .. "main.data", "main.data")
  safe.execute(httpGet, gitDataUrl .. "breakpoint.data", "breakpoint.data")
  safe.execute(httpGet, gitDataUrl .. "functions.data", "functions.data")
  safe.execute(httpGet, gitDataUrl .. "keys.data", "keys.data")
end

----------------------------------------------------------------------------------------------
-- Load data function
----------------------------------------------------------------------------------------------
function loadData(dataname)
  if (exist(datadir .. dataname)) then
    local data = safe.execute(loadstring, safe.execute(readFile, datadir .. dataname))()
    return data
  else
    local data = safe.execute(httpGet, gitDataUrl .. dataname, dataname)
    return data
  end
end

----------------------------------------------------------------------------------------------
-- Loading Functions
----------------------------------------------------------------------------------------------
functionsData = loadData("functions.data")
functionsData()

----------------------------------------------------------------------------------------------
-- Tables
----------------------------------------------------------------------------------------------
script = orderedTable { __name = "script" }
patches = orderedTable { __name = "patches" }
ctable = orderedTable { __name = "Cheat Table" }
ctableData = loadData("ctable.data")
ctableData()
keyIDs = {}
keysData = loadData("keys.data")
keysData()

----------------------------------------------------------------------------------------------
-- Version output
----------------------------------------------------------------------------------------------
versionData = loadData("version.data")
versionData()
printDual("Game Version: " .. gameVersion)
printDual("Lua Script Version: " .. scriptVersion .. "\n")

----------------------------------------------------------------------------------------------
-- CE Version check
-- Checks for the right version of CE
-- If the versions don't match, the main script won't be executed!
----------------------------------------------------------------------------------------------
RequiredCEVersion = 6.4
if (getCEVersion == nil) or (getCEVersion() < RequiredCEVersion) then
  foundError = true
  printDual("Please install version " .. RequiredCEVersion .. " of CE!")
else
  printDual("CE Version: " .. getCEVersion())
end

----------------------------------------------------------------------------------------------
-- Get Settings
----------------------------------------------------------------------------------------------
if (tonumber(settings.Value['created']) == 1) then
  for k in ordered(ctable) do
    ctable[k].enableOnStart = tonumber(settings.Value[k])
  end
  printDual("Loaded Settings!")

else
  for k in ordered(ctable) do
    settings.Value[k] = 0
    ctable[k].enableOnStart = settings.Value[k]
  end
  settings.Value['created'] = 1
  printDual("Created Settings!")
end

----------------------------------------------------------------------------------------------
-- PrintDBG/Delete Settings
----------------------------------------------------------------------------------------------
function printSettings()
  for k in ordered(ctable) do
    printDBG(k .. ": " .. settings.Value[k])
  end
end

function deleteSettings()
  for k in ordered(ctable) do
    settings.Value[k] = nil
    ctable[k].enableOnStart = 0
  end
  settings.Value['created'] = 0
  printDual("Deleted Settings!")
end

----------------------------------------------------------------------------------------------
-- Load Main Script
----------------------------------------------------------------------------------------------
script.main = loadData("main.data")

----------------------------------------------------------------------------------------------
-- Load onBreakpoint function
----------------------------------------------------------------------------------------------
script.onBreakpoint = loadData("breakpoint.data")

----------------------------------------------------------------------------------------------
-- Auto attach to Elite: Dangerous
----------------------------------------------------------------------------------------------
script.ed = "EliteDangerous32.exe"
script.wd = "WatchDog.exe"

secToWait = 80 -- Time Buffer for game to load properly
once = true
detached = false
local detachWD = {}

-- Hooking WaitForDebugEvent
function detachWD.hook()
  detachWD.waitForDebugEvent = getAddress("KERNEL32.WaitForDebugEvent")

  if (detachWD.waitForDebugEvent == nil) or (detachWD.waitForDebugEvent == 0) then
    printDual("Failed to hook WaitForDebugEvent!")
    return true
  end

  debugger_onBreakpoint = detachWD.OnBreakpoint
  debugProcess()
  debug_setBreakpoint(detachWD.waitForDebugEvent)
  printDual(string.format("Successfully hooked WaitForDebugEvent @ 0x%X!", detachWD.waitForDebugEvent))

  return false
end

-- Will be called when a breakpoint is hit
function detachWD.OnBreakpoint()
  if (EIP == detachWD.waitForDebugEvent) then
    autoAssemble([[
    alloc(_edPID, 100)
    registersymbol(_edPID)
    ]])

    writeInteger(getAddress("_edPID"), script.edPID)

    autoAssemble([[
    alloc(detour,2048)

    detour:
    push [_edPID]
    call KERNEL32.DebugActiveProcessStop
    jmp ntdll.RtlExitUserProcess

    KERNEL32.WaitForDebugEvent:
    jmp detour
    ]])

    detached = true
    printDual("Detached and Terminated WatchDog! WDPID: " .. script.wdPID .. " | EDPID: " .. script.edPID)
    debug_removeBreakpoint(detachWD.waitForDebugEvent)

    debug_continueFromBreakpoint(co_run)
    return 1
  end
end

-- Will be called every 10 seconds
function start()
  if (once == true) then
    printDual("----------------------------------------")
    printDual("Preparing for the main script!")
    printDual("----------------------------------------\n")

    once = false
    attachWD()
  end
end

-- Will be called every second until the process WatchDog is found
function waitForWD(timer)
  if ((getProcessIDFromProcessName(script.wd) ~= nil) and (getProcessIDFromProcessName(script.ed) ~= nil)) then
    object_destroy(timer)

    script.edPID = getProcessIDFromProcessName(script.ed)
    script.wdPID = getProcessIDFromProcessName(script.wd)


    printDual("Found the process WatchDog.exe!")
    printDual("Press HOME/POS1 upon seeing the main menu to start the script!")

    forceStart = createNonRepHotkey(function() start() end, VK_HOME)
  end
end

-- Will be called after the WatchDog process is found
function attachWD()
  openProcess(script.wdPID)
  printDual("Successfully attached to WatchDog! PID = " .. getOpenedProcessID())

  foundError = detachWD.hook()

  if (foundError == false) then
    t2 = createTimer()
    timer_setInterval(t2, 1000)
    timer_onTimer(t2, attachED)
    printDual("Waiting for WatchDog to be detached and terminated...")

  else
    printDual("An error occurred! Please contact the script creator!")
  end
end

-- Will be called every second until it attaches to Elite: Dangerous
function attachED(timer)
  if (detached == true) then
    object_destroy(timer)
    openProcess(script.edPID)
    printDual("Successfully attached to Elite: Dangerous! PID = " .. getOpenedProcessID())

    patches['hashing'] = AOBSwap('89 0B C6 02 00 C6 44 24 ? ?', '90 90 90 90 90 90 90 90 90 90', nil, true, true, 'hashing', true)
    printDual("Patched Comparison!")

    patches['call'] = AOBSwap('FF D0 8B 4C 24 34 8B 54 24 48', '90 90', nil, true, true, 'call', true)
    printDual("Patched GetThreadContext call!")

    printDual("----------------------------------------")
    printDual("Starting the main script!")
    printDual("----------------------------------------\n")

    script.main()
  end
end

-- If no error occurred, a timer will be started, which calls attachWD() every second
if (foundError == false) then
  t1 = createTimer()
  timer_setInterval(t1, 1000)
  timer_onTimer(t1, waitForWD)
  printDual("Waiting for WatchDog to start...")
end
