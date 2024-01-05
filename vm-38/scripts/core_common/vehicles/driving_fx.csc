#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace driving_fx;

/*
	Name: function_90a4c480
	Namespace: driving_fx
	Checksum: 0xB78E0540
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_90a4c480()
{
	level notify(-1232679227);
}

/*
	Name: function_ca9b286c
	Namespace: driving_fx
	Checksum: 0x6E64FC67
	Offset: 0x178
	Size: 0x6C
	Parameters: 1
	Flags: Event
*/
event function_ca9b286c(eventstruct)
{
	if(!isplayer(self))
	{
		return;
	}
	vehicle = eventstruct.vehicle;
	localclientnum = eventstruct.localclientnum;
	self thread vehicle_enter(localclientnum, vehicle);
}

/*
	Name: vehicle_enter
	Namespace: driving_fx
	Checksum: 0xAE101D49
	Offset: 0x1F0
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function vehicle_enter(localclientnum, vehicle)
{
	self endon(#"death");
	vehicle endon(#"death");
	waitframe(1);
	if(vehicle isvehicle() && vehicle function_973c841f(self))
	{
		vehicle thread collision_thread(localclientnum);
		vehicle thread vehicle::boost_think(localclientnum);
		if(vehicle function_b835102b())
		{
			vehicle thread jump_landing_thread(localclientnum);
			vehicle thread suspension_thread(localclientnum);
		}
		if(self function_21c0fa55())
		{
			vehicle thread function_d79b3148(localclientnum, self);
			vehicle thread vehicle::lights_group_toggle(localclientnum, 1, 0);
		}
	}
}

/*
	Name: collision_thread
	Namespace: driving_fx
	Checksum: 0x514F1AEF
	Offset: 0x338
	Size: 0x3F8
	Parameters: 1
	Flags: Linked
*/
function collision_thread(localclientnum)
{
	self endon(#"death");
	self endon(#"exit_vehicle");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_collision");
		hip = waitresult.velocity;
		hitn = waitresult.normal;
		hit_intensity = waitresult.intensity;
		player = function_5c10bd79(localclientnum);
		if(isdefined(self.driving_fx_collision_override))
		{
			if(player function_21c0fa55() && self function_973c841f(player))
			{
				self [[self.driving_fx_collision_override]](localclientnum, player, hip, hitn, hit_intensity);
			}
		}
		else if(isdefined(player) && isdefined(hit_intensity))
		{
			if(hit_intensity > self.heavycollisionspeed)
			{
				volume = get_impact_vol_from_speed();
				var_be2370d6 = self.var_be2370d6;
				if(isdefined(var_be2370d6))
				{
					alias = var_be2370d6;
				}
				else
				{
					alias = "veh_default_suspension_lg_hd";
				}
				self playsound(localclientnum, alias, undefined, volume);
				/#
					if(getdvarint(#"hash_1ea6228199536d7e", 0) == 1)
					{
						debug2dtext(vectorscale((0, 1, 0), 100), ((function_9e72a96(alias) + "") + volume) + "", undefined, undefined, (0, 0, 0), 1, 3, 16);
					}
				#/
				if(isdefined(self.heavycollisionrumble) && player function_21c0fa55() && self function_973c841f(player))
				{
					player playrumbleonentity(localclientnum, self.heavycollisionrumble);
				}
			}
			else if(hit_intensity > self.lightcollisionspeed)
			{
				volume = get_impact_vol_from_speed();
				var_b3195e3c = self.var_b3195e3c;
				if(isdefined(var_b3195e3c))
				{
					alias = var_b3195e3c;
				}
				else
				{
					alias = "veh_default_suspension_lg_lt";
				}
				self playsound(localclientnum, alias, undefined, volume);
				/#
					if(getdvarint(#"hash_1ea6228199536d7e", 0) == 1)
					{
						debug2dtext(vectorscale((0, 1, 0), 200), ((function_9e72a96(alias) + "") + volume) + "", undefined, undefined, (0, 0, 0), 1, 3, 16);
					}
				#/
				if(isdefined(self.lightcollisionrumble) && player function_21c0fa55() && self function_973c841f(player))
				{
					player playrumbleonentity(localclientnum, self.lightcollisionrumble);
				}
			}
		}
	}
}

/*
	Name: jump_landing_thread
	Namespace: driving_fx
	Checksum: 0xFFDDBBBC
	Offset: 0x738
	Size: 0x1F0
	Parameters: 1
	Flags: Linked
*/
function jump_landing_thread(localclientnum)
{
	self endon(#"death");
	self endon(#"exit_vehicle");
	while(true)
	{
		self waittill(#"veh_landed");
		player = function_5c10bd79(localclientnum);
		if(isdefined(player))
		{
			if(isdefined(self.driving_fx_jump_landing_override))
			{
				self [[self.driving_fx_jump_landing_override]](localclientnum, player);
			}
			else
			{
				volume = get_impact_vol_from_speed();
				var_be2370d6 = self.var_be2370d6;
				if(isdefined(var_be2370d6))
				{
					alias = var_be2370d6;
				}
				else
				{
					alias = "veh_default_suspension_lg_hd";
				}
				self playsound(localclientnum, alias, undefined, volume);
				/#
					if(getdvarint(#"hash_1ea6228199536d7e", 0) == 1)
					{
						debug2dtext((0, 0, 0), ((function_9e72a96(alias) + "") + volume) + "", undefined, undefined, (0, 0, 0), 1, 3, 16);
					}
				#/
				if(isdefined(self.jumplandingrumble) && player function_21c0fa55() && self function_973c841f(player))
				{
					player playrumbleonentity(localclientnum, self.jumplandingrumble);
				}
			}
		}
	}
}

/*
	Name: suspension_thread
	Namespace: driving_fx
	Checksum: 0x7A694CBE
	Offset: 0x930
	Size: 0x1C8
	Parameters: 1
	Flags: Linked
*/
function suspension_thread(localclientnum)
{
	self endon(#"death");
	self endon(#"exit_vehicle");
	while(true)
	{
		self waittill(#"veh_suspension_limit_activated");
		player = function_5c10bd79(localclientnum);
		if(isdefined(player))
		{
			volume = get_impact_vol_from_speed();
			var_be2370d6 = self.var_be2370d6;
			if(isdefined(var_be2370d6))
			{
				alias = var_be2370d6;
			}
			else
			{
				alias = "veh_default_suspension_lg_hd";
			}
			self playsound(localclientnum, alias, undefined, volume);
			/#
				if(getdvarint(#"hash_1ea6228199536d7e", 0) == 1)
				{
					debug2dtext(vectorscale((0, 1, 0), 300), ((function_9e72a96(alias) + "") + volume) + "", undefined, undefined, (0, 0, 0), 1, 3, 16);
				}
			#/
			if(player function_21c0fa55() && self function_973c841f(player))
			{
				player playrumbleonentity(localclientnum, "damage_light");
			}
		}
	}
}

/*
	Name: get_impact_vol_from_speed
	Namespace: driving_fx
	Checksum: 0x84885732
	Offset: 0xB00
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function get_impact_vol_from_speed()
{
	curspeed = self getspeed();
	maxspeed = self getmaxspeed();
	volume = audio::scale_speed(0, maxspeed, 0, 1, curspeed);
	volume = (volume * volume) * volume;
	return volume;
}

/*
	Name: function_b6f1b2f1
	Namespace: driving_fx
	Checksum: 0x57B340BF
	Offset: 0xB90
	Size: 0x240
	Parameters: 0
	Flags: Linked
*/
function function_b6f1b2f1()
{
	var_9687e67e = array("front_right", "front_left", "middle_right", "middle_left", "back_right", "back_left");
	surfaces = [];
	foreach(var_2ada890e in var_9687e67e)
	{
		if(self function_387f3e55(var_2ada890e))
		{
			if(!isdefined(surfaces))
			{
				surfaces = [];
			}
			else if(!isarray(surfaces))
			{
				surfaces = array(surfaces);
			}
			if(!isinarray(surfaces, function_73e08cca("water")))
			{
				surfaces[surfaces.size] = function_73e08cca("water");
			}
		}
		if(!isdefined(surfaces))
		{
			surfaces = [];
		}
		else if(!isarray(surfaces))
		{
			surfaces = array(surfaces);
		}
		if(!isinarray(surfaces, function_73e08cca(self getwheelsurface(var_2ada890e))))
		{
			surfaces[surfaces.size] = function_73e08cca(self getwheelsurface(var_2ada890e));
		}
	}
	arrayremovevalue(surfaces, undefined);
	return surfaces;
}

/*
	Name: function_73e08cca
	Namespace: driving_fx
	Checksum: 0xF181210D
	Offset: 0xDD8
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_73e08cca(surface)
{
	switch(surface)
	{
		case "dirt":
		{
			return #"hash_69a53e8913317ecf";
		}
		case "water":
		case "watershallow":
		{
			return #"hash_7c5d3ac35353f95c";
		}
	}
	return undefined;
}

/*
	Name: stop_postfx_on_exit
	Namespace: driving_fx
	Checksum: 0x387A86AA
	Offset: 0xE50
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function stop_postfx_on_exit(var_89ae88b4)
{
	self notify("stop_postfx_on_exit_" + var_89ae88b4);
	self endon("stop_postfx_on_exit_" + var_89ae88b4);
	self waittill(#"exit_vehicle", #"death");
	if(isdefined(self) && isdefined(self.var_8e45c356) && isdefined(self.var_8e45c356[var_89ae88b4]) && self postfx::function_556665f2(var_89ae88b4))
	{
		self postfx::stoppostfxbundle(var_89ae88b4);
		self.var_8e45c356[var_89ae88b4].exiting = 1;
	}
}

/*
	Name: function_ace6c248
	Namespace: driving_fx
	Checksum: 0xB695C515
	Offset: 0xF28
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_ace6c248(var_89ae88b4)
{
	if(!isdefined(self.var_8e45c356))
	{
		self.var_8e45c356 = [];
	}
	if(!isdefined(self.var_8e45c356[var_89ae88b4]))
	{
		self.var_8e45c356[var_89ae88b4] = {#endtime:0, #exiting:1};
	}
	if(self.var_8e45c356[var_89ae88b4].exiting && !self postfx::function_556665f2(var_89ae88b4))
	{
		self postfx::playpostfxbundle(var_89ae88b4);
		self thread stop_postfx_on_exit(var_89ae88b4);
		self.var_8e45c356[var_89ae88b4].exiting = 0;
	}
	self.var_8e45c356[var_89ae88b4].endtime = gettime() + 1000;
}

/*
	Name: function_dc263531
	Namespace: driving_fx
	Checksum: 0x103F831F
	Offset: 0x1040
	Size: 0x112
	Parameters: 2
	Flags: Linked
*/
function function_dc263531(var_fd4bffcb, forcestop)
{
	if(!isdefined(self.var_8e45c356))
	{
		self.var_8e45c356 = [];
	}
	foreach(key, postfx in self.var_8e45c356)
	{
		if(postfx.exiting)
		{
			continue;
		}
		if(forcestop || (postfx.endtime <= gettime() && !isinarray(var_fd4bffcb, key)))
		{
			self postfx::exitpostfxbundle(key);
			self.var_8e45c356[key].exiting = 1;
		}
	}
}

/*
	Name: function_d79b3148
	Namespace: driving_fx
	Checksum: 0xF780B78E
	Offset: 0x1160
	Size: 0x268
	Parameters: 2
	Flags: Linked
*/
function function_d79b3148(localclientnum, driver)
{
	self notify("72f19083713b1cac");
	self endon("72f19083713b1cac");
	self endon(#"death", #"exit_vehicle");
	if(!self isvehicle() || is_true(self.var_da04aa74))
	{
		return;
	}
	while(true)
	{
		wait(0.1);
		speed = self getspeed();
		player = function_5c10bd79(localclientnum);
		if(isdefined(self.var_c6a9216))
		{
			var_89ae88b4 = self [[self.var_c6a9216]](localclientnum, driver);
		}
		else
		{
			var_89ae88b4 = self function_b6f1b2f1();
		}
		var_9dc6e5f2 = 1;
		if(isdefined(self.var_917cf8e3))
		{
			var_9dc6e5f2 = self [[self.var_917cf8e3]](localclientnum, driver);
		}
		if(isdefined(self.var_41860110))
		{
			var_9979f775 = self [[self.var_41860110]](localclientnum, driver);
		}
		else
		{
			var_9979f775 = speed > 200;
		}
		if(isdefined(player))
		{
			if(var_9979f775 && var_9dc6e5f2)
			{
				foreach(postfx_bundle in var_89ae88b4)
				{
					player function_ace6c248(postfx_bundle);
				}
			}
			player function_dc263531(var_89ae88b4, !var_9979f775 || !var_9dc6e5f2);
		}
	}
}

