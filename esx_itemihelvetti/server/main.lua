ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('donut', function(source)
	TriggerClientEvent('donut', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('donut', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
end)

ESX.RegisterUsableItem('oxygen_mask', function(source)
	TriggerClientEvent('oxygen_mask', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('oxygen_mask', 1)
end)

ESX.RegisterUsableItem('energiajuoma', function(source)
	TriggerClientEvent('energiajuoma', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('energiajuoma', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
end)

ESX.RegisterUsableItem('coffee', function(source)
	TriggerClientEvent('coffee', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('coffee', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
end)

ESX.RegisterUsableItem('coffeejug', function(source)
	TriggerClientEvent('coffeejug', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('coffeejug', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
end)

ESX.RegisterUsableItem('champ', function(source)
	TriggerClientEvent('lux:isohumala', source)
	TriggerClientEvent('champ', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('champ', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 500000)
end)

ESX.RegisterUsableItem('hodari', function(source)
	TriggerClientEvent('hodari', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('hodari', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 65000)
end)

ESX.RegisterUsableItem('taco', function(source)
	TriggerClientEvent('taco', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('taco', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 65000)
end)

ESX.RegisterUsableItem('water', function(source)
	TriggerClientEvent('onDrink', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('water', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
end)

ESX.RegisterUsableItem('olut', function(source)
	TriggerClientEvent('olut', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('olut', 1)
	TriggerClientEvent('lux:pienihumala', _source)
end)

ESX.RegisterUsableItem('lonkero', function(source)
	TriggerClientEvent('lonkero', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('lonkero', 1)
	TriggerClientEvent('lux:pienihumala', _source)
end)

ESX.RegisterUsableItem('cocainbottle', function(source)
	TriggerClientEvent('pullohuumeet', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('cocainbottle', 1)
	TriggerClientEvent('esx_drugs:onCocain', _source)
end)

ESX.RegisterUsableItem('cola', function(source)
	TriggerClientEvent('cola', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('cola', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
end)

ESX.RegisterUsableItem('jaffa', function(source)
	TriggerClientEvent('jaffa', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('jaffa', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
end)

ESX.RegisterUsableItem('sprite', function(source)
	TriggerClientEvent('sprite', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('sprite', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
end)

ESX.RegisterUsableItem('chips', function(source)
	TriggerClientEvent('chips', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('chips', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 85000)
end)

ESX.RegisterUsableItem('cig_pooch', function(source)
	TriggerClientEvent('efectit:onSikari', source)
	TriggerClientEvent('animaatiot:rooki', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('cig_pooch', 1)
end)

ESX.RegisterUsableItem('ponu_pooch', function(source)
	TriggerClientEvent('pullohuumeet', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('ponu_pooch', 1)
	TriggerClientEvent('efectit:onPonu', _source)
end)

ESX.RegisterUsableItem('weed_pooch', function(source)
	TriggerClientEvent('efectit:onPot', source)
	TriggerClientEvent('animaatiot:joopeli', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('weed_pooch', 1)
end))

ESX.RegisterUsableItem('opium_pooch', function(source)
	TriggerClientEvent('pullohuumeet', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('opium_pooch', 1)
	TriggerClientEvent('efectit:onOpium', _source)
end)

ESX.RegisterUsableItem('meth_pooch', function(source)
	TriggerClientEvent('efectit:onMeta', source)
	TriggerClientEvent('animaatiot:metfiini', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('meth_pooch', 1)
end))

ESX.RegisterUsableItem('coke_pooch', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('coke_pooch', 1)
	TriggerClientEvent('efectit:onCocain', _source)
end)

ESX.RegisterUsableItem('pesuratti', function(source)
	TriggerClientEvent('pesuratti', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pesuratti', 1)
end)













