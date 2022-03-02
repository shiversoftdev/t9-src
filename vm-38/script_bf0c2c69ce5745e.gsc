#using script_340a2e805e35f7a2;
#using script_471b31bd963b388e;
#using script_75da5547b1822294;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_8f74625a;

/*
	Name: function_ea3e1d32
	Namespace: namespace_8f74625a
	Checksum: 0x5EDD4AFD
	Offset: 0x588
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ea3e1d32()
{
	level notify(218316906);
}

/*
	Name: function_89f2df9
	Namespace: namespace_8f74625a
	Checksum: 0x3C51522E
	Offset: 0x5A8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_c70352f852fda84", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_8f74625a
	Checksum: 0x3C6CF1A2
	Offset: 0x5F8
	Size: 0x134
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_ad5a0cd6::use_item_spawns() || util::function_5df4294() === #"zsurvival")
	{
		return;
	}
	level.var_a5f063d = [];
	level.var_3f771530 = [];
	/#
		level thread function_44b9dd1d();
	#/
	clientfield::register("scriptmover", "supply_drop_fx", 1, 1, "int");
	clientfield::register("scriptmover", "supply_drop_parachute_rob", 1, 1, "int");
	clientfield::register("scriptmover", "supply_drop_portal_fx", 1, 1, "int");
	clientfield::register("vehicle", "supply_drop_vehicle_landed", 1, 1, "counter");
}

/*
	Name: function_eaba72c9
	Namespace: namespace_8f74625a
	Checksum: 0x87FAA490
	Offset: 0x738
	Size: 0x3C6
	Parameters: 0
	Flags: Private
*/
function private function_eaba72c9()
{
	/#
		while(true)
		{
			if(getdvarint(#"hash_7364440898cf4b76", 0) > 0)
			{
				switch(getdvarint(#"hash_7364440898cf4b76", 0))
				{
					case 1:
					{
						level thread function_418e26fe();
						break;
					}
					case 2:
					{
						vehicletypes = array(#"hash_28d512b739c9d9c1");
						level thread function_418e26fe(undefined, 1, 1, 0, 1, vehicletypes[randomint(vehicletypes.size)]);
						break;
					}
				}
				setdvar(#"hash_7364440898cf4b76", 0);
			}
			if(getdvarint(#"hash_41d51e6f2ca1b9b1", 0) > 0)
			{
				switch(getdvarint(#"hash_41d51e6f2ca1b9b1", 0))
				{
					case 1:
					{
						level thread function_7d4a448f();
						break;
					}
				}
				setdvar(#"hash_41d51e6f2ca1b9b1", 0);
			}
			if(getdvarint(#"hash_5dc24c61c66f6fee", 0) > 0)
			{
				function_a88ee653();
			}
			if(getdvarint(#"hash_40d4ca5923d72b3d", 0) > 0)
			{
				players = getplayers();
				if(isdefined(players[0]))
				{
					switch(getdvarint(#"hash_40d4ca5923d72b3d", 0))
					{
						case 1:
						{
							level thread function_1b48df6d(players[0].origin);
							break;
						}
						case 2:
						{
							level thread function_1b48df6d(players[0].origin, 1, undefined, undefined, #"hash_27bac84003da7795");
							break;
						}
						case 3:
						{
							vehicletypes = array(#"hash_28d512b739c9d9c1");
							level thread function_1b48df6d(players[0].origin, 1, 1, vehicletypes[randomint(vehicletypes.size)]);
							break;
						}
					}
				}
				setdvar(#"hash_40d4ca5923d72b3d", 0);
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_44b9dd1d
	Namespace: namespace_8f74625a
	Checksum: 0x8B69B54E
	Offset: 0xB08
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_44b9dd1d()
{
	/#
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		mapname = util::function_53bbf9d2();
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		adddebugcommand(("" + mapname) + "");
		level thread function_eaba72c9();
	#/
}

/*
	Name: function_a88ee653
	Namespace: namespace_8f74625a
	Checksum: 0x33681D5C
	Offset: 0xC88
	Size: 0x45C
	Parameters: 0
	Flags: Private
*/
function private function_a88ee653()
{
	/#
		if(isdefined(level.var_b2513722))
		{
			var_52b56362 = (isdefined(level.var_52b56362) ? level.var_52b56362 : 0);
			deathcircle = level.var_fb91af8[var_52b56362];
			var_448914c2 = (isdefined(level.var_fb91af8[var_52b56362 + 1]) ? level.var_fb91af8[var_52b56362 + 1] : deathcircle);
			height = var_448914c2.origin[2];
			radius = 200;
			sphere(level.var_d1c35a7a, radius, (1, 0, 0));
			sphere(level.var_ebe9f3de, radius, (1, 0, 0));
			if(isdefined(level.var_1b269b78))
			{
				sphere(level.var_1b269b78, radius, (0, 1, 0));
				var_58d00116 = (level.var_1b269b78[0], level.var_1b269b78[1], height);
				line(level.var_1b269b78, var_58d00116, (0, 1, 0));
				sphere(var_58d00116, radius, (0, 1, 0));
			}
			if(isdefined(level.var_538928e3))
			{
				sphere(level.var_538928e3, radius, (0, 1, 0));
				var_fb4d4118 = (level.var_538928e3[0], level.var_538928e3[1], height);
				line(level.var_538928e3, var_fb4d4118, (0, 1, 0));
				sphere(var_fb4d4118, radius, (0, 1, 0));
			}
			sphere(level.var_daa6e3f, radius, (1, 0.5, 0));
			for(index = 1; index < level.var_57e06aea.size; index++)
			{
				line(level.var_57e06aea[index - 1], level.var_57e06aea[index], (1, 0, 0));
			}
			if(isdefined(level.var_ae7f6100) && isdefined(level.var_3e5e898c))
			{
				var_d54803e = level.var_3e5e898c;
				var_9c1af46d = (level.var_3e5e898c[0], level.var_ae7f6100[1], level.var_ae7f6100[2]);
				var_c46271bf = (level.var_ae7f6100[0], level.var_3e5e898c[1], level.var_3e5e898c[2]);
				var_99a8be82 = level.var_ae7f6100;
				line(var_d54803e, var_9c1af46d, (1, 1, 1));
				line(var_d54803e, var_c46271bf, (1, 1, 1));
				line(var_99a8be82, var_9c1af46d, (1, 1, 1));
				line(var_99a8be82, var_c46271bf, (1, 1, 1));
				sphere(var_d54803e, radius, (1, 1, 1));
				sphere(var_c46271bf, radius, (1, 1, 1));
				sphere(var_9c1af46d, radius, (1, 1, 1));
				sphere(var_99a8be82, radius, (1, 1, 1));
			}
		}
	#/
}

/*
	Name: function_c7bd0aa8
	Namespace: namespace_8f74625a
	Checksum: 0x4DF78F65
	Offset: 0x10F0
	Size: 0x424
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c7bd0aa8(point, startpoint)
{
	/#
		assert(isvec(point));
	#/
	/#
		assert(isvec(startpoint));
	#/
	if(function_16bbdd8b(point))
	{
		return point;
	}
	/#
		assert(function_16bbdd8b(startpoint));
	#/
	if(territory::function_c0de0601())
	{
		var_bb96e272 = vectornormalize(startpoint - point);
		pathlength = distance2d(startpoint, point);
		var_28021cac = int(pathlength / 1000);
		for(var_c742cad6 = 1; var_c742cad6 <= var_28021cac; var_c742cad6++)
		{
			newpoint = startpoint + ((var_bb96e272 * 1000) * var_c742cad6);
			if(function_16bbdd8b(newpoint))
			{
				return newpoint;
			}
		}
		return point;
	}
	min = level.var_3e5e898c;
	max = level.var_ae7f6100;
	var_1ccbeeaa = (point[0], point[1], 0);
	var_49e5fac9 = (startpoint[0], startpoint[1], 0);
	if(var_1ccbeeaa[0] < min[0])
	{
		var_dd00b78e = vectornormalize(var_1ccbeeaa - var_49e5fac9);
		/#
			assert(var_dd00b78e[0] != 0);
		#/
		t = (min[0] - var_49e5fac9[0]) / var_dd00b78e[0];
		var_1ccbeeaa = var_49e5fac9 + (var_dd00b78e * t);
	}
	else if(var_1ccbeeaa[0] > max[0])
	{
		var_dd00b78e = vectornormalize(var_1ccbeeaa - var_49e5fac9);
		/#
			assert(var_dd00b78e[0] != 0);
		#/
		t = (max[0] - var_49e5fac9[0]) / var_dd00b78e[0];
		var_1ccbeeaa = var_49e5fac9 + (var_dd00b78e * t);
	}
	if(var_1ccbeeaa[1] < min[1])
	{
		var_dd00b78e = vectornormalize(var_1ccbeeaa - var_49e5fac9);
		/#
			assert(var_dd00b78e[1] != 0);
		#/
		t = (min[1] - var_49e5fac9[1]) / var_dd00b78e[1];
		var_1ccbeeaa = var_49e5fac9 + (var_dd00b78e * t);
	}
	else if(var_1ccbeeaa[1] > max[1])
	{
		var_dd00b78e = vectornormalize(var_1ccbeeaa - var_49e5fac9);
		/#
			assert(var_dd00b78e[1] != 0);
		#/
		t = (max[1] - var_49e5fac9[1]) / var_dd00b78e[1];
		var_1ccbeeaa = var_49e5fac9 + (var_dd00b78e * t);
	}
	point = (var_1ccbeeaa[0], var_1ccbeeaa[1], point[2]);
	return point;
}

/*
	Name: function_9ae8f99e
	Namespace: namespace_8f74625a
	Checksum: 0x4C61F502
	Offset: 0x1520
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9ae8f99e()
{
	self endon(#"death");
	self waittill(#"veh_landed");
	clientfield::increment("supply_drop_vehicle_landed");
}

/*
	Name: function_13339b58
	Namespace: namespace_8f74625a
	Checksum: 0xC8382579
	Offset: 0x1570
	Size: 0x4DC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_13339b58(supplydrop, var_d91c179d, index)
{
	self endon(#"death");
	var_13781019 = array(#"hash_51dcbe21849d4df0");
	var_b91c8539 = array(#"hash_58b756555570c169");
	var_1a8acc15 = array(#"hash_6a42d559c2d990df");
	if(isdefined(var_d91c179d))
	{
		switch(var_d91c179d.vehicletype)
		{
			case "hash_46d0326fb76bfd27":
			{
				var_13781019 = array(#"hash_43e87a7d1f494a6e", #"hash_aa76ca9894b87b", #"hash_19296420b7b82e4", #"hash_af5b730d0f9b749");
				var_b91c8539 = array(#"hash_44a6ed2c48d1a597", #"hash_2230d366d30fca2c", #"hash_126bd9e565a0db35", #"hash_4e468b786b07a70a");
				var_1a8acc15 = array(#"hash_5f67889cb298ce95", #"hash_652fc868ed16b8b4", #"hash_1211c06c537d210b", #"hash_2a57c0307d341062");
				break;
			}
			default:
			{
				var_13781019 = array(#"hash_6481b506b1de6549", #"hash_37143952d1dbe3e8", #"hash_3d3b8beecf975e2f", #"hash_1d747853002df86e");
				var_b91c8539 = array(#"hash_1a22dfd4c582f10a", #"hash_6b21d5f85a66a061", #"hash_68385a0b5c4f0788", #"hash_10834188a34cef97");
				var_1a8acc15 = array(#"hash_3e3be065e18be62", #"hash_49edbe5ac4e375c7", #"hash_2362c027dd6f5060", #"hash_38f38672937d7c95");
				break;
			}
		}
	}
	self animscripted("parachute_open", supplydrop.origin, supplydrop.angles, var_13781019[index], "normal", "root", 1, 0);
	self waittill(#"parachute_open");
	if(!is_true(self.var_b702030d))
	{
		self animscripted("parachute_idle", supplydrop.origin, supplydrop.angles, var_b91c8539[index], "normal", "root", 1, 0);
	}
	self flag::wait_till("parachute_close");
	self unlink();
	self animscripted("parachute_closed", self.origin, self.angles, var_1a8acc15[index], "normal", "root", 1, 0);
	animlength = getanimlength("parachute_closed");
	wait(animlength * 0.35);
	if(isdefined(var_d91c179d))
	{
		self setmodel("p9_fxanim_wz_parachute_supplydrop_veh_fade");
	}
	else
	{
		self setmodel("p9_fxanim_wz_parachute_supplydrop_01_fade");
	}
	self clientfield::set("supply_drop_parachute_rob", 0);
	wait(animlength * 0.65);
	self delete();
}

/*
	Name: function_71c31c8d
	Namespace: namespace_8f74625a
	Checksum: 0x83A6EB9
	Offset: 0x1A58
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_71c31c8d()
{
	self notify(#"hash_6ade3db3c3188274");
	if(isdefined(self))
	{
		self.var_7bea4af0 = 1;
	}
}

/*
	Name: function_500a6615
	Namespace: namespace_8f74625a
	Checksum: 0xE50AF8DE
	Offset: 0x1A90
	Size: 0x76C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_500a6615(itemspawnlist, var_93fe96a6, s_instance)
{
	if(!isdefined(itemspawnlist))
	{
		itemspawnlist = #"hash_77212104c58adc03";
	}
	if(!isdefined(var_93fe96a6))
	{
		var_93fe96a6 = 0;
	}
	if(isdefined(self.supplydrop))
	{
		supplydrop = self.supplydrop;
		self.supplydrop = undefined;
		if(isdefined(self.harness))
		{
			var_6d9635e7 = #"hash_3ce4bc719a3ea6b";
			var_36ff1928 = #"hash_7e54508e8fa9ef96";
			if(isdefined(supplydrop.var_d5552131))
			{
				switch(supplydrop.var_d5552131.vehicletype)
				{
					case "hash_46d0326fb76bfd27":
					{
						var_6d9635e7 = #"hash_3791502c5d089d79";
						var_36ff1928 = #"hash_5e21433684751cdc";
						break;
					}
					default:
					{
						var_6d9635e7 = #"hash_66caa605c0a985bc";
						var_36ff1928 = #"hash_382ac153f17ffc5b";
						break;
					}
				}
			}
			self.harness animscripted("harness_stop", self.origin, self.angles, var_6d9635e7, "normal", "root", 1, 0);
			animlength = getanimlength(#"hash_3ce4bc719a3ea6b");
			wait(animlength);
			if(isdefined(self.harness))
			{
				self.harness animscripted("harness_retract", self.origin, self.angles, var_36ff1928, "normal", "root", 1, 0);
			}
		}
		supplydrop.var_b2513722 = undefined;
		if(isdefined(supplydrop.var_d5552131))
		{
			supplydrop.var_d5552131.var_b2513722 = undefined;
		}
		supplydrop endon(#"death");
		supplydrop unlink();
		supplydrop show();
		supplydrop.angles = (0, supplydrop.angles[1], 0);
		startpoint = (supplydrop.origin[0], supplydrop.origin[1], min(32000, supplydrop.origin[2] - 200));
		endpoint = (supplydrop.origin[0], supplydrop.origin[1], -32000);
		travelspeed = (is_true(supplydrop.var_abd32694) ? 400 : 200);
		var_d635e1bd = (is_true(supplydrop.var_abd32694) ? 200 : 60);
		groundtrace = physicstraceex(startpoint, endpoint, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), supplydrop, 32);
		groundpoint = groundtrace[#"position"] + (0, 0, var_d635e1bd);
		traveldistance = startpoint - groundpoint;
		movetime = traveldistance[2] / travelspeed;
		if(movetime < 0)
		{
			movetime = 1;
		}
		supplydrop moveto(groundpoint, movetime);
		supplydrop playsound("evt_supply_drop");
		var_f6dfa3da = (is_true(supplydrop.var_abd32694) ? 1 : 1);
		wait(var_f6dfa3da);
		var_d6cc4b8c = function_4daa76d4(supplydrop, supplydrop.var_d5552131);
		foreach(var_81b62996 in var_d6cc4b8c)
		{
			var_81b62996 thread function_13339b58(supplydrop, supplydrop.var_d5552131, key);
		}
		if(!is_true(supplydrop.var_7bea4af0))
		{
			supplydrop waittill(#"movedone", #"hash_6ade3db3c3188274");
		}
		foreach(var_81b62996 in var_d6cc4b8c)
		{
			var_81b62996 notify(#"hash_6c4de390ac1cb3d7");
			var_81b62996 flag::set("parachute_close");
			var_81b62996.var_b702030d = 1;
		}
		if(is_true(supplydrop.var_abd32694))
		{
			if(isdefined(supplydrop.var_d5552131))
			{
				supplydrop.var_d5552131 unlink();
				supplydrop.var_d5552131.overridevehicledamage = undefined;
				callback::callback(#"hash_740a58650e79dbfd", supplydrop.var_d5552131);
				if(isdefined(level.var_cd8f416a))
				{
					level.var_cd8f416a[level.var_cd8f416a.size] = supplydrop.var_d5552131;
				}
				supplydrop.var_d5552131 thread function_9ae8f99e();
			}
			supplydrop delete();
		}
		else
		{
			supplydrop physicslaunch();
			supplydrop thread function_924a11ff(itemspawnlist, var_93fe96a6, s_instance);
			supplydrop thread function_e21ceb1b();
		}
	}
}

/*
	Name: function_e21ceb1b
	Namespace: namespace_8f74625a
	Checksum: 0xF14817EF
	Offset: 0x2208
	Size: 0x1FC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e21ceb1b()
{
	self endon(#"death", #"movedone");
	var_9d85c40f = vectorscale((1, 1, 1), 10);
	previousorigin = self.origin;
	while(true)
	{
		var_3769eb50 = getentitiesinradius(self.origin, 128, 1);
		var_15d21979 = abs(previousorigin - self.origin[2]);
		if(var_15d21979 > 4)
		{
			foreach(player in var_3769eb50)
			{
				if(isalive(player) && player istouching(self, var_9d85c40f))
				{
					player dodamage(player.health + 1, player.origin, self, self, "none", "MOD_HIT_BY_OBJECT", 0, getweapon(#"supplydrop"));
					player playsound("evt_supply_crush");
				}
			}
		}
		previousorigin = self.origin;
		waitframe(1);
	}
}

/*
	Name: function_ba3be344
	Namespace: namespace_8f74625a
	Checksum: 0xF17FF5A3
	Offset: 0x2410
	Size: 0x1FC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ba3be344()
{
	self endon(#"death");
	self notify(#"hash_57267dfd9e64c1c7");
	exitangle = 60;
	right = anglestoforward(self.angles + (0, exitangle, 0));
	left = anglestoforward(self.angles + (0, exitangle * -1, 0));
	var_7a66fccd = function_43e35f94();
	startpoint = self.origin;
	leftpoint = function_c7bd0aa8(startpoint + (left * var_7a66fccd), startpoint);
	rightpoint = function_c7bd0aa8(startpoint + (right * var_7a66fccd), startpoint);
	endpoint = rightpoint;
	if(distance2d(startpoint, leftpoint) < distance2d(startpoint, rightpoint))
	{
		endpoint = leftpoint;
	}
	var_57e06aea = function_eafcba42(startpoint, endpoint);
	self.var_57e06aea = var_57e06aea;
	self setspeed(50);
	wait(0.5);
	self thread function_c2edbefb(var_57e06aea);
	wait(0.5);
	self setspeed(100);
}

/*
	Name: function_3c597e8d
	Namespace: namespace_8f74625a
	Checksum: 0x907275AB
	Offset: 0x2618
	Size: 0x90
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3c597e8d()
{
	if(territory::function_c0de0601())
	{
		return territory::get_center();
	}
	var_6024133d = getentarray("map_corner", "targetname");
	if(var_6024133d.size)
	{
		return math::find_box_center(var_6024133d[0].origin, var_6024133d[1].origin);
	}
	return (0, 0, 0);
}

/*
	Name: function_43e35f94
	Namespace: namespace_8f74625a
	Checksum: 0x2A53AA73
	Offset: 0x26B0
	Size: 0x10E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_43e35f94()
{
	if(territory::function_c0de0601())
	{
		return territory::get_radius();
	}
	var_6024133d = getentarray("map_corner", "targetname");
	if(var_6024133d.size)
	{
		x = abs(var_6024133d[0].origin[0] - var_6024133d[1].origin[0]);
		y = abs(var_6024133d[0].origin[1] - var_6024133d[1].origin[1]);
		return max(x, y) / 2;
	}
	return 1000;
}

/*
	Name: function_4daa76d4
	Namespace: namespace_8f74625a
	Checksum: 0x7762B91B
	Offset: 0x27C8
	Size: 0x254
	Parameters: 2
	Flags: Linked, Private
*/
function private function_4daa76d4(supplydrop, var_d91c179d)
{
	parachutes = [];
	if(!isdefined(var_d91c179d))
	{
		parachute = spawn("script_model", (0, 0, 0));
		parachute.targetname = "supply_drop_chute";
		parachute.origin = supplydrop.origin;
		parachute.angles = supplydrop.angles;
		parachute setforcenocull();
		parachute setmodel("p9_fxanim_wz_parachute_supplydrop_01_mod");
		parachute clientfield::set("supply_drop_parachute_rob", 1);
		parachute useanimtree("generic");
		parachute linkto(supplydrop, "tag_origin", vectorscale((0, 0, -1), 80));
		parachutes[parachutes.size] = parachute;
	}
	else
	{
		var_daf5f046 = 4;
		for(index = 0; index < var_daf5f046; index++)
		{
			parachute = spawn("script_model", (0, 0, 0));
			parachute.targetname = "supply_drop_chute";
			parachute.origin = supplydrop.origin;
			parachute.angles = supplydrop.angles;
			parachute setforcenocull();
			parachute setmodel("p9_fxanim_wz_parachute_supplydrop_veh_mod");
			parachute clientfield::set("supply_drop_parachute_rob", 1);
			parachute useanimtree("generic");
			parachute linkto(supplydrop, "tag_origin", vectorscale((0, 0, -1), 80));
			parachutes[parachutes.size] = parachute;
		}
	}
	return parachutes;
}

/*
	Name: function_67d7d040
	Namespace: namespace_8f74625a
	Checksum: 0x451D36F8
	Offset: 0x2A28
	Size: 0x19E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_67d7d040(var_d91c179d)
{
	supplydrop = spawn("script_model", (0, 0, 0));
	supplydrop.targetname = "supply_drop";
	supplydrop setmodel("wpn_t9_streak_care_package_friendly_world_nosight");
	supplydrop setforcenocull();
	supplydrop useanimtree("generic");
	supplydrop.var_a64ed253 = 1;
	supplydrop.var_bad13452 = 0;
	supplydrop.targetname = (supplydrop getentitynumber() + "_stash_") + randomint(2147483647);
	supplydrop clientfield::set("dynamic_stash", 1);
	supplydrop clientfield::set("dynamic_stash_type", 1);
	supplydrop.var_ed175c5 = 1;
	supplydrop setweapon(getweapon(#"hash_36d39ebc29109d2d"));
	supplydrop function_619a5c20();
	supplydrop.var_b2513722 = var_d91c179d;
	return supplydrop;
}

/*
	Name: function_70f0b08a
	Namespace: namespace_8f74625a
	Checksum: 0x47E80816
	Offset: 0x2BD0
	Size: 0x12E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_70f0b08a(var_d91c179d, vehicletype)
{
	var_c7acf5ad = spawn("script_model", (0, 0, 0));
	var_c7acf5ad.targetname = "supply_drop_harness";
	var_c7acf5ad setforcenocull();
	if(!isdefined(vehicletype))
	{
		var_c7acf5ad setmodel("p9_fxanim_wz_parachute_supplydrop_harness_01_mod");
	}
	else
	{
		switch(vehicletype)
		{
			case "hash_46d0326fb76bfd27":
			{
				var_c7acf5ad setmodel("p9_fxanim_wz_parachute_supplydrop_veh_fav_harness_mod");
				break;
			}
			default:
			{
				var_c7acf5ad setmodel("p9_fxanim_wz_parachute_supplydrop_veh_tank_harness_mod");
				break;
			}
		}
	}
	var_c7acf5ad useanimtree("generic");
	var_c7acf5ad.var_b2513722 = var_d91c179d;
	return var_c7acf5ad;
}

/*
	Name: function_546afbb6
	Namespace: namespace_8f74625a
	Checksum: 0x13B80A87
	Offset: 0x2D08
	Size: 0x128
	Parameters: 0
	Flags: Linked, Private
*/
function private function_546afbb6()
{
	self endon(#"death");
	var_dc66f988 = self getvelocity();
	var_2497a956 = 0;
	while(true)
	{
		velocity = self getvelocity();
		var_2497a956 = min(var_2497a956, velocity[2]);
		if(abs(velocity[2] - var_dc66f988[2]) > 100)
		{
			if(abs(var_2497a956) > 1000)
			{
				self setvehvelocity((0, 0, 0));
				self dodamage(self.health, self.origin, self);
			}
			return;
		}
		waitframe(1);
		var_dc66f988 = velocity;
	}
}

/*
	Name: function_a3832aa0
	Namespace: namespace_8f74625a
	Checksum: 0xF15481C5
	Offset: 0x2E38
	Size: 0x254
	Parameters: 4
	Flags: Linked, Private
*/
function private function_a3832aa0(var_d91c179d, vehicletype, dropangles, var_b48a7d49)
{
	supplydrop = spawn("script_model", vectorscale((0, 0, -1), 64000));
	supplydrop setmodel("tag_origin");
	supplydrop useanimtree("generic");
	supplydrop.var_b2513722 = var_d91c179d;
	var_d5552131 = spawnvehicle(vehicletype, (0, 0, 0), (0, 0, 0));
	if(!isdefined(var_d5552131))
	{
		supplydrop delete();
		return;
	}
	if(!isdefined(dropangles))
	{
		dropangles = (0, 0, 0);
	}
	var_da7d45d1 = vectorscale((0, 1, 0), 90);
	dropangles = (dropangles - var_b48a7d49) + var_da7d45d1;
	var_d5552131 linkto(supplydrop, "tag_origin", (0, 0, 0), dropangles);
	var_d5552131.var_b9b5403c = var_d5552131.health * 0.5;
	var_d5552131.overridevehicledamage = &function_9a275b1f;
	var_d5552131.var_b2513722 = var_d91c179d;
	var_d5552131.supplydrop = supplydrop;
	var_d5552131 makeusable();
	var_d5552131 thread function_e1e33e0();
	if(is_true(var_d5552131.isphysicsvehicle))
	{
		var_d5552131 setbrake(1);
	}
	supplydrop.var_d5552131 = var_d5552131;
	supplydrop.var_abd32694 = 1;
	arrayremovevalue(level.var_3f771530, undefined);
	level.var_3f771530[level.var_3f771530.size] = var_d5552131;
	return supplydrop;
}

/*
	Name: function_e1e33e0
	Namespace: namespace_8f74625a
	Checksum: 0x4880E8BD
	Offset: 0x3098
	Size: 0xE0
	Parameters: 0
	Flags: Linked
*/
function function_e1e33e0()
{
	self endon(#"death");
	while(true)
	{
		if(self function_2c2c30e0())
		{
			n_time_current = gettime();
			if(!isdefined(self.var_769bebf7))
			{
				self.var_769bebf7 = n_time_current;
			}
			if(!(self.var_769bebf7 + (int(40 * 1000))) > n_time_current)
			{
				self delete();
			}
		}
		else if(!self function_2c2c30e0() && isdefined(self.var_769bebf7))
		{
			self.var_769bebf7 = undefined;
		}
		wait(1);
	}
}

/*
	Name: function_6eb3f7bb
	Namespace: namespace_8f74625a
	Checksum: 0x610A5DAA
	Offset: 0x3180
	Size: 0x208
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6eb3f7bb()
{
	if(!isdefined(level.var_3e5e898c) || !isdefined(level.var_ae7f6100))
	{
		var_6024133d = getentarray("map_corner", "targetname");
		if(var_6024133d.size)
		{
			minx = min(var_6024133d[0].origin[0], var_6024133d[1].origin[0]);
			miny = min(var_6024133d[0].origin[1], var_6024133d[1].origin[1]);
			minz = -10;
			level.var_3e5e898c = (minx, miny, minz);
			maxx = max(var_6024133d[0].origin[0], var_6024133d[1].origin[0]);
			maxy = max(var_6024133d[0].origin[1], var_6024133d[1].origin[1]);
			maxz = 10;
			level.var_ae7f6100 = (maxx, maxy, maxz);
		}
		else
		{
			level.var_3e5e898c = level.mapcenter - (1000, 1000, 10);
			level.var_ae7f6100 = level.mapcenter + (1000, 1000, 10);
		}
	}
}

/*
	Name: function_16bbdd8b
	Namespace: namespace_8f74625a
	Checksum: 0x1FA62BEA
	Offset: 0x3390
	Size: 0xA2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_16bbdd8b(point)
{
	if(territory::function_c0de0601())
	{
		var_fa52306b = (point[0], point[1], point[2]);
		return territory::is_inside(var_fa52306b, 1);
	}
	function_6eb3f7bb();
	var_fa52306b = (point[0], point[1], 0);
	return function_fc3f770b(level.var_3e5e898c, level.var_ae7f6100, var_fa52306b);
}

/*
	Name: function_186f5ca3
	Namespace: namespace_8f74625a
	Checksum: 0x4FE04D63
	Offset: 0x3440
	Size: 0x152
	Parameters: 0
	Flags: None
*/
function function_186f5ca3()
{
	function_6eb3f7bb();
	for(index = 0; index < 10; index++)
	{
		droppoint = (randomfloatrange(level.var_3e5e898c[0], level.var_ae7f6100[0]), randomfloatrange(level.var_3e5e898c[1], level.var_ae7f6100[1]), randomfloatrange(level.var_3e5e898c[2], level.var_ae7f6100[2]));
		if(!oob::chr_party(droppoint))
		{
			result = function_9cc082d2(droppoint, 15000);
			if(isdefined(result) && isdefined(result[#"hash_556255be476284b3"]) && ~(result[#"hash_556255be476284b3"] & 2))
			{
				return droppoint;
			}
		}
	}
}

/*
	Name: function_415bdb1d
	Namespace: namespace_8f74625a
	Checksum: 0xC09750A6
	Offset: 0x35A0
	Size: 0xE2
	Parameters: 15
	Flags: Linked, Private
*/
function private function_415bdb1d(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	if((max(self.health - vsurfacenormal, 0)) <= self.var_b9b5403c)
	{
		self thread function_500a6615();
		self thread function_ba3be344();
		self.var_b9b5403c = 0;
	}
	return vsurfacenormal;
}

/*
	Name: function_9a275b1f
	Namespace: namespace_8f74625a
	Checksum: 0x726A9B10
	Offset: 0x3690
	Size: 0x182
	Parameters: 15
	Flags: Linked, Private
*/
function private function_9a275b1f(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	newhealth = max(self.health - vsurfacenormal, 0);
	if(newhealth <= self.var_b9b5403c)
	{
		if(isdefined(self.var_b2513722))
		{
			var_b2513722 = self.var_b2513722;
			var_b2513722 thread function_500a6615();
			var_b2513722 thread function_ba3be344();
		}
		else
		{
			if(isdefined(self.supplydrop))
			{
				self.supplydrop function_71c31c8d();
				self thread function_546afbb6();
			}
			self.var_b9b5403c = 0;
		}
	}
	if(newhealth <= 0)
	{
		self unlink();
		self.health = vsurfacenormal + 1;
	}
	return vsurfacenormal;
}

/*
	Name: function_eafcba42
	Namespace: namespace_8f74625a
	Checksum: 0x880F0D6C
	Offset: 0x3820
	Size: 0x1F4
	Parameters: 5
	Flags: Linked, Private
*/
function private function_eafcba42(startpoint, endpoint, droppoint, maxheight, minheight)
{
	points = [];
	startpoint = trace_point(startpoint);
	endpoint = trace_point(endpoint);
	var_bb96e272 = vectornormalize(endpoint - startpoint);
	pathlength = distance2d(startpoint, endpoint);
	var_28021cac = int(pathlength / 5000);
	points[0] = startpoint;
	if(isdefined(droppoint))
	{
		var_66d25ef4 = distancesquared(startpoint, droppoint);
	}
	for(var_c742cad6 = 1; var_c742cad6 <= var_28021cac; var_c742cad6++)
	{
		var_a1bc57e1 = startpoint + ((var_bb96e272 * 5000) * var_c742cad6);
		if(isdefined(droppoint))
		{
			if(distancesquared(startpoint, var_a1bc57e1) >= var_66d25ef4 && (distancesquared(startpoint, points[points.size - 1])) <= var_66d25ef4)
			{
				points[points.size] = droppoint;
			}
		}
		points[points.size] = trace_point(var_a1bc57e1, undefined, maxheight, minheight);
		waitframe(1);
	}
	points[points.size] = endpoint;
	return points;
}

/*
	Name: trace_point
	Namespace: namespace_8f74625a
	Checksum: 0x87BC53AF
	Offset: 0x3A20
	Size: 0x144
	Parameters: 4
	Flags: Linked, Private
*/
function private trace_point(point, var_5fd22b95, maxheight, minheight)
{
	if(!isdefined(var_5fd22b95))
	{
		var_5fd22b95 = 1;
	}
	if(!isdefined(maxheight))
	{
		maxheight = 20000;
	}
	if(!isdefined(minheight))
	{
		minheight = 1000;
	}
	startpoint = (point[0], point[1], maxheight);
	endpoint = (point[0], point[1], minheight);
	trace = groundtrace(startpoint, endpoint, 0, undefined, var_5fd22b95);
	if(!var_5fd22b95)
	{
		if(trace[#"surfacetype"] == "water" || trace[#"surfacetype"] == "watershallow")
		{
			return;
		}
	}
	if(isdefined(trace[#"position"]))
	{
		return trace[#"position"] + vectorscale((0, 0, 1), 2000);
	}
	return startpoint;
}

/*
	Name: function_8234217e
	Namespace: namespace_8f74625a
	Checksum: 0x146DBCA5
	Offset: 0x3B70
	Size: 0x104
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8234217e(var_faa1ea31, vectors)
{
	/#
		assert(vectors.size > 0);
	#/
	var_54b25053 = vectors[0];
	bestdot = vectordot(var_54b25053, var_faa1ea31);
	for(index = 1; index < vectors.size; index++)
	{
		var_7aa67ca6 = vectordot(vectors[index], var_faa1ea31);
		if(abs(var_7aa67ca6) > abs(bestdot))
		{
			var_54b25053 = vectors[index];
			bestdot = var_7aa67ca6;
		}
	}
	if(bestdot < 0)
	{
		var_54b25053 = var_54b25053 * -1;
	}
	return var_54b25053;
}

/*
	Name: function_a40836e
	Namespace: namespace_8f74625a
	Checksum: 0xABBDD60F
	Offset: 0x3C80
	Size: 0x102
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a40836e(angles, var_553ec518)
{
	if(!isdefined(var_553ec518))
	{
		var_553ec518 = (1, 0, 0);
	}
	axises = [];
	axises[axises.size] = anglestoforward(angles);
	axises[axises.size] = anglestoright(angles);
	axises[axises.size] = anglestoup(angles);
	worldup = (0, 0, 1);
	newforward = function_8234217e(var_553ec518, axises);
	var_1883753b = function_8234217e(worldup, axises);
	newangles = axistoangles(newforward, var_1883753b);
	return newangles;
}

/*
	Name: function_ee19f0b0
	Namespace: namespace_8f74625a
	Checksum: 0x476D40FC
	Offset: 0x3D90
	Size: 0x2A
	Parameters: 2
	Flags: None
*/
function function_ee19f0b0(angles, var_553ec518)
{
	return function_a40836e(angles, var_553ec518);
}

/*
	Name: function_924a11ff
	Namespace: namespace_8f74625a
	Checksum: 0x9D89B0B0
	Offset: 0x3DC8
	Size: 0x1A4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_924a11ff(itemspawnlist, var_93fe96a6, s_instance)
{
	if(!isdefined(var_93fe96a6))
	{
		var_93fe96a6 = 0;
	}
	/#
		assert(isdefined(itemspawnlist));
	#/
	self endon(#"death");
	self thread item_drop::function_10ececeb(1, 80, 24, vectorscale((-1, -1, 0), 25), (25, 25, 50));
	self waittill(#"stationary");
	if(isdefined(level.var_a16ff74d))
	{
		self thread [[level.var_a16ff74d]](var_93fe96a6, s_instance);
	}
	else
	{
		var_e68facee = isdefined(self getlinkedent());
		self clientfield::set("supply_drop_fx", 1);
		self setmodel("wpn_t9_streak_care_package_friendly_world_nosight");
		self.anglesoffset = vectorscale((0, 1, 0), 90);
		items = self namespace_65181344::function_5eada592(itemspawnlist, 1);
		wait(60);
		if(isdefined(self))
		{
			self clientfield::set("supply_drop_fx", 0);
		}
	}
}

/*
	Name: function_9e8348e4
	Namespace: namespace_8f74625a
	Checksum: 0xAB45CC37
	Offset: 0x3F78
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9e8348e4()
{
	self waittill(#"hash_7b6fafe066e13e0b", #"death");
	self thread function_500a6615();
}

/*
	Name: function_c2edbefb
	Namespace: namespace_8f74625a
	Checksum: 0xC1C02881
	Offset: 0x3FC0
	Size: 0x224
	Parameters: 4
	Flags: Linked, Private
*/
function private function_c2edbefb(path, droppoint, var_86928932, var_2118f785)
{
	if(!isdefined(var_86928932))
	{
		var_86928932 = 1;
	}
	if(!isdefined(var_2118f785))
	{
		var_2118f785 = undefined;
	}
	self endon(#"death", #"hash_57267dfd9e64c1c7");
	for(pathindex = 1; pathindex < path.size; pathindex++)
	{
		var_f155e743 = 0;
		if(isdefined(droppoint))
		{
			var_f155e743 = distancesquared(path[pathindex], droppoint) < sqr(128);
		}
		self function_a57c34b7(path[pathindex], var_f155e743 && var_86928932, 0);
		while(true)
		{
			if(var_f155e743)
			{
				if(distancesquared(droppoint, self.origin) < sqr(128))
				{
					if(var_86928932)
					{
						wait(2);
					}
					self thread function_500a6615(var_2118f785);
					if(var_86928932)
					{
						wait(1);
					}
					break;
				}
			}
			else if(distancesquared(path[pathindex], self.origin) < sqr(1800))
			{
				break;
			}
			waitframe(1);
		}
	}
	self notify(#"hash_7b6fafe066e13e0b");
	if(isdefined(self.harness))
	{
		self.harness delete();
	}
	self delete();
}

/*
	Name: function_261b0e67
	Namespace: namespace_8f74625a
	Checksum: 0x6A63B325
	Offset: 0x41F0
	Size: 0x2EC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_261b0e67(spawnpoint, endpoint, droppoint, var_d9151bd0, vehicleoverride)
{
	if(!isdefined(var_d9151bd0))
	{
		var_d9151bd0 = 1;
	}
	if(!isdefined(vehicleoverride))
	{
		vehicleoverride = undefined;
	}
	var_47736ddd = array(spawnpoint, droppoint, endpoint);
	var_7366c0ff = spawnvehicle((isdefined(vehicleoverride) ? vehicleoverride : "vehicle_t8_mil_helicopter_transport_dark_wz_infiltration"), spawnpoint, vectortoangles(vectornormalize(endpoint - spawnpoint)));
	if(!isdefined(var_7366c0ff))
	{
		return;
	}
	var_7366c0ff endon(#"death");
	var_7366c0ff setforcenocull();
	var_7366c0ff.goalradius = 128;
	var_7366c0ff.goalheight = 128;
	var_7366c0ff.health = 10000;
	var_7366c0ff setspeed(125);
	var_7366c0ff setrotorspeed(1);
	var_7366c0ff vehicle::toggle_tread_fx(1);
	var_7366c0ff vehicle::toggle_exhaust_fx(1);
	var_7366c0ff vehicle::toggle_sounds(1);
	for(pathindex = 1; pathindex < var_47736ddd.size; pathindex++)
	{
		var_f155e743 = 0;
		if(isdefined(droppoint))
		{
			var_f155e743 = distancesquared(var_47736ddd[pathindex], droppoint) < sqr(128);
		}
		var_7366c0ff function_a57c34b7(var_47736ddd[pathindex], 0, 0);
		while(true)
		{
			if(var_f155e743)
			{
				if(distancesquared(droppoint, var_7366c0ff.origin) < sqr(128))
				{
					break;
				}
			}
			else if(distancesquared(var_47736ddd[pathindex], var_7366c0ff.origin) < sqr(1800))
			{
				break;
			}
			waitframe(1);
		}
	}
	var_7366c0ff delete();
}

/*
	Name: function_7d4a448f
	Namespace: namespace_8f74625a
	Checksum: 0x5469291B
	Offset: 0x44E8
	Size: 0x5CC
	Parameters: 1
	Flags: None
*/
function function_7d4a448f(var_47d17dcb)
{
	if(!isdefined(var_47d17dcb))
	{
		var_47d17dcb = 0;
	}
	if(!is_true(level.deathcircle.enabled))
	{
		return;
	}
	if(!isdefined(level.var_fb91af8) || level.var_fb91af8.size <= 0)
	{
		return;
	}
	var_52b56362 = (isdefined(level.var_52b56362) ? level.var_52b56362 : 0);
	deathcircle = level.var_fb91af8[var_52b56362];
	var_448914c2 = (isdefined(level.var_fb91af8[var_52b56362 + 1]) ? level.var_fb91af8[var_52b56362 + 1] : deathcircle);
	if(var_47d17dcb)
	{
		var_448914c2 = level.var_fb91af8[level.var_fb91af8.size - 1];
	}
	var_94f13d8b = 18000;
	var_e1ae630e = var_448914c2.origin;
	var_e1ae630e = (var_e1ae630e[0], var_e1ae630e[1], var_94f13d8b);
	var_4f59c30d = var_448914c2.radius;
	if(!function_16bbdd8b(var_e1ae630e))
	{
		return;
	}
	var_396cbf6e = deathcircle.radius;
	var_be734526 = deathcircle.radius - var_4f59c30d;
	if(var_be734526 > 0)
	{
		var_e7993c63 = vectornormalize(var_e1ae630e - (deathcircle.origin[0], deathcircle.origin[1], var_94f13d8b));
		var_8df04549 = var_e1ae630e - (var_e7993c63 * var_4f59c30d);
		exitpoint = var_e1ae630e + (var_e7993c63 * var_4f59c30d);
	}
	else
	{
		degrees = randomint(360);
		var_8df04549 = (cos(degrees) * var_4f59c30d, sin(degrees) * var_4f59c30d, 0) + var_e1ae630e;
		exitpoint = ((cos(degrees) * -1) * var_4f59c30d, (sin(degrees) * -1) * var_4f59c30d, 0) + var_e1ae630e;
	}
	waitframe(1);
	droppoint = var_e1ae630e;
	var_8df04549 = function_c7bd0aa8(var_8df04549, droppoint);
	exitpoint = function_c7bd0aa8(exitpoint, droppoint);
	var_bb96e272 = vectornormalize(exitpoint - var_8df04549);
	var_142db926 = 5000;
	var_a2712870 = distance2d(deathcircle.origin, var_e1ae630e);
	var_6eae2ffb = (var_396cbf6e + var_a2712870) + var_142db926;
	var_429b69c0 = max(var_6eae2ffb, 15000);
	var_e9e24bda = max(var_396cbf6e, 45000);
	spawnpoint = var_8df04549 - (var_bb96e272 * var_429b69c0);
	spawnpoint = function_c7bd0aa8(spawnpoint, droppoint);
	endpoint = exitpoint + (var_bb96e272 * var_e9e24bda);
	endpoint = function_c7bd0aa8(endpoint, droppoint);
	level thread function_261b0e67(spawnpoint, endpoint, droppoint, 1);
	angles = vectortoangles(var_bb96e272);
	rightoffset = vectornormalize(anglestoright(angles)) * 1024;
	leftoffset = rightoffset * -1;
	var_ae85ee87 = var_bb96e272 * -1024;
	vehicleoverride = undefined;
	offset = (rightoffset + var_ae85ee87) + (0, 0, randomintrange(25, 50));
	level thread function_261b0e67(spawnpoint + offset, endpoint + offset, droppoint + offset, 0, vehicleoverride);
	offset = (leftoffset + var_ae85ee87) + (0, 0, randomintrange(-50, -25));
	level thread function_261b0e67(spawnpoint + offset, endpoint + offset, droppoint + offset, 0, vehicleoverride);
}

/*
	Name: function_418e26fe
	Namespace: namespace_8f74625a
	Checksum: 0x253998DF
	Offset: 0x4AC0
	Size: 0x5CC
	Parameters: 6
	Flags: None
*/
function function_418e26fe(var_2118f785, helicopter, var_58ca2822, var_541c190b, var_d6388d1, vehicletype)
{
	if(!isdefined(var_2118f785))
	{
		var_2118f785 = undefined;
	}
	if(!isdefined(helicopter))
	{
		helicopter = 0;
	}
	if(!isdefined(var_58ca2822))
	{
		var_58ca2822 = 1;
	}
	if(!isdefined(var_541c190b))
	{
		var_541c190b = 0;
	}
	if(!isdefined(var_d6388d1))
	{
		var_d6388d1 = 0;
	}
	if(!isdefined(vehicletype))
	{
		vehicletype = undefined;
	}
	if(!is_true(level.deathcircle.enabled))
	{
		return;
	}
	if(!isdefined(level.var_fb91af8) || level.var_fb91af8.size <= 0)
	{
		return;
	}
	var_f5f2246e = (helicopter ? 20000 : 35000);
	var_52b56362 = (isdefined(level.var_52b56362) ? level.var_52b56362 : 0);
	deathcircle = level.var_fb91af8[var_52b56362];
	var_448914c2 = (isdefined(level.var_fb91af8[var_52b56362 + 1]) ? level.var_fb91af8[var_52b56362 + 1] : deathcircle);
	if(helicopter)
	{
		var_729c4495 = 1000;
	}
	else
	{
		var_729c4495 = 20000;
	}
	var_729c4495 = var_729c4495 + var_541c190b;
	var_94f13d8b = 2000 + var_729c4495;
	var_e1ae630e = var_448914c2.origin;
	var_e1ae630e = (var_e1ae630e[0], var_e1ae630e[1], var_94f13d8b);
	var_4f59c30d = var_448914c2.radius;
	if(!function_16bbdd8b(var_e1ae630e))
	{
		return;
	}
	var_396cbf6e = deathcircle.radius;
	var_be734526 = deathcircle.radius - var_4f59c30d;
	degrees = randomint(360);
	var_8df04549 = (cos(degrees) * var_4f59c30d, sin(degrees) * var_4f59c30d, var_94f13d8b) + var_e1ae630e;
	exitpoint = ((cos(degrees) * -1) * var_4f59c30d, (sin(degrees) * -1) * var_4f59c30d, var_94f13d8b) + var_e1ae630e;
	waitframe(1);
	var_e2be9787 = 10;
	droppoint = undefined;
	for(index = 0; index < var_e2be9787; index++)
	{
		randompoint = lerpvector(var_8df04549, exitpoint, randomfloatrange(0, 1));
		if(function_16bbdd8b(randompoint))
		{
			droppoint = trace_point(randompoint, 0, undefined, -5000);
			if(isdefined(droppoint) && !oob::chr_party(droppoint))
			{
				droppoint = trace_point(randompoint, 0, var_f5f2246e, var_729c4495);
				break;
			}
		}
		waitframe(1);
	}
	if(!isdefined(droppoint))
	{
		return;
	}
	var_8df04549 = function_c7bd0aa8(var_8df04549, droppoint);
	var_8df04549 = trace_point(var_8df04549, undefined, var_f5f2246e, var_729c4495);
	exitpoint = function_c7bd0aa8(exitpoint, droppoint);
	exitpoint = trace_point(exitpoint, undefined, var_f5f2246e, var_729c4495);
	var_bb96e272 = vectornormalize(exitpoint - var_8df04549);
	var_429b69c0 = max(var_396cbf6e, 15000);
	var_e9e24bda = max(var_396cbf6e, 45000);
	spawnpoint = var_8df04549 - (var_bb96e272 * var_429b69c0);
	spawnpoint = function_c7bd0aa8(spawnpoint, droppoint);
	endpoint = exitpoint + (var_bb96e272 * var_e9e24bda);
	endpoint = function_c7bd0aa8(endpoint, droppoint);
	if(helicopter)
	{
		var_57e06aea = function_47ec98c4(spawnpoint, endpoint, droppoint, var_d6388d1, vehicletype, var_f5f2246e, var_729c4495);
	}
	else
	{
		var_57e06aea = function_b8dd1978(spawnpoint, endpoint, droppoint, var_2118f785, var_58ca2822);
	}
	level.var_1b269b78 = var_8df04549;
	level.var_538928e3 = exitpoint;
}

/*
	Name: function_b8dd1978
	Namespace: namespace_8f74625a
	Checksum: 0x9E2797DB
	Offset: 0x5098
	Size: 0x29C
	Parameters: 5
	Flags: Linked
*/
function function_b8dd1978(startpoint, endpoint, droppoint, var_2118f785, var_58ca2822)
{
	if(!isdefined(var_2118f785))
	{
		var_2118f785 = undefined;
	}
	if(!isdefined(var_58ca2822))
	{
		var_58ca2822 = 1;
	}
	var_57e06aea = array(startpoint, droppoint, endpoint);
	var_b2513722 = spawnvehicle("vehicle_t8_mil_air_transport_infiltration", startpoint, vectortoangles(vectornormalize(endpoint - startpoint)));
	if(!isdefined(var_b2513722))
	{
		return;
	}
	var_b2513722 setforcenocull();
	if(var_58ca2822)
	{
		callback::callback(#"hash_40cd438036ae13df", undefined);
	}
	var_b2513722.goalradius = 128;
	var_b2513722.goalheight = 128;
	var_b2513722.var_57e06aea = var_57e06aea;
	var_b2513722.maxhealth = var_b2513722.health;
	var_b2513722.var_b9b5403c = var_b2513722.maxhealth * 0.5;
	var_b2513722 setspeed(100);
	var_b2513722 setrotorspeed(1);
	var_b2513722 vehicle::toggle_tread_fx(1);
	var_b2513722 vehicle::toggle_exhaust_fx(1);
	var_b2513722 vehicle::toggle_sounds(1);
	var_b2513722.var_5d0810d7 = 1;
	supplydrop = function_67d7d040(var_b2513722);
	if(!isdefined(var_b2513722))
	{
		return;
	}
	supplydrop linkto(var_b2513722, "tag_origin", vectorscale((0, 0, -1), 120));
	var_b2513722.supplydrop = supplydrop;
	var_b2513722 thread function_c2edbefb(var_57e06aea, droppoint, 0, var_2118f785);
	var_b2513722 thread function_9e8348e4();
	level.var_a5f063d[level.var_a5f063d.size] = supplydrop;
	return var_57e06aea;
}

/*
	Name: function_47ec98c4
	Namespace: namespace_8f74625a
	Checksum: 0x3EFEFA13
	Offset: 0x5340
	Size: 0x62C
	Parameters: 9
	Flags: Linked
*/
function function_47ec98c4(startpoint, endpoint, droppoint, var_d91c179d, vehicletype, maxheight, minheight, var_2118f785, dropangles)
{
	if(!isdefined(var_d91c179d))
	{
		var_d91c179d = 0;
	}
	if(!isdefined(vehicletype))
	{
		vehicletype = undefined;
	}
	if(!isdefined(maxheight))
	{
		maxheight = undefined;
	}
	if(!isdefined(minheight))
	{
		minheight = undefined;
	}
	if(!isdefined(dropangles))
	{
		dropangles = undefined;
	}
	if(is_true(var_d91c179d) && !isdefined(vehicletype))
	{
		return;
	}
	var_57e06aea = function_eafcba42(startpoint, endpoint, droppoint, maxheight, minheight);
	/#
		assert(var_57e06aea.size >= 2);
	#/
	startpoint = var_57e06aea[0];
	endpoint = var_57e06aea[var_57e06aea.size - 1];
	var_3aa5a1b = endpoint - startpoint;
	var_ce19c689 = vectortoangles(var_3aa5a1b);
	if(!var_d91c179d)
	{
		var_b2513722 = spawnvehicle("vehicle_t9_mil_helicopter_care_package", startpoint, vectortoangles(vectornormalize(endpoint - startpoint)));
	}
	else
	{
		var_b2513722 = spawnvehicle("vehicle_t9_mil_ru_heli_transport_vehicle_drop", startpoint, vectortoangles(vectornormalize(endpoint - startpoint)));
	}
	if(!isdefined(var_b2513722))
	{
		return;
	}
	var_b2513722 setforcenocull();
	callback::callback(#"hash_40cd438036ae13df", {#droppoint:droppoint, #vehicletype:vehicletype});
	var_b2513722.takedamage = 0;
	var_b2513722.goalradius = 128;
	var_b2513722.goalheight = 128;
	var_b2513722.var_57e06aea = var_57e06aea;
	var_b2513722.maxhealth = var_b2513722.health;
	var_b2513722.var_b9b5403c = var_b2513722.maxhealth * 0.5;
	var_b2513722.overridevehicledamage = &function_415bdb1d;
	var_b2513722 setspeed(100);
	var_b2513722 setrotorspeed(1);
	var_b2513722 vehicle::toggle_tread_fx(1);
	var_b2513722 vehicle::toggle_exhaust_fx(1);
	var_b2513722 vehicle::toggle_sounds(1);
	var_b2513722.var_5d0810d7 = 1;
	if(var_d91c179d)
	{
		harness = function_70f0b08a(var_b2513722, vehicletype);
		supplydrop = function_a3832aa0(var_b2513722, vehicletype, dropangles, var_ce19c689);
	}
	else
	{
		harness = function_70f0b08a(var_b2513722);
		supplydrop = function_67d7d040(var_b2513722);
	}
	if(isdefined(harness))
	{
		harness linkto(var_b2513722, "tag_cargo_attach", vectorscale((0, 0, -1), 90));
		var_6fe5490e = #"hash_7b1793df2c9b8245";
		attachtag = "tag_care_package";
		if(isdefined(supplydrop.var_d5552131))
		{
			attachtag = "tag_vehicle_tank";
			switch(supplydrop.var_d5552131.vehicletype)
			{
				case "hash_46d0326fb76bfd27":
				{
					var_6fe5490e = #"hash_333ac707d1003c63";
					break;
				}
				default:
				{
					var_6fe5490e = #"hash_105bba381b94f622";
					break;
				}
			}
		}
		supplydrop linkto(harness, attachtag, (0, 0, 0), vectorscale((0, -1, 0), 90));
		harness animscripted("harness_idle", var_b2513722.origin, var_b2513722.angles, var_6fe5490e, "normal", "root", 1, 0);
	}
	else
	{
		supplydrop linkto(var_b2513722, "tag_cargo_attach", vectorscale((0, 0, -1), 45));
	}
	var_b2513722.harness = harness;
	var_b2513722.supplydrop = supplydrop;
	var_b2513722 thread function_c2edbefb(var_57e06aea, droppoint, undefined, var_2118f785);
	var_b2513722 thread function_9e8348e4();
	level.var_a5f063d[level.var_a5f063d.size] = supplydrop;
	level.supplydrop = supplydrop;
	level.var_b2513722 = var_b2513722;
	level.var_57e06aea = var_57e06aea;
	level.var_daa6e3f = droppoint;
	level.var_d1c35a7a = startpoint;
	level.var_ebe9f3de = endpoint;
	return var_57e06aea;
}

/*
	Name: function_1b48df6d
	Namespace: namespace_8f74625a
	Checksum: 0x71A7C8B3
	Offset: 0x5978
	Size: 0x34E
	Parameters: 6
	Flags: None
*/
function function_1b48df6d(droppoint, helicopter, var_d6388d1, vehicletype, var_2118f785, dropangles)
{
	if(!isdefined(helicopter))
	{
		helicopter = 0;
	}
	if(!isdefined(var_d6388d1))
	{
		var_d6388d1 = 0;
	}
	if(!isdefined(vehicletype))
	{
		vehicletype = undefined;
	}
	if(!isdefined(var_2118f785))
	{
		var_2118f785 = undefined;
	}
	if(!isdefined(dropangles))
	{
		dropangles = undefined;
	}
	/#
		assert(isvec(droppoint));
	#/
	if(!function_16bbdd8b(droppoint))
	{
		return;
	}
	maxheight = (helicopter ? 20000 : 35000);
	minheight = (helicopter ? 1000 : 20000);
	droppoint = trace_point(droppoint, 0, maxheight, minheight);
	if(!isdefined(droppoint) || !function_16bbdd8b(droppoint))
	{
		return;
	}
	mapcenter = function_3c597e8d();
	var_7a66fccd = function_43e35f94();
	if(var_7a66fccd == 0)
	{
		var_7a66fccd = 10000;
	}
	var_1e8c19be = 5000;
	var_8dc158c7 = 15000;
	var_b98da7dd = droppoint - mapcenter;
	var_b98da7dd = (var_b98da7dd[0], var_b98da7dd[1], 0);
	var_b98da7dd = vectornormalize(var_b98da7dd);
	spawnpoint = mapcenter + (var_b98da7dd * var_7a66fccd);
	spawnpoint = (spawnpoint[0], spawnpoint[1], droppoint[2]);
	if(!territory::function_c0de0601())
	{
		spawnpoint = function_c7bd0aa8(spawnpoint, droppoint) + (var_b98da7dd * var_1e8c19be);
	}
	endpoint = mapcenter - (var_b98da7dd * var_7a66fccd);
	endpoint = (endpoint[0], endpoint[1], droppoint[2]);
	if(!territory::function_c0de0601())
	{
		endpoint = function_c7bd0aa8(endpoint, droppoint) - (var_b98da7dd * var_8dc158c7);
	}
	if(distance2dsquared(spawnpoint, endpoint) <= sqr(100))
	{
		return;
	}
	if(helicopter)
	{
		var_57e06aea = function_47ec98c4(spawnpoint, endpoint, droppoint, var_d6388d1, vehicletype, undefined, undefined, var_2118f785, dropangles);
	}
	else
	{
		var_57e06aea = function_b8dd1978(spawnpoint, endpoint, droppoint, var_2118f785);
	}
}

/*
	Name: function_8366d4d6
	Namespace: namespace_8f74625a
	Checksum: 0xD7D1CF07
	Offset: 0x5CD0
	Size: 0x88
	Parameters: 2
	Flags: None
*/
function function_8366d4d6(spawnpoint, itemspawnlist)
{
	supplydrop = function_67d7d040(undefined);
	supplydrop.origin = spawnpoint;
	struct = spawnstruct();
	struct.supplydrop = supplydrop;
	struct thread function_500a6615(itemspawnlist);
	return supplydrop;
}

/*
	Name: function_9771c7db
	Namespace: namespace_8f74625a
	Checksum: 0x729D7773
	Offset: 0x5D60
	Size: 0xF0
	Parameters: 4
	Flags: None
*/
function function_9771c7db(spawnpoint, itemspawnlist, var_93fe96a6, s_instance)
{
	if(!isdefined(var_93fe96a6))
	{
		var_93fe96a6 = 0;
	}
	supplydrop = function_67d7d040(undefined);
	supplydrop.origin = spawnpoint;
	struct = spawnstruct();
	if(isdefined(level.var_183bdb80))
	{
		supplydrop thread [[level.var_183bdb80]](s_instance);
	}
	else
	{
		supplydrop thread supply_drop_portal_fx();
	}
	supplydrop.struct = struct;
	struct.supplydrop = supplydrop;
	struct thread function_500a6615(itemspawnlist, var_93fe96a6, s_instance);
	return supplydrop;
}

/*
	Name: supply_drop_portal_fx
	Namespace: namespace_8f74625a
	Checksum: 0x503BDC25
	Offset: 0x5E58
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function supply_drop_portal_fx()
{
	self clientfield::set("supply_drop_portal_fx", 1);
	wait(3);
	self clientfield::set("supply_drop_portal_fx", 0);
}

