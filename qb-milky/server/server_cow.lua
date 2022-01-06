-------------------CODERC-SLO------------------------------
--------------######WOODCUTTER########----------------------
QBCore = nil
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


-------------------------------------------------CREO IL SECCHIO E IL LATTE----------------------------------------
RegisterServerEvent('smerfikcraft:zlomiarzzbier2')
AddEventHandler('smerfikcraft:zlomiarzzbier2', function()
   
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName('milk')

    if Item == nil then
  
        --------creo l'oggetto
        TriggerClientEvent('wiadro:postaw', _source)
        ------blocco il player
        TriggerClientEvent('smerfik:zamrozcrft222', _source)
        ---parte il riempimento numerico
        TriggerClientEvent('zacznijtekst22', _source)
        -----------parte l'animazione
        TriggerClientEvent('smerfik:craftanimacja222', _source)
        ----------parte il testo visibile
        TriggerClientEvent('smerfik:tekstjab22', _source)
        ----timer animazione
        Citizen.Wait(10000)
        ----do il latte
        local ilosc = math.random(10,10)
        xPlayer.Functions.AddItem('milk', ilosc)
        -------inserisco nell'inventario
        TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['milk'], "add")
        
        TriggerClientEvent('smerfik:odmrozcrft222', _source)
        TriggerClientEvent("QBCore:Notify", _source, 'Collected'.. ilosc .. ' milk', "success", 7000)
   else
        if Item.amount < 50 then
          TriggerClientEvent('wiadro:postaw', _source)
          TriggerClientEvent('smerfik:zamrozcrft222', _source)
          TriggerClientEvent('zacznijtekst22', _source)
          TriggerClientEvent('smerfik:craftanimacja222', _source)
          TriggerClientEvent('smerfik:tekstjab22', _source)
          Citizen.Wait(10000)
          local ilosc = math.random(10,10)
          xPlayer.Functions.AddItem('milk', ilosc)
		  TriggerClientEvent("inventory:client:ItemBox", _source, QBCore.Shared.Items['milk'], "add")
          TriggerClientEvent('smerfik:odmrozcrft222', _source)
          TriggerClientEvent("QBCore:Notify", _source, 'Collected'.. ilosc .. ' milk', "success", 7000)
        else 
        -----resetto tutto
        TriggerClientEvent('smerfik:zdejmijznaczek22', _source)
        TriggerClientEvent("QBCore:Notify", _source, 'You dont have room for more milk!', "error", 7000)
       
         end

    end

end)
--------------------------------------------------------------------------

------------------------------------NOT USE
RegisterServerEvent('smerfik:pobierzjablka22') 
AddEventHandler('smerfik:pobierzjablka22', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
        xPlayer.removeMoney(3000)
end)

RegisterServerEvent('smerfik:pobierzjablka222') 
AddEventHandler('smerfik:pobierzjablka222', function()
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addMoney(3000)
        TriggerClientEvent('esx:deleteVehicle', source)
end)
-------------------------------------------------------------

-----------------------------------------------VENDI IL LATTE-------------------------------------------------
RegisterServerEvent('smerfikcraft:skup22')
AddEventHandler('smerfikcraft:skup22', function()
   
    --local jabka = xPlayer.getInventoryItem('milk').count

    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local Item = xPlayer.Functions.GetItemByName('milk')
    


    --if Item.amount >= 1 then
    if Item == nil then
        TriggerClientEvent('QBCore:Notify', source, 'No steel', "error")  
    else
        if Item.amount >= 2 then
           -- for i = 1, 2 do
          
        TriggerClientEvent('tp:milking', _source)
        TriggerClientEvent('odlacz:propa3', _source)
      
       -- local price =  math.random(50, 200) 
        
        xPlayer.Functions.RemoveItem('milk', 2)----change this
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milk'], "remove")
        
        TriggerClientEvent('sprzedawanie:jablekanim22', _source)
       -- Citizen.Wait(2000)
       -- xPlayer.Functions.AddMoney("cash", price, "sold-pawn-items")
       -- TriggerClientEvent('QBCore:Notify', _source, 'You sold', "success")  
       xPlayer.Functions.AddItem('milkbotle', 1)
	   TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milkbotle'], "add")
        TriggerClientEvent('odlacz:propa2', _source)
       -- TriggerClientEvent('QBCore:Notify', _source, 'Milked cow of buckets:' .. price .. '$', "success")  
        TriggerClientEvent('tp:misc-jobs:unlockControls', _source)
  
          --  end
        else
            TriggerClientEvent('QBCore:Notify', _source, 'You dont have milk', "success")  
            TriggerClientEvent('tp:misc-jobs:unlockControls', _source)
        end
     end
end)
------------------------------------------------------------------------------------------

--------------sell wood process
RegisterServerEvent('milk:sell')
AddEventHandler('milk:sell', function()

    local xPlayer = QBCore.Functions.GetPlayer(source)
	local Item = xPlayer.Functions.GetItemByName('milkbotle')
   
	
	if Item == nil then
       TriggerClientEvent('QBCore:Notify', source, 'milkbotle', "error")  
	else
	 
        
		
		if Item.amount > 0 then
			--for i = 1, Item.amount do
            local reward = 0
            for i = 1, Item.amount do
                reward = 2000
            end
			xPlayer.Functions.RemoveItem('milkbotle', 1)----change this
			TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['milkbotle'], "remove")
			xPlayer.Functions.AddMoney("cash", reward, "sold-pawn-items")
			TriggerClientEvent('QBCore:Notify', source, 'you sold', "success")  
			--end
        end
		
		
     
	end
	
		
	
end)