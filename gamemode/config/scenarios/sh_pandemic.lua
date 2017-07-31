-- Module Whitelist
PureRP.Config.Modules.Whitelist = {}
PureRP.Config.Modules.Whitelist.enabled = true

-- Module Money
PureRP.Config.Modules.Money = {}
PureRP.Config.Modules.Money.Currency = "Rations"

-- Module Name
PureRP.Config.Modules.Name = {}
PureRP.Config.Modules.Name.ChooseOnSpawn = false

-- Module Jobs
PureRP.Config.Modules.Job = {}
PureRP.Config.Modules.Government = {1, 2, 3, 4, 5, 6}
PureRP.Config.Modules.Job.skins = {
  {id = 1, skin = 'models/player/breen.mdl'},
  {id = 2, skin = 'models/dpfilms/metropolice/badass_police.mdl'},
  {id = 3, skin = 'models/dpfilms/metropolice/playermodels/pm_rtb_police.mdl'},
  {id = 4, skin = 'models/dpfilms/metropolice/playermodels/pm_skull_police.mdl'},
  {id = 5, skin = 'models/dpfilms/metropolice/hdpolice.mdl'},
  {id = 6, skin = 'models/player/plague_doktor/citizen_plague_doktor.mdl'},
  {id = 7, skin = 'models/player/group01/male_08.mdl'},
  {id = 8, skin = 'models/player/group01/male_02.mdl'},
  {id = 10, skin = 'models/Humans/Group02/male_06.mdl'},
  {id = 11, skin = 'models/steampunkfoster/steampunkfoster.mdl'},
  {id = 12, skin = 'models/Eli.mdl'},
  {id = 13, skin = 'models/ninja/jason.mdl'},
  {id = 14, skin = 'models/ninja/vaas.mdl'},
  {id = 15, skin = 'models/Humans/Group02/male_08.mdl'},
}
PureRP.Config.Modules.Job.money = {
  {id = 1, money = -1},
  {id = 2, money = 40},
  {id = 3, money = -1},
  {id = 4, money = 20},
  {id = 5, money = 5},
  {id = 6, money = 10},
  {id = 7, money = 8},
  {id = 8, money = 3},
  {id = 10, money = 1},
  {id = 11, money = 3},
  {id = 12, money = 7},
  {id = 13, money = 2},
  {id = 14, money = 2},
  {id = 15, money = 2},
}
PureRP.Config.Modules.Job.weapons = {
  {
    id = 1, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 2, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 3, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 4, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 5, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 6, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 7, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 8, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 10, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 11, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 12, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon', 'weapon_crowbar'}
  },
  {
    id = 13, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon', 'climb_swep2'}
  },
  {
    id = 14, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
  {
    id = 15, weapons = {'weapon_physgun', 'weapon_empty_hands', 'gmod_tool', 'weapon_fists', 'weapon_physcannon'}
  },
}

-- Module shipments
PureRP.Config.Modules.Shipment = {}
PureRP.Config.Modules.Shipment.timeToSpawn = 300
PureRP.Config.Modules.Shipment.spawns = {
  Vector(1775, -1209, 280),
  Vector(358, -1538, 280),
  Vector(-3708, -2276, 280),
  Vector(-3652, 497, 288)
}
PureRP.Config.Modules.Shipment.weapons_spawnable = {
  "fas2_ak12",
  "fas2_ak47",
  "fas2_glock20",
  "fas2_mp5a5",
  "fas2_ots33",
  "fas2_p226",
  "fas2_an94",
  "durgz_cigarette",
  "durgz_alcohol"
}