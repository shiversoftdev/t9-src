#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using script_305d57cf0618009d;
#using scripts\core_common\player\player_insertion.gsc;
#using script_1cc417743d7c262d;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot_insertion.gsc;
#using scripts\abilities\gadgets\gadget_health_regen.gsc;

#namespace namespace_b9471dc1;

/*
	Name: register_clientfields
	Namespace: namespace_b9471dc1
	Checksum: 0x5060E2E
	Offset: 0x1E8
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("vehicle", "warpportalfx", 1, 1, "int");
	clientfield::register("vehicle", "warpportalfx_launch", 1, 1, "counter");
	clientfield::register("toplayer", "warpportal_fx_wormhole", 1, 1, "int");
}

/*
	Name: function_51c5f95f
	Namespace: namespace_b9471dc1
	Checksum: 0x2C2053EF
	Offset: 0x288
	Size: 0x344
	Parameters: 1
	Flags: Linked
*/
function function_51c5f95f(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	player_insertion::function_a21d9dc(insertion);
	fadeouttime = level.var_8367fa0f;
	blacktime = level.var_ab0cc070;
	fadeintime = level.var_b28c6a29;
	level player_insertion::function_948ac812(insertion);
	insertion thread player_insertion::function_1b105d5b(insertion, fadeouttime, blacktime, fadeintime, 1);
	wait(fadeouttime + 0.1);
	insertion thread globallogic_audio::function_85818e24("matchstart");
	level thread player_insertion::function_a4deb676();
	insertion flag::set(#"hash_122f326d72f4c884");
	player_insertion::function_dd34168c(insertion, #"hash_60fcdd11812a0134");
	player_insertion::function_dd34168c(insertion, #"insertion_teleport_completed");
	level function_57d4a011(insertion);
	insertion flag::wait_till_timeout(0.5, #"insertion_presentation_completed");
	function_26fbfab4(insertion);
	var_990e3011 = 3;
	/#
		if(getdvarint(#"hash_96d977cb1cf39f8", 0) != 0)
		{
			var_990e3011 = getdvarint(#"hash_96d977cb1cf39f8", 2);
		}
	#/
	wait(var_990e3011);
	level callback::callback(#"hash_774be40ec06d5212");
	callback::remove_on_spawned(&function_aa3a20fb);
	player_insertion::function_a5fd9aa8(insertion);
	foreach(player in insertion.players)
	{
		if(!isalive(player))
		{
			continue;
		}
		player thread function_adc8cff4();
	}
	player_insertion::function_dd34168c(insertion, #"insertion_begin_completed");
}

/*
	Name: function_26fbfab4
	Namespace: namespace_b9471dc1
	Checksum: 0x923FBE87
	Offset: 0x5D8
	Size: 0x166
	Parameters: 1
	Flags: Linked, Private
*/
function private function_26fbfab4(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	level endon(#"game_ended");
	var_850118f3 = 5;
	/#
		if(getdvarint(#"hash_7f8ced042799da77", 0) != 0)
		{
			var_850118f3 = getdvarint(#"hash_7f8ced042799da77", 2);
		}
	#/
	foreach(player in insertion.players)
	{
		player player_insertion::function_abd3bc1a();
		if(!isalive(player))
		{
			continue;
		}
		player thread function_135ed50e();
	}
	wait(var_850118f3);
}

/*
	Name: function_135ed50e
	Namespace: namespace_b9471dc1
	Checksum: 0xA5FA2EEB
	Offset: 0x748
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_135ed50e()
{
	self endon(#"death");
	var_850118f3 = 5;
	/#
		if(getdvarint(#"hash_7f8ced042799da77", 0) != 0)
		{
			var_850118f3 = getdvarint(#"hash_7f8ced042799da77", 2);
		}
	#/
	self function_75488834();
	wait(var_850118f3);
	self function_3a77bd05();
}

/*
	Name: function_57d4a011
	Namespace: namespace_b9471dc1
	Checksum: 0xE177A5DD
	Offset: 0x800
	Size: 0x6B4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_57d4a011(insertion)
{
	/#
		assert(isstruct(insertion));
	#/
	var_5199e69 = getdvarint(#"hash_3602c5d9aaca933c", 20000);
	player_insertion::function_a5fd9aa8(insertion);
	bot_insertion::function_24ca8ecf(insertion);
	var_719e741e = getentarray("camera_vehicle", "targetname");
	if(isdefined(var_719e741e))
	{
		numplayers = insertion.players.size;
		numteams = 1;
		/#
			assert(numplayers > 0, "");
		#/
		foreach(team in level.teams)
		{
			if(is_true(level.everexisted[team]))
			{
				numteams++;
			}
		}
		level.warp_portal_vehicles = [];
		count = 1;
		foreach(var_e1dd0f66 in var_719e741e)
		{
			var_b06f2346 = "warp_portal_vehicle_spawn_" + count;
			var_7cac53bf = var_e1dd0f66 spawnfromspawner(var_b06f2346, 1, 1);
			var_7cac53bf.takedamage = 0;
			var_7cac53bf ghost();
			if(!isdefined(level.warp_portal_vehicles))
			{
				level.warp_portal_vehicles = [];
			}
			else if(!isarray(level.warp_portal_vehicles))
			{
				level.warp_portal_vehicles = array(level.warp_portal_vehicles);
			}
			level.warp_portal_vehicles[level.warp_portal_vehicles.size] = var_7cac53bf;
			if(count >= numteams)
			{
				break;
			}
			count++;
		}
		var_8a2c40d0 = struct::get("warp_zone_look_at", "targetname");
		step_size = 360 / numteams;
		if(isdefined(var_8a2c40d0))
		{
			center = var_8a2c40d0.origin;
			radius = 9000;
			angle = 0;
			foreach(portal_vehicle in level.warp_portal_vehicles)
			{
				x_pos = center[0] + (radius * cos(angle));
				y_pos = center[1] + (radius * sin(angle));
				z_pos = var_5199e69;
				portal_vehicle.origin = (x_pos, y_pos, z_pos);
				portal_vehicle.angle_step = angle;
				angle = angle + step_size;
				target = var_8a2c40d0.origin - portal_vehicle.origin;
				target = vectornormalize(target);
				angles = vectortoangles(target);
				portal_vehicle.angles = angles;
			}
		}
		var_30fc202f = 0;
		foreach(team in level.teams)
		{
			if(is_true(level.everexisted[team]))
			{
				players = getplayers(team);
				foreach(player in players)
				{
					if(isalive(player))
					{
						player.var_30fc202f = var_30fc202f;
						player thread function_a25e421c();
					}
				}
				var_30fc202f++;
				if(var_30fc202f > numteams - 1)
				{
					var_30fc202f = numteams - 1;
					break;
				}
			}
		}
	}
	callback::on_spawned(&function_aa3a20fb);
}

/*
	Name: function_adc8cff4
	Namespace: namespace_b9471dc1
	Checksum: 0x84A5AC2C
	Offset: 0xEC0
	Size: 0x164
	Parameters: 1
	Flags: Linked, Private
*/
function private function_adc8cff4(reinserting)
{
	if(!isdefined(reinserting))
	{
		reinserting = 0;
	}
	self endon(#"disconnect", #"death");
	self startcameratween(0.5);
	util::wait_network_frame();
	self show();
	self solid();
	self setclientthirdperson(0);
	self death_circle::function_b57e3cde(0);
	self val::set(#"player_insertion", "disable_oob", 0);
	self clientfield::set_to_player("realtime_multiplay", 1);
	self thread function_7bf9c38f(reinserting);
	level callback::callback(#"hash_74b19f5972b0ee52", {#player:self});
}

/*
	Name: function_7bf9c38f
	Namespace: namespace_b9471dc1
	Checksum: 0x42ADA8BA
	Offset: 0x1030
	Size: 0x2F4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7bf9c38f(reinserting)
{
	self endon(#"disconnect", #"death");
	self flag::set(#"hash_224cb97b8f682317");
	self flag::set(#"hash_287397edba8966f9");
	speed = 4400;
	circleindex = 1;
	if(isdefined(level.deathcircleindex))
	{
		circleindex = level.deathcircleindex + 2;
	}
	speed = speed / circleindex;
	self unlink();
	var_180a7b48 = self function_ec7cfdb();
	/#
		if(getdvarint(#"hash_37b6eccbe31b5875", 0) != 0)
		{
			var_180a7b48 = getdvarint(#"hash_37b6eccbe31b5875", 1);
		}
	#/
	/#
		assert(isdefined(var_180a7b48), "");
	#/
	if(!isdefined(var_180a7b48))
	{
		var_180a7b48 = 0;
	}
	if(!isdefined(level.warp_portal_vehicles))
	{
		level.warp_portal_vehicles = [];
	}
	if(level.warp_portal_vehicles.size)
	{
		portal = level.warp_portal_vehicles[var_180a7b48];
	}
	/#
		assert(isdefined(portal), "");
	#/
	if(isdefined(portal))
	{
		self setorigin(portal.origin);
	}
	else
	{
		center = level.mapcenter;
		center = (center[0], center[1], getdvarint(#"hash_3602c5d9aaca933c", 20000));
		self setorigin(center);
	}
	velocity = anglestoforward(self getplayerangles()) * speed;
	player_insertion::start_freefall(velocity, 0);
	if(isdefined(portal))
	{
		portal function_723d686d();
	}
	self thread function_2b276ae0();
}

/*
	Name: function_a25e421c
	Namespace: namespace_b9471dc1
	Checksum: 0x750A4715
	Offset: 0x1330
	Size: 0x344
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a25e421c()
{
	self endon(#"disconnect", #"death");
	if(isalive(self))
	{
		self thread status_effect::function_6519f95f();
		self death_circle::function_b57e3cde(1);
		self val::set(#"player_insertion", "disable_oob", 1);
		self stopanimscripted();
		self unlink();
		self setstance("stand");
		var_180a7b48 = self function_ec7cfdb();
		/#
			if(getdvarint(#"hash_37b6eccbe31b5875", 0) != 0)
			{
				var_180a7b48 = getdvarint(#"hash_37b6eccbe31b5875", 1);
			}
		#/
		if(isdefined(level.warp_portal_vehicles))
		{
			portal = level.warp_portal_vehicles[var_180a7b48];
			if(isdefined(portal))
			{
				self setorigin(level.warp_portal_vehicles[var_180a7b48].origin);
				self function_648c1f6(level.warp_portal_vehicles[var_180a7b48], undefined, 0, 180, 180, 180, 180, 0);
				if(death_circle::is_active())
				{
					target = death_circle::get_next_origin() - self.origin;
				}
				else
				{
					var_8a2c40d0 = struct::get("warp_zone_look_at", "targetname");
					target = var_8a2c40d0.origin - self.origin;
				}
				target = vectornormalize(target);
				angles = vectortoangles(target);
				self setplayerangles(angles);
			}
		}
		self gadget_health_regen::function_7993d50e();
		self.health = self.spawnhealth;
		self ghost();
		self notsolid();
		self setclientthirdperson(1);
		self dontinterpolate();
	}
}

/*
	Name: function_f2867466
	Namespace: namespace_b9471dc1
	Checksum: 0x64ED9361
	Offset: 0x1680
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_f2867466()
{
	self notify("1669fb9076c97418");
	self endon("1669fb9076c97418");
	self endon(#"disconnect");
	level endon(#"game_ended");
	self flag::clear(#"hash_224cb97b8f682317");
	self flag::clear(#"hash_287397edba8966f9");
	waitframe(1);
	self function_a25e421c();
	self player_insertion::function_abd3bc1a();
	self function_135ed50e();
	var_990e3011 = 3;
	/#
		if(getdvarint(#"hash_96d977cb1cf39f8", 0) != 0)
		{
			var_990e3011 = getdvarint(#"hash_96d977cb1cf39f8", 2);
		}
	#/
	wait(var_990e3011);
	self function_adc8cff4(1);
}

/*
	Name: function_aa3a20fb
	Namespace: namespace_b9471dc1
	Checksum: 0xF1FCBF0D
	Offset: 0x17D8
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_aa3a20fb()
{
	if(!isdefined(level.warp_portal_vehicles))
	{
		self thread player_insertion::function_77132caf();
		return;
	}
	self thread function_f2867466();
}

/*
	Name: function_2b276ae0
	Namespace: namespace_b9471dc1
	Checksum: 0x591FB08C
	Offset: 0x1828
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2b276ae0()
{
	self endon(#"death");
	wait(1);
	self val::reset(#"player_insertion", "freezecontrols");
	self player_insertion::function_4feecc32();
	callback::function_d8abfc3d(#"parachute", &player_insertion::function_66c91693);
	callback::on_death(&player_insertion::function_916470ec);
	self thread player_insertion::function_7a4c1517();
}

/*
	Name: function_ec7cfdb
	Namespace: namespace_b9471dc1
	Checksum: 0x168D2B6C
	Offset: 0x1900
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_ec7cfdb()
{
	if(isdefined(self.var_30fc202f))
	{
		return self.var_30fc202f;
	}
	return 0;
}

/*
	Name: function_75488834
	Namespace: namespace_b9471dc1
	Checksum: 0xA6537156
	Offset: 0x1928
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_75488834()
{
	self clientfield::set_to_player("warpportal_fx_wormhole", 1);
}

/*
	Name: function_3a77bd05
	Namespace: namespace_b9471dc1
	Checksum: 0x421AEB7D
	Offset: 0x1958
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3a77bd05()
{
	self clientfield::set_to_player("warpportal_fx_wormhole", 0);
}

/*
	Name: function_723d686d
	Namespace: namespace_b9471dc1
	Checksum: 0x473F113E
	Offset: 0x1988
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_723d686d()
{
	self clientfield::increment("warpportalfx_launch");
}

/*
	Name: function_808b3790
	Namespace: namespace_b9471dc1
	Checksum: 0x5DDC7FF4
	Offset: 0x19B8
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_808b3790()
{
	self clientfield::set("warpportalfx", 1);
}

/*
	Name: function_8fc2a69e
	Namespace: namespace_b9471dc1
	Checksum: 0x43BD032A
	Offset: 0x19E8
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_8fc2a69e()
{
	self clientfield::set("warpportalfx", 0);
}

/*
	Name: function_4910c182
	Namespace: namespace_b9471dc1
	Checksum: 0x876A966F
	Offset: 0x1A18
	Size: 0x304
	Parameters: 1
	Flags: None
*/
function function_4910c182(insertion)
{
	/#
		/#
			assert(isdefined(insertion));
		#/
		insertion flag::clear(#"hash_60fcdd11812a0134");
		insertion flag::clear(#"hash_122f326d72f4c884");
		player_insertion::function_a21d9dc();
		insertion.players = function_a1ef346b();
		level player_insertion::function_948ac812(insertion);
		level thread player_insertion::function_1b105d5b(insertion, 2, 2, 5, 1);
		wait(2 + 0.1);
		level thread globallogic_audio::function_85818e24("");
		level thread player_insertion::function_a4deb676();
		insertion flag::set(#"hash_122f326d72f4c884");
		insertion flag::set(#"hash_60fcdd11812a0134");
		insertion flag::set(#"insertion_teleport_completed");
		foreach(player in insertion.players)
		{
			player function_a25e421c();
		}
		level flag::wait_till_timeout(0.5, #"insertion_presentation_completed");
		function_26fbfab4();
		var_990e3011 = 3;
		/#
			if(getdvarint(#"hash_96d977cb1cf39f8", 0) != 0)
			{
				var_990e3011 = getdvarint(#"hash_96d977cb1cf39f8", 2);
			}
		#/
		wait(var_990e3011);
		players = getplayers();
		players[0] function_adc8cff4();
	#/
}

