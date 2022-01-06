Config                            = {}

Config.DrawDistance               = 25.0

--40 apples
--40 oranges

-- 80 juice max

Config.JuiceSellEarnings		  = 7
Config.AppleSellEarnings		  = 3
Config.OrangeSellEarnings		  = 3
Config.NPCJobEarnings             = {min = 0, max = 1}
Config.MinimumDistance            = 3000 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destionations.

Config.MaxInService               = -1
Config.EnablePlayerManagement     = false
Config.EnableSocietyOwnedVehicles = false

Config.Locale                     = 'en'

Config.AuthorizedVehicles = {

		{
			model = 'btype3',
			label = 'btype3',
			price = 500
		}

	}

--[[Config.Cloakroom = {

}]]

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = 407.87, y = 6498.17, z = 26.900},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Text = 'Press ~b~[E] ~s~ to spawn the vehicle',
		Type  = 27, Rotate = false
	},

	VehicleSpawnPoint = {
		Pos     = {x = 397.43, y = 6492.58, z = 28.01},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = false,
		Heading = 88.33
	},

	VehicleDeleter = {
		Pos   = {x = 406.51, y = 6493.00, z = 27.12},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 255, g = 255, b = 255},
		Text = 'Press ~b~[E] ~s~to store the vehicle',
		Type  = 27, Rotate = false
	},

	OrchardActions = {
		Pos   = {x = 1938.54, y = 4656.07, z = 43.26},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Text = 'Press ~b~[E]~s~ to open the boss office',
		Type  = 27, Rotate = false
	},

	Cloakroom = {
		Pos     = {x = 405.75, y = 6526.29, z = 27.71},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 255, g = 255, b = 255},
		Text = 'Press ~b~[E] ~s~ to open the cloak room',
		Type    = 27, Rotate = false
	},

	Help = {
		Pos     = {x = 405.23, y = 6522.35, z = 27.68},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 255, g = 255, b = 255},
		Text = 'Press ~b~[E]~s~ to view help',
		Type    = 27, Rotate = false
	},

	--[[ BuyVehicle = {
		Pos   = {x = 2364.68, y = 3123.0, z = 47.41},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Text = 'Press ~b~[E]~s~ to purchase the vehicle',
		Type  = 27, Rotate = false
	}, ]]

	Job1 = {
		Pos   = {x = 354.81, y = 6516.67, z = 28.52},
		Size  = {x = 25.0, y = .0, z = .0},
		Color = {r=255, g=255, b=255},
		Text = 'Press ~b~[E]~s~ to start picking fruit',
		Type  = 27, Rotate = false
	},

	--[[Job7 = {
		Pos   = {x = 384.39, y = 6528.63, z = 29.00},
		Size  = {x = 2.0, y = 2.0, z = 2.0},
		Color = {r=255, g=159, b=0},
		Type  = 20, Rotate = false
	},

	Job7b = {
		Pos   = {x = 291.89, y = 6515.70, z = 28.80},
		Size  = {x = 2.0, y = 2.0, z = 2.0},
		Color = {r=255, g=159, b=0},
		Type  = 20, Rotate = false
	},]]

	Job1b = {
		Pos   = {x = 247.94, y = 6513.16, z = 29.50},
		Size  = {x = 20.0, y = .0, z = .0},
		Color = {r=255, g=255, b=255},
		Text = 'Press ~b~[E]~s~ to start picking fruit',
		Type  = 27, Rotate = false
	},

	Job2 = {
		Pos   = {x = -249.61, y = 6063.83, z = 30.85},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color =	{r=255, g=255, b=255},
		Text = 'Press ~b~[E]~s~ to use the warehouse.',
		Type  = 27, Rotate = false
	},

	Job3 = {
		Pos   = {x = 1264.247, y = 3545.389, z = 34.200},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r=255, g=255, b=255},
		Text = 'Press ~b~[E]~s~ to sell fruit',
		Type  = 27, Rotate = false
	},
	
	Job3a = {
		Pos   = {x = 2739.931, y = 4403.824, z = 47.7},
		Size  = {x = 3.0, y = 3.0, z = 3.0},
		Color = {r=255, g=159, b=0},
		Text = 'Press ~b~[E]~s~ to grab juice cooler',
		Type  = 27, Rotate = false
	},

	JuiceSell = {
		Pos   = {x = 2743.837, y = 4415.7, z = 47.623},
		Size  = {x = 0.8, y = 0.8, z = 0.8},
		Color = {r=255, g=255, b=255},
		Text = 'Press ~b~[E]~s~ to sell juices',
		Type  = 27, Rotate = false
	}

}

Config.Blips = {
	Cloakroom = {Sprite = 76},
	Apple = {Sprite = 77},
	Orange = {Sprite = 78},
	Juice = {Sprite = 80},
	SellJuice = {Sprite = 88},
	SellFruits = {Sprite = 79},
}

Config.Help = {
	Title = 'HELP',
	Text = 'Collect 40 apples and oranges from two nearby orchards. Take the collections to your company car and sell them directly in the store, or turn into juice to increase profits.',
	Time = 5,
}

Config.JobLocations = {
	{x = 293.476,  y = -590.163, z = 42.7371},
	{x = 253.404,  y = -375.86, z = 44.0819},
	{x = 120.808,  y = -300.416, z = 45.1399},
	{x = -38.4132, y = -381.576, z = 38.3456},
	{x = -107.442, y = -614.377, z = 35.6703},
	{x = -252.292, y = -856.474, z = 30.5626},
	{x = -236.138, y = -988.382, z = 28.7749},
	{x = -276.989, y = -1061.18, z = 25.6853},
	{x = -576.451, y = -998.989, z = 21.785},
	{x = -602.798, y = -952.63, z = 21.6353},
	{x = -790.653, y = -961.855, z = 14.8932},
	{x = -912.588, y = -864.756, z = 15.0057},
	{x = -1069.77, y = -792.513, z = 18.8075},
	{x = -1306.94, y = -854.085, z = 15.0959},
	{x = -1468.51, y = -681.363, z = 26.178},
	{x = -1380.89, y = -452.7, z = 34.0843},
	{x = -1326.35, y = -394.81, z = 36.0632},
	{x = -1383.68, y = -269.985, z = 42.4878},
	{x = -1679.61, y = -457.339, z = 39.4048},
	{x = -1812.45, y = -416.917, z = 43.6734},
	{x = -2043.64, y = -268.291, z = 22.9927},
	{x = -2186.45, y = -421.595, z = 12.6776},
	{x = -1862.08, y = -586.528, z = 11.1747},
	{x = -1859.5,  y = -617.563, z = 10.8788},
	{x = -1634.95, y = -988.302, z = 12.6241},
	{x = -1283.99, y = -1154.16, z = 5.30998},
	{x = -1126.47, y = -1338.08, z = 4.63434},
	{x = -867.907, y = -1159.67, z = 5.00795},
	{x = -847.55,  y = -1141.38, z = 6.27591},
	{x = -722.625, y = -1144.6, z = 10.2176},
	{x = -575.503, y = -318.446, z = 34.5273},
	{x = -592.309, y = -224.853, z = 36.1209},
	{x = -559.594, y = -162.873, z = 37.7547},
	{x = -534.992, y = -65.6695, z = 40.634},
	{x = -758.234, y = -36.6906, z = 37.2911},
	{x = -1375.88, y = 20.9516, z = 53.2255},
	{x = -1320.25, y = -128.018, z = 48.097},
	{x = -1285.71, y = 294.287, z = 64.4619},
	{x = -1245.67, y = 386.533, z = 75.0908},
	{x = -760.355, y = 285.015, z = 85.0667},
	{x = -626.786, y = 254.146, z = 81.0964},
	{x = -563.609, y = 267.962, z = 82.5116},
	{x = -486.806, y = 271.977, z = 82.8187},
	{x = 88.295,   y = 250.867, z = 108.188},
	{x = 234.087,  y = 344.678, z = 105.018},
	{x = 434.963,  y = 96.707, z = 99.1713},
	{x = 482.617,  y = -142.533, z = 58.1936},
	{x = 762.651,  y = -786.55, z = 25.8915},
	{x = 809.06,   y = -1290.8, z = 25.7946},
	{x = 490.819,  y = -1751.37, z = 28.0987},
	{x = 432.351,  y = -1856.11, z = 27.0352},
	{x = 164.348,  y = -1734.54, z = 28.8982},
	{x = -57.6909, y = -1501.4, z = 31.1084},
	{x = 52.2241,  y = -1566.65, z = 29.006},
	{x = 310.222,  y = -1376.76, z = 31.4442},
	{x = 181.967,  y = -1332.79, z = 28.8773},
	{x = -74.6091, y = -1100.64, z = 25.738},
	{x = -887.045, y = -2187.46, z = 8.13248},
	{x = -749.584, y = -2296.59, z = 12.4627},
	{x = -1064.83, y = -2560.66, z = 19.6811},
	{x = -1033.44, y = -2730.24, z = 19.6868},
	{x = -1018.67, y = -2732, z = 13.2687},
	{x = 797.354,  y = -174.423, z = 72.708},
	{x = 508.156,  y = -117.908, z = 60.78},
	{x = 159.458,  y = -27.555, z = 67.38},
	{x = -36.382,  y = -106.912, z = 56.982},
	{x = -355.801, y = -270.404, z = 33.011},
	{x = -831.196, y = -76.871, z = 37.323},
	{x = -1038.707, y = -214.593, z = 37},
	{x = 1918.448, y = 3691.41, z = 32.261},
	{x = 1820.217, y = 3697.115, z = 33.493},
	{x = 1619.323, y = 3827.162, z = 34.482},
	{x = 1418.628, y = 3602.243, z = 34.511},
	{x = 1944.858, y = 3856.252, z = 31.741},
	{x = 2285.278, y = 3839.444, z = 34.023},
	{x = 2760.945, y = 3387.813, z = 55.659},
	{x = 1952.819, y = 2627.731, z = 45.368},
	{x = 1051.414, y = 474.833, z = 93.653},
	{x = 866.393,  y = 17.635, z = 78.654},
	{x = 318.985,  y = 167.41, z = 103.335},
	{x = 88.836,   y = 254.054, z = 108.236},
	{x = -44.852,  y = 70.414, z = 72.437},
	{x = -115.496, y = 84.333, z = 70.792},
	{x = -384.806, y = 226.868, z = 83.548},
	{x = -578.669, y = 139.085, z = 61.337},
	{x = -651.334, y = -584.879, z = 34.116},
	{x = -571.847, y = -1195.648, z = 17.869},
	{x = -1513.271, y = -670.039, z = 28.362},
	{x = -1297.484, y = -654.913, z = 26.123},
	{x = -1645.546, y = 144.571, z = 61.664},
	{x = -1160.618, y = 744.418, z = 154.571},
	{x = -798.09, y = 831.699, z = 204.351},




}

Config.Strefy = {

	Praca = {
        x = 538.17,
        y = 101.61,
        z = 95.63
	},

	Spawn = {
        Pos   = {x = 548.39, y = 125.23, z = 96.47},
        Heading = 70.0
    },

    Anulowanie = {
        x = 558.52,
        y = 121.27,
        z = 97.37
    },
    
    Zakonczenie = {
        x = 571.25,
        y = 116.78,
        z = 97.36
	},
	

}

Config.FishTime = {a = 20000, b = 44000}
	
	--------------------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
	Config.FishPrice = {a = 95, b = 143} --Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
	Config.TurtlePrice = {a = 240, b = 260} --Will get dirty money
	Config.SharkPrice = {a = 350, b = 356} --Will get dirty money

	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.SellFish = {x = -3251.2, y = 991.5, z = 11.49} --Place where players can sell their fish
	Config.SellTurtle = {x = 3804.0, y = 4443.3, z = 3.0} --Place where players can sell their turtles 
	Config.SellShark = {x = 2517.6 , y = 4218.0, z = 38.8} --Place where players can sell their sharks

	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
Config.MarkerZones = { 
	
    {x = -3426.7   ,y = 955.66 ,z = 7.35, xs = -3426.2  , ys = 942.4, zs = 1.1 },
	{x = -732.9     ,y = -1309.7 ,z = 4.0, xs = -725.7    , ys = -1351.5, zs = 0.5 },  
	{x = -1607.6      ,y =  5252.8 ,z = 3.0, xs = -1590.2      , ys = 5278.8, zs = 1.0 },
	{x = 3855.0        ,y =  4463.7 ,z = 1.6, xs = 3885.2       , ys =  4507.2, zs = 1.0 },
	{x = 1330.8        ,y =  4226.6 ,z = 32.9, xs = 1334.2         , ys =  4192.4, zs = 30.0 },
	

}

