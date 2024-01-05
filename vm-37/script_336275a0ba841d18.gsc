#using scripts\zm\powerup\zm_powerup_nuke.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\gametypes\zonslaught.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using script_41b18a77720c5395;
#using script_3819e7a1427df6d2;
#using scripts\killstreaks\killstreaks_util.gsc;
#using script_34e9dd62fc371077;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_556e19065f09f8a2;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using script_335d0650ed05d36d;
#using script_3e196d275a6fb180;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_51f64aa9;

/*
	Name: function_2ce126c4
	Namespace: namespace_51f64aa9
	Checksum: 0x1D209A9D
	Offset: 0x6A0
	Size: 0x5EC
	Parameters: 0
	Flags: None
*/
function function_2ce126c4()
{
	death_circle::function_c156630d();
	level.wave_number = 0;
	level.var_bc2071f = 0;
	level flag::init("rounds_started");
	level flag::init("onslaught_round_logic_inprogress");
	level flag::init("onslaught_round_logic_complete");
	callback::on_spawned(&function_e8535657);
	callback::on_connect(&function_8b930ad1);
	callback::on_start_gametype(&function_6071bedf);
	callback::on_game_playing(&function_bfd2a58b);
	callback::on_ai_killed(&on_ai_killed);
	callback::add_callback(#"hash_5118a91e667446ee", &function_13f485ad);
	level.var_4ea2c79a = 1;
	level.graceperiod = 0;
	level.var_b82a5c35 = 1;
	level.var_3d1e480e = 1;
	level.var_3a701785 = 1;
	level.var_d25999d7 = getdvarint(#"hash_5bc5d75f3e9a5aae", 0);
	level.var_4614c421 = &function_a3e209ba;
	level.var_2b37d0dd = 0;
	level.var_e5a890d7 = 0;
	level.var_bc79322a = 0;
	level.var_58c95941 = 0;
	level.var_9dfa1a1e = 1;
	level.var_6d24574d = 0;
	level.custom_end_screen = &custom_end_screen;
	spawner::add_archetype_spawn_function(#"zombie", &zombiespawnsetup);
	spawner::function_89a2cd87(#"zombie", &function_a9b7dc57);
	spawner::add_archetype_spawn_function(#"zombie_dog", &function_6a89f900);
	level callback::add_callback(#"hash_4ad847c8f6c6405f", &spawn_dog);
	level.onslaught_hud = onslaught_hud::register();
	level.var_e2f95698 = #"hash_34e052fa44442bbb";
	level.var_d4c0ef1a = getentarray("koth_zone_center", "targetname");
	foreach(zone in level.var_d4c0ef1a)
	{
		zone.usecount = 0;
		othervisuals = getentarray(zone.target, "targetname");
		for(j = 0; j < othervisuals.size; j++)
		{
			if(othervisuals[j].classname == "script_brushmodel")
			{
				othervisuals[j] notsolid();
				othervisuals[j] hide();
			}
		}
	}
	level._effect[#"hash_f122d8967f599a"] = "zombie/fx9_onslaught_spawn_sm";
	level._effect[#"hash_70915e6d17793425"] = "zm_ai/fx8_dog_lightning_spawn";
	level._effect[#"hash_7a06e7dd7e64b880"] = "zm_ai/fx8_avo_elec_teleport_appear";
	level._effect[#"hash_5fa0154f4b01ba02"] = "zombie/fx9_onslaught_orb_nuke";
	/#
		if(getdvarint(#"hash_61dfb5be7263ab36", 0) == 1)
		{
			level.var_2b37d0dd = 1;
			level.var_e5a890d7 = 0;
			level.var_bc79322a = 0;
			level.var_bc0b4b46 = 1;
		}
		if(getdvarint(#"hash_61dfb5be7263ab36", 0) == 2)
		{
			level.var_e5a890d7 = 1;
			level.var_9725eb4a = 1;
		}
		if(getdvarint(#"hash_61dfb5be7263ab36", 0) == 3)
		{
			level.var_e5a890d7 = 1;
			level.var_58c95941 = 1;
		}
	#/
}

/*
	Name: function_c1d511f6
	Namespace: namespace_51f64aa9
	Checksum: 0xFDF9818F
	Offset: 0xC98
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function function_c1d511f6()
{
	level endon(#"end_game");
	level flag::wait_till("rounds_started");
	wait(2);
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"hash_5731a6df491c37c7");
		var_c2f7b1a3 = waitresult.location;
		zm_sq::objective_set(#"hash_641e9c4d20df5950", var_c2f7b1a3);
		level waittill(#"hash_1b8264e950c01344");
	}
}

/*
	Name: function_d6923f19
	Namespace: namespace_51f64aa9
	Checksum: 0x4F03D0A5
	Offset: 0xD58
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_d6923f19()
{
	level endon(#"end_game");
	array::thread_all(getplayers(), &function_d3379a31);
	level zm_vo::function_7622cb70(#"matchstart", 3.5);
	level waittill(#"hash_221bff60f501cbaf");
	level thread zm_vo::function_7622cb70(#"hash_7ca80ff4ecb29f8e", 1);
	level waittill(#"hash_7cd8474c6919310b");
	level zm_vo::function_7622cb70(#"hash_37fac4fc5c027a69", 3);
}

/*
	Name: function_d3379a31
	Namespace: namespace_51f64aa9
	Checksum: 0xF721F2EF
	Offset: 0xE58
	Size: 0x9E
	Parameters: 0
	Flags: Private
*/
function private function_d3379a31()
{
	self endon(#"disconnect");
	var_e418724e = 0;
	while(true)
	{
		if(is_true(self.outsidedeathcircle))
		{
			self zm_vo::function_7622cb70(#"hash_55bd8afbd48fb16e");
			var_e418724e++;
			if(var_e418724e == 3)
			{
				return;
			}
			wait(randomintrange(10, 20));
		}
		wait(1);
	}
}

/*
	Name: debug_spawns
	Namespace: namespace_51f64aa9
	Checksum: 0x12AC9005
	Offset: 0xF00
	Size: 0x2CA
	Parameters: 0
	Flags: None
*/
function debug_spawns()
{
	/#
		var_da0b6672 = 50;
		checkdist = 1000;
		while(true)
		{
			player1 = getplayers()[0];
			var_273a84a9 = [];
			if(!isdefined(var_273a84a9))
			{
				var_273a84a9 = [];
			}
			else if(!isarray(var_273a84a9))
			{
				var_273a84a9 = array(var_273a84a9);
			}
			var_273a84a9[var_273a84a9.size] = "";
			if(!isdefined(var_273a84a9))
			{
				var_273a84a9 = [];
			}
			else if(!isarray(var_273a84a9))
			{
				var_273a84a9 = array(var_273a84a9);
			}
			var_273a84a9[var_273a84a9.size] = "";
			var_8fb1964e = spawning::function_d400d613(#"mp_spawn_point", var_273a84a9);
			spawns = var_8fb1964e[#"tdm"];
			if(!isdefined(spawns))
			{
				spawns = var_8fb1964e[#"ctf"];
			}
			foreach(spawnpt in spawns)
			{
				var_b3dbfd56 = spawnpt.origin;
				circle(var_b3dbfd56, var_da0b6672, (1, 0, 0), 1, 1, 1);
				if(is_true(spawnpt.used))
				{
					drawcross(var_b3dbfd56 + vectorscale((0, 0, 1), 10), (1, 0, 0), 1);
					drawcross(var_b3dbfd56 + vectorscale((0, 0, 1), 40), (1, 0, 0), 1);
					drawcross(var_b3dbfd56 + vectorscale((0, 0, 1), 80), (1, 0, 0), 1);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_ec2b3302
	Namespace: namespace_51f64aa9
	Checksum: 0x6227AC22
	Offset: 0x11D8
	Size: 0x172
	Parameters: 0
	Flags: None
*/
function function_ec2b3302()
{
	var_8314a02e = 0;
	if(level.var_9b7bd0e8 >= 3 || level.wave_number > 9)
	{
		var_8314a02e = 20;
	}
	else
	{
		if(isdefined(level.var_70b6f044) && isdefined(level.var_70b6f044[#"hash_5f22ecce894282fa"]))
		{
			return level.var_70b6f044[#"hash_5f22ecce894282fa"];
		}
		return #"hash_5f22ecce894282fa";
	}
	rand = randomint(100);
	if(rand <= var_8314a02e)
	{
		if(isdefined(level.var_70b6f044) && isdefined(level.var_70b6f044[#"hash_12a17ab3df5889eb"]))
		{
			return level.var_70b6f044[#"hash_12a17ab3df5889eb"];
		}
		return #"hash_12a17ab3df5889eb";
	}
	if(isdefined(level.var_70b6f044) && isdefined(level.var_70b6f044[#"hash_5f22ecce894282fa"]))
	{
		return level.var_70b6f044[#"hash_5f22ecce894282fa"];
	}
	return #"hash_5f22ecce894282fa";
}

/*
	Name: function_2f6706d2
	Namespace: namespace_51f64aa9
	Checksum: 0x9755B03
	Offset: 0x1358
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function function_2f6706d2()
{
	if(isdefined(level.var_70b6f044) && isdefined(level.var_70b6f044[#"spawner_zm_steiner"]))
	{
		return level.var_70b6f044[#"spawner_zm_steiner"];
	}
	return #"spawner_zm_steiner";
}

/*
	Name: function_d09d6958
	Namespace: namespace_51f64aa9
	Checksum: 0x2A6DB285
	Offset: 0x13C0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_d09d6958(value)
{
	level.onslaught_hud onslaught_hud::set_objectivetext(self, value);
}

/*
	Name: function_61c3d59c
	Namespace: namespace_51f64aa9
	Checksum: 0xC985B76B
	Offset: 0x13F8
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_61c3d59c(str_text, var_a920f1d6)
{
	self notify("5f449b52b24905ec");
	self endon("5f449b52b24905ec");
	self endon(#"disconnect", #"death");
	level.onslaught_hud onslaught_hud::set_showobjective(self, 1);
	self function_d09d6958(str_text);
	wait(var_a920f1d6);
	level.onslaught_hud onslaught_hud::set_showobjective(self, 0);
}

/*
	Name: function_22d0bd07
	Namespace: namespace_51f64aa9
	Checksum: 0x6F01E656
	Offset: 0x14B8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_22d0bd07(value)
{
	level.onslaught_hud onslaught_hud::set_bossalerttext(self, value);
}

/*
	Name: function_f9b8bf44
	Namespace: namespace_51f64aa9
	Checksum: 0x2B9EC92E
	Offset: 0x14F0
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_f9b8bf44(str_text, var_a920f1d6)
{
	self notify("66e31141eb042673");
	self endon("66e31141eb042673");
	self endon(#"disconnect", #"death");
	level.onslaught_hud onslaught_hud::set_showbossalert(self, 1);
	self function_22d0bd07(str_text);
	wait(var_a920f1d6);
	level.onslaught_hud onslaught_hud::set_showbossalert(self, 0);
}

/*
	Name: function_f0e74135
	Namespace: namespace_51f64aa9
	Checksum: 0x661DD182
	Offset: 0x15B0
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_f0e74135(value)
{
	level.onslaught_hud onslaught_hud::set_objective2text(self, value);
}

/*
	Name: function_4b12e9e4
	Namespace: namespace_51f64aa9
	Checksum: 0xD27C03
	Offset: 0x15E8
	Size: 0xB4
	Parameters: 2
	Flags: None
*/
function function_4b12e9e4(str_text, var_a920f1d6)
{
	self notify("1328bdf4aa3334bd");
	self endon("1328bdf4aa3334bd");
	self endon(#"disconnect", #"death");
	level.onslaught_hud onslaught_hud::set_showobjective2(self, 1);
	self function_f0e74135(str_text);
	wait(var_a920f1d6);
	level.onslaught_hud onslaught_hud::set_showobjective2(self, 0);
}

/*
	Name: function_2617d862
	Namespace: namespace_51f64aa9
	Checksum: 0x27D90EED
	Offset: 0x16A8
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_2617d862()
{
	level.onslaught_hud onslaught_hud::set_showscore(self, 0);
}

/*
	Name: function_813aaa72
	Namespace: namespace_51f64aa9
	Checksum: 0xA23824CD
	Offset: 0x16D8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_813aaa72(value)
{
	level.onslaught_hud onslaught_hud::set_score3points(self, value);
}

/*
	Name: function_da556d60
	Namespace: namespace_51f64aa9
	Checksum: 0x696F297E
	Offset: 0x1710
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_da556d60()
{
	level.onslaught_hud onslaught_hud::set_showscore(self, 1);
}

/*
	Name: function_251073e9
	Namespace: namespace_51f64aa9
	Checksum: 0x4A639A63
	Offset: 0x1740
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_251073e9()
{
	level.onslaught_hud onslaught_hud::set_showendscore(self, 0);
}

/*
	Name: function_cf4e42ea
	Namespace: namespace_51f64aa9
	Checksum: 0x19645638
	Offset: 0x1770
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_cf4e42ea()
{
	level.onslaught_hud onslaught_hud::set_showendscore(self, 1);
}

/*
	Name: function_a3e209ba
	Namespace: namespace_51f64aa9
	Checksum: 0x4F82D886
	Offset: 0x17A0
	Size: 0x2E
	Parameters: 0
	Flags: Private
*/
function private function_a3e209ba()
{
	if(level flag::get("rounds_started"))
	{
		return true;
	}
	return false;
}

/*
	Name: function_6071bedf
	Namespace: namespace_51f64aa9
	Checksum: 0x98697F35
	Offset: 0x17D8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_6071bedf()
{
	level thread function_69e5b9b();
}

/*
	Name: function_bfd2a58b
	Namespace: namespace_51f64aa9
	Checksum: 0x3744D5C0
	Offset: 0x1800
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_bfd2a58b()
{
	level waittill(#"initial_fade_in_complete");
	while(getplayers().size < 0)
	{
		wait(1);
	}
	wait(1);
	/#
		if(is_true(level.var_bc0b4b46))
		{
			level thread debug_spawns();
		}
	#/
	level thread function_81c192d();
	wait(2);
	level flag::set("rounds_started");
}

/*
	Name: function_8b930ad1
	Namespace: namespace_51f64aa9
	Checksum: 0xFD225987
	Offset: 0x18C8
	Size: 0x4A
	Parameters: 0
	Flags: None
*/
function function_8b930ad1()
{
	self globallogic_score::initpersstat(#"agrkills", 0);
	self.var_9a2f93bd = max(level.wave_number, 1);
}

/*
	Name: function_e8535657
	Namespace: namespace_51f64aa9
	Checksum: 0xDAF97D2B
	Offset: 0x1920
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function function_e8535657()
{
	self endon(#"disconnect");
	self setclientuivisibilityflag("g_compassShowEnemies", 1);
	if(!level.onslaught_hud onslaught_hud::is_open(self))
	{
		level.onslaught_hud onslaught_hud::open(self);
	}
}

/*
	Name: function_b0eba88e
	Namespace: namespace_51f64aa9
	Checksum: 0x8D0486D4
	Offset: 0x19A8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_b0eba88e(player)
{
	self endon(#"death");
	player waittill(#"disconnect");
	self delete();
}

/*
	Name: drawcross
	Namespace: namespace_51f64aa9
	Checksum: 0x5A2A3EAC
	Offset: 0x1A00
	Size: 0xEC
	Parameters: 3
	Flags: None
*/
function drawcross(origin, color, duration)
{
	/#
		r = 6;
		forward = (r, 0, 0);
		left = (0, r, 0);
		up = (0, 0, r);
		line(origin - forward, origin + forward, color, 1, 0, duration);
		line(origin - left, origin + left, color, 1, 0, duration);
		line(origin - up, origin + up, color, 1, 0, duration);
	#/
}

/*
	Name: function_b5c27e32
	Namespace: namespace_51f64aa9
	Checksum: 0x6CB922AC
	Offset: 0x1AF8
	Size: 0x26
	Parameters: 1
	Flags: None
*/
function function_b5c27e32(var_3b720eb2)
{
	if(isdefined(self))
	{
		self notify(#"risen");
	}
}

/*
	Name: function_a9b7dc57
	Namespace: namespace_51f64aa9
	Checksum: 0xB423999
	Offset: 0x1B28
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_a9b7dc57()
{
	self pathmode("move allowed");
}

/*
	Name: function_5954bef8
	Namespace: namespace_51f64aa9
	Checksum: 0x608476E2
	Offset: 0x1B58
	Size: 0x174
	Parameters: 0
	Flags: None
*/
function function_5954bef8()
{
	rand = randomint(100);
	if(level.wave_number < 9)
	{
		rand = rand + (level.wave_number * 2);
		if(rand < 70)
		{
			zombie_utility::set_zombie_run_cycle("walk");
		}
		else
		{
			zombie_utility::set_zombie_run_cycle("run");
		}
	}
	else
	{
		if(level.wave_number < 15)
		{
			rand = rand + ((level.wave_number - 9) * 2);
			if(rand < 70)
			{
				zombie_utility::set_zombie_run_cycle("sprint");
			}
			else
			{
				zombie_utility::set_zombie_run_cycle("run");
			}
		}
		else
		{
			rand = rand + ((level.wave_number - 15) * 2);
			if(rand < 30)
			{
				zombie_utility::set_zombie_run_cycle("run");
			}
			else
			{
				zombie_utility::set_zombie_run_cycle("sprint");
			}
		}
	}
}

/*
	Name: zombiespawnsetup
	Namespace: namespace_51f64aa9
	Checksum: 0xF68F24D3
	Offset: 0x1CD8
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function zombiespawnsetup()
{
	self.overrideactordamage = &aidamage;
	self clientfield::set("enemy_on_radar", 1);
	self.custom_location = &function_b5c27e32;
	self zm_behavior::function_d63f6426();
	self.script_string = "find_flesh";
	self notify(#"risen", "find_flesh");
	self zm_spawner::zombie_complete_emerging_into_playable_area();
	self function_5954bef8();
	self.zombie_think_done = 1;
	self.b_ignore_cleanup = 0;
	self.var_8d1d18aa = 0;
	self.isboss = 0;
	self clientfield::set("enemy_on_radar", 1);
	self enableaimassist();
}

/*
	Name: function_6c40ff50
	Namespace: namespace_51f64aa9
	Checksum: 0x2FDD7E9F
	Offset: 0x1E08
	Size: 0x1E4
	Parameters: 0
	Flags: None
*/
function function_6c40ff50()
{
	aiutility::addaioverridedamagecallback(self, &aidamage);
	self.zombie_think_done = 1;
	self.completed_emerging_into_playable_area = 1;
	self.b_ignore_cleanup = 1;
	self pathmode("move allowed");
	self.isboss = 1;
	self clientfield::set("enemy_on_radar", 1);
	self.var_8d1d18aa = 1;
	self enableaimassist();
	all_ai = getaiarray();
	foreach(ai in all_ai)
	{
		foreach(var_e0b78f9f in all_ai)
		{
			if(var_e0b78f9f != ai)
			{
				var_e0b78f9f setignoreent(ai, 1);
				ai setignoreent(var_e0b78f9f, 1);
			}
		}
	}
}

/*
	Name: aidamage
	Namespace: namespace_51f64aa9
	Checksum: 0x2AF7A6D1
	Offset: 0x1FF8
	Size: 0x104
	Parameters: 13
	Flags: None
*/
function aidamage(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(isdefined(boneindex) && isactor(boneindex) && boneindex.archetype == #"zombie")
	{
		return 0;
	}
	if(is_true(self.isboss) && is_true(self.var_8d1d18aa))
	{
		if(self.health - modelindex < 1)
		{
			return 0;
		}
	}
	return modelindex;
}

/*
	Name: hide_pop
	Namespace: namespace_51f64aa9
	Checksum: 0xD7B72193
	Offset: 0x2108
	Size: 0x6E
	Parameters: 0
	Flags: None
*/
function hide_pop()
{
	self endon(#"death");
	self ghost();
	wait(0.25);
	if(isdefined(self))
	{
		self show();
		waitframe(1);
		if(isdefined(self))
		{
			self.create_eyes = 1;
		}
	}
}

/*
	Name: function_1495c8c
	Namespace: namespace_51f64aa9
	Checksum: 0x17D2C590
	Offset: 0x2180
	Size: 0x2B2
	Parameters: 3
	Flags: None
*/
function function_1495c8c(v_origin, v_angles, anim_name)
{
	self endon(#"death");
	origin = self gettagorigin("tag_origin");
	self clientfield::set("zombie_aether_spawn_cf", 1);
	self.in_the_ground = 1;
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	self.anchor = spawn("script_origin", self.origin);
	self.anchor.angles = self.angles;
	self linkto(self.anchor);
	if(!isdefined(v_angles))
	{
		v_angles = (0, 0, 0);
	}
	anim_org = v_origin;
	anim_ang = v_angles;
	anim_org = anim_org + (0, 0, 0);
	self ghost();
	self.anchor moveto(anim_org, 0.05);
	self.anchor waittill(#"movedone");
	self unlink();
	if(isdefined(self.anchor))
	{
		self.anchor delete();
	}
	self thread hide_pop();
	self orientmode("face default");
	self animscripted("rise_anim", self.origin, v_angles, anim_name, "normal");
	if(self.health > 0)
	{
		playfx(level._effect[#"hash_7a06e7dd7e64b880"], origin);
		playrumbleonposition("zm_nova_phase_exit_rumble", self.origin);
	}
	self notify(#"rise_anim_finished");
	self.in_the_ground = 0;
}

/*
	Name: function_3fd720cc
	Namespace: namespace_51f64aa9
	Checksum: 0x53905B85
	Offset: 0x2440
	Size: 0x14C
	Parameters: 0
	Flags: None
*/
function function_3fd720cc()
{
	self endon(#"death");
	origin = self.origin;
	self val::set(#"hash_60ade25781f407a4", "takedamage", 0);
	self val::set(#"hash_60ade25781f407a4", "ignoreall", 1);
	flash_count = 14;
	while(flash_count > 0)
	{
		playfx(level._effect[#"hash_70915e6d17793425"], origin);
		playrumbleonposition("zm_nova_phase_exit_rumble", origin);
		wait(0.5);
		flash_count = flash_count - 1;
	}
	self val::reset(#"hash_60ade25781f407a4", "takedamage");
	self val::reset(#"hash_60ade25781f407a4", "ignoreall");
}

/*
	Name: function_b5ba566b
	Namespace: namespace_51f64aa9
	Checksum: 0x6C608447
	Offset: 0x2598
	Size: 0xFA
	Parameters: 3
	Flags: None
*/
function function_b5ba566b(v_origin, v_angles, anim_name)
{
	self endon(#"death");
	if(self.health > 0)
	{
		origin = self gettagorigin("tag_origin");
		playfx(level._effect[#"hash_7a06e7dd7e64b880"], origin);
		playrumbleonposition("zm_nova_phase_exit_rumble", self.origin);
		playsoundatposition(#"hash_3f974bee9fb4e319", self.origin);
	}
	self notify(#"rise_anim_finished");
	self.in_the_ground = 0;
}

/*
	Name: function_6fcd98c5
	Namespace: namespace_51f64aa9
	Checksum: 0x31515B5B
	Offset: 0x26A0
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function function_6fcd98c5()
{
	all_ai = getaiarray();
	foreach(ai in all_ai)
	{
		if(!is_true(ai.var_1cc135b3))
		{
			ai.zombie_move_speed = "sprint";
		}
	}
}

/*
	Name: function_73297fa
	Namespace: namespace_51f64aa9
	Checksum: 0x1A1962DC
	Offset: 0x2768
	Size: 0x1A0
	Parameters: 0
	Flags: None
*/
function function_73297fa()
{
	zombiesarray = getaiarchetypearray(#"zombie");
	zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"zombie_dog"), 0, 0);
	zombiesarray = arraycombine(zombiesarray, getaiarchetypearray(#"hash_7c0d83ac1e845ac2"), 0, 0);
	foreach(ai in zombiesarray)
	{
		if(isai(ai) && isalive(ai) && ai.team !== #"allies" && !zm_utility::is_magic_bullet_shield_enabled(ai))
		{
			ai kill(undefined, undefined, undefined, undefined, undefined, 1);
		}
		wait(0.1);
	}
}

/*
	Name: function_46ff5efa
	Namespace: namespace_51f64aa9
	Checksum: 0x7ADE0213
	Offset: 0x2910
	Size: 0x250
	Parameters: 0
	Flags: None
*/
function function_46ff5efa()
{
	playfx(level._effect[#"hash_5fa0154f4b01ba02"], level.var_df7b46d1.var_48fcd26a.origin);
	playsoundatposition(#"hash_712929054f8c3fda", level.var_df7b46d1.var_48fcd26a.origin);
	wait(1);
	lui::screen_flash(0.2, 0.5, 1, 0.8, "white", undefined, 1);
	playsoundatposition(#"hash_7459371c7e21f143", level.var_df7b46d1.var_48fcd26a.origin);
	all_ai = getaiarray();
	foreach(ai in all_ai)
	{
		if(isai(ai) && isalive(ai) && !is_true(ai.isboss) && !isvehicle(ai) && ai.team !== #"allies" && !zm_utility::is_magic_bullet_shield_enabled(ai))
		{
			ai kill(undefined, undefined, undefined, undefined, undefined, 1);
		}
		wait(0.1);
	}
}

/*
	Name: function_d6ad49c2
	Namespace: namespace_51f64aa9
	Checksum: 0xE967A8A0
	Offset: 0x2B68
	Size: 0x188
	Parameters: 0
	Flags: None
*/
function function_d6ad49c2()
{
	waitresult = undefined;
	waitresult = self waittill(#"death");
	attacker = waitresult.attacker;
	if(!isplayer(attacker) && (!is_true(self.var_b70158b5) && !isplayer(self.killed_by)))
	{
		return;
	}
	level.var_d1876457 = self.origin;
	if(!is_true(self.boss_zombie))
	{
		if(self.type == #"hash_12a17ab3df5889eb")
		{
			level.var_bc2071f = min(100, level.var_bc2071f + level.var_74af7499);
		}
		else
		{
			level.var_bc2071f = min(100, level.var_bc2071f + level.var_3a23a27);
		}
	}
	self clientfield::set("orb_soul_capture_fx", 1);
	level notify(#"hash_221bff60f501cbaf");
}

/*
	Name: function_1e521615
	Namespace: namespace_51f64aa9
	Checksum: 0xB1E3B4B5
	Offset: 0x2CF8
	Size: 0x7A
	Parameters: 0
	Flags: None
*/
function function_1e521615()
{
	if(!isdefined(self.var_9fde8624))
	{
		return 0;
	}
	var_6f8997fc = array(#"hash_5605f3a585b3ef9f", #"hash_3498fb1fbfcd0cf", #"hash_12fa854f3a7721b9");
	return isinarray(var_6f8997fc, self.var_9fde8624);
}

/*
	Name: function_c08eb1c4
	Namespace: namespace_51f64aa9
	Checksum: 0xDD7E7096
	Offset: 0x2D80
	Size: 0x34C
	Parameters: 0
	Flags: None
*/
function function_c08eb1c4()
{
	level endon(#"hash_1b8264e950c01344");
	self endon(#"death");
	if(!is_true(self.var_8d1d18aa))
	{
		return;
	}
	waitresult = undefined;
	waitresult = self waittill(#"spawned_split_ai");
	if(isdefined(level.var_c42bdd1b))
	{
		var_9f7c58e6 = level.var_c42bdd1b;
	}
	else
	{
		var_9f7c58e6 = #"spawner_zm_steiner_split_radiation_blast";
	}
	if(isdefined(level.var_dc38daf))
	{
		var_a0024591 = level.var_dc38daf;
	}
	else
	{
		var_a0024591 = #"spawner_zm_steiner_split_radiation_bomb";
	}
	if(self function_1e521615())
	{
		if(isdefined(level.var_68b26ea))
		{
			var_9f7c58e6 = level.var_68b26ea;
		}
		else
		{
			var_9f7c58e6 = #"hash_7f957e36b4f6160f";
		}
		if(isdefined(level.var_887c5017))
		{
			var_a0024591 = level.var_887c5017;
		}
		else
		{
			var_a0024591 = #"hash_6904f5c7bef64405";
		}
	}
	all_ai = getaiarray();
	foreach(ai in all_ai)
	{
		if(isdefined(ai.aitype))
		{
			if(ai.aitype == var_9f7c58e6)
			{
				level.var_adbdd377 = ai;
				level.var_adbdd377.isboss = 1;
				level.var_adbdd377.type = var_9f7c58e6;
				level.var_adbdd377.b_ignore_cleanup = 1;
				level.var_adbdd377 clientfield::set("enemy_on_radar", 1);
				continue;
			}
			if(ai.aitype == var_a0024591)
			{
				level.var_4bbd72b6 = ai;
				level.var_4bbd72b6.isboss = 1;
				level.var_4bbd72b6.type = var_a0024591;
				level.var_4bbd72b6.b_ignore_cleanup = 1;
				level.var_4bbd72b6 clientfield::set("enemy_on_radar", 1);
			}
		}
	}
	level.var_4bbd72b6 thread function_b33a5cf4(level.var_adbdd377);
	level.var_adbdd377 thread function_b33a5cf4(level.var_4bbd72b6);
}

/*
	Name: function_b33a5cf4
	Namespace: namespace_51f64aa9
	Checksum: 0x44AC50D6
	Offset: 0x30D8
	Size: 0x3F8
	Parameters: 1
	Flags: None
*/
function function_b33a5cf4(var_ba65b6cb)
{
	level endon(#"hash_1b8264e950c01344");
	waitresult = undefined;
	waitresult = self waittill(#"death");
	attacker = waitresult.attacker;
	if(isdefined(var_ba65b6cb) && isalive(var_ba65b6cb))
	{
		level.var_361db66b = self function_cb711686();
		var_ba65b6cb.var_44505aa3 = 1;
		return;
	}
	if(function_50cda95())
	{
		self thread zm_powerups::specific_powerup_drop("free_perk", self.origin);
	}
	else if(isdefined(level.var_361db66b))
	{
		switch(level.var_361db66b)
		{
			case "hero_weapon_power":
			{
				self thread zm_powerups::specific_powerup_drop("full_ammo", self.origin);
				break;
			}
			case "full_ammo":
			{
				self thread zm_powerups::specific_powerup_drop("insta_kill", self.origin);
				break;
			}
			case "insta_kill":
			{
				self thread zm_powerups::specific_powerup_drop("hero_weapon_power", self.origin);
				break;
			}
		}
	}
	if(killstreaks::is_killstreak_weapon(waitresult.weapon) && isplayer(attacker))
	{
		attacker zm_utility::give_achievement(#"hash_2deb5f76757c411d");
	}
	level.var_1c376a62 = self.origin;
	level.var_9b7bd0e8++;
	level.var_bc2071f = 100;
	switch(level.var_9b7bd0e8)
	{
		case 3:
		{
			break;
		}
		case 5:
		{
			break;
		}
		case 8:
		{
			break;
		}
	}
	level.var_3a23a27 = max(level.var_3a23a27 - 1, 3);
	level.var_74af7499 = max(level.var_74af7499 - 1, 10);
	players = getplayers();
	foreach(player in players)
	{
		player function_a7a4f67f(level.var_9b7bd0e8);
		player zonslaught::function_e88957df();
		player clientfield::set_player_uimodel("hudItems.onslaught.bosskill_count", level.var_9b7bd0e8);
	}
	level notify(#"hash_1b8264e950c01344");
}

/*
	Name: function_50cda95
	Namespace: namespace_51f64aa9
	Checksum: 0x7764B071
	Offset: 0x34D8
	Size: 0xB8
	Parameters: 0
	Flags: Private
*/
function private function_50cda95()
{
	foreach(player in function_a1ef346b())
	{
		if(isarray(player.var_7341f980) && player.var_7341f980.size < 6)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_cb711686
	Namespace: namespace_51f64aa9
	Checksum: 0xBE45D523
	Offset: 0x3598
	Size: 0x108
	Parameters: 0
	Flags: None
*/
function function_cb711686()
{
	var_34e28de6 = randomintrange(1, 7);
	switch(var_34e28de6)
	{
		case 1:
		case 2:
		{
			str_powerup = "hero_weapon_power";
			break;
		}
		case 4:
		case 5:
		{
			str_powerup = "full_ammo";
			break;
		}
		case 6:
		{
			str_powerup = "insta_kill";
			break;
		}
		default:
		{
			str_powerup = "full_ammo";
			break;
		}
	}
	self thread zm_powerups::specific_powerup_drop(str_powerup, self.origin);
	return str_powerup;
}

/*
	Name: function_a7a4f67f
	Namespace: namespace_51f64aa9
	Checksum: 0xAD3DF099
	Offset: 0x36A8
	Size: 0x82
	Parameters: 1
	Flags: None
*/
function function_a7a4f67f(amount)
{
	var_a53e72a7 = self globallogic_score::getpersstat(#"agrkills");
	self globallogic_score::incpersstat(#"agrkills", amount - var_a53e72a7, 0);
	self.agrkills = self globallogic_score::getpersstat(#"agrkills");
}

/*
	Name: function_a371376
	Namespace: namespace_51f64aa9
	Checksum: 0x62EBA009
	Offset: 0x3738
	Size: 0x280
	Parameters: 0
	Flags: None
*/
function function_a371376()
{
	waitresult = undefined;
	waitresult = self waittill(#"death");
	attacker = waitresult.attacker;
	if(is_true(self.var_8d1d18aa))
	{
		self thread zm_powerups::specific_powerup_drop("full_ammo", self.origin);
		if(is_true(self.var_8576e0be))
		{
			return;
		}
	}
	level.var_1c376a62 = self.origin;
	level.var_9b7bd0e8++;
	level.var_bc2071f = 100;
	switch(level.var_9b7bd0e8)
	{
		case 3:
		{
			break;
		}
		case 5:
		{
			break;
		}
		case 8:
		{
			break;
		}
	}
	level.var_3a23a27 = max(level.var_3a23a27 - 1, 3);
	level.var_74af7499 = max(level.var_74af7499 - 1, 10);
	players = getplayers();
	foreach(player in players)
	{
		player function_a7a4f67f(level.var_9b7bd0e8);
		player zonslaught::function_e88957df();
		player clientfield::set_player_uimodel("hudItems.onslaught.bosskill_count", level.var_9b7bd0e8);
	}
	level notify(#"hash_1b8264e950c01344");
}

/*
	Name: on_ai_killed
	Namespace: namespace_51f64aa9
	Checksum: 0x33B39168
	Offset: 0x39C0
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function on_ai_killed(s_params)
{
	if(!isactor(self))
	{
		return;
	}
	if(!isplayer(s_params.eattacker))
	{
		return;
	}
	self thread zm_powerups::function_b753385f(s_params.weapon);
}

/*
	Name: function_c50adb68
	Namespace: namespace_51f64aa9
	Checksum: 0x730EC01F
	Offset: 0x3A30
	Size: 0x238
	Parameters: 1
	Flags: None
*/
function function_c50adb68(wave_number)
{
	level.wave_number = wave_number;
	if(wave_number == 1)
	{
		var_d9aaf886 = getplayers().size;
		if(var_d9aaf886 > 1)
		{
			level.var_3a23a27 = 10 * ((0.8 * var_d9aaf886) - 1);
			level.var_74af7499 = 20 * ((0.8 * var_d9aaf886) - 1);
		}
		else
		{
			level.var_3a23a27 = 10;
			level.var_74af7499 = 20;
		}
		level.var_6693a0b6 = 4 * var_d9aaf886;
		level.var_569d8a24 = 2 * var_d9aaf886;
	}
	else
	{
		level.var_6693a0b6 = min(24, level.var_6693a0b6 + (2 * getplayers().size));
		level.var_569d8a24 = min(24, level.var_569d8a24);
	}
	level.var_56e32823 = 0;
	level.run_timer = 0;
	level flag::clear("onslaught_round_logic_complete");
	players = getplayers();
	foreach(player in players)
	{
		player clientfield::set_player_uimodel("hudItems.onslaught.wave_number", level.wave_number);
	}
}

/*
	Name: function_453afff4
	Namespace: namespace_51f64aa9
	Checksum: 0xFA9E015B
	Offset: 0x3C70
	Size: 0x29E
	Parameters: 0
	Flags: None
*/
function function_453afff4()
{
	/#
	#/
	while(true)
	{
		var_88f09c5 = level.var_3a23a27;
		players = getplayers();
		foreach(player in players)
		{
			player function_813aaa72(int(level.var_bc2071f));
		}
		/#
			if(is_true(level.var_2b37d0dd))
			{
				debug2dtext((670, 160, 0), "" + level.wave_number, (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 1);
				debug2dtext((670, 220, 0), (("" + var_88f09c5) + "") + var_88f09c5, (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 1);
				debug2dtext((670, 280, 0), "" + level.total_zombies_killed, (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 1);
				debug2dtext((670, 340, 0), "" + level.var_9b7bd0e8, (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 1);
				debug2dtext((670, 400, 0), "" + level.var_bc2071f, (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 1);
			}
		#/
		waitframe(1);
	}
}

/*
	Name: game_over
	Namespace: namespace_51f64aa9
	Checksum: 0xFA1CBE23
	Offset: 0x3F18
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function game_over()
{
	level._supress_survived_screen = 1;
	level.var_ea32773 = &function_ea32773;
	level.var_94048a02 = undefined;
}

/*
	Name: custom_end_screen
	Namespace: namespace_51f64aa9
	Checksum: 0xCECF5E1A
	Offset: 0x3F58
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function custom_end_screen(params)
{
	level thread zm::function_6c369691();
	wait(10);
	level lui::screen_fade_out(1);
}

/*
	Name: function_ea32773
	Namespace: namespace_51f64aa9
	Checksum: 0x36A53B90
	Offset: 0x3FA8
	Size: 0x1C0
	Parameters: 1
	Flags: None
*/
function function_ea32773(waitresult)
{
	music::setmusicstate("gameover_ons");
	if(isdefined(level.deathcircle.var_5c54ab33))
	{
		level.deathcircle.var_5c54ab33 delete();
	}
	players = getplayers();
	foreach(player in players)
	{
		player.oobdisabled = 1;
		player clientfield::set_player_uimodel("hudItems.onslaught.wave_number", level.wave_number);
		player val::set(#"gameobjects", "freezecontrols");
		player val::set(#"gameobjects", "disable_weapons");
		player thread function_2617d862();
		player val::set(#"hash_1a2b2a0d9b36043b", "show_hud", 0);
		player thread function_cf4e42ea();
	}
}

/*
	Name: give_match_bonus
	Namespace: namespace_51f64aa9
	Checksum: 0x5F5A4376
	Offset: 0x4170
	Size: 0x304
	Parameters: 1
	Flags: None
*/
function give_match_bonus(data)
{
	player = data.player;
	winner = data.winner;
	/#
		/#
			assert(isdefined(player.var_9a2f93bd), "");
		#/
	#/
	var_22ba849f = getdvarint(#"hash_3f0689f4ecc2fbab", 0);
	var_81b61a08 = (level.wave_number - player.var_9a2f93bd) + 1;
	var_900d44db = zm::function_d3113f01(level.wave_number);
	var_191f8e5e = var_900d44db.var_c6f2635d;
	var_7c032359 = var_900d44db.var_b93abbed[getplayers().size - 1];
	var_f65fd621 = function_7a2da789()[#"hash_31b5b9e273560fa9"];
	if(!isdefined(player.var_1096b5c0))
	{
		player.var_1096b5c0 = 0;
	}
	var_c602cc83 = player.var_1096b5c0;
	var_370ac26d = int(((((var_22ba849f * var_81b61a08) * var_191f8e5e) * var_f65fd621) - var_c602cc83) * var_7c032359);
	player zm::function_78e7b549(var_370ac26d);
	player display_transition::function_d7b5082e();
	/#
		println((((("" + player getentnum()) + "") + player.name) + "") + var_370ac26d);
		println("" + var_22ba849f);
		println("" + var_81b61a08);
		println("" + var_191f8e5e);
		println("" + var_f65fd621);
		println("" + var_7c032359);
		println("" + var_c602cc83);
		println("");
	#/
}

/*
	Name: function_13f485ad
	Namespace: namespace_51f64aa9
	Checksum: 0x595584E1
	Offset: 0x4480
	Size: 0x122
	Parameters: 0
	Flags: Private
*/
function private function_13f485ad()
{
	var_370ac26d = zm::function_d3113f01(level.wave_number).var_bd588afd;
	luinotifyevent(#"hash_3e6dd0ad7b864154", 1, var_370ac26d);
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_1096b5c0))
		{
			player.var_1096b5c0 = 0;
		}
		player addrankxpvalue("wave_end_xp", var_370ac26d, 4);
		player.var_1096b5c0 = player.var_1096b5c0 + var_370ac26d;
	}
}

/*
	Name: function_334be69a
	Namespace: namespace_51f64aa9
	Checksum: 0x638D24E3
	Offset: 0x45B0
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function function_334be69a(tacpoint)
{
	navmeshpoint = getclosestpointonnavmesh(tacpoint.origin, 64, 32);
	if(!isdefined(navmeshpoint))
	{
		return true;
	}
	if(!tracepassedonnavmesh(tacpoint.origin, navmeshpoint, 32))
	{
		return true;
	}
	if(!ispointonnavmesh(tacpoint.origin, 32))
	{
		return true;
	}
	return false;
}

/*
	Name: function_7f501c21
	Namespace: namespace_51f64aa9
	Checksum: 0x5DBDE340
	Offset: 0x4650
	Size: 0x104
	Parameters: 0
	Flags: None
*/
function function_7f501c21()
{
	level endon(#"end_game");
	while(level.var_bc2071f < 100 && level.var_df7b46d1.state == 1)
	{
		spawn_zombie(1000, 500, 400, 0);
		wait(0.1);
	}
	level flag::clear("onslaught_round_logic_inprogress");
	level flag::set("onslaught_round_logic_complete");
	level.var_3e67b08d = min(3, 0.6 + (0.2 * level.wave_number));
}

/*
	Name: function_6a89f900
	Namespace: namespace_51f64aa9
	Checksum: 0xAD53807A
	Offset: 0x4760
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_6a89f900(params)
{
	if(!isdefined(level.var_a5ab9bfb))
	{
		level.var_a5ab9bfb = [];
	}
}

/*
	Name: spawn_dog
	Namespace: namespace_51f64aa9
	Checksum: 0x64F4B31D
	Offset: 0x4790
	Size: 0xB4
	Parameters: 1
	Flags: None
*/
function spawn_dog(params)
{
	if(isdefined(level.var_70b6f044) && isdefined(level.var_70b6f044[#"hash_12a17ab3df5889eb"]))
	{
		var_a528603 = level.var_70b6f044[#"hash_12a17ab3df5889eb"];
	}
	else
	{
		var_a528603 = #"hash_12a17ab3df5889eb";
	}
	spawn_zombie(1000, 500, 400, 0, var_a528603);
}

/*
	Name: spawn_zombie
	Namespace: namespace_51f64aa9
	Checksum: 0x77DEACC8
	Offset: 0x4850
	Size: 0xD54
	Parameters: 5
	Flags: None
*/
function spawn_zombie(outer_radius, inner_radius, duration, boss_zombie, var_8c4dd20c)
{
	ai_count = getaicount();
	if((ai_count + 1) >= getailimit())
	{
		return;
	}
	alive_players = function_a1ef346b();
	if(isdefined(alive_players) && alive_players.size > 0)
	{
		var_c5eed04e = array::random(function_a1ef346b());
		if(!zm_utility::is_player_valid(var_c5eed04e, 0, 0))
		{
			return;
		}
	}
	else
	{
		return;
	}
	var_e5c52b73 = var_c5eed04e.origin;
	player_angles = var_c5eed04e getplayerangles();
	var_c4c03968 = randomintrange(-80, 80);
	/#
		if(is_true(level.var_9725eb4a))
		{
			var_c4c03968 = 0;
		}
	#/
	player_angles = player_angles + (0, var_c4c03968, 0);
	player_dir = anglestoforward(player_angles);
	var_78da6163 = getclosesttacpoint(var_c5eed04e.origin);
	if(!isdefined(var_78da6163) && isdefined(var_c5eed04e.last_valid_position))
	{
		/#
			if(is_true(level.var_bc79322a))
			{
				circle(var_c5eed04e.last_valid_position, 150, (1, 0, 0), 1, 1, duration);
			}
		#/
		var_78da6163 = getclosesttacpoint(var_c5eed04e.last_valid_position);
	}
	/#
		if(is_true(level.var_bc79322a))
		{
			circle(var_e5c52b73, inner_radius, (1, 1, 0), 1, 1, duration);
			circle(var_e5c52b73, outer_radius, (0, 1, 1), 1, 1, duration);
		}
	#/
	var_3c69a222 = tacticalquery("onslaught_tacticalquery", var_e5c52b73, var_c5eed04e);
	var_d23463ac = undefined;
	var_3ab48a16 = undefined;
	var_5bfbb8b9 = [];
	if(isdefined(var_3c69a222))
	{
		var_99b8deb8 = [];
		var_c377abe7 = [];
		var_e28e2aaf = [];
		for(i = 0; i < var_3c69a222.size; i++)
		{
			tacpoint = var_3c69a222[i];
			if(!isdefined(tacpoint.var_356cbbd9))
			{
				/#
					if(is_true(level.var_58c95941))
					{
						circle(tacpoint.origin, 20, (0, 0, 1), 1, 1, duration);
					}
				#/
				tacpoint.var_356cbbd9 = function_334be69a(tacpoint);
			}
			/#
				if(is_true(level.var_58c95941))
				{
					if(is_true(tacpoint.var_356cbbd9))
					{
						circle(tacpoint.origin, 10, (1, 0, 0), 1, 1, duration);
					}
					else
					{
						circle(tacpoint.origin, 10, (0, 1, 0), 1, 1, duration);
					}
				}
			#/
			if(is_true(tacpoint.var_356cbbd9))
			{
				continue;
			}
			var_3acd7553 = 0;
			if(is_true(tacpoint.used_time))
			{
				current_time = gettime();
				if(current_time < tacpoint.used_time + 10000)
				{
					var_3acd7553 = 1;
				}
			}
			if(is_true(var_3acd7553))
			{
				continue;
			}
			tacpoint.used_time = undefined;
			var_5bfbb8b9[var_5bfbb8b9.size] = tacpoint;
			var_99b8deb8[i] = 0;
			var_c377abe7[i] = 0;
			var_e28e2aaf[i] = 0;
			var_d32308ac = 0;
			if(isdefined(var_78da6163))
			{
				if(tacpoint.region == var_78da6163.region)
				{
					var_d32308ac = 1;
				}
				else
				{
					var_1c28df18 = function_b507a336(var_78da6163.region);
					foreach(neighbor in var_1c28df18.neighbors)
					{
						if(tacpoint.region == neighbor)
						{
							var_d32308ac = 1;
						}
					}
				}
			}
			if(!var_d32308ac)
			{
				continue;
			}
			dist_sq = distancesquared(var_c5eed04e.origin, tacpoint.origin);
			var_99b8deb8[i] = dist_sq / (outer_radius * outer_radius);
			var_152be849 = vectornormalize(tacpoint.origin - var_e5c52b73);
			dotproduct = vectordot(var_152be849, player_dir);
			var_c377abe7[i] = dotproduct;
			var_e28e2aaf[i] = var_99b8deb8[i] + var_c377abe7[i];
			if(!isdefined(var_d23463ac) || var_3ab48a16 < var_e28e2aaf[i])
			{
				var_d23463ac = var_3c69a222[i];
				var_3ab48a16 = var_e28e2aaf[i];
			}
		}
		for(i = 0; i < var_3c69a222.size; i++)
		{
			tacpoint = var_3c69a222[i];
			/#
				color = (0, 1, 0);
				if(is_true(level.var_bc79322a))
				{
					drawcross(tacpoint.origin, color, duration);
					if(is_true(tacpoint.used_time))
					{
						sphere(tacpoint.origin + vectorscale((0, 0, 1), 10), 6, (1, 0, 0), 1, 0, 8, duration);
					}
				}
			#/
		}
	}
	if(isdefined(var_78da6163))
	{
		/#
			println("" + var_78da6163.region);
			var_1c28df18 = function_b507a336(var_78da6163.region);
			foreach(neighbor in var_1c28df18.neighbors)
			{
				println("" + neighbor);
			}
		#/
	}
	if(!isdefined(var_d23463ac) && var_5bfbb8b9.size > 0)
	{
		if(var_5bfbb8b9.size === 1)
		{
			randindex = var_5bfbb8b9[0];
		}
		else
		{
			if(var_5bfbb8b9.size >= 1)
			{
				randindex = randomintrange(0, var_5bfbb8b9.size - 1);
			}
			else
			{
				randindex = randomintrange(0, 1);
			}
		}
		var_d23463ac = var_5bfbb8b9[randindex];
	}
	if(isdefined(var_d23463ac))
	{
		/#
			if(is_true(level.var_bc79322a))
			{
				sphere(var_d23463ac.origin + vectorscale((0, 0, 1), 30), 10, color, 1, 0, 8, duration);
				println((("" + var_3ab48a16) + "") + var_d23463ac.region);
			}
		#/
		var_d23463ac.used_time = gettime();
		var_83959d6f = vectornormalize(var_c5eed04e.origin - var_d23463ac.origin);
		spawn_angle = vectortoangles(var_83959d6f);
		var_78da6163 = getclosesttacpoint(var_c5eed04e.origin);
		if(isdefined(var_8c4dd20c))
		{
			var_b434916b = var_8c4dd20c;
		}
		else
		{
			var_b434916b = function_ec2b3302();
		}
		ai = spawnactor(var_b434916b, var_d23463ac.origin + vectorscale((0, 0, 1), 10), spawn_angle);
		if(isdefined(ai))
		{
			if(isdefined(var_8c4dd20c))
			{
				if(!isdefined(level.var_a5ab9bfb))
				{
					level.var_a5ab9bfb = [];
				}
				else if(!isarray(level.var_a5ab9bfb))
				{
					level.var_a5ab9bfb = array(level.var_a5ab9bfb);
				}
				if(!isinarray(level.var_a5ab9bfb, ai))
				{
					level.var_a5ab9bfb[level.var_a5ab9bfb.size] = ai;
				}
			}
			ai.no_powerups = 0;
			ai.type = var_b434916b;
			ai clientfield::set("enemy_on_radar", 1);
			waitframe(1);
			ai enableaimassist();
			ai thread function_d6ad49c2();
			if(isdefined(level.var_70b6f044) && isdefined(level.var_70b6f044[#"hash_5f22ecce894282fa"]) && level.var_70b6f044[#"hash_5f22ecce894282fa"] === var_b434916b || var_b434916b === #"hash_5f22ecce894282fa")
			{
				ai thread function_1495c8c(ai.origin, ai.angles, "ai_t9_zm_zombie_base_traverse_ground_dugup");
			}
			if(ai.archetype === #"zombie_dog")
			{
				ai.zombie_move_speed = #"run";
			}
			if(boss_zombie === 1)
			{
				ai.boss_zombie = 1;
			}
		}
	}
	if(boss_zombie === 1)
	{
		while(function_5ded2774() >= level.var_569d8a24)
		{
			waitframe(1);
		}
	}
	else
	{
		while(function_5ded2774() >= level.var_6693a0b6)
		{
			waitframe(1);
		}
	}
	wait(level.var_3e67b08d);
}

/*
	Name: function_6d6a276c
	Namespace: namespace_51f64aa9
	Checksum: 0xF7ECA311
	Offset: 0x55B0
	Size: 0x20E
	Parameters: 1
	Flags: None
*/
function function_6d6a276c(var_da0b6672)
{
	while(true)
	{
		var_b3dbfd56 = level.var_d5dc0bf2;
		/#
			if(is_true(level.var_2b37d0dd))
			{
				circle(var_b3dbfd56, var_da0b6672, (1, 1, 0), 1, 1, 1);
				circle(var_b3dbfd56 + vectorscale((0, 0, 1), 20), var_da0b6672, (0, 1, 1), 1, 1, 1);
				circle(var_b3dbfd56 + vectorscale((0, 0, 1), 40), var_da0b6672, (0, 1, 1), 1, 1, 1);
				circle(var_b3dbfd56 + vectorscale((0, 0, 1), 60), var_da0b6672, (0, 1, 1), 1, 1, 1);
				circle(var_b3dbfd56 + vectorscale((0, 0, 1), 80), var_da0b6672, (0, 1, 1), 1, 1, 1);
			}
		#/
		/#
			drawcross(var_b3dbfd56 + vectorscale((0, 0, 1), 10), (1, 0, 0), 1);
			drawcross(var_b3dbfd56 + vectorscale((0, 0, 1), 20), (0, 1, 0), 1);
			drawcross(var_b3dbfd56 + vectorscale((0, 0, 1), 30), (0, 0, 1), 1);
		#/
		waitframe(1);
	}
}

/*
	Name: function_54fc66c6
	Namespace: namespace_51f64aa9
	Checksum: 0x6550B7AE
	Offset: 0x57C8
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function function_54fc66c6()
{
	/#
		while(true)
		{
			foreach(point in self)
			{
				circle(point.origin, 30, (1, 1, 0), 1, 1, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_33824ce9
	Namespace: namespace_51f64aa9
	Checksum: 0xD170A289
	Offset: 0x5888
	Size: 0x156
	Parameters: 1
	Flags: None
*/
function function_33824ce9(var_f048a71a)
{
	/#
		while(true)
		{
			foreach(var_d13f3ba2 in self)
			{
				foreach(point in var_d13f3ba2)
				{
					circle(point.origin, 5, (1, 0, 0), 1, 1, 1);
				}
			}
			circle(var_f048a71a.origin, 3, (1, 1, 0), 1, 1, 1);
			waitframe(1);
		}
	#/
}

/*
	Name: function_122d85c7
	Namespace: namespace_51f64aa9
	Checksum: 0xA5BA9DCA
	Offset: 0x59E8
	Size: 0xB2
	Parameters: 0
	Flags: None
*/
function function_122d85c7()
{
	/#
		while(true)
		{
			foreach(point in self)
			{
				circle(point.origin, 6, (0, 0, 1), 1, 1, 1);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: bot_update
	Namespace: namespace_51f64aa9
	Checksum: 0x108F0031
	Offset: 0x5AA8
	Size: 0x10DC
	Parameters: 0
	Flags: None
*/
function bot_update()
{
	self endon(#"death");
	while(true)
	{
		switch(self.state)
		{
			case 0:
			{
				level.var_a7bd1c53 = (0, 0, 0);
				players = getplayers();
				if(isdefined(players) && players.size > 0)
				{
					foreach(player in players)
					{
						if(isalive(player))
						{
							level.var_a7bd1c53 = level.var_a7bd1c53 + player.origin;
						}
					}
					level.var_a7bd1c53 = level.var_a7bd1c53 / players.size;
					level.var_a7bd1c53 = level.var_a7bd1c53 + vectorscale((0, 0, 1), 68);
				}
				level.var_df7b46d1.var_48fcd26a clientfield::set("bot_claim_fx", 1);
				wait(5);
				self.state = 1;
				break;
			}
			case 1:
			{
				level notify(#"hash_4787b44eac7109dc");
				break;
			}
			case 2:
			{
				level.var_a7bd1c53 = (0, 0, 0);
				players = getplayers();
				if(isdefined(players) && players.size > 0)
				{
					foreach(player in players)
					{
						if(isalive(player))
						{
							level.var_a7bd1c53 = level.var_a7bd1c53 + player.origin;
						}
					}
					level.var_a7bd1c53 = level.var_a7bd1c53 / players.size;
					level.var_a7bd1c53 = level.var_a7bd1c53 + vectorscale((0, 0, 1), 68);
				}
				var_e4547143 = vectornormalize(level.var_a7bd1c53 - self.origin);
				var_531130b2 = distance2dsquared(level.var_a7bd1c53, self.origin);
				var_bf58cac7 = level.circle_radius * 0.5;
				if(var_531130b2 > var_bf58cac7 * var_bf58cac7)
				{
					self.origin = self.origin + (var_e4547143 * 20);
				}
				level notify(#"hash_7cd8474c6919310b");
				break;
			}
			case 3:
			{
				if(isdefined(level.var_75302c0e))
				{
					/#
						if(isdefined(level.var_db2a4bc9))
						{
							for(i = 0; i < level.var_db2a4bc9.pathpoints.size; i++)
							{
								circle(level.var_db2a4bc9.pathpoints[i], 6, (0, 0, 1), 1, 1, 1);
							}
						}
					#/
					var_e4547143 = vectornormalize(level.var_a7bd1c53 - self.origin);
					if(isdefined(level.var_db2a4bc9) && is_true(level.var_75302c0e))
					{
						if(level.var_8c02eebd === 0)
						{
							var_189f09c7 = level.var_f637e029[level.var_f637e029.size - 1];
						}
						else
						{
							if(level.var_cd1e3b1f === 0 || level.var_cd1e3b1f === 1)
							{
								var_189f09c7 = level.var_f637e029[0];
							}
							else
							{
								var_189f09c7 = level.var_f637e029[level.var_f637e029.size - 1];
							}
						}
						if(var_189f09c7 > level.var_679cf74b)
						{
							var_481d90dc = level.var_db2a4bc9.pathpoints[level.var_679cf74b];
							var_882aca32 = vectornormalize(var_481d90dc - self.origin);
							self.origin = self.origin + (var_882aca32 * 10);
							var_436b8c8c = level.var_db2a4bc9.pathpoints[level.var_679cf74b];
							var_436b8c8c = (var_436b8c8c[0], var_436b8c8c[1], self.origin[2]);
							if(distancesquared(var_436b8c8c, self.origin) < sqr(16))
							{
								if(level.var_679cf74b === (var_189f09c7 - 1))
								{
									if(level.var_cd1e3b1f === 0 || level.var_cd1e3b1f === 1)
									{
										level.var_df7b46d1.state = 1;
									}
									else
									{
										self.state = 5;
									}
									level.var_679cf74b = 1;
									level.var_75302c0e = undefined;
									level.var_db2a4bc9 = undefined;
									level.var_bc2071f = 0;
								}
								level.var_679cf74b++;
							}
						}
						else if(distancesquared(level.var_a7bd1c53, self.origin) < sqr(24))
						{
							if(level.var_cd1e3b1f === 0 || level.var_cd1e3b1f === 1)
							{
								level.var_df7b46d1.state = 1;
							}
							else
							{
								self.state = 5;
							}
							level.var_679cf74b = 1;
							level.var_75302c0e = undefined;
							level.var_db2a4bc9 = undefined;
							level.var_bc2071f = 0;
						}
					}
					else
					{
						self.origin = self.origin + (var_e4547143 * 10);
						if(distancesquared(level.var_a7bd1c53, self.origin) < sqr(16))
						{
							if(level.var_cd1e3b1f === 0 || level.var_cd1e3b1f === 1)
							{
								level.var_df7b46d1.state = 1;
							}
							else
							{
								self.state = 5;
							}
							level.var_679cf74b = 1;
							level.var_75302c0e = undefined;
							level.var_db2a4bc9 = undefined;
							level.var_bc2071f = 0;
						}
						if(isdefined(level.var_30be8d70))
						{
							[[level.var_30be8d70]]();
						}
					}
				}
				else
				{
					if(isdefined(level.var_15c1545d.objectiveanchor.var_8ea4667d))
					{
						level.var_a7bd1c53 = level.var_15c1545d.objectiveanchor.var_8ea4667d.origin;
					}
					else if(isdefined(level.var_15c1545d.objectiveanchor.origin))
					{
						level.var_a7bd1c53 = level.var_15c1545d.objectiveanchor.origin;
					}
					if(level.var_8c02eebd === 0 && level.var_cd1e3b1f !== 2)
					{
						level thread function_310986be();
						level.var_a7bd1c53 = level.var_9cf0f18d.origin;
					}
					if(level.var_cd1e3b1f === 1)
					{
						level.var_15c1545d.objectiveanchor clientfield::set("boss_zone_on_radar", 0);
						waitframe(1);
						level.var_15c1545d.objectiveanchor clientfield::set("boss_zone_on_radar", 1);
					}
					if(isdefined(level.var_a7bd1c53))
					{
						start_trace = groundtrace(self.origin + vectorscale((0, 0, 1), 16), self.origin + (vectorscale((0, 0, -1), 1000)), 0, self);
						var_c88c2124 = start_trace[#"position"];
						var_655e0ae3 = getclosestpointonnavmesh(var_c88c2124, 204, 16);
						var_f6fe68c = groundtrace(level.var_a7bd1c53 + vectorscale((0, 0, 1), 16), level.var_a7bd1c53 + (vectorscale((0, 0, -1), 1000)), 0, self);
						var_eaa2511c = var_f6fe68c[#"position"];
						var_39061289 = getclosestpointonnavmesh(var_eaa2511c, 204, 16);
						if(isdefined(var_655e0ae3) && isdefined(var_39061289))
						{
							level.var_db2a4bc9 = generatenavmeshpath(var_655e0ae3, var_39061289, self);
							/#
								println("" + var_39061289);
							#/
							if(!isdefined(level.var_db2a4bc9) || !isdefined(level.var_db2a4bc9.pathpoints) || level.var_db2a4bc9.pathpoints.size == 0)
							{
								/#
									recordsphere(var_39061289, 8, vectorscale((1, 1, 1), 0.1), "");
									println("");
								#/
								level.var_75302c0e = 0;
								if(!isdefined(level.var_cd1e3b1f))
								{
									level.var_cd1e3b1f = 1;
								}
								else
								{
									if(level.var_cd1e3b1f === 0)
									{
										level.var_cd1e3b1f = 1;
									}
									else
									{
										if(level.var_cd1e3b1f === 1)
										{
											level.var_cd1e3b1f = 2;
											if(level.var_9b7bd0e8 === 0)
											{
												level thread zm_vo::function_7622cb70(#"hash_534a8eea154bbf18", 0.7);
											}
											else
											{
												level thread zm_vo::function_7622cb70(#"hash_22531ed3b67a2a77", 0.7);
											}
										}
										else
										{
											level.var_cd1e3b1f = 0;
										}
									}
								}
							}
							else
							{
								level.var_75302c0e = 1;
								level.var_2b577e9f = 2;
								if(!isdefined(level.var_cd1e3b1f))
								{
									level.var_cd1e3b1f = 1;
								}
								else
								{
									if(level.var_cd1e3b1f === 0)
									{
										level.var_cd1e3b1f = 1;
									}
									else
									{
										if(level.var_cd1e3b1f === 1)
										{
											level.var_cd1e3b1f = 2;
											if(level.var_9b7bd0e8 === 0)
											{
												level thread zm_vo::function_7622cb70(#"hash_534a8eea154bbf18", 0.7);
											}
											else
											{
												level thread zm_vo::function_7622cb70(#"hash_22531ed3b67a2a77", 0.7);
											}
										}
										else
										{
											level.var_8c02eebd = 0;
											level.var_cd1e3b1f = 0;
										}
									}
								}
								if(level.var_cd1e3b1f !== 2 && level.var_8c02eebd === 0)
								{
									var_b50dfc6a = pathdistance(level.var_a7bd1c53, level.var_df7b46d1.origin);
									if(!isdefined(var_b50dfc6a))
									{
										var_b50dfc6a = distance(level.var_a7bd1c53, level.var_df7b46d1.origin);
									}
									if(var_b50dfc6a > 4896)
									{
										level.var_8c02eebd = 1;
									}
									else
									{
										level.var_8c02eebd = 0;
									}
								}
								if(level.var_cd1e3b1f === 0)
								{
									halfway_point = int(level.var_db2a4bc9.pathpoints.size / 3);
								}
								else
								{
									halfway_point = int(level.var_db2a4bc9.pathpoints.size / 2);
								}
								level.var_f637e029 = [1:level.var_db2a4bc9.pathpoints.size, 0:halfway_point];
							}
						}
						else
						{
							if(!isdefined(level.var_cd1e3b1f))
							{
								level.var_cd1e3b1f = 1;
							}
							else
							{
								if(level.var_cd1e3b1f === 0)
								{
									level.var_cd1e3b1f = 1;
								}
								else
								{
									if(level.var_cd1e3b1f === 1)
									{
										level.var_cd1e3b1f = 2;
									}
									else
									{
										level.var_cd1e3b1f = 0;
									}
								}
							}
							level.var_75302c0e = 0;
						}
					}
				}
				level notify(#"hash_7cd8474c6919310b");
				break;
			}
			case 5:
			{
				level.var_db2a4bc9 = undefined;
				level.var_75302c0e = undefined;
				level.var_679cf74b = 1;
				level notify(#"hash_4787b44eac7109dc");
				break;
			}
			case 6:
			{
				level thread function_46ff5efa();
				wait(17);
				level.var_df7b46d1.state = 3;
				break;
			}
			default:
			{
				break;
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_86d134a1
	Namespace: namespace_51f64aa9
	Checksum: 0xACC4F574
	Offset: 0x6B90
	Size: 0xF6
	Parameters: 0
	Flags: None
*/
function function_86d134a1()
{
	level endon(#"end_game");
	level.deathcircle.var_5c54ab33 = death_circle::function_a8749d88(self.origin, 1000, 5, 1);
	level thread death_circle::function_dc15ad60(level.deathcircle.var_5c54ab33);
	while(true)
	{
		level.circle_radius = 1000;
		if(isdefined(level.deathcircle.var_5c54ab33))
		{
			death_circle::function_9229c3b3(level.deathcircle.var_5c54ab33, level.circle_radius, self.origin, 0);
		}
		waitframe(1);
	}
}

/*
	Name: function_c6121618
	Namespace: namespace_51f64aa9
	Checksum: 0x916AA744
	Offset: 0x6C90
	Size: 0x7E
	Parameters: 15
	Flags: None
*/
function function_c6121618(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	return false;
}

/*
	Name: function_81c192d
	Namespace: namespace_51f64aa9
	Checksum: 0x8C32A112
	Offset: 0x6D18
	Size: 0x4E4
	Parameters: 0
	Flags: None
*/
function function_81c192d()
{
	if(isdefined(level.var_df7b46d1))
	{
		return;
	}
	players = getplayers();
	var_bb96c5ab = players[0].origin;
	var_f21608fd = players[0].angles;
	player_dir = anglestoforward(var_f21608fd);
	var_37246f9a = tacticalquery("onslaught_tacticalquery", var_bb96c5ab, players[0]);
	if(isdefined(var_37246f9a))
	{
		var_aa93fa5f = undefined;
		var_2b0712b6 = 1;
		var_96b60b86 = 2000;
		goal_distance = 200;
		for(i = 0; i < var_37246f9a.size; i++)
		{
			tacpoint = var_37246f9a[i];
			var_152be849 = vectornormalize(tacpoint.origin - var_bb96c5ab);
			dotproduct = vectordot(var_152be849, player_dir);
			if(dotproduct > 0.8)
			{
				dist_from_player = distance(var_bb96c5ab, tacpoint.origin);
				var_a7c3e3da = abs(goal_distance - dist_from_player);
				if(var_a7c3e3da < var_96b60b86)
				{
					var_96b60b86 = var_a7c3e3da;
					var_2b0712b6 = dotproduct;
					var_aa93fa5f = tacpoint;
				}
			}
		}
		var_9c387409 = var_aa93fa5f.origin;
	}
	else
	{
		var_e2086fe4 = anglestoforward(var_f21608fd);
		spawnpoint = var_bb96c5ab + (var_e2086fe4 * 300);
		var_56045f3b = groundtrace(spawnpoint + vectorscale((0, 0, 1), 200), spawnpoint + (vectorscale((0, 0, -1), 1000)), 0, undefined);
		var_9c387409 = var_56045f3b[#"position"];
	}
	if(!isdefined(var_9c387409))
	{
		pos = getclosestpointonnavmesh(var_bb96c5ab, 32, 16);
		if(isdefined(pos))
		{
			var_9c387409 = pos;
		}
		else
		{
			var_9c387409 = var_bb96c5ab;
		}
	}
	level.var_8c02eebd = 0;
	level.var_df7b46d1 = spawnvehicle("onslaught_orb_zm", var_9c387409, (0, 0, 0));
	level.var_df7b46d1 connectpaths();
	level.var_df7b46d1 function_d733412a(0);
	level.var_df7b46d1.var_48fcd26a = spawn("script_model", level.var_df7b46d1.origin);
	level.var_df7b46d1.var_48fcd26a setmodel("tag_origin");
	level.var_df7b46d1.var_48fcd26a thread function_6362d51(level.var_df7b46d1);
	level.var_df7b46d1.var_48fcd26a clientfield::set("orb_spawn", 1);
	level.var_df7b46d1.state = 0;
	level.var_df7b46d1.takedamage = 0;
	level.var_df7b46d1.overridevehicledamage = &function_c6121618;
	level.var_df7b46d1 hide();
	level.var_df7b46d1 thread bot_update();
	level.var_df7b46d1 thread function_86d134a1();
	level.var_df7b46d1 thread function_168569b2();
	level thread function_d6923f19();
}

/*
	Name: function_168569b2
	Namespace: namespace_51f64aa9
	Checksum: 0xDE173D7C
	Offset: 0x7208
	Size: 0xB0
	Parameters: 0
	Flags: None
*/
function function_168569b2()
{
	self endon(#"death");
	while(true)
	{
		level waittill(#"hash_4787b44eac7109dc");
		level.var_df7b46d1.var_48fcd26a playsound(#"hash_7f80b7729c2b0778");
		level waittill(#"hash_7cd8474c6919310b");
		level.var_df7b46d1.var_48fcd26a playsound(#"hash_76a949af6c568989");
	}
}

/*
	Name: function_6362d51
	Namespace: namespace_51f64aa9
	Checksum: 0x95C7571F
	Offset: 0x72C0
	Size: 0x454
	Parameters: 1
	Flags: None
*/
function function_6362d51(parent)
{
	level endon(#"end_game");
	var_7ae0f9f6 = 1;
	var_66924182 = 1;
	x_sign = 1;
	y_sign = 1;
	self.origin = parent.origin + vectorscale((0, 0, 1), 68);
	while(true)
	{
		if(level.var_df7b46d1.state === 3 || level.var_df7b46d1.state === 1)
		{
			if(var_7ae0f9f6 === 1)
			{
				if(level.var_df7b46d1.state === 3)
				{
					var_d114ee3c = 20;
					var_66924182 = var_66924182 * -1;
					var_fe23b0e8 = (0, 0, var_d114ee3c * var_66924182);
					var_7ae0f9f6 = 0;
				}
				else
				{
					var_d114ee3c = 10;
					var_3aad51c8 = randomfloat(4);
					var_c473d11c = randomfloat(4);
					x_sign = x_sign * -1;
					y_sign = y_sign * -1;
					var_66924182 = var_66924182 * -1;
					var_fe23b0e8 = (var_3aad51c8 * x_sign, var_c473d11c * y_sign, var_d114ee3c * var_66924182);
					var_7ae0f9f6 = 0;
				}
			}
			var_395d24d1 = parent.origin + vectorscale((0, 0, 1), 68);
			target_pos = var_395d24d1 + var_fe23b0e8;
			var_e4547143 = vectornormalize(target_pos - var_395d24d1);
			dist = distancesquared(self.origin, target_pos);
			if(level.var_df7b46d1.state === 3)
			{
				if(dist > sqr(36))
				{
					speed = 6;
				}
				else
				{
					speed = 2;
				}
				var_e2341364 = 16;
			}
			else
			{
				speed = dist / sqr(16);
				var_e2341364 = 6;
			}
			var_591f5a95 = vectornormalize(target_pos - self.origin);
			var_436b8c8c = target_pos;
			var_436b8c8c = (var_436b8c8c[0], var_436b8c8c[1], self.origin[2]);
			dist = distancesquared(target_pos, self.origin);
			if(level.var_df7b46d1.state === 3)
			{
				self.origin = self.origin + ((var_591f5a95[0], var_591f5a95[1], 0) * 20);
				self.origin = self.origin + ((0, 0, var_591f5a95[2]) * speed);
				if(abs(self.origin[2] - target_pos[2]) < 8)
				{
					var_7ae0f9f6 = 1;
				}
			}
			else
			{
				self.origin = self.origin + (var_591f5a95 * speed);
				if(dist < sqr(var_e2341364))
				{
					var_7ae0f9f6 = 1;
				}
			}
		}
		else
		{
			self.origin = parent.origin + vectorscale((0, 0, 1), 68);
		}
		waitframe(1);
	}
}

/*
	Name: function_3be471a2
	Namespace: namespace_51f64aa9
	Checksum: 0x209B5332
	Offset: 0x7720
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function function_3be471a2(var_78664f9a)
{
	circle_radius = 1000;
	if(!level.deathcircle.enabled)
	{
		return;
	}
	level thread function_6d6a276c(circle_radius);
	if(is_true(var_78664f9a))
	{
		if(!isdefined(level.var_d4c0ef1a) || level.var_d4c0ef1a.size > 0)
		{
			if(level.var_df7b46d1.state !== 3)
			{
				level.var_df7b46d1.state = 3;
				level.var_679cf74b = 1;
				level.var_75302c0e = undefined;
				level.var_db2a4bc9 = undefined;
			}
			while(level.var_bc2071f > 0)
			{
				wait(0.1);
			}
		}
		if(level.var_df7b46d1.state != 5 && level.var_df7b46d1.state != 1)
		{
			level.var_df7b46d1.state = 1;
		}
		level.var_bc2071f = 0;
	}
}

/*
	Name: function_6ea2e9fa
	Namespace: namespace_51f64aa9
	Checksum: 0x2216128D
	Offset: 0x7880
	Size: 0x34A
	Parameters: 0
	Flags: None
*/
function function_6ea2e9fa()
{
	/#
		level endon(#"end_game");
		color = (0, 1, 0);
		var_457e9ab8 = (1, 0, 0);
		var_3045d5d6 = (0, 0, 1);
		duration = 1;
		while(true)
		{
			var_d1803e09 = level.var_df7b46d1.origin;
			for(i = 0; i < 10; i++)
			{
				drawcross(var_d1803e09 + (0, 0, i * 10), var_3045d5d6, duration);
			}
			foreach(var_2d5745a8 in level.var_d4c0ef1a)
			{
				if(is_true(level.var_2b37d0dd))
				{
					var_188f8bf = distance2d(var_d1803e09, var_2d5745a8.origin);
					print3d(var_2d5745a8.origin + vectorscale((0, 0, 1), 200), var_188f8bf, var_3045d5d6, 1, 4, duration, 1);
					print3d(var_2d5745a8.origin + vectorscale((0, 0, 1), 240), var_2d5745a8.usecount, var_3045d5d6, 1, 2, duration, 1);
					if(isdefined(level.var_771d8317))
					{
						if(var_188f8bf > level.var_771d8317)
						{
							print3d(var_2d5745a8.origin + vectorscale((0, 0, 1), 300), "", var_3045d5d6, 1, 2, duration, 1);
						}
					}
					if(is_true(var_2d5745a8.is_active))
					{
						for(i = 0; i < 20; i++)
						{
							drawcross(var_2d5745a8.origin + (0, 0, i * 10), var_457e9ab8, duration);
						}
						continue;
					}
					for(i = 0; i < 10; i++)
					{
						drawcross(var_2d5745a8.origin + (0, 0, i * 10), color, duration);
					}
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: setup_zones
	Namespace: namespace_51f64aa9
	Checksum: 0x5487A1D5
	Offset: 0x7BD8
	Size: 0x24C
	Parameters: 0
	Flags: None
*/
function setup_zones()
{
	if(!isdefined(level.var_d4c0ef1a))
	{
		return undefined;
	}
	for(i = 0; i < level.var_d4c0ef1a.size; i++)
	{
		zone = level.var_d4c0ef1a[i];
		nodes = tacticalquery("onslaught_boss_spawn_tacticalquery", zone.origin, zone);
		if(nodes.size == 0)
		{
			arrayremoveindex(level.var_d4c0ef1a, i);
			continue;
		}
		count = 0;
		while(true)
		{
			count++;
			random_index = randomintrange(0, nodes.size);
			var_994bab50 = getclosestpointonnavmesh(nodes[random_index].origin, 64);
			if(isdefined(var_994bab50))
			{
				break;
			}
			else if(count >= nodes.size)
			{
				random_index = 0;
			}
		}
		zone.objectiveanchor = spawn("script_model", nodes[random_index].origin);
		zone.objectiveanchor.var_4007e393 = zone.origin;
		zone.objectiveanchor setmodel("tag_origin");
		zone.objectiveanchor.var_8ea4667d = nodes[random_index];
		zone.objectiveanchor clientfield::set("boss_zone_on_radar", 0);
	}
	if(isdefined(level.var_d4c0ef1a) && level.var_d4c0ef1a.size > 0)
	{
		level thread function_f19e31a2();
		/#
			level thread function_6ea2e9fa();
		#/
	}
}

/*
	Name: function_582988d8
	Namespace: namespace_51f64aa9
	Checksum: 0xF881877B
	Offset: 0x7E30
	Size: 0x1DA
	Parameters: 1
	Flags: None
*/
function function_582988d8(zone)
{
	if(isdefined(zone.objectiveanchor.var_4007e393))
	{
		var_a7bd1c53 = zone.objectiveanchor.var_4007e393;
	}
	else
	{
		var_a7bd1c53 = zone.origin;
	}
	nodes = tacticalquery("onslaught_boss_spawn_tacticalquery", var_a7bd1c53, zone);
	if(nodes.size == 0)
	{
		return;
	}
	count = 0;
	while(true)
	{
		count++;
		random_index = randomintrange(0, nodes.size);
		var_994bab50 = getclosestpointonnavmesh(nodes[random_index].origin, 64);
		if(isdefined(var_994bab50))
		{
			break;
		}
		else if(count >= nodes.size)
		{
			random_index = 0;
		}
	}
	if(isdefined(zone.objectiveanchor))
	{
		zone.objectiveanchor.origin = nodes[random_index].origin;
	}
	else
	{
		zone.objectiveanchor = spawn("script_model", nodes[random_index].origin);
		zone.objectiveanchor setmodel("tag_origin");
		zone.objectiveanchor clientfield::set("boss_zone_on_radar", 0);
	}
	zone.objectiveanchor.var_8ea4667d = nodes[random_index];
}

/*
	Name: function_10986874
	Namespace: namespace_51f64aa9
	Checksum: 0x9250706
	Offset: 0x8018
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function function_10986874(var_c2f7b1a3)
{
	level endon(#"end_game");
	level notify(#"hash_5731a6df491c37c7", {#location:var_c2f7b1a3});
	wait(0.5);
}

/*
	Name: function_f19e31a2
	Namespace: namespace_51f64aa9
	Checksum: 0x114FCA55
	Offset: 0x8078
	Size: 0x5C8
	Parameters: 0
	Flags: None
*/
function function_f19e31a2()
{
	level endon(#"end_game");
	level.var_90295a46 = -1;
	level.var_771d8317 = 512;
	while(true)
	{
		level flag::wait_till("onslaught_round_logic_complete");
		level thread function_310986be();
		if(!isdefined(level.var_9cf0f18d))
		{
			/#
				println("" + level.var_9cf0f18d.origin);
			#/
			continue;
		}
		/#
			println("" + level.var_9cf0f18d.origin);
		#/
		level thread function_10986874(level.var_9cf0f18d.origin);
		while(level.var_df7b46d1.state != 5)
		{
			waitframe(1);
		}
		/#
			debug2dtext((1000, 700, 0), "", (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 200);
		#/
		/#
			println("" + level.var_9cf0f18d.origin);
		#/
		/#
			debug2dtext((1000, 700, 0), "", (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 200);
		#/
		level.var_15c1545d.objectiveanchor clientfield::set("boss_zone_on_radar", 2);
		wait(2);
		if(level.var_9b7bd0e8 === 0)
		{
			level thread zm_vo::function_7622cb70(#"hash_514a3b399c691364", 0.5, 1);
		}
		level.var_9cf0f18d thread function_3fd720cc();
		level.var_6d24574d = 1;
		wait(4);
		level function_a2f55e89();
		/#
			debug2dtext((1000, 700, 0), "", (1, 1, 1), 1, (0, 0, 0), 0.5, 2.8, 200);
		#/
		level.var_15c1545d.objectiveanchor clientfield::set("boss_zone_on_radar", 3);
		zm_sq::objective_complete(#"hash_641e9c4d20df5950");
		/#
			println("" + level.var_9cf0f18d.origin);
		#/
		level.var_4095f78b = spawnactor(function_2f6706d2(), level.var_9cf0f18d.origin, (0, 0, 0));
		level.var_4095f78b function_6c40ff50();
		level.var_4095f78b thread function_c08eb1c4();
		level.var_4095f78b thread function_a371376();
		if(level.var_9b7bd0e8 > 0)
		{
			level.var_4095f78b thread function_32a5425();
		}
		if(level.var_9b7bd0e8 !== 0)
		{
			level thread zm_vo::function_7622cb70(#"hash_482f677bdbe28fd1", 1.7, 1);
		}
		level.var_4095f78b thread function_b5ba566b(level.var_4095f78b.origin, level.var_4095f78b.angles, "ai_t9_zm_steiner_base_com_stn_pain_ww_idle_loop_01");
		level waittill(#"hash_1b8264e950c01344");
		level.var_6d24574d = 0;
		level function_a2f55e89();
		level.var_90295a46 = level.var_b92db9a8;
		level.var_15c1545d.is_active = 0;
		level.var_15c1545d.objectiveanchor clientfield::set("boss_zone_on_radar", 0);
		level.var_df7b46d1.state = 6;
		if(level.var_9b7bd0e8 === 1)
		{
			level thread zm_vo::function_7622cb70(#"hash_2e75932f6eedc934", 4, 1);
		}
		else
		{
			level zm_vo::function_7622cb70(#"hash_83f9a444e5f5963", 4);
		}
	}
}

/*
	Name: function_310986be
	Namespace: namespace_51f64aa9
	Checksum: 0x2C9FCB7E
	Offset: 0x8648
	Size: 0x518
	Parameters: 0
	Flags: None
*/
function function_310986be()
{
	var_d1803e09 = level.var_df7b46d1.origin;
	var_9a582a58 = undefined;
	if(!isdefined(level.var_1eba154a) || level.var_1eba154a.size === 0)
	{
		level.var_1eba154a = [];
		for(i = 0; i < level.var_d4c0ef1a.size; i++)
		{
			if(!isdefined(level.var_1eba154a))
			{
				level.var_1eba154a = [];
			}
			else if(!isarray(level.var_1eba154a))
			{
				level.var_1eba154a = array(level.var_1eba154a);
			}
			if(!isinarray(level.var_1eba154a, level.var_d4c0ef1a[i]))
			{
				level.var_1eba154a[level.var_1eba154a.size] = level.var_d4c0ef1a[i];
			}
		}
	}
	if(!isdefined(level.var_6b49c914) || level.var_6b49c914.size === level.var_d4c0ef1a.size)
	{
		level.var_6b49c914 = [];
	}
	if(isdefined(level.var_15c1545d))
	{
		level.var_15c1545d.used_recently = 0;
	}
	var_9a582a58 = randomint(level.var_1eba154a.size);
	var_2f31324d = level.var_1eba154a[var_9a582a58];
	if(level.var_cd1e3b1f === 1)
	{
		var_b50dfc6a = pathdistance(var_d1803e09, var_2f31324d.objectiveanchor.origin);
		if(!isdefined(var_b50dfc6a))
		{
			var_b50dfc6a = distance(var_d1803e09, var_2f31324d.objectiveanchor.origin);
		}
		if(var_b50dfc6a > 4896)
		{
			if(level.var_1eba154a.size > 1)
			{
				var_7a3b2fd5 = arraysortclosest(level.var_1eba154a, var_d1803e09);
				if(is_true(var_7a3b2fd5[0].used_recently) && var_7a3b2fd5.size > 1)
				{
					var_9a582a58 = 1;
				}
				else
				{
					var_9a582a58 = 0;
				}
				var_2f31324d = level.var_1eba154a[var_9a582a58];
			}
			else
			{
				var_24f1be34 = arraysortclosest(level.var_6b49c914, var_d1803e09);
				if(isdefined(level.var_15c1545d))
				{
					arrayremovevalue(var_24f1be34, level.var_15c1545d);
				}
				if(is_true(var_24f1be34[0].used_recently) && var_24f1be34.size > 1)
				{
					var_2f31324d = var_24f1be34[1];
				}
				else
				{
					var_2f31324d = var_24f1be34[0];
				}
			}
		}
		else
		{
			var_2f31324d = level.var_1eba154a[var_9a582a58];
		}
	}
	level.var_15c1545d = var_2f31324d;
	if(!isdefined(level.var_6b49c914))
	{
		level.var_6b49c914 = [];
	}
	else if(!isarray(level.var_6b49c914))
	{
		level.var_6b49c914 = array(level.var_6b49c914);
	}
	if(!isinarray(level.var_6b49c914, level.var_15c1545d))
	{
		level.var_6b49c914[level.var_6b49c914.size] = level.var_15c1545d;
	}
	if(isdefined(var_9a582a58))
	{
		arrayremoveindex(level.var_1eba154a, var_9a582a58);
	}
	level.var_15c1545d.used_recently = 1;
	level.var_15c1545d.is_active = 1;
	level.var_15c1545d.usecount = level.var_15c1545d.usecount + 1;
	level function_582988d8(level.var_15c1545d);
	level.var_9cf0f18d = level.var_15c1545d.objectiveanchor.var_8ea4667d;
}

/*
	Name: function_32a5425
	Namespace: namespace_51f64aa9
	Checksum: 0x655B1BBE
	Offset: 0x8B68
	Size: 0x78
	Parameters: 0
	Flags: None
*/
function function_32a5425()
{
	level endon(#"end_game", #"hash_1b8264e950c01344");
	while(true)
	{
		spawn_zombie(1000, 500, 400, 1);
		wait(0.1);
	}
}

/*
	Name: function_b504f826
	Namespace: namespace_51f64aa9
	Checksum: 0xFF64D1CA
	Offset: 0x8BE8
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_b504f826()
{
	level endon(#"end_game");
	while(true)
	{
		wait(0.5);
	}
}

/*
	Name: function_31add0ec
	Namespace: namespace_51f64aa9
	Checksum: 0xC694FCD1
	Offset: 0x8C20
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_31add0ec()
{
	level endon(#"end_game");
	while(true)
	{
		wait(0.5);
	}
}

/*
	Name: function_69e5b9b
	Namespace: namespace_51f64aa9
	Checksum: 0xF15B0474
	Offset: 0x8C58
	Size: 0x520
	Parameters: 0
	Flags: None
*/
function function_69e5b9b()
{
	level endon(#"end_game");
	level.var_d5dc0bf2 = (0, 0, 0);
	level thread function_b504f826();
	level thread function_31add0ec();
	music::setmusicstate("onslaught_pregame");
	level flag::wait_till("rounds_started");
	level setup_zones();
	level.var_3e67b08d = 0.6;
	level.var_5bc110b3 = 4;
	level.var_d2a573c6 = 4;
	level.var_b4b52d95 = 3;
	level.total_zombies_killed = 0;
	level.var_9b7bd0e8 = 0;
	music::setmusicstate("intro");
	level function_a2f55e89();
	function_c50adb68(1);
	level thread function_453afff4();
	level thread game_over();
	level thread function_3be471a2(0);
	while(true)
	{
		players = getplayers();
		foreach(player in players)
		{
			player thread function_da556d60();
			player function_a7a4f67f(level.var_9b7bd0e8);
		}
		wait(level.var_d2a573c6);
		level.var_df7b46d1.var_48fcd26a playsound(#"hash_7abe3d8888674c46");
		level function_a2f55e89();
		while(level.var_df7b46d1.state == 5 || level.var_df7b46d1.state == 6)
		{
			level.var_dc554d4b = 1;
			level.boss_round = 1;
			waitframe(1);
		}
		level.run_timer = 1;
		level flag::set("onslaught_round_logic_inprogress");
		self thread function_7f501c21();
		level flag::wait_till("onslaught_round_logic_complete");
		level.run_timer = 0;
		level function_a2f55e89(1);
		if(!is_true(level.var_dc554d4b === 1))
		{
		}
		else
		{
			level.var_dc554d4b = undefined;
		}
		if(level.var_df7b46d1.state == 1)
		{
			level thread function_46ff5efa();
		}
		else if(level.var_df7b46d1.state == 3)
		{
			level function_3be471a2(1);
		}
		wait(4);
		if(level.var_df7b46d1.state != 3)
		{
			level function_3be471a2(1);
		}
		wait(level.var_b4b52d95);
		level notify(#"hash_5797e93787e36c6d");
		level callback::callback(#"hash_5118a91e667446ee");
		if(!is_true(level.boss_round))
		{
			zm_round_logic::set_round_number(level.round_number + 1);
		}
		else
		{
			level.boss_round = undefined;
		}
		function_c50adb68(level.wave_number + 1);
	}
}

/*
	Name: function_320145f7
	Namespace: namespace_51f64aa9
	Checksum: 0x2473E8F3
	Offset: 0x9180
	Size: 0x2C2
	Parameters: 1
	Flags: Event
*/
event function_320145f7(eventstruct)
{
	if(isdefined(self.var_b467f3a1))
	{
		self thread [[self.var_b467f3a1]](eventstruct);
		return;
	}
	notify_string = eventstruct.action;
	switch(notify_string)
	{
		case "death":
		{
			if(is_true(self.bgb_tone_death))
			{
				level thread zmbaivox_playvox(self, "death_whimsy", 1, 4);
			}
			else
			{
				if(is_true(self.sinkhole_charges_detonatedteleportterminate))
				{
					level thread zmbaivox_playvox(self, "death_quack", 1, 4);
				}
				else
				{
					level thread zmbaivox_playvox(self, notify_string, 1, 4);
				}
			}
			break;
		}
		case "pain":
		{
			level thread zmbaivox_playvox(self, notify_string, 1, 3);
			break;
		}
		case "behind":
		{
			level thread zmbaivox_playvox(self, notify_string, 1, 3);
			break;
		}
		case "electrocute":
		{
			level thread zmbaivox_playvox(self, notify_string, 1, 3);
			break;
		}
		case "attack_melee_notetrack":
		{
			level thread zmbaivox_playvox(self, "attack_melee", 1, 2, 1);
			break;
		}
		case "sprint":
		case "ambient":
		case "crawler":
		case "teardown":
		case "taunt":
		{
			level thread zmbaivox_playvox(self, notify_string, 0, 1);
			break;
		}
		case "attack_melee":
		{
			break;
		}
		default:
		{
			level thread zmbaivox_playvox(self, notify_string, 0, 2);
			break;
		}
	}
}

/*
	Name: zmbaivox_notifyconvert
	Namespace: namespace_51f64aa9
	Checksum: 0x72B3A9B0
	Offset: 0x9450
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function zmbaivox_notifyconvert()
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	self thread zmbaivox_playdeath();
	self thread zmbaivox_playelectrocution();
}

/*
	Name: zmbaivox_playvox
	Namespace: namespace_51f64aa9
	Checksum: 0xE8F396B8
	Offset: 0x94C0
	Size: 0x38A
	Parameters: 5
	Flags: None
*/
function zmbaivox_playvox(zombie, type, override, priority, delayambientvox)
{
	if(!isdefined(delayambientvox))
	{
		delayambientvox = 0;
	}
	zombie endon(#"death");
	if(!isdefined(zombie))
	{
		return;
	}
	if(!isdefined(zombie.voiceprefix))
	{
		return;
	}
	if(!isdefined(priority))
	{
		priority = 1;
	}
	if(!isdefined(zombie.talking))
	{
		zombie.talking = 0;
	}
	if(!isdefined(zombie.currentvoxpriority))
	{
		zombie.currentvoxpriority = 1;
	}
	if(!isdefined(self.delayambientvox))
	{
		self.delayambientvox = 0;
	}
	if(is_true(zombie.var_e8920729))
	{
		return;
	}
	if(type == "ambient" || type == "sprint" || type == "crawler" && is_true(self.delayambientvox))
	{
		return;
	}
	if(delayambientvox)
	{
		self.delayambientvox = 1;
		self thread zmbaivox_ambientdelay();
	}
	alias = (("zmb_vocals_" + zombie.voiceprefix) + "_") + type;
	if(sndisnetworksafe())
	{
		if(is_true(override))
		{
			if(isdefined(zombie.currentvox) && priority > zombie.currentvoxpriority)
			{
				zombie stopsound(zombie.currentvox);
				waitframe(1);
			}
			if(type == "death" || type == "death_whimsy" || type == "death_nohead")
			{
				zombie playsound(alias);
				return;
			}
		}
		if(zombie.talking === 1 && (priority < zombie.currentvoxpriority || priority === 1))
		{
			return;
		}
		if(is_true(zombie.head_gibbed))
		{
			return;
		}
		zombie.talking = 1;
		zombie.currentvox = alias;
		zombie.currentvoxpriority = priority;
		zombie playsoundontag(alias, "j_head");
		playbacktime = float(max((isdefined(soundgetplaybacktime(alias)) ? soundgetplaybacktime(alias) : 500), 500)) / 1000;
		wait(playbacktime);
		zombie.talking = 0;
		zombie.currentvox = undefined;
		zombie.currentvoxpriority = 1;
	}
}

/*
	Name: zmbaivox_playdeath
	Namespace: namespace_51f64aa9
	Checksum: 0x6550BC99
	Offset: 0x9858
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function zmbaivox_playdeath()
{
	self endon(#"disconnect");
	self waittill(#"death");
	if(isdefined(self))
	{
		if(is_true(self.bgb_tone_death))
		{
			level thread zmbaivox_playvox(self, "death_whimsy", 1);
		}
		else
		{
			if(is_true(self.head_gibbed))
			{
				level thread zmbaivox_playvox(self, "death_nohead", 1);
			}
			else
			{
				level thread zmbaivox_playvox(self, "death", 1);
			}
		}
	}
}

/*
	Name: zmbaivox_playelectrocution
	Namespace: namespace_51f64aa9
	Checksum: 0xA9614070
	Offset: 0x9948
	Size: 0x11A
	Parameters: 0
	Flags: None
*/
function zmbaivox_playelectrocution()
{
	self endon(#"disconnect", #"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		weapon = waitresult.weapon;
		if(!isdefined(weapon))
		{
			continue;
		}
		if(weapon.name === #"zombie_beast_lightning_dwl" || weapon.name === #"zombie_beast_lightning_dwl2" || weapon.name === #"zombie_beast_lightning_dwl3")
		{
			function_6eac4ca1(self, "electrocute");
			self notify(#"bhtn_action_notify", {#action:"electrocute"});
		}
	}
}

/*
	Name: zmbaivox_ambientdelay
	Namespace: namespace_51f64aa9
	Checksum: 0x30EFCA43
	Offset: 0x9A70
	Size: 0x5A
	Parameters: 0
	Flags: None
*/
function zmbaivox_ambientdelay()
{
	self notify(#"sndambientdelay");
	self endon(#"sndambientdelay", #"death", #"disconnect");
	wait(2);
	self.delayambientvox = 0;
}

/*
	Name: networksafereset
	Namespace: namespace_51f64aa9
	Checksum: 0x1744E6F5
	Offset: 0x9AD8
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function networksafereset()
{
	while(true)
	{
		level._numzmbaivox = 0;
		util::wait_network_frame();
	}
}

/*
	Name: sndisnetworksafe
	Namespace: namespace_51f64aa9
	Checksum: 0x3395F31C
	Offset: 0x9B10
	Size: 0x54
	Parameters: 0
	Flags: None
*/
function sndisnetworksafe()
{
	if(!isdefined(level._numzmbaivox))
	{
		level thread networksafereset();
	}
	if(level._numzmbaivox >= 2)
	{
		return false;
	}
	level._numzmbaivox++;
	return true;
}

/*
	Name: get_zombie_array
	Namespace: namespace_51f64aa9
	Checksum: 0xD2CC03FF
	Offset: 0x9B70
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function get_zombie_array()
{
	enemies = getaiarchetypearray(#"zombie");
	return enemies;
}

/*
	Name: function_4f20e746
	Namespace: namespace_51f64aa9
	Checksum: 0xA61FE5DB
	Offset: 0x9BB0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_4f20e746()
{
	enemies = getaiarchetypearray(#"zombie_dog");
	return enemies;
}

/*
	Name: function_5ded2774
	Namespace: namespace_51f64aa9
	Checksum: 0x7F294B6D
	Offset: 0x9BF0
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_5ded2774()
{
	enemies = get_zombie_array();
	var_b56897f8 = function_4f20e746();
	return var_b56897f8.size + enemies.size;
}

/*
	Name: is_last_zombie
	Namespace: namespace_51f64aa9
	Checksum: 0x3E5CEF89
	Offset: 0x9C48
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function is_last_zombie()
{
	if(function_5ded2774() <= 1)
	{
		return true;
	}
	return false;
}

/*
	Name: getyaw
	Namespace: namespace_51f64aa9
	Checksum: 0xF08E1A83
	Offset: 0x9C78
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: getyawtospot
	Namespace: namespace_51f64aa9
	Checksum: 0x8AA7F076
	Offset: 0x9CC0
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function getyawtospot(spot)
{
	pos = spot;
	yaw = self.angles[1] - getyaw(pos);
	yaw = angleclamp180(yaw);
	return yaw;
}

/*
	Name: zombie_behind_vox
	Namespace: namespace_51f64aa9
	Checksum: 0xD8619D33
	Offset: 0x9D30
	Size: 0x364
	Parameters: 0
	Flags: None
*/
function zombie_behind_vox()
{
	level endon(#"unloaded");
	self endon(#"death", #"disconnect");
	if(!isdefined(level._zbv_vox_last_update_time))
	{
		level._zbv_vox_last_update_time = 0;
		level._audio_zbv_shared_ent_list = get_zombie_array();
	}
	while(true)
	{
		wait(1);
		t = gettime();
		if(t > level._zbv_vox_last_update_time + 1000)
		{
			level._zbv_vox_last_update_time = t;
			level._audio_zbv_shared_ent_list = get_zombie_array();
		}
		zombs = level._audio_zbv_shared_ent_list;
		played_sound = 0;
		for(i = 0; i < zombs.size; i++)
		{
			if(!isdefined(zombs[i]))
			{
				continue;
			}
			if(zombs[i].isdog)
			{
				continue;
			}
			dist = 150;
			z_dist = 50;
			alias = level.vox_behind_zombie;
			if(isdefined(zombs[i].zombie_move_speed))
			{
				switch(zombs[i].zombie_move_speed)
				{
					case "walk":
					{
						dist = 150;
						break;
					}
					case "run":
					{
						dist = 175;
						break;
					}
					case "sprint":
					{
						dist = 200;
						break;
					}
				}
			}
			if(distancesquared(zombs[i].origin, self.origin) < dist * dist)
			{
				yaw = self getyawtospot(zombs[i].origin);
				z_diff = self.origin[2] - zombs[i].origin[2];
				if(yaw < -95 || yaw > 95 && abs(z_diff) < 50)
				{
					wait(0.1);
					if(isdefined(zombs[i]) && isalive(zombs[i]))
					{
						function_6eac4ca1(zombs[i], "behind");
						zombs[i] notify(#"bhtn_action_notify", {#action:"behind"});
						played_sound = 1;
					}
					break;
				}
			}
		}
		if(played_sound)
		{
			wait(2.5);
		}
	}
}

/*
	Name: play_ambient_zombie_vocals
	Namespace: namespace_51f64aa9
	Checksum: 0xE3C7A2A5
	Offset: 0xA0A0
	Size: 0x170
	Parameters: 0
	Flags: None
*/
function play_ambient_zombie_vocals()
{
	self endon(#"death");
	while(true)
	{
		type = "ambient";
		float = 3;
		if(isdefined(self.zombie_move_speed))
		{
			switch(self.zombie_move_speed)
			{
				case "walk":
				{
					type = "ambient";
					float = 3;
					break;
				}
				case "run":
				{
					type = "sprint";
					float = 3;
					break;
				}
				case "sprint":
				{
					type = "sprint";
					float = 3;
					break;
				}
			}
		}
		if(is_true(self.missinglegs))
		{
			float = 2;
			type = "crawler";
		}
		function_6eac4ca1(self, type);
		self notify(#"bhtn_action_notify", {#action:type});
		wait(randomfloatrange(1, float));
	}
}

/*
	Name: function_713192b1
	Namespace: namespace_51f64aa9
	Checksum: 0x92A97A3E
	Offset: 0xA218
	Size: 0x98
	Parameters: 2
	Flags: None
*/
function function_713192b1(str_location, var_39acfdda)
{
	if(!isdefined(level.var_cbcee8da))
	{
		level.var_cbcee8da = [];
	}
	if(!isdefined(level.var_b2a9a8d7))
	{
		level.var_b2a9a8d7 = [];
	}
	if(!isdefined(level.var_cbcee8da[var_39acfdda]))
	{
		level.var_cbcee8da[var_39acfdda] = 0;
	}
	if(!isdefined(level.var_b2a9a8d7[str_location]))
	{
		level.var_b2a9a8d7[str_location] = var_39acfdda;
	}
}

/*
	Name: location_vox
	Namespace: namespace_51f64aa9
	Checksum: 0x6DBDC614
	Offset: 0xA2B8
	Size: 0x100
	Parameters: 1
	Flags: None
*/
function location_vox(str_location)
{
	if(!isdefined(level.var_b2a9a8d7))
	{
		return;
	}
	if(!isdefined(level.var_b2a9a8d7[str_location]))
	{
		return;
	}
	var_39acfdda = level.var_b2a9a8d7[str_location];
	if(!isdefined(self.var_cbcee8da))
	{
		self.var_cbcee8da = [];
	}
	if(!isdefined(self.var_cbcee8da[var_39acfdda]))
	{
		self.var_cbcee8da[var_39acfdda] = 0;
	}
	if(!level.var_cbcee8da[var_39acfdda] && !self.var_cbcee8da[var_39acfdda])
	{
		self.var_cbcee8da[var_39acfdda] = 1;
		b_played = 0;
		if(is_true(b_played))
		{
			level.var_cbcee8da[var_39acfdda] = 1;
		}
	}
}

/*
	Name: get_number_variants
	Namespace: namespace_51f64aa9
	Checksum: 0x7EBD5CEF
	Offset: 0xA3C0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function get_number_variants(aliasprefix)
{
	for(i = 0; i < 20; i++)
	{
		if(!soundexists((aliasprefix + "_") + i))
		{
			return i;
		}
	}
	/#
		/#
			assertmsg("");
		#/
	#/
}

/*
	Name: get_valid_lines
	Namespace: namespace_51f64aa9
	Checksum: 0xE77EEC3C
	Offset: 0xA448
	Size: 0x12A
	Parameters: 1
	Flags: None
*/
function get_valid_lines(aliasprefix)
{
	a_variants = [];
	for(i = 0; i < 20; i++)
	{
		str_alias = (aliasprefix + "_") + i;
		if(soundexists(str_alias))
		{
			if(!isdefined(a_variants))
			{
				a_variants = [];
			}
			else if(!isarray(a_variants))
			{
				a_variants = array(a_variants);
			}
			a_variants[a_variants.size] = str_alias;
			continue;
		}
		if(soundexists(aliasprefix))
		{
			if(!isdefined(a_variants))
			{
				a_variants = [];
			}
			else if(!isarray(a_variants))
			{
				a_variants = array(a_variants);
			}
			a_variants[a_variants.size] = aliasprefix;
			break;
		}
	}
	return a_variants;
}

/*
	Name: function_a2f55e89
	Namespace: namespace_51f64aa9
	Checksum: 0x1AA38119
	Offset: 0xA580
	Size: 0xF4
	Parameters: 1
	Flags: None
*/
function function_a2f55e89(var_511659b1)
{
	if(!isdefined(var_511659b1))
	{
		var_511659b1 = 0;
	}
	if(!isdefined(level.var_4ea64c7f))
	{
		level.var_4ea64c7f = "";
	}
	var_9c1ed9ea = undefined;
	if(var_511659b1)
	{
		var_9c1ed9ea = "energy_low";
	}
	else
	{
		if(is_true(level.var_6d24574d))
		{
			var_9c1ed9ea = "energy_epic";
		}
		else
		{
			if(level.wave_number >= 16)
			{
				var_9c1ed9ea = "energy_high";
			}
			else
			{
				if(level.wave_number >= 6)
				{
					var_9c1ed9ea = "energy_med";
				}
				else
				{
					var_9c1ed9ea = "energy_low";
				}
			}
		}
	}
	if(isdefined(var_9c1ed9ea))
	{
		music::setmusicstate(var_9c1ed9ea);
	}
}

