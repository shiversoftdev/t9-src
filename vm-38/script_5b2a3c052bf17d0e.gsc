#using script_215d7818c548cb51;
#using script_4108035fe400ce67;
#using script_7fc996fe8678852;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_957938f0;

/*
	Name: function_3c8b813b
	Namespace: namespace_957938f0
	Checksum: 0xA1D9889C
	Offset: 0x218
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3c8b813b()
{
	level notify(1836190113);
}

/*
	Name: function_89f2df9
	Namespace: namespace_957938f0
	Checksum: 0x52782373
	Offset: 0x238
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3256c1e06451aec4", &function_70a657d8, undefined, undefined, #"hash_f81b9dea74f0ee");
}

/*
	Name: function_70a657d8
	Namespace: namespace_957938f0
	Checksum: 0x8F0D7324
	Offset: 0x288
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!zm_utility::is_survival())
	{
		return;
	}
	if(!is_true(getgametypesetting(#"hash_318abd2654cf527a")) && !getdvarint(#"hash_1afcd13f069fa385", 0))
	{
		return;
	}
	namespace_8b6a9d79::function_b3464a7c(#"jump_pads", &function_e7e5c90d);
	clientfield::register("scriptmover", "jump_pad_active", 1, 1, "int");
	clientfield::register("scriptmover", "jump_pad_essence_fx", 1, 1, "int");
	clientfield::register("scriptmover", "jump_pad_amb_sound_lp", 1, 1, "int");
	clientfield::register("toplayer", "jump_pad_wind_sound", 1, 1, "int");
	visionset_mgr::register_info("overlay", "sr_jump_pad_visionset", 1, 81, 1, 1);
}

/*
	Name: function_4317fa79
	Namespace: namespace_957938f0
	Checksum: 0x7026D643
	Offset: 0x430
	Size: 0x12C
	Parameters: 1
	Flags: Linked
*/
function function_4317fa79(destination)
{
	if(!is_true(getgametypesetting(#"hash_318abd2654cf527a")) && !getdvarint(#"hash_1afcd13f069fa385", 0))
	{
		return;
	}
	foreach(s_location in destination.locations)
	{
		if(isdefined(s_location.instances[#"jump_pads"]))
		{
			namespace_8b6a9d79::function_20d7e9c7(s_location.instances[#"jump_pads"]);
			break;
		}
	}
}

/*
	Name: function_e7e5c90d
	Namespace: namespace_957938f0
	Checksum: 0x9F721837
	Offset: 0x568
	Size: 0x488
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7e5c90d(s_instance)
{
	s_instance endon(#"cleanup");
	s_instance flag::clear("cleanup");
	s_instance callback::function_d8abfc3d(#"hash_345e9169ebba28fb", &function_1b543d55);
	var_193b9763 = array::randomize((isdefined(s_instance.var_fe2612fe[#"hash_217548aa85422a7e"]) ? s_instance.var_fe2612fe[#"hash_217548aa85422a7e"] : []));
	var_cc2b6592 = function_21a3a673(2, 4);
	var_3cdf505d = 0;
	/#
		if(getdvarint(#"hash_1afcd13f069fa385", 0))
		{
			var_cc2b6592 = var_193b9763.size;
		}
	#/
	foreach(var_5207017 in var_193b9763)
	{
		var_30b30aea = namespace_8b6a9d79::spawn_script_model(var_5207017, #"hash_2ce231d4d16efcac", 1);
		var_30b30aea hide();
		var_5207017.var_126a8ffb = namespace_8b6a9d79::spawn_script_model(var_5207017, #"hash_31994e81355d0644");
		var_5207017.var_126a8ffb setforcenocull();
		var_5207017.var_126a8ffb clientfield::set("jump_pad_amb_sound_lp", 1);
		v_offset = (anglestoright(var_5207017.angles) * -20) + vectorscale((0, 0, 1), 64);
		trigger = namespace_8b6a9d79::function_214737c7(var_5207017, &function_2558caae, #"hash_6ba513ca9aca2762", 500, 48, 64, undefined, v_offset);
		trigger.var_5207017 = var_5207017;
		trigger thread zm_utility::function_2256923f(500);
		var_5207017.var_e2d1273 = [];
		var_50ebf8f1 = struct::get_array(var_5207017.targetname, "target");
		foreach(s_struct in var_50ebf8f1)
		{
			if(s_struct.content_key === #"hash_245e465fa05ffffe")
			{
				var_5207017.s_target = s_struct;
				continue;
			}
			if(!isdefined(var_5207017.var_e2d1273))
			{
				var_5207017.var_e2d1273 = [];
			}
			else if(!isarray(var_5207017.var_e2d1273))
			{
				var_5207017.var_e2d1273 = array(var_5207017.var_e2d1273);
			}
			var_5207017.var_e2d1273[var_5207017.var_e2d1273.size] = s_struct;
		}
		var_5207017 thread function_e6d9e6cd();
		var_5207017.n_obj_id = zm_utility::function_f5a222a8(#"hash_2be74d977110324a", var_5207017.origin);
		var_3cdf505d++;
		if(var_3cdf505d >= var_cc2b6592)
		{
			break;
		}
	}
}

/*
	Name: function_2558caae
	Namespace: namespace_957938f0
	Checksum: 0x8A43C801
	Offset: 0x9F8
	Size: 0x2BC
	Parameters: 1
	Flags: Linked
*/
function function_2558caae(eventstruct)
{
	self endon(#"death");
	var_5207017 = self.var_5207017;
	if(var_5207017 flag::get(#"hash_7f36ba06f49e9217"))
	{
		return;
	}
	player = eventstruct.activator;
	n_cost = 500;
	/#
		if(getdvarint(#"hash_1afcd13f069fa385", 0))
		{
			n_cost = 0;
		}
	#/
	if(isalive(player) && !player laststand::player_is_in_laststand())
	{
		if(!player zm_score::can_player_purchase(n_cost))
		{
			player playsoundtoplayer(#"zmb_no_cha_ching", player);
			return;
		}
		eventstruct.var_7d121541 = 0;
		self triggerenable(0);
		var_5207017 thread flag::set_for_time(15, #"hash_7f36ba06f49e9217");
		player zm_score::minus_to_player_score(n_cost);
		var_5207017.var_126a8ffb clientfield::set("jump_pad_active", 1);
		var_5207017.var_126a8ffb setmodel(#"hash_295fff49de9ef72c");
		function_59d43f02(var_5207017, player);
		level thread function_789d2df5(var_5207017);
		var_5207017 flag::wait_till_clear(#"hash_7f36ba06f49e9217");
		var_5207017 notify(#"hash_1ec9d66681c6312e");
		if(isdefined(var_5207017.var_126a8ffb))
		{
			var_5207017.var_126a8ffb setmodel(#"hash_31994e81355d0644");
			var_5207017.var_126a8ffb clientfield::set("jump_pad_active", 0);
		}
		if(!isdefined(self))
		{
			return;
		}
		self triggerenable(1);
	}
}

/*
	Name: function_789d2df5
	Namespace: namespace_957938f0
	Checksum: 0x3AA55D0D
	Offset: 0xCC0
	Size: 0x198
	Parameters: 1
	Flags: Linked, Private
*/
function private function_789d2df5(var_5207017)
{
	var_5207017 endoncallback(&function_66851234, #"hash_1ec9d66681c6312e");
	var_5207017.var_eb4df9cc = spawn("trigger_radius", var_5207017.origin, 0, 16, 64);
	while(isdefined(var_5207017.var_eb4df9cc) && var_5207017 flag::get(#"hash_7f36ba06f49e9217"))
	{
		s_result = undefined;
		s_result = var_5207017.var_eb4df9cc waittill(#"trigger");
		if(!var_5207017 flag::get(#"hash_7f36ba06f49e9217"))
		{
			break;
		}
		player = s_result.activator;
		if(isplayer(player) && isalive(player) && !player laststand::player_is_in_laststand())
		{
			level thread function_59d43f02(var_5207017, player);
			player waittill(#"death", #"hash_378ec9e1af4e700c");
		}
	}
}

/*
	Name: function_59d43f02
	Namespace: namespace_957938f0
	Checksum: 0x1C41A5D0
	Offset: 0xE60
	Size: 0x430
	Parameters: 2
	Flags: Linked, Private
*/
function private function_59d43f02(var_5207017, player)
{
	player endon(#"death");
	player val::set(#"fling_player", "allow_crouch", 0);
	player val::set(#"fling_player", "allow_prone", 0);
	player val::set(#"fling_player", "allow_stand", 1);
	player val::set(#"fling_player", "freezecontrols_allowlook", 1);
	if(player getstance() != "stand")
	{
		player setstance("stand");
	}
	player playrumbleonentity("damage_heavy");
	player setorigin(player.origin + (0, 0, 1));
	visionset_mgr::activate("overlay", "sr_jump_pad_visionset", player);
	n_gravity = getdvarint(#"bg_gravity", 800);
	if(isdefined(var_5207017.s_target))
	{
		v_launch = (vectornormalize(var_5207017.s_target.origin - player.origin)) * n_gravity;
		v_dest = var_5207017.s_target.origin;
		/#
			debugstar(var_5207017.s_target.origin, 500, (0, 1, 0));
		#/
	}
	else
	{
		if(isvec(var_5207017.v_launch))
		{
			v_launch = var_5207017.v_launch;
		}
		else
		{
			v_launch = (0, 450, 1300);
		}
	}
	v_launch = namespace_77bd50da::function_81cad6d6(v_launch, var_5207017.angles[1]);
	if(!isdefined(v_dest))
	{
		v_dest = v_launch + player.origin;
	}
	n_dist = distance(player.origin, v_dest);
	var_fd6264f6 = n_dist / n_gravity;
	playsoundatposition(#"hash_7ff8d8dbf89e6f0d", player.origin);
	player clientfield::set_to_player("jump_pad_wind_sound", 1);
	start_time = gettime();
	while(gettime() - start_time < int(var_fd6264f6 * 1000))
	{
		player setvelocity(v_launch);
		waitframe(1);
		/#
			debugstar(player.origin, 500, (1, 0, 0));
		#/
	}
	player thread function_4267539();
	if(isdefined(level.var_24a17c08))
	{
		player thread [[level.var_24a17c08]]();
	}
	player notify(#"hash_378ec9e1af4e700c");
}

/*
	Name: function_4267539
	Namespace: namespace_957938f0
	Checksum: 0xF95E60C8
	Offset: 0x1298
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4267539()
{
	self endon(#"death");
	while(true)
	{
		v_velocity = self getvelocity();
		if(v_velocity[2] < 420)
		{
			self clientfield::set_to_player("jump_pad_wind_sound", 0);
			visionset_mgr::deactivate("overlay", "sr_jump_pad_visionset", self);
			break;
		}
		waitframe(1);
	}
	self val::reset_all(#"fling_player");
}

/*
	Name: function_66851234
	Namespace: namespace_957938f0
	Checksum: 0x9110BDF5
	Offset: 0x1368
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_66851234(eventstruct)
{
	if(isdefined(self.var_eb4df9cc))
	{
		self.var_eb4df9cc deletedelay();
	}
}

/*
	Name: function_e6d9e6cd
	Namespace: namespace_957938f0
	Checksum: 0x1F478E85
	Offset: 0x13A8
	Size: 0x250
	Parameters: 0
	Flags: Linked
*/
function function_e6d9e6cd()
{
	if(isdefined(self.var_b7e783e3))
	{
		return;
	}
	v_trigger_offset = vectorscale((0, 0, -1), 32);
	var_eb3b90d = struct::get_array(self.targetname, "target");
	foreach(s_spawn in self.var_e2d1273)
	{
		var_88f24b00 = namespace_8b6a9d79::spawn_script_model(s_spawn, #"p9_sur_essence_container");
		var_88f24b00 clientfield::set("jump_pad_essence_fx", 1);
		var_88f24b00.angles = (randomint(360), randomint(360), randomint(360));
		var_88f24b00 bobbing((0, 0, 1), 3, 1);
		var_88f24b00 rotate(vectorscale((1, 0, 1), 6));
		s_spawn.trigger = spawn("trigger_radius", s_spawn.origin + v_trigger_offset, 0, 32, 48);
		s_spawn.trigger callback::function_35a12f19(&function_90c8355);
		s_spawn.trigger.var_88f24b00 = var_88f24b00;
		waitframe(randomintrange(1, 5));
	}
}

/*
	Name: function_90c8355
	Namespace: namespace_957938f0
	Checksum: 0x4B2FAE7E
	Offset: 0x1600
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_90c8355(eventstruct)
{
	if(isplayer(eventstruct.activator))
	{
		eventstruct.activator zm_stats::increment_challenge_stat(#"hash_52d449d3aae2c5fa");
		if(!isdefined(eventstruct.activator.var_664db4ed))
		{
			eventstruct.activator.var_664db4ed = 0;
		}
		eventstruct.activator.var_664db4ed++;
		essence = function_4ba8fde(#"hash_682698368e3a043");
		if(isdefined(essence))
		{
			level thread item_world::function_de2018e3(essence, eventstruct.activator);
		}
		if(isdefined(self.var_88f24b00))
		{
			self.var_88f24b00 clientfield::set("jump_pad_essence_fx", 0);
			waitframe(1);
			self.var_88f24b00 delete();
		}
		self delete();
	}
}

/*
	Name: function_1b543d55
	Namespace: namespace_957938f0
	Checksum: 0x5ACB9AB5
	Offset: 0x1758
	Size: 0xFA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_1b543d55()
{
	self flag::set("cleanup");
	foreach(var_5207017 in [])
	{
		if(isdefined(var_5207017.n_obj_id))
		{
			zm_utility::function_bc5a54a8(var_5207017.n_obj_id);
			var_5207017.n_obj_id = undefined;
		}
	}
}

