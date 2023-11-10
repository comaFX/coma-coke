local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('coma-coke:pickedUpCocaLeaf', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.AddItem("coca_leaf", Config.HarvestAmounts.Coca) then 
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["coca_leaf"], "add")
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coca_leaf"), "success")
			if Config.PickleXP then
						exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPHarvestCoca)
			end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
	end
end)

RegisterServerEvent('coma-coke:pickedUpSulfuricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.AddItem("sulfuric_acid", Config.HarvestAmounts.SulfuricAcid) then
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sulfuric_acid"], "add")
		TriggerClientEvent('QBCore:Notify', src, Lang:t("success.chemicals"), "success")
			if Config.PickleXP then
						exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPHarvestSulf)
			end
	end
end)

RegisterServerEvent('coma-coke:processCocaLeaf', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem('coca_leaf', Config.CokeProcessing.CokeLeaf) then
		if Player.Functions.RemoveItem('sulfuric_acid', Config.CokeProcessing.SulfuricAcid) then
			if Player.Functions.AddItem('coke', Config.CokeProcessing.ProcessCokeLeaf) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coca_leaf'], "remove", Config.CokeProcessing.CokeLeaf)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['sulfuric_acid'], "remove", Config.CokeProcessing.SulfuricAcid)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "add", Config.CokeProcessing.ProcessCokeLeaf)
				TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke"), "success")
					if Config.PickleXP then
						exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPLeaves)
					end
			else
				Player.Functions.AddItem('coca_leaf', Config.CokeProcessing.CokeLeaf)
				Player.Functions.AddItem('sulfuric_acid', Config.CokeProcessing.SulfuricAcid)
			end
		else	
			TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_sulfuric_acid"), "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coca_leaf"), "error")
	end
end)

RegisterServerEvent('coma-coke:processCocaPowder', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke', Config.CokeProcessing.Coke) then
		if Player.Functions.RemoveItem('bakingsoda', Config.CokeProcessing.BakingSoda) then
			if Player.Functions.RemoveItem('plastic', Config.CokeProcessing.CutPlastic) then
				if Player.Functions.AddItem('cokebaggy', Config.CokeProcessing.CokeBaggies) then
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "remove", Config.CokeProcessing.Coke)
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bakingsoda'], "remove", Config.CokeProcessing.BakingSoda)
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['plastic'], "remove", Config.CokeProcessing.CutPlastic)
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['cokebaggy'], "add", Config.CokeProcessing.CokeBaggies)
					TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_cut"), "success")
						if Config.PickleXP then
						exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPCut)
						end
				else
					Player.Functions.AddItem('coke', Config.CokeProcessing.Coke)
					Player.Functions.AddItem('bakingsoda', Config.CokeProcessing.BakingSoda)
					Player.Functions.AddItem('plastic', Config.CokeProcessing.CutPlastic)
				end
			end
		else
			Player.Functions.AddItem('coke', Config.CokeProcessing.Coke)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_bakingsoda"), "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_coke_amount"), "error")
	end
end)

RegisterServerEvent('coma-coke:processCocaBrick', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke', Config.CokeProcessing.CokeRaw) then
		if Player.Functions.RemoveItem('plastic', Config.CokeProcessing.BrickPlastic) then
			if Player.Functions.AddItem('coke_brick', Config.CokeProcessing.LargeBrick) then
				TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke'], "remove", Config.CokeProcessing.CokeRaw)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['plastic'], "remove", Config.CokeProcessing.BrickPlastic)
				TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_brick'], "add", Config.CokeProcessing.LargeBrick)
				TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_brick"), "success")
					if Config.PickleXP then
						exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPBrick)
					end
			else
				Player.Functions.AddItem('coke', Config.CokeProcessing.CokeRaw)
				Player.Functions.AddItem('plastic', Config.CokeProcessing.BrickPlastic)
			end
		end
	end
end)

RegisterServerEvent('coma-coke:processCocaQBrick', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke', Config.CokeProcessing.QCokeRaw) then
		if Player.Functions.RemoveItem('plastic', Config.CokeProcessing.QBrickPlastic) then
			if Player.Functions.AddItem('coke_small_brick', Config.CokeProcessing.QBrick) then
				TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke'], "remove", Config.CokeProcessing.QCokeRaw)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['plastic'], "remove", Config.CokeProcessing.QBrickPlastic)
				TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_small_brick'], "add", Config.CokeProcessing.QBrick)
				TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_small_brick"), "success")
					if Config.PickleXP then
						exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPQBrick)
					end
			else
				Player.Functions.AddItem('coke', Config.CokeProcessing.QCokeRaw)
				Player.Functions.AddItem('plastic', Config.CokeProcessing.QBrickPlastic)
			end
		end
	end
end)

RegisterServerEvent('coma-coke:processCocaBreak', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke_brick', Config.CokeProcessing.LargeBrick) then
		if Player.Functions.AddItem('coke', Config.CokeProcessing.CokeRaw) then
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_brick'], "remove", Config.CokeProcessing.LargeBrick)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke'], "add", Config.CokeProcessing.CokeRaw)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_break"), "success")
				if Config.PickleXP then
					exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPBreak)
				end
		else
			Player.Functions.AddItem('coke_brick', Config.CokeProcessing.LargeBrick)
		end
	end
end)
----
----
RegisterServerEvent('coma-coke:ProcessCocaQBreak', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke_small_brick', Config.CokeProcessing.QBrick) then
		if Player.Functions.AddItem('coke', Config.CokeProcessing.QCokeRaw) then
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke_small_brick'], "remove", Config.CokeProcessing.QBrick)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['coke'], "add", Config.CokeProcessing.QCokeRaw)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("success.coke_qbreak"), "success")
				if Config.PickleXP then
					exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPQBreak)
				end
		else
			Player.Functions.AddItem('coke_small_brick', Config.CokeProcessing.LargeBrick)
		end
	end
end)

RegisterServerEvent('coma-coke:processCookCrack', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	if Player.Functions.RemoveItem('coke', Config.CokeProcessing.CrackCokeRaw) then
		if Player.Functions.RemoveItem('bakingsoda', Config.CokeProcessing.CrackBakingSoda) then
			if Player.Functions.RemoveItem('plastic', Config.CokeProcessing.CrackPlastic) then
				if Player.Functions.AddItem('crack_baggy', Config.CokeProcessing.CrackCooked) then
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['coke'], "remove", Config.CokeProcessing.CrackCokeRaw)
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['bakingsoda'], "remove", Config.CokeProcessing.CrackBakingSoda)
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['plastic'], "remove", Config.CokeProcessing.CrackPlastic)
					TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['crack_baggy'], "add", Config.CokeProcessing.CrackCooked)
					TriggerClientEvent('QBCore:Notify', src, Lang:t("success.cook_crack"), "success")
						if Config.PickleXP then
						exports['pickle_xp']:AddPlayerXP(source, "drugs", Config.XPGain.XPCrack)
						end
				else
					Player.Functions.AddItem('coke', Config.CokeProcessing.CrackCokeRaw)
					Player.Functions.AddItem('bakingsoda', Config.CokeProcessing.CrackBakingSoda)
					Player.Functions.AddItem('plastic', Config.CokeProcessing.CrackPlastic)
				end
			end
		else
			Player.Functions.AddItem('coke', Config.CokeProcessing.CrackCokeRaw)
			TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no_bakingsoda"), "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t("error.no"), "error")
	end
end)

RegisterServerEvent('coma-coke:cancelProcessing', function()
end)

QBCore.Functions.CreateCallback('coma-coke:validate_items', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
	local hasItems = {
		ret = true,
		items = {}
	}
	for name,amount in pairs(data) do
		local item = Player.Functions.GetItemByName(name)
		if not item or item and item.amount < amount then
			hasItems.ret = false
			hasItems.items[#hasItems.items+1] = QBCore.Shared.Items[name].label
		end
		if not hasItems then break end
	end
	hasItems.item = table.concat(hasItems.items, ", ")
	cb(hasItems)
end)
