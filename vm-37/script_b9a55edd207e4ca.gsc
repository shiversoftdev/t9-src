#using script_1c65dbfc2f1c8d8f;
#using script_1cc417743d7c262d;
#using script_335d0650ed05d36d;
#using script_44b0b8420eabacad;
#using script_5209c07c35771d12;
#using script_5495f0bb06045dc7;
#using script_5dc7697466e79178;
#using script_65d4fc42e5e94766;
#using script_68d2ee1489345a1d;
#using script_69514c4c056c768;
#using script_6c8abe14025b47c4;
#using script_75da5547b1822294;
#using script_788472602edbe3b9;
#using script_d9b5c8b1ad38ef5;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\loadout_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\mp_common\callbacks.gsc;
#using scripts\mp_common\laststand.gsc;
#using scripts\wz_common\hud.gsc;

#namespace namespace_2938acdc;

/*
	Name: init
	Namespace: namespace_2938acdc
	Checksum: 0x2668F831
	Offset: 0x2F0
	Size: 0x264
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
		level.givecustomloadout = &function_511245ae;
	}
	spawning::function_32b97d1b(&spawning::function_90dee50d);
	spawning::function_adbbb58a(&spawning::function_c24e290c);
	callback::on_start_gametype(&function_3b948dcf);
	callback::function_c11071a8(&function_c11071a8);
	callback::on_vehicle_spawned(&on_vehicle_spawned);
	callback::add_callback(#"hash_740a58650e79dbfd", &function_c3623479);
	callback::add_callback(#"hash_40cd438036ae13df", &function_1f93e91f);
	callback::on_player_killed(&on_player_killed);
	level.var_61d4f517 = getgametypesetting(#"hash_3513cf8b4287cdd7");
	level.var_5c49de55 = getgametypesetting(#"hash_6eef7868c4f5ddbc");
	if(is_true(level.var_5c49de55))
	{
		clientfield::function_a8bbc967("squad_wipe_tokens.count", 1, 4, "int");
		callback::on_connect(&on_player_connect);
	}
}

/*
	Name: on_player_connect
	Namespace: namespace_2938acdc
	Checksum: 0x7C8BCB98
	Offset: 0x560
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
	Checksum: 0x2F707198
	Offset: 0x5D0
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
	forcespawn = !player namespace_674e6435::function_c0ec19cd();
	if(forcespawn)
	{
		level.var_5f536694[player.squad] = gettime();
	}
	return forcespawn;
}

/*
	Name: function_e1ca24fe
	Namespace: namespace_2938acdc
	Checksum: 0x68AA1F69
	Offset: 0x680
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
	Checksum: 0x9319A63F
	Offset: 0x6B0
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
		if(isdefined(player.var_b936d86b))
		{
			if(isdefined(player.var_b936d86b.origin))
			{
				player setorigin(player.var_b936d86b.origin);
			}
			if(isdefined(player.var_b936d86b.angles))
			{
				player setplayerangles(player.var_b936d86b.angles);
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
	Checksum: 0x42893F4C
	Offset: 0xA10
	Size: 0x344
	Parameters: 5
	Flags: None
*/
function function_38b14e59(players, fadeouttime, var_8e0c0121, fadeintime, rumble)
{
	if(isdefined(lui::function_e810a527("FullScreenBlack")))
	{
		lui_menu = lui::function_e810a527("FullScreenBlack");
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
			[[ lui_menu ]]->function_9cd54463(player, 0);
			[[ lui_menu ]]->function_331f9dd(player, 1);
			[[ lui_menu ]]->function_237ff433(player, int(fadeouttime * 1000));
		}
	}
	wait(fadeouttime + var_8e0c0121);
	players = function_e1ca24fe(players);
	foreach(player in players)
	{
		player thread namespace_b376ff3f::function_56a681fb();
		if(rumble)
		{
			player function_bc82f900(#"hash_4b19c1d08875f55c");
		}
		if(![[ lui_menu ]]->function_7bfd10e6(player))
		{
			[[ lui_menu ]]->open(player);
		}
		[[ lui_menu ]]->function_9cd54463(player, 1);
		[[ lui_menu ]]->function_331f9dd(player, 0);
		[[ lui_menu ]]->function_237ff433(player, int(fadeintime * 1000));
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
	Checksum: 0x5921A8E6
	Offset: 0xD60
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
	Checksum: 0xAC96DDF6
	Offset: 0xE18
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
	Checksum: 0x6447CEF6
	Offset: 0x1110
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
	Checksum: 0x3EAB7FCC
	Offset: 0x11B8
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_28e27688()
{
	location::function_18dac968((-2800, -17300, 1370), 0, 0, 10000);
}

/*
	Name: function_511245ae
	Namespace: namespace_2938acdc
	Checksum: 0x865E6DF0
	Offset: 0x11F0
	Size: 0x340
	Parameters: 1
	Flags: None
*/
function function_511245ae(takeoldweapon)
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
	var_43d69af6 = getweapon(#"null_offhand_primary");
	self giveweapon(var_43d69af6);
	self setweaponammoclip(var_43d69af6, 0);
	self switchtooffhand(var_43d69af6);
	if(self.firstspawn !== 0)
	{
		hud::function_2f66bc37();
	}
	var_2b15e2fe = getweapon(#"gadget_health_regen");
	self giveweapon(var_2b15e2fe);
	self setweaponammoclip(var_2b15e2fe, 0);
	self switchtooffhand(var_2b15e2fe);
	level.var_ef61b4b5 = var_2b15e2fe;
	var_fb6490c8 = self gadgetgetslot(var_2b15e2fe);
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
	Checksum: 0xD1EEEA8
	Offset: 0x1538
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
	namespace_b376ff3f::function_56a681fb(0);
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
	function_51dceab7(var_67fe8973);
	actionslot3 = (getdvarint(#"hash_449fa75f87a4b5b4", 0) > 0 ? "ping_callouts" : "flourish_callouts");
	self setactionslot(3, actionslot3);
	actionslot4 = (getdvarint(#"hash_23270ec9008cb656", 0) > 0 ? "sprays_boasts" : "scorestreak_wheel");
	self setactionslot(4, actionslot4);
}

/*
	Name: function_51dceab7
	Namespace: namespace_2938acdc
	Checksum: 0x38036445
	Offset: 0x17C0
	Size: 0x4D4
	Parameters: 1
	Flags: None
*/
function function_51dceab7(var_67fe8973)
{
	self loadout::function_8881abec();
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
	Checksum: 0x2CADBD27
	Offset: 0x1CA0
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_6541c917()
{
	namespace_441c2f1c::give_weapon(#"hash_5cc9b5e23093ac03");
	namespace_441c2f1c::give_weapon(#"hash_6a992c957fb327bb", array(#"hash_559f58d5af0b432d"));
	namespace_441c2f1c::function_52df229a(#"hash_53a2516ec1d3a096");
	namespace_441c2f1c::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_ae5cdb4c
	Namespace: namespace_2938acdc
	Checksum: 0x2C8878A6
	Offset: 0x1D50
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_ae5cdb4c()
{
	namespace_441c2f1c::give_weapon(#"hash_5cc9b5e23093ac03");
	namespace_441c2f1c::give_weapon(#"hash_6c6c011df03c8f18", array(#"hash_19c5c6ca805715e5"));
	namespace_441c2f1c::function_52df229a(#"hash_53a2516ec1d3a096");
	namespace_441c2f1c::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_a0a43fdb
	Namespace: namespace_2938acdc
	Checksum: 0xCD214CEB
	Offset: 0x1E00
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_a0a43fdb()
{
	namespace_441c2f1c::give_weapon(#"hash_5cc9b5e23093ac03");
	namespace_441c2f1c::give_weapon(#"hash_36978e3a9321b430", array(#"hash_19c5c6ca805715e5"));
	namespace_441c2f1c::function_52df229a(#"hash_53a2516ec1d3a096");
	namespace_441c2f1c::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_343266f9
	Namespace: namespace_2938acdc
	Checksum: 0x90A87F55
	Offset: 0x1EB0
	Size: 0x84
	Parameters: 0
	Flags: None
*/
function function_343266f9()
{
	namespace_441c2f1c::give_weapon(#"hash_5cc9b5e23093ac03");
	namespace_441c2f1c::give_weapon(#"hash_938a51cfa9e21fe");
	namespace_441c2f1c::function_52df229a(#"hash_53a2516ec1d3a096");
	namespace_441c2f1c::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: function_2e725b79
	Namespace: namespace_2938acdc
	Checksum: 0x6A7B08F5
	Offset: 0x1F40
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_2e725b79()
{
	namespace_441c2f1c::give_weapon(#"hash_5cc9b5e23093ac03");
	namespace_441c2f1c::give_weapon(#"hash_75ed0988ff325bea", array(#"hash_18e6f0326e75bce4"));
	namespace_441c2f1c::function_52df229a(#"hash_53a2516ec1d3a096");
	namespace_441c2f1c::function_52df229a(#"hash_1e9bf9999d767989");
}

/*
	Name: give_max_ammo
	Namespace: namespace_2938acdc
	Checksum: 0x4A0F4C87
	Offset: 0x1FF0
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function give_max_ammo()
{
	namespace_441c2f1c::function_52df229a(#"hash_837a6ea0c2864a8", 4);
	namespace_441c2f1c::function_52df229a(#"hash_54f3f08c1d7d45d3", 4);
	namespace_441c2f1c::function_52df229a(#"hash_1cdb9172a79b9080", 4);
	namespace_441c2f1c::function_52df229a(#"hash_4ab594460fa1627b", 4);
	namespace_441c2f1c::function_52df229a(#"hash_f9e29721ba5715e", 4);
	namespace_441c2f1c::function_52df229a(#"hash_75bef4d329c1080b", 4);
}

/*
	Name: function_cb5befb2
	Namespace: namespace_2938acdc
	Checksum: 0x93624AAF
	Offset: 0x20F0
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
	Checksum: 0x1AF78F89
	Offset: 0x2258
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
	Checksum: 0xE06DF8F8
	Offset: 0x2438
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
			vehicles[vehicles.size] = #"hash_46d0326fb76bfd27";
			vehicles[vehicles.size] = #"hash_46d0326fb76bfd27";
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
	Checksum: 0x815FFC7C
	Offset: 0x2620
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
	Checksum: 0x160A0DA7
	Offset: 0x2698
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
		case "hash_46d0326fb76bfd27":
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
	Checksum: 0x46645911
	Offset: 0x2858
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
	Checksum: 0x3F4A1705
	Offset: 0x2948
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
	Checksum: 0xB1B623AC
	Offset: 0x29A8
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
	Checksum: 0xE29D5637
	Offset: 0x2AD8
	Size: 0x114
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
	}
	else if(aliveplayers.size == 1)
	{
		if(!isdefined(level.var_e2384c19) && !aliveplayers[0] laststand::player_is_in_laststand())
		{
			aliveplayers[0] globallogic_audio::leader_dialog_on_player("fireteamSquadLastAlive");
		}
	}
}

