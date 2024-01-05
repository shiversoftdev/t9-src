#using script_1ee011cd0961afd7;
#using script_1ce46999727f2f2b;
#using script_1a9763988299e68d;
#using script_774302f762d76254;
#using script_164a456ce05c3483;
#using script_5f20d3b434d24884;
#using script_791c11dd176d5dfa;
#using script_3dafaf0497ea14b8;
#using scripts\wz_common\spawn.gsc;
#using scripts\wz_common\hud.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\core_common\item_inventory.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\callbacks.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_335d0650ed05d36d;

#namespace brawl;

/*
	Name: main
	Namespace: brawl
	Checksum: 0xA6FC69AB
	Offset: 0x498
	Size: 0x2AC
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	hud::function_9b9cecdf();
	spawning::addsupportedspawnpointtype("tdm");
	util::registerscorelimit(0, 50000);
	level thread namespace_4dae815d::init();
	level thread function_3a2701da();
	callback::on_player_damage(&function_c602a32f);
	callback::on_player_killed(&on_player_killed);
	callback::on_connect(&on_player_connect);
	player::function_cf3aa03d(&function_4a486d96);
	level.onspawnplayer = &on_spawn_player;
	level.var_ec5aa760 = &function_3845d621;
	level.var_cee39136 = &function_fcc90081;
	level.killcammode = 0;
	level.allowspecialistdialog = 0;
	level.var_e1857dc3 = 1;
	level.var_52a59317 = 1;
	level.var_7dcdbe16 = 1;
	level.draftstage = 1;
	level.var_4ed7ab1b = 1;
	level.var_369305cf = 1;
	level.var_29628b5f = 1;
	level.var_b08350e5 = 1;
	level.var_fdf900b7 = 1;
	level.var_babb5873 = 1;
	level.var_4bf9ea19 = 1;
	level.var_b62ca8c = 1;
	level.doa.roundnumber = 9999;
	level.doa.var_dbdc241e = 6;
	level thread function_d23b6f1f();
	level.var_f3e25805 = &function_4497e962;
	clientfield::function_5b7d846d("Brawl.prematchCountdown", 1, 6, "int");
}

/*
	Name: on_player_connect
	Namespace: brawl
	Checksum: 0xAC571253
	Offset: 0x750
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private on_player_connect()
{
	self.var_7a491703 = 0;
	self function_8cef1872();
}

/*
	Name: function_d23b6f1f
	Namespace: brawl
	Checksum: 0x7220CC43
	Offset: 0x780
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_d23b6f1f()
{
	level waittill(#"doa_game_initialized");
	namespace_c4a0cf56::function_58862b36();
}

/*
	Name: function_83fe843d
	Namespace: brawl
	Checksum: 0x6A1931BD
	Offset: 0x7B8
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_83fe843d(player)
{
	if(self.team == #"allies")
	{
		return "red";
	}
	if(self.team == #"axis")
	{
		return "blue";
	}
	if(self.team == #"team3")
	{
		return "green";
	}
	if(self.team == #"team4")
	{
		return "yellow";
	}
	return "yellow";
}

/*
	Name: function_fcc90081
	Namespace: brawl
	Checksum: 0x87713985
	Offset: 0x878
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_fcc90081(var_45b95f80)
{
	if(!isdefined(self))
	{
		return;
	}
	self.brawl = spawnstruct();
	self.brawl.default_movespeed = 1;
	self.var_81ee2313 = 0;
	self.var_8629f497 = 0;
	self takeallweapons();
	weapon = getweapon(("dob_pistol_fullauto_t9" + "_") + self.doa.color);
	self giveweapon(weapon);
	self switchtoweaponimmediate(weapon);
	self setmovespeedscale(self.brawl.default_movespeed);
}

/*
	Name: function_3a2701da
	Namespace: brawl
	Checksum: 0xA9861806
	Offset: 0x990
	Size: 0xA64
	Parameters: 0
	Flags: Private
*/
function private function_3a2701da()
{
	if(!isdefined(level.flag) || !is_true(level.flag[#"load_main_complete"]))
	{
		level waittill(#"load_main_complete");
	}
	while(level.players.size == 0)
	{
		wait(1);
	}
	var_56fa6c18 = struct::get_array("healthspawn", "targetname");
	var_f0d8a2f8 = struct::get_array("shotgunspawn", "targetname");
	var_9952c2fa = struct::get_array("smgspawn", "targetname");
	var_e68dd42b = struct::get_array("rocketspawn", "targetname");
	var_ed731946 = struct::get_array("burstspawn", "targetname");
	var_65fd4bed = struct::get_array("lmgspawn", "targetname");
	var_b3486e42 = struct::get_array("arspawn", "targetname");
	var_ed731946 = struct::get_array("burstspawn", "targetname");
	var_abda7ed1 = struct::get_array("meleespawn", "targetname");
	var_c1ddcd19 = struct::get_array("raygunspawn", "targetname");
	var_65e86693 = struct::get_array("powerupspawn", "targetname");
	if(1)
	{
		foreach(spawn in var_56fa6c18)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d("p8_wz_supply_stash_health_lvl2", 10, spawn.origin, 30, 0, "glow_white");
		}
		foreach(spawn in var_9952c2fa)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d("dob_smg_fastfire_t9", 3, spawn.origin, 30, 0, "glow_green");
		}
		foreach(spawn in var_65fd4bed)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d("dob_lmg_t9", 4, spawn.origin, 30, 0, "glow_green");
		}
		foreach(spawn in var_b3486e42)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d("dob_ar_accurate_t9", 2, spawn.origin, 30, 0, "glow_green");
		}
		foreach(spawn in var_f0d8a2f8)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d("dob_shotgun_fullauto_t9", 7, spawn.origin, 45, 30, "glow_blue");
		}
		foreach(spawn in var_ed731946)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d("dob_ar_burst_t9", 5, spawn.origin, 45, 30, "glow_blue");
		}
		foreach(spawn in var_e68dd42b)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d("dob_launcher", 6, spawn.origin, 45, 30, "glow_blue");
		}
		foreach(spawn in var_abda7ed1)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d([1:"dob_ray_gun", 0:"dob_melee"], [1:8, 0:9], spawn.origin, [1:60, 0:60], [1:60, 0:60], "glow_yellow");
		}
		foreach(spawn in var_65e86693)
		{
			spawn thread namespace_c4a0cf56::function_acafed1d([2:"brawl_chicken", 1:"wpn_t7_uplink_ball_world", 0:"p8_wz_supply_stash_health_stim"], [2:11, 1:11, 0:11], spawn.origin, [2:30, 1:30, 0:30], [2:0, 1:0, 0:0], "glow_yellow");
		}
	}
	else
	{
		while(true)
		{
			wait(5);
			foreach(player in level.players)
			{
				if(isalive(player))
				{
					number = randomintrange(0, 2);
					weapons = [];
					weapons[weapons.size] = "zombietron_chicken";
					weapons[weapons.size] = "p7_light_round_spot";
					weapons[weapons.size] = "p8_wz_supply_stash_health_lvl2";
					weapons[weapons.size] = "p8_wz_supply_stash_health_stim";
					weapons[weapons.size] = "wpn_t7_uplink_ball_world";
					spot = player.origin + (randomintrange(-256, 256), randomintrange(-256, 256), 0);
					thread namespace_c4a0cf56::function_ea1d89ef(weapons[number], spot);
				}
			}
		}
	}
}

/*
	Name: on_player_killed
	Namespace: brawl
	Checksum: 0xBEB00689
	Offset: 0x1400
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function on_player_killed(params)
{
	if(params.smeansofdeath == "MOD_TRIGGER_HURT")
	{
		return;
	}
	params.eattacker globallogic_score::givepointstowin(100);
	currentweapon = self getcurrentweapon();
	if(currentweapon.statname != "dob_pistol_fullauto_t9" && currentweapon.statname != "dob_melee" && currentweapon.statname != "dob_ray_gun")
	{
		spawnlocation = self.origin;
		wait(1.5);
		thread namespace_c4a0cf56::function_ea1d89ef(currentweapon.statname, spawnlocation);
	}
}

/*
	Name: on_spawn_player
	Namespace: brawl
	Checksum: 0x9603A7E5
	Offset: 0x14F8
	Size: 0x1C4
	Parameters: 1
	Flags: None
*/
function on_spawn_player(predictedspawn)
{
	spawn::on_spawn_player(predictedspawn);
	self armor::set_armor(150, 150, 0, 1, 1, 1, 1, 1, 1, 1);
	self thread function_6337e931();
	self.var_2eb578bd = 1;
	self setcharacteroutfit(0);
	self setcharacterwarpaintoutfit(0);
	self function_ab96a9b5("head", 0);
	self function_ab96a9b5("headgear", 0);
	self function_ab96a9b5("arms", 0);
	self function_ab96a9b5("torso", 0);
	self function_ab96a9b5("legs", 0);
	self function_ab96a9b5("palette", 0);
	self function_ab96a9b5("warpaint", 0);
	self function_ab96a9b5("decal", 0);
}

/*
	Name: function_8cef1872
	Namespace: brawl
	Checksum: 0xB1B17AC6
	Offset: 0x16C8
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_8cef1872()
{
	if(isdefined(self.spawn_anchor))
	{
		self.spawn_anchor delete();
		self.spawn_anchor = undefined;
	}
	self clientfield::set_player_uimodel("hudItems.wzLoadFinished", 1);
	self clientfield::set_player_uimodel("hudItems.streamerLoadFraction", 1);
	self val::reset(#"hash_5bb0dd6b277fc20c", "freezecontrols");
	self val::reset(#"hash_5bb0dd6b277fc20c", "disablegadgets");
	self callback::callback(#"hash_4fca7a48128c4741");
}

/*
	Name: function_3845d621
	Namespace: brawl
	Checksum: 0x625FE3E6
	Offset: 0x17B8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_3845d621()
{
	self function_182b4148();
}

/*
	Name: function_182b4148
	Namespace: brawl
	Checksum: 0xBE6348DB
	Offset: 0x17E0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_182b4148()
{
	if(self fragbuttonpressed())
	{
		self function_21b9d944();
	}
}

/*
	Name: function_c602a32f
	Namespace: brawl
	Checksum: 0xEDC81713
	Offset: 0x1820
	Size: 0x72
	Parameters: 1
	Flags: Private
*/
function private function_c602a32f(params)
{
	self notify(#"hash_d544ee5212776b5");
	if(self isjuking())
	{
		params.idamage = 0;
	}
	if(params.smeansofdeath == "MOD_TRIGGER_HURT")
	{
		params.idamage = 50;
	}
	params.overridedamage = 1;
}

/*
	Name: function_4a486d96
	Namespace: brawl
	Checksum: 0xB961FE0D
	Offset: 0x18A0
	Size: 0xF4
	Parameters: 9
	Flags: Private
*/
function private function_4a486d96(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	psoffsettime globallogic_score::giveteamscoreforobjective(psoffsettime.team, level.teamscoreperkill);
	self globallogic_score::giveteamscoreforobjective(self.team, level.teamscoreperdeath * -1);
	if(deathanimduration != "MOD_TRIGGER_HURT" && isplayer(psoffsettime))
	{
		psoffsettime luinotifyevent(#"hash_1c521a21c54fa95b", 1, self.entnum);
	}
}

/*
	Name: function_4497e962
	Namespace: brawl
	Checksum: 0x5C20D909
	Offset: 0x19A0
	Size: 0x88
	Parameters: 0
	Flags: Private
*/
function private function_4497e962()
{
	globallogic::function_bf2901cf();
	var_55e3955a = int(level.prematchperiod);
	while(var_55e3955a >= 0)
	{
		level clientfield::set_world_uimodel("Brawl.prematchCountdown", var_55e3955a);
		var_55e3955a--;
		wait(1);
	}
	level notify(#"hash_1f2d81dc44b08b54");
}

/*
	Name: function_380c6d38
	Namespace: brawl
	Checksum: 0x20F8C5AB
	Offset: 0x1A30
	Size: 0x130
	Parameters: 0
	Flags: None
*/
function function_380c6d38()
{
	self endon(#"death", #"disconnect");
	for(;;)
	{
		wait(1);
		primary_weapons = self getweaponslistprimaries();
		offhand_weapons_and_alts = array::exclude(self getweaponslist(1), primary_weapons);
		weapons = arraycombine(primary_weapons, offhand_weapons_and_alts, 0, 0);
		arrayremovevalue(weapons, level.weaponbasemelee);
		for(i = 0; i < weapons.size; i++)
		{
			weapon = weapons[i];
			if(weapon == level.weaponnone)
			{
				continue;
			}
			self givemaxammo(weapon);
		}
	}
}

/*
	Name: function_6337e931
	Namespace: brawl
	Checksum: 0x7FFB6B18
	Offset: 0x1B68
	Size: 0x68
	Parameters: 0
	Flags: Private
*/
function private function_6337e931()
{
	self endon(#"death");
	self notify("115ef3c89e7d9605");
	self endon("115ef3c89e7d9605");
	while(true)
	{
		self waittill(#"hash_d544ee5212776b5");
		self thread function_7568658();
	}
}

/*
	Name: function_7568658
	Namespace: brawl
	Checksum: 0x3A34DA77
	Offset: 0x1BD8
	Size: 0xF8
	Parameters: 0
	Flags: Private
*/
function private function_7568658()
{
	if(!isalive(self))
	{
		return;
	}
	self notify("9317eae1958ca6b");
	self endon("9317eae1958ca6b");
	self endon(#"death");
	wait(4);
	var_586e4407 = int((self.maxarmor / 2.5) * 0.05);
	while(self.armor < self.maxarmor)
	{
		self.armor = self.armor + var_586e4407;
		self.armor = (self.armor < self.maxarmor ? self.armor : self.maxarmor);
		wait(0.05);
	}
}

