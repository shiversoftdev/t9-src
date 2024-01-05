#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using script_305d57cf0618009d;
#using script_6e9b46ba8331f1f;
#using scripts\core_common\player\player_insertion.gsc;
#using scripts\core_common\player\player_free_fall.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\bots\bot_insertion.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace player_reinsertion;

/*
	Name: function_216ac6a9
	Namespace: player_reinsertion
	Checksum: 0xA39BEF6F
	Offset: 0x220
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_216ac6a9()
{
	level notify(-44927539);
}

/*
	Name: __init__system__
	Namespace: player_reinsertion
	Checksum: 0xBF6F4D24
	Offset: 0x240
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_reinsertion", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: player_reinsertion
	Checksum: 0xAA8FCF11
	Offset: 0x288
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(level.var_f2814a96 !== 0)
	{
		return;
	}
	callback::add_callback(#"hash_6b7d26d34885b425", &function_4012c0ab);
	callback::on_game_playing(&on_game_playing);
	level.reinsertion = spawnstruct();
}

/*
	Name: on_game_playing
	Namespace: player_reinsertion
	Checksum: 0x7B2FB708
	Offset: 0x318
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function on_game_playing()
{
	level thread function_3d39c260();
	/#
		level thread function_a6eac3b7();
	#/
}

/*
	Name: function_3d39c260
	Namespace: player_reinsertion
	Checksum: 0x4D0E6D33
	Offset: 0x358
	Size: 0x1B4
	Parameters: 0
	Flags: None
*/
function function_3d39c260()
{
	if(level.numlives == 1)
	{
		return;
	}
	var_7eb8f61a = (isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0);
	if(var_7eb8f61a != 0 && var_7eb8f61a != 3 || is_true(level.wave_spawn))
	{
		return;
	}
	var_f8d960b2 = 0.6;
	height = 30000;
	center = (0, 0, height);
	radius = function_cf96c89c() * var_f8d960b2;
	vehicle = function_d5d96302(center, radius);
	if(!isdefined(vehicle))
	{
		return;
	}
	level.reinsertion.vehicle = vehicle;
	vehicle thread function_14f79b33(center, radius, height, var_f8d960b2);
	level.reinsertion.cameraent = function_15e6e9ae(vehicle);
	level thread function_eb815c5();
}

/*
	Name: function_a20b914d
	Namespace: player_reinsertion
	Checksum: 0xCA8BC5FE
	Offset: 0x518
	Size: 0x72
	Parameters: 2
	Flags: None
*/
function function_a20b914d(circle_origin, circle_radius)
{
	angles = (0, randomint(360), 0);
	direction = anglestoforward(angles);
	spawn_origin = circle_origin - (direction * circle_radius);
	return spawn_origin;
}

/*
	Name: function_cf96c89c
	Namespace: player_reinsertion
	Checksum: 0x3F959147
	Offset: 0x598
	Size: 0xDE
	Parameters: 0
	Flags: None
*/
function function_cf96c89c()
{
	minimaporigins = getentarray("map_corner", "targetname");
	if(minimaporigins.size)
	{
		x = abs(minimaporigins[0].origin[0] - minimaporigins[1].origin[0]);
		y = abs(minimaporigins[0].origin[1] - minimaporigins[1].origin[1]);
		return min(x, y);
	}
	return 0;
}

/*
	Name: function_93376ccd
	Namespace: player_reinsertion
	Checksum: 0x3AAB9882
	Offset: 0x680
	Size: 0x72
	Parameters: 2
	Flags: None
*/
function function_93376ccd(center, origin)
{
	left = vectornormalize(origin - center);
	forward = vectorcross(left, (0, 0, 1));
	return vectortoangles(forward);
}

/*
	Name: function_d5d96302
	Namespace: player_reinsertion
	Checksum: 0x1C893D0C
	Offset: 0x700
	Size: 0x130
	Parameters: 2
	Flags: None
*/
function function_d5d96302(center, radius)
{
	/#
		while(getplayers().size == 0)
		{
			wait(0.5);
		}
	#/
	origin = function_a20b914d(center, radius);
	angles = function_93376ccd(center, origin);
	vehicle = spawnvehicle("vehicle_t9_mil_helicopter_care_package", origin, angles);
	vehicle.takedamage = 0;
	vehicle setneargoalnotifydist(512);
	vehicle clientfield::set("infiltration_landing_gear", 1);
	vehicle setrotorspeed(1);
	vehicle setspeedimmediate(100);
	return vehicle;
}

/*
	Name: function_15e6e9ae
	Namespace: player_reinsertion
	Checksum: 0xD85E27B8
	Offset: 0x838
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function function_15e6e9ae(vehicle)
{
	camera = player_insertion::function_57fe9b21(level.insertion, vehicle.origin);
	camera.origin = vehicle.origin;
	camera.angles = vehicle.angles;
	camera linkto(vehicle);
	return camera;
}

/*
	Name: function_521bff14
	Namespace: player_reinsertion
	Checksum: 0x449D81A
	Offset: 0x8B0
	Size: 0x220
	Parameters: 3
	Flags: Private
*/
function private function_521bff14(center, goal, var_e294ac7d)
{
	direction = goal - center;
	steps = int(length(direction) / 1000);
	direction = vectornormalize(direction);
	var_3d4c4e94 = player_insertion::function_f31cf3bb(center, direction, 1000, 0, steps);
	if(!isdefined(var_3d4c4e94))
	{
		var_3d4c4e94 = center;
	}
	if(distance2dsquared(goal, var_3d4c4e94) > sqr(0.01))
	{
		delta = var_3d4c4e94 - center;
		length = length(delta);
		direction = vectornormalize(delta);
		new_point = center + (direction * (length * var_e294ac7d));
		/#
			var_ced865d2 = center + (direction * length);
			thread player_insertion::debug_line(center, new_point, (1, 0, 0), level.reinsertion.debug_duration);
			thread player_insertion::debug_line(new_point, var_ced865d2, (0, 1, 1), level.reinsertion.debug_duration);
			thread player_insertion::debug_line(var_ced865d2, goal, (1, 0, 1), level.reinsertion.debug_duration);
		#/
		return new_point;
	}
	/#
		thread player_insertion::debug_line(center, goal, (1, 0, 0), level.reinsertion.debug_duration);
	#/
	return goal;
}

/*
	Name: function_8ea9be1c
	Namespace: player_reinsertion
	Checksum: 0x42E89629
	Offset: 0xAD8
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_8ea9be1c()
{
	if(!isdefined(level.reinsertion.vehicle))
	{
		return;
	}
	level.reinsertion.vehicle function_beba57b9(30000);
}

/*
	Name: function_beba57b9
	Namespace: player_reinsertion
	Checksum: 0x73E67DE8
	Offset: 0xB28
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private function_beba57b9(height)
{
	var_e8a39fb = function_cf96c89c();
	goal = (rotatepoint((1, 0, 0), (0, randomint(360), 0)) * var_e8a39fb) * 2;
	goal = (goal[0], goal[1], height);
	self function_a57c34b7(goal, 0, 0);
}

/*
	Name: function_14f79b33
	Namespace: player_reinsertion
	Checksum: 0x7BA7EA8D
	Offset: 0xBD8
	Size: 0x2F6
	Parameters: 4
	Flags: Private
*/
function private function_14f79b33(center, radius, height, var_e294ac7d)
{
	self endon(#"death");
	var_5d59bc67 = 1760;
	time_step = 5;
	while(true)
	{
		if(!death_circle::is_active())
		{
			circle_origin = center;
			circle_radius = radius;
		}
		else
		{
			circle_origin = death_circle::function_b980b4ca();
			circle_origin = (circle_origin[0], circle_origin[1], height);
			circle_radius = death_circle::function_f8dae197() * var_e294ac7d;
		}
		if(circle_radius < 0.01)
		{
			self function_beba57b9(height);
			return;
		}
		/#
			level.reinsertion.debug_duration = 1000;
			thread player_insertion::debug_line(circle_origin, level.reinsertion.vehicle.origin, (0, 0, 1), level.reinsertion.debug_duration);
		#/
		var_9c068ab1 = vectornormalize(level.reinsertion.vehicle.origin - circle_origin);
		var_c40f2e06 = vectortoangles(var_9c068ab1);
		var_1288d4ef = var_c40f2e06[1];
		var_c5a2c1c9 = (var_5d59bc67 / circle_radius) * 57.29578;
		new_yaw = var_1288d4ef + (time_step * var_c5a2c1c9);
		new_angles = (0, new_yaw, 0);
		goal = circle_origin + (anglestoforward(new_angles) * circle_radius);
		goal = function_521bff14(circle_origin, goal, var_e294ac7d);
		/#
			thread player_insertion::debug_line(level.reinsertion.vehicle.origin, goal, (0, 1, 0), level.reinsertion.debug_duration);
		#/
		self function_a57c34b7(goal, 0, 0);
		self waittill(#"goal", #"near_goal");
	}
}

/*
	Name: function_4f356be
	Namespace: player_reinsertion
	Checksum: 0xE0F5869A
	Offset: 0xED8
	Size: 0x192
	Parameters: 4
	Flags: Private
*/
function private function_4f356be(start, end, offset, var_3a5f8906)
{
	self endon(#"death");
	self function_a57c34b7(end, 0, 0);
	distance = distance(end, start);
	var_27dfb385 = int(distance / 5000);
	remainingdist = int(distance) % 5000;
	for(i = 1; i <= var_27dfb385; i++)
	{
		self pathvariableoffset((offset, offset, offset) * ((var_27dfb385 - i) + 1), var_3a5f8906);
		self player_insertion::function_85635daf(start, distance, (i * 5000) / distance);
	}
	if(remainingdist > 0)
	{
		self pathvariableoffset((offset, offset, offset), var_3a5f8906);
	}
	self waittill(#"goal", #"near_goal");
}

/*
	Name: function_b24f3a72
	Namespace: player_reinsertion
	Checksum: 0xAEA3FA51
	Offset: 0x1078
	Size: 0xF0
	Parameters: 3
	Flags: None
*/
function function_b24f3a72(origin, radius, height)
{
	point = self.origin;
	distance = distance2d(point, origin);
	if(distance == 0)
	{
		return origin;
	}
	angle = cos(radius / distance);
	vec = vectornormalize(point - origin);
	goal = rotatepoint(vec, (0, angle, 0)) * radius;
	return (goal[0], goal[1], height);
}

/*
	Name: function_8655661f
	Namespace: player_reinsertion
	Checksum: 0x5E227EF0
	Offset: 0x1170
	Size: 0xD2
	Parameters: 2
	Flags: None
*/
function function_8655661f(radius_t, height)
{
	if(!death_circle::is_active())
	{
		return self function_b24f3a72((0, 0, height), 50000 * radius_t, height);
	}
	origin = death_circle::function_b980b4ca();
	origin = (origin[0], origin[1], height);
	radius = death_circle::function_f8dae197() * radius_t;
	goal = self function_b24f3a72(origin, radius, height);
	return goal;
}

/*
	Name: function_b2df2693
	Namespace: player_reinsertion
	Checksum: 0x8EBAC20
	Offset: 0x1250
	Size: 0x24A
	Parameters: 0
	Flags: None
*/
function function_b2df2693()
{
	var_48bc2733 = [];
	foreach(team in level.teams)
	{
		if(function_a1ef346b(team).size > 0)
		{
			players = getplayers(team);
			/#
				player_alive = 0;
				foreach(player in players)
				{
					if(isalive(player) && player.sessionstate == "")
					{
						player_alive = 1;
						break;
					}
				}
				/#
					assert(player_alive, "");
				#/
				if(player_alive == 0)
				{
					continue;
				}
			#/
			foreach(player in players)
			{
				if(!isalive(player) || player.sessionstate != "playing")
				{
					var_48bc2733[var_48bc2733.size] = player;
				}
			}
		}
	}
	return var_48bc2733;
}

/*
	Name: function_c3ab4925
	Namespace: player_reinsertion
	Checksum: 0xAB76EAC
	Offset: 0x14A8
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_c3ab4925()
{
	self.var_97b0977 = 0;
	self setclientuivisibilityflag("weapon_hud_visible", 0);
	self flag::clear(#"hash_224cb97b8f682317");
	self flag::clear(#"hash_287397edba8966f9");
	self function_c62b5591();
	if(isbot(self))
	{
		self bot_insertion::function_d7ba3d0b();
	}
}

/*
	Name: function_564e0871
	Namespace: player_reinsertion
	Checksum: 0x4A811FF4
	Offset: 0x1568
	Size: 0x94
	Parameters: 0
	Flags: Private
*/
function private function_564e0871()
{
	self.var_97b0977 = 0;
	self flag::clear(#"hash_224cb97b8f682317");
	self flag::set(#"hash_287397edba8966f9");
	self function_c62b5591();
	if(isbot(self))
	{
		self bot_insertion::function_d7ba3d0b();
	}
}

/*
	Name: function_acdf637e
	Namespace: player_reinsertion
	Checksum: 0x5628AAFA
	Offset: 0x1608
	Size: 0x78
	Parameters: 0
	Flags: Private
*/
function private function_acdf637e()
{
	if((isdefined(getgametypesetting(#"hash_4149d5d65eb07138")) ? getgametypesetting(#"hash_4149d5d65eb07138") : 0))
	{
		if(isdefined(level.var_317fb13c))
		{
			self thread [[level.var_317fb13c]]();
		}
	}
}

/*
	Name: function_c62b5591
	Namespace: player_reinsertion
	Checksum: 0xBB58D767
	Offset: 0x1688
	Size: 0x10C
	Parameters: 0
	Flags: Private
*/
function private function_c62b5591()
{
	if(isdefined(level.reinsertion) && isdefined(level.reinsertion.cameraent))
	{
		level.reinsertion.cameraent clientfield::set("infiltration_plane", player_insertion::function_1e4302d0(1, level.insertion.index));
		level.reinsertion.cameraent clientfield::set("infiltration_ent", player_insertion::function_1e4302d0(1, level.insertion.index));
		level.reinsertion.cameraent setvisibletoplayer(self);
	}
	self player_insertion::show_postfx();
}

/*
	Name: function_402101af
	Namespace: player_reinsertion
	Checksum: 0xF93F7670
	Offset: 0x17A0
	Size: 0x6C
	Parameters: 0
	Flags: Private
*/
function private function_402101af()
{
	if(isdefined(level.reinsertion) && isdefined(level.reinsertion.cameraent))
	{
		level.reinsertion.cameraent setinvisibletoplayer(self);
	}
	self player_insertion::hide_postfx();
}

/*
	Name: function_eb815c5
	Namespace: player_reinsertion
	Checksum: 0xA0D92E0B
	Offset: 0x1818
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_eb815c5()
{
	if(isdefined(level.reinsertion) && isdefined(level.reinsertion.cameraent))
	{
		level.reinsertion.cameraent clientfield::set("infiltration_camera", player_insertion::function_1e4302d0(2, level.insertion.index));
	}
	level callback::add_callback(#"hash_74b19f5972b0ee52", &function_6198f712);
}

/*
	Name: function_6198f712
	Namespace: player_reinsertion
	Checksum: 0xCE82A102
	Offset: 0x18D0
	Size: 0x34
	Parameters: 1
	Flags: Private
*/
function private function_6198f712(eventstruct)
{
	if(isdefined(eventstruct.player))
	{
		eventstruct.player function_402101af();
	}
}

/*
	Name: function_218283c4
	Namespace: player_reinsertion
	Checksum: 0xE4D6B3C1
	Offset: 0x1910
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_218283c4()
{
	self luinotifyevent(#"hash_175f8739ed7a932", 0);
}

/*
	Name: function_de24c569
	Namespace: player_reinsertion
	Checksum: 0xCA570696
	Offset: 0x1940
	Size: 0xA8
	Parameters: 0
	Flags: None
*/
function function_de24c569()
{
	player_insertion::function_a5fd9aa8(level.insertion);
	foreach(player in level.insertion.players)
	{
		player function_218283c4();
	}
}

/*
	Name: function_f9348c1d
	Namespace: player_reinsertion
	Checksum: 0xE1F9B45D
	Offset: 0x19F0
	Size: 0xAA
	Parameters: 0
	Flags: None
*/
function function_f9348c1d()
{
	circle_center = death_circle::function_b980b4ca();
	angles = (0, 0, 0);
	if(isdefined(level.reinsertion) && isdefined(level.reinsertion.vehicle))
	{
		var_9c068ab1 = vectornormalize(circle_center - level.reinsertion.vehicle.origin);
		angles = vectortoangles(var_9c068ab1);
	}
	return angles;
}

/*
	Name: function_39a51e47
	Namespace: player_reinsertion
	Checksum: 0xFBC87473
	Offset: 0x1AA8
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_39a51e47()
{
	self endon(#"disconnect");
	if(!isdefined(level.warp_portal_vehicles))
	{
		self thread player_insertion::function_77132caf();
		self function_acdf637e();
		return;
	}
	var_8c305d53 = self function_5425f45d();
	if(var_8c305d53)
	{
		self function_acdf637e();
		self thread namespace_b9471dc1::function_f2867466();
	}
	else
	{
		self thread player_insertion::function_77132caf();
		self function_acdf637e();
	}
}

/*
	Name: function_3c4884f1
	Namespace: player_reinsertion
	Checksum: 0x8BFAF546
	Offset: 0x1B90
	Size: 0x25C
	Parameters: 1
	Flags: None
*/
function function_3c4884f1(var_819e1b79)
{
	self endon(#"disconnect");
	targetorigin = self.lastdeathpos;
	angles = undefined;
	players = [];
	foreach(player in getplayers(self.team))
	{
		if(player != self && isalive(player))
		{
			players[players.size] = player;
		}
	}
	if(players.size > 0)
	{
		targetplayer = players[randomint(players.size)];
		targetorigin = player.origin;
		targetangles = player.angles;
	}
	else if(isdefined(self.lastdeathpos))
	{
		targetorigin = self.lastdeathpos;
		if(death_circle::is_active())
		{
			targetangles = vectortoangles(death_circle::function_b980b4ca() - targetorigin);
		}
		else
		{
			targetangles = self.angles;
		}
	}
	if(isdefined(targetorigin))
	{
		fwd = anglestoforward(targetangles);
		spawnorigin = (targetorigin - (fwd * 1000)) + vectorscale((0, 0, 1), 500);
		self setorigin(spawnorigin);
		self player_insertion::start_freefall(fwd * 1000, 0);
	}
	self function_acdf637e();
}

/*
	Name: function_584c9f1
	Namespace: player_reinsertion
	Checksum: 0x6150D241
	Offset: 0x1DF8
	Size: 0xE4
	Parameters: 0
	Flags: None
*/
function function_584c9f1()
{
	self endon(#"disconnect");
	if(!isdefined(level.reinsertion.vehicle))
	{
		self thread player_insertion::function_77132caf();
		return;
	}
	var_c40f2e06 = function_f9348c1d();
	self function_564e0871();
	self player_insertion::function_f795bf83(level.insertion, level.reinsertion.vehicle, var_c40f2e06[1]);
	self setplayerangles(var_c40f2e06);
	self function_acdf637e();
}

/*
	Name: function_836fe662
	Namespace: player_reinsertion
	Checksum: 0x6D7F0A42
	Offset: 0x1EE8
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_836fe662()
{
	wait(1);
	if(isdefined(level.deathcircleindex))
	{
		level clientfield::set_world_uimodel("hudItems.warzone.reinsertionIndex", level.deathcircleindex + 1);
	}
	else
	{
		level clientfield::set_world_uimodel("hudItems.warzone.reinsertionIndex", 0);
	}
}

/*
	Name: function_fec68e5c
	Namespace: player_reinsertion
	Checksum: 0xEC4B2310
	Offset: 0x1F58
	Size: 0x5DC
	Parameters: 0
	Flags: None
*/
function function_fec68e5c()
{
	var_7eb8f61a = (isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0);
	/#
		if(getdvarint(#"scr_disable_infiltration", 0))
		{
			level.insertion.players = arraycopy(function_b2df2693());
			foreach(player in level.insertion.players)
			{
				player.var_c5134737 = 1;
				player thread [[level.spawnclient]]();
				if(isdefined(player.lastdeathpos))
				{
					player setorigin(player.lastdeathpos);
				}
			}
			return;
		}
	#/
	if(!isdefined(level.insertion) || !is_true(level.insertion.allowed))
	{
		return;
	}
	level thread function_836fe662();
	player_insertion::function_a21d9dc(level.insertion);
	level.insertion.players = arraycopy(function_b2df2693());
	level thread function_de24c569();
	wait(0.5 + 0.1);
	player_insertion::function_a5fd9aa8(level.insertion);
	foreach(player in level.insertion.players)
	{
		player.var_c5134737 = 1;
		player thread [[level.spawnclient]]();
		player player_insertion::function_b9a53f50();
	}
	level.insertion flag::set(#"insertion_teleport_completed");
	level.insertion flag::wait_till_timeout((1 + 2.5) + 0.5, #"insertion_presentation_completed");
	level.reinsertion.vehicle player_insertion::function_bc16f3b4(level.insertion);
	/#
		assert(10 > 0);
	#/
	wait(10);
	foreach(player in level.insertion.players)
	{
		if(!isdefined(player) || is_true(player.var_97b0977))
		{
			continue;
		}
		player clientfield::set_to_player("infiltration_final_warning", 1);
	}
	wait(5);
	player_insertion::function_a5fd9aa8(level.insertion);
	foreach(player in level.insertion.players)
	{
		if(!isdefined(player) || is_true(player.var_97b0977))
		{
			continue;
		}
		player flag::set(#"hash_224cb97b8f682317");
		player flag::set(#"hash_287397edba8966f9");
	}
	wait(1);
	level.reinsertion.vehicle clientfield::set("infiltration_transport", 0);
}

/*
	Name: function_5425f45d
	Namespace: player_reinsertion
	Checksum: 0xE6BBC069
	Offset: 0x2540
	Size: 0x276
	Parameters: 0
	Flags: None
*/
function function_5425f45d()
{
	if(death_circle::is_active())
	{
		var_d89a84b0 = level.deathcircles.size - 1;
		step_height = 20000 / var_d89a84b0;
		height_diff = level.deathcircleindex * step_height;
		center = death_circle::function_b980b4ca();
		radius = death_circle::function_f8dae197() * 0.5;
		angle = 0;
		var_180a7b48 = self namespace_b9471dc1::function_ec7cfdb();
		portal = level.warp_portal_vehicles[var_180a7b48];
		if(isdefined(portal) && isdefined(portal.angle_step))
		{
			angle = (isdefined(portal.angle_step) ? portal.angle_step : 0);
			x_pos = center[0] + (radius * cos(angle));
			y_pos = center[1] + (radius * sin(angle));
			height = 20000 - height_diff;
			z_pos = math::clamp(height, 12000, 20000);
			if(death_circle::function_9956f107())
			{
				height = 12000;
			}
			portal.origin = (x_pos, y_pos, z_pos);
			target = death_circle::get_next_origin() - portal.origin;
			target = vectornormalize(target);
			angles = vectortoangles(target);
			portal.angles = angles;
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_4012c0ab
	Namespace: player_reinsertion
	Checksum: 0x6C3A77D1
	Offset: 0x27C0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_4012c0ab(params)
{
	count = function_c14f7557();
	level clientfield::set_world_uimodel("hudItems.warzone.reinsertionPassengerCount", count);
}

/*
	Name: function_c14f7557
	Namespace: player_reinsertion
	Checksum: 0x7D5274BC
	Offset: 0x2810
	Size: 0x270
	Parameters: 0
	Flags: None
*/
function function_c14f7557()
{
	if(game.state != #"pregame" && game.state != #"playing")
	{
		return 0;
	}
	if(is_true(level.spawnsystem.deathcirclerespawn) && death_circle::function_4dc40125())
	{
		return 0;
	}
	if(is_true(level.wave_spawn) && death_circle::function_9956f107())
	{
		return 0;
	}
	count = 0;
	foreach(team in level.teams)
	{
		players = getplayers(team);
		var_40073db2 = 0;
		var_ead60f69 = 0;
		foreach(player in players)
		{
			if(isalive(player))
			{
				var_40073db2++;
				continue;
			}
			if(player.sessionstate != "playing" && player globallogic_player::function_38527849())
			{
				var_ead60f69++;
			}
		}
		if(!level.spawnsystem.var_c2cc011f || var_40073db2 > 0)
		{
			count = count + var_ead60f69;
		}
	}
	return count;
}

/*
	Name: function_a6eac3b7
	Namespace: player_reinsertion
	Checksum: 0x2F42E965
	Offset: 0x2A88
	Size: 0x7E
	Parameters: 0
	Flags: Private
*/
function private function_a6eac3b7()
{
	/#
		while(true)
		{
			if(getdvar(#"hash_3fb4a63926f3fa15", 0) > 0)
			{
				function_9536aa3d();
				setdvar(#"hash_3fb4a63926f3fa15", "");
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_9536aa3d
	Namespace: player_reinsertion
	Checksum: 0x5A8F45BA
	Offset: 0x2B10
	Size: 0x3B8
	Parameters: 0
	Flags: None
*/
function function_9536aa3d()
{
	/#
		var_269add6e = [];
		var_ef4e0b0 = [];
		foreach(team in level.teams)
		{
			var_d3934390 = 0;
			players_on_team = array::randomize(getplayers(team));
			foreach(person in players_on_team)
			{
				if(!isalive(person) || person laststand::player_is_in_laststand())
				{
					continue;
				}
				if(var_d3934390 == 0)
				{
					var_d3934390 = 1;
					var_269add6e[var_269add6e.size] = person;
					continue;
				}
				var_ef4e0b0[var_ef4e0b0.size] = person;
			}
		}
		foreach(not in var_ef4e0b0)
		{
			if(var_269add6e.size)
			{
				killer = var_269add6e[randomint(var_269add6e.size)];
			}
			else
			{
				killer = not;
			}
			not thread function_c833e81f(killer);
		}
		center = death_circle::function_b980b4ca();
		radius = death_circle::function_f8dae197() * 0.5;
		if(radius == 0)
		{
			radius = 500;
		}
		foreach(lucky in var_269add6e)
		{
			spawn_point = rotatepoint((radius, 0, 0), (0, randomint(360), 0));
			lucky setorigin((center + spawn_point) + vectorscale((0, 0, 1), 20000));
			lucky player_free_fall::function_7705a7fc(2, 0);
		}
	#/
}

/*
	Name: function_c833e81f
	Namespace: player_reinsertion
	Checksum: 0x39AAE757
	Offset: 0x2ED0
	Size: 0x84
	Parameters: 1
	Flags: Private
*/
function private function_c833e81f(killer)
{
	/#
		self endon(#"disconnect");
		self dodamage(self.health + 10000, self.origin + (0, 0, 1), killer);
		wait(1);
		self dodamage(self.health + 10000, self.origin + (0, 0, 1), killer);
	#/
}

/*
	Name: function_b5ee47fa
	Namespace: player_reinsertion
	Checksum: 0xB6F36186
	Offset: 0x2F60
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_b5ee47fa(func)
{
	level.var_43341799 = func;
}

/*
	Name: function_42a8e289
	Namespace: player_reinsertion
	Checksum: 0x4CB3C80D
	Offset: 0x2F88
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function function_42a8e289()
{
	return isdefined(level.var_43341799);
}

/*
	Name: function_1579c63e
	Namespace: player_reinsertion
	Checksum: 0x20ABAB40
	Offset: 0x2FA0
	Size: 0x18
	Parameters: 0
	Flags: None
*/
function function_1579c63e()
{
	self thread [[level.var_43341799]]();
}

