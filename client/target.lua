local QBCore = exports['qb-core']:GetCoreObject()
---
CreateThread(function()
	if Config.SpawnCokePed then
		exports['qb-target']:SpawnPed({
			model = 'a_m_y_stbla_02',
			coords = Config.SpawnPedLocation,
			minusOne = true, 
			freeze = true, 
			invincible = true, 
			blockevents = true,
			target = { 
				options = {
					{
						type = "client",
						event = "coma-coke:EnterCokeLab",
						icon = "fas fa-key",
						label = "Ask Bumpy if you can enter",
					}
				},
			  distance = 2.0,
			},
		})
	end
end)

CreateThread(function()

exports["qb-target"]:AddBoxZone("EnterTheCokeRoom", Config.EnterDoor, 0.1, 1.5, {
        name = "EnterTheCokeRoom",
        heading = 230,
        debugPoly = false,
		minZ = 30.85,
		maxZ = 34.85,
    }, {
        options = {
            {
                type = "client",
                event = "coma-coke:EnterCokeLab",
                icon = "fas fa-key",
                label = "Enter the Coke Room",
            },
        },
    distance = 2.0
    })
	
exports["qb-target"]:AddBoxZone("ExitTheCokeRoom", Config.ExitDoor, 0.1, 1.5, {
        name = "ExitTheCokeRoom",
        heading = 0,
        debugPoly = false,
		minZ = -41.59,
		maxZ = -37.59,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:ExitCokeLab",
                icon = "fas fa-key",
                label = "Exit the Coke Room",
            },
        },
    distance = 2.0
    })

exports["qb-target"]:AddBoxZone("cokeleafproc", vector3(Config.Zones.CokeProcessing.coords["x"], Config.Zones.CokeProcessing.coords["y"], Config.Zones.CokeProcessing.coords["z"]), Config.Zones.CokeProcessing.width, Config.Zones.CokeProcessing.length, {
        name = "cokeleafproc",
        --heading = 88.35,
		heading = Config.Zones.CokeProcessing.heading,
        debugPoly = false,
		minZ = Config.Zones.CokeProcessing.minZ,
		maxZ = Config.Zones.CokeProcessing.maxZ,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:ProcessCocaLeaf",
                icon = "fas fa-scissors",
                label = "Process Coca Leaves into Raw Coke",
            },
        },
    distance = 1.5
    })

exports["qb-target"]:AddBoxZone("cokepowdercut", vector3(Config.Zones.CokePowder.coords["x"], Config.Zones.CokePowder.coords["y"], Config.Zones.CokePowder.coords["z"]), Config.Zones.CokePowder.width, Config.Zones.CokePowder.length, {
        name = "cokepowdercut",
		--heading = 180.22,
		heading = Config.Zones.CokePowder.heading,
        debugPoly = false,
        --minZ = -40.99,
        --maxZ = -36.99,
		minZ = Config.Zones.CokePowder.minZ,
		maxZ = Config.Zones.CokePowder.maxZ,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:ProcessCocaPowder",
                icon = "fas fa-weight-scale",
                label = "Cut Raw Coke into Packages for Selling",
            },
        },
    distance = 1.5
    })

exports["qb-target"]:AddBoxZone("cokebricked", vector3(Config.Zones.CokeBrick.coords["x"], Config.Zones.CokeBrick.coords["y"], Config.Zones.CokeBrick.coords["z"]), Config.Zones.CokeBrick.width, Config.Zones.CokeBrick.length, {
        name = "cokebricked",
        heading = Config.Zones.CokeBrick.heading,
        debugPoly = false,
        minZ = Config.Zones.CokeBrick.minZ,
		maxZ = Config.Zones.CokeBrick.maxZ,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:ProcessCocaBrick",
                icon = "fas fa-weight-scale",
                label = "Combine 1000 Raw Coke to make a Brick",
            },
        },
    distance = 1.5
    })
	
exports["qb-target"]:AddBoxZone("cokebreak", vector3(Config.Zones.CokeBreak.coords["x"], Config.Zones.CokeBreak.coords["y"], Config.Zones.CokeBreak.coords["z"]), Config.Zones.CokeBreak.width, Config.Zones.CokeBreak.length, {
        name = "cokebreak",
        heading = Config.Zones.CokeBreak.heading,
        debugPoly = false,
        minZ = Config.Zones.CokeBreak.minZ,
		maxZ = Config.Zones.CokeBreak.maxZ,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:processCocaBreak",
                icon = "fas fa-weight-scale",
                label = "Break a Key of Coke into Raw Coke",
            },
        },
    distance = 1.5
    })

exports["qb-target"]:AddBoxZone("cookcrack", vector3(Config.Zones.CookCrack.coords["x"], Config.Zones.CookCrack.coords["y"], Config.Zones.CookCrack.coords["z"]), Config.Zones.CookCrack.width, Config.Zones.CookCrack.length, {
        name = "cookcrack",
        heading = Config.Zones.CookCrack.heading,
        debugPoly = false,
        minZ = Config.Zones.CookCrack.minZ,
		maxZ = Config.Zones.CookCrack.maxZ,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:ProcessCookCrack",
                icon = "fas fa-weight-scale",
                label = "Cook Raw Coke into Crack",
            },
        },
    distance = 1.2
    })

exports["qb-target"]:AddBoxZone("CokeQBrick", vector3(Config.Zones.CokeQBrick.coords["x"], Config.Zones.CokeQBrick.coords["y"], Config.Zones.CokeQBrick.coords["z"]), Config.Zones.CokeQBrick.width, Config.Zones.CokeQBrick.length, {
        name = "cokeqbrick",
        heading = Config.Zones.CokeQBrick.heading,
        debugPoly = false,
        minZ = Config.Zones.CokeQBrick.minZ,
		maxZ = Config.Zones.CokeQBrick.maxZ,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:ProcessCocaQBrick",
                icon = "fas fa-weight-scale",
                label = "Brick Up a 1/4 Key of Coke",
            },
        },
    distance = 1.0
    })

exports["qb-target"]:AddBoxZone("BreakCokeQBrick", vector3(Config.Zones.CokeQBreak.coords["x"], Config.Zones.CokeQBreak.coords["y"], Config.Zones.CokeQBreak.coords["z"]), Config.Zones.CokeQBreak.width, Config.Zones.CokeQBreak.length, {
        name = "cokeqbreak",
        heading = Config.Zones.CokeQBreak.heading,
        debugPoly = false,
        minZ = Config.Zones.CokeQBreak.minZ,
		maxZ = Config.Zones.CokeQBreak.maxZ,
}, {
        options = {
            {
                type = "client",
                event = "coma-coke:ProcessCocaQBreak",
                icon = "fas fa-weight-scale",
                label = "Break Down a 1/4 Key of Coke",
            },
        },
    distance = 1.0
    })	
end)

CreateThread(function()
    exports['qb-target']:AddTargetModel("h4_prop_bush_cocaplant_01", {
        options = {
            {
                type = "client",
                event = "coma-coke:pickCocaLeaves",
                icon = "fas fa-leaf",
                label = "Harvest Coca leaves",
            },
        },
        distance = 4.0
    })

	exports['qb-target']:AddTargetModel("prop_offroad_barrel01", {
        options = {
            {
                type = "client",
                event = "coma-coke:pickSulfuric",
                icon = "fas fa-shield-virus",
                label = "Collect Sulfuric Acid",
            },
        },
        distance = 4.0
    })
end)
