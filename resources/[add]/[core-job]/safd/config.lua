Config             = {}
Config.SaveDeathStatus	= true -- Save Death Status?

Config.pos = {

	menu = {
		title = 'San Andreas Fire Department',

		gps = {
			title = 'S.A.F.D',
			desc = 'Se diriger vers la caserne',
			logo = 'https://i.goopics.net/l4zuce.png',
			x = -660.84,
			y = -75.86,
			z = 38.59,
		},
	},

	soin = { -- Ped de soin
		position = {x = -631.0, y = -124.79, z = 39.22},
        heading = 303.21 -- angle du peds
	},

	boss = { -- Action patron
		position = {x = -617.43-0.3, y = -96.8-0.2, z = 45.70},
	},

	annonce = { -- Espace Annonce
		position = {x = -653.75, y = -87.16, z = 38.85},
	},

	dispatch = { -- Si tu utilise Rcore_Dispatch sinon voir dans dispatch.lua => ligne 4 pour modifier
		position = {x = -624.04-0.3, y = -103.06-0.3, z = 45.50},
	},

	garage = { -- position du menu
		position = {x = -623.86, y = -112.08, z = 38.15}, -- position du peds
        heading = 73.69, -- angle du peds

		spawn = {x = -621.93, y = -98.64, z = 38.15}, -- position de spawn du vehicule
        angle = 83.17, -- angle de spawn
	},

	vest = { -- Vestiaire
		position = {x = -627.43, y = -121.71, z = 39.32},
	},










	-- Assenceur
	
	tp01 = { -- Bouton
		label = "Niveau Helipad",
		position = {x = 338.59-0.5, y = -583.87+0.2, z = 74.17},
	},	
	tp1 = { -- Spawn
		position = {x = 338.81, y = -584.00, z = 74.17},
		heading = 237.03
	},

	
	tp02 = { -- Bouton
		label = "Niveau Central",
		position = {x = 333.54+0.27, y = -592.67-0.1, z = 43.40},
	},	
	tp2 = { -- Spawn
		position = {x = 334.93, y = -592.04, z = 43.27},
		heading = 64.71
	},

	
	tp03 = { -- Bouton
		label = "Niveau Urgences",
		position = {x = 325.78-0.3, y = -583.03, z = 28.84+0.1},
	},	
	tp3 = { -- Spawn
		position = {x = 324.51, y = -583.76, z = 28.85},
		heading = 244.54
	},
	
}

Config.Clothe = {
	legal = {
        {
            job = "safd",
			position = {x = -628.18, y = -121.49, z = 39.22},
        },
	},	
}



ShowRange = 5000
DoorLock = true
carInvincible = true 

Cars = {
    {
        pos = vec(-625.75, -78.51, 40.11),
        heading = 355.85,
        model = 'firetruk',
        spin = false,
        --text = "Cliffhanger \n Prix :~y~10'000'000 $",
        plate = "E1 10"
    },

    {
        pos = vec(-633.57, -81.40, 40.11),
        heading = 355.85,
        model = 'lguard',
        spin = false,
        --text = "Cliffhanger \n Prix :~y~10'000'000 $",
        plate = "LG1 10"
    },
    {
        pos = vec(-633.01, -74.68, 40.11),
        heading = 355.85,
        model = 'lguard',
        spin = false,
        --text = "Cliffhanger \n Prix :~y~10'000'000 $",
        plate = "LG1 11"
    },
    {
        pos = vec(-641.57, -81.01, 40.11),
        heading = 355.85,
        model = 'emsnspeedo',
        spin = false,
        --text = "Cliffhanger \n Prix :~y~10'000'000 $",
        plate = "M1 10"
    },
    {
        pos = vec(-640.81, -73.73, 40.11),
        heading = 355.85,
        model = 'emsnspeedo',
        spin = false,
        --text = "Cliffhanger \n Prix :~y~10'000'000 $",
        plate = "M1 11"
    },
}
