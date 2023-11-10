local QBCore = exports['qb-core']:GetCoreObject()
local spawnedCocaLeaf = 0
local CocaPlants = {}
local isPickingUp, isProcessing, inCokeField = false, false, false
local inCokeCircle = false
local inCokeCircleExit = false

local function LoadAnimationDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(1)
    end
end

local function OpenDoorAnimation()
    local ped = PlayerPedId()
    LoadAnimationDict("anim@heists@keycard@") 
    TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
    Wait(400)
    ClearPedTasks(ped)
end

local function ValidateCocaLeafCoord(plantCoord)
	local validate = true
	if spawnedCocaLeaf > 0 then
		for _, v in pairs(CocaPlants) do
			if #(plantCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
		if not inCokeField then
			validate = false
		end
	end
	return validate
end

local function GetCoordZCoke(x, y)
	local groundCheckHeights = { 1.0, 25.0, 50.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return 77
end

local function GenerateCocaLeafCoords()
	while true do
		Wait(1)
		local weedCoordX, weedCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-35, 35)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-35, 35)
		weedCoordX = Config.Zones.CokeField.coords.x + modX
		weedCoordY = Config.Zones.CokeField.coords.y + modY
		local coordZ = GetCoordZCoke(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)
		if ValidateCocaLeafCoord(coord) then
			return coord
		end
	end
end

local function SpawnCocaPlants()
	local model = `h4_prop_bush_cocaplant_01`
	while spawnedCocaLeaf < Config.SpawnAmounts.Coca do
        Wait(0)
        local weedCoords = GenerateCocaLeafCoords()
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(100)
        end
        local obj = CreateObject(model, weedCoords.x, weedCoords.y, weedCoords.z, false, true, false)
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)
		table.insert(CocaPlants, obj)
        spawnedCocaLeaf += 1
    end
	SetModelAsNoLongerNeeded(model)
end

local function CokeLeaf()
	isProcessing = true
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.processing"), Config.ProcessingTime.CokeLeaf, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('coma-coke:processCocaLeaf')
		local timeLeft = 2
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.Zones.CokeProcessing.coords) > 4 then
				TriggerServerEvent('coma-coke:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
	
end

local function CutCokePowder()
	isProcessing = true
	local playerPed = PlayerPedId()
	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.cutting"), Config.ProcessingTime.CutCokePowder, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('coma-coke:processCocaPowder')
		local timeLeft = 2
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.Zones.CokeProcessing.coords) > 4 then
				TriggerServerEvent('coma-coke:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local function CocaBrick()
	isProcessing = true
	local playerPed = PlayerPedId()
	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.packing"), Config.ProcessingTime.CocaBrick, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('coma-coke:processCocaBrick')
		local timeLeft = 2
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.Zones.CokeBrick.coords) > 4 then
				TriggerServerEvent('coma-coke:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local function CocaQBrick()
	isProcessing = true
	local playerPed = PlayerPedId()
	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.packing"), Config.ProcessingTime.CocaQBrick, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('coma-coke:processCocaQBrick')
		local timeLeft = 2
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.Zones.CokeQBrick.coords) > 4 then
				TriggerServerEvent('coma-coke:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local function CocaBreak()
	isProcessing = true
	local playerPed = PlayerPedId()
	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.breaking"), Config.ProcessingTime.CocaBreak, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('coma-coke:processCocaBreak')
		local timeLeft = 2
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.Zones.CokeBreak.coords) > 4 then
				TriggerServerEvent('coma-coke:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local function CocaQBreak()
	isProcessing = true
	local playerPed = PlayerPedId()
	TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.breaking"), Config.ProcessingTime.CocaQBreak, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('coma-coke:ProcessCocaQBreak')
		local timeLeft = 2
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.Zones.CokeQBreak.coords) > 4 then
				TriggerServerEvent('coma-coke:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local function CookCrack()
	isProcessing = true
	local playerPed = PlayerPedId()
	 TriggerEvent('animations:client:EmoteCommandStart', {"picklock"})
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.cookingcrack"), Config.ProcessingTime.CookCrack, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('coma-coke:processCookCrack')
		local timeLeft = 2
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.Zones.CookCrack.coords) > 4 then
				TriggerServerEvent('coma-coke:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

RegisterNetEvent('coma-coke:ProcessCocaLeaf', function()
	if Config.PickleXP then
		local level = exports['pickle_xp']:GetLevel("drugs")
		if level >= Config.XPReq.ProcessCocaLeaves then
			local coords = GetEntityCoords(PlayerPedId())
			if #(coords-Config.Zones.CokeProcessing.coords) < 5 then
				if not isProcessing then
					local check = {
						sulfuric_acid = Config.CokeProcessing.SulfuricAcid,
						coca_leaf = Config.CokeProcessing.CokeLeaf,
						scale = 1
					}
					QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
						if result.ret then
							CokeLeaf()
						else
							QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
						end
					end, check)
				else
					QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
				end
			end
		else
			QBCore.Functions.Notify(Lang:t("error.no_xp"), 'error')
		end
	else
		local coords = GetEntityCoords(PlayerPedId())
		if #(coords-Config.Zones.CokeProcessing.coords) < 5 then
			if not isProcessing then
				local check = {
					sulfuric_acid = Config.CokeProcessing.SulfuricAcid,
					coca_leaf = Config.CokeProcessing.CokeLeaf,
					scale = 1
				}
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						CokeLeaf()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, check)
			else
				QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
			end
		end
	end
end)

RegisterNetEvent('coma-coke:ProcessCocaPowder', function()
	if Config.PickleXP then
		local level = exports['pickle_xp']:GetLevel("drugs")
		if level >= Config.XPReq.CutRawCoke then
			local coords = GetEntityCoords(PlayerPedId())
			if #(coords-Config.Zones.CokePowder.coords) < 5 then
				if not isProcessing then
					local check = {
						coke = Config.CokeProcessing.Coke,
						bakingsoda = Config.CokeProcessing.BakingSoda,
						scale = 1,
						plastic = Config.CokeProcessing.CutPlastic
					}
					QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
						if result.ret then
							CutCokePowder()
						else
							QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
						end
					end, check)
				else
					QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
				end
			end
		else
			QBCore.Functions.Notify(Lang:t("error.no_xp"), 'error')
		end
	else
		local coords = GetEntityCoords(PlayerPedId())
		if #(coords-Config.Zones.CokePowder.coords) < 5 then
			if not isProcessing then
				local check = {
					coke = Config.CokeProcessing.Coke,
					bakingsoda = Config.CokeProcessing.BakingSoda,
					scale = 1,
					plastic = Config.CokeProcessing.CutPlastic
				}
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						CutCokePowder()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, check)
			else
				QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
			end
		end
	end
end)

RegisterNetEvent('coma-coke:ProcessCocaBrick', function()
	if Config.PickleXP then
		local level = exports['pickle_xp']:GetLevel("drugs")
		if level >= Config.XPReq.BrickUpRawCoke then
			local coords = GetEntityCoords(PlayerPedId())
			if #(coords-Config.Zones.CokeBrick.coords) < 5 then
				if not isProcessing then
					local check = {
						coke = Config.CokeProcessing.CokeRaw,
						scale = 1,
						plastic = Config.CokeProcessing.BrickPlastic
					}
					QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
						if result.ret then
							CocaBrick()
						else
							QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
						end
					end, check)
				else
					QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
				end
			end
		else
			QBCore.Functions.Notify(Lang:t("error.no_xp"), 'error')
		end
	else
		local coords = GetEntityCoords(PlayerPedId())
		if #(coords-Config.Zones.CokeBrick.coords) < 5 then
			if not isProcessing then
				local check = {
					coke = Config.CokeProcessing.CokeRaw,
					scale = 1,
					plastic = Config.CokeProcessing.BrickPlastic
				}
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						CocaBrick()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, check)
			else
				QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
			end
		end
	end
end)

RegisterNetEvent('coma-coke:ProcessCocaQBrick', function()

	if Config.PickleXP then
		local level = exports['pickle_xp']:GetLevel("drugs")
		if level >= Config.XPReq.QBrick then
			local coords = GetEntityCoords(PlayerPedId())
			if #(coords-Config.Zones.CokeQBrick.coords) < 5 then
				if not isProcessing then
					local check = {
						coke = Config.CokeProcessing.QCokeRaw,
						scale = 1,
						plastic = Config.CokeProcessing.QBrickPlastic
					}
					QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
						if result.ret then
							CocaQBrick()
						else
							QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
						end
					end, check)
				else
					QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
				end
			end
		else
			QBCore.Functions.Notify(Lang:t("error.no_xp"), 'error')
		end
	else
		local coords = GetEntityCoords(PlayerPedId())
		if #(coords-Config.Zones.CokeQBrick.coords) < 5 then
			if not isProcessing then
				local check = {
					coke = Config.CokeProcessing.QCokeRaw,
					scale = 1,
					plastic = Config.CokeProcessing.QBrickPlastic
				}
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						CocaQBrick()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, check)
			else
				QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
			end
		end
	end
end)

RegisterNetEvent('coma-coke:processCocaBreak', function()
	if Config.PickleXP then
		local level = exports['pickle_xp']:GetLevel("drugs")
		if level >= Config.XPReq.BreakDownCokeBrick then
			local coords = GetEntityCoords(PlayerPedId(source))
			if #(coords-Config.Zones.CokeBreak.coords) < 5 then
				if not isProcessing then
					QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
						if result.ret then
							CocaBreak()
						else
							QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
						end
					end, {coke_brick = Config.CokeProcessing.LargeBrick, scale = 1})
				else
					QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
				end
			end
		else
			QBCore.Functions.Notify(Lang:t("error.no_xp"), 'error')
		end
	else
		local coords = GetEntityCoords(PlayerPedId(source))
		if #(coords-Config.Zones.CokeBreak.coords) < 5 then
			if not isProcessing then
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						CocaBreak()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, {coke_brick = Config.CokeProcessing.LargeBrick, scale = 1})
			else
				QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
			end
		end
	end
end)

RegisterNetEvent('coma-coke:ProcessCocaQBreak', function()
	if Config.PickleXP then
		local level = exports['pickle_xp']:GetLevel("drugs")
		if level >= Config.XPReq.BreakQBrick then
			local coords = GetEntityCoords(PlayerPedId(source))
			if #(coords-Config.Zones.CokeQBreak.coords) < 5 then
				if not isProcessing then
					QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
						if result.ret then
							CocaQBreak()
						else
							QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
						end
					end, {coke_small_brick = Config.CokeProcessing.QBrick, scale = 1})
				else
					QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
				end
			end
		else
			QBCore.Functions.Notify(Lang:t("error.no_xp"), 'error')
		end
	else
		local coords = GetEntityCoords(PlayerPedId(source))
		if #(coords-Config.Zones.CokeQBreak.coords) < 5 then
			if not isProcessing then
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						CocaQBreak()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, {coke_small_brick = Config.CokeProcessing.QBrick, scale = 1})
			else
				QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
			end
		end
	end
end)

RegisterNetEvent('coma-coke:ProcessCookCrack', function()
if Config.PickleXP then
		local level = exports['pickle_xp']:GetLevel("drugs")
		if level >= Config.XPReq.CookCokeToCrack then
			local coords = GetEntityCoords(PlayerPedId())
			if #(coords-Config.Zones.CookCrack.coords) < 5 then
				if not isProcessing then
					local check = {
						coke = Config.CokeProcessing.CrackCokeRaw,
						bakingsoda = Config.CokeProcessing.CrackBakingSoda,
						scale = 1,
						plastic = Config.CokeProcessing.CrackPlastic
					}
					QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
						if result.ret then
							CookCrack()
						else
							QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
						end
					end, check)
				else
					QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
				end
			end
		else
			QBCore.Functions.Notify(Lang:t("error.no_xp"), 'error')
		end
	else
		local coords = GetEntityCoords(PlayerPedId())
		if #(coords-Config.Zones.CookCrack.coords) < 5 then
			if not isProcessing then
				local check = {
					coke = Config.CokeProcessing.CrackCokeRaw,
					bakingsoda = Config.CokeProcessing.CrackBakingSoda,
					scale = 1,
					plastic = Config.CokeProcessing.CrackPlastic
				}
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						CookCrack()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, check)
			else
				QBCore.Functions.Notify(Lang:t("error.already_processing"), 'error')
			end
		end
	end
end)

RegisterNetEvent('coma-coke:pickCocaLeaves', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
	for i=1, #CocaPlants, 1 do
		if #(coords - GetEntityCoords(CocaPlants[i])) < 2 then
			nearbyObject, nearbyID = CocaPlants[i], i
		end
	end
	if nearbyObject and IsPedOnFoot(playerPed) then
		if not isPickingUp then
			isPickingUp = true
			TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
			QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.collecting"), Config.ProcessingTime.CocaHarvest, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				ClearPedTasks(playerPed)
				SetEntityAsMissionEntity(nearbyObject, false, true)
				DeleteObject(nearbyObject)

				table.remove(CocaPlants, nearbyID)
				spawnedCocaLeaf = spawnedCocaLeaf - 1

				TriggerServerEvent('coma-coke:pickedUpCocaLeaf')
				isPickingUp = false
			end, function()
				ClearPedTasks(playerPed)
				isPickingUp = false
			end)
		end
	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(CocaPlants) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

RegisterCommand('propfix', function()
    for _, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

CreateThread(function()
	local cokeZone = CircleZone:Create(Config.Zones.CokeField.coords, Config.Zones.CokeField.radius, {
		name = "COMA-cokezone",
		debugPoly = false
	})
	cokeZone:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            inCokeField = true
            SpawnCocaPlants()
        else
            inCokeField = false
        end
    end)
end)

local function EnterCokeLab()
	local ped = PlayerPedId()
	OpenDoorAnimation()
	Wait(500)
	DoScreenFadeOut(250)
	Wait(250)
	SetEntityCoords(ped, Config.ExitCokeLab.coords["x"], Config.ExitCokeLab.coords["y"], Config.ExitCokeLab.coords["z"] - 0.98)
	SetEntityHeading(ped, Config.ExitCokeLab.coords["w"])
	Wait(1000)
	DoScreenFadeIn(250)
end

local function ExitCokeLab()
	local ped = PlayerPedId()
	isProcessing = false
	OpenDoorAnimation()
	Wait(500)
	DoScreenFadeOut(250)
	Wait(250)
	SetEntityCoords(ped, Config.EnterCokeLab.coords["x"], Config.EnterCokeLab.coords["y"], Config.EnterCokeLab.coords["z"] - 0.98)
	SetEntityHeading(ped, Config.EnterCokeLab.coords["w"])
	Wait(1000)
	DoScreenFadeIn(250)
end

local function listenForinput()
	if listen then return end
	CreateThread(function()
		listen = true
		while listen do
			if IsControlJustPressed(0, 38) then
				if inCokeCircle then
					TriggerEvent('coma-coke:EnterCokeLab')
					listen = false
					break
				else
					TriggerEvent('coma-coke:ExitCokeLab')
					listen = false
					break
				end
			end
			Wait(0)
		end
	end)
end

CreateThread(function()
	local Enter_CokeLab = CircleZone:Create(vector3(Config.EnterCokeLab.coords["x"], Config.EnterCokeLab.coords["y"], Config.EnterCokeLab.coords["z"]), Config.EnterCokeLab.radius, {useZ = true})
	Enter_CokeLab:onPlayerInOut(function(isPointInside)
		if isPointInside then
			inCokeCircle = true
			exports["qb-core"]:DrawText(Lang:t("info.Enter_CokeLab"))
			listenForinput()
		else
			inCokeCircle = false
			exports["qb-core"]:HideText()
		end
	end)
end)

CreateThread(function()
	local Exit_CokeLab = CircleZone:Create(vector3(Config.ExitCokeLab.coords["x"], Config.ExitCokeLab.coords["y"], Config.ExitCokeLab.coords["z"]), Config.ExitCokeLab.radius, {useZ = true})
	Exit_CokeLab:onPlayerInOut(function(isPointInside)
		if isPointInside then
			inCokeCircleExit = true
			exports["qb-core"]:DrawText(Lang:t("info.Exit_CokeLab"))
			listenForinput()
		else
			inCokeCircleExit = false
			exports["qb-core"]:HideText()
		end
	end)
end)

RegisterNetEvent('coma-coke:EnterCokeLab', function()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
    local dist = #(pos - vector3(Config.EnterCokeLab.coords["x"], Config.EnterCokeLab.coords["y"], Config.EnterCokeLab.coords["z"]))
    if dist < 2 then
		if Config.KeyRequired then
				QBCore.Functions.TriggerCallback('coma-coke:validate_items', function(result)
					if result.ret then
						EnterCokeLab()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, { cokekey = 1 } )
		else
			EnterCokeLab()
		end
	end
end)

RegisterNetEvent('coma-coke:ExitCokeLab', function()
	local ped = PlayerPedId()
	local pos = GetEntityCoords(ped)
    local dist = #(pos - vector3(Config.ExitCokeLab.coords["x"], Config.ExitCokeLab.coords["y"], Config.ExitCokeLab.coords["z"]))
    if dist < 2 then
		ExitCokeLab()
	end
end)

Citizen.CreateThread(function()
	--Spawns a stove with pot on top in the location for cooking crack
	local crackStove = `prop_cooker_03`
	if not HasModelLoaded(crackStove) then
		RequestModel(crackStove)

		while not HasModelLoaded(crackStove) do
			Citizen.Wait(1)
		end
	end

	local stove = CreateObject(crackStove, vector3(1103.50, -3196.10, -39.99), true)
	SetEntityRotation(stove, 0.0, 0, -90.0, 0, true)
	SetEntityAsMissionEntity(stove, true, true)
	FreezeEntityPosition(stove, true)

	local crackPot = `prop_kitch_pot_sm`
	if not HasModelLoaded(crackPot) then
		RequestModel(crackPot)

		while not HasModelLoaded(crackPot) do
			Citizen.Wait(1)
		end
	end

	local pot = CreateObject(crackPot, vector3(1103.37, -3195.93, -39.06), true)
	SetEntityRotation(pot, 0.0, 0, 180.0, 0, true)
	SetEntityAsMissionEntity(pot, true, true)
	FreezeEntityPosition(pot, true)
-------------------------------------------------------------------------------------------
-----------------------Control the Look of the Coke Room-----------------------------------
-------------------------------------------------------------------------------------------
-----Visit https://github.com/Bob74/bob74_ipl/wiki/Bikers:-Cocaine-lockup for options------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
    -- Getting the object to interact with
    BikerCocaine = exports['bob74_ipl']:GetBikerCocaineObject()
    -- Setting the style
    BikerCocaine.Style.Set(BikerCocaine.Style.upgrade)
    -- Setting the security
    BikerCocaine.Security.Set(BikerCocaine.Security.upgrade)
    -- Enabling details
    BikerCocaine.Details.Enable({BikerCocaine.Details.cokeUpgrade1, BikerCocaine.Details.cokeUpgrade2, BikerCocaine.Details.cokeBasic3, BikerCocaine.Details.cokeBasic2, BikerCocaine.Details.cokeBasic1}, true)
    -- Refreshing the interior to the see the result
    RefreshInterior(BikerCocaine.interiorId)
end)
