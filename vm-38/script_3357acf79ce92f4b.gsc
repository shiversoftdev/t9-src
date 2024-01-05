#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_behavior.gsc;
#using script_1940fc077a028a81;
#using script_3411bb48d41bd3b;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_df233b8a;

/*
	Name: function_498a44b1
	Namespace: namespace_df233b8a
	Checksum: 0xC537094
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_498a44b1()
{
	level notify(387123672);
}

#namespace awareness;

/*
	Name: __init__system__
	Namespace: awareness
	Checksum: 0xA853AF8C
	Offset: 0x190
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"awareness", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: awareness
	Checksum: 0x66D8CA3A
	Offset: 0x1D8
	Size: 0x1DC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level thread function_3041c2b8();
	level thread function_7a84e563();
	level.var_70dd6a1e = 1;
	level.var_782a62e0 = 0;
	level.var_7015803 = [];
	level.var_a82d661a = [];
	level thread function_8cdaa4ca();
	level.var_812c573d = new throttle();
	[[ level.var_812c573d ]]->initialize(1, float(function_60d95f53()) / 1000);
	level.var_108771cb = new throttle();
	[[ level.var_108771cb ]]->initialize(1, float(function_60d95f53()) / 1000);
	callback::on_ai_spawned(&function_4645d5f8);
	callback::on_ai_spawned(&function_fc45f7e2);
	level.var_83c46567 = &function_83c46567;
	clientfield::register("actor", "sndAwarenessChange", 1, 2, "int");
	/#
		level thread function_dfe1997a();
	#/
}

/*
	Name: function_8cdaa4ca
	Namespace: awareness
	Checksum: 0x2D2EDB19
	Offset: 0x3C0
	Size: 0xE8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8cdaa4ca()
{
	self notify("44c5c1a40d2c6661");
	self endon("44c5c1a40d2c6661");
	level endon(#"end_game");
	while(true)
	{
		current_time = gettime();
		var_df2fb7be = level.var_a82d661a.size - 1;
		while(var_df2fb7be >= 0)
		{
			var_b175b436 = level.var_a82d661a[var_df2fb7be];
			if(isdefined(var_b175b436.expire_time) && var_b175b436.expire_time < current_time)
			{
				arrayremoveindex(level.var_a82d661a, var_df2fb7be);
			}
			var_df2fb7be = var_df2fb7be - 1;
		}
		wait(5);
	}
}

/*
	Name: function_306a15d8
	Namespace: awareness
	Checksum: 0xABC6B63A
	Offset: 0x4B0
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_306a15d8(entity, radius)
{
	if(radius > level.var_782a62e0)
	{
		level.var_782a62e0 = radius;
	}
	entity.var_88d7b5b4 = radius;
}

/*
	Name: function_a2e5f01d
	Namespace: awareness
	Checksum: 0xA24040ED
	Offset: 0x500
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_a2e5f01d(entity)
{
	if(!isinarray(level.var_7015803, entity))
	{
		level.var_7015803[level.var_7015803.size] = entity;
	}
}

/*
	Name: function_d703c8f8
	Namespace: awareness
	Checksum: 0x82528B91
	Offset: 0x550
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_d703c8f8(entity)
{
	arrayremovevalue(level.var_7015803, entity);
}

/*
	Name: function_e732359c
	Namespace: awareness
	Checksum: 0x2DBCA76B
	Offset: 0x588
	Size: 0x9C
	Parameters: 5
	Flags: Linked
*/
function function_e732359c(type, position, var_4603c944, entity, params)
{
	level.var_ee6c4739[level.var_ee6c4739.size] = {#params:params, #entity:entity, #radius:var_4603c944, #position:position, #type:type};
}

/*
	Name: function_9d0a9f4e
	Namespace: awareness
	Checksum: 0xD25648C0
	Offset: 0x630
	Size: 0x380
	Parameters: 2
	Flags: Linked
*/
function function_9d0a9f4e(entity, awareness_event)
{
	/#
		if(getdvarint(#"hash_7228e2918da6da2a", 0) > 1)
		{
			colors = array((1, 0, 0), (1, 0.5, 0), (1, 1, 0), (0, 1, 0), (0, 0, 1), (1, 0, 1), (1, 0.7529412, 0.7960784), (0, 1, 1));
			if(!isdefined(self.var_12726112))
			{
				self.var_12726112 = 0;
			}
			var_a6373be0 = colors[self.var_12726112];
			self.var_12726112 = (self.var_12726112 + 1) % colors.size;
			start_pos = entity.origin + (0, 0, entity function_6a9ae71() / 2);
			recordline(start_pos, awareness_event.position, var_a6373be0, "", entity);
		}
	#/
	if(isdefined(self.var_3eaac485) && self.var_3eaac485 > gettime())
	{
		/#
			if(getdvarint(#"hash_7228e2918da6da2a", 0) > 1)
			{
				record3dtext("", (start_pos + awareness_event.position) / 2, var_a6373be0, "", entity);
			}
		#/
		return false;
	}
	if(self isplayinganimscripted())
	{
		/#
			if(getdvarint(#"hash_7228e2918da6da2a", 0) > 1)
			{
				record3dtext("", (start_pos + awareness_event.position) / 2, var_a6373be0, "", entity);
			}
		#/
		return false;
	}
	if(isdefined(entity.var_b4b8ad5f))
	{
		if(distancesquared(entity.var_b4b8ad5f.position, awareness_event.position) <= sqr(256))
		{
			/#
				if(getdvarint(#"hash_7228e2918da6da2a", 0) > 1)
				{
					record3dtext("", (start_pos + awareness_event.position) / 2, var_a6373be0, "", entity);
				}
			#/
			return false;
		}
	}
	/#
		if(getdvarint(#"hash_7228e2918da6da2a", 0) > 1)
		{
			record3dtext("", (start_pos + awareness_event.position) / 2, var_a6373be0, "", entity);
		}
	#/
	return true;
}

/*
	Name: function_1db27761
	Namespace: awareness
	Checksum: 0x691A3143
	Offset: 0x9B8
	Size: 0x22
	Parameters: 2
	Flags: Linked
*/
function function_1db27761(entity, event)
{
	entity.var_b4b8ad5f = event;
}

/*
	Name: pause
	Namespace: awareness
	Checksum: 0x1635F416
	Offset: 0x9E8
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function pause(entity)
{
	entity flag::set(#"hash_624e5d5dfb7f742b");
}

/*
	Name: resume
	Namespace: awareness
	Checksum: 0x60F6DF02
	Offset: 0xA20
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function resume(entity)
{
	entity flag::clear(#"hash_624e5d5dfb7f742b");
}

/*
	Name: function_49170ec2
	Namespace: awareness
	Checksum: 0x85986BB3
	Offset: 0xA58
	Size: 0x2A
	Parameters: 1
	Flags: Linked
*/
function function_49170ec2(entity)
{
	return entity flag::get(#"hash_624e5d5dfb7f742b");
}

/*
	Name: function_cf2fab43
	Namespace: awareness
	Checksum: 0xC5FBFE4
	Offset: 0xA90
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_cf2fab43(event)
{
	if(function_9d0a9f4e(self, event))
	{
		function_1db27761(self, event);
	}
}

/*
	Name: function_3041c2b8
	Namespace: awareness
	Checksum: 0x18785EB1
	Offset: 0xAD8
	Size: 0x110
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3041c2b8()
{
	level endon(#"game_ended");
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(#"glass_smash");
		origin = undefined;
		radius = undefined;
		entity = undefined;
		if(waitresult._notify === #"glass_smash")
		{
			origin = waitresult.position;
			radius = 800;
			ai = getentitiesinradius(origin, 50, 15);
			if(ai.size > 0)
			{
				continue;
			}
		}
		if(isdefined(origin) && isdefined(radius))
		{
			function_e732359c(0, origin, radius, entity);
		}
	}
}

/*
	Name: function_7a84e563
	Namespace: awareness
	Checksum: 0x5849BFD
	Offset: 0xBF0
	Size: 0x88
	Parameters: 0
	Flags: Linked, Private
*/
function private function_7a84e563()
{
	level endon(#"game_ended");
	level.var_ee6c4739 = [];
	while(true)
	{
		waitframe(1);
		if(level.var_ee6c4739.size > 0)
		{
			event = array::pop(level.var_ee6c4739, 0, 0);
			function_83baeaf1(event);
		}
	}
}

/*
	Name: function_8a544559
	Namespace: awareness
	Checksum: 0x654D6F02
	Offset: 0xC80
	Size: 0xB4
	Parameters: 1
	Flags: Event
*/
event function_8a544559(eventstruct)
{
	if(!is_true(level.var_70dd6a1e))
	{
		return;
	}
	if(!isplayer(self) || !namespace_85745671::function_44a83b40(eventstruct.vehicle))
	{
		return;
	}
	eventstruct.vehicle callback::function_d8abfc3d(#"hash_6e388f6a0df7bdac", &function_1d61b6d6);
	eventstruct.vehicle thread function_44454d0f();
}

/*
	Name: function_1d61b6d6
	Namespace: awareness
	Checksum: 0xE74EF699
	Offset: 0xD40
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1d61b6d6(params)
{
	self.var_4efd1a01 = params.var_d8ceeba3;
	if(is_true(self.var_4efd1a01))
	{
		function_e732359c(0, self.origin, 5000, self);
	}
}

/*
	Name: function_44454d0f
	Namespace: awareness
	Checksum: 0x60747FC2
	Offset: 0xDA8
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_44454d0f(n_radius)
{
	self notify(#"hash_2ccfddebdf6bcf98");
	self endon(#"death", #"hash_2ccfddebdf6bcf98");
	if(isdefined(n_radius))
	{
		var_80121938 = n_radius;
	}
	else
	{
		var_80121938 = 2000;
	}
	while(true)
	{
		var_fb6494ee = var_80121938;
		if(is_true(self.var_4efd1a01))
		{
			var_fb6494ee = 5000;
		}
		function_e732359c(0, self.origin, var_fb6494ee, self);
		wait(0.5);
	}
}

/*
	Name: function_af1a8e24
	Namespace: awareness
	Checksum: 0xA22223CA
	Offset: 0xE80
	Size: 0xB4
	Parameters: 1
	Flags: Event
*/
event function_af1a8e24(eventstruct)
{
	if(!is_true(level.var_70dd6a1e))
	{
		return;
	}
	if(!isplayer(self) || !namespace_85745671::function_44a83b40(eventstruct.vehicle))
	{
		return;
	}
	eventstruct.vehicle callback::function_52ac9652(#"hash_6e388f6a0df7bdac", &function_1d61b6d6);
	eventstruct.vehicle notify(#"hash_2ccfddebdf6bcf98");
}

/*
	Name: function_83baeaf1
	Namespace: awareness
	Checksum: 0x2703CF13
	Offset: 0xF40
	Size: 0x228
	Parameters: 1
	Flags: Linked, Private
*/
function private function_83baeaf1(event)
{
	/#
		if(getdvarint(#"hash_7228e2918da6da2a", 0))
		{
			function_fbae6630(event);
		}
	#/
	close_ai = getentitiesinradius(event.position, event.radius + level.var_782a62e0, 15);
	foreach(ai in close_ai)
	{
		var_88d7b5b4 = (isdefined(ai.var_88d7b5b4) ? ai.var_88d7b5b4 : 0);
		if(distancesquared(event.position, ai.origin) > (sqr(event.radius + var_88d7b5b4)) || (abs(event.position[2] - ai.origin[2])) > 300)
		{
			continue;
		}
		ai callback::callback(#"awareness_event", {#params:event.params, #position:event.position, #entity:event.entity, #type:event.type});
	}
}

/*
	Name: function_da91200f
	Namespace: awareness
	Checksum: 0xD6912B47
	Offset: 0x1170
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_da91200f(eventstruct)
{
	if(!is_true(level.var_70dd6a1e))
	{
		return;
	}
	eventstruct.projectile thread function_bf26aaf9();
}

/*
	Name: function_bf26aaf9
	Namespace: awareness
	Checksum: 0x8436FC60
	Offset: 0x11C0
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bf26aaf9(params)
{
	self endon(#"death");
	waitresult = undefined;
	waitresult = self waittill(#"grenade_bounce");
	if(isdefined(waitresult))
	{
		function_e732359c(0, waitresult.position, 256, self);
	}
}

/*
	Name: function_83c46567
	Namespace: awareness
	Checksum: 0x75895DE4
	Offset: 0x1240
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_83c46567(dynent)
{
	function_e732359c(0, dynent.origin, 1000);
}

/*
	Name: function_4645d5f8
	Namespace: awareness
	Checksum: 0xB70CDB56
	Offset: 0x1278
	Size: 0x2BE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4645d5f8(params)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"gunshot", #"explode", #"hash_c77d45f3ba174cb", #"alert");
		if(self.current_state.name === #"chase")
		{
			self waittill(#"state_changed");
			continue;
		}
		switch(waitresult._notify)
		{
			case "gunshot":
			{
				self callback::callback(#"awareness_event", {#position:waitresult.position, #entity:waitresult.suppressor, #type:4});
				break;
			}
			case "explode":
			{
				self callback::callback(#"awareness_event", {#params:{#radius:1024}, #position:waitresult.position, #entity:waitresult.owner, #type:2});
				break;
			}
			case "hash_c77d45f3ba174cb":
			{
				self callback::callback(#"awareness_event", {#params:{#enemy:waitresult.originator.enemy}, #position:waitresult.originator.origin, #entity:waitresult.originator, #type:3});
				break;
			}
			case "alert":
			{
				self.var_1033fa72 = 1;
				break;
			}
		}
	}
}

/*
	Name: function_fc45f7e2
	Namespace: awareness
	Checksum: 0x9E7354DE
	Offset: 0x1540
	Size: 0xD6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fc45f7e2(params)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"hash_4f3c0b937432f8b0");
		switch(waitresult._notify)
		{
			case "hash_4f3c0b937432f8b0":
			{
				self callback::callback(#"hash_4f3c0b937432f8b0", {#victim:waitresult.victim, #attacker:waitresult.attacker});
				break;
			}
		}
	}
}

/*
	Name: register_state
	Namespace: awareness
	Checksum: 0xDF109E67
	Offset: 0x1620
	Size: 0xF4
	Parameters: 7
	Flags: Linked
*/
function register_state(entity, name, enter, update, exit, target_update, debug_update)
{
	if(!isdefined(entity.var_d2a0e298))
	{
		entity.var_d2a0e298 = [];
	}
	/#
		assert(!isdefined(entity.var_d2a0e298[name]));
	#/
	entity.var_d2a0e298[name] = {#debug_func:debug_update, #target_func:target_update, #exit_func:exit, #update_func:update, #enter_func:enter, #name:name};
}

/*
	Name: set_state
	Namespace: awareness
	Checksum: 0xA23EFEE0
	Offset: 0x1720
	Size: 0x16C
	Parameters: 2
	Flags: Linked
*/
function set_state(entity, state_name)
{
	/#
		/#
			assert(isdefined(entity.var_d2a0e298[state_name]), "" + (ishash(state_name) ? function_9e72a96(state_name) : state_name));
		#/
	#/
	state = entity.var_d2a0e298[state_name];
	if(isdefined(entity.current_state))
	{
		if(isdefined(entity.current_state.exit_func))
		{
			[[entity.current_state.exit_func]](entity);
		}
		entity callback::callback(#"hash_540e54ba804a87b9");
	}
	entity notify(#"state_changed");
	if(isdefined(state) && isdefined(state.enter_func))
	{
		[[state.enter_func]](entity);
	}
	entity.current_state = state;
	entity callback::callback(#"hash_4afe635f36531659");
}

/*
	Name: target_update
	Namespace: awareness
	Checksum: 0xCE20CCB6
	Offset: 0x1898
	Size: 0x90
	Parameters: 1
	Flags: Linked
*/
function target_update(entity)
{
	if(flag::get(#"hash_624e5d5dfb7f742b"))
	{
		return;
	}
	if(entity function_dd070839())
	{
		return;
	}
	if(isdefined(entity.current_state) && isdefined(entity.current_state.target_func))
	{
		entity [[entity.current_state.target_func]](entity);
	}
}

/*
	Name: function_fa6e010d
	Namespace: awareness
	Checksum: 0x1B043758
	Offset: 0x1930
	Size: 0x41A
	Parameters: 0
	Flags: Linked
*/
function function_fa6e010d()
{
	level endon(#"game_ended");
	self endon(#"death");
	while(true)
	{
		if((self getentitynumber() & 3) != (getlevelframenumber() & 3) || flag::get(#"hash_624e5d5dfb7f742b"))
		{
			/#
				if(getdvarint(#"hash_7228e2918da6da2a", 0) && flag::get(#"hash_624e5d5dfb7f742b"))
				{
					if(getdvarint(#"recorder_enablerec", 0))
					{
						record3dtext("", self.origin, (0, 1, 1), "", self);
					}
					else
					{
						print3d(self.origin, "", (0, 1, 1), 1, 1);
					}
				}
			#/
			if(getplayers(undefined, self.origin, getdvarint(#"hash_40e792a0b1b00e89", 5000)).size)
			{
				waitframe(3);
			}
			else
			{
				self waittilltimeout(1, #"hash_7a49c65fe733bb0b", #"state_changed", #"hash_1ea32021fdf52a8b");
			}
			continue;
		}
		if(isdefined(self.current_state) && isdefined(self.current_state.update_func))
		{
			[[self.current_state.update_func]](self);
		}
		/#
			if(isdefined(self.current_state) && getdvarint(#"hash_7228e2918da6da2a", 0))
			{
				if(getdvarint(#"recorder_enablerec", 0))
				{
					record3dtext(function_9e72a96(self.current_state.name), self.origin, (0, 1, 1), "", self);
				}
				else
				{
					print3d(self.origin, function_9e72a96(self.current_state.name), (0, 1, 1), 1, 1);
				}
				if(is_true(self.var_1033fa72))
				{
					if(getdvarint(#"recorder_enablerec", 0))
					{
						record3dtext("", self.origin, (0, 1, 1), "", self);
					}
					else
					{
						print3d(self.origin, "", (0, 1, 1), 1, 1);
					}
				}
				if(isdefined(self.current_state.debug_func))
				{
					[[self.current_state.debug_func]](self);
				}
			}
		#/
		waitframe(1);
	}
}

/*
	Name: function_5f511313
	Namespace: awareness
	Checksum: 0x107B4508
	Offset: 0x1D58
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_5f511313(params)
{
	if(isdefined(params) && (isdefined(params.eattacker) && isdefined(self.current_state)) && self.current_state.name !== #"chase" && distancesquared(params.eattacker.origin, self.origin) <= sqr(5000) && function_4df0b826(self, params.eattacker) && params.idamage < self.health)
	{
		set_state(self, #"chase");
		function_c241ef9a(self, params.eattacker, -1);
	}
}

/*
	Name: function_b184324d
	Namespace: awareness
	Checksum: 0xA9A6B6CF
	Offset: 0x1E80
	Size: 0x1FE
	Parameters: 5
	Flags: Linked
*/
function function_b184324d(origin, radius, var_5e8ea34a, dist_from_boundary, var_5e95f317)
{
	if(!isdefined(var_5e8ea34a))
	{
		var_5e8ea34a = 0;
	}
	if(!isdefined(dist_from_boundary))
	{
		dist_from_boundary = 15;
	}
	if(!isdefined(var_5e95f317))
	{
		var_5e95f317 = dist_from_boundary;
	}
	theta = randomfloatrange(0, 360);
	var_34b0ef7b = anglestoforward((0, theta, 0));
	var_43c4564a = 0;
	if(radius > 0)
	{
		var_43c4564a = min(var_5e8ea34a / radius, 0.99);
	}
	point = ((var_34b0ef7b[0] * radius) * randomfloatrange(var_43c4564a, 1), (var_34b0ef7b[1] * radius) * randomfloatrange(var_43c4564a, 1), 0);
	point = (origin[0] + point[0], origin[1] + point[1], origin[2]);
	if(isdefined(point))
	{
		/#
			recordstar(point, (0, 0, 1), "", self);
		#/
		point = checknavmeshdirection(origin, point - origin, max(distance(point, origin), dist_from_boundary), var_5e95f317);
		return getclosestpointonnavmesh(point, var_5e95f317, dist_from_boundary);
	}
	return undefined;
}

/*
	Name: function_496e0dbc
	Namespace: awareness
	Checksum: 0xF0EF3DB6
	Offset: 0x2088
	Size: 0x20E
	Parameters: 6
	Flags: Linked
*/
function function_496e0dbc(entity, origin, radius, var_5e8ea34a, dist_from_boundary, height)
{
	if(!isdefined(var_5e8ea34a))
	{
		var_5e8ea34a = 0;
	}
	if(!isdefined(dist_from_boundary))
	{
		dist_from_boundary = 15;
	}
	if(level.script !== #"wz_ski_slopes" || !is_true(getdvar(#"hash_2d0879ab385bc2c8", 0)))
	{
		queryresult = positionquery_source_navigation(origin, var_5e8ea34a, radius, max(height, 10) / 2, dist_from_boundary, entity);
	}
	else
	{
		queryresult = {#data:namespace_85745671::function_e4791424(origin, 4, max(height, 10) / 2, radius, 0, 0, 1, 0)};
	}
	if(isarray(queryresult.data) && queryresult.data.size)
	{
		positionquery_filter_inclaimedlocation(queryresult, entity);
		queryresult.data = function_7b8e26b3(queryresult.data, 0, "inClaimedLocation");
		if(isdefined(queryresult) && queryresult.data.size > 0)
		{
			return arraygetclosest(origin, queryresult.data).origin;
		}
	}
	return undefined;
}

/*
	Name: function_555d960b
	Namespace: awareness
	Checksum: 0xF4AE5550
	Offset: 0x22A0
	Size: 0x1F8
	Parameters: 1
	Flags: Linked
*/
function function_555d960b(entity)
{
	/#
		if(isdefined(entity.spawn_point) && isdefined(entity.wander_radius))
		{
			circle(entity.spawn_point.origin, int(entity.wander_radius), (0, 1, 1), 1, 1, 1);
		}
		var_1f2328d0 = entity function_4794d6a3();
		if(isdefined(var_1f2328d0))
		{
			debugstar(var_1f2328d0.goalpos, 1, (0, 1, 0));
		}
		if(isdefined(entity.var_1267fdea))
		{
			record3dtext("" + (int(entity.var_1267fdea * 1000)), entity.origin, (0, 1, 0), "", entity);
		}
		foreach(index, var_1d3d7802 in entity.var_eb5eeb0f)
		{
			record3dtext((("" + index) + "") + (gettime() - var_1d3d7802), entity.origin, (0, 1, 0), "", entity);
		}
	#/
}

/*
	Name: function_9c9d96b5
	Namespace: awareness
	Checksum: 0xF24F6F11
	Offset: 0x24A0
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_9c9d96b5(entity)
{
	if(self.current_state.name === #"chase" || self.current_state.name === #"investigate")
	{
		self.var_2772a472 = 1;
	}
	self.var_9f6112bb = 1;
	entity.ignoreexplosionevents = 1;
	entity.awarenesslevelcurrent = "unaware";
	if(!isdefined(entity.var_6324ed63) || gettime() >= entity.var_6324ed63)
	{
		entity.favoriteenemy = undefined;
	}
	entity.var_eb5eeb0f = [];
	if(ispointonnavmesh(entity.origin, entity) && !is_true(entity.var_7496eca2))
	{
		entity thread function_3bac247(entity);
	}
	entity callback::function_d8abfc3d(#"awareness_event", &function_cf2fab43);
}

/*
	Name: function_3b4cac9b
	Namespace: awareness
	Checksum: 0xC3DC1CAC
	Offset: 0x25F8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_3b4cac9b(notifyhash)
{
	[[ level.var_108771cb ]]->leavequeue(self);
}

/*
	Name: function_3bac247
	Namespace: awareness
	Checksum: 0xFD35B59D
	Offset: 0x2628
	Size: 0x488
	Parameters: 1
	Flags: Linked
*/
function function_3bac247(entity)
{
	entity endoncallback(&function_3b4cac9b, #"death", #"state_changed");
	origin = entity.origin;
	var_af6bd013 = entity getpathfindingradius() * 1.2;
	var_e49abf9f = (isdefined(entity.var_958e7ee4) ? entity.var_958e7ee4 : 3);
	var_a33458ef = (isdefined(entity.var_eb3258b) ? entity.var_eb3258b : 5);
	var_f0b43a45 = (isdefined(entity.var_e4514346) ? entity.var_e4514346 : 0.5);
	var_7f4fe0f1 = (isdefined(entity.var_f6ea781c) ? entity.var_f6ea781c : 1);
	entity.wander_radius = (isdefined(entity.spawn_point.wander_radius) ? entity.spawn_point.wander_radius : 128);
	while(true)
	{
		flag::wait_till_clear(#"hash_624e5d5dfb7f742b");
		[[ level.var_108771cb ]]->waitinqueue(entity);
		if(isdefined(entity.spawn_point) && isdefined(entity.spawn_point.origin))
		{
			goal = function_b184324d(entity.spawn_point.origin, entity.wander_radius, entity getpathfindingradius() * 1.2, var_af6bd013);
		}
		else
		{
			goal = function_b184324d(entity.origin, 300, 100, var_af6bd013, entity getpathfindingradius());
			/#
				if(getdvarint(#"hash_50e7f4258cd6dd5", 0))
				{
					type = "";
				}
			#/
		}
		if(flag::get(#"hash_624e5d5dfb7f742b"))
		{
			continue;
		}
		if(!isdefined(goal))
		{
			goal = entity.origin;
		}
		entity namespace_e292b080::zombieupdategoal(goal);
		if(!getdvarint(#"hash_50e7f4258cd6dd5", 0))
		{
			waitresult = undefined;
			waitresult = entity waittilltimeout(randomfloatrange(var_e49abf9f, var_a33458ef), #"goal");
		}
		else
		{
			/#
				waitresult = undefined;
				waitresult = entity waittilltimeout(randomfloatrange(var_e49abf9f, var_a33458ef), #"goal", #"bad_path");
				debugstar(waitresult.position, 100, (1, 0, 1), type);
				line(entity.origin, waitresult.position, (1, 0, 1), 1, 0, 100);
			#/
			if(waitresult._notify === #"bad_path")
			{
				/#
				#/
			}
		}
		if(waitresult._notify === #"goal" || waitresult._notify === #"bad_path")
		{
			wait(randomfloatrange(var_f0b43a45, var_7f4fe0f1));
		}
	}
}

/*
	Name: function_c91092d2
	Namespace: awareness
	Checksum: 0x24063055
	Offset: 0x2AB8
	Size: 0x116
	Parameters: 2
	Flags: Linked
*/
function function_c91092d2(var_f83c1c54, time_sec)
{
	var_27cd0f02 = self seerecently(var_f83c1c54, 1);
	if(!var_27cd0f02)
	{
		self.var_eb5eeb0f[var_f83c1c54 getentitynumber()] = undefined;
		if(!isdefined(time_sec))
		{
			return 0;
		}
	}
	else
	{
		if(!isdefined(self.var_eb5eeb0f[var_f83c1c54 getentitynumber()]))
		{
			self.var_eb5eeb0f[var_f83c1c54 getentitynumber()] = gettime();
		}
		if(!isdefined(time_sec))
		{
			return 1;
		}
	}
	return var_27cd0f02 && (gettime() - self.var_eb5eeb0f[var_f83c1c54 getentitynumber()]) > (int(time_sec * 1000));
}

/*
	Name: function_4ebe4a6d
	Namespace: awareness
	Checksum: 0xB2A930AB
	Offset: 0x2BD8
	Size: 0x29C
	Parameters: 1
	Flags: Linked
*/
function function_4ebe4a6d(entity)
{
	if(isdefined(entity.enemy) && function_4df0b826(entity, entity.enemy))
	{
		var_e91a592a = entity function_c91092d2(entity.enemy, entity.var_1267fdea) || (entity seerecently(entity.enemy, 1) && namespace_85745671::function_142c3c86(entity.enemy));
		var_7be806db = entity attackedrecently(entity.enemy, 1);
		var_8bbedf63 = entity.enemy attackedrecently(entity, 1);
		var_eae820e3 = distancesquared(entity.origin, entity.enemy.origin) < sqr(128);
		if(var_e91a592a || var_7be806db || var_8bbedf63 || var_eae820e3)
		{
			entity.favoriteenemy = entity.enemy;
			entity.var_5aaa7f76 = entity.favoriteenemy.origin;
		}
	}
	if(isdefined(entity.favoriteenemy) || isdefined(entity.enemy_override) || isdefined(entity.attackable))
	{
		set_state(entity, #"chase");
		return;
	}
	if(isdefined(entity.var_b4b8ad5f))
	{
		set_state(entity, #"investigate");
		return;
	}
	if(is_true(entity.var_48915943))
	{
		if(!is_true(entity.got_to_entrance))
		{
			function_7c72a5c7(entity);
		}
		function_fd83d499(entity);
	}
}

/*
	Name: function_b264a0bc
	Namespace: awareness
	Checksum: 0x5CD9572
	Offset: 0x2E80
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_b264a0bc(entity)
{
	entity.ignoreexplosionevents = 0;
	entity.wander_radius = undefined;
	entity callback::function_52ac9652(#"awareness_event", &function_cf2fab43);
}

/*
	Name: function_4df0b826
	Namespace: awareness
	Checksum: 0x99313E36
	Offset: 0x2EE0
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function function_4df0b826(entity, enemy)
{
	if(!isdefined(entity.var_341387d5) || !isdefined(entity.var_b518f045))
	{
		return 1;
	}
	return distance2dsquared(entity.var_341387d5, enemy.origin) <= sqr(entity.var_b518f045);
}

/*
	Name: function_853a6d58
	Namespace: awareness
	Checksum: 0x5568F5D5
	Offset: 0x2F68
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_853a6d58(event)
{
	if(function_9d0a9f4e(self, event))
	{
		self thread function_2eab2251(self, event);
	}
}

/*
	Name: function_b41f0471
	Namespace: awareness
	Checksum: 0x11D03011
	Offset: 0x2FB0
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_b41f0471(entity)
{
	/#
		assert(isdefined(entity.var_b4b8ad5f));
	#/
	entity.var_eb5eeb0f = [];
	callback::function_d8abfc3d(#"awareness_event", &function_853a6d58);
	entity thread function_2eab2251(entity, entity.var_b4b8ad5f);
}

/*
	Name: function_56907d56
	Namespace: awareness
	Checksum: 0x9D3EC9F0
	Offset: 0x3040
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_56907d56(notifyhash)
{
	[[ level.var_812c573d ]]->leavequeue(self);
}

/*
	Name: function_6938f39b
	Namespace: awareness
	Checksum: 0xE03BB8A7
	Offset: 0x3070
	Size: 0x112
	Parameters: 2
	Flags: Linked
*/
function function_6938f39b(entity, awareness_event)
{
	if(distancesquared(entity.origin, awareness_event.position) < sqr(256) && !entity function_8ccbffca(awareness_event.params.enemy))
	{
		function_c241ef9a(entity, awareness_event.params.enemy, -1);
		set_state(entity, #"chase");
		return true;
	}
	if(!isdefined(awareness_event.entity) || !entity seerecently(awareness_event.entity, 1))
	{
		return false;
	}
	return true;
}

/*
	Name: function_2eab2251
	Namespace: awareness
	Checksum: 0x23ED3BD1
	Offset: 0x3190
	Size: 0x6DC
	Parameters: 2
	Flags: Linked
*/
function function_2eab2251(entity, awareness_event)
{
	self notify(#"hash_1ea32021fdf52a8b");
	self endoncallback(&function_56907d56, #"death", #"state_changed", #"hash_1ea32021fdf52a8b");
	investigate_point = undefined;
	var_2e7ba82c = undefined;
	var_79c2b6b8 = 256;
	if(isdefined(awareness_event))
	{
		switch(awareness_event.type)
		{
			case 0:
			case 4:
			{
				var_2e7ba82c = awareness_event.position;
				break;
			}
			case 1:
			{
				var_2e7ba82c = awareness_event.params.position;
				break;
			}
			case 2:
			{
				var_2e7ba82c = awareness_event.position;
				var_79c2b6b8 = awareness_event.params.radius;
				break;
			}
			case 3:
			{
				var_2e7ba82c = awareness_event.params.enemy.origin;
				if(!function_6938f39b(entity, awareness_event))
				{
					return;
				}
				break;
			}
		}
		if(!isdefined(var_2e7ba82c))
		{
			return;
		}
		entity.var_5aaa7f76 = var_2e7ba82c;
		entity.awarenesslevelcurrent = "low_alert";
		/#
			recordstar(entity.var_5aaa7f76, (0, 1, 0), "", entity);
			recordline(entity.origin, entity.var_5aaa7f76, (0, 1, 0), "", entity);
			record3dtext("", entity.var_5aaa7f76, (0, 1, 0), "", entity);
			record3dtext("", entity.origin, (0, 1, 0), "", entity);
		#/
		[[ level.var_812c573d ]]->waitinqueue(entity);
		if(awareness_event.type === 4)
		{
			var_7a601c40 = vectorscale((0, 0, 1), 70);
			trace = groundtrace(var_2e7ba82c, var_2e7ba82c - var_7a601c40, 0, entity);
			var_2e7ba82c = var_2e7ba82c - (var_7a601c40 * trace[#"fraction"]);
		}
		investigate_point = function_496e0dbc(entity, var_2e7ba82c, 256, 0, entity getpathfindingradius(), 200);
	}
	if(!isdefined(investigate_point) && isdefined(var_2e7ba82c))
	{
		/#
			if(getdvarint(#"hash_7228e2918da6da2a", 0))
			{
				record3dtext("", entity.origin, (1, 0, 0), "", entity);
			}
		#/
		investigate_point = checknavmeshdirection(entity.origin, var_2e7ba82c - entity.origin, distance(var_2e7ba82c, entity.origin) * randomfloatrange(0.8, 1.2), entity getpathfindingradius());
	}
	if(!isdefined(investigate_point) || distancesquared(entity.origin, investigate_point) <= sqr(entity.goalradius))
	{
		/#
			if(getdvarint(#"hash_7228e2918da6da2a", 0))
			{
				record3dtext("", entity.origin, (1, 0, 0), "", entity);
			}
		#/
		entity setgoal(entity.origin);
		wait(randomfloatrange(2, 5));
		if(isdefined(awareness_event) && awareness_event === entity.var_b4b8ad5f)
		{
			function_1db27761(entity, undefined);
		}
		return;
	}
	if(flag::get(#"hash_624e5d5dfb7f742b"))
	{
		return;
	}
	function_1db27761(entity, awareness_event);
	if(!entity isingoal(investigate_point))
	{
		entity namespace_e292b080::zombieupdategoal(investigate_point);
		waitresult = undefined;
		waitresult = entity waittill(#"goal", #"bad_path");
		if(isdefined(waitresult) && waitresult._notify == #"bad_path")
		{
			entity.var_3eaac485 = gettime() + (int(randomfloatrange(1.5, 2.5) * 1000));
			entity setgoal(entity.origin);
		}
		if(entity isingoal(investigate_point))
		{
			wait(randomfloatrange(2, 5));
		}
	}
	else
	{
		wait(randomfloatrange(2, 5));
	}
	function_1db27761(entity, undefined);
}

/*
	Name: function_a360dd00
	Namespace: awareness
	Checksum: 0xA617CA65
	Offset: 0x3878
	Size: 0x198
	Parameters: 1
	Flags: Linked
*/
function function_a360dd00(entity)
{
	/#
		if(isdefined(entity.goalpos))
		{
			debugstar(entity.goalpos, 1, (0, 0, 1));
			line(entity.origin, entity.goalpos, (0, 0, 1), 1, 1, 1);
		}
		if(isdefined(entity.var_1267fdea))
		{
			record3dtext("" + (int(entity.var_1267fdea * 1000)), entity.origin, (0, 1, 0), "", entity);
		}
		foreach(index, var_1d3d7802 in entity.var_eb5eeb0f)
		{
			record3dtext((("" + index) + "") + (gettime() - var_1d3d7802), entity.origin, (0, 1, 0), "", entity);
		}
	#/
}

/*
	Name: function_9eefc327
	Namespace: awareness
	Checksum: 0xA75A1A78
	Offset: 0x3A18
	Size: 0x226
	Parameters: 1
	Flags: Linked
*/
function function_9eefc327(entity)
{
	if(isdefined(entity.enemy))
	{
		var_e91a592a = entity function_c91092d2(entity.enemy, entity.var_1267fdea) || (entity seerecently(entity.enemy, 1) && namespace_85745671::function_142c3c86(entity.enemy));
		var_7be806db = entity attackedrecently(entity.enemy, 1);
		var_8bbedf63 = entity.enemy attackedrecently(entity, 1);
		if(var_e91a592a || var_7be806db || var_8bbedf63)
		{
			entity.favoriteenemy = entity.enemy;
			entity.var_5aaa7f76 = entity.favoriteenemy.origin;
		}
	}
	if(is_true(entity.var_48915943))
	{
		if(!is_true(entity.got_to_entrance))
		{
			function_7c72a5c7(entity);
		}
		if(function_fd83d499(entity))
		{
			return;
		}
	}
	if(isdefined(entity.favoriteenemy) || isdefined(entity.enemy_override) || isdefined(entity.attackable))
	{
		set_state(entity, #"chase");
		return;
	}
	if(!isdefined(entity.var_b4b8ad5f))
	{
		set_state(entity, #"wander");
		return;
	}
}

/*
	Name: function_34162a25
	Namespace: awareness
	Checksum: 0xD6B89FA3
	Offset: 0x3C48
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_34162a25(entity)
{
	function_1db27761(entity, undefined);
	entity callback::function_52ac9652(#"awareness_event", &function_853a6d58);
}

/*
	Name: function_c241ef9a
	Namespace: awareness
	Checksum: 0x391F72F3
	Offset: 0x3CA8
	Size: 0xCE
	Parameters: 3
	Flags: Linked
*/
function function_c241ef9a(ai, enemy, var_fb09158c)
{
	if(!issentient(enemy) || is_true(enemy.ignoreme) || enemy isnotarget())
	{
		return;
	}
	ai.favoriteenemy = enemy;
	ai.var_6324ed63 = (var_fb09158c > 0 ? gettime() + (int(var_fb09158c * 1000)) : -1);
	ai.var_5aaa7f76 = enemy.origin;
}

/*
	Name: function_d7fedde2
	Namespace: awareness
	Checksum: 0x809CCE90
	Offset: 0x3D80
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_d7fedde2(entity)
{
	players = array::get_all_closest(entity.origin, function_a1ef346b());
	foreach(player in players)
	{
		if(!is_true(player.ignoreme) && !player isnotarget() && !player util::is_spectating())
		{
			return player;
		}
	}
	return undefined;
}

/*
	Name: function_2bc424fd
	Namespace: awareness
	Checksum: 0xA58DCD01
	Offset: 0x3E98
	Size: 0x27C
	Parameters: 2
	Flags: Linked
*/
function function_2bc424fd(entity, target)
{
	if(!issentient(target))
	{
		return 0;
	}
	if(entity function_8ccbffca(target))
	{
		return 0;
	}
	if(isplayer(target) && target isinvehicle() && distance2dsquared(entity.origin, target.origin) > 9000000)
	{
		return 0;
	}
	if(isplayer(target) && target util::is_spectating())
	{
		return 0;
	}
	if(entity.var_8a3828c6 === target)
	{
		return 1;
	}
	var_a63ddc4 = entity.var_6324ed63 === -1 || (isdefined(entity.var_6324ed63) && gettime() < entity.var_6324ed63);
	var_27cd0f02 = entity seerecently(target, (isdefined(entity.var_e453bcfa) ? entity.var_e453bcfa : 5));
	var_7be806db = entity attackedrecently(target, (isdefined(entity.var_91a026f2) ? entity.var_91a026f2 : 10));
	var_8bbedf63 = target attackedrecently(entity, (isdefined(entity.var_7ee943e1) ? entity.var_7ee943e1 : 10));
	var_eae820e3 = distancesquared(entity.origin, target.origin) < sqr(128);
	return var_a63ddc4 || var_27cd0f02 || var_7be806db || var_8bbedf63 || var_eae820e3;
}

/*
	Name: function_5c40e824
	Namespace: awareness
	Checksum: 0xABA7C669
	Offset: 0x4120
	Size: 0x161C
	Parameters: 1
	Flags: Linked
*/
function function_5c40e824(entity)
{
	potential_targets = [];
	var_8d6705e8 = [];
	possible_targets = [];
	if(!isdefined(self.var_2d5cbb7))
	{
		self.var_2d5cbb7 = [];
	}
	target_player = entity.team === level.zombie_team;
	var_7c12fa23 = 0;
	if(target_player)
	{
		possible_targets = function_a1ef346b();
		function_1eaaceab(level.var_7015803, 0);
		possible_targets = arraycombine(possible_targets, level.var_7015803);
		foreach(target in possible_targets)
		{
			if(function_2bc424fd(entity, target) && (!target.ignoreme && !target isnotarget() || target === entity.var_8a3828c6))
			{
				function_bc3f5b5a(entity, target);
				position = (isdefined(target.last_valid_position) ? target.last_valid_position : target.origin);
				potential_targets[potential_targets.size] = target;
				var_8d6705e8[var_8d6705e8.size] = position;
				if(!isdefined(self.var_2d5cbb7[target getentitynumber()]))
				{
					self.var_2d5cbb7[target getentitynumber()] = {#dist:-1, #hash_e29d2657:0};
				}
				if(isplayer(target) && target isinvehicle())
				{
					var_7c12fa23 = 1;
				}
			}
			/#
				/#
					assert(potential_targets.size <= 16, "");
				#/
			#/
		}
	}
	else
	{
		possible_targets = getentitiesinradius(entity.origin, 1500, 15);
		var_2019ec4e = (isdefined(entity.var_443d78cc) ? entity.var_443d78cc : entity);
		possible_targets = arraysortclosest(possible_targets, var_2019ec4e.origin);
		for(i = 0; potential_targets.size < 16 && i < possible_targets.size; i++)
		{
			target = possible_targets[i];
			if(entity === target)
			{
				continue;
			}
			if(function_2bc424fd(entity, target) && target.team != entity.team)
			{
				position = (isdefined(target.last_valid_position) ? target.last_valid_position : target.origin);
				potential_targets[potential_targets.size] = possible_targets[i];
				var_8d6705e8[var_8d6705e8.size] = position;
				if(!isdefined(self.var_2d5cbb7[target getentitynumber()]))
				{
					self.var_2d5cbb7[target getentitynumber()] = {#dist:-1, #hash_e29d2657:0};
				}
			}
		}
	}
	if(potential_targets.size <= 0)
	{
		zm_ai_utility::function_4d22f6d1(entity);
		entity.favoriteenemy = undefined;
		return;
	}
	var_5e1a4c24 = -1;
	var_3f11f493 = -1;
	for(i = 0; i < potential_targets.size; i++)
	{
		var_68a2859a = self.var_2d5cbb7[potential_targets[i] getentitynumber()].var_e29d2657;
		if(var_5e1a4c24 == -1 || var_68a2859a < var_3f11f493)
		{
			var_3f11f493 = var_68a2859a;
			var_5e1a4c24 = i;
		}
	}
	var_a50b1e9a = undefined;
	if(var_5e1a4c24 >= 0)
	{
		if(isplayer(potential_targets[var_5e1a4c24]))
		{
			var_9741c29b = function_d0939c67(entity, potential_targets[var_5e1a4c24], 32);
			var_8d6705e8[var_5e1a4c24] = (isdefined(var_9741c29b) ? var_9741c29b : var_8d6705e8[var_5e1a4c24]);
		}
		target_pos = var_8d6705e8[var_5e1a4c24];
		if(distance2dsquared(self.origin, target_pos) > sqr(1000))
		{
			var_2bf8a0d8 = 250000;
			var_df2fb7be = level.var_a82d661a.size - 1;
			while(var_df2fb7be >= 0)
			{
				var_b175b436 = level.var_a82d661a[var_df2fb7be];
				if(distance2dsquared(self.origin, var_b175b436.start_pos) > var_2bf8a0d8)
				{
				}
				else
				{
					if(distance2dsquared(target_pos, var_b175b436.end_pos) > var_2bf8a0d8)
					{
					}
					else
					{
						var_a50b1e9a = var_b175b436.dist;
						break;
					}
				}
				var_df2fb7be = var_df2fb7be - 1;
			}
		}
	}
	if(isdefined(var_a50b1e9a))
	{
		var_674755ca = [];
		for(target_index = 0; target_index < var_8d6705e8.size; target_index++)
		{
			if(var_5e1a4c24 === target_index)
			{
				var_674755ca[var_674755ca.size] = var_a50b1e9a;
				continue;
			}
			var_674755ca[var_674755ca.size] = -2;
		}
	}
	else
	{
		start_point = entity.origin;
		var_b3e12265 = function_9cc082d2(entity.origin, 2 * 39.37008);
		if(isdefined(var_b3e12265[#"point"]))
		{
			start_point = var_b3e12265[#"point"];
		}
		if(var_7c12fa23)
		{
			var_18f8a6c2 = getclosestpointonnavmesh(start_point, 2 * 39.37008, entity getpathfindingradius());
			start_point = (isdefined(var_18f8a6c2) ? var_18f8a6c2 : start_point);
		}
		for(i = 0; i < var_8d6705e8.size; i++)
		{
			target_position = var_8d6705e8[i];
			var_b3e12265 = function_9cc082d2(target_position, 2 * 39.37008);
			if(isdefined(var_b3e12265[#"point"]))
			{
				var_8d6705e8[i] = var_b3e12265[#"point"];
			}
		}
		if(isvec(var_8d6705e8[var_5e1a4c24]) && isplayer(potential_targets[var_5e1a4c24]) && potential_targets[var_5e1a4c24] isinvehicle())
		{
			var_acdc8d71 = getclosestpointonnavmesh(var_8d6705e8[var_5e1a4c24], 200, entity getpathfindingradius());
			var_8d6705e8[var_5e1a4c24] = (isdefined(var_acdc8d71) ? var_acdc8d71 : var_8d6705e8[var_5e1a4c24]);
		}
		var_674755ca = function_5cb65d8a(start_point, var_8d6705e8, entity, undefined, undefined, -1, var_5e1a4c24, 1000);
		if(var_5e1a4c24 >= 0 && var_674755ca[var_5e1a4c24] !== -1 && distance2dsquared(self.origin, var_8d6705e8[var_5e1a4c24]) > sqr(1000))
		{
			var_b50dfc6a = var_674755ca[var_5e1a4c24];
			var_f0d4a55f = {#dist:var_b50dfc6a, #expire_time:gettime() + 5000, #end_pos:var_8d6705e8[var_5e1a4c24], #start_pos:self.origin};
			level.var_a82d661a[level.var_a82d661a.size] = var_f0d4a55f;
		}
	}
	if(!isdefined(var_674755ca))
	{
		return;
	}
	for(i = 0; i < var_674755ca.size; i++)
	{
		target = potential_targets[i];
		if(var_674755ca[i] == -2)
		{
			var_674755ca[i] = self.var_2d5cbb7[target getentitynumber()].dist;
			continue;
		}
		self.var_2d5cbb7[target getentitynumber()].dist = var_674755ca[i];
		self.var_2d5cbb7[target getentitynumber()].var_e29d2657 = gettime();
	}
	var_e3958ef0 = arraycopy(var_674755ca);
	var_8aa6bded = -1;
	closest_target = undefined;
	for(i = 0; i < var_674755ca.size; i++)
	{
		if(var_674755ca[i] != -1)
		{
			if(!isdefined(closest_target) || var_8aa6bded > var_674755ca[i])
			{
				closest_target = potential_targets[i];
				var_8aa6bded = var_674755ca[i];
			}
		}
	}
	if(!isdefined(closest_target))
	{
		zm_ai_utility::function_68ab868a(entity);
		if(isdefined(entity.favoriteenemy) && entity cansee(entity.favoriteenemy))
		{
			entity.favoriteenemy = undefined;
		}
		return;
	}
	if(target_player)
	{
		for(i = 0; i < var_674755ca.size; i++)
		{
			potential_target = potential_targets[i];
			if(isdefined(entity.var_448aebc7[potential_target getentitynumber()]))
			{
				var_ab0d150d = entity.var_448aebc7[potential_target getentitynumber()];
				var_e3958ef0[i] = var_e3958ef0[i] - (sqr(var_ab0d150d * 2));
			}
			if(isdefined(entity.var_29a3768c[potential_target getentitynumber()]))
			{
				var_c19596f0 = entity.var_29a3768c[potential_target getentitynumber()];
				var_e3958ef0[i] = var_e3958ef0[i] - (sqr(var_c19596f0 * 10));
			}
			if(isplayer(potential_target) && potential_target isinvehicle())
			{
				var_e3958ef0[i] = var_e3958ef0[i] + sqr(500);
			}
		}
	}
	var_abdf4916 = 0;
	var_9b606bab = undefined;
	for(i = 0; i < potential_targets.size; i++)
	{
		if(var_674755ca[i] == -1)
		{
			continue;
		}
		if(var_e3958ef0[i] < var_abdf4916 || !isdefined(var_9b606bab))
		{
			var_abdf4916 = var_e3958ef0[i];
			var_9b606bab = potential_targets[i];
		}
	}
	if(isdefined(entity.var_8a3828c6))
	{
		var_e65cda3e = var_674755ca[entity.var_8a3828c6 getentitynumber()];
		if(var_e65cda3e === -1)
		{
			zm_ai_utility::function_68ab868a(entity);
			entity.favoriteenemy = undefined;
			return;
		}
		var_abdf4916 = 0;
		var_9b606bab = entity.var_8a3828c6;
	}
	if(!is_true(entity.var_982e6932))
	{
		if(closest_target == var_9b606bab)
		{
			entity.var_982e6932 = 1;
			entity.var_927ef4c0 = gettime() + 3000;
			entity.var_448aebc7 = undefined;
			entity.var_29a3768c = undefined;
		}
		entity.favoriteenemy = var_9b606bab;
	}
	else
	{
		if(gettime() > entity.var_927ef4c0)
		{
			entity.var_982e6932 = 0;
		}
		entity.favoriteenemy = closest_target;
	}
	in_vehicle = isdefined(entity.favoriteenemy) && isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle();
	var_a3d9315b = 0;
	if(!isdefined(entity.favoriteenemy.last_valid_position) || !isdefined(entity getgroundent()))
	{
		var_a3d9315b = 1;
	}
	var_c547b913 = (isdefined(self.var_737e8510) ? self.var_737e8510 : level.var_376e688);
	if(!var_a3d9315b && (abs(entity.favoriteenemy.last_valid_position[2] - entity.favoriteenemy.origin[2])) < var_c547b913)
	{
		var_b2450377 = getdvarfloat(#"hash_1bb1a9eaa1745b09", 85);
		var_9741c29b = function_d0939c67(entity, entity.favoriteenemy, 32);
		speed = length2d(entity.favoriteenemy getvelocity());
		if(isdefined(var_9741c29b) && distance2dsquared(var_9741c29b, entity.favoriteenemy.origin) < (sqr(var_b2450377 + speed)))
		{
			var_a3d9315b = 1;
		}
		var_b1dcdb65 = getdvarfloat(#"hash_30c908bc9e328183", 100);
		if(var_a3d9315b && distancesquared(var_9741c29b, entity.origin) < sqr(var_b1dcdb65) && (abs(entity.origin[2] - entity.favoriteenemy.origin[2])) > (isdefined(entity.var_737e8510) ? entity.var_737e8510 : 64))
		{
			var_a3d9315b = 0;
		}
	}
	if(in_vehicle)
	{
		var_a3d9315b = 1;
	}
	if(var_a3d9315b)
	{
		zm_ai_utility::function_4d22f6d1(entity);
	}
	else
	{
		zm_ai_utility::function_68ab868a(entity);
	}
	/#
		if(getdvar(#"hash_169a29e17dd1b916", 0) > 0)
		{
			var_edbf2d06 = "";
			for(i = 0; i < potential_targets.size; i++)
			{
				target = potential_targets[i];
				score = var_e3958ef0[i];
				if(isdefined(target))
				{
					color = (var_9b606bab === target ? "" : "");
					var_f24e54b = "";
					if(isdefined(self.var_29a3768c[target getentitynumber()]))
					{
						var_f24e54b = "" + self.var_29a3768c[target getentitynumber()];
					}
					var_edbf2d06 = ((color + "") + target getentitynumber() + "") + score;
				}
				else
				{
					var_edbf2d06 = "";
				}
				record3dtext(var_edbf2d06, entity.origin + (0, 0, 80 - (30 * i)), (1, 1, 1), "", entity, 0.5);
				record3dtext(("" + var_674755ca[i]) + var_f24e54b, entity.origin + (0, 0, 75 - (30 * i)), (1, 1, 1), "", entity, 0.5);
			}
			if(isdefined(entity.var_c2dcab66))
			{
				var_edbf2d06 = "";
				foreach(attacker in entity.var_c2dcab66)
				{
					var_76fc2ac9 = (gettime() - attacker.time) * 0.001;
					if(isdefined(attacker.player) && isdefined(entity.var_448aebc7[attacker.player getentitynumber()]))
					{
						var_edbf2d06 = var_edbf2d06 + (((((("" + attacker.player getentitynumber()) + "") + entity.var_448aebc7[attacker.player getentitynumber()]) + "") + var_76fc2ac9) + "");
					}
				}
				record3dtext(var_edbf2d06, entity.origin + (vectorscale((0, 0, -1), 20)), (1, 1, 1), "", entity, 0.5);
			}
			if(is_true(entity.var_982e6932))
			{
				record3dtext("", entity.origin + (vectorscale((0, 0, -1), 25)), (0, 1, 0), "", entity, 0.5);
			}
		}
	#/
}

/*
	Name: function_4c4ad565
	Namespace: awareness
	Checksum: 0xFC403FF8
	Offset: 0x5748
	Size: 0x1CC
	Parameters: 1
	Flags: Linked
*/
function function_4c4ad565(event)
{
	if(isdefined(event.victim.team) && isdefined(event.attacker) && event.victim.team === self.team)
	{
		var_55015c64 = event.victim getentitynumber();
		var_e7c958b3 = event.attacker getentitynumber();
		/#
			/#
				assert(isdefined(var_55015c64) && isdefined(""));
			#/
			if(getdvar(#"hash_169a29e17dd1b916", 0) > 0)
			{
				recordline(self.origin, event.victim.origin, (0, 0, 0));
				record3dtext(("" + var_55015c64) + "", self.origin - vectorscale((0, 0, 1), 5), (0, 0, 0), "", self, 0.5);
			}
		#/
		if(!isdefined(self.var_b2fdaa21))
		{
			self.var_b2fdaa21 = [];
		}
		array::add(self.var_b2fdaa21, var_55015c64, 0);
		self.var_29a3768c[var_e7c958b3] = self.var_b2fdaa21.size;
	}
}

/*
	Name: function_bc3f5b5a
	Namespace: awareness
	Checksum: 0x2F04C7B8
	Offset: 0x5920
	Size: 0x19C
	Parameters: 2
	Flags: Linked
*/
function function_bc3f5b5a(entity, player)
{
	if(!(isdefined(entity.var_341387d5) && isdefined(entity.var_c37d7f3b)))
	{
		return;
	}
	entity.var_9b8c9c49 = [];
	var_285fa31f = distance2dsquared(entity.origin, entity.var_341387d5);
	if(var_285fa31f < sqr(entity.var_c37d7f3b))
	{
		return;
	}
	var_2c547915 = distance2dsquared(player.origin, entity.var_341387d5);
	if(var_2c547915 > sqr(entity.var_c37d7f3b))
	{
		var_4cef1d5 = distance2dsquared(player.origin, entity.origin);
		if(!entity cansee(player))
		{
			if(!isdefined(entity.var_9b8c9c49))
			{
				entity.var_9b8c9c49 = [];
			}
			else if(!isarray(entity.var_9b8c9c49))
			{
				entity.var_9b8c9c49 = array(entity.var_9b8c9c49);
			}
			entity.var_9b8c9c49[entity.var_9b8c9c49.size] = player;
		}
	}
}

/*
	Name: function_6f1eeb7a
	Namespace: awareness
	Checksum: 0x21C7A6F7
	Offset: 0x5AC8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_6f1eeb7a(entity)
{
	entity.var_9b8c9c49 = [];
}

/*
	Name: function_8ccbffca
	Namespace: awareness
	Checksum: 0xF69A8025
	Offset: 0x5AE8
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_8ccbffca(player)
{
	return isdefined(self.var_9b8c9c49) && isinarray(self.var_9b8c9c49, player);
}

/*
	Name: function_978025e4
	Namespace: awareness
	Checksum: 0x8573F97D
	Offset: 0x5B28
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_978025e4(entity)
{
	entity.awarenesslevelcurrent = "combat";
	function_1db27761(entity, undefined);
	if(!(isdefined(level.var_7d45d0d4.var_3385b421) && isdefined(entity.var_6324ed63)) || entity.var_6324ed63 < gettime() && !flag::get(#"hash_52d6a75cdbf101f3"))
	{
		entity thread function_85bb995c();
	}
	if(isalive(entity.favoriteenemy) && entity.favoriteenemy.team !== level.var_8fc3f1c4)
	{
		entity notify(#"hash_151828d1d5e024ee", {#enemy:entity.favoriteenemy});
	}
	callback::function_d8abfc3d(#"hash_4f3c0b937432f8b0", &function_4c4ad565);
}

/*
	Name: function_d0939c67
	Namespace: awareness
	Checksum: 0x83EC39B5
	Offset: 0x5C80
	Size: 0x1DA
	Parameters: 3
	Flags: Linked
*/
function function_d0939c67(entity, target, min_dist)
{
	lastknownpos = entity lastknownpos(target);
	if(isdefined(lastknownpos))
	{
		if(!isdefined(target.var_125d950b))
		{
			target.var_125d950b = [];
		}
		goal = arraygetclosest(lastknownpos, target.var_125d950b, min_dist);
		if(!isdefined(goal))
		{
			goal = getclosestpointonnavmesh(lastknownpos, 200, entity getpathfindingradius() * 1.2);
			if(isdefined(goal))
			{
				var_616d9e84 = 1;
				if(distancesquared(entity.origin, goal) > sqr(min_dist))
				{
					z_offset = vectorscale((0, 0, 1), 35);
					var_616d9e84 = bullettracepassed(entity.origin + z_offset, goal + z_offset, 0, entity);
				}
				if(!var_616d9e84 || !ispointonnavmesh(goal, entity))
				{
					target.var_125d950b[entity getentitynumber()] = target.last_valid_position;
					return target.last_valid_position;
				}
				target.var_125d950b[entity getentitynumber()] = goal;
			}
		}
		return goal;
	}
}

/*
	Name: function_39da6c3c
	Namespace: awareness
	Checksum: 0xA5F61FDA
	Offset: 0x5E68
	Size: 0x734
	Parameters: 1
	Flags: Linked
*/
function function_39da6c3c(entity)
{
	if(is_true(entity.var_48915943))
	{
		if(!is_true(entity.got_to_entrance))
		{
			function_7c72a5c7(entity);
		}
		if(function_fd83d499(entity))
		{
			return;
		}
	}
	var_bd871069 = !isdefined(entity.enemy_override) && !isdefined(entity.attackable) || isdefined(entity.var_8a3828c6);
	if(is_true(entity.var_1fa24724) && var_bd871069)
	{
		if(!isplayer(entity.enemy) || ((float(gettime() - entity.enemy.var_dbb28b34)) / 1000) > 5 && !is_true(entity.var_921627ad))
		{
			entity.var_6324ed63 = undefined;
		}
		if(isplayer(entity.enemy) && entity.enemy isinvehicle() && distance2dsquared(entity.enemy.origin, entity.origin) > 9000000)
		{
			entity.var_1fa24724 = 0;
		}
		if(entity.archetype === #"zombie")
		{
			entity.keep_moving = 0;
			return;
		}
		goal = getclosestpointonnavmesh(entity.origin, 2 * 39.37008, entity getpathfindingradius() * 1.2);
		if(isdefined(goal))
		{
			entity setgoal(goal);
		}
		else
		{
			entity setgoal(self.origin);
		}
	}
	var_b9dab425 = zm_ai_utility::function_825317c(entity);
	if(var_bd871069 && !function_2bc424fd(entity, var_b9dab425))
	{
		set_state(entity, (isdefined(entity.var_78f5fd91) ? entity.var_78f5fd91 : #"wander"));
		return;
	}
	if(isdefined(entity.var_b238ef38) && isdefined(entity.var_b238ef38.slot.origin) && is_true(entity.var_b238ef38.slot.on_navmesh) && !var_bd871069)
	{
		entity namespace_e292b080::zombieupdategoal(entity.var_b238ef38.slot.origin);
		return;
	}
	if(isdefined(entity.enemy_override) && !var_bd871069)
	{
		var_63d9da82 = entity.enemy_override.origin;
		if(isdefined(entity.enemy_override.var_dfa42180))
		{
			var_63d9da82 = entity.enemy_override [[entity.enemy_override.var_dfa42180]](entity);
		}
		if(isdefined(var_63d9da82))
		{
			entity.var_5aaa7f76 = var_63d9da82;
			goal = getclosestpointonnavmesh(var_63d9da82, 200, entity getpathfindingradius() * 1.2);
		}
		if(isdefined(goal))
		{
			entity namespace_e292b080::zombieupdategoal(goal);
			if(self isatgoal())
			{
				self clearpath();
				entity.keep_moving = 0;
			}
			return;
		}
	}
	if(isdefined(entity.favoriteenemy))
	{
		goal = undefined;
		if(isdefined(level.var_ff87f555))
		{
			goal = [[level.var_ff87f555]]();
		}
		if(!isdefined(goal))
		{
			if(isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle())
			{
				goal = namespace_85745671::function_401070dd();
				if(isvec(goal))
				{
					goal = getclosestpointonnavmesh(goal, 200, entity getpathfindingradius() * 1.2);
				}
			}
			else
			{
				goal = function_d0939c67(entity, entity.favoriteenemy, 32);
			}
		}
		if(isdefined(goal))
		{
			if(getdvarint(#"hash_6fcfffa58806f673", 1) && !is_true(entity.var_1fa24724))
			{
				entity namespace_e292b080::zombieupdategoal(goal);
			}
			else if(entity.archetype !== #"zombie")
			{
				entity.keep_moving = 0;
				entity setgoal(goal);
			}
		}
	}
	else
	{
		goal = getclosestpointonnavmesh(entity.origin, 200, entity getpathfindingradius() * 1.2);
		if(isdefined(goal))
		{
			entity setgoal(goal);
		}
		else
		{
			entity setgoal(self.origin);
		}
	}
}

/*
	Name: function_b9f81e8b
	Namespace: awareness
	Checksum: 0x762649AC
	Offset: 0x65A8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_b9f81e8b(entity)
{
	zm_ai_utility::function_4d22f6d1(entity);
	function_6f1eeb7a(entity);
	callback::function_52ac9652(#"hash_4f3c0b937432f8b0", &function_4c4ad565);
}

/*
	Name: function_85bb995c
	Namespace: awareness
	Checksum: 0xD5856EBD
	Offset: 0x6620
	Size: 0xD0
	Parameters: 0
	Flags: Linked
*/
function function_85bb995c()
{
	self endon(#"death", #"state_changed");
	while(true)
	{
		wait(1);
		if(!isdefined(self.enemy))
		{
			continue;
		}
		if(isdefined(level.var_7d45d0d4.var_3385b421) && isdefined(self.var_6324ed63) && self.var_6324ed63 > gettime())
		{
			break;
		}
		if(self flag::get(#"hash_52d6a75cdbf101f3"))
		{
			break;
		}
		self generateradioevent("radio_event_high", 800);
	}
}

/*
	Name: function_7c72a5c7
	Namespace: awareness
	Checksum: 0xE8E9897D
	Offset: 0x66F8
	Size: 0x2F6
	Parameters: 1
	Flags: Linked
*/
function function_7c72a5c7(entity)
{
	entity.var_c5a69ef5 = entity.var_26088aea === entity.var_a5add0c0;
	entity.var_26088aea = entity.var_a5add0c0;
	if(isdefined(entity.var_a5add0c0))
	{
		blocker = entity.var_a5add0c0.traversal_blocker;
		if(isdefined(blocker.targetname) && blocker.targetname === "barricade_window")
		{
			entity.first_node = blocker;
			entity.traversal_blocker = blocker;
			entity.barrier_align = blocker.barrier_align;
			if(!is_true(entity.var_ffc6fe22))
			{
				entity.var_ffc6fe22 = 1;
				callback::function_d8abfc3d(#"hash_34b65342cbfdadac", &zm_behavior::function_a26fcba);
			}
			if(!entity.var_c5a69ef5)
			{
				entity zombie_utility::reset_attack_spot();
				entity.at_entrance_tear_spot = 0;
				/#
					if(getdvarint(#"hash_2f078c2224f40586", 0) && isdefined(entity.first_node.zbarrier))
					{
						record3dtext("" + entity.first_node.zbarrier getentnum(), entity.origin + vectorscale((0, 0, 1), 2), (1, 0, 0), "", entity);
					}
				#/
			}
			/#
				if(getdvarint(#"hash_2f078c2224f40586", 0) && isdefined(entity.first_node.zbarrier))
				{
					record3dtext("" + entity.first_node.zbarrier getentnum(), entity.origin + vectorscale((0, 0, 1), 7), (1, 0.5, 0), "", entity);
				}
			#/
		}
	}
	else if(!entity.var_c5a69ef5)
	{
		entity.first_node = undefined;
		entity.barrier_align = undefined;
		entity zombie_utility::reset_attack_spot();
		entity.at_entrance_tear_spot = 0;
		entity.got_to_entrance = 0;
		entity.var_4fe4e626 = 1;
	}
}

/*
	Name: function_fd83d499
	Namespace: awareness
	Checksum: 0x4EC7855B
	Offset: 0x69F8
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function function_fd83d499(entity)
{
	if(zm_behavior::function_b86a1b9d(entity))
	{
		if(distancesquared(entity.first_node.origin, entity.origin) < 22801)
		{
			if(!is_true(entity.got_to_entrance))
			{
				var_1f2328d0 = entity function_4794d6a3();
				entity.var_67ab7d45 = (isdefined(var_1f2328d0.overridegoalpos) ? var_1f2328d0.overridegoalpos : var_1f2328d0.goalpos);
			}
			entity.var_1033fa72 = undefined;
			entity.got_to_entrance = 1;
			/#
				if(getdvarint(#"hash_2f078c2224f40586", 0))
				{
					record3dtext("" + entity.first_node.zbarrier getentnum(), entity.origin + vectorscale((0, 0, 1), 2), (1, 0.5, 0), "", entity);
					line(entity.origin, entity.first_node.origin, (0.1, 0.9, 0));
				}
			#/
			return true;
		}
	}
	return false;
}

/*
	Name: function_b6aca908
	Namespace: awareness
	Checksum: 0x3F341761
	Offset: 0x6BC0
	Size: 0xE4
	Parameters: 1
	Flags: None
*/
function function_b6aca908(entity)
{
	if(self.current_state.name === #"chase" || self.current_state.name === #"investigate")
	{
		self.var_2772a472 = 1;
	}
	self.var_9f6112bb = 1;
	entity.awarenesslevelcurrent = "unaware";
	if(!isdefined(entity.var_6324ed63) || gettime() >= entity.var_6324ed63)
	{
		entity.favoriteenemy = undefined;
	}
	entity.var_eb5eeb0f = [];
	entity callback::function_d8abfc3d(#"awareness_event", &function_cf2fab43);
}

/*
	Name: function_a4076709
	Namespace: awareness
	Checksum: 0x1120845
	Offset: 0x6CB0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_a4076709(entity)
{
	function_4ebe4a6d(entity);
}

/*
	Name: function_8d21ac75
	Namespace: awareness
	Checksum: 0x502A2D28
	Offset: 0x6CE0
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function function_8d21ac75(entity)
{
	entity callback::function_52ac9652(#"awareness_event", &function_cf2fab43);
}

/*
	Name: function_dfe1997a
	Namespace: awareness
	Checksum: 0xD74D7AF2
	Offset: 0x6D28
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private function_dfe1997a()
{
	/#
		util::waittill_can_add_debug_command();
		mapname = util::get_map_name();
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
	#/
}

/*
	Name: function_66c2ca1e
	Namespace: awareness
	Checksum: 0xF1187DED
	Offset: 0x6DB8
	Size: 0x82
	Parameters: 1
	Flags: Private
*/
function private function_66c2ca1e(type)
{
	/#
		switch(type)
		{
			case 0:
			{
				return "";
			}
			case 1:
			{
				return "";
			}
			case 3:
			{
				return "";
			}
			case 2:
			{
				return "";
			}
		}
	#/
}

/*
	Name: function_fbae6630
	Namespace: awareness
	Checksum: 0x310C5A3B
	Offset: 0x6E48
	Size: 0x144
	Parameters: 1
	Flags: Private
*/
function private function_fbae6630(awareness_event)
{
	/#
		duration = (isdefined(awareness_event.params.var_74bdb7f8) ? awareness_event.params.var_74bdb7f8 : int(10 / (float(function_60d95f53()) / 1000)));
		color = (isdefined(awareness_event.params.var_f71eb7fe) ? awareness_event.params.var_f71eb7fe : (0, 1, 0));
		circle(awareness_event.position, awareness_event.radius, color, 0, 1, duration);
		print3d(awareness_event.position, function_66c2ca1e(awareness_event.type), color, 1, 0.5, duration, 1);
	#/
}

/*
	Name: function_c6b1009e
	Namespace: awareness
	Checksum: 0x36E52C8B
	Offset: 0x6F98
	Size: 0x13A
	Parameters: 0
	Flags: Linked
*/
function function_c6b1009e()
{
	self notify(#"sndawarenesschange");
	self endon(#"death");
	self endon(#"sndawarenesschange");
	wait(0.2);
	switch(self.current_state.name)
	{
		case "wander":
		{
			self clientfield::set("sndAwarenessChange", 1);
			break;
		}
		case "investigate":
		{
			self clientfield::set("sndAwarenessChange", 2);
			break;
		}
		case "chase":
		{
			self clientfield::set("sndAwarenessChange", 3);
			break;
		}
		default:
		{
			self clientfield::set("sndAwarenessChange", 1);
			break;
		}
	}
}

