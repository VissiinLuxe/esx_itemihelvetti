ESX 					  = nil
local CurrentActionData   = {}
local lastTime 			  = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('donut')
AddEventHandler('donut', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_donut_02', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
		Citizen.Wait(65000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('oxygen_mask')
AddEventHandler('oxygen_mask', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 12844)
	local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
	
	ESX.Game.SpawnObject('p_s_scuba_mask_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		ESX.Game.SpawnObject('p_s_scuba_tank_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object2)
			AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			SetPedDiesInWater(playerPed, false)
			
			ESX.ShowNotification(_U('dive_suit_on') .. '%.')
			Citizen.Wait(50000)
			ESX.ShowNotification(_U('oxygen_notify', '~y~', '50') .. '%.')
			Citizen.Wait(25000)
			ESX.ShowNotification(_U('oxygen_notify', '~o~', '25') .. '%.')
			Citizen.Wait(25000)
			ESX.ShowNotification(_U('oxygen_notify', '~r~', '0') .. '%.')
			
			SetPedDiesInWater(playerPed, true)
			DeleteObject(object)
			DeleteObject(object2)
			ClearPedSecondaryTask(playerPed)
		end)
	end)
end)

RegisterNetEvent('energiajuoma')
AddEventHandler('energiajuoma', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_cs_script_bottle_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 2000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(30000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	ESX.ShowNotification(_U('es_consumed'))
	
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	ESX.ShowNotification(_U('es_end'))
end)

RegisterNetEvent('coffee')
AddEventHandler('coffee', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('anim@safehouse@wheatgrass')
	while not HasAnimDictLoaded('anim@safehouse@wheatgrass') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_fib_coffee', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "anim@safehouse@wheatgrass", "drink_wheatgrass_stage1_glass", 1.0, -1.0, 2000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(40000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	ESX.ShowNotification(_U('coffee_used'))
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.35)
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
	ESX.ShowNotification(_U('coffee_end'))
end)

RegisterNetEvent('coffeejug')
AddEventHandler('coffeejug', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('xm_prop_x17_coffee_jug', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 2000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(60000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	ESX.ShowNotification(_U('coffee_used'))
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.5)
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
	ESX.ShowNotification(_U('coffee_end'))
end)

RegisterNetEvent('champ')
AddEventHandler('champ', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('xs_prop_arena_champ_open', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 2000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(30000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	ESX.ShowNotification(_U('champ_used'))

	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	ESX.ShowNotification(_U('champ_end'))
end)

RegisterNetEvent('hodari')
AddEventHandler('hodari', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_cs_hotdog_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
		Citizen.Wait(75000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('taco')
AddEventHandler('taco', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'prop_taco_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@burger')
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(85000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('sampyla')
AddEventHandler('sampyla', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'prop_food_burg2'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_inteat@burger')
			while not HasAnimDictLoaded('mp_player_inteat@burger') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(125000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('onDrink')
AddEventHandler('onDrink', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(30000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('olut')
AddEventHandler('olut', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'prop_sh_beer_pissh_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(900000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('lonkero')
AddEventHandler('lonkero', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'prop_ld_can_01b'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(900000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('pullohuumeet')
AddEventHandler('pullohuumeet', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_drug_bottle', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 2000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	ESX.ShowNotification(_U('purkki_consumed'))
	
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	ESX.ShowNotification(_U('purkki_end'))
end)

RegisterNetEvent('cola')
AddEventHandler('cola', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'prop_ecola_can'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(500000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('jaffa')
AddEventHandler('jaffa', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'prop_orang_can_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(500000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('sprite')
AddEventHandler('sprite', function(prop_name)
	if not IsAnimated or IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local prop_name = prop_name or 'ba_prop_club_tonic_can'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			Citizen.Wait(500000)
			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('chips')
AddEventHandler('chips', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('v_ret_ml_chips2', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
		Citizen.Wait(65000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)


RegisterNetEvent('pesuratti')
AddEventHandler('pesuratti', function()
	if not IsAnimated then
		local prop_name = 'PROP_SPONGE_01'
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2, true, true, true)
			AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 57005), 0.11, -0.02, -0.03, 120.0, 180.0, 200.0, true, true, false, true, 1, true)
			RequestAnimDict("timetable@floyd@clean_kitchen@base")
			while not HasAnimDictLoaded("timetable@floyd@clean_kitchen@base") do
				Citizen.Wait(0)
			end
			TaskPlayAnim(GetPlayerPed(-1), "timetable@floyd@clean_kitchen@base", "base", 8.0, -8, -1, 55, 0, 0, 0, 0)
			Citizen.Wait(400000)
			SetVehicleDirtLevel(vehicle, 0)
            while not IsControlPressed(0, 73) do
                if not IsEntityPlayingAnim(GetPlayerPed(-1), "timetable@floyd@clean_kitchen@base", "base", 3) then
                    break
                end
                Wait(5)
            end
            IsAnimated = false
            StopAnimPlayback(GetPlayerPed(-1), 0, true)
            DeleteObject(prop)
        end)
    end
end )


RegisterNetEvent('lux:pienihumala')
AddEventHandler('lux:pienihumala', function()
	local ped = GetPlayerPed(-1)
	RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
	while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
	Citizen.Wait(0)
	end
	Citizen.Wait(5000)
	DoScreenFadeOut(500)
	Citizen.Wait(1800)
	ClearPedTasksImmediately(ped)
	SetTimecycleModifier("spectator3")
	SetPedMovementClipset(ped, "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	DoScreenFadeIn(1000)
	Citizen.Wait(40000)
--	DoScreenFadeOut(1000)
--	Citizen.Wait(2000)
--	DoScreenFadeIn(500)
	ClearTimecycleModifier()
	ResetPedMovementClipset(GetPlayerPed(-1), 0)
end)

RegisterNetEvent('lux:isohumala')
AddEventHandler('lux:isohumala', function()
local myPed = GetPlayerPed(-1)
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
    Citizen.Wait(0)
    end
    Citizen.Wait(5000)
    DoScreenFadeOut(500)
    Citizen.Wait(1800)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", true)
	ShakeGameplayCam("DRUNK_SHAKE", 5.0)
    SetPedIsDrunk(GetPlayerPed(-1), true)
	DoScreenFadeIn(1500)
    Citizen.Wait(5000)
	PedRagdoll()
	Citizen.Wait(20000)
	PedRagdoll()
	Citizen.Wait(15000)
	PedRagdoll()
	Citizen.Wait(15000)
	PedRagdoll()
	Citizen.Wait(20000)
	PedRagdoll()
	Citizen.Wait(20000)
	PedRagdoll()
	Citizen.Wait(30000)
	PedRagdoll()
	Citizen.Wait(20000)
	PedRagdoll()
	Citizen.Wait(5000)
	PedRagdoll()
	Citizen.Wait(3000)
	PedRagdoll()
    Citizen.Wait(60000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1500)
    DoScreenFadeIn(1000)
	ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
    StopGameplayCamShaking( true )
end)

-- Weed Effect
RegisterNetEvent('efectit:onPot')
AddEventHandler('efectit:onPot', function()
    RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
        Citizen.Wait(1)
    end
    --TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(15000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
--    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator7")
    SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 3.0)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1000)
    Citizen.Wait(600000)
--    DoScreenFadeOut(1000)
--    Citizen.Wait(1000)
--    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Opium Effect
RegisterNetEvent('efectit:onOpium')
AddEventHandler('efectit:onOpium', function()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
        Citizen.Wait(0)
    end
-- TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(5000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", true)
	ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 6.0)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(1500)
    Citizen.Wait(60000000)
--    DoScreenFadeOut(1000)
--    Citizen.Wait(1500)
--    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)

-- Meta Effect
RegisterNetEvent('efectit:onMeta')
AddEventHandler('efectit:onMeta', function()
    RequestAnimSet("move_f@scared")
    while not HasAnimSetLoaded("move_f@scared") do
        Citizen.Wait(0)
    end
    --TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(25000)
    DoScreenFadeOut(2500)
    Citizen.Wait(1000)
--    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "move_f@scared", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(2500)
    Citizen.Wait(600000)
--    DoScreenFadeOut(1000)
--    Citizen.Wait(1000)
--    DoScreenFadeIn(2000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)


--Coke
RegisterNetEvent('efectit:onCocain')
AddEventHandler('efectit:onCocain', function()
  
    RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
		Citizen.Wait(0)
    end    

--    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
    Citizen.Wait(13000)
--    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator9")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
	ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    DoScreenFadeIn(1500)
    Citizen.Wait(140000)
 --   DoScreenFadeOut(1000)
--    Citizen.Wait(1500)
--    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    StopGameplayCamShaking( true )
    SetPedMotionBlur(GetPlayerPed(-1), false)
	
end)

-- Ponu Effect
RegisterNetEvent('efectit:onPonu')
AddEventHandler('efecetit:onPonu', function()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
        Citizen.Wait(0)
    end
--    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_DRINKING", 0, true)
    Citizen.Wait(15000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(GetPlayerPed(-1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(GetPlayerPed(-1), true)
	ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    DoScreenFadeIn(1000)
    Citizen.Wait(150000)
--    DoScreenFadeOut(1000)
--    Citizen.Wait(1000)
--    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
	StopGameplayCamShaking( true )
end)

--CIG ANIMATION
RegisterNetEvent('efectit:onSikari')
AddEventHandler('efectit:onSikari', function()
    RequestAnimSet("MOVE_M@DRUNK@SLIGHTLYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@SLIGHTLYDRUNK") do
        Citizen.Wait(1)
    end
    --TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT", 0, true)
    Citizen.Wait(15000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
--    ClearPedTasksImmediately(GetPlayerPed(-1))
    SetTimecycleModifier("spectator7")
    SetPedMotionBlur(GetPlayerPed(1), true)
    SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", false)
    SetPedIsDrunk(GetPlayerPed(-1), true)
    DoScreenFadeIn(600)
    Citizen.Wait(600000)
--    DoScreenFadeOut(1000)
--    Citizen.Wait(1000)
--    DoScreenFadeIn(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(GetPlayerPed(-1), 0)
    SetPedIsDrunk(GetPlayerPed(-1), false)
    SetPedMotionBlur(GetPlayerPed(-1), false)
end)