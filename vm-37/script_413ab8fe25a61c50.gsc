#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2440f86f9cd325ac;
#using script_2a5bf5b4a00cee0d;
#using script_3faf478d5b0850fe;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5701633066d199f2;
#using script_5f20d3b434d24884;
#using script_68cdf0ca5df5e;
#using script_74a56359b7d02ab6;
#using script_f38dc50f0e82277;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_77eccc4f;

/*
	Name: function_93e7ee52
	Namespace: namespace_77eccc4f
	Checksum: 0xBB3E5751
	Offset: 0x300
	Size: 0xA08
	Parameters: 2
	Flags: Linked
*/
function function_93e7ee52(challengetype, name)
{
	if(!isdefined(challengetype))
	{
		challengetype = 0;
	}
	level.doa.var_e5ef2ab4 = level.doa.var_e5ef2ab4 | (1 << challengetype);
	level.doa.var_a598a835 = undefined;
	level.doa.var_a77e4601 = [];
	level flag::clear("challenge_round_spawnOverride");
	timestart = gettime();
	namespace_1e25ad94::debugmsg((((("Challenge (" + name) + ") starting at: ") + timestart) + " RoundNumber: ") + level.doa.roundnumber);
	waitframe(1);
	var_af104f33 = function_fa798421(name);
	level namespace_a6ddb172::function_7a0e5387(var_af104f33);
	switch(challengetype)
	{
		case 1:
		{
			level thread namespace_9fc66ac::announce(62);
			def = doa_enemy::function_251ee3bd("barreler_zombie");
			[[ def ]]->function_7edd7727(6);
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			def = doa_enemy::function_251ee3bd("basic_zombie");
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			break;
		}
		case 2:
		{
			level thread namespace_9fc66ac::announce(62);
			level thread function_d1dc367c();
			def = doa_enemy::function_251ee3bd("riser_zombie");
			break;
		}
		case 3:
		{
			level thread namespace_9fc66ac::announce(62);
			level thread function_97aae609();
			def = doa_enemy::function_251ee3bd("smoke_zombie");
			[[ def ]]->function_7edd7727(6);
			break;
		}
		case 4:
		{
			level thread namespace_9fc66ac::announce(62);
			def = doa_enemy::function_251ee3bd("gladiator_destroyer");
			[[ def ]]->function_7edd7727(6);
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			def = doa_enemy::function_251ee3bd("gladiator_marauder");
			[[ def ]]->function_7edd7727(6);
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			def = doa_enemy::function_251ee3bd("basic_zombie");
			for(count = 6; count; count--)
			{
				level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			}
			break;
		}
		case 5:
		{
			level thread namespace_9fc66ac::announce(62);
			def = doa_enemy::function_251ee3bd("ghost_zombie");
			[[ def ]]->function_7edd7727(6);
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			break;
		}
		case 6:
		{
			level thread namespace_9fc66ac::announce(63);
			level thread function_17f47e92();
			break;
		}
		case 7:
		{
			level thread namespace_9fc66ac::announce(62);
			level thread function_9f6da3ff();
			break;
		}
		case 8:
		{
			level thread function_cd4e6a10();
			break;
		}
		case 9:
		{
			level thread namespace_9fc66ac::announce(62);
			def = doa_enemy::function_251ee3bd("pole_zombie");
			for(count = getplayers().size; count; count--)
			{
				level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			}
			[[ def ]]->function_7edd7727(6);
			def = doa_enemy::function_251ee3bd("basic_zombie");
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			level.doa.var_a77e4601[level.doa.var_a77e4601.size] = def;
			break;
		}
		case 10:
		{
			level thread namespace_9fc66ac::announce(63);
			level thread function_382bc607();
			break;
		}
		case 11:
		{
			level thread namespace_9fc66ac::announce(62);
			level thread function_bd313167();
			break;
		}
		case 12:
		{
			level thread namespace_9fc66ac::announce(63);
			level thread function_c6834d32();
			break;
		}
	}
	var_69d36e5e = struct::get_array(name + "_challenge_loot", "targetname");
	foreach(loot in var_69d36e5e)
	{
		if(isdefined(loot.script_noteworthy))
		{
			items = strtok(loot.script_noteworthy, ";");
			item = items[randomint(items.size)];
			def = doa_pickups::function_6265bde4(item);
			if(isdefined(def))
			{
				pickup = level doa_pickups::function_d080f0db(def, loot.origin, undefined, undefined, 1);
				if(isdefined(pickup))
				{
					pickup.origin = loot.origin;
					pickup notify(#"hash_2a866f50cc161ca8");
					if(isdefined(pickup.glowfx) && pickup.glowfx !== "glow_yellow")
					{
						util::wait_network_frame();
						pickup namespace_83eb6304::turnofffx(pickup.glowfx);
						pickup namespace_83eb6304::function_3ecfde67("glow_yellow");
					}
				}
			}
		}
	}
	level notify(#"hash_145c9457d2598ba");
}

/*
	Name: init
	Namespace: namespace_77eccc4f
	Checksum: 0x89801B2B
	Offset: 0xD10
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level flag::init("challenge_round_spawnOverride", 0);
	main();
}

/*
	Name: main
	Namespace: namespace_77eccc4f
	Checksum: 0x93A62F3
	Offset: 0xD50
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_e5ef2ab4 = 0;
	level.doa.var_a77e4601 = [];
	level.doa.var_a598a835 = undefined;
	level flag::clear("challenge_round_spawnOverride");
}

/*
	Name: function_1a010742
	Namespace: namespace_77eccc4f
	Checksum: 0xCE6DA05
	Offset: 0xDB0
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_1a010742(name)
{
	switch(name)
	{
		case "jungle":
		{
			return 4;
		}
		case "cartel":
		{
			return 1;
		}
		case "graveyard":
		{
			return 2;
		}
		case "temple":
		{
			return 3;
		}
		case "watertemple":
		{
			return 5;
		}
		case "icecave":
		{
			return 6;
		}
		case "bloodlake":
		{
			return 7;
		}
		case "witchwood":
		{
			return 8;
		}
		case "wintercave":
		{
			return 9;
		}
		case "geothermal":
		{
			return 10;
		}
		case "alpine":
		{
			return 11;
		}
		case "boss":
		{
			return 12;
		}
	}
	return 0;
}

/*
	Name: function_fa798421
	Namespace: namespace_77eccc4f
	Checksum: 0x16CE893C
	Offset: 0xEE8
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_fa798421(name)
{
	switch(name)
	{
		case "jungle":
		{
			return 30;
		}
		case "cartel":
		{
			return 40;
		}
		case "graveyard":
		{
			return 28;
		}
		case "temple":
		{
			return 29;
		}
		case "watertemple":
		{
			return 31;
		}
		case "icecave":
		{
			return 32;
		}
		case "bloodlake":
		{
			return 33;
		}
		case "witchwood":
		{
			return 34;
		}
		case "wintercave":
		{
			return 36;
		}
		case "geothermal":
		{
			return 37;
		}
		case "alpine":
		{
			return 38;
		}
		case "boss":
		{
			if(level.doa.var_6c58d51 == 0)
			{
				return 39;
			}
			else
			{
				return 41;
			}
		}
	}
	return undefined;
}

/*
	Name: function_379191c
	Namespace: namespace_77eccc4f
	Checksum: 0xCC62F769
	Offset: 0x1040
	Size: 0x88
	Parameters: 1
	Flags: Linked
*/
function function_379191c(name)
{
	level.doa.var_a77e4601 = [];
	challenge = function_1a010742(name);
	if(challenge == 0)
	{
		return false;
	}
	if(function_d53627e4(challenge))
	{
		return false;
	}
	level thread function_93e7ee52(challenge, name);
	return true;
}

/*
	Name: function_d53627e4
	Namespace: namespace_77eccc4f
	Checksum: 0xB789A100
	Offset: 0x10D0
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_d53627e4(type)
{
	return level.doa.var_e5ef2ab4 & (1 << type);
}

/*
	Name: function_d1dc367c
	Namespace: namespace_77eccc4f
	Checksum: 0xDA51DC37
	Offset: 0x1108
	Size: 0x324
	Parameters: 0
	Flags: Linked
*/
function function_d1dc367c()
{
	level endon(#"arena_completed");
	level endon(#"game_over");
	level flag::set("challenge_round_spawnOverride");
	var_a1c7d06b = doa_enemy::function_251ee3bd("riser_zombie");
	origin = [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1();
	level.doa.var_ccbf8c33 = [[ level.doa.var_39e3fa99 ]]->function_3476ff6d();
	level.doa.var_2020337e = 0;
	level.doa.var_a598a835 = &function_6876f78c;
	wait(5);
	waves = 5 + (4 * level.doa.var_6c58d51);
	var_87b290c9 = level.doa.var_ccbf8c33.size;
	level.doa.var_13e8f9c9 = "walk";
	players = namespace_7f5aeb59::function_23e1f90f();
	var_58bd90cd = 2;
	while(waves)
	{
		for(numai = var_87b290c9; numai > 0; numai--)
		{
			doa_enemy::function_a6b807ea(var_a1c7d06b, 1, origin, 0, undefined, players[0], undefined, level.doa.var_39e3fa99, undefined, undefined, -1);
		}
		while(level.doa.var_dcbded2.size || namespace_ec06fe4a::function_9788bacc() > 5)
		{
			wait(1);
		}
		waves--;
		var_58bd90cd--;
		if(var_58bd90cd <= 0)
		{
			var_58bd90cd = 2;
			var_87b290c9 = var_87b290c9 - 8;
			if(var_87b290c9 < 20)
			{
				var_87b290c9 = 20;
			}
			level.doa.var_13e8f9c9 = namespace_250e9486::function_bb0817aa(level.doa.var_13e8f9c9);
		}
	}
	[[ level.doa.var_39e3fa99 ]]->function_4aca7529(0);
	level.doa.var_ccbf8c33 = undefined;
	level.doa.var_2020337e = undefined;
	level.doa.var_a598a835 = undefined;
	level.doa.var_13e8f9c9 = undefined;
	level flag::clear("challenge_round_spawnOverride");
}

/*
	Name: function_97aae609
	Namespace: namespace_77eccc4f
	Checksum: 0xBFBD5228
	Offset: 0x1438
	Size: 0x234
	Parameters: 0
	Flags: Linked
*/
function function_97aae609()
{
	level endon(#"arena_completed");
	level endon(#"game_over");
	level flag::set("challenge_round_spawnOverride");
	var_94f3b914 = doa_enemy::function_251ee3bd("smoke_zombie");
	[[ var_94f3b914 ]]->function_7edd7727(6);
	origin = [[ level.doa.var_39e3fa99 ]]->getcenter();
	struct = struct::get(([[ level.doa.var_39e3fa99 ]]->getname()) + "_challenge", "targetname");
	level.doa.var_6d072a34 = (isdefined(struct) ? struct : origin);
	level.doa.var_a598a835 = &function_29ff6b1;
	wait(5);
	for(waves = 3 + (3 * level.doa.var_6c58d51); waves; waves--)
	{
		function_d1603826(var_94f3b914);
		[[ level.doa.var_39e3fa99 ]]->function_4aca7529(0);
		wait(20);
		[[ level.doa.var_39e3fa99 ]]->function_4aca7529(1);
		while(namespace_ec06fe4a::function_9788bacc() > 5)
		{
			wait(1);
		}
	}
	[[ level.doa.var_39e3fa99 ]]->function_4aca7529(0);
	level flag::clear("challenge_round_spawnOverride");
}

/*
	Name: function_d1603826
	Namespace: namespace_77eccc4f
	Checksum: 0x490A33C
	Offset: 0x1678
	Size: 0x6C
	Parameters: 2
	Flags: Linked
*/
function function_d1603826(var_94f3b914, qty)
{
	if(!isdefined(qty))
	{
		qty = 15;
	}
	doa_enemy::function_a6b807ea(var_94f3b914, qty, level.doa.var_6d072a34.origin, 0, undefined, undefined, undefined, level.doa.var_39e3fa99);
}

/*
	Name: function_6876f78c
	Namespace: namespace_77eccc4f
	Checksum: 0x557B1F8D
	Offset: 0x16F0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_6876f78c()
{
	spot = level.doa.var_2020337e;
	level.doa.var_2020337e++;
	if(level.doa.var_2020337e > level.doa.var_ccbf8c33.size)
	{
		level.doa.var_2020337e = 0;
	}
	return level.doa.var_ccbf8c33[spot];
}

/*
	Name: function_29ff6b1
	Namespace: namespace_77eccc4f
	Checksum: 0x73B51BCB
	Offset: 0x1780
	Size: 0x16
	Parameters: 0
	Flags: Linked
*/
function function_29ff6b1()
{
	return level.doa.var_6d072a34;
}

/*
	Name: function_17f47e92
	Namespace: namespace_77eccc4f
	Checksum: 0x7DB7DD06
	Offset: 0x17A0
	Size: 0x2AC
	Parameters: 0
	Flags: Linked
*/
function function_17f47e92()
{
	maxai = [[ level.doa.var_39e3fa99 ]]->function_c892290a();
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(16 + (8 * getplayers().size));
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = level.doa.var_65a70dc;
	def = doa_enemy::function_251ee3bd("crawler_zombie");
	[[ def ]]->function_7edd7727(6);
	level.doa.var_6d072a34 = struct::get(([[ level.doa.var_39e3fa99 ]]->getname()) + "_challenge", "targetname");
	if(!isdefined(level.doa.var_d15a522))
	{
		level.doa.var_d15a522 = doa_enemy::function_d7c5adee("blight_father");
	}
	var_f8ff628e = doa_enemy::function_db55a448(level.doa.var_d15a522, level.doa.var_6d072a34.origin);
	/#
		if(is_true(level.var_a095060b))
		{
			var_f8ff628e thread namespace_ec06fe4a::function_3b3bb5c(0.1, 100);
		}
	#/
	if(isdefined(var_f8ff628e))
	{
		var_f8ff628e waittill(#"death");
	}
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(maxai);
}

/*
	Name: function_201a7d58
	Namespace: namespace_77eccc4f
	Checksum: 0x7C6E7FD8
	Offset: 0x1A58
	Size: 0x11E
	Parameters: 0
	Flags: Linked
*/
function function_201a7d58()
{
	spawnloc = spawnstruct();
	if(randomint(100) < 60)
	{
		spawnloc.origin = ([[ level.doa.var_39e3fa99 ]]->function_70fb5745().origin) + vectorscale((0, 0, 1), 1600);
		spawnloc.angles = [[ level.doa.var_39e3fa99 ]]->function_70fb5745().angles;
	}
	else
	{
		player = getplayers()[randomint(getplayers().size)];
		spawnloc.origin = player.origin + vectorscale((0, 0, 1), 1600);
		spawnloc.angles = player.angles;
	}
	return spawnloc;
}

/*
	Name: function_9f6da3ff
	Namespace: namespace_77eccc4f
	Checksum: 0x8B42D4E7
	Offset: 0x1B80
	Size: 0x1A6
	Parameters: 0
	Flags: Linked
*/
function function_9f6da3ff()
{
	level endon(#"game_over");
	level flag::set("challenge_round_spawnOverride");
	var_94f3b914 = doa_enemy::function_251ee3bd("meatball_large");
	[[ var_94f3b914 ]]->function_7edd7727(6);
	wait(5);
	origin = [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1();
	waves = 4 + getplayers().size;
	level.doa.var_a598a835 = &function_201a7d58;
	while(waves)
	{
		if(level flag::get("doa_round_over"))
		{
			break;
		}
		doa_enemy::function_a6b807ea(var_94f3b914, 6, origin, 0, undefined, undefined, undefined, level.doa.var_39e3fa99);
		result = undefined;
		result = level waittilltimeout(30, #"doa_round_over");
		waves--;
	}
	level flag::clear("challenge_round_spawnOverride");
	level.doa.var_a598a835 = undefined;
}

/*
	Name: function_cd4e6a10
	Namespace: namespace_77eccc4f
	Checksum: 0xA338B651
	Offset: 0x1D30
	Size: 0x51C
	Parameters: 0
	Flags: Linked
*/
function function_cd4e6a10()
{
	level endon(#"arena_completed");
	level endon(#"game_over");
	maxai = [[ level.doa.var_39e3fa99 ]]->function_c892290a();
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(24);
	var_94f3b914 = doa_enemy::function_251ee3bd("wolf_ghosthound");
	[[ var_94f3b914 ]]->function_7edd7727(6);
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = var_94f3b914;
	var_94f3b914 = doa_enemy::function_251ee3bd("riser_zombie");
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = var_94f3b914;
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = var_94f3b914;
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = level.doa.var_65a70dc;
	level waittill(#"hash_c57f3f18a005e45");
	origin = [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1();
	if(!isdefined(level.doa.var_ce4f409c))
	{
		level.doa.var_ce4f409c = doa_enemy::function_d7c5adee("werewolf");
	}
	var_f8ff628e = doa_enemy::function_db55a448(level.doa.var_ce4f409c, origin);
	if(isdefined(var_f8ff628e))
	{
		level namespace_a6ddb172::function_7a0e5387(35);
		level thread namespace_9fc66ac::announce(63);
		/#
			if(is_true(level.var_a095060b))
			{
				var_f8ff628e thread namespace_ec06fe4a::function_3b3bb5c(0.1, 1500);
			}
		#/
		var_f8ff628e waittill(#"death");
	}
	namespace_8c04284b::function_c8462f96();
	level thread namespace_ec06fe4a::function_de70888a();
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(maxai);
}

/*
	Name: function_bd313167
	Namespace: namespace_77eccc4f
	Checksum: 0x180EE7ED
	Offset: 0x2258
	Size: 0x3C0
	Parameters: 0
	Flags: Linked
*/
function function_bd313167()
{
	level endon(#"arena_completed");
	level endon(#"game_over");
	maxai = [[ level.doa.var_39e3fa99 ]]->function_c892290a();
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(28);
	var_94f3b914 = doa_enemy::function_251ee3bd("brutus");
	[[ var_94f3b914 ]]->function_7edd7727(6);
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = var_94f3b914;
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = level.doa.var_65a70dc;
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = level.doa.var_65a70dc;
	if(!isdefined(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = [];
	}
	else if(!isarray(level.doa.var_a77e4601))
	{
		level.doa.var_a77e4601 = array(level.doa.var_a77e4601);
	}
	level.doa.var_a77e4601[level.doa.var_a77e4601.size] = level.doa.var_65a70dc;
	[[ level.doa.var_39e3fa99 ]]->function_6d5262dc(maxai);
}

/*
	Name: function_c6834d32
	Namespace: namespace_77eccc4f
	Checksum: 0xC0C525CF
	Offset: 0x2620
	Size: 0x3F0
	Parameters: 0
	Flags: Linked
*/
function function_c6834d32()
{
	origin = [[ level.doa.var_39e3fa99 ]]->getcenter();
	struct = struct::get(([[ level.doa.var_39e3fa99 ]]->getname()) + "_challenge", "targetname");
	level.doa.var_6d072a34 = (isdefined(struct) ? struct : origin);
	if(!isdefined(level.doa.var_b52c4a7b))
	{
		level.doa.var_b52c4a7b = doa_enemy::function_d7c5adee("margwa");
	}
	var_f89c12f1 = [];
	if(!isdefined(var_f89c12f1))
	{
		var_f89c12f1 = [];
	}
	else if(!isarray(var_f89c12f1))
	{
		var_f89c12f1 = array(var_f89c12f1);
	}
	var_f89c12f1[var_f89c12f1.size] = doa_enemy::function_db55a448(level.doa.var_b52c4a7b, level.doa.var_6d072a34.origin);
	var_58d08b46 = math::clamp(level.doa.var_6c58d51, 0, 4);
	if(var_58d08b46 > 0)
	{
		if(!isdefined(level.doa.var_de4248da))
		{
			level.doa.var_de4248da = array(doa_enemy::function_d7c5adee("margwa"), doa_enemy::function_d7c5adee("skeleton_giant"), doa_enemy::function_d7c5adee("werewolf"), doa_enemy::function_d7c5adee("gegenees"));
		}
		while(var_58d08b46)
		{
			if(!isdefined(var_f89c12f1))
			{
				var_f89c12f1 = [];
			}
			else if(!isarray(var_f89c12f1))
			{
				var_f89c12f1 = array(var_f89c12f1);
			}
			var_f89c12f1[var_f89c12f1.size] = doa_enemy::function_db55a448(level.doa.var_de4248da[randomint(level.doa.var_de4248da.size)], [[ level.doa.var_39e3fa99 ]]->function_70fb5745().origin);
			var_58d08b46--;
		}
	}
	/#
		foreach(boss in var_f89c12f1)
		{
			if(is_true(level.var_a095060b))
			{
				boss thread namespace_ec06fe4a::function_3b3bb5c(0.1, 100);
			}
		}
	#/
	while(true)
	{
		function_1eaaceab(var_f89c12f1);
		if(var_f89c12f1.size == 0)
		{
			break;
		}
		wait(2);
	}
}

/*
	Name: function_382bc607
	Namespace: namespace_77eccc4f
	Checksum: 0x1E246F61
	Offset: 0x2A18
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function function_382bc607()
{
	origin = [[ level.doa.var_39e3fa99 ]]->getcenter();
	struct = struct::get(([[ level.doa.var_39e3fa99 ]]->getname()) + "_challenge", "targetname");
	level.doa.var_6d072a34 = (isdefined(struct) ? struct : origin);
	if(!isdefined(level.doa.var_59bbfb44))
	{
		level.doa.var_59bbfb44 = doa_enemy::function_d7c5adee("gegenees");
	}
	var_f8ff628e = doa_enemy::function_db55a448(level.doa.var_59bbfb44, level.doa.var_6d072a34.origin);
	if(isdefined(var_f8ff628e))
	{
		/#
			if(is_true(level.var_a095060b))
			{
				var_f8ff628e thread namespace_ec06fe4a::function_3b3bb5c(0.1, 100);
			}
		#/
		var_f8ff628e waittill(#"death");
	}
	namespace_8c04284b::function_c8462f96();
	level thread namespace_ec06fe4a::function_de70888a();
}

