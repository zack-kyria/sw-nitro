
ESX = nil

TriggerEvent("esx:getSharedObject", function(obj)  ESX = obj end)



RegisterNetEvent('nitro:__sync')
AddEventHandler('nitro:__sync', function (boostEnabled, purgeEnabled, lastVehicle)
  -- Fix for source reference being lost during loop below.
  local source = source

  for _, player in ipairs(GetPlayers()) do
    if player ~= tostring(source) then
      TriggerClientEvent('nitro:__update', player, source, boostEnabled, purgeEnabled, lastVehicle)
    end
  end
end)

 

RegisterNetEvent('nitro:get_nitro_item')
AddEventHandler('nitro:get_nitro_item', function ()

  local nitro = "yok"

  local src = source

  local xPlayer = ESX.GetPlayerFromId(src)

  if not xPlayer  then return end

  if xPlayer.getInventoryItem("nitrous_oxide") then
    if xPlayer.getInventoryItem("nitrous_oxide").count ~= 0 then  nitro = "var" else nitro = "yok" end 
  end

  TriggerClientEvent('nitro:set_fuel_vehicle', src, { nitro = nitro })


end)

 


RegisterNetEvent('nitro:delete_nitro_item')
AddEventHandler('nitro:delete_nitro_item', function ()

  local src = source

  local xPlayer = ESX.GetPlayerFromId(src)

  if not xPlayer  then return end

  if xPlayer.getInventoryItem("nitrous_oxide") then
    if xPlayer.getInventoryItem("nitrous_oxide").count ~= 0 then  
      xPlayer.removeInventoryItem("nitrous_oxide", 1)
    end 
  end




end)

ESX.RegisterUsableItem('nitrous_oxide', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('nitro:set_fuel_vehicle', source)
end)
