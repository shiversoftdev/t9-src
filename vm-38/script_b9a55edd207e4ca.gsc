#using script_46192c58ea066d7f;
#using scripts\wz_common\hud.gsc;
#using scripts\wz_common\spawn.gsc;
#using scripts\wz_common\wz_loadouts.gsc;
#using script_5495f0bb06045dc7;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\mp_common\callbacks.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_152c3f4ffef9e588;
#using script_4ba46a0f73534383;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using script_75da5547b1822294;
#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\struct.gsc;
#using script_44b0b8420eabacad;
#using script_335d0650ed05d36d;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using script_5dc7697466e79178;
#using scripts\core_common\laststand_shared.gsc;
#using script_69514c4c056c768;
#using scripts\core_common\item_inventory.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_2938acdc;

/*
	Name: function_57ac27c3
	Namespace: namespace_2938acdc
	Checksum: 0x8A92E9FB
	Offset: 0x398
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_57ac27c3()
{
	level notify(-1728375642);
}

/*
	Name: init
	Namespace: namespace_2938acdc
	Checksum: 0x9DE92A0F
	Offset: 0x3B8
	Size: 0x2D4
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_db91e97c = 1;
	function_28e27688();
	death_circle::function_c156630d();
	namespace_17baa64d::init();
	if(!is_true(getdvarint(#"hash_613aa8df1f03f054", 1)))
	{
		level.givecustomloadout = &give_custom_loadout;
	}
	setsaveddvar(#"hash_1677d88b90b7fcf8", 1);
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	callback::on_start_gametype(&function_3b948dcf);
	callback::function_c11071a8(&function_c11071a8);
	callback::on_vehicle_spawned(&on_vehicle_spawned);
	callback::add_callback(#"hash_740a58650e79dbfd", &function_c3623479);
	callback::add_callback(#"hash_40cd438036ae13df", &function_1f93e91f);
	callback::on_player_killed(&on_player_killed);
	callback::add_callback(#"hash_3be1213f454fa90e", &function_a4740127);
	level.var_61d4f517 = getgametypesetting(#"hash_3513cf8b4287cdd7");
	level.var_5c49de55 = getgametypesetting(#"hash_6eef7868c4f5ddbc");
	if(is_true(level.var_5c49de55))
	{
		clientfield::register_clientuimodel("squad_wipe_tokens.count", 1, 4, "int");
		callback::on_connect(&on_player_connect);
	}
	level.var_eada15e7 = &function_407d343f;
}

/*
	Name: on_player_connect
	Namespace: namespace_2938acdc
	Checksum: 0xE97C97BE
	Offset: 0x698
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private on_player_connect()
{
	if(!isdefined(game.var_5c49de55[self.team]))
	{
		game.var_5c49de55[self.team] = level.var_5c49de55;
	}
	self clientfield::set_player_uimodel("squad_wipe_tokens.count", game.var_5c49de55[self.team]);
}

/*
	Name: function_b8da6142
	Namespace: namespace_2938acdc
	Checksum: 0x67243356
	Offset: 0x708
	Size: 0xA8
	Parameters: 1
	Flags: None
*/
function function_b8da6142(player)
{
	if(!is_true(level.var_61d4f517))
	{
		return 0;
	}
	if(!isdefined(level.var_5f536694))
	{
		level.var_5f536694 = [];
	}
	if(level.var_5f536694[player.squad] === gettime())
	{
		return 1;
	}
	forcespawn = !player laststand_mp::function_c0ec19cd();
	if(forcespawn)
	{
		level.var_5f536694[player.squad] = gettime();
	}
	return forcespawn;
}

/*
	Name: function_e1ca24fe
	Namespace: namespace_2938acdc
	Checksum: 0xE52862F3
	Offset: 0x7B8
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_e1ca24fe(players)
{
	arrayremovevalue(players, undefined, 0);
	return players;
}

/*
	Name: function_c11071a8
	Namespace: namespace_2938acdc
	Checksum: 0x4190BD1D
	Offset: 0x7E8
	Size: 0x358
	Parameters: 0
	Flags: None
*/
function function_c11071a8()
{
	wait(math::clamp(level.prematchperiod - 2, 0, level.prematchperiod));
	players = getplayers();
	if(is_true(getgametypesetting("allowPlayerMovementPrematch")))
	{
		level thread function_38b14e59(players, 2, 3, 2, 0);
	}
	wait(2);
	players = function_e1ca24fe(players);
	foreach(player in players)
	{
		player val::set(#"hash_4a7df1f1aa746fdc", "freezecontrols", 1);
		player val::set(#"hash_4a7df1f1aa746fdc", "disablegadgets", 1);
		if(isdefined(player.startspawn))
		{
			if(isdefined(player.startspawn.origin))
			{
				player setorigin(player.startspawn.origin);
			}
			if(isdefined(player.startspawn.angles))
			{
				player setplayerangles(player.startspawn.angles);
			}
		}
	}
	wait(3 + (2 / 3));
	players = function_e1ca24fe(players);
	foreach(player in players)
	{
		if(!isalive(player))
		{
			continue;
		}
		player val::reset(#"hash_4a7df1f1aa746fdc", "freezecontrols");
		player val::reset(#"hash_4a7df1f1aa746fdc", "disablegadgets");
	}
}

/*
	Name: function_38b14e59
	Namespace: namespace_2938acdc
	Checksum: 0x21F61802
	Offset: 0xB48
	Size: 0x344
	Parameters: 5
	Flags: None
*/
function function_38b14e59(players, fadeouttime, blacktime, fadeintime, rumble)
{
	if(isdefined(lui::get_luimenu("FullScreenBlack")))
	{
		lui_menu = lui::get_luimenu("FullScreenBlack");
	}
	players = function_e1ca24fe(players);
	foreach(player in players)
	{
		if(isdefined(player))
		{
			if(![[ lui_menu ]]->function_7bfd10e6(player))
			{
				[[ lui_menu ]]->open(player);
			}
			[[ lui_menu ]]->set_startalpha(player, 0);
			[[ lui_menu ]]->set_endalpha(player, 1);
			[[ lui_menu ]]->set_fadeovertime(player, int(fadeouttime * 1000));
		}
	}
	wait(fadeouttime + blacktime);
	players = function_e1ca24fe(players);
	foreach(player in players)
	{
		player thread item_inventory::reset_inventory();
		if(rumble)
		{
			player function_bc82f900(#"infiltration_rumble");
		}
		if(![[ lui_menu ]]->function_7bfd10e6(player))
		{
			[[ lui_menu ]]->open(player);
		}
		[[ lui_menu ]]->set_startalpha(player, 1);
		[[ lui_menu ]]->set_endalpha(player, 0);
		[[ lui_menu ]]->set_fadeovertime(player, int(fadeintime * 1000));
	}
	wait(fadeintime);
	players = function_e1ca24fe(players);
	foreach(player in players)
	{
		[[ lui_menu ]]->close(player);
	}
}

/*
	Name: function_3b948dcf
	Namespace: namespace_2938acdc
	Checksum: 0x26EE9756
	Offset: 0xE98
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_3b948dcf()
{
	if(!level.deathcircle.enabled)
	{
		return;
	}
	waitframe(1);
	level.var_35d74f0a = location::function_2e7ce8a0();
	deathcircle = death_circle::function_a8749d88(level.var_35d74f0a.origin, level.var_35d74f0a.radius, 5, 1);
	level thread death_circle::function_dc15ad60(deathcircle);
	function_aef30871(level.var_35d74f0a);
}

/*
	Name: function_aef30871
	Namespace: namespace_2938acdc
	Checksum: 0xD9DC0FF0
	Offset: 0xF50
	Size: 0x2F0
	Parameters: 1
	Flags: None
*/
function function_aef30871(location)
{
	if(isdefined(level.var_7767cea8))
	{
		var_a144f484 = [];
		foreach(dest in level.var_7767cea8)
		{
			distance = distance2d(dest.origin, location.origin);
			if(distance < location.radius)
			{
				if(!isdefined(var_a144f484))
				{
					var_a144f484 = [];
				}
				else if(!isarray(var_a144f484))
				{
					var_a144f484 = array(var_a144f484);
				}
				var_a144f484[var_a144f484.size] = dest;
			}
		}
		if(var_a144f484.size == 0)
		{
			var_56c7ce59 = undefined;
			closest_distance = 999999999;
			foreach(dest in level.var_7767cea8)
			{
				distance = distance2d(dest.origin, location.origin);
				if(distance < closest_distance)
				{
					closest_distance = distance;
					var_56c7ce59 = dest;
				}
			}
			if(!isdefined(var_a144f484))
			{
				var_a144f484 = [];
			}
			else if(!isarray(var_a144f484))
			{
				var_a144f484 = array(var_a144f484);
			}
			var_a144f484[var_a144f484.size] = var_56c7ce59;
		}
		foreach(dest in level.var_7767cea8)
		{
			if(!function_844e7af4(dest, var_a144f484))
			{
				spawn::function_3b1d0553(dest);
			}
		}
		level.var_7767cea8 = var_a144f484;
	}
}

/*
	Name: function_844e7af4
	Namespace: namespace_2938acdc
	Checksum: 0x244F4BBE
	Offset: 0x1248
	Size: 0xA0
	Parameters: 2
	Flags: None
*/
function function_844e7af4(dest, destinations)
{
	foreach(var_57701f4a in destinations)
	{
		if(var_57701f4a.target == dest.target)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_28e27688
	Namespace: namespace_2938acdc
	Checksum: 0x1883E446
	Offset: 0x12F0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_28e27688()
{
	location::function_18dac968((-2800, -17300, 1370), 0, 0, 10000);
}

/*
	Name: give_custom_loadout
	Namespace: namespace_2938acdc
	Checksum: 0x538566FF
	Offset: 0x1328
	Size: 0x340
	Parameters: 1
	Flags: None
*/
function give_custom_loadout(takeoldweapon)
{
	if(!isdefined(takeoldweapon))
	{
		takeoldweapon = 0;
	}
	self loadout::init_player(!takeoldweapon);
	if(takeoldweapon)
	{
		oldweapon = self getcurrentweapon();
		weapons = self getweaponslist();
		foreach(weapon in weapons)
		{
			self takeweapon(weapon);
		}
	}
	nullprimary = getweapon(#"null_offhand_primary");
	self giveweapon(nullprimary);
	self setweaponammoclip(nullprimary, 0);
	self switchtooffhand(nullprimary);
	if(self.firstspawn !== 0)
	{
		hud::function_2f66bc37();
	}
	healthgadget = getweapon(#"gadget_health_regen");
	self giveweapon(healthgadget);
	self setweaponammoclip(healthgadget, 0);
	self switchtooffhand(healthgadget);
	level.var_ef61b4b5 = healthgadget;
	var_fb6490c8 = self gadgetgetslot(healthgadget);
	self gadgetpowerset(var_fb6490c8, 0);
	bare_hands = getweapon(#"bare_hands");
	self giveweapon(bare_hands);
	self function_c9a111a(bare_hands);
	self switchtoweapon(bare_hands, 1);
	if(self.firstspawn !== 0)
	{
		self setspawnweapon(bare_hands);
	}
	self.specialty = self getloadoutperks(0);
	self loadout::register_perks();
	self thread function_fd19a11c();
	return bare_hands;
}

/*
	Name: function_fd19a11c
	Namespace: namespace_2938acdc
	Checksum: 0xB766AC7E
	Offset: 0x1670
	Size: 0x27C
	Parameters: 0
	Flags: None
*/
function function_fd19a11c()
{
	self endon(#"death");
	waitframe(1);
	while(!isdefined(self.inventory))
	{
		waitframe(1);
	}
	item_inventory::reset_inventory(0);
	var_3401351 = function_21a3a673(1, 5);
	switch(var_3401351)
	{
		case 1:
		{
			function_6541c917();
			break;
		}
		case 2:
		{
			function_ae5cdb4c();
			break;
		}
		case 3:
		{
			function_a0a43fdb();
			break;
		}
		case 4:
		{
			function_343266f9();
			break;
		}
		case 5:
		{
			function_2e725b79();
			break;
		}
	}
	give_max_ammo();
	var_67fe8973 = [];
	var_67fe8973[var_67fe8973.size] = 126;
	var_67fe8973[var_67fe8973.size] = 128;
	var_67fe8973[var_67fe8973.size] = 134;
	var_67fe8973[var_67fe8973.size] = 125;
	give_killstreaks(var_67fe8973);
	actionslot3 = (getdvarint(#"hash_449fa75f87a4b5b4", 0) > 0 ? "ping_callouts" : "flourish_callouts");
	self setactionslot(3, actionslot3);
	actionslot4 = (getdvarint(#"hash_23270ec9008cb656", 0) > 0 ? "sprays_boasts" : "scorestreak_wheel");
	self setactionslot(4, actionslot4);
}

/*
	Name: give_killstreaks
	Namespace: namespace_2938acdc
	Checksum: 0x4895CAE5
	Offset: 0x18F8
	Size: 0x4D4
	Parameters: 1
	Flags: None
*/
function give_killstreaks(var_67fe8973)
{
	self loadout::clear_killstreaks();
	if(!level.loadoutkillstreaksenabled)
	{
		return;
	}
	classnum = self.class_num_for_global_weapons;
	sortedkillstreaks = [];
	currentkillstreak = 0;
	for(killstreaknum = 0; killstreaknum < var_67fe8973.size; killstreaknum++)
	{
		killstreakindex = var_67fe8973[killstreaknum];
		if(isdefined(killstreakindex) && killstreakindex > 0)
		{
			/#
				assert(isdefined(level.tbl_killstreakdata[killstreakindex]), ("" + killstreakindex) + "");
			#/
			if(isdefined(level.tbl_killstreakdata[killstreakindex]))
			{
				self.killstreak[currentkillstreak] = level.tbl_killstreakdata[killstreakindex];
				if(is_true(level.usingmomentum))
				{
					killstreaktype = killstreaks::get_by_menu_name(self.killstreak[currentkillstreak]);
					if(isdefined(killstreaktype))
					{
						weapon = killstreaks::get_killstreak_weapon(killstreaktype);
						self giveweapon(weapon);
						if(is_true(level.usingscorestreaks))
						{
							if(weapon.iscarriedkillstreak)
							{
								if(!isdefined(self.pers[#"held_killstreak_ammo_count"][weapon]))
								{
									self.pers[#"held_killstreak_ammo_count"][weapon] = 0;
								}
								if(!isdefined(self.pers[#"held_killstreak_clip_count"][weapon]))
								{
									self.pers[#"held_killstreak_clip_count"][weapon] = 0;
								}
								if(self.pers[#"held_killstreak_ammo_count"][weapon] > 0)
								{
									self killstreaks::function_fa6e0467(weapon);
								}
								else
								{
									self loadout::function_3ba6ee5d(weapon, 0);
								}
							}
							else
							{
								quantity = 0;
								if(isdefined(self.pers[#"killstreak_quantity"]) && isdefined(self.pers[#"killstreak_quantity"][weapon]))
								{
									quantity = self.pers[#"killstreak_quantity"][weapon];
								}
								self setweaponammoclip(weapon, quantity);
							}
						}
						sortdata = spawnstruct();
						sortdata.cost = self function_dceb5542(level.killstreaks[killstreaktype].itemindex);
						sortdata.weapon = weapon;
						sortindex = 0;
						for(sortindex = 0; sortindex < sortedkillstreaks.size; sortindex++)
						{
							if(sortedkillstreaks[sortindex].cost > sortdata.cost)
							{
								break;
							}
						}
						for(i = sortedkillstreaks.size; i > sortindex; i--)
						{
							sortedkillstreaks[i] = sortedkillstreaks[i - 1];
						}
						sortedkillstreaks[sortindex] = sortdata;
					}
				}
				currentkillstreak++;
			}
		}
	}
	var_2e1bd530 = [];
	var_2e1bd530[0] = 3;
	var_2e1bd530[1] = 1;
	var_2e1bd530[2] = 0;
	if(isdefined(level.usingmomentum) && level.usingmomentum)
	{
		for(sortindex = 0; sortindex < sortedkillstreaks.size && sortindex < var_2e1bd530.size; sortindex++)
		{
			if(sortedkillstreaks[sortindex].weapon != level.weaponnone)
			{
				self function_d9b9c4c6(var_2e1bd530[sortindex], sortedkillstreaks[sortindex].weapon);
			}
		}
	}
}

/*
	Name: function_6541c917
	Namespace: namespace_2938acdc
	Checksum: 0x743227E1
	Offset: 0x1DD8
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_6541c917()
{
	wz_loadouts::give_weapon(#"pistol_standard_t8_item");
	wz_loadouts::give_weapon(#"smg_standard_t8_item", array(#"tritium_wz_item"));
	wz_loadouts::function_52df229a(#"frag_grenade_wz_item");
	wz_loadouts::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_ae5cdb4c
	Namespace: namespace_2938acdc
	Checksum: 0xA3EF9EBD
	Offset: 0x1E88
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_ae5cdb4c()
{
	wz_loadouts::give_weapon(#"pistol_standard_t8_item");
	wz_loadouts::give_weapon(#"ar_accurate_t8_item", array(#"reflex_wz_item"));
	wz_loadouts::function_52df229a(#"frag_grenade_wz_item");
	wz_loadouts::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_a0a43fdb
	Namespace: namespace_2938acdc
	Checksum: 0xCBF8EAE2
	Offset: 0x1F38
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_a0a43fdb()
{
	wz_loadouts::give_weapon(#"pistol_standard_t8_item");
	wz_loadouts::give_weapon(#"lmg_standard_t8_item", array(#"reflex_wz_item"));
	wz_loadouts::function_52df229a(#"frag_grenade_wz_item");
	wz_loadouts::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_343266f9
	Namespace: namespace_2938acdc
	Checksum: 0x8371EE1B
	Offset: 0x1FE8
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_343266f9()
{
	wz_loadouts::give_weapon(#"pistol_standard_t8_item");
	wz_loadouts::give_weapon(#"tr_powersemi_t8_item");
	wz_loadouts::function_52df229a(#"frag_grenade_wz_item");
	wz_loadouts::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_2e725b79
	Namespace: namespace_2938acdc
	Checksum: 0xCDC25287
	Offset: 0x2078
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_2e725b79()
{
	wz_loadouts::give_weapon(#"pistol_standard_t8_item");
	wz_loadouts::give_weapon(#"sniper_powerbolt_t8_item", array(#"sniperscope_wz_item"));
	wz_loadouts::function_52df229a(#"frag_grenade_wz_item");
	wz_loadouts::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: give_max_ammo
	Namespace: namespace_2938acdc
	Checksum: 0x8A733168
	Offset: 0x2128
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function give_max_ammo()
{
	wz_loadouts::function_52df229a(#"hash_837a6ea0c2864a8", 4);
	wz_loadouts::function_52df229a(#"hash_54f3f08c1d7d45d3", 4);
	wz_loadouts::function_52df229a(#"hash_1cdb9172a79b9080", 4);
	wz_loadouts::function_52df229a(#"hash_4ab594460fa1627b", 4);
	wz_loadouts::function_52df229a(#"hash_f9e29721ba5715e", 4);
	wz_loadouts::function_52df229a(#"hash_75bef4d329c1080b", 4);
}

/*
	Name: function_cb5befb2
	Namespace: namespace_2938acdc
	Checksum: 0xC59D3A66
	Offset: 0x2228
	Size: 0x15A
	Parameters: 0
	Flags: None
*/
function function_cb5befb2()
{
	var_97006d3 = [];
	spawns = spawning::function_4fe2525a();
	circleorigin = level.var_35d74f0a.origin;
	circleradius = level.var_35d74f0a.radius;
	foreach(spawn in spawns)
	{
		distance = distance2d(spawn.origin, circleorigin);
		if(distance > circleradius)
		{
			continue;
		}
		if(!isdefined(var_97006d3))
		{
			var_97006d3 = [];
		}
		else if(!isarray(var_97006d3))
		{
			var_97006d3 = array(var_97006d3);
		}
		var_97006d3[var_97006d3.size] = spawn;
	}
	return var_97006d3;
}

/*
	Name: function_11fa5782
	Namespace: namespace_2938acdc
	Checksum: 0xF7773DD6
	Offset: 0x2390
	Size: 0x1D8
	Parameters: 2
	Flags: None
*/
function function_11fa5782(vehicletype, droppoint)
{
	if(vehicletype != #"hash_6595f5efe62a4ec")
	{
		return;
	}
	if(!isdefined(level.var_5a6cc4da))
	{
		level.var_5a6cc4da = array::randomize(struct::get_array("vehicle_drop_heli", "targetname"));
		level.var_1059a6b4 = 0;
	}
	droppoint = level.var_5a6cc4da[level.var_1059a6b4];
	if(!isdefined(droppoint))
	{
		return;
	}
	ground_pos = bullettrace(droppoint.origin + vectorscale((0, 0, 1), 128), droppoint.origin - vectorscale((0, 0, 1), 128), 0, undefined, 1);
	level.var_1059a6b4 = (level.var_1059a6b4 + 1) % level.var_5a6cc4da.size;
	var_d5552131 = spawnvehicle(vehicletype, ground_pos[#"position"] + vectorscale((0, 0, 1), 120), droppoint.angles);
	if(!isdefined(var_d5552131))
	{
		return;
	}
	var_d5552131 makeusable();
	if(is_true(var_d5552131.isphysicsvehicle))
	{
		var_d5552131 setbrake(1);
	}
	level thread function_c3623479(var_d5552131);
	return var_d5552131;
}

/*
	Name: function_4212369d
	Namespace: namespace_2938acdc
	Checksum: 0x5D27BFC5
	Offset: 0x2570
	Size: 0x1DC
	Parameters: 0
	Flags: None
*/
function function_4212369d()
{
	if(is_true(getgametypesetting(#"hash_12e554c594614ee4")))
	{
		level.var_11fa5782 = &function_11fa5782;
		vehicles = [];
		if(is_true(getgametypesetting(#"hash_183c8366c2eb71e2")))
		{
			vehicles[vehicles.size] = #"vehicle_t9_mil_fav_light";
			vehicles[vehicles.size] = #"vehicle_t9_mil_fav_light";
		}
		if(is_true(getgametypesetting(#"hash_28b3c94342b6914c")))
		{
			vehicles[vehicles.size] = #"hash_6595f5efe62a4ec";
		}
		if(is_true(getgametypesetting(#"hash_21ac269b4a3e7e37")))
		{
			vehicles[vehicles.size] = #"hash_28d512b739c9d9c1";
			vehicles[vehicles.size] = #"hash_28d512b739c9d9c1";
		}
		if(vehicles.size > 0)
		{
			level thread namespace_3d2704b3::function_add63876(vehicles, 2147483647, 120, 120, 180, 2, 45, struct::get_array("vehicle_drop", "targetname"), 6000);
		}
	}
}

/*
	Name: function_20d09030
	Namespace: namespace_2938acdc
	Checksum: 0x76D22534
	Offset: 0x2758
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_20d09030()
{
	if(is_true(getgametypesetting(#"hash_7eb0bbf9b8410462")))
	{
		level thread namespace_3d2704b3::function_7fc18ad5(#"hash_27bac84003da7795", 2147483647, 80, 90, 180);
	}
}

/*
	Name: function_c3623479
	Namespace: namespace_2938acdc
	Checksum: 0x161ABAF1
	Offset: 0x27D0
	Size: 0x1B4
	Parameters: 1
	Flags: None
*/
function function_c3623479(vehicle)
{
	if(!isdefined(vehicle))
	{
		return;
	}
	globallogic_audio::function_61e17de0("fireteamVehSpawn", getplayers(undefined, vehicle.origin, 6000));
	switch(vehicle.vehicletype)
	{
		case "hash_6595f5efe62a4ec":
		{
			objectivetype = "heli_drop";
			break;
		}
		case "hash_28d512b739c9d9c1":
		{
			objectivetype = "tank_drop";
			break;
		}
		case "vehicle_t9_mil_fav_light":
		{
			objectivetype = "fav_drop";
			break;
		}
		default:
		{
			objectivetype = "tank_drop";
		}
	}
	vehicle.objid = gameobjects::get_next_obj_id();
	objective_add(vehicle.objid, "active", vehicle, objectivetype, vehicle);
	objective_setvisibletoall(vehicle.objid);
	vehicle thread function_e63bcc08();
	vehicle waittill(#"death");
	gameobjects::release_obj_id(vehicle.objid);
	wait(30);
	if(isdefined(vehicle))
	{
		vehicle delete();
	}
}

/*
	Name: function_e63bcc08
	Namespace: namespace_2938acdc
	Checksum: 0x9CD5FB76
	Offset: 0x2990
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function function_e63bcc08()
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"enter_vehicle", #"exit_vehicle", #"change_seat");
		player = waitresult.player;
		owner = self getvehoccupants()[0];
		if(isdefined(owner))
		{
			objective_setinvisibletoall(self.objid);
		}
		else
		{
			objective_setvisibletoall(self.objid);
		}
	}
}

/*
	Name: on_vehicle_spawned
	Namespace: namespace_2938acdc
	Checksum: 0x21B45160
	Offset: 0x2A80
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function on_vehicle_spawned()
{
	if(self.scriptvehicletype === "helicopter_heavy")
	{
		globallogic_audio::function_61e17de0("fireteamVehSpawn", getplayers(undefined, self.origin, 6000));
	}
}

/*
	Name: function_1f93e91f
	Namespace: namespace_2938acdc
	Checksum: 0xF356B960
	Offset: 0x2AE0
	Size: 0x124
	Parameters: 1
	Flags: None
*/
function function_1f93e91f(params)
{
	if(isdefined(params.vehicletype))
	{
		droppoint = params.droppoint;
		offset = vectorscale((0, 0, 1), 10000);
		trace = groundtrace(params.droppoint + offset, params.droppoint - offset, 0, undefined, 0);
		if(isdefined(trace[#"position"]))
		{
			droppoint = trace[#"position"];
		}
		globallogic_audio::function_61e17de0("fireteamVehDrop", getplayers(undefined, droppoint, 6000));
	}
	else
	{
		globallogic_audio::function_61e17de0("fireteamSupplyDrop", getplayers());
	}
}

/*
	Name: on_player_killed
	Namespace: namespace_2938acdc
	Checksum: 0xEAFA9AED
	Offset: 0x2C10
	Size: 0x18C
	Parameters: 1
	Flags: None
*/
function on_player_killed(params)
{
	aliveplayers = function_a1cff525(self.squad);
	var_7a53de16 = function_c65231e2(self.squad);
	if(aliveplayers.size == 0 && var_7a53de16.size > 1)
	{
		if(params.eattacker util::isenemyplayer(self))
		{
			params.eattacker globallogic_audio::leader_dialog_on_player("fireteamSquadWiped");
		}
		else
		{
			globallogic_audio::function_61e17de0("fireteamSquadWipedFriendly", var_7a53de16);
		}
	}
	else if(aliveplayers.size == 1)
	{
		if(!isdefined(level.var_e2384c19) && !aliveplayers[0] laststand::player_is_in_laststand())
		{
			aliveplayers[0] globallogic_audio::leader_dialog_on_player("fireteamSquadLastAlive", undefined, undefined, undefined, undefined, undefined, undefined, 1);
		}
	}
	if(aliveplayers.size == 0 && level.spawnsystem.var_c2cc011f === 1)
	{
		globallogic_audio::function_61e17de0("fireteamSquadEliminated", var_7a53de16);
	}
}

/*
	Name: function_a4740127
	Namespace: namespace_2938acdc
	Checksum: 0xDFE0F707
	Offset: 0x2DA8
	Size: 0x1C8
	Parameters: 0
	Flags: None
*/
function function_a4740127()
{
	if(!level flag::get(#"hash_60fcdd11812a0134"))
	{
		return;
	}
	if(level.players.size == function_a1ef346b().size)
	{
		return;
	}
	foreach(player in level.players)
	{
		aliveplayers = function_a1cff525(player.squad);
		var_7a53de16 = function_c65231e2(player.squad);
		if(aliveplayers.size == var_7a53de16.size)
		{
			player globallogic_audio::leader_dialog_on_player("fireteamEnemyRedeploy");
			continue;
		}
		if(aliveplayers.size == 1 && aliveplayers[0] == player)
		{
			player globallogic_audio::leader_dialog_on_player("fireteamSquadRedeploy");
			continue;
		}
		if(aliveplayers.size > 0 || !level.spawnsystem.var_c2cc011f === 1)
		{
			player globallogic_audio::leader_dialog_on_player("fireteamGeneralRedeploy");
		}
	}
}

/*
	Name: function_407d343f
	Namespace: namespace_2938acdc
	Checksum: 0x801A08DE
	Offset: 0x2F78
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_407d343f()
{
	self loadout::give_talents(0);
	self loadout::give_perks();
}

