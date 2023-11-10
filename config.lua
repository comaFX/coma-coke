Config = {}

--Require the "cokekey" item to enter
Config.KeyRequired = true

---Spawn a Ped to Interact with
Config.SpawnCokePed = true

---Use pickle_xp ( https://github.com/PickleModifications/pickle_xp )
Config.PickleXP = false

---Use DrawText to show a menu to Enter/Exit the coke room by using the [E] key
Config.UseMenu = true

Config.ProcessingTime = {
	CocaHarvest = 10000,
	SulfuricHarvest = 10000,
	CokeLeaf = 20000,
	CutCokePowder = 20000,
	CocaBrick = 20000,
	CocaQBrick = 20000,
	CocaBreak = 20000,
	CocaQBreak = 20000,
	CookCrack = 20000,
}

--The amount of coca plants and sulfuric acid barrels to spawn
Config.SpawnAmounts = {
	Coca = 45,
	SulfuricAcid = 25,
}
--Amount to give for each harvest amount
Config.HarvestAmounts = {
	Coca = 10,
	SulfuricAcid = 5,
}

Config.XPReq = {
	EnterTheCokeRoom = 1,
	ProcessCocaLeaves = 1,
	CutRawCoke = 1,
	CookCokeToCrack = 1,
	BrickUpRawCoke = 1,
	BreakDownCokeBrick = 1,
	QBrick = 1,
	BreakQBrick = 1,
}

Config.XPGain = {
	XPHarvestCoca = 1,
	XPHarvestSulf = 1,
	XPLeaves = 1,
	XPCut = 1,
	XPCrack = 1,
	XPBrick = 1,
	XPQBrick =1,
	XPBreak = 1,
	XPQBreak = 1,
}
Config.CokeProcessing = {
	-- Processing Coca Leaves into Raw Coke
	SulfuricAcid = 5,
	CokeLeaf = 10,
	ProcessCokeLeaf = 10,

	-- Processing Raw coke into Bags of Coke
	Coke = 10,
	BakingSoda = 3,
	CokeBaggies = math.random(13,15),
	CutPlastic = 1,
	
	-- Processing Raw Coke into a Coke Brick
	CokeRaw = 1000,
	LargeBrick = 1,
	BrickPlastic = 5,
	
	--Processing Raw Coke into a 1/4 Coke Brick
	QCokeRaw = 250,
	QBrick = 1,
	QBrickPlastic = 2,
	
	-- Processing Raw Coke into Crack
	CrackCokeRaw = 10,
	CrackBakingSoda = 6,
	CrackPlastic = 1,
	CrackCooked = math.random(20,23),
}

Config.EnterCokeLab = {
	coords = vector4(116.26, -1686.14, 33.49, 45.06),
    radius = 2.0,
}
Config.ExitCokeLab = {
	coords = vector4(1088.75, -3187.95, -38.99, 179.31),
    radius = 2.0,
}

Config.Zones = {
	-----------------------------------------------------
	---------------------Item Spawns---------------------
	-----------------------------------------------------
	SulfuricAcidSpawns = {coords = vector3(599.21, 2887.87, 39.77), name = ('Sulfuric Acid'), radius = 250.0},---Where Sulfuric Acid Spawns
	CokeField = {coords = vector3(-1478.66, 4571.05, 37.68), name = ('Coca'), radius = 250.0},---Where Coca Plants Spawn
	-----------------------------------------------------
	----------Processing Table Locations-----------------
	-----------------------------------------------------
	---Set the vector3 to the center of your drug table. The vector3 is used in the circle zone and box zone. 
	---Radius is for the circle zone that you must be within to interact. Heading, length, width, minZ, maxZ, is for the box zone surrounding your table and is used for tageting.
	CokeProcessing = {coords = vector3(1086.53, -3196.16, -38.2), name = ('Coke Process'), radius = 3.0, heading = 88.35, width = 1.5, length = 4.8, minZ = -40.99, maxZ = -36.99}, 
	CokePowder = {coords = vector3(1092.87, -3195.58, -38.13), name = ('Powder Cutting'), radius = 3.0, heading = 180.22, width = 1.5, length = 6.65, minZ = -40.99, maxZ = -36.99},
	CokeBrick = {coords = vector3(1100.46, -3199.73, -38.2), name = ('Brick Up a Key of Coke'), radius = 3.0, heading = 194.51, width = 1.5, length = 1.5, minZ = -40.99, maxZ = -36.99},
	CokeBreak = {coords = vector3(1101.6, -3192.61, -38.99), name = ('Break Coke Key into Raw Coke'), radius = 3.0, heading = 359.48, width = 2.0, length = 2.0, minZ = -40.99, maxZ = -36.99},
	CookCrack = {coords = vector3(1103.46, -3196.12, -38.06), name = ('Cook Raw Coke into crack'), radius = 3.0, heading = 266.18, width = 2.0, length = 1.4, minZ = -39.99, maxZ = -38.99},
	CokeQBrick = {coords = vector3(1098.92, -3196.36, -37.99), name = ('Brick Up a 1/4 Key of coke'), radius = 1.0, heading = 32.38, width = 1.0, length = 1.0, minZ = -39.99, maxZ = -38.83},
	CokeQBreak = {coords = vector3(1098.85, -3194.18, -38.99), name = ('Brick Up a 1/4 Key of coke'), radius = 1.0, heading = 88.35, width = 1.5, length = 1.5, minZ = -39.99, maxZ = -38.33},
}
