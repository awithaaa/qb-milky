local keys = {
    ["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 28, ["ENTER"] = 18, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()

local PlayerData                = {}
local menuIsShowed              = false
local hasAlreadyEnteredMarker   = false
local hasAlreadyEnteredMarkerr  = false
local lastZone                  = nil
local isInJoblistingMarker      = false
local isInJoblistingMarkerr     = false
local bet                       = 0
local wtrakcie                  = false
local model                     = "prop_bucket_02a"
local bagModel                  = "prop_bucket_02a"
local bagspawned                = nil
local maitem                    = false
local tekst                     = 0
local stopControls              = false

------------------------------------------------CORE----------------------------
Citizen.CreateThread(function ()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end

    while QBCore.Functions.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = QBCore.Functions.GetPlayerData()
end)

--onload player
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function ()
    QBCore.Functions.GetPlayerData(function (PlayerData)
        PlayerJob = PlayerData.job
        PlayerData = QBCore.Functions.GetPlayerData()
    end)

end)
--setjob
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function (JobInfo)
    PlayerData.job = JobInfo
end)
-----------------TEXT 3D-------------------------------------------------------------------
function hintToDisplay(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawText3D2(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end
-----------END TEXT-----------------------------------------------------------------
---------------text sulla mucca---------------------------------
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(10)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, 2441.460, 4755.05, 33.70, true) < 30.0) then
            --QBCore.Functions.Draw2DText({2441.06, 4755.05, 33.85 }, '~y~[E] ~w~Milk the cow', 0.5)
            DrawText3D2(2441.06, 4755.05, 33.85, "~y~[E] ~w~Milk the cow")
            --QBCore.Functions.Draw2DText({2443.96, 4764.95, 33.85 }, '~y~[E] ~w~Milk the cow', 0.5)
            DrawText3D2(2443.96, 4764.95, 33.85, "~y~[E] ~w~Milk the cow")
           -- QBCore.Functions.Draw2DText({ 2434.870, 4764.150, 33.80 }, '~y~[E] ~w~Milk the cow', 0.5)
           DrawText3D2(2434.870, 4764.150, 33.80, "~y~[E] ~w~Milk the cow")
          --  QBCore.Functions.Draw2DText({ 2430.76, 4773.95, 33.85 }, '~y~[E] ~w~Milk the cow', 0.5)
           DrawText3D2(2430.76, 4773.95, 33.85, "~y~[E] ~w~Milk the cow")
        end
    end
end)
--------------PRESSIONE E per raccogliere il latte------------
Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(15)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, 2441.460, 4755.190, 33.70, true) < 2.0) or (GetDistanceBetweenCoords(coords, 2443.870, 4764.750, 33.20, true) < 2.0) or (GetDistanceBetweenCoords(coords, 2434.870, 4764.150, 33.20, true) < 2.0) then
           local coords     = GetEntityCoords(GetPlayerPed(-1))
           local isInMarker = false
           local currentZone= nil
           local zaplata    = 0
           if IsControlJustReleased(0, keys['E']) then
               if wtrakcie == false then
                   zbieranie()
               end
           end 
        end
    end
end)
---------------------inizio la raccolta
function zbieranie()
    TriggerServerEvent('smerfikcraft:zlomiarzzbier2')
    wtrakcie = true
end
--------creo l'oggetto
RegisterNetEvent('wiadro:postaw')
AddEventHandler('wiadro:postaw', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)
    if maitem == false then
        QBCore.Functions.SpawnObject(model, {
            x = x,
            y = y,
            z = z
        }, function(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
            PlaceObjectOnGroundProperly(obj)
            Citizen.Wait(10000)
            DeleteObject(obj)
        end)
    end
end)
------blocco il player
RegisterNetEvent('smerfik:zamrozcrft222')
AddEventHandler('smerfik:zamrozcrft222', function()
    playerPed = PlayerPedId()
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(playerPed, true)
end)
----fermo l'animazione
RegisterNetEvent('smerfik:odmrozcrft222')
AddEventHandler('smerfik:odmrozcrft222', function()
    playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(PlayerPedId())
    TriggerEvent('podlacz:propa22')
    maitem = true
    Citizen.Wait(500)
    wtrakcie = false
end)
-----------parte l'animazione
RegisterNetEvent('smerfik:craftanimacja222')
AddEventHandler('smerfik:craftanimacja222', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    Citizen.Wait(2000)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_c_cow"))
    while not HasModelLoaded(GetHashKey("a_c_cow")) do
        Wait(155)
    end
    local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2441.06, 4755.95, 33.35, -149.404, false, true)
	SetEntityInvincible(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2441.76, 4755.95, 33.45, -149.404, 10)
	end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(155)
	end
	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2443.96, 4764.95, 33.35, -349.404, false, true)

	SetEntityInvincible(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2443.76, 4764.95, 33.45, -349.404, 10)
	end
end)

Citizen.CreateThread(function()
	RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(155)
	end
	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2434.76, 4764.95, 33.35, 149.404, false, true)
	SetEntityInvincible(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2434.76, 4764.95, 33.45, 749.404, 10)
	end
end)

Citizen.CreateThread(function()
	RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(155)
	end
	local ped =  CreatePed(4, GetHashKey("a_c_cow"), 2430.76, 4773.95, 33.45, 749.404, false, true)
	SetEntityInvincible(ped, true)
	while true do
		Citizen.Wait(10000)
		TaskPedSlideToCoord(ped, 2430.76, 4773.95, 33.45, 749.404, 10)
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(5)
        local coords  = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(coords, 2500.960, 4800.750, 34.740, true) < 5.0) then
            local coords      = GetEntityCoords(PlayerPedId())
            local zaplata = 0
            local hasBagd = false
		local s1d = false
			if(GetDistanceBetweenCoords(coords, 2500.960, 4800.750, 34.740, true) < 3.0) then
				DrawText3D2(2500.960, 4800.750, 34.740, '~y~[E] ~w~Pour milk into vat')
				DrawMarker(27, 2500.960, 4800.750, 34.740-0.97, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 255, 255, 255, 200, 0, 0, 0, 0)
								
                if IsControlJustReleased(0, Keys['E']) then
                    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
                        hasBagd = result
                        s1d = true
                end, 'milk')
                while(not s1d) do
                        Citizen.Wait(100)
                    end
                if (hasBagd) then
                    if stopControls == false then
                        skup()
                    end
                else
                    QBCore.Functions.Notify('You have no to milk .', 'error')
                end
                end
            end
        end
    end
end)
----------------------------------------------------

---------------selllll--------------

local sellX = 2563.12
local sellY = 4682.48
local sellZ = 34.09
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(7)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, sellX, sellY, sellZ)
	
	if dist <= 20.0 then
	DrawMarker(27, sellX, sellY, sellZ-0.96, 0, 0, 0, 0, 0, 0, 2.20, 2.20, 2.20, 255, 255, 255, 200, 0, 0, 0, 0)
	else
	Citizen.Wait(1000)
	end
	local hasBagd7 = false
	local s1d7 = false
	if dist <= 2.0 then
	DrawText3D2(sellX, sellY, sellZ+0.1, "[E] Sell Milk bot")
		if IsControlJustPressed(0, Keys['E']) then 
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
					hasBagd7 = result
					s1d7 = true
			end, 'milkbotle')
			while(not s1d7) do
					Citizen.Wait(100)
				end
			if (hasBagd7) then
		SellKurczaki2()
		else
		QBCore.Functions.Notify('You have no more milk bottle .', 'error')
		end
		end	
	end
	
end
end)


function SellKurczaki2()
    -- local
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local inventory = QBCore.Functions.GetPlayerData().inventory
    local count = 0
    ----
    if(count == 0) then
    QBCore.Functions.Progressbar("search_register", "Selling..", 5000, false, true, {disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                        disableInventory = true,
                    }, {}, {}, {}, function()end, function()
                        
                    end)
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.9, -0.98))
    prop = CreateObject(GetHashKey('beerrow_local'), x, y, z,  true,  true, true)
    
    SetEntityHeading(prop2, GetEntityHeading(GetPlayerPed(-1)))
    
    
    
    LoadDict2('amb@medic@standing@tendtodead@idle_a')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@idle_a', 'idle_a', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    Citizen.Wait(5000)
    LoadDict2('amb@medic@standing@tendtodead@exit')
    TaskPlayAnim(GetPlayerPed(-1), 'amb@medic@standing@tendtodead@exit', 'exit', 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)
    ClearPedTasks(GetPlayerPed(-1))
    DeleteEntity(prop)
   
    TriggerServerEvent('milk:sell')
    --TriggerServerEvent("tostKurczaki:przerob",3)
    else
    
    
    end
end
-------------------------------------------animazione-----------------------------------------------------
function LoadDict2(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end


----------------------------------------------CREO IL SECCHIO E LO TRASPORTO------------------------------
RegisterNetEvent('podlacz:propa22')
AddEventHandler('podlacz:propa22', function()
    DeleteEntity(boxowocow)
    local ad = "anim@heists@box_carry@"
    loadAnimDict( ad )
    TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
    if maitem == false then
        bagspawned = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
        AttachEntityToEntity(bagspawned, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, -0.24, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)
    end
    Citizen.Wait(10000)
end)


RegisterNetEvent('sprzedawanie:jablekanim22')
AddEventHandler('sprzedawanie:jablekanim22', function()
	local playerPed = PlayerPedId()
	local lib, anim = 'mini@repair', 'fixing_a_ped'
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(500)
	RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	end)
end)

RegisterNetEvent('tp:milking')
AddEventHandler('tp:milking', function(source)
	print("FUCK")
	--exports["t0sic_loadingbar"]:StartDelayedFunction('Pouring milk', 16000, function() 
    --    ClearPedTasksImmediately(PlayerPedId())
    --end)
    QBCore.Functions.Progressbar("search_register", "processing..", 2000, false, true, {disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
					disableInventory = true,
				}, {}, {}, {}, function()end, function()
					
                end)
                Citizen.Wait(5000)
                ClearPedTasksImmediately(PlayerPedId())
end)

RegisterNetEvent('tp:misc-jobs:unlockControls')
AddEventHandler('tp:misc-jobs:unlockControls', function(source)
    print("unlocking controls")
    stopControls = false
end)

function skup()
    stopControls = true
    TriggerServerEvent('smerfikcraft:skup22')
	FreezeEntityPosition(PlayerPedId(), false)
	wtrakcie = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if stopControls == true then
            DisableControlAction(0, Keys['E'], true)
        end
    end
end)

RegisterNetEvent('odlacz:propa3')
AddEventHandler('odlacz:propa3', function()
    DetachEntity(bagspawned, 1, 1)
    ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent('odlacz:propa2')
AddEventHandler('odlacz:propa2', function()
    DeleteObject(bagspawned)
    maitem = false
    FreezeEntityPosition(PlayerPedId(), false)
    stopControls = false
end)

 local blips = {
    {title="Cows", colour=16, id=141, x = 2438.240, y = 4765.890, z = 35.00},
    {title="Milk Process", colour=16, id=141, x = 2502.120, y = 4801.250, z = 43.740},
    {title="Milk Sell", colour=16, id=141, x = 2562.54, y = 4683.0, z = 34.09}
}

Citizen.CreateThread(function()
	for _, info in pairs(blips) do
		info.blip = AddBlipForCoord(info.x, info.y, info.z)
		SetBlipSprite(info.blip, info.id)
		SetBlipDisplay(info.blip, 4)
		SetBlipScale(info.blip, 0.8)
		SetBlipColour(info.blip, info.colour)
		SetBlipAsShortRange(info.blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(info.title)
		EndTextCommandSetBlipName(info.blip)
	end
end) 

local UI = {
    x =  0.000 ,	-- Base Screen Coords 	+ 	 x
    y = -0.001 ,	-- Base Screen Coords 	+ 	-y
}
----------parte il testo visibile
RegisterNetEvent('smerfik:tekstjab22')
AddEventHandler('smerfik:tekstjab22', function()
    while true do
        Citizen.Wait(1)
        if wtrakcie == true then
            drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~y~[~w~".. tekst .. "%~y~]", 255, 255, 255, 255)
        end
    end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('smerfik:zdejmijznaczek22')
AddEventHandler('smerfik:zdejmijznaczek22', function()
    wtrakcie = false
end)
---parte il riempimento numerico
RegisterNetEvent('zacznijtekst22')
AddEventHandler('zacznijtekst22', function()
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(74)
    tekst = tekst + 1
    Citizen.Wait(1500)
    tekst = 0
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end