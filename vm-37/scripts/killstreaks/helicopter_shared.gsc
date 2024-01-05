#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\targetting_delay.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\flak_drone.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_4721de209091b1a6;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace helicopter;

/*
	Name: init_shared
	Namespace: helicopter
	Checksum: 0x6DC34493
	Offset: 0x720
	Size: 0x3DC
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.helicopter_shared))
	{
		level.helicopter_shared = {};
		airsupport::init_shared();
		flak_drone::init_shared();
		path_start = getentarray("heli_start", "targetname");
		loop_start = getentarray("heli_loop_start", "targetname");
		var_3f5397f = struct::get_array("heli_start", "targetname");
		var_78f0de1a = struct::get_array("heli_loop_start", "targetname");
		path_start = arraycombine(path_start, var_3f5397f);
		loop_start = arraycombine(loop_start, var_78f0de1a);
		/#
			debug_refresh = 1;
		#/
		thread heli_update_global_dvars(debug_refresh);
		level.choppercomlinkfriendly = #"veh_t7_drone_hunter";
		level.choppercomlinkenemy = #"hash_7948c5263c738621";
		level.chopperregular = #"hash_7948c5263c738621";
		precachehelicopter(level.chopperregular);
		clientfield::register("vehicle", "heli_comlink_bootup_anim", 1, 1, "int");
		clientfield::register("vehicle", "heli_warn_targeted", 1, 1, "int");
		clientfield::register("vehicle", "heli_warn_locked", 1, 1, "int");
		clientfield::register("vehicle", "heli_warn_fired", 1, 1, "int");
		clientfield::register("vehicle", "active_camo", 1, 3, "int");
		level.heli_paths = [];
		level.heli_startnodes = [];
		level.last_start_node_index = 0;
		level.chopper_fx[#"smoke"][#"trail"] = "destruct/fx8_atk_chppr_exp_trail";
		level.chopper_fx[#"fire"][#"trail"][#"large"] = "killstreaks/fx_heli_smk_trail_engine";
		level._effect[#"heli_comlink_light"][#"friendly"] = #"hash_33eb8912b6c63ecd";
		level._effect[#"heli_comlink_light"][#"enemy"] = #"hash_33eb8912b6c63ecd";
		if(!path_start.size && !loop_start.size)
		{
			return;
		}
		heli_path_graph();
	}
	callback::on_finalize_initialization(&function_1c601b99);
}

/*
	Name: function_1c601b99
	Namespace: helicopter
	Checksum: 0x7896888B
	Offset: 0xB08
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function function_1c601b99()
{
	if(isdefined(level.var_1b900c1d))
	{
		[[level.var_1b900c1d]](getweapon(#"cobra_20mm_comlink"), &function_bff5c062);
	}
}

/*
	Name: function_bff5c062
	Namespace: helicopter
	Checksum: 0xC7636CA1
	Offset: 0xB60
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function function_bff5c062(helicopter, attackingplayer)
{
	helicopter killstreaks::configure_team_internal(attackingplayer, 1);
	helicopter.team = attackingplayer.team;
	helicopter setteam(attackingplayer.team);
	helicopter setowner(attackingplayer);
	helicopter.owner = attackingplayer;
	hackedcallbackpost(attackingplayer);
	helicopter.loopcount = 0;
	if(isdefined(level.var_f1edf93f))
	{
		helicopter notify(#"cancel_timeout");
		var_eb79e7c3 = [[level.var_f1edf93f]]();
		starttime = gettime();
		duration = int(var_eb79e7c3 * 1000);
		helicopter.halftime = starttime + (duration * 0.5);
		helicopter.killstreakendtime = starttime + duration;
		helicopter.endtime = starttime + duration;
		helicopter.var_478039e8 = 0;
		helicopter notify(#"abort_goal");
	}
	attackingplayer thread watchforearlyleave(helicopter);
}

/*
	Name: precachehelicopter
	Namespace: helicopter
	Checksum: 0xE6FC2409
	Offset: 0xCF0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function precachehelicopter(model)
{
	level.vehicle_deathmodel[model] = model;
	level.heli_sound[#"hit"] = #"evt_helicopter_hit";
	level.heli_sound[#"hitsecondary"] = #"evt_helicopter_hit";
	level.heli_sound[#"damaged"] = #"null";
	level.heli_sound[#"spinloop"] = #"evt_helicopter_spin_loop";
	level.heli_sound[#"spinstart"] = #"evt_helicopter_spin_start";
	level.heli_sound[#"crash"] = #"evt_helicopter_midair_exp";
	level.heli_sound[#"missilefire"] = #"wpn_hellfire_fire_npc";
}

/*
	Name: function_7da89497
	Namespace: helicopter
	Checksum: 0x261638DB
	Offset: 0xE30
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_7da89497()
{
	self beginlocationcomlinkselection("map_mortar_selector");
}

/*
	Name: usekillstreakhelicopter
	Namespace: helicopter
	Checksum: 0xC0AF564A
	Offset: 0xE60
	Size: 0x200
	Parameters: 1
	Flags: None
*/
function usekillstreakhelicopter(hardpointtype)
{
	if(self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0)
	{
		return false;
	}
	if(!isdefined(level.heli_startnodes) || !level.heli_startnodes.size)
	{
		/#
			iprintlnbold("");
		#/
		return false;
	}
	level.helilocation = self.origin;
	destination = 0;
	var_cedefdcb = randomint(level.heli_startnodes.size);
	startnode = level.heli_startnodes[var_cedefdcb];
	protectlocation = undefined;
	armored = 0;
	protectlocation = (level.helilocation[0], level.helilocation[1], int(killstreaks::function_43f4782d()));
	killstreak_id = self killstreakrules::killstreakstart(hardpointtype, self.team);
	if(killstreak_id == -1)
	{
		return false;
	}
	if(isdefined(level.var_34f03cda))
	{
		self [[level.var_34f03cda]](hardpointtype);
	}
	self namespace_f9b02f80::play_killstreak_start_dialog(hardpointtype, self.team, killstreak_id);
	self thread announcehelicopterinbound(hardpointtype);
	thread heli_think(self, startnode, self.team, protectlocation, hardpointtype, armored, killstreak_id);
	return true;
}

/*
	Name: announcehelicopterinbound
	Namespace: helicopter
	Checksum: 0x58C374F7
	Offset: 0x1068
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function announcehelicopterinbound(hardpointtype)
{
	team = self.team;
	self stats::function_e24eec31(killstreaks::get_killstreak_weapon(hardpointtype), #"used", 1);
}

/*
	Name: heli_path_graph
	Namespace: helicopter
	Checksum: 0xCEC04900
	Offset: 0x10C8
	Size: 0x12C
	Parameters: 0
	Flags: Linked
*/
function heli_path_graph()
{
	path_start = getentarray("heli_start", "targetname");
	/#
		assert(isdefined(path_start), "");
	#/
	var_dc186d06 = struct::get_array("heli_start", "targetname");
	path_start = arraycombine(path_start, var_dc186d06);
	for(i = 0; i < path_start.size; i++)
	{
		if(isdefined(path_start[i].script_noteworthy) && path_start[i].script_noteworthy == "primary")
		{
			continue;
		}
		level.heli_startnodes[level.heli_startnodes.size] = path_start[i];
	}
	/#
		assert(isdefined(level.heli_startnodes[0]), "");
	#/
}

/*
	Name: heli_update_global_dvars
	Namespace: helicopter
	Checksum: 0x18B4BE9
	Offset: 0x1200
	Size: 0x682
	Parameters: 1
	Flags: Linked
*/
function heli_update_global_dvars(debug_refresh)
{
	do
	{
		level.heli_loopmax = getdvar(#"scr_heli_loopmax", 2);
		level.heli_missile_rof = getdvar(#"scr_heli_missile_rof", 8);
		level.heli_armor = getdvar(#"scr_heli_armor", 500);
		level.heli_maxhealth = getdvar(#"scr_heli_maxhealth", 2000);
		level.heli_amored_maxhealth = getdvar(#"scr_heli_armored_maxhealth", 1500);
		level.heli_missile_max = getdvar(#"scr_heli_missile_max", 20);
		level.heli_dest_wait = getdvar(#"scr_heli_dest_wait", 8);
		level.heli_debug = getdvar(#"scr_heli_debug", 0);
		level.heli_debug_crash = getdvar(#"scr_heli_debug_crash", 0);
		level.heli_targeting_delay = getdvar(#"scr_heli_targeting_delay", 0.1);
		level.heli_turretreloadtime = getdvar(#"scr_heli_turretreloadtime", 0.5);
		level.heli_turretclipsize = getdvar(#"scr_heli_turretclipsize", 60);
		level.var_c10c27dd = getdvar(#"scr_heli_turretclipsize", 20);
		level.heli_visual_range = (isdefined(level.heli_visual_range_override) ? level.heli_visual_range_override : getdvar(#"scr_heli_visual_range", 3500));
		level.heli_missile_range = getdvar(#"scr_heli_missile_range", 100000);
		level.heli_turret_target_cone = getdvar(#"scr_heli_turret_target_cone", 0.6);
		level.heli_target_spawnprotection = getdvar(#"scr_heli_target_spawnprotection", 5);
		level.heli_missile_regen_time = getdvar(#"scr_heli_missile_regen_time", 10);
		level.heli_turret_spinup_delay = getdvar(#"scr_heli_turret_spinup_delay", 0.5);
		level.heli_target_recognition = getdvar(#"scr_heli_target_recognition", 0.2);
		level.heli_missile_friendlycare = getdvar(#"scr_heli_missile_friendlycare", 512);
		level.heli_missile_target_cone = getdvar(#"scr_heli_missile_target_cone", 0.6);
		level.var_a34e186c = getdvar(#"scr_heli_missile_target_cone", 0.9);
		level.heli_valid_target_cone = getdvar(#"scr_heli_missile_valid_target_cone", 0.9);
		level.heli_armor_bulletdamage = getdvar(#"scr_heli_armor_bulletdamage", 0.5);
		level.heli_attract_strength = getdvar(#"scr_heli_attract_strength", 1000);
		level.heli_attract_range = getdvar(#"scr_heli_attract_range", 20000);
		level.helicopterturretmaxangle = getdvar(#"scr_helicopterturretmaxangle", 50);
		level.var_e071ed64 = is_true(getgametypesetting(#"hash_5f76e2d55ad861ed")) && getdvar(#"hash_3910a4196fe6b62e", 1);
		level.heli_protect_radius = getdvarint(#"scr_heli_protect_radius", 3000);
		level.heli_missile_reload_time = getdvar(#"scr_heli_missile_reload_time", 5);
		level.heli_warning_distance = getdvar(#"scr_heli_warning_distance", 500);
		level.var_410ccc21 = getdvar(#"hash_54ea95509bbe1db6", 6000);
		wait(1);
	}
	while(isdefined(debug_refresh));
}

/*
	Name: set_goal_pos
	Namespace: helicopter
	Checksum: 0xEAF332AB
	Offset: 0x1890
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function set_goal_pos(goalpos, stop)
{
	if(!isdefined(self))
	{
		return;
	}
	self.heligoalpos = goalpos;
	if(is_true(level.var_e071ed64))
	{
		if(issentient(self) && ispathfinder(self))
		{
			self setgoal(goalpos, stop);
			self function_a57c34b7(goalpos, stop, 1);
		}
		else
		{
			self function_a57c34b7(goalpos, stop, 0);
		}
	}
	else
	{
		self setgoal(goalpos, stop);
	}
}

/*
	Name: function_5145edd2
	Namespace: helicopter
	Checksum: 0xA10239F4
	Offset: 0x1990
	Size: 0x15C
	Parameters: 5
	Flags: Linked
*/
function function_5145edd2(helicopter, pilot, tag, anim, positionoffset)
{
	pilot endon(#"death");
	helicopter endon(#"death", #"crashing");
	pilot useanimtree("all_player");
	pilot linkto(helicopter, tag);
	if(isdefined(positionoffset))
	{
		origin = helicopter gettagorigin(tag);
		angles = helicopter gettagangles(tag);
		pilot animation::play(anim, origin + positionoffset, angles, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
	}
	else
	{
		pilot animation::play(anim, helicopter, tag, 1, 0.2, 0.1, undefined, undefined, undefined, 0);
	}
}

/*
	Name: function_eca18f00
	Namespace: helicopter
	Checksum: 0x4B95DC24
	Offset: 0x1AF8
	Size: 0x124
	Parameters: 5
	Flags: Linked
*/
function function_eca18f00(helicopter, var_84c9052b, var_1286d1f7, var_299b0ed5, var_2ab382c7)
{
	if(isdefined(var_84c9052b))
	{
		pilot = util::spawn_anim_model(#"hash_1918a027c5c6ec0c", helicopter.origin);
		helicopter.var_89cf7991 = [];
		if(isdefined(pilot))
		{
			helicopter.var_89cf7991[0] = pilot;
			pilot thread function_5145edd2(helicopter, pilot, "tag_driver", var_84c9052b, var_299b0ed5);
		}
	}
	if(isdefined(var_1286d1f7))
	{
		pilot = util::spawn_anim_model(#"hash_71aea3bbaef3e00c", helicopter.origin);
		if(isdefined(pilot))
		{
			helicopter.var_89cf7991[1] = pilot;
			pilot thread function_5145edd2(helicopter, pilot, "tag_driver1", var_1286d1f7, var_2ab382c7);
		}
	}
}

/*
	Name: function_711c140b
	Namespace: helicopter
	Checksum: 0x37DD1153
	Offset: 0x1C28
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_711c140b()
{
	if(isdefined(self.var_89cf7991))
	{
		if(isdefined(self.var_89cf7991[0]))
		{
			self.var_89cf7991[0] delete();
		}
		if(isdefined(self.var_89cf7991[1]))
		{
			self.var_89cf7991[1] delete();
		}
	}
}

/*
	Name: spawn_helicopter
	Namespace: helicopter
	Checksum: 0x7A5FD489
	Offset: 0x1CA8
	Size: 0x260
	Parameters: 7
	Flags: Linked
*/
function spawn_helicopter(owner, origin, angles, vehicledef, target_offset, killstreakbundle, killstreak_id)
{
	chopper = spawnvehicle(vehicledef, origin, angles);
	chopper setowner(owner);
	chopper.owner = owner;
	chopper clientfield::set("enemyvehicle", 1);
	chopper.attackers = [];
	chopper.attackerdata = [];
	chopper.attackerdamage = [];
	chopper.flareattackerdamage = [];
	chopper.var_ae052a1c = &function_69a7aed9;
	chopper.destroyfunc = &destroyhelicopter;
	chopper.hardpointtype = killstreakbundle.name;
	chopper.killstreak_id = killstreak_id;
	chopper.pilotistalking = 0;
	chopper setdrawinfrared(1);
	chopper.allowcontinuedlockonafterinvis = 1;
	chopper.soundmod = "heli";
	chopper.targetname = "chopper";
	chopper.team = owner.team;
	chopper setteam(owner.team);
	chopper.var_c31213a5 = 1;
	if(!isdefined(target_offset))
	{
		target_offset = (0, 0, 0);
	}
	chopper.target_offset = target_offset;
	target_set(chopper, target_offset);
	chopper.var_54b19f55 = 1;
	chopper killstreaks::function_2b6aa9e8(killstreakbundle.var_d3413870);
	chopper.overridevehicledamage = &function_11038a4a;
	chopper.overridevehiclekilled = &function_a459fae8;
	chopper setrotorspeed(1);
	return chopper;
}

/*
	Name: function_11038a4a
	Namespace: helicopter
	Checksum: 0xCAAA3374
	Offset: 0x1F10
	Size: 0xF2
	Parameters: 15
	Flags: Linked
*/
function function_11038a4a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	helicopter = self;
	if(partname == "MOD_TRIGGER_HURT")
	{
		return 0;
	}
	damagefromunderneath = self killstreaks::ondamageperweapon(self.hardpointtype, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal, self.maxhealth, undefined, self.lowhealth, undefined, 0, undefined, 1, 1);
	return damagefromunderneath;
}

/*
	Name: function_a459fae8
	Namespace: helicopter
	Checksum: 0x71498022
	Offset: 0x2010
	Size: 0xBC
	Parameters: 8
	Flags: Linked
*/
function function_a459fae8(einflictor, eattacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime)
{
	if(isdefined(self.owner))
	{
		if(isdefined(psoffsettime))
		{
			self.owner killstreaks::function_4aad9803(self.killstreaktype, self.killstreak_id, psoffsettime);
		}
		self.owner killstreaks::function_e9873ef7(self.killstreaktype, self.killstreak_id, #"hash_47e685e10dcee57");
	}
}

/*
	Name: explodeoncontact
	Namespace: helicopter
	Checksum: 0x8AE2462E
	Offset: 0x20D8
	Size: 0x50
	Parameters: 1
	Flags: Linked
*/
function explodeoncontact(hardpointtype)
{
	self endon(#"death");
	wait(10);
	for(;;)
	{
		self waittill(#"touch");
		self thread heli_explode();
	}
}

/*
	Name: getvalidprotectlocationstart
	Namespace: helicopter
	Checksum: 0x3B02B85A
	Offset: 0x2130
	Size: 0x186
	Parameters: 4
	Flags: None
*/
function getvalidprotectlocationstart(random_path, protectlocation, destination, var_aea79ccc)
{
	if(!isdefined(var_aea79ccc))
	{
		var_aea79ccc = 0;
	}
	startnode = level.heli_paths[destination][random_path];
	path_index = (random_path + 1) % level.heli_paths[destination].size;
	if(var_aea79ccc)
	{
		innofly = airsupport::crossesnoflyzone(protectlocation + (0, 0, 1), protectlocation);
		if(isdefined(innofly))
		{
			protectlocation = (protectlocation[0], protectlocation[1], level.noflyzones[innofly].origin[2] + level.noflyzones[innofly].height);
		}
		noflyzone = airsupport::crossesnoflyzone(startnode.origin, protectlocation);
		while(isdefined(noflyzone) && path_index != random_path)
		{
			startnode = level.heli_paths[destination][path_index];
			if(isdefined(noflyzone))
			{
				path_index = (path_index + 1) % level.heli_paths[destination].size;
			}
		}
	}
	return level.heli_paths[destination][path_index];
}

/*
	Name: getvalidrandomleavenode
	Namespace: helicopter
	Checksum: 0x2B73140A
	Offset: 0x22C0
	Size: 0x204
	Parameters: 2
	Flags: None
*/
function getvalidrandomleavenode(start, var_aea79ccc)
{
	if(!isdefined(var_aea79ccc))
	{
		var_aea79ccc = 1;
	}
	heli_leavenodes = level.heli_startnodes;
	if(self === level.vtol)
	{
		foreach(node in heli_leavenodes)
		{
			if(isdefined(node.script_noteworthy) && node.script_noteworthy == "primary")
			{
				return node;
			}
		}
	}
	random_leave_node = randomint(heli_leavenodes.size);
	leavenode = heli_leavenodes[random_leave_node];
	path_index = (random_leave_node + 1) % heli_leavenodes.size;
	if(var_aea79ccc)
	{
		noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
		isprimary = leavenode.script_noteworthy === "primary";
		while(isdefined(noflyzone) || isprimary && path_index != random_leave_node)
		{
			leavenode = heli_leavenodes[path_index];
			noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
			isprimary = leavenode.script_noteworthy === "primary";
			path_index = (path_index + 1) % heli_leavenodes.size;
		}
	}
	return heli_leavenodes[path_index];
}

/*
	Name: getvalidrandomstartnode
	Namespace: helicopter
	Checksum: 0xF280A6F1
	Offset: 0x24D0
	Size: 0x164
	Parameters: 2
	Flags: Linked
*/
function getvalidrandomstartnode(dest, var_aea79ccc)
{
	if(!isdefined(var_aea79ccc))
	{
		var_aea79ccc = 1;
	}
	if(!isdefined(level.heli_startnodes) || !level.heli_startnodes.size)
	{
		return undefined;
	}
	path_index = randomint(level.heli_startnodes.size);
	best_index = path_index;
	if(var_aea79ccc)
	{
		count = 0;
		for(i = 0; i < level.heli_startnodes.size; i++)
		{
			startnode = level.heli_startnodes[path_index];
			noflyzone = airsupport::crossesnoflyzone(startnode.origin, dest);
			if(!isdefined(noflyzone))
			{
				best_index = path_index;
				if(path_index != level.last_start_node_index)
				{
					break;
				}
			}
			path_index = (path_index + 1) % level.heli_startnodes.size;
		}
	}
	level.last_start_node_index = best_index;
	return level.heli_startnodes[best_index];
}

/*
	Name: function_9d99f54c
	Namespace: helicopter
	Checksum: 0x86FCB8BB
	Offset: 0x2640
	Size: 0x264
	Parameters: 3
	Flags: None
*/
function function_9d99f54c(dest, var_3f25aa93, var_aea79ccc)
{
	if(!isdefined(var_aea79ccc))
	{
		var_aea79ccc = 1;
	}
	if(!isdefined(level.heli_startnodes) || !level.heli_startnodes.size)
	{
		return undefined;
	}
	if(var_aea79ccc)
	{
		best_dot = -1;
		best_node = undefined;
		foreach(node in level.heli_startnodes)
		{
			if(!isdefined(airsupport::crossesnoflyzone(node.origin, dest)))
			{
				var_d9273cbc = vectornormalize(node.origin - dest);
				dot = (var_d9273cbc[0] * var_3f25aa93[0]) + (var_d9273cbc[1] * var_3f25aa93[1]);
				if(dot > best_dot)
				{
					best_dot = dot;
					best_node = node;
				}
			}
		}
	}
	else
	{
		best_dot = -1;
		best_node = undefined;
		foreach(node in level.heli_startnodes)
		{
			var_d9273cbc = vectornormalize(node.origin - dest);
			dot = (var_d9273cbc[0] * var_3f25aa93[0]) + (var_d9273cbc[1] * var_3f25aa93[1]);
			if(dot > best_dot)
			{
				best_dot = dot;
				best_node = node;
			}
		}
	}
	return best_node;
}

/*
	Name: configureteampost
	Namespace: helicopter
	Checksum: 0xF6225C43
	Offset: 0x28B0
	Size: 0x3C
	Parameters: 2
	Flags: Linked
*/
function configureteampost(owner, ishacked)
{
	chopper = self;
	ishacked thread watchforearlyleave(chopper);
}

/*
	Name: hackedcallbackpost
	Namespace: helicopter
	Checksum: 0x32CB645D
	Offset: 0x28F8
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function hackedcallbackpost(hacker)
{
	heli = self;
	if(isdefined(heli.flak_drone))
	{
		heli.flak_drone flak_drone::configureteam(heli, 1);
	}
}

/*
	Name: function_76f530c7
	Namespace: helicopter
	Checksum: 0xF1E8E708
	Offset: 0x2950
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function function_76f530c7(killstreakbundle)
{
	self.var_5efaff3e = killstreakbundle.var_24b7aa85;
	self.var_ba5009c3 = killstreakbundle.var_8334e8e;
	self.explosionfx = killstreakbundle.ksexplosionfx;
	self.var_bdbe8391 = killstreakbundle.var_2a77dc37;
	self.var_78d69212 = killstreakbundle.var_822879a1;
}

/*
	Name: heli_think
	Namespace: helicopter
	Checksum: 0x6889DBF2
	Offset: 0x29B8
	Size: 0x624
	Parameters: 7
	Flags: Linked
*/
function heli_think(owner, startnode, heli_team, protectlocation, var_6b4047f4, armored, killstreak_id)
{
	killstreakbundle = killstreaks::get_script_bundle(var_6b4047f4);
	/#
		assert(isdefined(killstreakbundle));
	#/
	/#
		assert(isdefined(killstreakbundle.var_9b315b3f));
	#/
	chopper = spawn_helicopter(owner, startnode.origin, startnode.angles, killstreakbundle.var_9b315b3f, vectorscale((0, 0, 1), 100), killstreakbundle, killstreak_id);
	chopper killstreak_bundles::spawned(killstreakbundle);
	chopper.killstreakbundle = killstreakbundle;
	chopper.hardpointtype = var_6b4047f4;
	chopper clientfield::set("scorestreakActive", 1);
	chopper function_76f530c7(killstreakbundle);
	chopper thread function_eca18f00(chopper, killstreakbundle.var_f90029e2, killstreakbundle.var_71fa8cb2);
	chopper killstreaks::configure_team(var_6b4047f4, killstreak_id, owner, "helicopter", undefined, &configureteampost);
	chopper killstreakrules::function_2e6ff61a(chopper.hardpointtype, killstreak_id, chopper);
	level.vehicle_death_thread[chopper.vehicletype] = level.var_6af968ce;
	if(isdefined(chopper.flak_drone))
	{
		chopper.flak_drone flak_drone::configureteam(chopper, 0);
	}
	chopper killstreak_hacking::enable_hacking("helicopter_comlink", undefined, &hackedcallbackpost);
	chopper thread watchforemp();
	chopper thread killstreaks::player_killstreak_threat_tracking(chopper.hardpointtype, 0.8660254);
	chopper.requireddeathcount = owner.deathcount;
	minigun_snd_ent = spawn("script_origin", chopper gettagorigin("tag_flash"));
	minigun_snd_ent linkto(chopper, "tag_flash", (0, 0, 0), (0, 0, 0));
	chopper.minigun_snd_ent = minigun_snd_ent;
	minigun_snd_ent thread autostopsound();
	chopper thread heli_existance();
	chopper.reached_dest = 0;
	if(armored)
	{
		chopper.maxhealth = level.heli_amored_maxhealth;
	}
	else
	{
		chopper.maxhealth = level.heli_maxhealth;
	}
	chopper.numflares = 1;
	chopper.flareoffset = vectorscale((0, 0, -1), 256);
	chopper.waittime = level.heli_dest_wait;
	chopper.loopcount = 0;
	chopper.evasive = 0;
	chopper.health_bulletdamageble = level.heli_armor;
	chopper.health_evasive = level.heli_armor;
	chopper.targeting_delay = level.heli_targeting_delay;
	chopper.primarytarget = undefined;
	chopper.helitarget = undefined;
	chopper.secondarytarget = undefined;
	chopper.attacker = undefined;
	chopper.missile_ammo = level.heli_missile_max;
	chopper.currentstate = "ok";
	chopper.lastrocketfiretime = -1;
	chopper.var_aa1e3902 = 1;
	chopper thread heli_protect(startnode, protectlocation, var_6b4047f4, heli_team);
	chopper clientfield::set("heli_comlink_bootup_anim", 1);
	chopper namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", var_6b4047f4, killstreak_id);
	chopper thread wait_for_killed();
	chopper thread heli_health(var_6b4047f4);
	missilesenabled = (isdefined(chopper.killstreakbundle.var_eda20f66) ? chopper.killstreakbundle.var_eda20f66 : 0);
	chopper thread attack_targets(missilesenabled, var_6b4047f4, 1);
	chopper thread heli_targeting(missilesenabled, var_6b4047f4);
	chopper thread heli_missile_regen();
	chopper thread targetting_delay::function_7e1a12ce(killstreakbundle.var_2aeadfa0);
	chopper thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile(killstreakbundle, "crashing", "death");
	chopper thread create_flare_ent(vectorscale((0, 0, -1), 150));
	chopper thread function_d4896942();
	chopper thread function_9440face();
	chopper killstreaks::function_b182645e(owner, var_6b4047f4);
	chopper thread function_b3d1e178();
}

/*
	Name: function_b3d1e178
	Namespace: helicopter
	Checksum: 0x689769F0
	Offset: 0x2FE8
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_b3d1e178()
{
	self endon(#"death");
	level waittill(#"game_ended");
	self destroyhelicopter(0);
}

/*
	Name: autostopsound
	Namespace: helicopter
	Checksum: 0xC3E95FA6
	Offset: 0x3038
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function autostopsound()
{
	self endon(#"death");
	level waittill(#"game_ended");
	self stoploopsound();
}

/*
	Name: heli_existance
	Namespace: helicopter
	Checksum: 0xC14D3A
	Offset: 0x3088
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function heli_existance()
{
	self endon(#"death");
	self waittill(#"leaving");
	self influencers::remove_influencers();
}

/*
	Name: create_flare_ent
	Namespace: helicopter
	Checksum: 0x2F65A4AA
	Offset: 0x30D0
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function create_flare_ent(offset)
{
	self.flare_ent = spawn("script_model", self gettagorigin("tag_origin"));
	self.flare_ent setmodel(#"tag_origin");
	self.flare_ent linkto(self, "tag_origin", offset);
}

/*
	Name: heli_missile_regen
	Namespace: helicopter
	Checksum: 0xEFB1045E
	Offset: 0x3170
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function heli_missile_regen()
{
	self endon(#"death", #"crashing", #"leaving");
	for(;;)
	{
		/#
			airsupport::debug_print3d("" + self.missile_ammo, (0.5, 0.5, 1), self, vectorscale((0, 0, -1), 100), 0);
		#/
		if(self.missile_ammo >= level.heli_missile_max)
		{
			self waittill(#"missile fired");
		}
		else
		{
			if(self.currentstate == "heavy smoke")
			{
				wait(level.heli_missile_regen_time / 4);
			}
			else
			{
				if(self.currentstate == "light smoke")
				{
					wait(level.heli_missile_regen_time / 2);
				}
				else
				{
					wait(level.heli_missile_regen_time);
				}
			}
		}
		if(self.missile_ammo < level.heli_missile_max)
		{
			self.missile_ammo++;
		}
	}
}

/*
	Name: heli_targeting
	Namespace: helicopter
	Checksum: 0x23340643
	Offset: 0x32A8
	Size: 0x6F0
	Parameters: 2
	Flags: Linked
*/
function heli_targeting(missilesenabled, hardpointtype)
{
	self endon(#"death", #"crashing", #"leaving");
	for(;;)
	{
		targets = [];
		targetsmissile = [];
		helitargets = [];
		players = level.players;
		for(i = 0; i < players.size; i++)
		{
			player = players[i];
			if(self cantargetplayer_turret(player, hardpointtype))
			{
				if(isdefined(player))
				{
					targets[targets.size] = player;
				}
			}
			if(missilesenabled && self cantargetplayer_missile(player, hardpointtype))
			{
				if(isdefined(player))
				{
					targetsmissile[targetsmissile.size] = player;
				}
			}
		}
		if(missilesenabled)
		{
			vehicles = getentarray("chopper", "targetname");
			for(i = 0; i < vehicles.size; i++)
			{
				if(function_6c2ca54f(vehicles[i], hardpointtype))
				{
					targetsmissile[targetsmissile.size] = vehicles[i];
				}
			}
		}
		tanks = getentarray("talon", "targetname");
		foreach(tank in tanks)
		{
			if(self cantargettank_turret(tank))
			{
				targets[targets.size] = tank;
			}
		}
		actors = getactorarray();
		foreach(actor in actors)
		{
			if(isdefined(actor) && isactor(actor) && isalive(actor))
			{
				if(self cantargetactor_turret(actor, hardpointtype))
				{
					targets[targets.size] = actor;
				}
			}
		}
		if(!missilesenabled)
		{
			vehicles = getentarray("chopper", "targetname");
			for(i = 0; i < vehicles.size; i++)
			{
				if(function_7ebe7b18(vehicles[i], hardpointtype))
				{
					helitargets[helitargets.size] = vehicles[i];
				}
			}
		}
		if(targets.size == 0 && targetsmissile.size == 0 && helitargets.size == 0)
		{
			self.primarytarget = undefined;
			self.secondarytarget = undefined;
			/#
				debug_print_target();
			#/
			wait(self.targeting_delay);
			continue;
		}
		if(targets.size == 1)
		{
			if(isdefined(targets[0].type) && (targets[0].type == "dog" || targets[0].type == "tank_drone"))
			{
				killstreaks::update_dog_threat(targets[0]);
			}
			else
			{
				if(isactor(targets[0]))
				{
					killstreaks::update_actor_threat(targets[0]);
				}
				else
				{
					killstreaks::update_player_threat(targets[0]);
				}
			}
			self.primarytarget = targets[0];
			self notify(#"hash_60aef9581f7a8d3");
			self.secondarytarget = undefined;
			/#
				debug_print_target();
			#/
		}
		else if(targets.size > 1)
		{
			assignprimarytargets(targets);
		}
		if(targetsmissile.size == 1)
		{
			if(!isdefined(targetsmissile[0].type) || targetsmissile[0].type != "dog" || targets[0].type == "tank_drone")
			{
				self killstreaks::update_missile_player_threat(targetsmissile[0]);
			}
			else if(targetsmissile[0].type == "dog")
			{
				self killstreaks::update_missile_dog_threat(targetsmissile[0]);
			}
			self.secondarytarget = targetsmissile[0];
			self notify(#"secondary acquired");
			/#
				debug_print_target();
			#/
		}
		else if(targetsmissile.size > 1)
		{
			assignsecondarytargets(targetsmissile);
		}
		if(helitargets.size)
		{
			if(function_7078bd6e(self))
			{
				self.helitarget = arraygetclosest(self.origin, helitargets, level.var_410ccc21);
				self notify(#"hash_27ba79e760b6494f");
			}
		}
		wait(self.targeting_delay);
		/#
			debug_print_target();
		#/
	}
}

/*
	Name: cantargetplayer_turret
	Namespace: helicopter
	Checksum: 0x2659EF81
	Offset: 0x39A0
	Size: 0x2BC
	Parameters: 2
	Flags: Linked
*/
function cantargetplayer_turret(player, hardpointtype)
{
	if(!isalive(player) || player.sessionstate != "playing")
	{
		return false;
	}
	if(player.ignoreme === 1)
	{
		return false;
	}
	if(player == self.owner)
	{
		self check_owner(hardpointtype);
		return false;
	}
	if(player isnotarget())
	{
		return false;
	}
	if(player airsupport::cantargetplayerwithspecialty() == 0)
	{
		return false;
	}
	if(distance(player.origin, self.origin) > self.killstreakbundle.var_ddd44b49)
	{
		return false;
	}
	if(!isdefined(player.team))
	{
		return false;
	}
	if(!util::function_fbce7263(player.team, self.team))
	{
		return false;
	}
	if(player.team == #"spectator")
	{
		return false;
	}
	if(isdefined(player.spawntime) && ((float(gettime() - player.spawntime)) / 1000) <= level.heli_target_spawnprotection)
	{
		return false;
	}
	heli_centroid = self.origin + (vectorscale((0, 0, -1), 160));
	heli_forward_norm = anglestoforward(self.angles);
	heli_turret_point = heli_centroid + (144 * heli_forward_norm);
	visible_amount = player sightconetrace(heli_turret_point, self);
	if(visible_amount < level.heli_target_recognition)
	{
		return false;
	}
	var_2910def0 = self targetting_delay::function_1c169b3a(player);
	targetting_delay::function_a4d6d6d8(player, int((isdefined(self.targeting_delay) ? self.targeting_delay : 0.25) * 1000));
	if(!var_2910def0)
	{
		return false;
	}
	return true;
}

/*
	Name: cantargetactor_turret
	Namespace: helicopter
	Checksum: 0xF005784A
	Offset: 0x3C68
	Size: 0x15E
	Parameters: 2
	Flags: Linked
*/
function cantargetactor_turret(actor, hardpointtype)
{
	helicopter = self;
	cantarget = 1;
	if(!isalive(hardpointtype))
	{
		return 0;
	}
	if(!isdefined(hardpointtype.team))
	{
		return 0;
	}
	if(!util::function_fbce7263(hardpointtype.team, helicopter.team))
	{
		return 0;
	}
	if(distancesquared(hardpointtype.origin, helicopter.origin) > level.heli_visual_range * level.heli_visual_range)
	{
		return 0;
	}
	heli_centroid = helicopter.origin + (vectorscale((0, 0, -1), 160));
	heli_forward_norm = anglestoforward(helicopter.angles);
	heli_turret_point = heli_centroid + (144 * heli_forward_norm);
	visible_amount = hardpointtype sightconetrace(heli_turret_point, helicopter);
	if(visible_amount < level.heli_target_recognition)
	{
		return 0;
	}
	return cantarget;
}

/*
	Name: function_7ebe7b18
	Namespace: helicopter
	Checksum: 0x7A6BDD3C
	Offset: 0x3DD0
	Size: 0x14E
	Parameters: 2
	Flags: Linked
*/
function function_7ebe7b18(heli, hardpointtype)
{
	helicopter = self;
	if(!isalive(hardpointtype))
	{
		return false;
	}
	if(!isdefined(hardpointtype.team))
	{
		return false;
	}
	if(!util::function_fbce7263(hardpointtype.team, helicopter.team))
	{
		return false;
	}
	if(distancesquared(hardpointtype.origin, helicopter.origin) > level.heli_visual_range * level.heli_visual_range)
	{
		return false;
	}
	heli_centroid = helicopter.origin + (vectorscale((0, 0, -1), 160));
	heli_forward_norm = anglestoforward(helicopter.angles);
	heli_turret_point = heli_centroid + (144 * heli_forward_norm);
	visible_amount = hardpointtype sightconetrace(heli_turret_point, helicopter);
	if(visible_amount < level.heli_target_recognition)
	{
		return false;
	}
	return true;
}

/*
	Name: function_6c2ca54f
	Namespace: helicopter
	Checksum: 0x217EA94F
	Offset: 0x3F28
	Size: 0x146
	Parameters: 2
	Flags: Linked
*/
function function_6c2ca54f(vehicle, hardpointtype)
{
	if(!isalive(hardpointtype))
	{
		return false;
	}
	if(hardpointtype.ignoreme === 1)
	{
		return false;
	}
	if(distance(hardpointtype.origin, self.origin) > self.killstreakbundle.var_f6f22acf)
	{
		return false;
	}
	if(!isdefined(hardpointtype.team))
	{
		return false;
	}
	if(!isdefined(hardpointtype.owner))
	{
		return false;
	}
	if(level.teambased && !util::function_fbce7263(hardpointtype.team, self.team))
	{
		return false;
	}
	heli_centroid = self.origin + (vectorscale((0, 0, -1), 160));
	heli_forward_norm = anglestoforward(self.angles);
	heli_turret_point = heli_centroid + (144 * heli_forward_norm);
	return true;
}

/*
	Name: cantargetplayer_missile
	Namespace: helicopter
	Checksum: 0xE75B7652
	Offset: 0x4078
	Size: 0x2A2
	Parameters: 2
	Flags: Linked
*/
function cantargetplayer_missile(player, hardpointtype)
{
	if(!isalive(player) || player.sessionstate != "playing")
	{
		return false;
	}
	if(player.ignoreme === 1)
	{
		return false;
	}
	if(player == self.owner)
	{
		self check_owner(hardpointtype);
		return false;
	}
	if(player airsupport::cantargetplayerwithspecialty() == 0)
	{
		return false;
	}
	if(distance(player.origin, self.origin) > self.killstreakbundle.var_f6f22acf)
	{
		return false;
	}
	if(!isdefined(player.team))
	{
		return false;
	}
	if(level.teambased && !util::function_fbce7263(player.team, self.team))
	{
		return false;
	}
	if(player.team == #"spectator")
	{
		return false;
	}
	if(isdefined(player.spawntime) && ((float(gettime() - player.spawntime)) / 1000) <= level.heli_target_spawnprotection)
	{
		return false;
	}
	if(self target_cone_check(player, level.heli_missile_target_cone) == 0)
	{
		return false;
	}
	if(self targetting_delay::function_1c169b3a(player) == 0)
	{
		return false;
	}
	heli_centroid = self.origin + (vectorscale((0, 0, -1), 160));
	heli_forward_norm = anglestoforward(self.angles);
	heli_turret_point = heli_centroid + (144 * heli_forward_norm);
	if(!isdefined(player.lasthit))
	{
		player.lasthit = 0;
	}
	player.lasthit = self heliturretsighttrace(heli_turret_point, player, player.lasthit);
	if(player.lasthit != 0)
	{
		return false;
	}
	return true;
}

/*
	Name: cantargetdog_turret
	Namespace: helicopter
	Checksum: 0x5C8B0FDA
	Offset: 0x4328
	Size: 0x18A
	Parameters: 1
	Flags: None
*/
function cantargetdog_turret(dog)
{
	cantarget = 1;
	if(!isdefined(dog))
	{
		return 0;
	}
	if(distance(dog.origin, self.origin) > level.heli_visual_range)
	{
		return 0;
	}
	if(!isdefined(dog.team))
	{
		return 0;
	}
	if(level.teambased && !util::function_fbce7263(dog.team, self.team))
	{
		return 0;
	}
	if(isdefined(dog.script_owner) && self.owner == dog.script_owner)
	{
		return 0;
	}
	heli_centroid = self.origin + (vectorscale((0, 0, -1), 160));
	heli_forward_norm = anglestoforward(self.angles);
	heli_turret_point = heli_centroid + (144 * heli_forward_norm);
	if(!isdefined(dog.lasthit))
	{
		dog.lasthit = 0;
	}
	dog.lasthit = self heliturretdogtrace(heli_turret_point, dog, dog.lasthit);
	if(dog.lasthit != 0)
	{
		return 0;
	}
	return cantarget;
}

/*
	Name: cantargetdog_missile
	Namespace: helicopter
	Checksum: 0xE2246F96
	Offset: 0x44C0
	Size: 0x18A
	Parameters: 1
	Flags: None
*/
function cantargetdog_missile(dog)
{
	cantarget = 1;
	if(!isdefined(dog))
	{
		return 0;
	}
	if(distance(dog.origin, self.origin) > level.heli_missile_range)
	{
		return 0;
	}
	if(!isdefined(dog.team))
	{
		return 0;
	}
	if(level.teambased && !util::function_fbce7263(dog.team, self.team))
	{
		return 0;
	}
	if(isdefined(dog.script_owner) && self.owner == dog.script_owner)
	{
		return 0;
	}
	heli_centroid = self.origin + (vectorscale((0, 0, -1), 160));
	heli_forward_norm = anglestoforward(self.angles);
	heli_turret_point = heli_centroid + (144 * heli_forward_norm);
	if(!isdefined(dog.lasthit))
	{
		dog.lasthit = 0;
	}
	dog.lasthit = self heliturretdogtrace(heli_turret_point, dog, dog.lasthit);
	if(dog.lasthit != 0)
	{
		return 0;
	}
	return cantarget;
}

/*
	Name: cantargettank_turret
	Namespace: helicopter
	Checksum: 0x367E41F5
	Offset: 0x4658
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function cantargettank_turret(tank)
{
	cantarget = 1;
	if(!isdefined(tank))
	{
		return 0;
	}
	if(distance(tank.origin, self.origin) > level.heli_visual_range)
	{
		return 0;
	}
	if(!isdefined(tank.team))
	{
		return 0;
	}
	if(level.teambased && !util::function_fbce7263(tank.team, self.team))
	{
		return 0;
	}
	if(isdefined(tank.owner) && self.owner == tank.owner)
	{
		return 0;
	}
	return cantarget;
}

/*
	Name: assignprimarytargets
	Namespace: helicopter
	Checksum: 0xD86F70C6
	Offset: 0x4738
	Size: 0x216
	Parameters: 1
	Flags: Linked
*/
function assignprimarytargets(targets)
{
	for(idx = 0; idx < targets.size; idx++)
	{
		if(isdefined(targets[idx].type) && targets[idx].type == "dog")
		{
			killstreaks::update_dog_threat(targets[idx]);
			continue;
		}
		if(isactor(targets[idx]))
		{
			killstreaks::update_actor_threat(targets[idx]);
			continue;
		}
		if(isplayer(targets[idx]))
		{
			killstreaks::update_player_threat(targets[idx]);
			continue;
		}
		killstreaks::update_non_player_threat(targets[idx]);
	}
	/#
		assert(targets.size >= 2, "");
	#/
	highest = 0;
	second_highest = 0;
	primarytarget = undefined;
	for(idx = 0; idx < targets.size; idx++)
	{
		/#
			assert(isdefined(targets[idx].threatlevel), "");
		#/
		if(targets[idx].threatlevel >= highest)
		{
			highest = targets[idx].threatlevel;
			primarytarget = targets[idx];
		}
	}
	/#
		assert(isdefined(primarytarget), "");
	#/
	self.primarytarget = primarytarget;
	self notify(#"hash_60aef9581f7a8d3");
}

/*
	Name: assignsecondarytargets
	Namespace: helicopter
	Checksum: 0x6B0823AF
	Offset: 0x4958
	Size: 0x206
	Parameters: 1
	Flags: Linked
*/
function assignsecondarytargets(targets)
{
	for(idx = 0; idx < targets.size; idx++)
	{
		if(isvehicle(targets[idx]))
		{
			killstreaks::function_6d23c51c(targets[idx]);
			continue;
		}
		if(!isdefined(targets[idx].type))
		{
			self killstreaks::update_missile_player_threat(targets[idx]);
			continue;
		}
		if(targets[idx].type == "dog" || targets[0].type == "tank_drone")
		{
			killstreaks::update_missile_dog_threat(targets[idx]);
		}
	}
	/#
		assert(targets.size >= 2, "");
	#/
	highest = 0;
	second_highest = 0;
	primarytarget = undefined;
	secondarytarget = undefined;
	for(idx = 0; idx < targets.size; idx++)
	{
		/#
			assert(isdefined(targets[idx].missilethreatlevel), "");
		#/
		if(targets[idx].missilethreatlevel >= highest)
		{
			highest = targets[idx].missilethreatlevel;
			secondarytarget = targets[idx];
		}
	}
	/#
		assert(isdefined(secondarytarget), "");
	#/
	self.secondarytarget = secondarytarget;
	self notify(#"secondary acquired");
}

/*
	Name: heli_reset
	Namespace: helicopter
	Checksum: 0x1582159D
	Offset: 0x4B68
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function heli_reset()
{
	self cleartargetyaw();
	self cleargoalyaw();
	self setyawspeed(75, 45, 45);
	self setmaxpitchroll(10, 30);
	self setneargoalnotifydist(256);
}

/*
	Name: heli_wait
	Namespace: helicopter
	Checksum: 0xDDFF40C5
	Offset: 0x4C00
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function heli_wait(waittime)
{
	self endon(#"death", #"crashing", #"evasive");
	self thread heli_hover();
	wait(waittime);
	heli_reset();
	self notify(#"stop hover");
}

/*
	Name: heli_hover
	Namespace: helicopter
	Checksum: 0x2BA144BC
	Offset: 0x4C88
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function heli_hover()
{
	self endon(#"death", #"stop hover", #"evasive", #"leaving", #"crashing");
	randint = randomint(360);
	self setgoalyaw(self.angles[1] + randint);
}

/*
	Name: wait_for_killed
	Namespace: helicopter
	Checksum: 0xCFB6C8C7
	Offset: 0x4D30
	Size: 0x170
	Parameters: 0
	Flags: Linked
*/
function wait_for_killed()
{
	self endon(#"death", #"crashing", #"leaving");
	self.bda = 0;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"killed", #"destroyedaircraft");
		if(waitresult._notify == "destroyedAircraft")
		{
			self namespace_f9b02f80::play_pilot_dialog_on_owner("killAircraft", self.killstreaktype, self.killstreak_id);
			continue;
		}
		victim = waitresult.victim;
		if(!isdefined(self.owner) || !isdefined(victim))
		{
			continue;
		}
		if(self.owner == victim)
		{
			continue;
		}
		if(level.teambased && !util::function_fbce7263(self.owner.team, victim.team))
		{
			continue;
		}
		self thread wait_for_bda_timeout();
	}
}

/*
	Name: wait_for_bda_timeout
	Namespace: helicopter
	Checksum: 0x58008B12
	Offset: 0x4EA8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function wait_for_bda_timeout()
{
	self endon(#"killed");
	wait(2.5);
	if(!isdefined(self))
	{
		return;
	}
	self play_bda_dialog();
}

/*
	Name: play_bda_dialog
	Namespace: helicopter
	Checksum: 0x6B239609
	Offset: 0x4EF0
	Size: 0xE2
	Parameters: 0
	Flags: Linked
*/
function play_bda_dialog()
{
	if(self.bda == 1)
	{
		bdadialog = "kill1";
	}
	else
	{
		if(self.bda == 2)
		{
			bdadialog = "kill2";
		}
		else
		{
			if(self.bda == 3)
			{
				bdadialog = "kill3";
			}
			else if(self.bda > 3)
			{
				bdadialog = "killMultiple";
			}
		}
	}
	self namespace_f9b02f80::play_pilot_dialog_on_owner(bdadialog, self.killstreaktype, self.killstreak_id);
	self notify(#"bda_dialog", {#dialog_key:bdadialog});
	self.bda = 0;
}

/*
	Name: function_d4896942
	Namespace: helicopter
	Checksum: 0xECCF60C6
	Offset: 0x4FE0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_d4896942()
{
	chopper = self;
	chopper endon(#"death", #"attack_chopper_shutdown");
	chopper waittill(#"flare_deployed");
	self namespace_f9b02f80::play_pilot_dialog_on_owner("damageEvaded", chopper.killstreaktype, chopper.killstreak_id);
}

/*
	Name: function_9440face
	Namespace: helicopter
	Checksum: 0x6E8AC506
	Offset: 0x5070
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_9440face()
{
	chopper = self;
	chopper endon(#"death", #"attack_chopper_shutdown");
	chopper waittill(#"evasive");
	self namespace_f9b02f80::play_pilot_dialog_on_owner("evasiveAction", chopper.killstreaktype, chopper.killstreak_id);
}

/*
	Name: heli_hacked_health_update
	Namespace: helicopter
	Checksum: 0x7796855B
	Offset: 0x5100
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function heli_hacked_health_update(hacker)
{
	helicopter = self;
	hackeddamagetaken = helicopter.maxhealth - helicopter.hackedhealth;
	/#
		assert(hackeddamagetaken > 0);
	#/
	if(hackeddamagetaken > helicopter.damagetaken)
	{
		helicopter.damagetaken = hackeddamagetaken;
	}
}

/*
	Name: heli_damage_monitor
	Namespace: helicopter
	Checksum: 0x14081F64
	Offset: 0x5178
	Size: 0x96A
	Parameters: 1
	Flags: None
*/
function heli_damage_monitor(hardpointtype)
{
	helicopter = self;
	self endon(#"death", #"crashing");
	self.damagetaken = 0;
	last_hit_vo = 0;
	hit_vo_spacing = 6000;
	helicopter.hackedhealthupdatecallback = &heli_hacked_health_update;
	helicopter.hackedhealth = killstreak_bundles::get_hacked_health(hardpointtype);
	if(!isdefined(self.attackerdata))
	{
		self.attackers = [];
		self.attackerdata = [];
		self.attackerdamage = [];
		self.flareattackerdamage = [];
	}
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		weapon = waitresult.weapon;
		damage = waitresult.amount;
		type = waitresult.mod;
		flags = waitresult.flags;
		chargelevel = waitresult.chargelevel;
		if(!isdefined(attacker) || !isplayer(attacker))
		{
			continue;
		}
		heli_friendlyfire = damage::friendlyfirecheck(self.owner, attacker);
		if(!heli_friendlyfire)
		{
			continue;
		}
		if(!level.hardcoremode)
		{
			if(isdefined(self.owner) && attacker == self.owner)
			{
				continue;
			}
			if(level.teambased)
			{
				isvalidattacker = isdefined(attacker.team) && util::function_fbce7263(attacker.team, self.team);
			}
			else
			{
				isvalidattacker = 1;
			}
			if(!isvalidattacker)
			{
				continue;
			}
		}
		weapon_damage = killstreak_bundles::get_weapon_damage(hardpointtype, self.maxhealth, attacker, weapon, type, damage, flags, chargelevel);
		if(!isdefined(weapon_damage))
		{
			weapon_damage = killstreaks::get_old_damage(attacker, weapon, type, damage, 1, level.var_926d9f1);
		}
		self.damagetaken = self.damagetaken + weapon_damage;
		playercontrolled = 0;
		if(self.damagetaken > self.maxhealth && !isdefined(self.xpgiven))
		{
			self.xpgiven = 1;
			switch(hardpointtype)
			{
				case "helicopter_comlink":
				case "inventory_helicopter_comlink":
				{
					event = "attack_chopper_shutdown";
					if(self.leaving !== 1)
					{
						self namespace_f9b02f80::play_destroyed_dialog_on_owner(self.killstreaktype, self.killstreak_id);
						attacker notify(#"destroyedaircraft");
					}
					break;
				}
				case "supply_drop":
				case "supply_drop_combat_robot":
				{
					if(isdefined(helicopter.killstreakweaponname))
					{
						switch(helicopter.killstreakweaponname)
						{
							case "tank_robot":
							case "ai_tank_drop_marker":
							case "inventory_ai_tank_marker":
							case "inventory_tank_robot":
							case "ai_tank_marker":
							{
								event = "destroyed_helicopter_agr_drop";
								break;
							}
							case "combat_robot_marker":
							case "inventory_combat_robot_marker":
							case "combat_robot_drop":
							case "inventory_combat_robot_drop":
							{
								event = "destroyed_helicopter_giunit_drop";
								break;
							}
							default:
							{
								event = "care_package_shutdown";
								self namespace_f9b02f80::play_destroyed_dialog_on_owner(self.killstreaktype, self.killstreak_id);
								attacker notify(#"destroyedaircraft");
								break;
							}
						}
					}
					else
					{
						event = "care_package_shutdown";
					}
					break;
				}
			}
			if(isdefined(level.var_4d5e1035))
			{
				self [[level.var_4d5e1035]](attacker, weapon, type, weapon_damage, event, playercontrolled, hardpointtype);
			}
			weaponstatname = #"destroyed";
			switch(weapon.name)
			{
				case "tow_turret":
				case "tow_turret_drop":
				case "auto_tow":
				{
					weaponstatname = #"kills";
					break;
				}
			}
			attacker stats::function_e24eec31(weapon, weaponstatname, 1);
			notifystring = undefined;
			killstreakreference = undefined;
			switch(hardpointtype)
			{
				case "helicopter_player_firstperson":
				{
					killstreakreference = "killstreak_helicopter_player_firstperson";
					break;
				}
				case "helicopter_x2":
				case "helicopter_comlink":
				case "helicopter":
				case "inventory_helicopter_comlink":
				{
					notifystring = #"hash_286f843fea185e5";
					killstreakreference = "killstreak_helicopter_comlink";
					break;
				}
				case "supply_drop":
				{
					notifystring = #"hash_3267fdfd0c2b7fdc";
					killstreakreference = "killstreak_supply_drop";
					break;
				}
				case "helicopter_guard":
				{
					killstreakreference = "killstreak_helicopter_guard";
				}
			}
			if(isdefined(killstreakreference))
			{
				level.globalkillstreaksdestroyed++;
				attacker stats::function_e24eec31(getweapon(hardpointtype), #"destroyed", 1);
			}
			if(hardpointtype == "helicopter_player_gunner")
			{
				self.owner sendkillstreakdamageevent(600);
			}
			if(isdefined(notifystring))
			{
				luinotifyevent(#"player_callout", 2, notifystring, attacker.entnum);
			}
			if(isdefined(self.attackers))
			{
				for(j = 0; j < self.attackers.size; j++)
				{
					player = self.attackers[j];
					if(!isdefined(player))
					{
						continue;
					}
					if(player == attacker)
					{
						continue;
					}
					flare_done = self.flareattackerdamage[player.clientid];
					if(isdefined(flare_done) && flare_done == 1)
					{
						scoreevents::processscoreevent(#"aircraft_flare_assist", player, undefined, undefined);
						continue;
					}
					damage_done = self.attackerdamage[player.clientid];
					player thread processcopterassist(self, damage_done);
				}
				self.attackers = [];
			}
			attacker notify(#"destroyed_helicopter");
			if(target_istarget(self))
			{
				target_remove(self);
			}
		}
		else if(isdefined(self.owner) && isplayer(self.owner))
		{
			if(last_hit_vo + hit_vo_spacing < gettime())
			{
				if(type == "MOD_PROJECTILE" || randomintrange(0, 3) == 0)
				{
					last_hit_vo = gettime();
				}
			}
		}
	}
}

/*
	Name: init_active_camo
	Namespace: helicopter
	Checksum: 0x9CA00D3D
	Offset: 0x5AF0
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function init_active_camo()
{
	heli = self;
	heli.active_camo_damage = 0;
	heli.active_camo_disabled = 0;
	heli.camo_state = 0;
	heli_set_active_camo_state(1);
	if(isdefined(heli.flak_drone))
	{
		heli.flak_drone flak_drone::setcamostate(1);
	}
}

/*
	Name: heli_set_active_camo_state
	Namespace: helicopter
	Checksum: 0x46D8D161
	Offset: 0x5B78
	Size: 0x23C
	Parameters: 1
	Flags: Linked
*/
function heli_set_active_camo_state(state)
{
	heli = self;
	if(!isdefined(heli.active_camo_supported))
	{
		return;
	}
	if(state == 0)
	{
		heli clientfield::set("toggle_lights", 1);
		if(heli.camo_state == 1)
		{
			heli playsound(#"veh_hind_cloak_off");
		}
		heli.camo_state = 0;
		heli.camo_state_switch_time = gettime();
	}
	else
	{
		if(state == 1)
		{
			if(heli.active_camo_disabled)
			{
				return;
			}
			heli clientfield::set("toggle_lights", 0);
			if(heli.camo_state == 0)
			{
				heli playsound(#"veh_hind_cloak_on");
			}
			heli.camo_state = 1;
			heli.camo_state_switch_time = gettime();
			if(isdefined(heli.owner))
			{
				if(isdefined(heli.play_camo_dialog) && heli.play_camo_dialog)
				{
					heli namespace_f9b02f80::play_pilot_dialog_on_owner("activateCounter", "helicopter_comlink", self.killstreak_id);
					heli.play_camo_dialog = 0;
				}
				else if(!isdefined(heli.play_camo_dialog))
				{
					heli.play_camo_dialog = 1;
				}
			}
		}
		else if(state == 2)
		{
			heli clientfield::set("toggle_lights", 1);
		}
	}
	if(isdefined(heli.flak_drone))
	{
		heli.flak_drone flak_drone::setcamostate(state);
	}
	heli clientfield::set("active_camo", state);
}

/*
	Name: heli_active_camo_damage_update
	Namespace: helicopter
	Checksum: 0x9CAF118B
	Offset: 0x5DC0
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function heli_active_camo_damage_update(damage)
{
	self endon(#"death", #"crashing");
	heli = self;
	heli.active_camo_damage = heli.active_camo_damage + damage;
	if(heli.active_camo_damage > 100)
	{
		heli.active_camo_disabled = 1;
		heli thread heli_active_camo_damage_disable();
	}
	else
	{
		heli heli_set_active_camo_state(2);
		wait(1);
		heli heli_set_active_camo_state(1);
	}
}

/*
	Name: heli_active_camo_damage_disable
	Namespace: helicopter
	Checksum: 0xA23A291A
	Offset: 0x5E90
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function heli_active_camo_damage_disable()
{
	self endon(#"death", #"crashing");
	heli = self;
	heli notify(#"heli_active_camo_damage_disable");
	heli endon(#"heli_active_camo_damage_disable");
	heli heli_set_active_camo_state(0);
	wait(10);
	heli.active_camo_damage = 0;
	heli.active_camo_disabled = 0;
	heli heli_set_active_camo_state(1);
}

/*
	Name: heli_health
	Namespace: helicopter
	Checksum: 0x7D90E387
	Offset: 0x5F48
	Size: 0x282
	Parameters: 2
	Flags: Linked
*/
function heli_health(hardpointtype, playernotify)
{
	self endon(#"death", #"crashing");
	self.currentstate = "ok";
	self.laststate = "ok";
	damagestate = 3;
	for(;;)
	{
		self waittill(#"damage");
		waitframe(1);
		if(!isdefined(self.damagetaken))
		{
			waitframe(1);
			continue;
		}
		if(!is_true(self.var_5b3f091f) && self.damagetaken >= (self.maxhealth * 0.5))
		{
			self namespace_f9b02f80::play_pilot_dialog_on_owner("damaged", "helicopter_comlink", self.killstreak_id);
			self.var_5b3f091f = 1;
		}
		if(self.damagetaken > self.maxhealth)
		{
			damagestate = 0;
			self heli_set_active_camo_state(0);
			self thread function_ae4b9a81(hardpointtype, self.owner, playernotify);
			continue;
		}
		if(self.damagetaken >= (self.maxhealth * 0.66) && damagestate >= 2)
		{
			if(isdefined(self.var_ba5009c3))
			{
				playfxontag(self.var_ba5009c3, self, "tag_body");
			}
			damagestate = 1;
			self.currentstate = "heavy smoke";
			self.evasive = 1;
			self notify(#"damage state");
			continue;
		}
		if(self.damagetaken >= (self.maxhealth * 0.33) && damagestate == 3)
		{
			if(isdefined(self.var_5efaff3e))
			{
				playfxontag(self.var_5efaff3e, self, "tag_body");
			}
			damagestate = 2;
			self.currentstate = "light smoke";
			self notify(#"damage state");
		}
	}
}

/*
	Name: notify_player
	Namespace: helicopter
	Checksum: 0xF67EF269
	Offset: 0x61D8
	Size: 0x5A
	Parameters: 3
	Flags: Linked
*/
function notify_player(player, playernotify, delay)
{
	if(!isdefined(player))
	{
		return;
	}
	if(!isdefined(playernotify))
	{
		return;
	}
	player endon(#"disconnect", playernotify);
	wait(delay);
	player notify(playernotify);
}

/*
	Name: play_going_down_vo
	Namespace: helicopter
	Checksum: 0x104F4E74
	Offset: 0x6240
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function play_going_down_vo(delay)
{
	self.owner endon(#"disconnect");
	self endon(#"death");
	wait(delay);
}

/*
	Name: function_ae4b9a81
	Namespace: helicopter
	Checksum: 0x97712751
	Offset: 0x6288
	Size: 0x144
	Parameters: 3
	Flags: Linked
*/
function function_ae4b9a81(hardpointtype, player, playernotify)
{
	self endon(#"death");
	self notify(#"crashing");
	self influencers::remove_influencers();
	self stoploopsound(0);
	if(isdefined(self.minigun_snd_ent))
	{
		self.minigun_snd_ent stoploopsound();
	}
	if(isdefined(self.alarm_snd_ent))
	{
		self.alarm_snd_ent stoploopsound();
	}
	thread notify_player(player, playernotify, 0);
	self thread heli_explode();
	self thread explodeoncontact(hardpointtype);
	time = randomintrange(4, 6);
	self thread waitthenexplode(time);
}

/*
	Name: damagedrotorfx
	Namespace: helicopter
	Checksum: 0x896ACE9A
	Offset: 0x63D8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function damagedrotorfx()
{
	self endon(#"death");
	self setrotorspeed(0.6);
}

/*
	Name: waitthenexplode
	Namespace: helicopter
	Checksum: 0x16733884
	Offset: 0x6418
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function waitthenexplode(time)
{
	self endon(#"death");
	wait(time);
	self thread heli_explode();
}

/*
	Name: checkhelicoptertag
	Namespace: helicopter
	Checksum: 0xAD6523EF
	Offset: 0x6460
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function checkhelicoptertag(tagname)
{
	if(isdefined(self.model))
	{
		if(self.model == "veh_t8_drone_hunter_mp_light")
		{
			switch(tagname)
			{
				case "tag_engine_left":
				{
					return "tag_fx_exhaust2";
				}
				case "tag_engine_right":
				{
					return "tag_fx_exhaust1";
				}
				case "tail_rotor_jnt":
				{
					return "tag_fx_tail";
				}
				default:
				{
					break;
				}
			}
		}
	}
	return tagname;
}

/*
	Name: heli_secondary_explosions
	Namespace: helicopter
	Checksum: 0xC4F13AEE
	Offset: 0x6508
	Size: 0x144
	Parameters: 0
	Flags: None
*/
function heli_secondary_explosions()
{
	self endon(#"death");
	if(isdefined(self.var_78d69212))
	{
		playfxontag(self.var_78d69212, self, self checkhelicoptertag("tag_engine_left"));
	}
	self playsound(level.heli_sound[#"hit"]);
	self thread trail_fx(self.var_ba5009c3, self checkhelicoptertag("tail_rotor_jnt"), "stop tail smoke");
	wait(3);
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_78d69212))
	{
		playfxontag(self.var_78d69212, self, self checkhelicoptertag("tag_engine_left"));
	}
	self playsound(level.heli_sound[#"hitsecondary"]);
}

/*
	Name: heli_spin
	Namespace: helicopter
	Checksum: 0xDDFF4D74
	Offset: 0x6658
	Size: 0x9E
	Parameters: 1
	Flags: None
*/
function heli_spin(speed)
{
	self endon(#"death");
	self thread spinsoundshortly();
	self setyawspeed(speed, speed / 3, speed / 3);
	while(isdefined(self))
	{
		self settargetyaw(self.angles[1] + (speed * 0.9));
		wait(1);
	}
}

/*
	Name: spinsoundshortly
	Namespace: helicopter
	Checksum: 0xBD3A1C3E
	Offset: 0x6700
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function spinsoundshortly()
{
	self endon(#"death");
	wait(0.25);
	self stoploopsound();
	waitframe(1);
	self playloopsound(level.heli_sound[#"spinloop"]);
	waitframe(1);
	self playsound(level.heli_sound[#"spinstart"]);
}

/*
	Name: trail_fx
	Namespace: helicopter
	Checksum: 0xC092345E
	Offset: 0x67A0
	Size: 0x1C
	Parameters: 3
	Flags: Linked
*/
function trail_fx(trail_fx, trail_tag, stop_notify)
{
}

/*
	Name: function_69a7aed9
	Namespace: helicopter
	Checksum: 0x3F760B65
	Offset: 0x67C8
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_69a7aed9()
{
	if(self.var_7454fab === 1)
	{
		return;
	}
	self.var_7454fab = 1;
	if(isdefined(self.var_bdbe8391))
	{
		var_2e15ba7a = isdefined(self gettagorigin("tag_deathfx"));
		playfxontag(self.var_bdbe8391, self, (var_2e15ba7a ? "tag_deathfx" : "tag_origin"));
	}
}

/*
	Name: destroyhelicopter
	Namespace: helicopter
	Checksum: 0xDF9A9438
	Offset: 0x6860
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function destroyhelicopter(var_fec7078b)
{
	if(self.var_6c027ee0 === 1)
	{
		return;
	}
	self.var_6c027ee0 = 1;
	team = self.originalteam;
	if(target_istarget(self))
	{
		target_remove(self);
	}
	self influencers::remove_influencers();
	if(isdefined(self.interior_model))
	{
		self.interior_model delete();
		self.interior_model = undefined;
	}
	if(isdefined(self.minigun_snd_ent))
	{
		self.minigun_snd_ent stoploopsound();
		self.minigun_snd_ent delete();
		self.minigun_snd_ent = undefined;
	}
	if(isdefined(self.alarm_snd_ent))
	{
		self.alarm_snd_ent delete();
		self.alarm_snd_ent = undefined;
	}
	if(isdefined(self.flare_ent))
	{
		self.flare_ent delete();
		self.flare_ent = undefined;
	}
	if(isdefined(self.owner) && killstreaks::function_6bde02cc(self.hardpointtype))
	{
		self.owner killstreakrules::function_d9f8f32b(self.hardpointtype);
	}
	killstreakrules::killstreakstop(self.hardpointtype, team, self.killstreak_id);
	if(is_true(var_fec7078b))
	{
		self function_e1058a3e();
	}
	function_711c140b();
	self deletedelay();
}

/*
	Name: function_e1058a3e
	Namespace: helicopter
	Checksum: 0x9A790210
	Offset: 0x6A98
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function function_e1058a3e()
{
	if(!isdefined(self))
	{
		return;
	}
	if(self.var_3bfa7cf8 === 1)
	{
		return;
	}
	self.var_3bfa7cf8 = 1;
	if(isdefined(self.explosionfx))
	{
		var_2e15ba7a = isdefined(self gettagorigin("tag_deathfx"));
		playfxontag(self.explosionfx, self, (var_2e15ba7a ? "tag_deathfx" : "tag_origin"));
	}
	self playsound(level.heli_sound[#"crash"]);
}

/*
	Name: heli_explode
	Namespace: helicopter
	Checksum: 0xD31205D6
	Offset: 0x6B68
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function heli_explode()
{
	self endon(#"death");
	self function_e1058a3e();
	wait(0.1);
	/#
		assert(isdefined(self.destroyfunc));
	#/
	self [[self.destroyfunc]]();
}

/*
	Name: clear_client_flags
	Namespace: helicopter
	Checksum: 0x32AD11AD
	Offset: 0x6BD8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function clear_client_flags()
{
	self clientfield::set("heli_warn_fired", 0);
	self clientfield::set("heli_warn_targeted", 0);
	self clientfield::set("heli_warn_locked", 0);
}

/*
	Name: function_86012f82
	Namespace: helicopter
	Checksum: 0xB707E05E
	Offset: 0x6C48
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_86012f82(goalpos, stop)
{
	if(!isdefined(self))
	{
		return;
	}
	self.heligoalpos = goalpos;
	if(issentient(self) && ispathfinder(self) && ispointinnavvolume(self.origin, "navvolume_big"))
	{
		self setgoal(goalpos, stop);
		self function_a57c34b7(goalpos, stop, 1);
	}
	else
	{
		self function_a57c34b7(goalpos, stop, 0);
	}
}

/*
	Name: function_8de67419
	Namespace: helicopter
	Checksum: 0xC483C231
	Offset: 0x6D30
	Size: 0x186
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8de67419(var_b4c35bb7)
{
	self endon(#"death");
	radius = distance(self.origin, var_b4c35bb7);
	var_a9a839e2 = getclosestpointonnavvolume(var_b4c35bb7, "navvolume_big", radius);
	if(isdefined(var_a9a839e2))
	{
		self function_86012f82(var_a9a839e2, 0);
		while(true)
		{
			/#
				recordsphere(var_a9a839e2, 8, (0, 0, 1), "");
			#/
			var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
			if(!var_baa92af9)
			{
				if(issentient(self))
				{
					self function_60d50ea4();
				}
				self notify(#"hash_2bf34763927dd61b");
				break;
			}
			waitframe(1);
		}
	}
	else
	{
		if(issentient(self))
		{
			self function_60d50ea4();
		}
		self notify(#"hash_2bf34763927dd61b");
	}
}

/*
	Name: function_62eb6272
	Namespace: helicopter
	Checksum: 0xEB053392
	Offset: 0x6EC0
	Size: 0x2C4
	Parameters: 1
	Flags: Linked
*/
function function_62eb6272(var_70031e7b)
{
	self notify(#"destintation reached");
	self notify(#"leaving");
	hardpointtype = self.hardpointtype;
	self.leaving = 1;
	if(isdefined(level.var_14151f16))
	{
		[[level.var_14151f16]](self, 0);
	}
	if(!self.destroyscoreeventgiven === 1)
	{
		self namespace_f9b02f80::function_d2219b7d(hardpointtype);
	}
	leavenode = getvalidrandomstartnode(self.origin);
	var_b4c35bb7 = leavenode.origin;
	if(isdefined(var_70031e7b))
	{
		var_b4c35bb7 = var_70031e7b;
	}
	heli_reset();
	self vehclearlookat();
	exitangles = vectortoangles(var_b4c35bb7 - self.origin);
	self setgoalyaw(exitangles[1]);
	wait(1.5);
	if(!isdefined(self))
	{
		return;
	}
	self set_goal_pos((self.origin + ((var_b4c35bb7 - self.origin) / 2)) + vectorscale((0, 0, 1), 1000), 0);
	self waittill(#"near_goal", #"death");
	if(isdefined(self))
	{
		self set_goal_pos(var_b4c35bb7, 1);
		self waittill(#"goal", #"death");
		if(isdefined(self))
		{
			self stoploopsound(1);
			self util::death_notify_wrapper();
			if(isdefined(self.alarm_snd_ent))
			{
				self.alarm_snd_ent stoploopsound();
				self.alarm_snd_ent delete();
				self.alarm_snd_ent = undefined;
			}
			/#
				assert(isdefined(self.destroyfunc));
			#/
			self [[self.destroyfunc]]();
		}
	}
}

/*
	Name: function_fabf8bc5
	Namespace: helicopter
	Checksum: 0xAFDBEB72
	Offset: 0x7190
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_fabf8bc5(var_b4c35bb7)
{
	self endon(#"death", #"near_goal");
	while(true)
	{
		distsq = distancesquared(self.origin, var_b4c35bb7);
		if(distsq <= 10000)
		{
			self notify(#"fallback_goal");
			break;
		}
		waitframe(1);
	}
}

/*
	Name: heli_leave
	Namespace: helicopter
	Checksum: 0x1C3F41AC
	Offset: 0x7230
	Size: 0x414
	Parameters: 2
	Flags: Linked
*/
function heli_leave(var_70031e7b, var_1caffd41)
{
	if(!isdefined(var_70031e7b))
	{
		var_70031e7b = undefined;
	}
	if(!isdefined(var_1caffd41))
	{
		var_1caffd41 = 0;
	}
	if(!is_true(level.var_e071ed64) || var_1caffd41)
	{
		self thread function_62eb6272(var_70031e7b);
		return;
	}
	self notify(#"destintation reached");
	self notify(#"leaving");
	hardpointtype = self.hardpointtype;
	self.leaving = 1;
	if(isdefined(level.var_14151f16))
	{
		[[level.var_14151f16]](self, 0);
	}
	if(!is_true(self.destroyscoreeventgiven))
	{
		self namespace_f9b02f80::function_d2219b7d(hardpointtype);
	}
	leavenode = getvalidrandomstartnode(self.origin);
	var_b4c35bb7 = leavenode.origin;
	if(isdefined(var_70031e7b))
	{
		var_b4c35bb7 = var_70031e7b;
	}
	heli_reset();
	self function_3cca3796();
	self thread function_fabf8bc5(var_b4c35bb7);
	self vehclearlookat();
	exitangles = vectortoangles(var_b4c35bb7 - self.origin);
	self setgoalyaw(exitangles[1]);
	self function_86012f82(var_b4c35bb7, 1);
	if(ispointinnavvolume(var_b4c35bb7, "navvolume_big"))
	{
		if(isdefined(level.var_65f7e97e))
		{
			self waittilltimeout(level.var_65f7e97e, #"fallback_goal", #"near_goal", #"death");
		}
		else
		{
			self waittill(#"fallback_goal", #"near_goal", #"death");
		}
	}
	else
	{
		self thread function_8de67419(var_b4c35bb7);
		if(isdefined(level.var_65f7e97e))
		{
			self waittilltimeout(level.var_65f7e97e, #"fallback_goal", #"hash_2bf34763927dd61b", #"death");
		}
		else
		{
			self waittill(#"fallback_goal", #"hash_2bf34763927dd61b", #"death");
		}
	}
	if(isdefined(self))
	{
		self.nodeathfx = 1;
		self stoploopsound(1);
		self util::death_notify_wrapper();
		if(isdefined(self.alarm_snd_ent))
		{
			self.alarm_snd_ent stoploopsound();
			self.alarm_snd_ent delete();
			self.alarm_snd_ent = undefined;
		}
		/#
			assert(isdefined(self.destroyfunc));
		#/
		self [[self.destroyfunc]]();
	}
}

/*
	Name: function_3cca3796
	Namespace: helicopter
	Checksum: 0xC8B753CF
	Offset: 0x7650
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_3cca3796()
{
	self setmaxpitchroll(10, 30);
	self setspeed(self.killstreakbundle.var_654ebf9a, self.killstreakbundle.var_93eb6217, self.killstreakbundle.var_9eb6e1d7);
	self setyawspeed(55, 25, 25);
}

/*
	Name: set_heli_speed_evasive
	Namespace: helicopter
	Checksum: 0xBD9706C1
	Offset: 0x76E8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function set_heli_speed_evasive()
{
	self setmaxpitchroll(50, 60);
	self setspeed(self.killstreakbundle.var_9b7da715, self.killstreakbundle.var_b1e2863a, self.killstreakbundle.var_53a561c5);
	self setyawspeed(80, 60, 60);
	self notify(#"evasive");
}

/*
	Name: function_c82c2872
	Namespace: helicopter
	Checksum: 0x2D1145C6
	Offset: 0x7790
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function function_c82c2872()
{
	self setmaxpitchroll(50, 60);
	self setspeed(self.killstreakbundle.var_86311447, self.killstreakbundle.var_9c978691, self.killstreakbundle.var_9a9acbb1);
	self setyawspeed(55, 25, 25);
}

/*
	Name: set_heli_speed_hover
	Namespace: helicopter
	Checksum: 0x94A76127
	Offset: 0x7828
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function set_heli_speed_hover()
{
	self setmaxpitchroll(30, 30);
	self setspeed(self.killstreakbundle.var_9586f929, self.killstreakbundle.var_8c0d492f, self.killstreakbundle.var_4bbde8bf);
	self setyawspeed(55, 25, 25);
}

/*
	Name: is_targeted
	Namespace: helicopter
	Checksum: 0xEEA54BE4
	Offset: 0x78C0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function is_targeted()
{
	if(isdefined(self.locking_on) && self.locking_on)
	{
		return true;
	}
	if(isdefined(self.locked_on) && self.locked_on)
	{
		return true;
	}
	if(isdefined(self.locking_on_hacking) && self.locking_on_hacking)
	{
		return true;
	}
	return false;
}

/*
	Name: function_656691ab
	Namespace: helicopter
	Checksum: 0x7DB2B32E
	Offset: 0x7930
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_656691ab()
{
	self endon(#"death", #"abandoned");
	while(true)
	{
		var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
		if(var_baa92af9)
		{
			heli_reset();
			if(!ispathfinder(self))
			{
				self makepathfinder();
			}
			self util::make_sentient();
			if(isdefined(self.heligoalpos))
			{
				self set_goal_pos(self.heligoalpos, 1);
			}
			self notify(#"hash_340ab3c2b94ff86a");
			break;
		}
		wait(2);
	}
}

/*
	Name: function_81cba63
	Namespace: helicopter
	Checksum: 0xBD92D7AA
	Offset: 0x7A50
	Size: 0x22E
	Parameters: 0
	Flags: Linked
*/
function function_81cba63()
{
	self endon(#"death", #"abandoned");
	while(true)
	{
		if(isdefined(self.protectdest))
		{
			/#
				recordsphere(self.protectdest, 8, (0, 0, 1), "");
			#/
		}
		if(isdefined(self.var_6c63b409))
		{
			/#
				recordline(self.protectdest, self.var_6c63b409, (0, 1, 0), "");
				recordsphere(self.var_6c63b409, 8, (0, 1, 0), "");
			#/
		}
		if(isdefined(self.goalpos))
		{
			/#
				recordsphere(self.goalpos, 8, (0, 1, 1), "");
				recordline(self.origin, self.goalpos, (0, 1, 1), "");
			#/
		}
		if(isdefined(self.var_2c1a38eb) && isdefined(self.var_f9d38924))
		{
			/#
				recordsphere(self.var_f9d38924, 8, (0, 1, 0), "");
				recordline(self.var_2c1a38eb, self.var_f9d38924, (0, 1, 0), "");
				record3dtext("" + distance(self.var_2c1a38eb, self.var_f9d38924), self.var_f9d38924 + vectorscale((0, 0, 1), 20), (0, 1, 0), "");
			#/
		}
		waitframe(1);
	}
}

/*
	Name: heli_get_protect_spot
	Namespace: helicopter
	Checksum: 0x99C59827
	Offset: 0x7C88
	Size: 0x46E
	Parameters: 6
	Flags: Linked
*/
function heli_get_protect_spot(heli, protectdest, var_551cf1b9, heli_team, hardpointtype, var_c18556e5)
{
	if(!isdefined(var_c18556e5))
	{
		var_c18556e5 = 0;
	}
	if(!isdefined(heli_team))
	{
		heli_team = self.killstreakbundle.var_b9e5735e;
	}
	if(var_c18556e5)
	{
		heli_team = self.killstreakbundle.var_2c883372;
	}
	min_radius = int(heli_team * 0.3);
	max_radius = heli_team;
	groundpos = getclosestpointonnavmesh(var_551cf1b9, 10000);
	heightmin = self.killstreakbundle.var_2e4c8245;
	heightmax = self.killstreakbundle.var_8c1406f;
	if(hardpointtype == #"axis")
	{
		heightmin = heightmin + self.killstreakbundle.var_d2c774e8;
		heightmax = heightmax + self.killstreakbundle.var_d2c774e8;
	}
	hoverheight = heightmin + ((heightmax - heightmin) / 2);
	radius = 10000;
	if(isdefined(groundpos))
	{
		var_9ff2f344 = undefined;
		if(isdefined(self.var_8475558b))
		{
			var_9ff2f344 = getclosestpointonnavmesh(self.var_8475558b.origin, 10000);
		}
		if(!isdefined(var_9ff2f344) && isdefined(self.primarytarget))
		{
			var_9ff2f344 = getclosestpointonnavmesh(self.primarytarget.origin, 10000);
		}
		if(isdefined(var_9ff2f344))
		{
			groundpos = var_9ff2f344;
		}
		var_551cf1b9 = (groundpos[0], groundpos[1], groundpos[2] + hoverheight);
		var_551cf1b9 = getclosestpointonnavvolume(var_551cf1b9, "navvolume_big", radius);
		if(isdefined(var_551cf1b9))
		{
			self.var_2c1a38eb = groundpos;
			self.var_f9d38924 = var_551cf1b9;
			halfheight = (heightmax - heightmin) / 2;
			queryresult = positionquery_source_navigation(var_551cf1b9, min_radius, max_radius, halfheight, 50, self);
			if(isdefined(queryresult.data) && queryresult.data.size)
			{
				validpoints = [];
				if(var_c18556e5)
				{
					var_7f378b0 = int(max_radius * 0.5);
				}
				else
				{
					var_7f378b0 = randomintrange(int(max_radius * 0.4), int(max_radius * 0.9));
				}
				foreach(point in queryresult.data)
				{
					distsq = distancesquared(self.origin, point.origin);
					if(distsq >= sqr(var_7f378b0))
					{
						array::add(validpoints, point);
					}
				}
				if(validpoints.size)
				{
					return array::random(validpoints);
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_438e7b44
	Namespace: helicopter
	Checksum: 0x5700DF59
	Offset: 0x8100
	Size: 0x55C
	Parameters: 4
	Flags: Linked
*/
function function_438e7b44(startnode, protectdest, hardpointtype, heli_team)
{
	self endon(#"death");
	self notify(#"flying");
	self endon(#"flying", #"abandoned");
	self.reached_dest = 0;
	heli_reset();
	wait(2);
	currentdest = protectdest;
	nodeheight = protectdest[2];
	nextnode = startnode;
	heightoffset = 0;
	if(heli_team == #"axis")
	{
		heightoffset = 400;
	}
	protectdest = (protectdest[0], protectdest[1], nodeheight);
	noflyzoneheight = airsupport::getnoflyzoneheight(protectdest);
	protectdest = (protectdest[0], protectdest[1], noflyzoneheight + heightoffset);
	currentdest = protectdest;
	starttime = gettime();
	self.endtime = starttime + (int(self.killstreakbundle.var_11953731 * 1000));
	self.halftime = starttime + (int((self.killstreakbundle.var_11953731 * 0.5) * 1000));
	self.killstreakendtime = int(self.endtime);
	self set_goal_pos((self.origin + ((currentdest - self.origin) / 3)) + vectorscale((0, 0, 1), 1000), 0);
	self waittill(#"near_goal");
	self namespace_f9b02f80::play_pilot_dialog_on_owner("arrive", hardpointtype, self.killstreak_id);
	self thread updatetargetyaw();
	mapenter = 1;
	var_2ca2e589 = 1;
	while(gettime() < self.endtime)
	{
		if(!is_true(self.var_478039e8) && gettime() >= self.halftime)
		{
			self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", hardpointtype);
			self.var_478039e8 = 1;
		}
		self set_goal_pos(currentdest, 1);
		self thread updatespeed();
		self waittill(#"near_goal");
		hostmigration::waittillhostmigrationdone();
		self notify(#"path start");
		if(self is_targeted())
		{
			if(is_true(var_2ca2e589))
			{
				var_2ca2e589 = 0;
			}
			else
			{
				wait(5);
			}
		}
		else
		{
			waittillframeend();
			time = self.killstreakbundle.var_1aeb607e;
			if(self.evasive == 1)
			{
				time = 2;
			}
			if(is_true(var_2ca2e589))
			{
				waitresult = undefined;
				waitresult = self waittilltimeout(time, #"locking on", #"locking on hacking", #"damage state");
				if(waitresult._notify != "timeout")
				{
					var_2ca2e589 = 0;
				}
			}
			else
			{
				wait(time);
			}
		}
		prevdest = currentdest;
		currentdest = function_d5de7cb1(self, protectdest, nodeheight);
		noflyzoneheight = airsupport::getnoflyzoneheight(currentdest);
		currentdest = (currentdest[0], currentdest[1], noflyzoneheight + heightoffset);
		noflyzones = airsupport::crossesnoflyzones(prevdest, currentdest);
		if(isdefined(noflyzones) && noflyzones.size > 0)
		{
			currentdest = prevdest;
		}
	}
	self heli_set_active_camo_state(1);
	self thread heli_leave();
}

/*
	Name: heli_random_point_in_radius
	Namespace: helicopter
	Checksum: 0x11F258BC
	Offset: 0x8668
	Size: 0x102
	Parameters: 2
	Flags: Linked
*/
function heli_random_point_in_radius(protectdest, nodeheight)
{
	min_distance = int(level.heli_protect_radius * 0.2);
	direction = randomintrange(0, 360);
	distance = randomintrange(min_distance, level.heli_protect_radius);
	x = cos(direction);
	y = sin(direction);
	x = x * distance;
	y = y * distance;
	return (protectdest[0] + x, protectdest[1] + y, nodeheight);
}

/*
	Name: function_d5de7cb1
	Namespace: helicopter
	Checksum: 0x72A1E351
	Offset: 0x8778
	Size: 0xFA
	Parameters: 3
	Flags: Linked
*/
function function_d5de7cb1(heli, protectdest, nodeheight)
{
	protect_spot = heli_random_point_in_radius(protectdest, nodeheight);
	tries = 10;
	noflyzone = airsupport::crossesnoflyzone(protectdest, protect_spot);
	while(tries != 0 && isdefined(noflyzone))
	{
		protect_spot = heli_random_point_in_radius(protectdest, nodeheight);
		tries--;
		noflyzone = airsupport::crossesnoflyzone(protectdest, protect_spot);
	}
	noflyzoneheight = airsupport::getnoflyzoneheightcrossed(protectdest, protect_spot, nodeheight);
	return (protect_spot[0], protect_spot[1], noflyzoneheight);
}

/*
	Name: heli_protect
	Namespace: helicopter
	Checksum: 0x3B1B2CE8
	Offset: 0x8880
	Size: 0x82C
	Parameters: 4
	Flags: Linked
*/
function heli_protect(startnode, protectdest, hardpointtype, heli_team)
{
	if(!is_true(level.var_e071ed64))
	{
		self thread function_438e7b44(startnode, protectdest, hardpointtype, heli_team);
		return;
	}
	self endon(#"death", #"abandoned");
	self notify(#"flying");
	self endon(#"flying");
	heli_reset();
	self setneargoalnotifydist(400);
	self.reached_dest = 0;
	self.goalradius = 30;
	starttime = gettime();
	self.halftime = starttime + (int((self.killstreakbundle.var_11953731 * 0.5) * 1000));
	self.killstreakendtime = starttime + (int(self.killstreakbundle.var_11953731 * 1000));
	self.endtime = starttime + (int(self.killstreakbundle.var_11953731 * 1000));
	self thread function_656691ab();
	self thread function_81cba63();
	self.protectdest = protectdest;
	self.var_6c63b409 = protectdest;
	radius = 10000;
	if(isdefined(self.owner))
	{
		radius = distance(protectdest, self.origin);
	}
	var_a9a839e2 = getclosestpointonnavvolume(protectdest, "navvolume_big", radius);
	if(isdefined(var_a9a839e2))
	{
		protectdest = var_a9a839e2;
		self.var_6c63b409 = protectdest;
		var_b140bc48 = heli_get_protect_spot(self, protectdest, 300, heli_team, hardpointtype);
		if(isdefined(var_b140bc48))
		{
			self function_86012f82(var_b140bc48.origin, 1);
			protectdest = var_b140bc48.origin;
			self.var_6c63b409 = var_b140bc48.origin;
		}
		else
		{
			self function_86012f82(protectdest, 1);
		}
	}
	self thread updatetargetyaw();
	self function_3cca3796();
	self function_86012f82(protectdest, 1);
	self waittilltimeout(30, #"near_goal", #"hash_60aef9581f7a8d3");
	self setneargoalnotifydist(256);
	var_520e3459 = self.killstreakbundle.var_1aeb607e;
	var_2ca2e589 = 1;
	self thread updatespeed();
	evasive = 0;
	waitresult = undefined;
	while(gettime() < self.killstreakendtime)
	{
		if(!is_true(self.var_478039e8) && gettime() >= self.halftime)
		{
			self namespace_f9b02f80::play_pilot_dialog_on_owner("timecheck", hardpointtype);
			self.var_478039e8 = 1;
		}
		var_520e3459 = randomintrange(self.killstreakbundle.var_c2d3a27e, self.killstreakbundle.var_37667062);
		if((int(var_520e3459 * 1000)) + gettime() > self.killstreakendtime)
		{
			var_520e3459 = (float(self.killstreakendtime - gettime())) / 1000;
		}
		if(!isdefined(self))
		{
			return;
		}
		if(isdefined(self.var_8475558b) && isalive(self.var_8475558b) && waitresult._notify === "acquired_heli_target")
		{
			var_38cab71f = (isdefined(self.killstreakbundle.var_a6190387) ? self.killstreakbundle.var_a6190387 : 300);
			newdest = heli_get_protect_spot(self, self.origin, var_38cab71f, heli_team, hardpointtype, evasive);
		}
		else
		{
			newdest = heli_get_protect_spot(self, protectdest, undefined, heli_team, hardpointtype, evasive);
		}
		waitresult = undefined;
		if(isdefined(newdest))
		{
			self function_86012f82(newdest.origin, 1);
			waitresult = undefined;
			waitresult = self waittilltimeout(var_520e3459, #"abort_goal", #"locking on", #"locking on hacking", #"acquired_heli_target");
		}
		else
		{
			waitresult = undefined;
			waitresult = self waittilltimeout(var_520e3459, #"abort_goal", #"locking on", #"locking on hacking", #"acquired_heli_target");
		}
		if(waitresult._notify === "locking on" || waitresult._notify === "locking on" || self is_targeted())
		{
			self setneargoalnotifydist(60);
			evasive = 1;
		}
		else
		{
			self setneargoalnotifydist(256);
			evasive = 0;
		}
		if(!ispointinnavvolume(self.origin, "navvolume_big"))
		{
			var_a9a839e2 = getclosestpointonnavvolume(self.origin, "navvolume_big", 3000);
			if(isdefined(var_a9a839e2))
			{
				self.origin = var_a9a839e2;
			}
		}
		self notify(#"path start");
	}
	self heli_set_active_camo_state(1);
	if(isdefined(self.owner) && killstreaks::function_6bde02cc(hardpointtype))
	{
		self.owner killstreakrules::function_d9f8f32b(hardpointtype);
	}
	self thread heli_leave();
}

/*
	Name: updatespeed
	Namespace: helicopter
	Checksum: 0x5E6E8548
	Offset: 0x90B8
	Size: 0xC6
	Parameters: 0
	Flags: Linked
*/
function updatespeed()
{
	self endon(#"death", #"crashing", #"leaving");
	while(true)
	{
		if(self is_targeted() || (isdefined(self.evasive) && self.evasive))
		{
			set_heli_speed_evasive();
		}
		else
		{
			if(isdefined(self.var_a6642d42))
			{
				function_c82c2872();
			}
			else
			{
				set_heli_speed_hover();
			}
		}
		wait(1);
	}
}

/*
	Name: updatetargetyaw
	Namespace: helicopter
	Checksum: 0xA14CBDCF
	Offset: 0x9188
	Size: 0xFE
	Parameters: 0
	Flags: Linked
*/
function updatetargetyaw()
{
	self notify(#"endtargetyawupdate");
	self endon(#"death", #"crashing", #"leaving", #"endtargetyawupdate");
	for(;;)
	{
		if(isdefined(self.primarytarget))
		{
			yaw = math::get_2d_yaw(self.origin, self.primarytarget.origin);
			self settargetyaw(yaw);
		}
		else if(isdefined(self.var_6c63b409))
		{
			yaw = math::get_2d_yaw(self.origin, self.var_6c63b409);
			self settargetyaw(yaw);
		}
		wait(1);
	}
}

/*
	Name: function_644ef4bf
	Namespace: helicopter
	Checksum: 0x41F6B686
	Offset: 0x9290
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_644ef4bf(target)
{
	self endon(#"death");
	target waittill(#"death", #"crashing", #"explode");
	self detonate();
}

/*
	Name: fire_missile
	Namespace: helicopter
	Checksum: 0xF296B73
	Offset: 0x9308
	Size: 0x266
	Parameters: 2
	Flags: Linked
*/
function fire_missile(ishots, etarget)
{
	if(!isdefined(ishots))
	{
		ishots = 1;
	}
	/#
		assert(self.health > 0);
	#/
	weaponshoottime = undefined;
	tags = [];
	tags[0] = "tag_flash";
	tags[1] = "tag_flash1";
	tags[2] = "tag_flash2";
	tags[3] = "tag_flash3";
	weapon = getweapon(self.killstreakbundle.var_51be948f);
	/#
		assert(isdefined(weapon));
	#/
	/#
		assert(tags.size > 0);
	#/
	weaponshoottime = weapon.firetime;
	/#
		assert(isdefined(weaponshoottime));
	#/
	nextmissiletag = -1;
	for(i = 0; i < ishots; i++)
	{
		nextmissiletag++;
		if(nextmissiletag >= tags.size)
		{
			nextmissiletag = 0;
		}
		emissile = magicbullet(weapon, self gettagorigin(tags[nextmissiletag]), etarget.origin, etarget);
		emissile thread function_644ef4bf(etarget);
		emissile missile_settarget(etarget);
		emissile.team = self.team;
		emissile.var_30dc969d = 1;
		heatseekingmissile::initlockfield(etarget);
		etarget heatseekingmissile::function_a439ae56(emissile, weapon, self.owner);
		emissile.killcament = self;
		self.lastrocketfiretime = gettime();
		if(i < ishots - 1)
		{
			wait(weaponshoottime);
		}
	}
}

/*
	Name: check_owner
	Namespace: helicopter
	Checksum: 0x5ACF27F8
	Offset: 0x9578
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function check_owner(hardpointtype)
{
	if(!isdefined(self.owner) || !isdefined(self.owner.team) || self.owner.team != self.team)
	{
		self notify(#"abandoned");
		self thread heli_leave();
	}
}

/*
	Name: attack_targets
	Namespace: helicopter
	Checksum: 0xC3B82363
	Offset: 0x9600
	Size: 0x84
	Parameters: 3
	Flags: Linked
*/
function attack_targets(missilesenabled, hardpointtype, var_22f224d7)
{
	if(!isdefined(var_22f224d7))
	{
		var_22f224d7 = 1;
	}
	self thread attack_primary(hardpointtype);
	if(missilesenabled)
	{
		self thread attack_secondary(hardpointtype);
	}
	else if(var_22f224d7)
	{
		self thread function_83430362(hardpointtype);
	}
}

/*
	Name: function_7078bd6e
	Namespace: helicopter
	Checksum: 0x1B92EEA5
	Offset: 0x9690
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_7078bd6e(helicopter)
{
	var_5052ae94 = [];
	var_5052ae94[0] = self.killstreakbundle.var_86e2b32a;
	var_5052ae94[1] = self.killstreakbundle.var_793017c5;
	if(!isdefined(var_5052ae94[0]) && !isdefined(var_5052ae94[1]))
	{
		return false;
	}
	return true;
}

/*
	Name: function_83430362
	Namespace: helicopter
	Checksum: 0x275158D8
	Offset: 0x9710
	Size: 0x6B6
	Parameters: 1
	Flags: Linked
*/
function function_83430362(hardpointtype)
{
	self endon(#"death", #"crashing", #"leaving");
	level endon(#"game_ended");
	var_5052ae94 = [];
	var_5052ae94[0] = self.killstreakbundle.var_86e2b32a;
	var_5052ae94[1] = self.killstreakbundle.var_793017c5;
	if(!isdefined(var_5052ae94[0]) && !isdefined(var_5052ae94[1]))
	{
		return;
	}
	for(i = 0; i < var_5052ae94.size; i++)
	{
		if(isdefined(var_5052ae94[i]))
		{
			self turretsetontargettolerance(var_5052ae94[i], 5);
		}
	}
	var_f3b08e50 = (isdefined(self.killstreakbundle.var_7bba276c) ? self.killstreakbundle.var_7bba276c : 10);
	var_9b40542d = (isdefined(self.killstreakbundle.var_cce6aee8) ? self.killstreakbundle.var_cce6aee8 : 20);
	var_f2c81dc3 = (isdefined(self.killstreakbundle.var_3286050) ? self.killstreakbundle.var_3286050 : 2);
	var_dca0680c = (isdefined(self.killstreakbundle.var_fdfa0253) ? self.killstreakbundle.var_fdfa0253 : 5);
	targetcosine = cos((isdefined(self.killstreakbundle.var_96879013) ? self.killstreakbundle.var_96879013 : 30) / 2);
	for(;;)
	{
		if(isdefined(self.helitarget))
		{
			self.var_8475558b = self.helitarget;
			self.var_a6642d42 = 0;
			while(isdefined(self.var_8475558b) && isalive(self.var_8475558b))
			{
				self vehlookat(self.var_8475558b);
				if(isdefined(var_5052ae94[0]))
				{
					self turret::set_target(self.var_8475558b, undefined, var_5052ae94[0]);
				}
				if(isdefined(var_5052ae94[1]))
				{
					self turret::set_target(self.var_8475558b, undefined, var_5052ae94[1]);
				}
				while(isdefined(self.var_8475558b) && isalive(self.var_8475558b) && !self util::within_fov(self.origin, self.angles, self.var_8475558b.origin, targetcosine))
				{
					if(sighttracepassed(self.origin, self.var_8475558b.origin, 0, self, self.var_8475558b))
					{
						break;
					}
					else
					{
						waitframe(1);
					}
				}
				if(!isdefined(self.var_8475558b) || !isalive(self.var_8475558b))
				{
					break;
				}
				self.var_a6642d42 = 1;
				self notify(#"acquired_heli_target");
				if(isdefined(var_5052ae94[0]))
				{
					turret::function_38841344(self.var_8475558b, var_5052ae94[0]);
				}
				else if(isdefined(var_5052ae94[1]))
				{
					turret::function_38841344(self.var_8475558b, var_5052ae94[1]);
				}
				self notify(#"turret_on_target");
				if(isdefined(self.var_8475558b))
				{
					self playsound("wpn_attack_helicopter_spin_start_npc");
					wait(0.3);
					self playloopsound("wpn_attack_helicopter_spin_loop_npc");
					wait(level.heli_turret_spinup_delay);
					burstsize = function_21a3a673(var_f3b08e50, var_9b40542d);
					for(i = 0; i < burstsize; i++)
					{
						for(j = 0; j < var_5052ae94.size; j++)
						{
							if(isdefined(var_5052ae94[j]))
							{
								if(isdefined(self.var_8475558b))
								{
									self.var_d9971601 = self.var_8475558b.origin;
									self turretsettarget(var_5052ae94[j], self.var_8475558b);
									self fireweapon(var_5052ae94[j], self.var_8475558b);
									continue;
								}
								if(isdefined(self.var_d9971601))
								{
									self turretsettarget(var_5052ae94[j], self.var_d9971601);
								}
								self fireweapon(var_5052ae94[j]);
							}
						}
						waitframe(1);
					}
				}
				self notify(#"turret reloading");
				self stoploopsound(1);
				self playsound("wpn_attack_helicopter_spin_stop_npc");
				burstdelay = function_21a3a673(var_f2c81dc3, var_dca0680c);
				wait(burstdelay);
				if(!isdefined(self.var_8475558b) || (isdefined(self.helitarget) && isdefined(self.var_8475558b) && self.var_8475558b != self.helitarget))
				{
					break;
				}
			}
		}
		self waittill(#"hash_27ba79e760b6494f");
	}
}

/*
	Name: attack_secondary
	Namespace: helicopter
	Checksum: 0x7CA93FE4
	Offset: 0x9DD0
	Size: 0x1B8
	Parameters: 1
	Flags: Linked
*/
function attack_secondary(hardpointtype)
{
	self endon(#"death", #"crashing", #"leaving");
	level endon(#"game_ended");
	for(;;)
	{
		if(isdefined(self.secondarytarget))
		{
			self.secondarytarget.antithreat = undefined;
			self.missiletarget = self.secondarytarget;
			antithreat = 0;
			while(isdefined(self.missiletarget) && isalive(self.missiletarget))
			{
				self vehlookat(self.missiletarget);
				self thread missile_support(self.missiletarget, level.heli_missile_rof, 1, undefined);
				antithreat = antithreat + 100;
				self.missiletarget.antithreat = antithreat;
				wait(level.heli_missile_rof);
				if(!isdefined(self.secondarytarget) || (isdefined(self.secondarytarget) && self.missiletarget != self.secondarytarget))
				{
					break;
				}
			}
			if(isdefined(self.missiletarget))
			{
				self.missiletarget.antithreat = undefined;
			}
		}
		self waittill(#"secondary acquired");
		self check_owner(hardpointtype);
	}
}

/*
	Name: turret_target_check
	Namespace: helicopter
	Checksum: 0xAE2C8C2C
	Offset: 0x9F90
	Size: 0xF2
	Parameters: 2
	Flags: None
*/
function turret_target_check(turrettarget, attackangle)
{
	targetyaw = math::get_2d_yaw(self.origin, turrettarget.origin);
	chopperyaw = self.angles[1];
	if(targetyaw < 0)
	{
		targetyaw = targetyaw * -1;
	}
	targetyaw = int(targetyaw) % 360;
	if(chopperyaw < 0)
	{
		chopperyaw = chopperyaw * -1;
	}
	chopperyaw = int(chopperyaw) % 360;
	if(chopperyaw > targetyaw)
	{
		difference = chopperyaw - targetyaw;
	}
	else
	{
		difference = targetyaw - chopperyaw;
	}
	return difference <= attackangle;
}

/*
	Name: target_cone_check
	Namespace: helicopter
	Checksum: 0x8842EF4F
	Offset: 0xA090
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function target_cone_check(target, conecosine)
{
	heli2target_normal = vectornormalize(target.origin - self.origin);
	heli2forward = anglestoforward(self.angles);
	heli2forward_normal = vectornormalize(heli2forward);
	heli_dot_target = vectordot(heli2target_normal, heli2forward_normal);
	if(heli_dot_target >= conecosine)
	{
		/#
			airsupport::debug_print3d_simple("" + heli_dot_target, self, vectorscale((0, 0, -1), 40), 40);
		#/
		return true;
	}
	return false;
}

/*
	Name: missile_support
	Namespace: helicopter
	Checksum: 0x890E7F83
	Offset: 0xA190
	Size: 0x2EE
	Parameters: 4
	Flags: Linked
*/
function missile_support(target_player, rof, instantfire, endon_notify)
{
	self endon(#"death", #"crashing", #"leaving");
	if(isdefined(endon_notify))
	{
		self endon(endon_notify);
	}
	self.turret_giveup = 0;
	if(!instantfire)
	{
		wait(rof);
		self.turret_giveup = 1;
		self notify(#"give up");
	}
	if(isdefined(target_player))
	{
		if(level.teambased)
		{
			for(i = 0; i < level.players.size; i++)
			{
				player = level.players[i];
				if(isdefined(player.team) && !util::function_fbce7263(player.team, self.team) && distance(player.origin, target_player.origin) <= level.heli_missile_friendlycare)
				{
					/#
						airsupport::debug_print3d_simple("", self, vectorscale((0, 0, -1), 80), 40);
					#/
					self notify(#"hash_e4d0e93ec90d140");
					return;
				}
			}
		}
		else
		{
			player = self.owner;
			if(isdefined(player) && isdefined(player.team) && !util::function_fbce7263(player.team, self.team) && distance(player.origin, target_player.origin) <= level.heli_missile_friendlycare)
			{
				/#
					airsupport::debug_print3d_simple("", self, vectorscale((0, 0, -1), 80), 40);
				#/
				self notify(#"hash_e4d0e93ec90d140");
				return;
			}
		}
	}
	if(self.missile_ammo > 0 && isdefined(target_player))
	{
		self fire_missile(1, target_player);
		self.missile_ammo--;
		self notify(#"missile fired");
	}
	else
	{
		return;
	}
	if(instantfire)
	{
		wait(rof);
		self notify(#"hash_e4d0e93ec90d140");
	}
}

/*
	Name: attack_primary
	Namespace: helicopter
	Checksum: 0x9D1BF9F0
	Offset: 0xA488
	Size: 0x550
	Parameters: 1
	Flags: Linked
*/
function attack_primary(hardpointtype)
{
	self endon(#"death", #"crashing", #"leaving");
	level endon(#"game_ended");
	gunnerindex = (isdefined(self.killstreakbundle.var_240a171) ? self.killstreakbundle.var_240a171 : 0);
	self turretsetontargettolerance(gunnerindex, 5);
	var_f3b08e50 = (isdefined(self.killstreakbundle.var_cdd02f26) ? self.killstreakbundle.var_cdd02f26 : 10);
	var_9b40542d = (isdefined(self.killstreakbundle.var_def96cd0) ? self.killstreakbundle.var_def96cd0 : 20);
	var_f2c81dc3 = (isdefined(self.killstreakbundle.var_43e0fae) ? self.killstreakbundle.var_43e0fae : 2);
	var_dca0680c = (isdefined(self.killstreakbundle.var_9770d1a6) ? self.killstreakbundle.var_9770d1a6 : 5);
	for(;;)
	{
		if(isdefined(self.primarytarget) && !isdefined(self.helitarget))
		{
			self.primarytarget.antithreat = undefined;
			self.turrettarget = self.primarytarget;
			antithreat = 0;
			while(isdefined(self.turrettarget) && isalive(self.turrettarget))
			{
				if(!isdefined(self.turrettarget) || !isalive(self.turrettarget))
				{
					break;
				}
				self vehlookat(self.turrettarget);
				self turretsettarget(gunnerindex, self.primarytarget);
				turret::function_38841344(self.turrettarget, gunnerindex);
				self notify(#"turret_on_target");
				if(isdefined(self.primarytarget))
				{
					self playsound("wpn_attack_helicopter_spin_start_npc");
					wait(0.4);
					self playloopsound("wpn_attack_helicopter_spin_loop_npc");
					wait(level.heli_turret_spinup_delay);
					burstsize = function_21a3a673(var_f3b08e50, var_9b40542d);
					for(i = 0; i < burstsize; i++)
					{
						if(isdefined(self.primarytarget))
						{
							self.var_2c6d8331 = self.primarytarget.origin;
							self turretsettarget(gunnerindex, self.primarytarget);
							minigun = self fireweapon(gunnerindex, self.primarytarget);
						}
						else
						{
							if(isdefined(self.var_2c6d8331))
							{
								self turretsettarget(gunnerindex, self.var_2c6d8331);
							}
							self fireweapon(gunnerindex);
						}
						waitframe(1);
					}
				}
				self notify(#"turret reloading");
				self stoploopsound(1);
				self playsound("wpn_attack_helicopter_spin_stop_npc");
				burstdelay = function_21a3a673(var_f2c81dc3, var_dca0680c);
				wait(burstdelay);
				if(isdefined(self.turrettarget) && isalive(self.turrettarget))
				{
					antithreat = antithreat + 100;
					self.turrettarget.antithreat = antithreat;
				}
				if(!isdefined(self.primarytarget) || (isdefined(self.turrettarget) && isdefined(self.primarytarget) && self.primarytarget != self.turrettarget))
				{
					break;
				}
			}
			if(isdefined(self.turrettarget))
			{
				self.turrettarget.antithreat = undefined;
			}
		}
		self waittill(#"hash_60aef9581f7a8d3");
		self check_owner(hardpointtype);
	}
}

/*
	Name: debug_print_target
	Namespace: helicopter
	Checksum: 0x9F181236
	Offset: 0xA9E0
	Size: 0x25C
	Parameters: 0
	Flags: None
*/
function debug_print_target()
{
	/#
		if(isdefined(level.heli_debug) && level.heli_debug == 1)
		{
			if(isdefined(self.primarytarget) && isdefined(self.primarytarget.threatlevel))
			{
				if(isdefined(self.primarytarget.type) && self.primarytarget.type == "")
				{
					name = "";
				}
				else
				{
					name = self.primarytarget.name;
				}
				primary_msg = (("" + name) + "") + self.primarytarget.threatlevel;
			}
			else
			{
				primary_msg = "";
			}
			if(isdefined(self.secondarytarget) && isdefined(self.secondarytarget.threatlevel))
			{
				if(isdefined(self.secondarytarget.type) && self.secondarytarget.type == "")
				{
					name = "";
				}
				else
				{
					name = self.secondarytarget.name;
				}
				secondary_msg = (("" + name) + "") + self.secondarytarget.threatlevel;
			}
			else
			{
				secondary_msg = "";
			}
			frames = (int(self.targeting_delay * 20)) + 1;
			thread airsupport::draw_text(primary_msg, (1, 0.6, 0.6), self, vectorscale((0, 0, 1), 40), frames);
			thread airsupport::draw_text(secondary_msg, (1, 0.6, 0.6), self, (0, 0, 0), frames);
		}
	#/
}

/*
	Name: waittill_confirm_location
	Namespace: helicopter
	Checksum: 0x8109A019
	Offset: 0xAC48
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function waittill_confirm_location()
{
	self endon(#"emp_jammed", #"emp_grenaded");
	waitresult = undefined;
	waitresult = self waittill(#"confirm_location");
	return waitresult.position;
}

/*
	Name: selecthelicopterlocation
	Namespace: helicopter
	Checksum: 0x4EB172CC
	Offset: 0xACA8
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function selecthelicopterlocation(hardpointtype)
{
	self airsupport::function_9e2054b0(&function_7da89497);
	location = self airsupport::waitforlocationselection();
	if(!isdefined(location))
	{
		return 0;
	}
	if(self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0)
	{
		return 0;
	}
	level.helilocation = location.origin;
	return airsupport::function_83904681(location.origin);
}

/*
	Name: processcopterassist
	Namespace: helicopter
	Checksum: 0x94387563
	Offset: 0xAD68
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function processcopterassist(destroyedcopter, damagedone)
{
	self endon(#"disconnect");
	destroyedcopter endon(#"disconnect");
	waitframe(1);
	if(!isdefined(level.teams[self.team]))
	{
		return;
	}
	if(!isdefined(destroyedcopter))
	{
		return;
	}
	if(!util::function_fbce7263(self.team, destroyedcopter.team))
	{
		return;
	}
	assist_level = "aircraft_destruction_assist";
	assist_level_value = int(ceil((damagedone.damage / destroyedcopter.maxhealth) * 4));
	if(assist_level_value > 0)
	{
		if(assist_level_value > 3)
		{
			assist_level_value = 3;
		}
		assist_level = (assist_level + "_") + (assist_level_value * 25);
	}
	scoreevents::processscoreevent(assist_level, self, undefined, undefined);
}

/*
	Name: playpilotdialog
	Namespace: helicopter
	Checksum: 0xE90F35C8
	Offset: 0xAEA8
	Size: 0xF4
	Parameters: 4
	Flags: None
*/
function playpilotdialog(dialog, time, voice, shouldwait)
{
	self endon(#"death");
	level endon(#"remote_end");
	if(isdefined(time))
	{
		wait(time);
	}
	if(!isdefined(self.pilotvoicenumber))
	{
		self.pilotvoicenumber = 0;
	}
	if(isdefined(voice))
	{
		voicenumber = voice;
	}
	else
	{
		voicenumber = self.pilotvoicenumber;
	}
	soundalias = ((level.teamprefix[self.team] + voicenumber) + "_") + dialog;
	if(isdefined(self.owner))
	{
		self.owner playpilottalking(shouldwait, soundalias);
	}
}

/*
	Name: playpilottalking
	Namespace: helicopter
	Checksum: 0x8ECBBB53
	Offset: 0xAFA8
	Size: 0xDE
	Parameters: 2
	Flags: Linked
*/
function playpilottalking(shouldwait, soundalias)
{
	self endon(#"disconnect", #"joined_team", #"joined_spectators");
	for(trycounter = 0; isdefined(self.pilottalking) && self.pilottalking && trycounter < 10; trycounter++)
	{
		if(isdefined(shouldwait) && !shouldwait)
		{
			return;
		}
		wait(1);
	}
	self.pilottalking = 1;
	self playlocalsound(soundalias);
	wait(3);
	self.pilottalking = 0;
}

/*
	Name: watchforearlyleave
	Namespace: helicopter
	Checksum: 0x46EFEB35
	Offset: 0xB090
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function watchforearlyleave(chopper)
{
	chopper notify(#"watchforearlyleave_helicopter");
	chopper endon(#"watchforearlyleave_helicopter", #"death");
	self endon(#"heli_timeup");
	self waittill(#"disconnect", #"joined_team", #"joined_spectator");
	if(isdefined(chopper))
	{
		chopper thread heli_leave();
	}
	if(isdefined(self))
	{
		self notify(#"heli_timeup");
	}
}

/*
	Name: watchforemp
	Namespace: helicopter
	Checksum: 0xC18B903
	Offset: 0xB158
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function watchforemp()
{
	heli = self;
	heli endon(#"death", #"heli_timeup");
	heli.owner endon(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist");
	heli.owner waittill(#"emp_jammed");
	heli thread heli_explode();
}

