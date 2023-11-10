local spawnedSulfuricAcidBarrels = 0
local SulfuricAcidBarrels = {}
local inSulfuricFarm = false
local QBCore = exports['qb-core']:GetCoreObject()

local function ValidateSulfuricAcidCoord(sulfCoord)
	local validate = true
	if spawnedSulfuricAcidBarrels > 0 then
		for _, v in pairs(SulfuricAcidBarrels) do
			if #(sulfCoord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
		if not inSulfuricFarm then
			validate2 = false
		end
	end
	return validate
end

local function GetCoordZSulfuricAcid(x, y)
	local groundCheckHeights = { 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 150.0 }
	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		if foundGround then
			return z
		end
	end
	return 18.31
end

local function GenerateSulfuricAcidCoords()
	while true do
		Wait(1)
		local sulfCoordX, sulfCoordY
		math.randomseed(GetGameTimer())
		local modX = math.random(-15, 15)
		Wait(100)
		math.randomseed(GetGameTimer())
		local modY = math.random(-15, 15)
		sulfCoordX = Config.Zones.SulfuricAcidSpawns.coords.x + modX
		sulfCoordY = Config.Zones.SulfuricAcidSpawns.coords.y + modY
		local coordZ = GetCoordZSulfuricAcid(sulfCoordX, sulfCoordY)
		local coord = vector3(sulfCoordX, sulfCoordY, coordZ)
		if ValidateSulfuricAcidCoord(coord) then
			return coord
		end
	end
end

local function SpawnSulfuricAcidBarrels()
	local model = `prop_offroad_barrel01`
	while spawnedSulfuricAcidBarrels < Config.SpawnAmounts.SulfuricAcid do
		Wait(0)
		local sulfurCoords = GenerateSulfuricAcidCoords()
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(100)
		end
		local obj = CreateObject(model, sulfurCoords.x, sulfurCoords.y, sulfurCoords.z, false, true, false)
		PlaceObjectOnGroundProperly(obj)
		FreezeEntityPosition(obj, true)
		table.insert(SulfuricAcidBarrels, obj)
		spawnedSulfuricAcidBarrels += 1
	end
	SetModelAsNoLongerNeeded(model)
end

RegisterNetEvent("coma-coke:pickSulfuric", function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
	for i=1, #SulfuricAcidBarrels, 1 do
		if #(coords - GetEntityCoords(SulfuricAcidBarrels[i])) < 2 then
			nearbyObject, nearbyID = SulfuricAcidBarrels[i], i
		end
	end
	if nearbyObject and IsPedOnFoot(playerPed) then
		if not isPickingUp then
			isPickingUp = true
			TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, false)
			QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.collecting"), Config.ProcessingTime.SulfuricHarvest, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				ClearPedTasks(PlayerPedId())
				SetEntityAsMissionEntity(nearbyObject, false, true)
				DeleteObject(nearbyObject)
				table.remove(SulfuricAcidBarrels, nearbyID)
				spawnedSulfuricAcidBarrels -= 1
				TriggerServerEvent('coma-coke:pickedUpSulfuricAcid')
				isPickingUp = false
			end, function()
				ClearPedTasks(PlayerPedId())
				isPickingUp = false
			end)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for _, v in pairs(SulfuricAcidBarrels) do
			SetEntityAsMissionEntity(v, false, true)
			DeleteObject(v)
		end
	end
end)

CreateThread(function()
	local sulfuricZone = CircleZone:Create(Config.Zones.SulfuricAcidSpawns.coords, Config.Zones.SulfuricAcidSpawns.radius, {
		name = "coma-sulfuriczone",
		debugPoly = false
	})
	sulfuricZone:onPlayerInOut(function(isPointInside, point, zone)
        if isPointInside then
            inSulfuricFarm = true
            SpawnSulfuricAcidBarrels()
        else
            inSulfuricFarm = false
        end
    end)
end)