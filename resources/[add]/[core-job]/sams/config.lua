Config             = {}
Config.sams		   = Config
Config.SaveDeathStatus	= true -- Save Death Status?

Config.pos = {
		RespawnPoint = {x = 346.91, y = -595.57, z = 29.70},
		time = 10, -- temps d'attente avant de pouvoir prendre l'unité X
		unitX = 60, -- Temps avant le force respawn

		soin = { -- Ped de soin
			position = {x = 310.51, y = -585.83, z = 43.26},
    	    heading = 85.31 -- angle du peds
		},

		boss = { -- Action patron
			position = {x = 350.83, y = -582.11, z = 43.26},
		},

		annonce = { -- Espace Annonce
			position = {x = 312.55, y = -580.02, z = 43.21},
		},

		dispatch = { -- Si tu utilise Rcore_Dispatch sinon voir dans dispatch.lua => ligne 4 pour modifier
			position = {x = 313.29, y = -586.41, z = 43.71},
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
