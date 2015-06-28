----------------------------------------------------------------------------------------------
-- Last Update: 20/06/15
    gameVersion = "v1.3.05"
    scriptVersion = "v1.1.11"
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
hFuel			= nil
hNoFuel			= nil
hRedFuel		= nil
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
settings = getSettings('EDScript')
foundError = false
pendingDeletion = false
client = 0
debugmode = true
userdir = os.getenv("USERPROFILE")
eliteoutdir = userdir..[[\Documents\EliteOut\]]
os.execute([[md "]]..eliteoutdir..[["]])
logfiledir = eliteoutdir..[[Logs\]]
os.execute([[md "]]..logfiledir..[["]])
filename = logfiledir..'C'..client..'_'..os.date('%m_%d_%y %H_%M.log')
function printDBG(string)
	if (table['debug'].on == true or debugmode == true) then
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
			memoryrecord_setDescription( table[name].te, txt )
			state = false
			pendingDeletion = true
 
		elseif (table[name].toUnfreeze == true) then
			--memoryrecord_unfreeze(table[name].te)
			memoryrecord_setDescription( table[name].te, table[name].oldDescr )
			table[name].toUnfreeze = false
			state = false
			pendingDeletion = false
		end
	end
 
	-- If the entry has a valid address, this if statement will be executed
	if (table[name].addr ~= 1) then
		-- For enabling
		if ((state == true) and (table[name].on == false)) then
			settings.Value[name] = 1
			-- Special case for SW Breakpoints
			if (table[name].swb == 1) then
				for i = 1,4 - numOfBreakpoints do
					debug_setBreakpoint(i)
				end
 				
				debug_setBreakpoint(table[name].addr)
				if (table[name].descr ~= nil) then
					printDual(string.format("\n--> (ON|BREAKPOINT) %s\n", table[name].descr))
 				
				else
				 	printDBG(string.format("\n--> (ON|BREAKPOINT) %s\n", name))
 				end
				
				for i = 1,5 do
					debug_removeBreakpoint(i)
				end
 
			-- If the number of current breakpoints is under 4, a breakpoint will be set
			elseif (numOfBreakpoints < 4 or table['noWarning'].on == true) then
				if (table[name].safe == true) then
					numOfBreakpoints = numOfBreakpoints + 1
					printDual(string.format("\n--> (ON|BREAKPOINT) %s\n", table[name].descr))
					debug_setBreakpoint(table[name].addr)
				
				-- If the cheat is unsafe, show a warning dialoge
				elseif (table[name].safe == false) then
					if (table['noWarning'].on == false) then
							if (messageDialog("This cheat is unsafe! Do you want to activate it anyway?", 0, 0, 1) == mrYes) then
								numOfBreakpoints = numOfBreakpoints + 1
								printDual(string.format("\n--> (ON|BREAKPOINT) %s\n", table[name].descr))
								debug_setBreakpoint(table[name].addr)
							
							-- If the user pressed "No", the entry will be unfrozen
							else
								local txt = memoryrecord_getDescription(table[name].te).." (pending deletion)"
								-- Will be unfrozen at next breakpoint hit
								table[name].toUnfreeze = true
								table[name].oldDescr = memoryrecord_getDescription(table[name].te)
								pendingDeletion = true
								memoryrecord_setDescription( table[name].te, txt )
								state = false
								settings.Value[name] = 0
							end
					
					else
						numOfBreakpoints = numOfBreakpoints + 1
						printDual(string.format("\n--> (ON|BREAKPOINT) %s\n", table[name].descr))
						debug_setBreakpoint(table[name].addr)
					end
				end
 
			-- Else, a  warning dialoge will be shown
			else
				if (messageDialog("You are at the maximum count of 4 HW Breakpoints! Anymore will result in SW Breakpoints. Do you want to turn it on anyway?", 0, 0, 1) == mrYes) then
					numOfBreakpoints = numOfBreakpoints + 1
					printDual(string.format("\n--> (ON|BREAKPOINT) %s\n", table[name].descr))
					debug_setBreakpoint(table[name].addr)
 
				-- If the user pressed "No", the entry will be unfrozen
				else
					local txt = memoryrecord_getDescription(table[name].te).." (pending deletion)"
					-- Will be unfrozen at next breakpoint hit
					table[name].toUnfreeze = true
					table[name].oldDescr = memoryrecord_getDescription(table[name].te)
					pendingDeletion = true
					memoryrecord_setDescription( table[name].te, txt )
					state = false
					settings.Value[name] = 0
				end
			end
 
		-- For disabling
		else
			settings.Value[name] = 0
			-- Special case for SWBreakpoints
			if (table[name].swb == 1) then
				debug_removeBreakpoint(table[name].addr)
				if (table[name].descr ~= nil) then
					printDual(string.format("\n--> (OFF|BREAKPOINT) %s\n", table[name].descr))
 				
				else
				 	printDBG(string.format("\n--> (OFF|BREAKPOINT) %s | Removed SW Breakpoint\n", name))
 				end
 
 			-- Normal removal of breakpoint
			elseif (table[name].toUnfreeze == false) then
				numOfBreakpoints = numOfBreakpoints - 1
				printDual(string.format("\n--> (OFF|BREAKPOINT) %s\n", table[name].descr))
				debug_removeBreakpoint(table[name].addr)
 
			-- Unfreezing of entry
			else
				--memoryrecord_unfreeze(table[name].te)
				memoryrecord_setDescription(table[name].te, table[name].oldDescr)
				table[name].toUnfreeze = false
				pendingDeletion = false
			end
		end
	end
 
	-- Updating entry for number of breakpoints
	memoryrecord_setDescription(table['numOfBreakpoints'].te, "H-Breakpoints: "..numOfBreakpoints)
 
	-- Setting the state of the entry
	table[name].on = state
	if (state == true) then
		settings.Value[name] = 1
	
	else
		settings.Value[name] = 0
	end
	
	-- For debug output
	if (name == "debug") then
		if (state == true) then
			debugmode = true
			printDual("--> Debug Output Enabled!")
			
		else
			debugmode = false
			printDual("--> Debug Output Disabled!")
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
-- Toggle Patch function
----------------------------------------------------------------------------------------------
function togglePatch(name, state)
	if ((state == true) and (table[name].on == false)) then
		settings.Value[name] = 1
		if ((table['noWarning'].on == true) or (table[name].safe == true)) then
			patches[name][1].enable()
			printDual(string.format("\n--> (ON|PATCH) %s\n", table[name].descr))
		
		elseif(table[name].safe == false) then
			if (messageDialog("This cheat is unsafe! Do you want to activate it anyway?", 0, 0, 1) == mrYes) then
				patches[name][1].enable()
				printDual(string.format("\n--> (ON|PATCH) %s\n", table[name].descr))
			
			-- If the user pressed "No", the entry will be unfrozen
			else
				local txt = memoryrecord_getDescription(table[name].te).." (pending deletion)"
				-- Will be unfrozen at next breakpoint hit
				table[name].toUnfreeze = true
				table[name].oldDescr = memoryrecord_getDescription(table[name].te)
				pendingDeletion = true
				memoryrecord_setDescription( table[name].te, txt )
				state = false
				settings.Value[name] = 0
			end
		end
	
	else
		settings.Value[name] = 0
		if (table[name].toUnfreeze == false) then
			patches[name][1].disable()
			printDual(string.format("\n--> (OFF|PATCH) %s\n", table[name].descr))
		
		else
			--memoryrecord_unfreeze(table[name].te)
			memoryrecord_setDescription(table[name].te, table[name].oldDescr)
			table[name].toUnfreeze = false
			pendingDeletion = false
		end
	end
	
	-- Setting the state of the entry
	table[name].on = state
	
	-- Playing beep sound
	beep()
end

function tp(name, state)
	if (state == true) then
		memoryrecord_freeze(table[name].te)
 
	elseif (state == false) then
		memoryrecord_unfreeze(table[name].te)
 
	else
		printDBG("Please enter a valid state!")
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
-- AOB Swap/Patch function
----------------------------------------------------------------------------------------------
function AOBSwap(Search, Replace, Index, ActiveHack, RegisterAsAddress, RegisteredAddressName, ReturnTable)
	local AoBLength
	local Table
	local AddressCount = ''
	if (ReturnTable) then
		Table = {}
		AoBLength = string.gsub(Search, ' ', ''):len()
	end
	if (not Index) then
		AddressCount = 1
	end
	local ScanAoB = AOBScan(Search, game)
	if (ScanAoB) then
		local count = stringlist_getCount(ScanAoB)
		if (Index) then
			if (Index > count) then
				Index = count
			end
		end
		if (count) then
			for i = 1, count do
				if (Index) then
					i = Index
				end	
			local address = stringlist_getString(ScanAoB,i-1)
			local symbol
			--
			if (RegisterAsAddress and RegisterAsAddress~= '') then
				unregisterSymbol(RegisteredAddressName .. AddressCount)
				registerSymbol(RegisteredAddressName .. (AddressCount or ''), address)
				symbol = RegisteredAddressName .. AddressCount
				if (not Index) then
					AddressCount = AddressCount + 1
				end
			end
			--
			local original_AoB 
			if (ReturnTable and AoBLength) then
				original_AoB = ''
				local ReadBytes = readBytes(address, (AoBLength / 2),true)
				for _,String in pairs(ReadBytes) do
					local Hex = string.format("%x",String)
					if (Hex:len()==1) then
						Hex = '0' .. Hex
					end
					original_AoB = original_AoB .. ' ' .. Hex
				end
			end
			--
			if (ActiveHack) then
				for i = 1, string.len(Replace), 3 do
					local z = string.sub(Replace, i, i+2)
					local x, y = string.find(z, "%?+")
					if (x == nil) then
						autoAssemble(address .. "+" .. (string.format("%x",(i-1)/3)) .. ':\ndb ' .. z)
						printDBG("Patched: 0x" .. address .. "+" .. (string.format("%x",(i-1)/3)) .. ' --> ' .. z)
					end
				end
			end
			if (Table and ReturnTable and AoBLength) then
				Table[#Table+1] = {
									address = address;
									symbol = symbol;
									originalaob = original_AoB;
									enable = 	function ()
													for i = 1, string.len(Replace), 3 do
														local z = string.sub(Replace, i, i+2)
														local x, y = string.find(z, "%?+")
														if (x == nil) then
															autoAssemble(address .. "+" .. (string.format("%x",(i-1)/3)) .. ':\ndb ' .. z)
															printDBG("Patched: 0x" .. address .. "+" .. (string.format("%x",(i-1)/3)) .. ' --> ' .. z)
														end
													end
												end;
									disable = 	function ()
													autoAssemble(address .. ':\ndb ' .. original_AoB)
													printDBG("Reverse Patched: 0x".. address .. " to " .. original_AoB)
												end;
								   }
				local TableIndex = Table[#Table]
				TableIndex.remove = 	function ()
											TableIndex.disable()
											for k,v in pairs(TableIndex) do
												TableIndex[k] = nil
											end
											TableIndex = nil
										end
				Table[symbol] = TableIndex
			end
			if (Index and i == Index) then
				break
			end
		end
	end
	object_destroy(ScanAoB)
	end
	if (Table and ReturnTable) then
		return Table
	end
end

----------------------------------------------------------------------------------------------
-- Print all patches to DBG console
----------------------------------------------------------------------------------------------
function showPatches(t)
	for k in ordered(t) do
		printDBG(t[k][1].symbol .. ": " .. t[k][1].address .. " | " .. t[k][1].originalaob)
	end
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
-- Hex to Float/Double conversion and vice versa
----------------------------------------------------------------------------------------------
function hex2float(n)
	return byteTableToFloat(dwordToByteTable(n))
end

function float2hex(n)
	return byteTableToDword(floatToByteTable(n))
end

function hex2double(n)
	return byteTableToDouble(qwordToByteTable(n))
end

function double2hex(n)
	return byteTableToQword(doubleToByteTable(n))
end

----------------------------------------------------------------------------------------------
-- Ordered table function
----------------------------------------------------------------------------------------------
local function Ordered()
	local key2val, nextkey, firstkey = {}, {}, {}
	nextkey[nextkey] = firstkey
	
	local function onext(self, key)
		while key ~= nil do
			key = nextkey[key]
			local val = self[key]
			if val ~= nil then return key, val end
		end
	end
	local selfmeta = firstkey
	
	selfmeta.__nextkey = nextkey
	
	function selfmeta:__newindex(key, val)
		rawset(self, key, val)
		if nextkey[key] == nil then
			nextkey[nextkey[nextkey]] = key
			nextkey[nextkey] = key
		end
	end
	
	function selfmeta:__pairs() return onext, self, firstkey end
	
	return setmetatable(key2val, selfmeta)
end

function orderedTable(t)
	local currentIndex = 1
	local metaTable = {}
	
	function metaTable:__newindex(key,value)
		rawset(self, key, value)
		rawset(self, currentIndex, key)
		currentIndex = currentIndex + 1
	end
	return setmetatable(t or {}, metaTable)
end

function ordered(t)
	local currentIndex = 0
	local function iter(t)
		currentIndex = currentIndex + 1
		local key = t[currentIndex]
		if key then return key, t[key] end
	end
	return iter, t
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
-- sig: Pattern for the AOB scan, if needed, else nil
-- patch: Name of function for patching
-- func: Special case breakpoints
-- parent: If defined, entry will be appended to the defined entry and can't be activated without the parent entry
-- hotkey: Hotkey(s) to toggle the cheat (For default config, look at the top)
-- safe: States whether the cheat is safe to use
-- on: States whether the cheat is on at the moment (don't mess with this)
-- swb: If set to 1, a SW Breakpoint will be set instead of a HD Breakpoint
----------------------------------------------------------------------------------------------
script = orderedTable {__name = "script"}
patches = orderedTable {__name = "patches"}
table = orderedTable {__name = "Cheat Table"}
table.WinHttpOpen   	= { descr = "LogOffSky", 				func = "WINHTTP.WinHttpOpenRequest", hotkey = hLogOffSky, swb = 1 }
table.damageCalc   		= { descr = "Damage", 					sig = "D8 46 08 D8 46 0C", offs = 18, hotkey = hDamage }
table.damageBoost   	= { descr = "Multiply Damage", 			parent = "damageCalc", hotkey = hDamageBoost }
table.damageSrc 		= { descr = "Only You", 				sig = "55 8B EC 83 E4 F0 81 EC ? ? ? ? 56 8B F1 57 8B 86 ? ? ? ? 8D 8E ? ? ? ?", parent = "damageBoost", hotkey = hDamageSource }
table.noHullD 			= { descr = "No Hull Damage", 			parent = "damageCalc", hotkey = hNoHullD }
table.someShieldD 		= { descr = "Some Shield Damage", 		parent = "damageCalc", hotkey = hSomeShieldD }
table.noShieldD 		= { descr = "No Shield Damage", 		parent = "damageCalc", hotkey = hNoShieldD }
table.noModD	 		= { descr = "No Module Damage", 		parent = "damageCalc", hotkey = hNoModD }
table.powerOutput 		= { descr = "High Power Output", 		sig = "C7 43 ? ? ? ? ? C7 43 ? ? ? ? ? A1 ? ? ? ? 8D 73 50 8D 4B 04", hotkey = hPowerOutput }
table.energy	 		= { descr = "Energy", 					sig = "83 EC 08 8B 44 24 0C 53 56 57", hotkey = nil }
table.enRedUse			= { descr = "Reduced Usage",			parent = "energy", hotkey = hEnRedUse }
table.enNoUse			= { descr = "No Usage",					parent = "energy", hotkey = hEnNoUse }
table.moduleCaller   	= { descr = nil, 						sig = "D9 54 24 20 83 BF ? ? ? ? ?", hotkey = nil }
table.hullCaller   		= { descr = nil, 						sig = "D9 5C 24 2C 8B 47 6C", hotkey = nil }
table.shieldCaller   	= { descr = nil, 						sig = "D9 54 24 24 83 BF ? ? ? ? ?", hotkey = nil }
table.hdCharge 			= { descr = "No HD Charge", 			sig = "E8 ? ? ? ? F3 0F 10 44 24 ? F3 0F 11 87 ? ? ? ? E9 ? ? ? ?", hotkey = hHDCharge }
table.scCharge 			= { descr = "No SC Charge", 			sig = "D9 40 14 8D 97 ? ? ? ?", hotkey = hSCCharge }
table.noCooldown		= { descr = "No Cooldown",				patch = {"72 50 6A 64", "90 90"}, hotkey = hNoCooldown }
table.noMasslock 		= { descr = "No Masslock", 				sig = "C7 87 ? ? ? ? ? ? ? ? 8B 8F ? ? ? ? C7 87 ? ? ? ? ? ? ? ? 8B 01 8B 40 24", hotkey = hNoMasslock }
table.hyper				= { descr = "HyperJump", 				sig = "F3 0F 10 4C 24 ? F3 0F 10 40 ? 0F 2F C8", hotkey = nil, safe = false } 
table.hyFuelRange		= { descr = "Extended HD Range",		parent = "hyper", hotkey = hHyFuelRange, safe = false }
table.hyFuelUsage		= { descr = "Less Fuel Usage",			parent = "hyper", hotkey = hHyFuelUsage, safe = false }
table.hyFuelInf			= { descr = "No Fuel Usage",			parent = "hyper", hotkey = hHyFuelInf, safe = false }
table.xmlParser   		= { descr = "XML Parser", 				sig = "56 8B 74 24 08 8B 86 ? ? ? ? 83 E8 02 0F 84 ? ? ? ? 48 0F 84 ? ? ? ? 57", hotkey = nil }
table.enMine			= { descr = "Enh. Mining", 				parent = "xmlParser", hotkey = hMining, safe = false }
table.mdCSV   			= { descr = "CSV", 						parent = "xmlParser", hotkey = hCSV }
table.mdBPC   			= { descr = "BPC", 						parent = "xmlParser", hotkey = hBPC }
table.mdTDP				= { descr = "TDP", 						parent = "xmlParser", hotkey = hTDP }
table.mdFixedD   		= { descr = "Fixed Dump", 				parent = "xmlParser", hotkey = hFixedD }
table.mdAutoD  			= { descr = "Auto Dump", 				parent = "xmlParser", hotkey = hAutoD }
table.mdManualD  		= { descr = "Manual Dump", 				parent = "xmlParser", hotkey = hManualD }
table.writeFile 		= { descr = nil, 						func = "KERNEL32.WriteFile", hotkey = nil, swb = 1 }
table.scoop   			= { descr = "Instant scooping",			patch = {"74 18 6A 00 51 8D 44 24 20 8B CC 50 E8 ?? ?? ?? ?? 8B 46 28", "90 90"}, hotkey = hScoop }
table.hsTimer			= { descr = "Inf. Heatsink Duration", 	sig = "F3 0F 10 83 ? ? ? ? F3 0F 58 44 24 ? F3 0F 11 83 ? ? ? ?",  hotkey = hHeatsink }
table.fuel				= { descr = "Fuel Usage (flight)",		sig = "C7 44 24 ? ? ? ? ? C6 43 58 01",  hotkey = hFuel, safe = false }
table.redFuel			= { descr = "Reduced Fuel Usage",		parent = "fuel", hotkey = hRedFuel, safe = false }
table.noFuel			= { descr = "No Fuel Usage",			parent = "fuel", hotkey = hNoFuel, safe = false }
table.amFrezSs			= { descr = "Freeze Ammo",				patch = {"2B DE 85 C0 74 07", "90 90"}, hotkey = hAmmo, safe = false }
table.noWarning			= { descr = "No Warning",				hotkey = hNoWarning, on = false }
table.debug 			= { descr = "Debug Mode", 				hotkey = hDebug }
table.disableOutput		= { descr = "Disable Console Output",	hotkey = hOut, on = false }
table.numOfBreakpoints	= { descr = "H-Breakpoints: ", 			hotkey = nil }

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
-- Get Settings
----------------------------------------------------------------------------------------------
if (tonumber(settings.Value['created']) == 1) then
	for k in ordered(table) do
		table[k].enableOnStart = tonumber(settings.Value[k])
	end
	printDual("Loaded Settings!")

else
	for k in ordered(table) do
		settings.Value[k] = 0
		table[k].enableOnStart = settings.Value[k]
	end
	settings.Value['created'] = 1
	printDual("Created Settings!")
end

----------------------------------------------------------------------------------------------
-- PrintDBG/Delete Settings
----------------------------------------------------------------------------------------------
function printSettings()
	for k in ordered(table) do
		printDBG(k ..  ": " .. settings.Value[k])
	end
end

function deleteSettings()
	for k in ordered(table) do
		settings.Value[k] = nil
	end
	settings.Value['created'] = 0
	printDual("Deleted Settings!")
end

----------------------------------------------------------------------------------------------
-- Main Script Start
----------------------------------------------------------------------------------------------
function script.main()

----------------------------------------------------------------------------------------------
-- Set onBreakpoint function
----------------------------------------------------------------------------------------------
debugger_onBreakpoint = script.onBreakpoint

----------------------------------------------------------------------------------------------
-- Find addresses of patterns and build the Cheat Table
----------------------------------------------------------------------------------------------
	for k in ordered(table) do	
		-- Does an AOB scan when the given pattern isn't nil
		if (table[k].sig ~= nil) then
			table[k].addr = AOBScan2(table[k].sig)
			
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
		if (table[k].addr == nil) then
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
			table[k].te = createTableEntry()
	 
			memoryrecord_setDescription(table[k].te, table[k].descr.."0")
			memoryrecord_setType(table[k].te, vtAutoAssembler)
			memoryrecord_setScript(table[k].te, "")
	 
			table[k].on = false
			table[k].toUnfreeze = false
	 
		-- If there is a description and an address was found, a table entry will be created
		elseif ((table[k].descr ~= nil) and table[k].addr ~= nil) then
			table[k].te = createTableEntry()
			printDBG("Created table entry for '"..k.."'.")
			
			local txt = ""
			local htxt = ""
	 
			-- If a parent entry was defined, the entry will be appended to it
			if (table[k].parent ~= nil) then
				txt = " (requires "..table[table[k].parent].descr..")"
				memoryrecord_appendToEntry(table[k].te, table[table[k].parent].te)
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
	 		
			memoryrecord_setDescription(table[k].te, table[k].descr..txt..htxt)
			memoryrecord_setType(table[k].te, vtAutoAssembler)
			 
			if (table[k].patch ~= nil) then
				patches[k] = AOBSwap(table[k]['patch'][1], table[k]['patch'][2], nil, false, true, k, true)
				local sfunc = "LuaCall(togglePatch('"..k.."'"
				local scriptdata = "[enable]\n"..sfunc..",true))\n[disable]\n"..sfunc..",false))"
				printDBG("Patch Toggle created: "..k)
				memoryrecord_setScript(table[k].te, scriptdata)
				
			else
				local sfunc = "LuaCall(toggleBreakpoint('"..k.."'"
				local scriptdata = "[enable]\n"..sfunc..",true))\n[disable]\n"..sfunc..",false))"
				printDBG("Breakpoint Toggle created: "..k)
				memoryrecord_setScript(table[k].te, scriptdata)
			end
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
-- damageMultiplier: Defines how much damage will be dealt to NPCs (there is no default)
-- isPlayerDamage: Defines the source of the damage (don't change this)
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

	-- Player damage identifier
	isPlayerDamage = 1
	
	-- This is the damage multiplier. Change the value to increase or decrease the multiplication.
	damageMultiplier = 10.0
	
	printDBG("Global variables defined.")

----------------------------------------------------------------------------------------------
-- Setting Breakpoint for receiveHealth if no error occurred
----------------------------------------------------------------------------------------------
	if (foundError == true) then
		printDual("Some patterns weren't found! Check the log/console for more information and/or ask the forum for help.")
	 
	else
		printDual("-------------------------")
		printDual("Initialized!")
		printDual("Applying your Settings!")
		printDual("-------------------------\n")
	 
		-- Applies your settings
		for k in ordered(table) do
			if (table[k].enableOnStart == 1) then
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
	debugProcess()
 
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
-- No Masslock
----------------------------------------------------------------------------------------------
	elseif (EIP == table['noMasslock'].addr) then
		local massMultiplierAddr = EDI + 0x1DC
		local massMultiplierVal = readFloat(massMultiplierAddr)
		
		if (massMultiplierVal == 0.0) then
			writeFloat(massMultiplierAddr, 1.0)
		end
		
		--printDBG("Masslock removed!")
		
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
			xmldata,changeCount = string.gsub(xmldata, [[</type><level>..</level></item>]], [[</type><level>99</level></item>]])
			if (changeCount > 0) then
				writeString(pszXml, xmldata)
				printDBG("Changed "..changeCount.." hopper values to 99!")
			end
		end
 
		debug_continueFromBreakpoint(co_run)
		return 1
		
----------------------------------------------------------------------------------------------
-- Infinite Heatsink Duration
-- Not tested!
----------------------------------------------------------------------------------------------
	elseif (EIP == table['hsTimer'].addr) then
		local timerElapsedAddr = EBX + 0xC0
		writeFloat(timerElapsedAddr, 0.0)
		--printDBG("Heatsink timer set 0.0!")
	
		debug_continueFromBreakpoint(co_run)
		return 1

----------------------------------------------------------------------------------------------
-- Fuel Usage in normal flight
----------------------------------------------------------------------------------------------
	elseif (EIP == table['fuel'].addr) then
		if (table['redFuel'].on == true) then
			local fuelUsageAddr = ESP + 0x14
			local fuelUsageVal = readFloat(fuelUsageAddr)
			writeFloat(fuelUsageAddr, fuelUsageVal * 0.5) -- by 50%
			
		elseif (table['noFuel'].on == true) then
			local fuelUsageAddr = ESP + 0x14
			writeFloat(fuelUsageAddr, 0.0) -- nullify
		end
		
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
		printDual("Detached and Terminated WatchDog! WDPID: "..script.wdPID.." | EDPID: "..script.edPID)
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

		forceStart = createNonRepHotkey(function () start() end, VK_HOME)
	end
end

-- Will be called after the WatchDog process is found
function attachWD()
	openProcess(script.wdPID)
	printDual("Successfully attached to WatchDog! PID = "..getOpenedProcessID())
	
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
		printDual("Successfully attached to Elite: Dangerous! PID = "..getOpenedProcessID())
		
		patches['hashing'] = AOBSwap('39 07 74 0A 89 0B C6 02 00 C6 44 24 ? ?', '90 90', nil, true, true, 'hashing', true)
		printDual("Patched Hashing!")
		
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