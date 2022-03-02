#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1a9763988299e68d;
#using script_1ee011cd0961afd7;
#using script_2474a362752098d2;
#using script_26187f7b449f7b92;
#using script_2a5bf5b4a00cee0d;
#using script_3bbf85ab4cb9f3c2;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_6b6510e124bad778;
#using script_f38dc50f0e82277;
#using scripts\core_common\animation_shared.gsc;
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

#namespace doa_fate;

/*
	Name: init
	Namespace: doa_fate
	Checksum: 0xFE00C3C0
	Offset: 0x478
	Size: 0x5CC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_fe92efd8 = array({#announce:3, #hash_d75b5b21:(0, 0, 0), #hash_af104f33:2, #sfx:"evt_doa_teleporter_wilds_burst", #fx:"wild_portal_radial_burst", #hash_c8386627:1, #hash_3831681e:#"zombietron_fate_fury", #model:#"zombietron_fate_rock_fury"}, {#announce:4, #hash_d75b5b21:(0, 0, 0), #hash_af104f33:4, #sfx:"evt_doa_teleporter_wilds_burst", #fx:"wild_portal_radial_burst", #hash_c8386627:2, #hash_3831681e:#"zombietron_fate_ruby", #model:#"zombietron_fate_rock_fortune"}, {#announce:2, #hash_d75b5b21:(0, 0, 0), #hash_af104f33:5, #sfx:"evt_doa_teleporter_wilds_burst", #fx:"wild_portal_radial_burst", #hash_c8386627:8, #hash_3831681e:#"zombietron_fate_boots", #model:#"zombietron_fate_rock_feet"}, {#announce:5, #hash_d75b5b21:(-70, 80, 0), #hash_af104f33:3, #sfx:"evt_doa_teleporter_wilds_burst", #fx:"wild_portal_radial_burst", #hash_c8386627:4, #hash_3831681e:#"zombietron_fate_friendship", #model:#"zombietron_fate_rock_friend"}, {#announce:6, #hash_d75b5b21:(-70, 80, 0), #hash_af104f33:6, #sfx:"evt_doa_teleporter_wilds_burst", #fx:"wild_portal_radial_burst", #hash_c8386627:16, #hash_3831681e:#"zombietron_fate_shield", #model:#"zombietron_fate_rock_shield"}, {#announce:7, #hash_d75b5b21:(0, 0, 0), #hash_af104f33:7, #sfx:"evt_doa_teleporter_wilds_burst", #fx:"wild_portal_radial_burst", #hash_c8386627:32, #hash_3831681e:#"zombietron_fate_medic", #model:#"zombietron_fate_rock_medic"});
	objective_add(14 + 0, "invisible", (0, 0, 0), #"hash_793a72598916f307");
	objective_add(14 + 1, "invisible", (0, 0, 0), #"hash_793a72598916f307");
	objective_add(14 + 2, "invisible", (0, 0, 0), #"hash_793a72598916f307");
	objective_add(14 + 3, "invisible", (0, 0, 0), #"hash_793a72598916f307");
	objective_add(14 + 4, "invisible", (0, 0, 0), #"hash_793a72598916f307");
	objective_add(14 + 5, "invisible", (0, 0, 0), #"hash_793a72598916f307");
}

/*
	Name: main
	Namespace: doa_fate
	Checksum: 0x330F5A08
	Offset: 0xA50
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function main()
{
	level.doa.var_fa624022 = array(1, 2, 4, 8);
	level.doa.var_36d8eb11 = undefined;
	level clientfield::set("banner_eventplayer", 0);
}

/*
	Name: function_1324dc3b
	Namespace: doa_fate
	Checksum: 0x7B9C7578
	Offset: 0xAC0
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_1324dc3b()
{
	if(isdefined(level.doa.var_36d8eb11))
	{
		fate = level.doa.var_36d8eb11;
	}
	else if(level.doa.var_fa624022.size)
	{
		fate = level.doa.var_fa624022[randomint(level.doa.var_fa624022.size)];
		arrayremovevalue(level.doa.var_fa624022, fate);
	}
	if(isdefined(fate))
	{
		level.doa.var_36d8eb11 = fate;
		return function_e8822b3b(fate);
	}
}

/*
	Name: function_85da1646
	Namespace: doa_fate
	Checksum: 0x7282DD83
	Offset: 0xBB0
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function function_85da1646(var_c8386627)
{
	level.doa.var_fa624022[level.doa.var_fa624022.size] = var_c8386627;
}

/*
	Name: function_e8822b3b
	Namespace: doa_fate
	Checksum: 0x15601CA
	Offset: 0xBF0
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function function_e8822b3b(var_c8386627)
{
	foreach(fate in level.doa.var_fe92efd8)
	{
		if(fate.var_c8386627 == var_c8386627)
		{
			return fate;
		}
	}
}

/*
	Name: function_afe89b8c
	Namespace: doa_fate
	Checksum: 0x7DF95DC0
	Offset: 0xC98
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_afe89b8c(var_c8386627)
{
	/#
		assert(isdefined(self.doa.var_484cc88b));
	#/
	return self.doa.var_484cc88b & var_c8386627;
}

/*
	Name: function_15a789ab
	Namespace: doa_fate
	Checksum: 0x81171BAF
	Offset: 0xCE8
	Size: 0x294
	Parameters: 2
	Flags: Linked
*/
function function_15a789ab(var_c8386627, delay)
{
	if(!isdefined(delay))
	{
		delay = 0;
	}
	if(delay)
	{
		wait(delay);
	}
	/#
		assert(isdefined(self.doa.var_484cc88b));
	#/
	if(var_c8386627 == 0)
	{
		if(self function_9e59136f())
		{
			self.doa.var_ed8fde10 = "zombietron_lmg";
			self namespace_41cb996::function_8b7acf56();
		}
		if(self function_d17f9bcb())
		{
			self.doa.default_movespeed = 1;
			self setmovespeedscale(self.doa.default_movespeed);
			self namespace_83eb6304::turnofffx("fast_feet");
		}
		if(self function_d5b51f1e() && isdefined(self.var_10948967))
		{
			self.var_10948967 namespace_4ff32993::function_a7be9625();
			self.var_10948967 = undefined;
		}
		if(self function_b01c3b20())
		{
			self.doa.var_96ca2395 = 1;
		}
		self.doa.var_484cc88b = 0;
		namespace_1e25ad94::debugmsg("Player's fates have been striped");
		self thread namespace_6e90e490::function_47e11416(1);
		return;
	}
	if(!function_afe89b8c(var_c8386627))
	{
		self thread namespace_6e90e490::function_47e11416(4);
		level thread awardfate(self, function_e8822b3b(var_c8386627));
		namespace_1e25ad94::debugmsg("Player awarded fate:" + var_c8386627);
	}
	else
	{
		namespace_1e25ad94::debugmsg("Player already fated with this fate:" + var_c8386627);
	}
}

/*
	Name: function_42b0778
	Namespace: doa_fate
	Checksum: 0x45BE637A
	Offset: 0xF88
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_42b0778(var_4198fa33, player)
{
	fate = var_4198fa33.data;
	var_4198fa33 notsolid();
	var_4198fa33 ghost();
	if(var_4198fa33.context === 2)
	{
		namespace_491fa2b2::function_df55eb9d(2, 7, var_4198fa33);
	}
	awardfate(player, fate);
}

/*
	Name: awardfate
	Namespace: doa_fate
	Checksum: 0xE10EE62E
	Offset: 0x1030
	Size: 0x582
	Parameters: 2
	Flags: Linked
*/
function awardfate(player, var_191ca105)
{
	player endon(#"disconnect");
	player namespace_83eb6304::function_3ecfde67("lightningStrike");
	player namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
	if(!isdefined(player.entnum))
	{
		player.entnum = player getentitynumber();
	}
	var_6b186658 = var_191ca105.var_af104f33 + (player.entnum << 4);
	level clientfield::set("banner_eventplayer", var_6b186658);
	level thread namespace_9fc66ac::announce(var_191ca105.announce, 1 << player.entnum);
	player namespace_d2efac9a::function_9d3fe107();
	var_f1bda869 = namespace_ec06fe4a::function_e22ae9b3(player.origin + vectorscale((0, 0, 1), 1500), var_191ca105.var_3831681e);
	if(isdefined(var_f1bda869))
	{
		var_f1bda869.angles = var_191ca105.var_d75b5b21;
		var_f1bda869 doa_pickups::function_7e4e4b8a(player, 0);
		player namespace_83eb6304::function_3ecfde67(var_191ca105.fx);
		player namespace_e32bb68::function_3a59ec34(var_191ca105.sfx);
		var_f1bda869 delete();
	}
	player.doa.var_484cc88b = player.doa.var_484cc88b | var_191ca105.var_c8386627;
	switch(var_191ca105.var_c8386627)
	{
		case 1:
		{
			player.doa.var_ed8fde10 = "zombietron_deathmachine";
			player.doa.var_d6b75dff = 1;
			player namespace_41cb996::function_8b7acf56();
			break;
		}
		case 2:
		{
			if(player.doa.score.var_194c59ae < 2)
			{
				player.doa.score.var_194c59ae = 2;
			}
			break;
		}
		case 4:
		{
			player.var_10948967 = player namespace_4ff32993::function_f69400ca("zombietron_fated_chicken", 1, 1.2);
			break;
		}
		case 8:
		{
			player.doa.default_movespeed = 1.5;
			player setmovespeedscale(player.doa.default_movespeed);
			player namespace_83eb6304::function_3ecfde67("fast_feet");
			break;
		}
		case 32:
		{
			player.doa.var_96ca2395 = 5;
			if(isdefined(level.doa.var_16a35e94))
			{
				player thread [[level.doa.var_16a35e94]]();
			}
			break;
		}
		case 16:
		{
			player.doa.score.bombs = int(max(player.doa.score.bombs, 2));
			roll = randomint(30);
			if(roll < 10)
			{
				level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_barrel"), player.origin, undefined, undefined, 1, undefined, undefined, undefined, player);
			}
			else
			{
				if(roll < 10)
				{
					level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_boxing_glove"), player.origin, undefined, undefined, 1, undefined, undefined, undefined, player);
				}
				else
				{
					level doa_pickups::function_d080f0db(doa_pickups::function_6265bde4("zombietron_sawblade"), player.origin, undefined, undefined, 1, undefined, undefined, undefined, player);
				}
			}
			break;
		}
		default:
		{
			/#
				assert(0, "");
			#/
		}
	}
}

/*
	Name: function_9e59136f
	Namespace: doa_fate
	Checksum: 0xA6AFFD6C
	Offset: 0x15C0
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_9e59136f()
{
	if(!isplayer(self))
	{
		return 0;
	}
	/#
		assert(isdefined(self.doa.var_484cc88b), "");
	#/
	return self.doa.var_484cc88b & 1;
}

/*
	Name: function_d17f9bcb
	Namespace: doa_fate
	Checksum: 0x28108BCC
	Offset: 0x1630
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_d17f9bcb()
{
	if(!isplayer(self))
	{
		return 0;
	}
	/#
		assert(isdefined(self.doa.var_484cc88b), "");
	#/
	return self.doa.var_484cc88b & 8;
}

/*
	Name: function_d5b51f1e
	Namespace: doa_fate
	Checksum: 0xA01CC3C7
	Offset: 0x16A0
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_d5b51f1e()
{
	if(!isplayer(self))
	{
		return 0;
	}
	/#
		assert(isdefined(self.doa.var_484cc88b), "");
	#/
	return self.doa.var_484cc88b & 4;
}

/*
	Name: function_d438e371
	Namespace: doa_fate
	Checksum: 0xB4D93C1E
	Offset: 0x1710
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_d438e371()
{
	if(!isplayer(self))
	{
		return 0;
	}
	/#
		assert(isdefined(self.doa.var_484cc88b), "");
	#/
	return self.doa.var_484cc88b & 2;
}

/*
	Name: function_8a19ece
	Namespace: doa_fate
	Checksum: 0x99D37B65
	Offset: 0x1780
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_8a19ece()
{
	if(!isplayer(self))
	{
		return 0;
	}
	/#
		assert(isdefined(self.doa.var_484cc88b), "");
	#/
	return self.doa.var_484cc88b & 16;
}

/*
	Name: function_b01c3b20
	Namespace: doa_fate
	Checksum: 0x580D9FD7
	Offset: 0x17F0
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_b01c3b20()
{
	if(!isplayer(self))
	{
		return 0;
	}
	/#
		assert(isdefined(self.doa.var_484cc88b), "");
	#/
	return self.doa.var_484cc88b & 32;
}

/*
	Name: function_4808b985
	Namespace: doa_fate
	Checksum: 0xAAC42039
	Offset: 0x1860
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function function_4808b985(time)
{
	if(!self function_d438e371())
	{
		return time;
	}
	return int(time * 1.4);
}

/*
	Name: function_11463552
	Namespace: doa_fate
	Checksum: 0xE4D996B8
	Offset: 0x18B8
	Size: 0xA10
	Parameters: 0
	Flags: Linked
*/
function function_11463552()
{
	level endon(#"hash_7626a6770055d63c");
	self notify("d68d76dd27d799e");
	self endon("d68d76dd27d799e");
	level clientfield::set("banner_eventplayer", 0);
	var_637c4df = getent("room_of_fate_shaft_trigger", "targetname");
	result = undefined;
	result = var_637c4df waittill(#"trigger");
	foreach(player in getplayers())
	{
		player thread namespace_7f5aeb59::turnplayershieldon(0);
		if(player === result.activator)
		{
			continue;
		}
		player setorigin(var_637c4df.origin);
		if(!isalive(player) || is_true(player.doa.respawning))
		{
			player namespace_7f5aeb59::function_513831e1();
		}
	}
	objective_setstate(12, "invisible");
	level util::set_lighting_state(3, 0);
	var_b01b0395 = getent("room_of_fate_trigger", "targetname");
	result = undefined;
	result = var_b01b0395 waittill(#"trigger");
	level flag::set("doa_rof_visited");
	var_7f432780 = array::randomize(struct::get_array("room_of_fate_origin", "targetname"));
	var_fe92efd8 = array::randomize(level.doa.var_fe92efd8);
	wait(1);
	level namespace_a6ddb172::function_7a0e5387(42);
	wait(2);
	level thread namespace_9fc66ac::announce(71);
	wait(2);
	wait(4);
	namespace_1e25ad94::debugmsg("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ F A T E  R O C K S $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	if(is_true(level.doa.var_2e2d85d4))
	{
		level namespace_a6ddb172::function_7a0e5387(45);
	}
	else if(level.doa.var_4ebe1b74 > 0)
	{
		level namespace_a6ddb172::function_7a0e5387(46);
	}
	for(i = 0; i < var_7f432780.size; i++)
	{
		/#
			assert(i < var_fe92efd8.size);
		#/
		fate = var_fe92efd8[i];
		model = "zombietron_fate_rock_default";
		if(is_true(level.doa.var_2e2d85d4))
		{
			model = fate.model;
		}
		else if(level.doa.var_4ebe1b74 > 0)
		{
			choose = (randomint(100 - (i * 25))) < 25;
			if(choose)
			{
				model = fate.model;
				level.doa.var_4ebe1b74 = 0;
			}
		}
		var_ea5e17f4 = namespace_ec06fe4a::function_e22ae9b3(var_7f432780[i].origin + vectorscale((0, 0, 1), 1500), model);
		if(isdefined(var_ea5e17f4))
		{
			var_ea5e17f4 solid();
			var_ea5e17f4.data = fate;
			var_ea5e17f4.context = 1;
			var_ea5e17f4.dest = var_7f432780[i].origin;
			if(model == "zombietron_fate_rock_default")
			{
				var_ea5e17f4.angles = (0, randomint(180), 0);
			}
			else
			{
				var_ea5e17f4.angles = fate.var_d75b5b21 + (0, randomint(180), 0);
			}
			var_ea5e17f4.objectiveid = 14 + i;
			var_ea5e17f4 thread function_e4867f1d(fate);
			var_7f432780[i].model = var_ea5e17f4;
			objective_onentity(var_ea5e17f4.objectiveid, var_ea5e17f4);
			objective_setstate(var_ea5e17f4.objectiveid, "active");
			namespace_1e25ad94::debugmsg((((("$$$ ROCK " + i) + " set to model: ") + model) + " and assigned to fate: ") + fate.var_c8386627);
		}
	}
	/#
		mask = 0;
		for(i = 0; i < var_7f432780.size; i++)
		{
			var_5ab7bbf5 = var_7f432780[i].model.data.var_c8386627;
			/#
				assert((mask & var_5ab7bbf5) != var_5ab7bbf5, "");
			#/
			mask = mask | var_5ab7bbf5;
		}
	#/
	if(isdefined(level.doa.var_a5d58dd1))
	{
		timeout = (level.doa.var_a5d58dd1 * 1000) + gettime();
	}
	else
	{
		timeout = 45000 + gettime();
	}
	warning = timeout - 15000;
	lasttime = gettime();
	var_f5a8d3a4 = 0;
	level thread namespace_9fc66ac::announce(8);
	while(!var_f5a8d3a4)
	{
		time = gettime();
		if(time > timeout)
		{
			break;
		}
		if(lasttime <= warning && time > warning)
		{
			level namespace_a6ddb172::function_7a0e5387(43);
			level thread namespace_9fc66ac::announce(11);
		}
		lasttime = time;
		wait(1);
		var_f5a8d3a4 = 1;
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(!isdefined(player.doa.rof))
			{
				var_f5a8d3a4 = 0;
				break;
			}
		}
	}
	level notify(#"hash_60341577c9ac6277");
	for(i = 0; i < var_7f432780.size; i++)
	{
		objective_setstate(14 + i, "invisible");
		if(isdefined(var_7f432780[i].model.trigger))
		{
			var_7f432780[i].model.trigger delete();
		}
		if(isdefined(var_7f432780[i].model))
		{
			var_7f432780[i].model moveto(var_7f432780[i].model.origin + vectorscale((0, 0, 1), 1500), 1);
			var_7f432780[i].model waittill(#"movedone");
			if(isdefined(var_7f432780[i].model))
			{
				var_7f432780[i].model delete();
			}
		}
	}
	level thread namespace_9fc66ac::announce(9);
	level notify(#"hash_7626a6770055d63c", {#banner:44});
}

/*
	Name: function_e4867f1d
	Namespace: doa_fate
	Checksum: 0x32B43DF6
	Offset: 0x22D0
	Size: 0x434
	Parameters: 2
	Flags: Linked
*/
function function_e4867f1d(fate, var_a653de3f)
{
	if(!isdefined(var_a653de3f))
	{
		var_a653de3f = 0;
	}
	self endon(#"death");
	level endon(#"hash_60341577c9ac6277");
	self moveto(self.dest, 1);
	self thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
	wait(0.9);
	self namespace_83eb6304::function_3ecfde67("fate_landing");
	self namespace_e32bb68::function_3a59ec34("zmb_hellhound_bolt");
	wait(1);
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", self.dest + (vectorscale((0, 0, -1), 72)), 0, 80, 256);
	if(isdefined(trigger))
	{
		self.trigger = trigger;
		trigger thread namespace_ec06fe4a::function_d55f042c(level, "game_over");
		while(true)
		{
			result = undefined;
			result = trigger waittill(#"trigger");
			player = result.activator;
			if(var_a653de3f == 0)
			{
				if(isdefined(player.doa.rof))
				{
					continue;
				}
				if(isdefined(player.doa.var_e448d81))
				{
					continue;
				}
			}
			else
			{
				if(isdefined(player.doa.var_a653de3f))
				{
					continue;
				}
				if(isdefined(player.doa.var_cb8b16a))
				{
					continue;
				}
			}
			if(player function_e19c55bd() >= 2)
			{
				var_6b186658 = 1 + (player.entnum << 4);
				level clientfield::set("banner_eventplayer", var_6b186658);
				player thread function_fe008f40();
				continue;
			}
			if(!player function_afe89b8c(fate.var_c8386627))
			{
				self namespace_83eb6304::function_3ecfde67("lightningStrike");
				self namespace_e32bb68::function_3a59ec34("evt_doa_lightning_bolt");
				break;
			}
		}
		if(var_a653de3f == 0)
		{
			player.doa.var_e448d81 = 1;
		}
		else
		{
			player.doa.var_cb8b16a = 1;
		}
		self namespace_83eb6304::function_3ecfde67("fate_explo");
		objective_setstate(self.objectiveid, "invisible");
		level function_42b0778(self, player);
		if(isdefined(player))
		{
			if(var_a653de3f == 0)
			{
				player.doa.rof = fate.var_c8386627;
				player.doa.var_e448d81 = undefined;
			}
			else
			{
				player.doa.var_a653de3f = fate.var_c8386627;
				player.doa.var_cb8b16a = undefined;
			}
			player giveachievement(#"hash_2670a9f559576876");
		}
	}
	else
	{
		/#
			assert(0, "");
		#/
	}
}

/*
	Name: function_fe008f40
	Namespace: doa_fate
	Checksum: 0x7B86687D
	Offset: 0x2710
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_fe008f40(time)
{
	if(!isdefined(time))
	{
		time = 5;
	}
	self endon(#"disconnect");
	wait(time);
	var_6b186658 = 0 + (self.entnum << 4);
	level clientfield::set("banner_eventplayer", var_6b186658);
}

/*
	Name: function_e19c55bd
	Namespace: doa_fate
	Checksum: 0x54828111
	Offset: 0x2790
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_e19c55bd()
{
	var_9c6b83ad = 0;
	if(self function_9e59136f())
	{
		var_9c6b83ad++;
	}
	if(self function_d17f9bcb())
	{
		var_9c6b83ad++;
	}
	if(self function_d5b51f1e())
	{
		var_9c6b83ad++;
	}
	if(self function_d438e371())
	{
		var_9c6b83ad++;
	}
	if(self function_8a19ece())
	{
		var_9c6b83ad++;
	}
	if(self function_b01c3b20())
	{
		var_9c6b83ad++;
	}
	return var_9c6b83ad;
}

/*
	Name: function_41d66855
	Namespace: doa_fate
	Checksum: 0x9DF9DEA9
	Offset: 0x2840
	Size: 0x61C
	Parameters: 1
	Flags: Linked
*/
function function_41d66855(var_419d3eb7)
{
	if(!isdefined(var_419d3eb7))
	{
		var_419d3eb7 = 0;
	}
	level endon(#"game_over");
	self notify("6db6ff8d054c216e");
	self endon("6db6ff8d054c216e");
	level util::set_lighting_state(3, 0);
	level clientfield::set("banner_eventplayer", 0);
	var_7f432780 = array::randomize(struct::get_array("room_of_fate_origin", "targetname"));
	var_fe92efd8 = array::randomize(level.doa.var_fe92efd8);
	wait(1);
	if(var_419d3eb7)
	{
		level namespace_a6ddb172::function_7a0e5387(53);
	}
	else
	{
		level namespace_a6ddb172::function_7a0e5387(54);
	}
	namespace_1e25ad94::debugmsg("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ F A T E  R O C K S $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	for(i = 0; i < var_7f432780.size; i++)
	{
		/#
			assert(i < var_fe92efd8.size);
		#/
		fate = var_fe92efd8[i];
		model = (var_419d3eb7 ? fate.var_3831681e : "zombietron_fate_rock_default");
		var_ea5e17f4 = namespace_ec06fe4a::function_e22ae9b3(var_7f432780[i].origin + vectorscale((0, 0, 1), 1500), model);
		if(isdefined(var_ea5e17f4))
		{
			var_ea5e17f4 solid();
			var_ea5e17f4.data = fate;
			var_ea5e17f4.context = 1;
			var_ea5e17f4.dest = var_7f432780[i].origin + vectorscale((0, 0, 1), 20);
			var_ea5e17f4.angles = fate.var_d75b5b21 + (0, randomint(180), 0);
			var_ea5e17f4.objectiveid = 14 + i;
			var_ea5e17f4 thread function_e4867f1d(fate, 1);
			var_7f432780[i].model = var_ea5e17f4;
			objective_onentity(var_ea5e17f4.objectiveid, var_ea5e17f4);
			objective_setstate(var_ea5e17f4.objectiveid, "active");
		}
	}
	if(isdefined(level.doa.var_a5d58dd1))
	{
		timeout = (level.doa.var_a5d58dd1 * 1000) + gettime();
	}
	else
	{
		timeout = 45000 + gettime();
	}
	warning = timeout - 15000;
	lasttime = gettime();
	var_f5a8d3a4 = 0;
	level thread namespace_9fc66ac::announce(8);
	while(!var_f5a8d3a4)
	{
		time = gettime();
		if(time > timeout)
		{
			break;
		}
		if(lasttime <= warning && time > warning)
		{
			level namespace_a6ddb172::function_7a0e5387(43);
			level thread namespace_9fc66ac::announce(11);
		}
		lasttime = time;
		wait(1);
		var_f5a8d3a4 = 1;
		foreach(player in namespace_7f5aeb59::function_23e1f90f())
		{
			if(!isdefined(player.doa.var_a653de3f))
			{
				var_f5a8d3a4 = 0;
				break;
			}
		}
	}
	level notify(#"hash_60341577c9ac6277");
	for(i = 0; i < var_7f432780.size; i++)
	{
		objective_setstate(14 + i, "invisible");
		if(isdefined(var_7f432780[i].model.trigger))
		{
			var_7f432780[i].model.trigger delete();
		}
		if(isdefined(var_7f432780[i].model))
		{
			var_7f432780[i].model moveto(var_7f432780[i].model.origin + vectorscale((0, 0, 1), 1500), 1);
			var_7f432780[i].model waittill(#"movedone");
			if(isdefined(var_7f432780[i].model))
			{
				var_7f432780[i].model delete();
			}
		}
	}
	level thread namespace_9fc66ac::announce(9);
}

