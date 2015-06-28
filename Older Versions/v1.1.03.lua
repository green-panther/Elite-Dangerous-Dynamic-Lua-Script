----------------------------------------------------------------------------------------------
-- Last Update: 14/06/15
    gameVersion = "v1.3.03"
    scriptVersion = "v1.1.03"
-- Credits: Randshot, Apeman, kabachi, laji, djdoom32, hasson, Hans211, hoki and Dark Byte
-- Note: Only use in Solo mode
-- Important: YOU HAVE TO COPY THE WHOLE SCRIPT FOR IT TO WORK!!!
-- Changelog can be found here: http://www.unknowncheats.me/wiki/Elite:_Dangerous_Dynamic_Lua_Script#Changelog
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- Hotkey configuration
-- You can change the hotkeys to toggle the cheats here
-- Write nil for no hotkey
---------------------------------------------------------------------------------------------- 
hLogOffSky 		= {VK_LCONTROL, VK_F1}
hDamage 		= nil
hDamageBoost 	= {VK_LCONTROL, VK_F2}
hDamageSource 	= nil
hNoHullD		= nil
hSomeShieldD	= nil
hNoShieldD		= nil
hNoModD			= nil
hPowerOutput 	= nil
hEnRedUse	 	= nil
hEnNoUse		= nil
hHDCharge 		= {VK_LCONTROL, VK_F3}
hSCCharge 		= {VK_LCONTROL, VK_F4}
hNoCooldown		= {VK_LCONTROL, VK_F5}
hNoMasslock		= {VK_LCONTROL, VK_F6}
hHyFuelRange	= nil
hHyFuelUsage	= nil
hHyFuelInf		= nil
hMining 		= nil
hCSV 			= nil
hBPC 			= nil
hTDP			= nil
hFixedD 		= nil
hAutoD 			= nil
hManualD 		= {VK_LCONTROL, VK_F7}
hScoop			= nil
hHeatsink		= nil
hNoFuel			= nil
hNoWarning		= nil
hDebug 			= {VK_LCONTROL, VK_F8}
hOut			= {VK_LCONTROL, VK_F9}
 
----------------------------------------------------------------------------------------------
-- Key ID table
-- These aren't all IDs, so if yours isn't there, just add it yourself
----------------------------------------------------------------------------------------------  
keyIDs = {}
keyIDs["BACKSPACE"] 	= 8
keyIDs["TAB"] 			= 9
keyIDs["ENTER"] 		= 13
keyIDs["SHIFT"] 		= 16
keyIDs["CTRL"] 			= 17
keyIDs["ALT"] 			= 18
keyIDs["PAUSE"] 		= 19
keyIDs["CAPSLOCK"] 		= 20
keyIDs["ESC"] 			= 27
keyIDs["SPACEBAR"] 		= 32
keyIDs["PAGEUP"] 		= 33
keyIDs["PAGEDOWN"] 		= 34
keyIDs["END"] 			= 35
keyIDs["HOME"] 			= 36
keyIDs["LEFTARROW"] 	= 37
keyIDs["UPARROW"] 		= 38
keyIDs["RIGHTARROW"] 	= 39
keyIDs["DOWNARROW"] 	= 40
keyIDs["INSERT"] 		= 45
keyIDs["DELETE"] 		= 46
keyIDs["0"] 			= 48
keyIDs["1"] 			= 49
keyIDs["2"] 			= 50
keyIDs["3"] 			= 51
keyIDs["4"] 			= 52
keyIDs["5"] 			= 53
keyIDs["6"] 			= 54
keyIDs["7"] 			= 55
keyIDs["8"] 			= 56
keyIDs["9"] 			= 57
keyIDs["A"] 			= 65
keyIDs["B"] 			= 66
keyIDs["C"] 			= 67
keyIDs["D"] 			= 68
keyIDs["E"] 			= 69
keyIDs["F"] 			= 70
keyIDs["G"] 			= 71
keyIDs["H"] 			= 72
keyIDs["I"] 			= 73
keyIDs["J"] 			= 74
keyIDs["K"] 			= 75
keyIDs["L"] 			= 76
keyIDs["M"] 			= 77
keyIDs["N"] 			= 78
keyIDs["O"] 			= 79
keyIDs["P"] 			= 80
keyIDs["Q"] 			= 81
keyIDs["R"] 			= 82
keyIDs["S"] 			= 83
keyIDs["T"] 			= 84
keyIDs["U"] 			= 85
keyIDs["V"] 			= 86
keyIDs["W"] 			= 87
keyIDs["X"] 			= 88
keyIDs["Y"] 			= 89
keyIDs["Z"] 			= 90
keyIDs["LWINDOWS"] 		= 91
keyIDs["RWINDOWS"] 		= 92
keyIDs["APPKEY"] 		= 93
keyIDs["NUMPAD1"] 		= 97
keyIDs["NUMPAD2"] 		= 98
keyIDs["NUMPAD3"] 		= 99
keyIDs["NUMPAD4"] 		= 100
keyIDs["NUMPAD5"] 		= 101
keyIDs["NUMPAD6"] 		= 102
keyIDs["NUMPAD7"] 		= 103
keyIDs["NUMPAD8"] 		= 104
keyIDs["NUMPAD9"] 		= 105
keyIDs["NUMPADTIMES"] 	= 106
keyIDs["NUMPADPLUS"] 	= 107
keyIDs["NUMPADMINUS"] 	= 109
keyIDs["NUMPADDOT"] 	= 110
keyIDs["NUMPAD/"] 		= 111
keyIDs["F1"] 			= 112
keyIDs["F2"] 			= 113
keyIDs["F3"] 			= 114
keyIDs["F4"] 			= 115
keyIDs["F5"] 			= 116
keyIDs["F6"] 			= 117
keyIDs["F7"] 			= 118
keyIDs["F8"] 			= 119
keyIDs["F9"] 			= 120
keyIDs["F10"] 			= 121
keyIDs["F11"] 			= 122
keyIDs["F12"] 			= 123
keyIDs["NUMLOCK"] 		= 144
keyIDs["SCROLLLOCK"] 	= 145
keyIDs["LCTRL"] 		= 162
keyIDs[";"] 			= 186
keyIDs["="] 			= 187
keyIDs[","] 			= 188
keyIDs["-"] 			= 189
keyIDs["."] 			= 190
keyIDs["/"] 			= 191
keyIDs["`"] 			= 192
keyIDs["["] 			= 219
keyIDs["\\"] 			= 220
keyIDs["]" ] 			= 221
keyIDs["'"] 			= 221
 
keyList = {}
hK = {}
hi = 0
for name,value in pairs(keyIDs) do
	keyList[hi] = name
	hi = hi + 1
end
for n = 0,#keyList do
	hK[n] = keyList[n]
end
 
----------------------------------------------------------------------------------------------
-- Logging for debugging purposes
-- client : If you are running multiple clients, you can differentiate them by changing this before executing the script.
-- Note 1: You can find the logs in "~\Documents\EliteOut\"
-- Note 2: The log files will be sorted by client and date of script execution
----------------------------------------------------------------------------------------------
foundError = false
pendingDeletion = false
client = 0
debug = false
userdir = os.getenv("USERPROFILE")
eliteoutdir = userdir..[[\Documents\EliteOut\]]
os.execute([[md "]]..eliteoutdir..[["]])
logfiledir = eliteoutdir..[[Logs\]]
os.execute([[md "]]..logfiledir..[["]])
filename = logfiledir..'C'..client..'_'..os.date('%m_%d_%y %H_%M.log')
function printDBG(string)
	if (table['debug'].on == true or debug == true) then
		f = assert(io.open(filename,"a+"))
		f:write("["..os.date().."] "..string.."\n")
		f:close()
	end
end
 
function printDual(string)
	if (table['disableOutput'].on == false) then
		print(string)
	end
 
	printDBG(string)
end
 
------------------------------------------------------------------------------------
-- Toggle Breakpoint
-- toggleBreakpoint(name, state): For table entry only
-- tb(name, state): Use this to toggle breakpoints manually
------------------------------------------------------------------------------------
numOfBreakpoints = 0
 
function toggleBreakpoint(name, state)
	-- This if-part is for the manual market dump
	if (name == "mdManualD") then
		if (table[name].toUnfreeze == false) then
			save_marketdata()
 
			local txt = table[name].descr.." (pending deletion)"
			-- Will be unfrozen at next breakpoint hit
			table[name].toUnfreeze = true
			table[name].oldDescr = memoryrecord_getDescription(table[name].te)
			memoryrecord_setDescription( table[name].te, txt );
			state = false
			pendingDeletion = true
 
		elseif (table[name].toUnfreeze == true) then
			memoryrecord_unfreeze(table[name].te)
			memoryrecord_setDescription( table[name].te, table[name].oldDescr )
			table[name].toUnfreeze = false
			state = false
			pendingDeletion = false
		end
	end
 
	-- If the entry has a valid address, this if statement will be executed
	if (table[name].addr ~= 1) then
		-- For enabling
		if (state == true and table[name].on == false) then
			-- Special preparations for noCooldown
			if (name == "noCooldown") then
				if (table['scCharge'].on == true) then
					table['scCharge'].reactivate = true
					tb("scCharge", false)
				end
				if (table['hdCharge'].on == true) then
					table['hdCharge'].reactivate = true
					tb("hdCharge", false)
				end
			end
			
			-- Special case for SW Breakpoints
			if (table[name].swb == 1) then
				for i = 1,4 - numOfBreakpoints do
					debug_setBreakpoint(i)
				end
 				
				debug_setBreakpoint(table[name].addr)
				if (table[name].descr ~= nil) then
					printDual(string.format("\n-->(ON) %s | Number of Breakpoints: %i\n", table[name].descr, numOfBreakpoints))
 				
				else
				 	printDBG(string.format("\n-->(ON) %s | Set SW Breakpoint\n", name))
 				end
				
				for i = 1,5 do
					debug_removeBreakpoint(i)
				end
 
			-- If the number of current breakpoints is under 4, a breakpoint will be set
			elseif (numOfBreakpoints < 4 or table['noWarning'].on == true) then
				if (table[name].safe == true) then
					numOfBreakpoints = numOfBreakpoints + 1
					printDual(string.format("\n-->(ON) %s | Number of Breakpoints: %i\n", table[name].descr, numOfBreakpoints))
					debug_setBreakpoint(table[name].addr)
				
				-- If the cheat is unsafe, show a warning dialoge
				elseif (table[name].safe == false) then
					if (table['noWarning'].on == false) then
							if (messageDialog("This cheat is unsafe! Do you want to activate it anyway?", 0, 0, 1) == mrYes) then
								numOfBreakpoints = numOfBreakpoints + 1
								printDual(string.format("\n-->(ON) %s | Number of Breakpoints: %i\n", table[name].descr, numOfBreakpoints))
								debug_setBreakpoint(table[name].addr)
							
							-- If the user pressed "No", the entry will be unfrozen
							else
								local txt = memoryrecord_getDescription(table[name].te).." (pending deletion)"
								-- Will be unfrozen at next breakpoint hit
								table[name].toUnfreeze = true
								table[name].oldDescr = memoryrecord_getDescription(table[name].te)
								pendingDeletion = true
								memoryrecord_setDescription( table[name].te, txt );
								state = false
							end
					
					else
						numOfBreakpoints = numOfBreakpoints + 1
						printDual(string.format("\n-->(ON) %s | Number of Breakpoints: %i\n", table[name].descr, numOfBreakpoints))
						debug_setBreakpoint(table[name].addr)
					end
				end
 
			-- Else, a  warning dialoge will be shown
			else
				if (messageDialog("You are at the maximum count of 4 HW Breakpoints! Anymore will result in SW Breakpoints. Do you want to turn it on anyway?", 0, 0, 1) == mrYes) then
					numOfBreakpoints = numOfBreakpoints + 1
					printDual(string.format("\n-->(ON) %s | Number of Breakpoints: %i\n", table[name].descr, numOfBreakpoints))
					debug_setBreakpoint(table[name].addr)
 
				-- If the user pressed "No", the entry will be unfrozen
				else
					local txt = memoryrecord_getDescription(table[name].te).." (pending deletion)"
					-- Will be unfrozen at next breakpoint hit
					table[name].toUnfreeze = true
					table[name].oldDescr = memoryrecord_getDescription(table[name].te)
					pendingDeletion = true
					memoryrecord_setDescription( table[name].te, txt );
					state = false
				end
			end
 
		-- For disabling
		else
			-- Special case for SWBreakpoints
			if (table[name].swb == 1) then
				debug_removeBreakpoint(table[name].addr)
				if (table[name].descr ~= nil) then
					printDual(string.format("\n-->(OFF) %s | Number of Breakpoints: %i\n", table[name].descr, numOfBreakpoints))
 				
				else
				 	printDBG(string.format("\n-->(OFF) %s | Removed SW Breakpoint\n", name))
 				end
 
 			-- Normal removal of breakpoint
			elseif (table[name].toUnfreeze == false) then
				numOfBreakpoints = numOfBreakpoints - 1
				printDual(string.format("\n-->(OFF) %s | Number of Breakpoints: %i\n", table[name].descr, numOfBreakpoints))
				debug_removeBreakpoint(table[name].addr)
 
			-- Unfreezing of entry
			else
				memoryrecord_unfreeze(table[name].te)
				memoryrecord_setDescription(table[name].te, table[name].oldDescr)
				table[name].toUnfreeze = false
				pendingDeletion = false
			end
			
			-- Special procedures for noCooldown
			if (name == "noCooldown") then
				if (table['scCharge'].reactivate == true) then
					table['scCharge'].reactivate = false
					tb("scCharge", true)
				end
				if (table['hdCharge'].reactivate == true) then
					table['hdCharge'].reactivate = false
					tb("hdCharge", true)
				end
			end
		end
	end
 
	-- Updating entry for number of breakpoints
	memoryrecord_setDescription(table['numOfBreakpoints'].te, "H-Breakpoints: "..numOfBreakpoints)
 
	-- Setting the state of the entry
	table[name].on = state
	
	-- For debug output
	if (name == "debug") then
		if (state == true) then
			debug = true
			printDual("--> Debug Output Enabled! <--")
			
		else
			debug = false
			printDual("--> Debug Output Disabled! <--")
		end
	end
	
	-- Playing beep sound
	beep()
end
 
function tb(name, state)
	if (state == true) then
		memoryrecord_freeze(table[name].te)
 
	elseif (state == false) then
		memoryrecord_unfreeze(table[name].te)
 
	else
		printDual("Please enter a valid state!")
	end
end
 
----------------------------------------------------------------------------------------------
--User defined vars.. edit if you wish
----------------------------------------------------------------------------------------------
fnMarketDir  = eliteoutdir..[[MarketDump\]]	-- export directory
os.execute([[md "]]..fnMarketDir..[["]])
fnMarketFile = fnMarketDir..'ED_marketdata'	-- used filename (excl .csv or .bpc or .price) if table['mdFixedD'].on is true

----------------------------------------------------------------------------------------------
-- Marketdata variables
----------------------------------------------------------------------------------------------
cur_userid = "EO1234567f"	-- some random userid of EliteOCR for BPC format
cur_star = ""	-- gets filled dynamicly
cur_station = ""	-- gets filled dynamicly
 
last_marketdata = ""
last_markettime = ""
last_marketutc = ""
last_markettdp = ""
 
-- tables for manually translated entries
-- An empty string will make that entry filtered out
commodities = {}
commodities["AgriculturalMedicines"]     = "Agri-Medicines"
commodities["HeliostaticFurnaces"]       = "Microbial Furnaces"
commodities["MarineSupplies"]            = "Marine Equipment"
commodities["HazardousEnvironmentSuits"] = "H.E. Suits"
commodities["AutoFabricators"]           = "Auto-Fabricators"
commodities["TerrainEnrichmentSystems"]  = "Land Enrichment Systems"
commodities["BioReducingLichen"]         = "Bioreducing Lichen"
commodities["AtmosphericExtractors"]     = "Atmospheric Processors"
commodities["NonLethalWeapons"]          = "Non-Lethal Weapons"
commodities["BasicNarcotics"]            = "Narcotics"
 
-- table for demand names
demand = {}
demand["1"] = "Low"
demand["2"] = "Med"
demand["3"] = "High"
demand["0"] = ""

-- table for demand names - TDP format
tdp_demand = {}
tdp_demand["1"] = "L"
tdp_demand["2"] = "M"
tdp_demand["3"] = "H"
tdp_demand["0"] = "?"
 
----------------------------------------------------------------------------------------------
-- Parse received Inventory data
----------------------------------------------------------------------------------------------
function parse_marketdata(data)
	-- cleanup begin and end of inventory data
	data = string.gsub(data,"^<.+<commodities>","",1)            -- remove start + current inventory
	data = string.gsub(data,"</commodities></data>$","",1)    -- remove end part
   	 -- now we have only items from the market
   	 data = string.gsub(data,"</item>","|")    -- replace each last /item separator with | so now we have record with | separator
 
	if (data ~= last_marketdata) then				-- only if it differs from last marketdata
		-- save it in last_market fields
		last_marketutc  = os.date('!%Y-%m-%dT%H:%M:%S+00:00') 		-- trade tools expects UTC time
		last_markettdp = os.date('!%Y-%m-%d %H:%M:%S')		-- time stamp for TDP
		last_markettime = os.date('%Y-%m-%dT%H.%M.%S')				-- used in filename
		last_marketdata = data
 
		if (table['mdAutoD'].on == true) then
			save_marketdata()
 
		else
			printDual("New marketdata received")
		end
	end
end
 
 
----------------------------------------------------------------------------------------------
-- Save Marketdata in BPC and/or CSV and/or TDP file
-- You can manually call this via the console (CTRL + ALT + SHIFT + L)
----------------------------------------------------------------------------------------------
function save_marketdata()
	if (last_marketdata ~= "") then
		if (table['mdFixedD'].on == false) then
			fnMarketDataCSV = fnMarketDir..cur_star..'.'..cur_station..'.'..last_markettime..'.csv'
			fnMarketDataBPC = fnMarketDir..cur_star..'.'..cur_station..'.'..last_markettime..'.bpc'
			fnMarketDataTDP = fnMarketDir..cur_star..'.'..cur_station..'.'..last_markettime..'.prices'

		else
			fnMarketDataCSV = fnMarketFile..'.csv'
			fnMarketDataBPC = fnMarketFile..'.bpc'
			fnMarketDataTDP = fnMarketFile..'.prices'
		end
 
		if (table['mdCSV'].on == true) then
			fCSV = assert(io.open(fnMarketDataCSV, "w"))
			fCSV:write("System;Station;Commodity;Sell;Buy;Demand;;Supply;;Date;\n")
		end
 
		if (table['mdBPC'].on == true) then
			fBPC = assert(io.open(fnMarketDataBPC, "w"))
			fBPC:write("UserID;System;Station;Commodity;Sell;Buy;Demand;;Supply;;Date;\n")
		end
		
		if (table['mdTDP'].on == true) then
            fTDP = assert(io.open(fnMarketDataTDP, "w"))
            fTDP:write(string.format("@ %s/%s\n", cur_star, cur_station))
        end
 
		-- data available for each item:    stock;buyPrice;sellPrice;fencePrice;demand;legality;meanPrice;demandBracket;stockBracket;consumer;producer;rare
		for s in string.gmatch(last_marketdata, "<item>([%w <>/]+)|") do
			-- got an item, now extract all key and values and store them
			local t = {}
 
			for k, v in s:gmatch("<(%a+)>([%w ]*)</%a+>" ) do
				t[k] = v
			end
 
			-- internal names do not contain spaces, add them where a capital letter is
			if (commodities[t.name] == nil) then
				t.name = string.gsub(t.name, "([a-z])([A-Z])", "%1 %2")
 
			else
				t.name = commodities[t.name]
			end
 
			-- Don't save some items, salvage, nonmarker, rares and illegal ones
			if (t.name ~= nil and t.name ~= "" and t.categoryname ~= "Salvage" and t.categoryname ~= "NonMarketable" and t.rare ~= '1' and t.legality ~= 'I') then
				-- Ignore items with no demand and no stock
				if ((t.demand ~= '0') or (t.stock ~= '0')) then
					if (table['mdBPC'].on == true) then
						-- Save it in EliteOCR layout BPC
						fBPC:write(string.format("%s;%s;%s;%s;%u;%u;%u;%s;%u;%s;%s;\n", cur_userid, cur_star, cur_station, t.name, t.sellPrice, t.buyPrice, t.demand, demand[t.demandBracket], t.stock, demand[t.stockBracket], last_marketutc))
					end
 
					if (table['mdCSV'].on == true) then
						-- Save it in EliteOCR CSV Format (same as BPC but without dummy user id)
						fCSV:write(string.format("%s;%s;%s;%u;%u;%u;%s;%u;%s;%s;\n", cur_star, cur_station, t.name, t.sellPrice, t.buyPrice, t.demand, demand[t.demandBracket], t.stock, demand[t.stockBracket], last_marketutc))
					end
					
					if (table['mdTDP'].on == true) then
                        -- Save it in EliteOCR TDP Layout (Trade Dangerous Prices)
                        if (t.demand == "0") then
                            demandLevel = "?"
                        
						else
                            demandLevel = string.format("%u%s", t.demand, tdp_demand[t.demandBracket])
                        end
                        
						if (t.stock == "0") then
                            stockLevel = "-"
                        
						else
                            stockLevel = string.format("%u%s", t.stock, tdp_demand[t.stockBracket])
                        end

                        fTDP:write(string.format("  %24s %7u %7u %10s %10s %s\n", t.name, t.sellPrice, t.buyPrice, demandLevel, stockLevel, last_markettdp))
                    end
				end
			end
		end
 
		if (table['mdCSV'].on == true) then
			printDual("Marketdata saved in "..fnMarketDataCSV)
			fCSV:close()
		end
 
		if (table['mdBPC'].on == true) then
			printDual("Marketdata saved in "..fnMarketDataBPC)
			fBPC:close()
		end
		
		if (table['mdTDP'].on == true) then
            printDual("Marketdata saved in "..fnMarketDataTDP)
            fTDP:close()
        end
 
	else
		printDual("No last marketdata available")
	end
 
	return false
end
 
----------------------------------------------------------------------------------------------
-- Read a 32 bits value with a 64 bit program
----------------------------------------------------------------------------------------------
function readAddress(a)
	local v = readInteger(a)
 
	if (targetIs64Bit()) then
		return v
 
	elseif (v ~= nil) then
		return v % 0x100000000
 
	else
		return nil
	end
end

----------------------------------------------------------------------------------------------
-- Float2Hex and Hex2Float functions
-- Source: http://stackoverflow.com/questions/18886447/convert-signed-ieee-754-float-to-hexadecimal-representation
----------------------------------------------------------------------------------------------
function float2hex (n)
	if (n == 0.0) then return 0.0 end

    local sign = 0
    if (n < 0.0) then
        sign = 0x80
        n = -n
    end

    local mant, expo = math.frexp(n)
    local hext = {}

    if (mant ~= mant) then
        hext[#hext+1] = string.char(0xFF, 0x88, 0x00, 0x00)

    elseif (mant == math.huge or expo > 0x80) then
        if (sign == 0) then
            hext[#hext+1] = string.char(0x7F, 0x80, 0x00, 0x00)
        
		else
            hext[#hext+1] = string.char(0xFF, 0x80, 0x00, 0x00)
        end

    elseif ((mant == 0.0 and expo == 0) or expo < -0x7E) then
        hext[#hext+1] = string.char(sign, 0x00, 0x00, 0x00)

    else
        expo = expo + 0x7E
        mant = (mant * 2.0 - 1.0) * math.ldexp(0.5, 24)
        hext[#hext+1] = string.char(sign + math.floor(expo / 0x2),
                                    (expo % 0x2) * 0x80 + math.floor(mant / 0x10000),
                                    math.floor(mant / 0x100) % 0x100,
                                    mant % 0x100)
    end

    return tonumber(string.gsub(table.concat(hext),"(.)", function (c) return string.format("%02X%s", string.byte(c), "") end), 16)
end


function hex2float (c)
    if (c == 0) then return 0.0 end
    
	local c = string.gsub(string.format("%X", c), "(..)",function (x) return string.char(tonumber(x, 16)) end)
    local b1,b2,b3,b4 = string.byte(c, 1, 4)
    local sign = b1 > 0x7F
    local expo = (b1 % 0x80) * 0x2 + math.floor(b2 / 0x80)
    local mant = ((b2 % 0x80) * 0x100 + b3) * 0x100 + b4

    if (sign) then
        sign = -1
    
	else
        sign = 1
    end

    local n

    if (mant == 0 and expo == 0) then
        n = sign * 0.0
    
	elseif (expo == 0xFF) then
        if (mant == 0) then
            n = sign * math.huge
        
		else
            n = 0.0/0.0
        end
    
	else
        n = sign * math.ldexp(1.0 + mant / 0x800000, expo - 0x7F)
    end

    return n
end
 
----------------------------------------------------------------------------------------------
-- Check the NPC flag
----------------------------------------------------------------------------------------------
function isNPC(arg)
	if (arg == 0) then 
		return true
	end
 
	local shipObj = readAddress(arg + 0x160)
	if (shipObj == nil or shipObj == 0) then
		return true
	end
	
	local flag = readBytes(shipObj + 152, 1, false)	
	if (flag == 1) then
		return true
	
	elseif (flag == 0) then
		return false
	end
	
	printDBG("NPC flag error: "..tostring(flag))
	return false
end

----------------------------------------------------------------------------------------------
-- AOB scan
----------------------------------------------------------------------------------------------
function AOBScan2(pattern, module)
	module = module or script.ed
	local startaddr = getAddress(module)
	local endaddr = startaddr + getModuleSize(module)
	local memscan = createMemScan()
 
	memscan_returnOnlyOneResult(memscan, true)
	memscan_firstScan(memscan, soExactValue, vtByteArray, 0, pattern, "", startaddr, endaddr, "*X*W*C", 0, "", true, true, false, false)
	memscan_waitTillDone(memscan)

	return memscan_getOnlyResult(memscan)
end

----------------------------------------------------------------------------------------------
-- Hotkey creation
-- Creates non repetitive hotkeys
----------------------------------------------------------------------------------------------
nonRepHotkeysList = {} 
function createNonRepHotkey(func, ...)
 
	local changedBehaviour = 
		function (sender)
			local ID = userDataToInteger(sender)
			local TC = getTickCount()
			local elapTicks = TC - nonRepHotkeysList[ID]
 
			if (elapTicks > 300) then func(sender) end
 
			nonRepHotkeysList[ID] = TC
		end
 
	local hk = createHotkey(changedBehaviour, ...)
	hk.DelayBetweenActivate = 10
	nonRepHotkeysList[userDataToInteger(hk)] = getTickCount()
 
	return hk 
end
 
----------------------------------------------------------------------------------------------
-- Properties
-- idx: Index for arranging the entries
-- descr: Description, which will be shown in the table
-- pat: Pattern for the AOB scan, if needed, else nil
-- func: Special case breakpoints
-- parent: If defined, entry will be appended to the defined entry and can't be activated without the parent entry
-- hotkey: Hotkey(s) to toggle the cheat (For default config, look at the top)
-- safe: States whether the cheat is safe to use
-- default: Set to one, if you want to have the cheat activated on start, otherwise set it to 0
-- on: States whether the cheat is on at the moment (don't mess with this)
-- swb: If set to 1, a SW Breakpoint will be set instead of a HD Breakpoint
----------------------------------------------------------------------------------------------
table = {} --D9 5C 24 6C F3 0F 10 8E D0 03
table.WinHttpOpen   	= { idx = 1, descr = "LogOffSky", 				pat = nil, func = "WINHTTP.WinHttpOpenRequest", hotkey = hLogOffSky, swb = 1, default = 1 }
table.damageCalc   		= { idx = 2, descr = "Damage", 					pat = "D8 46 08 D8 46 0C", offs = 18, hotkey = hDamage, default = 1 }
table.damageBoost   	= { idx = 3, descr = "Multiply Damage", 		pat = nil, func = nil, parent = "damageCalc", hotkey = hDamageBoost, default = 1 }
table.damageSrc 		= { idx = 4, descr = "Only You", 				pat = "55 8B EC 83 E4 F0 81 EC ? ? ? ? 56 8B F1 57 8B 86 ? ? ? ? 8D 8E ? ? ? ?", parent = "damageBoost", hotkey = hDamageSource, default = 1 }
table.noHullD 			= { idx = 5, descr = "No Hull Damage", 			pat = nil, func = nil, parent = "damageCalc", hotkey = hNoHullD, default = 1 }
table.someShieldD 		= { idx = 6, descr = "Some Shield Damage", 		pat = nil, func = nil, parent = "damageCalc", hotkey = hSomeShieldD, default = 1 }
table.noShieldD 		= { idx = 7, descr = "No Shield Damage", 		pat = nil, func = nil, parent = "damageCalc", hotkey = hNoShieldD, default = 0 }
table.noModD	 		= { idx = 8, descr = "No Module Damage", 		pat = nil, func = nil, parent = "damageCalc", hotkey = hNoModD, default = 1 }
table.powerOutput 		= { idx = 9, descr = "High Power Output", 		pat = "C7 43 ? ? ? ? ? C7 43 ? ? ? ? ? A1 ? ? ? ? 8D 73 50 8D 4B 04", hotkey = hPowerOutput, default = 1 }
table.energy	 		= { idx = 10, descr = "Energy", 				pat = "83 EC 08 8B 44 24 0C 53 56 57 8D 3C 40 C1 E7 06 03 79 54 89 4C 24 10 33 C0 8D 77 68 33 D2 33 DB", hotkey = nil, default = 1 }
table.enRedUse			= { idx = 11, descr = "Reduced Usage",			pat = nil, func = nil, parent = "energy", hotkey = hEnRedUse, default = 1 }
table.enNoUse			= { idx = 12, descr = "No Usage",				pat = nil, func = nil, parent = "energy", hotkey = hEnNoUse, default = 0 }
table.moduleCaller   	= { idx = 13, descr = nil, 						pat = "D9 54 24 20 83 BF ? ? ? ? ?", hotkey = nil, default = 0 }
table.hullCaller   		= { idx = 14, descr = nil, 						pat = "D9 5C 24 2C 8B 47 6C", hotkey = nil, default = 0 }
table.shieldCaller   	= { idx = 15, descr = nil, 						pat = "D9 54 24 24 83 BF ? ? ? ? ?", hotkey = nil, default = 0 }
table.hdCharge 			= { idx = 16, descr = "No HD Charge", 			pat = "E8 ? ? ? ? F3 0F 10 44 24 ? F3 0F 11 87 ? ? ? ? E9 ? ? ? ?", hotkey = hHDCharge, default = 0 }
table.scCharge 			= { idx = 17, descr = "No SC Charge", 			pat = "D9 40 14 8D 97 ? ? ? ?", hotkey = hSCCharge, default = 0 }
table.noCooldown		= { idx = 18, descr = "No Cooldown",			pat = "72 50 6A 64", hotkey = hNoCooldown, default = 0 }
table.noMasslock 		= { idx = 19, descr = "No Masslock", 			pat = "C7 87 ? ? ? ? ? ? ? ? 8B 8F ? ? ? ? C7 87 ? ? ? ? ? ? ? ? 8B 01 8B 40 24", hotkey = hNoMasslock, default = 0 }
table.hyper				= { idx = 20, descr = "HyperJump", 				pat = "F3 0F 10 4C 24 ? F3 0F 10 40 ? 0F 2F C8", hotkey = nil, safe = false, default = 0 } 
table.hyFuelRange		= { idx = 21, descr = "Extended HD Range",		pat = nil, func = nil, parent = "hyper", hotkey = hHyFuelRange, safe = false, default = 0 }
table.hyFuelUsage		= { idx = 22, descr = "Less Fuel Usage",		pat = nil, func = nil, parent = "hyper", hotkey = hHyFuelUsage, safe = false, default = 0 }
table.hyFuelInf			= { idx = 23, descr = "No Fuel Usage",			pat = nil, func = nil, parent = "hyper", hotkey = hHyFuelInf, safe = false, default = 0 }
table.xmlParser   		= { idx = 24, descr = "XML Parser", 			pat = "56 8B 74 24 08 8B 86 ? ? ? ? 83 E8 02 0F 84 ? ? ? ? 48 0F 84 ? ? ? ? 57", hotkey = nil, default = 0 }
table.enMine			= { idx = 25, descr = "Enh. Mining", 			pat = nil, parent = "xmlParser", hotkey = hMining, safe = false, default = 0 }
table.mdCSV   			= { idx = 26, descr = "CSV", 					pat = nil, func = nil, parent = "xmlParser", hotkey = hCSV, default = 0 }
table.mdBPC   			= { idx = 27, descr = "BPC", 					pat = nil, func = nil, parent = "xmlParser", hotkey = hBPC, default = 0 }
table.mdTDP				= { idx = 28, descr = "TDP", 					pat = nil, func = nil, parent = "xmlParser", hotkey = hTDP, default = 0 }
table.mdFixedD   		= { idx = 29, descr = "Fixed Dump", 			pat = nil, func = nil, parent = "xmlParser", hotkey = hFixedD, default = 0 }
table.mdAutoD  			= { idx = 30, descr = "Auto Dump", 				pat = nil, func = nil, parent = "xmlParser", hotkey = hAutoD, default = 0 }
table.mdManualD  		= { idx = 31, descr = "Manual Dump", 			pat = nil, func = nil, parent = "xmlParser", hotkey = hManualD, default = 0 }
table.writeFile 		= { idx = 32, descr = nil, 						pat = nil, func = "KERNEL32.WriteFile", hotkey = nil, swb = 1, default = 1 }
table.scoop   			= { idx = 33, descr = "Instant scooping",		pat = "80 BC 24 ? ? ? ? ? 74 18", hotkey = hScoop, default = 0 }
table.hsTimer			= { idx = 34, descr = "Inf. Heatsink Duration", pat = "F3 0F 10 83 ? ? ? ? F3 0F 58 44 24 ? F3 0F 11 83 ? ? ? ?",  hotkey = hHeatsink, default = 0 }
table.noFuel			= { idx = 35, descr = "No Fuel Usage (flight)",	pat = "C7 44 24 ? ? ? ? ? C6 43 58 01",  hotkey = hNoFuel, default = 0 }
table.amFrezMag			= { idx = 36, descr = "Freeze Magazine",		pat = "8b 45 00 4b 85 C0 74 ?? 33 C5 74 ?? 29 48 ?? 0F B7 3D ?? ?? ?? ?? 0F B7 35", hotkey = hFrezMag, safe = false, default = 0 }
table.amFrezSs			= { idx = 37, descr = "Freeze Single Shots",	pat = "8B 44 24 04 53 55 8D 14 C0 8B 41 2C 56 57 8D 3C D0",  hotkey = hFrezSS, safe = false, default = 0 }
table.noWarning			= { idx = 38, descr = "No Warning",				pat = nil, func = nil, hotkey = hNoWarning, default = 0, on = false }
table.debug 			= { idx = 39, descr = "Debug Mode", 			pat = nil, func = nil, hotkey = hDebug, default = 0 }
table.disableOutput		= { idx = 40, descr = "Disable Console Output",	pat = nil, func = nil, hotkey = hOut, default = 0, on = false }
table.numOfBreakpoints	= { idx = 41, descr = "H-Breakpoints: ", 		pat = nil, func = nil, hotkey = nil, default = 0 }
list = {}
for name,value in pairs(table) do
	list[table[name].idx] = name
end
 
----------------------------------------------------------------------------------------------
-- Version output
----------------------------------------------------------------------------------------------
printDual("Game Version: " .. gameVersion)
printDual("Lua Script Version: " .. scriptVersion.."\n")

----------------------------------------------------------------------------------------------
-- CE Version check
-- Checks for the right version of CE
-- If the versions don't match, the main script won't be executed!
----------------------------------------------------------------------------------------------
RequiredCEVersion = 6.4
if (getCEVersion == nil) or (getCEVersion() < RequiredCEVersion) then
	foundError = true
	printDual("Please install version "..RequiredCEVersion.." of CE!")
else
	printDual("CE Version: "..getCEVersion())
end

----------------------------------------------------------------------------------------------
-- Main Script Start
----------------------------------------------------------------------------------------------
script = {}
function script.main()

----------------------------------------------------------------------------------------------
-- Set onBreakpoint function
----------------------------------------------------------------------------------------------
debugger_onBreakpoint = script.onBreakpoint

----------------------------------------------------------------------------------------------
-- Find addresses of patterns and build the Cheat Table
----------------------------------------------------------------------------------------------
	for n = 1,#list do
		local k = list[n]
	 
		-- Does an AOB scan when the given pattern isn't nil
		if (table[k].pat ~= nil) then
			table[k].addr = AOBScan2(table[k].pat)
			
			if (table[k].offs ~= nil) then
				table[k].addr = table[k].addr + table[k].offs
			end
	 
		-- Gets the address for the breakpoint. This is used for breakpoints outside the game exe
		elseif (table[k].func ~= nil) then
			table[k].addr = getAddress(table[k].func)
	 
		-- If neither of the above is given, the address will be set to 1
		else
			table[k].addr = 1
		end
	 
		-- Detects whether the AOB scan was successful
		if table[k].addr == nil then
			printDual(string.format("Error: could not find AOB for %s",k))
			foundError = true
	 
		-- If it was, the name and address will be printed to console.
		-- Possible previous breakpoints will also be removed!
		elseif (table[k].addr ~= 1) then
			printDual(string.format("%s @ 0x%X", k, table[k].addr))
			debug_removeBreakpoint(table[k].addr)
		end
	 
		-- This is for the creation of the table entry, which shows how many Hardware Breakpoints there are at the moment
		if (k == "numOfBreakpoints") then
			table[k].te = createTableEntry();
	 
			memoryrecord_setDescription(table[k].te, table[k].descr.."0")
			memoryrecord_setType(table[k].te, vtAutoAssembler);
			memoryrecord_setScript(table[k].te, "");
	 
			table[k].on = false
			table[k].toUnfreeze = false
	 
		-- If there is a description and an address was found, a table entry will be created
		elseif ((table[k].descr ~= nil) and table[k].addr ~= nil) then
			table[k].te = createTableEntry();
			printDBG("Created table entry for '"..k.."'.")
			
			local txt = ""
			local htxt = ""
	 
			-- If a parent entry was defined, the entry will be appended to it
			if (table[k].parent ~= nil) then
				txt = " (requires "..table[table[k].parent].descr..")"
				memoryrecord_appendToEntry(table[k].te, table[table[k].parent].te);
			end
	 
			 -- Appends the hotkey to the cheat description
			if (table[k].hotkey ~= nil) then
				local first = true
				local count = 0
				local setCount = 0
	 
				for i = 1,5 do
					if (table[k].hotkey[i] ~= nil) then
						count = count + 1
						for o = 1,#hK do
							if (keyIDs[hK[o]] == table[k].hotkey[i]) then
								local oldHTxt = htxt
								if (first == true) then
									htxt = oldHTxt..hK[o]
									first = false
									setCount = setCount + 1
	 
								else
									htxt = oldHTxt.." + "..hK[o]
									setCount = setCount + 1
								end
							end
						end
					end
					if (count ~= setCount) then
						printDual("Unknown VK-ID: "..table[k].hotkey[i])
						setCount = count
					end
				end
	 
				local tmp = htxt
				htxt = " ["..tmp.."]"
	 
			else
				htxt = " [No Hotkey]"
			end
	 
			memoryrecord_setDescription(table[k].te, table[k].descr..txt..htxt);
			memoryrecord_setType(table[k].te, vtAutoAssembler);
	 
			local sfunc="LuaCall(toggleBreakpoint('"..k.."'"
			local scriptdata="[enable]\n"..sfunc..",true))\n[disable]\n"..sfunc..",false))"
	 
			memoryrecord_setScript(table[k].te, scriptdata);
		end
	 
		-- If (a) hotkey(s) was/were defined, it/they will be created here
		if (table[k].hotkey ~= nil) then
			local func = 
				function () 
					if (table[k].on == false) then 
						tb(k, true) 
	 
					else 
						tb(k, false) 
					end 
				end
	 
			local hotkey = table[k].hotkey
			table[k].he = createNonRepHotkey(func, hotkey)
			printDBG("Created hotkey for '"..k.."'.")
		end
		
		-- If safe is nil, safe will be set to true
		if (table[k].safe == nil) then
			table[k].safe = true
		end
		
		-- If the swb arguement isn't set, it will be set to 0
		if (table[k].swb == nil) then
			table[k].swb = 0
		end
		
		table[k].on = false
		table[k].toUnfreeze = false
		printDBG("Set properties for '"..k.."'.")
	end
	 
----------------------------------------------------------------------------------------------
-- Global Variables
-- damageModifier: Defines how much damage will be dealt to NPCs (there is no default)
-- isPlayerDamage: Defines the source of the damage (don't change this)
-- return0: For nullifying any damage (don't change this)
-- damageboost: For boosting any damage (don't change this)
----------------------------------------------------------------------------------------------
	autoAssemble([[
		alloc(g_multiplier, 4)
		registersymbol(g_multiplier)
	]])
	
	result = getAddress("g_multiplier")
 
	autoAssemble([[
		globalalloc(returnmul, 64)
 
			returnmul:
				fmul dword ptr [g_multiplier]
				ret 4
	]])

	returnmul = getAddress("returnmul")
	isPlayerDamage = 1
	
	-- This is the damage multiplier. Change the value to increase or decrease the multiplication
	damageMultiplier = 10.0
		
	--maxShieldValNoted = 0.0
	--lastShieldValNoted = 0.0
	
	printDBG("Global variables defined.")
	
----------------------------------------------------------------------------------------------
-- Setting Breakpoint for receiveHealth if no error occurred
----------------------------------------------------------------------------------------------
	if (foundError == true) then
		printDual("Some patterns weren't found! Check the log/console for more information and/or ask the forum for help.")
	 
	else
		printDual("-------------------------")
		printDual("Initialized!")
		printDual("Enabling default cheats!")
		printDual("-------------------------\n")
	 
		-- Enables default cheats, which can be defined above
		for n = 1,#list do
			local k = list[n]
	 
			if (table[k].default == 1) then
				if (table[k].descr ~= nil) then
					tb(k, true)
					
				else
					toggleBreakpoint(k, true)
				end
			end
		end
	 
		printDual("-------------------------")
		printDual("Done!")
		printDual("-------------------------\n")
	end
end
----------------------------------------------------------------------------------------------
-- Main Script End
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- Execute on Breakpoint Start
----------------------------------------------------------------------------------------------
function script.onBreakpoint()
	debugProcess(2) -- use veh debugging interface
 
----------------------------------------------------------------------------------------------
-- Unfreeze pending entries
----------------------------------------------------------------------------------------------
if (pendingDeletion == true) then
	for n = 1,#list do
		local k = list[n]
 
		if (table[k].toUnfreeze == true) then
			memoryrecord_unfreeze(table[k].te)
			memoryrecord_setDescription( table[k].te, table[k].oldDescr )
			table[k].toUnfreeze = false
			pendingDeletion = false
		end
	end
	
	printDBG("Pending Deletions done!")
end
 
----------------------------------------------------------------------------------------------
-- LogOffSky --> kills ED before death flag is being sent
----------------------------------------------------------------------------------------------
	if ((EIP == table['WinHttpOpen'].addr) and (table['WinHttpOpen'].on == true)) then
		pwszObjectName = readString(readInteger(ESP + 12), 256, true)
		if string.find(pwszObjectName, "elite/commander/death") ~= nil then
			EIP = getAddress("ntdll.RtlExitUserProcess")
			printDual("\nCMDR death detected! Terminating ED before flag gets sent. Time of death: " .. os.date('%d/%m/%y - %H:%M'))
		end
 
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- Get the damage source
----------------------------------------------------------------------------------------------
	elseif ((EIP == table['damageSrc'].addr) and (table['damageSrc'].on == true)) then
		-- Sets the damage source
		isPlayerDamage = readBytes(ECX + 0x1C1, 1, false)
		--printDBG("Damage Source = "..tostring(isPlayerDamage))
 
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- No Damage to your Hull/Shield/Modules
-- Increased Damage against all other ships (no Module Damage)
----------------------------------------------------------------------------------------------
	elseif (EIP == table['damageCalc'].addr) then
		-- Local vars
		local pthis = ECX
		local caller = readPointer(ESP)
		local incomingPointer = EDI
		local damageDoneTo = ""
		
		-- Set multiplier to 1.0 (normal damage)
		writeFloat(result, 1.0)
 
		-- Set damage source to player when, "Only You" is disabled
		if (table['damageSrc'].on == false) then
			isPlayerDamage = 1
		end
 
		-- When Shield damage is done
		if (caller == table['shieldCaller'].addr) then
			local shieldModulePtr = pthis - 0xB8
			local hullRefPtr = shieldModulePtr + 91 * 4
			local hullPtr = readAddress(hullRefPtr)
			local npcFlag = isNPC(hullPtr)
			
			--printDBG(string.format("Shield | shieldModulePtr: 0x%X - hullRefPtr: 0x%X - hullPtr: 0x%X - incomingPtr: 0x%X - caller: 0x%X", shieldModulePtr, hullRefPtr, hullPtr, incomingPointer, caller))
 			
			if (npcFlag == false) then
				local curShieldValPtr = shieldModulePtr + 920
				local maxShieldValPtr = shieldModulePtr + 888
				local xoredCurShieldVal = bXor(readAddress(curShieldValPtr), readAddress(curShieldValPtr + 4)) -- divided it into two lines for readablility
				local xoredMaxShieldVal = bXor(readAddress(maxShieldValPtr), readAddress(maxShieldValPtr + 4)) -- divided it into two lines for readablility
				local curShieldVal = hex2float(xoredCurShieldVal)
				local maxShieldVal = hex2float(xoredMaxShieldVal)
				
				--[[ Not used and needed for now
				if (curShieldVal > maxShieldValNoted) then
					maxShieldValNoted = curShieldVal
				end
				
				lastShieldValNoted = curShieldVal
				
				printDBG(string.format("Player Shield | shieldModulePtr: 0x%X - hullRefPtr: 0x%X - hullPtr: 0x%X - Current Shield Value: %.2f - Max Shield Value: %.2f - Max Shield Value Noted: %.2f - Last Shield Value Noted: %.2f", shieldModulePtr, hullRefPtr, hullPtr, curShieldVal, maxShieldVal, maxShieldValNoted, lastShieldValNoted))
				]]
				
				if (table['noShieldD'].on == true) then
					writeFloat(result, 0.0)
 				
				elseif (table['someShieldD'].on == true) then
					if ((curShieldVal > 50.0) and (curShieldVal > maxShieldVal * 0.5)) then
						writeFloat(result, 0.15)
					
					elseif ((curShieldVal > 50.0) and (curShieldVal > maxShieldVal * 0.25)) then
						writeFloat(result, 0.05)
					
					else
						writeFloat(result, 0.0)
					end
				 end
				 damageDoneTo = "Player | Shield"
 
			elseif ((npcFlag == true) and (table['damageBoost'].on == true) and (isPlayerDamage == 1)) then
				writeFloat(result, damageMultiplier)
				damageDoneTo = "NPC | Shield"
				--printDBG(string.format("npc: %s - playerd: %s", tostring(npcFlag), tostring(isPlayerDamage)))
			end 
		
		-- When Hull damage is done
		elseif (caller == table['hullCaller'].addr) then
			local hullPtr = pthis - 152 + 27 * 4
			local npcFlag = isNPC(hullPtr)
			
			--printDBG(string.format("Hull | hullPtr: 0x%X", hullPtr))
			
			if ((npcFlag == false) and (table['noHullD'].on == true)) then
				writeFloat(result, 0.0)
				damageDoneTo = "Player | Hull"
 
			elseif ((npcFlag == true) and (table['damageBoost'].on == true) and (isPlayerDamage == 1)) then
				writeFloat(result, damageMultiplier)
				damageDoneTo = "NPC | Hull"
			end
 		
		-- When Module damage is done
		elseif (caller == table['moduleCaller'].addr) then
			local shipObj = readAddress(pthis + 276 - 136)
			local npcFlag = readBytes(shipObj + 152, 1, false)
			
			printDBG(string.format("Module DBG | shipObj: 0x%X - npcFlag %s", shipObj, tostring(npcFlag)))
			
			if ((npcFlag == 0) and (table['noModD'].on == true)) then
				writeFloat(result, 0.0)
				damageDoneTo = "Player | Module"
 
			elseif ((npcFlag == 1) and (table['damageBoost'].on == true) and (isPlayerDamage == 1)) then
				writeFloat(result, damageMultiplier)
				damageDoneTo = "NPC | Module"
			end
		
		-- For unknown caller, mostly for debugging purpose
		else
			printDBG(string.format("Other Caller! - IncomingPointer: 0x%X - Caller: 0x%X", incomingPointer, caller))
		end
		
		-- Debug message
		if (readFloat(result) == 1.0) then
			--printDBG("Normal Damage!")
			
		elseif (readFloat(result) > 1.0) then
			printDBG(string.format("%s Damage got multiplied by %.1f - Incoming Pointer: 0x%X - Caller: 0x%X", damageDoneTo, readFloat(result), incomingPointer, caller))
		
		elseif (readFloat(result) < 1.0 and readFloat(result) ~= 0.0) then
			printDBG(string.format("%s Damage got downscaled by %.1f - Incoming Pointer: 0x%X - Caller: 0x%X", damageDoneTo, 1 / readFloat(result), incomingPointer, caller))
		
		else
			printDBG(string.format("%s Damage got nullified! - Incoming Pointer: 0x%X - Caller: 0x%X", damageDoneTo, incomingPointer, caller))
		end
 
		-- Set damage source to 1, so the boost will always be applied, except when non player damage is detected
		isPlayerDamage = 1
		
		-- Set entry point to multiplier
		EIP = returnmul
 
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- Practically infinte power output
-- Change EBX + 0x3C to 10.0
----------------------------------------------------------------------------------------------
	elseif (EIP == table['powerOutput'].addr) then
		writeFloat(EBX + 0x3C, 10.0)
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- Weapons and co. don't use energy
-- Reduced Usage: Downscaled by 8
-- No Usage: self explaining
----------------------------------------------------------------------------------------------
	elseif (EIP == table['energy'].addr) then
		if (table['enRedUse'].on == true) then
			writeFloat(ESP + 0x8, readFloat(ESP + 0x8) * 0.125)
		
		elseif (table['enNoUse'].on == true) then
			writeFloat(ESP + 0x8, 0.0)
		end
		
		debug_continueFromBreakpoint(co_run)
		return 1

----------------------------------------------------------------------------------------------
-- Freeze Magazine
----------------------------------------------------------------------------------------------
	elseif (EIP == table['amFrezMag'].addr) then
		EBX = EBX + 1
		
		debug_continueFromBreakpoint(co_run)
		return 1

----------------------------------------------------------------------------------------------
-- Freeze Magazine of single shots (shield bank cells, etc.)
----------------------------------------------------------------------------------------------
	elseif (EIP == table['amFrezSs'].addr) then
		local ammoNeededAddr = readAddress(ESP + 0x18)
		printDBG(string.format("Needed Ammo: %i", readInteger(ammoNeededAddr)))
		
		writeInteger(ammoNeededAddr, 0)
		
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- Instant HDrive charge
----------------------------------------------------------------------------------------------
	elseif (EIP == table['hdCharge'].addr) then
		local hdTimerAddr = EDI + 0x1E8
		writeFloat(hdTimerAddr, 0.0)
		printDBG("HDrive timer set 0.0!")
		
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- Instant SCruise charge
----------------------------------------------------------------------------------------------
	elseif (EIP == table['scCharge'].addr) then
		local scTimerAddr = EAX + 0x14
		local scTimerValue = readFloat(scTimerAddr)
 
		if (scTimerValue ~= nil) then
			writeFloat(scTimerAddr, 0.0)
			printDBG("SCruise timer set 0.0!")
		end
 
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- No FSD Cooldown
----------------------------------------------------------------------------------------------
	elseif (EIP == table['noCooldown'].addr) then
		local noCooldownAddress = EDI + 0x1D0
		local noCooldownValue = readFloat(noCooldownAddress)
 
		if (noCooldownValue > 0.0) then
			writeFloat(noCooldownAddress, 0.0)
			printDBG("Cooldown timer set to 0.0!")
		end
		
		tb("noCooldown", false)
		
		debug_continueFromBreakpoint(co_run)
		return 1
		
----------------------------------------------------------------------------------------------
-- No Masslock
----------------------------------------------------------------------------------------------
	elseif (EIP == table['noMasslock'].addr) then
		local massMultiplierAddr = EDI + 0x1DC
		local massMultiplierVal = readFloat(massMultiplierAddr)
		
		if (massMultiplierVal == 0.0) then
			writeFloat(massMultiplierAddr, 1.0)
		end
		
		printDBG("Masslock removed!")
		
		debug_continueFromBreakpoint(co_run)
		return 1

----------------------------------------------------------------------------------------------
-- Get Station
----------------------------------------------------------------------------------------------
   	elseif (EIP == table['writeFile'].addr) then
		local pszLog = readAddress(ESP + 8)
		local Len = readAddress(ESP + 0xC)
		local data = readString(pszLog, 1)
 
		if (data ~= nil and data == '{') then	-- netlog output
			data = readString(pszLog, Len)
 
			if (string.match(data, "FindBestIsland:") ~= nil) then
				-- invalidate old values
				cur_station = ""
				cur_star = ""
 				
				-- extract the 3 fields we are interested in and keep it from the last FindBestIsland
				for mode, station, star in string.gmatch(data, [[FindBestIsland:.*:(.*):(.*):(%C*)]]) do
					if (star ~= nil and station ~= nil and star ~= cur_star or station ~= cur_station) then
						printDual("-->Current System: "..star.." | Station/Star: "..station)
						cur_station = station
						cur_star = star
					end
				end
			end
		end
 
   		debug_continueFromBreakpoint(co_run)
   		return 1
 
----------------------------------------------------------------------------------------------
-- XML Parser
----------------------------------------------------------------------------------------------
	elseif (EIP == table['xmlParser'].addr) then
		local pszXml  = readAddress(ESP + 8)
		local nXmlLen = readInteger(ESP + 12)
		local xmldata = readString(pszXml, nXmlLen)
		local xmlid = xmldata:match("<data><(%w*)>" )
 
		if (xmlid == "inventory") then
			parse_marketdata(xmldata)
		
		elseif (table['enMine'].on == true) then
			local changeCount = 0
			xmldata,changeCount = string.gsub(xmldata, "\</type\>\<level\>..\</level\>\</item\>", "</type><level>99</level></item>")
			
			if (changeCount > 0) then
				writeString(pszXml, xmldata)
				printDBG("Changed "..changeCount.." hopper values to 99!")
			end
		end
 
		debug_continueFromBreakpoint(co_run)
		return 1
 
----------------------------------------------------------------------------------------------
-- Scoop Hack
-- Instant scooping upon targeting
----------------------------------------------------------------------------------------------
	elseif (EIP == table['scoop'].addr) then
		EIP = EIP + 0x6
		printDBG("Instant scooped cargo!")
 
		debug_continueFromBreakpoint(co_run)
		return 1
		
----------------------------------------------------------------------------------------------
-- Infinite Heatsink Duration
-- Not tested!
----------------------------------------------------------------------------------------------
	elseif (EIP == table['hsTimer'].addr) then
		local timerElapsedAddr = EBX + 0xC0
		writeFloat(timerElapsedAddr, 0.0)
		printDBG("Heatsink timer set 0.0!")
	
		debug_continueFromBreakpoint(co_run)
		return 1

----------------------------------------------------------------------------------------------
-- No fuel usage in normal flight
----------------------------------------------------------------------------------------------
	elseif (EIP == table['noFuel'].addr) then
		local fuelUsageAddr = ESP + 0x14
		writeFloat(fuelUsageAddr, 0.0)
		--printDBG("Fuel consumption set to 0.0!")
	
		debug_continueFromBreakpoint(co_run)
		return 1
		
----------------------------------------------------------------------------------------------
-- Hyperspace Jump Hack
-- Max fuel consumption will get extended somewhat (Range)
-- To traget fuel usage will be nullified (Nullify Fuel Usage)
-- To traget fuel usage will be downscaled (Downscale Fuel Usage)
-- Note that this is not a cheat for unlimited jump range. The limiting factor is your FSD Drive
----------------------------------------------------------------------------------------------
	elseif (EIP == table['hyper'].addr) then
		local maxFuelUsageAddr = EAX + 0x20
		local toTargetFuelUsageAddr = ESP + 0x40 --0x64
		local desiredFuelAddr = ESP + 0x4C
		
		local maxFuelUsageVal = readFloat(maxFuelUsageAddr)
		local toTargetFuelUsageVal = readFloat(toTargetFuelUsageAddr)
		local desiredFuelVal = readFloat(desiredFuelAddr)
		
		printDBG(string.format("HyperJump Before | maxFuelUsageVal: %.2f - toTargetFuelUsageVal: %.2f - desiredFuelVal: %.2f", maxFuelUsageVal, toTargetFuelUsageVal, desiredFuelVal))
		
		if ((maxFuelUsageVal ~= nil) and (toTargetFuelUsageVal ~= nil) and (desiredFuelVal ~= nil)) then
			-- Nullify Fuel Usage
			if (table['hyFuelInf'].on == true) then
				writeFloat(toTargetFuelUsageAddr, 0.0)
				printDBG("Nullified fuel usage for jump!")
			
			-- Reduce Fuel Usage
			elseif (table['hyFuelUsage'].on == true) then
				writeFloat(toTargetFuelUsageAddr, toTargetFuelUsageVal * 0.1)
				printDBG(string.format("Reduced fuel usage by a factor of %.2f!", 1 / 0.1))
			end
			
			toTargetFuelUsageVal = readFloat(toTargetFuelUsageAddr)
			
			-- Max Fuel Usage Check (Range)
			if (table['hyFuelRange'].on == true) then
				if (maxFuelUsageVal < toTargetFuelUsageVal) then
					writeFloat(maxFuelUsageAddr, toTargetFuelUsageVal)
				end
				
				printDBG("Extended jump range!")
			end
		end
		
		maxFuelUsageVal = readFloat(maxFuelUsageAddr)
		desiredFuelVal = readFloat(desiredFuelAddr)
		
		printDBG(string.format("HyperJump After | maxFuelUsageVal: %.2f - toTargetFuelUsageVal: %.2f - desiredFuelVal: %.2f", maxFuelUsageVal, toTargetFuelUsageVal, desiredFuelVal))
		
		debug_continueFromBreakpoint(co_run)
		return 1

----------------------------------------------------------------------------------------------
-- Catch exceptions
----------------------------------------------------------------------------------------------
	else
		printDBG(string.format("Unexpected break at 0x%X! Resuming execution.", EIP))
		
		debug_continueFromBreakpoint(co_run)
		return 1
	end
end
----------------------------------------------------------------------------------------------
-- Execute on Breakpoint End
----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
-- Auto attach to Elite: Dangerous
----------------------------------------------------------------------------------------------
script.ed = "EliteDangerous32.exe"
script.wd = "WatchDog.exe"

secToWait = 80	-- Time Buffer for game to load properly
once = true
once2 = true
detached = false
terminated = false
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
	if ((EIP == detachWD.waitForDebugEvent) and (once == true)) then
		writeInteger(ESP - 8, EIP)
		writeInteger(ESP + 4, script.edPID)
		ESP = ESP - 8
		EIP = getAddress("KERNEL32.DebugActiveProcessStop")
		once = false
				
		printDual("Detached WatchDog! WDPID: "..script.wdPID.." | EDPID: "..script.edPID)
		detached = true
	
	elseif (EIP == detachWD.waitForDebugEvent) then
		EIP = getAddress("ntdll.RtlExitUserProcess")
		terminated = true
		
		printDual("Terminated WatchDog!")
		debug_removeBreakpoint(detachWD.waitForDebugEvent)
	end

	debug_continueFromBreakpoint(co_run)
	return 1
end

-- AOB Patch function
function patch(aob1, aob2)
	local patchAddress = AOBScan2(aob1)
	local byteTable = {}
	
	for n in aob2:gmatch('%x%x') do
		byteTable[#byteTable + 1] = tonumber(n, 16)
	end

	printDBG(string.format("Patched: %s --> %s @ 0x%X", aob1, aob2, patchAddress))
	return writeBytes(patchAddress, unpack(byteTable))
end

-- Will be called every 10 seconds
function start()
	if (once2 == true) then
		printDual("----------------------------------------")
		printDual("Preparing for the main script!")
		printDual("----------------------------------------\n")
		
		once2 = false
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

		forceStart = createNonRepHotkey(function () start() end, VK_HOME)
	end
end

-- Will be called after the WatchDog process is found
function attachWD()
	openProcess(script.wdPID)
	printDual("Successfully attached to WatchDog! PID = "..script.wdPID)
	
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
	if ((detached == true and terminated == true)) then
		object_destroy(timer)
		openProcess(script.edPID)
		printDual("Successfully attached to Elite: Dangerous! PID = "..getProcessIDFromProcessName(script.ed))
		
		patch("39 07 74 0A", "90 90 EB 0A")
		printDual("Patched Hashing!")
		
		patch("FF D0 8B 4C 24 34 8B 54 24 48", "90 90 8B 4C 24 34 8B 54 24 48")
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