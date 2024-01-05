#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\debug_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace weapons;

/*
	Name: __init__system__
	Namespace: weapons
	Checksum: 0xAE47D405
	Offset: 0x170
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"weapons_shared", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weapons
	Checksum: 0xA3A4CCA1
	Offset: 0x1B8
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::on_spawned(&on_player_spawned);
	callback::on_disconnect(&function_430e844a);
	callback::on_player_killed(&function_430e844a);
}

/*
	Name: on_player_spawned
	Namespace: weapons
	Checksum: 0xB95B1822
	Offset: 0x228
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	if(!isdefined(level.var_5495fbf1) || level.var_5495fbf1)
	{
		self thread function_e870d33d();
	}
}

/*
	Name: function_867af0b
	Namespace: weapons
	Checksum: 0x56F2017E
	Offset: 0x270
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function function_867af0b()
{
	/#
		self endon(#"death");
		player = self;
		gameobject_link = undefined;
		while(true)
		{
			wait(float(function_60d95f53()) / 1000);
			if(self.sessionstate != "")
			{
				continue;
			}
			test_mount = getdvarint(#"test_mount", 0);
			if(test_mount == 0)
			{
				continue;
			}
			if(test_mount == 1)
			{
				if(isdefined(gameobject_link))
				{
					gameobject_link delete();
					gameobject_link = undefined;
				}
				gameobject_link = util::spawn_model("", player.origin, player.angles);
				player playerlinkto(gameobject_link, "", 0, 60, 60, 30, 10, 0);
				player function_66f3a713();
			}
			else if(test_mount == 2)
			{
				player unlink();
			}
			setdvar(#"test_mount", 0);
		}
	#/
}

/*
	Name: function_c0101095
	Namespace: weapons
	Checksum: 0x3693F4C4
	Offset: 0x430
	Size: 0x15A
	Parameters: 3
	Flags: Linked
*/
function function_c0101095(weapon, forward, var_62e5b78)
{
	player = self;
	var_79ed7809 = var_62e5b78;
	var_c346c56f = player function_a95ab787();
	var_6b469265 = 31;
	var_87c01c60 = vectorscale(forward, var_6b469265);
	trace_start = (player.origin + (0, 0, var_c346c56f + 5)) + var_87c01c60;
	trace_end = trace_start + (vectorscale((0, 0, -1), 10));
	var_4f64fb6b = 3;
	trace = physicstrace(trace_start, trace_end, (var_4f64fb6b * -1, var_4f64fb6b * -1, 0), (var_4f64fb6b, var_4f64fb6b, 1), player, 1);
	if(trace[#"fraction"] < 1)
	{
		var_79ed7809 = 30;
	}
	return min(var_62e5b78, var_79ed7809);
}

/*
	Name: function_f40168d3
	Namespace: weapons
	Checksum: 0xB2D951EB
	Offset: 0x598
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_f40168d3()
{
	self endon(#"death");
	self clientfield::set("deathfx", 1);
	wait(0.25);
	self delete();
}

/*
	Name: function_430e844a
	Namespace: weapons
	Checksum: 0x10130DF7
	Offset: 0x600
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_430e844a(params)
{
	if(!isdefined(self.var_766deb67))
	{
		return;
	}
	self.var_766deb67 thread function_f40168d3();
}

/*
	Name: function_e870d33d
	Namespace: weapons
	Checksum: 0xEE58B4BA
	Offset: 0x640
	Size: 0xCB6
	Parameters: 0
	Flags: Linked
*/
function function_e870d33d()
{
	self notify("5f5f570779ebfb39");
	self endon("5f5f570779ebfb39");
	player = self;
	player endon(#"death", #"disconnect");
	gameobject_link = undefined;
	vehicle = undefined;
	var_13ab34e1 = undefined;
	while(isdefined(player.var_766deb67))
	{
		wait(float(function_60d95f53()) / 1000);
	}
	while(true)
	{
		wait(float(function_60d95f53()) / 1000);
		current_weapon = player getcurrentweapon();
		if(current_weapon == level.weaponnone)
		{
			continue;
		}
		if(!current_weapon.mountable)
		{
			continue;
		}
		if(!player function_2483ea6a())
		{
			continue;
		}
		if(current_weapon.altweapon != level.weaponnone && current_weapon.inventorytype != "altmode")
		{
			continue;
		}
		if(player playerads() == 0)
		{
			waitresult = undefined;
			waitresult = player waittill(#"weapon_switch_started", #"weapon_ads_started");
			if(waitresult._notify != "weapon_ads_started")
			{
				continue;
			}
		}
		if(!player function_2483ea6a())
		{
			continue;
		}
		if(current_weapon.altweapon != level.weaponnone && current_weapon.inventorytype != "altmode")
		{
			continue;
		}
		if(isdefined(gameobject_link))
		{
			gameobject_link delete();
			gameobject_link = undefined;
		}
		player_angles = player getplayerangles();
		player_forward = anglestoforward(player_angles);
		var_4d7355d2 = player isaisminute();
		var_a3a6eba5 = player_angles;
		var_6b6455b9 = anglestoforward(var_a3a6eba5);
		if(isdefined(var_4d7355d2))
		{
			var_6b6455b9 = var_4d7355d2 * -1;
			var_a3a6eba5 = vectortoangles(var_6b6455b9);
		}
		else
		{
			var_4d7355d2 = vectornormalize((var_6b6455b9[0], var_6b6455b9[1], 0)) * -1;
		}
		if(current_weapon.var_ba335ef)
		{
			settings = function_7a677105(current_weapon);
			var_37c33d3b = player function_a95ab787();
			var_13ab34e1 = settings.var_e83de809;
			var_6900cfa4 = settings.var_eac96157;
			var_5035eb1b = -20;
			if(var_37c33d3b >= 48)
			{
				var_6900cfa4 = settings.var_442896c4;
				var_5035eb1b = 3;
			}
			else
			{
				if(var_37c33d3b >= 44)
				{
					var_6900cfa4 = settings.var_442896c4;
					var_5035eb1b = 0;
				}
				else
				{
					if(var_37c33d3b >= 40)
					{
						var_6900cfa4 = settings.var_e90ee08e;
						var_5035eb1b = -4;
					}
					else
					{
						if(var_37c33d3b >= 36)
						{
							var_6900cfa4 = settings.var_7188ee00;
							var_5035eb1b = -8;
						}
						else
						{
							if(var_37c33d3b >= 32)
							{
								var_6900cfa4 = settings.var_dffa4ad9;
								var_5035eb1b = -12;
							}
							else if(var_37c33d3b >= 28)
							{
								var_6900cfa4 = settings.var_c93b1eb3;
								var_5035eb1b = -16;
							}
						}
					}
				}
			}
			if(player getstance() == "crouch" && var_37c33d3b >= 36)
			{
				player setstance("stand");
			}
			else if(player getstance() == "stand" && var_37c33d3b < 36)
			{
				player setstance("crouch");
			}
			var_80a327fb = (var_37c33d3b >= 36 ? "stand" : "crouch");
			exit_origin = player.origin;
			vehicle_origin = player.origin + vectorscale(vectornormalize((player_forward[0], player_forward[1], 0)), float((isdefined(settings.var_4207321e) ? settings.var_4207321e : 16)));
			vehicle_origin = vehicle_origin + (0, 0, var_5035eb1b);
			player.var_2d23ee07 = var_5035eb1b;
			vehicle = spawnvehicle(var_13ab34e1, vehicle_origin, var_a3a6eba5);
			vehicle.team = player.team;
			vehicle setteam(vehicle.team);
			vehicle hide();
			if(isdefined(var_6900cfa4))
			{
				var_3cb4fa3e = getsubstr(var_6900cfa4, 0, var_6900cfa4.size - 3);
				vehicle_weapon = getweapon(var_3cb4fa3e);
				if(vehicle_weapon != level.weaponnone)
				{
					vehicle setvehweapon(vehicle_weapon);
				}
			}
			var_394fad2b = 1;
			vehicle_used = 0;
			player thread function_18a9a4e4(settings);
			ads_fraction = player playerads();
			var_4308b3d8 = gettime() + ((1 - ads_fraction) * current_weapon.var_e5db3b95);
			while(player playerads() < 1)
			{
				if(player playerads() == 0)
				{
					var_394fad2b = 0;
					break;
				}
				wait(float(function_60d95f53()) / 1000);
			}
			while(gettime() < var_4308b3d8)
			{
				if(player playerads() == 0)
				{
					var_394fad2b = 0;
					break;
				}
				wait(float(function_60d95f53()) / 1000);
			}
			var_628f1aed = 0;
			if(var_394fad2b)
			{
				var_af604e9b = player getcurrentweapon();
				vehicle show();
				vehicle clientfield::set("enemyvehicle", 0);
				vehicle usevehicle(player, 0);
				vehicle_used = 1;
				vehicle turretsettargetangles(0, var_a3a6eba5 - player_angles);
				player.var_ca876b0f = 1;
				player.var_e7e2e3e5 = 1;
				player.var_766deb67 = vehicle;
				while(player adsbuttonpressed())
				{
					wait(float(function_60d95f53()) / 1000);
					slot = player gadgetgetslot((current_weapon.altweapon != level.weaponnone ? current_weapon.altweapon : current_weapon));
					if(0 <= slot && slot < 3)
					{
						power = player gadgetpowerget(slot);
						if(power < 0.1)
						{
							var_628f1aed = 1;
							break;
						}
					}
				}
				vehicle usevehicle(player, 0);
				player.var_ca876b0f = undefined;
				player.var_e7e2e3e5 = undefined;
				player setstance(var_80a327fb);
				vehicle hide();
			}
			vehicle delete();
			vehicle = undefined;
			if(vehicle_used)
			{
				player setorigin(exit_origin);
			}
			if(var_628f1aed)
			{
				while(true)
				{
					wait(float(function_60d95f53()) / 1000);
					current_weapon = player getcurrentweapon();
					if(current_weapon == level.weaponnone)
					{
						continue;
					}
					if(current_weapon.mountable)
					{
						continue;
					}
					break;
				}
			}
			else if(vehicle_used)
			{
				wait(0.4);
			}
		}
		else
		{
			gameobject_link = util::spawn_model("tag_origin", player.origin, var_a3a6eba5);
			player playerlinkto(gameobject_link);
			var_79ed7809 = current_weapon.var_40ffe7d2;
			var_79ed7809 = player function_c0101095(current_weapon, var_6b6455b9, var_79ed7809);
			player lerpviewangleclamp(0.5, 0.1, 0.1, current_weapon.var_16e90b80, current_weapon.var_27c94b15, current_weapon.var_6cb9946f, var_79ed7809);
			player function_66f3a713();
			var_7db1ac70 = 1;
			while(var_7db1ac70)
			{
				if(player adsbuttonpressed() == 0)
				{
					player unlink();
					var_7db1ac70 = 0;
					continue;
				}
				wait(float(function_60d95f53()) / 1000);
			}
		}
	}
}

/*
	Name: function_18a9a4e4
	Namespace: weapons
	Checksum: 0xC06EE20D
	Offset: 0x1300
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_18a9a4e4(settings)
{
	self notify("4dd11e927c89b4de");
	self endon("4dd11e927c89b4de");
	if(!isdefined(settings.var_dec12a50))
	{
		return;
	}
	player = self;
	player endon(#"death", #"disconnect");
	rumble_delay = float((isdefined(settings.var_efe13502) ? settings.var_efe13502 : 0.5));
	if(rumble_delay > 0)
	{
		wait(rumble_delay);
	}
	if(player playerads() == 0)
	{
		return;
	}
	player playrumbleonentity(settings.var_dec12a50);
}

/*
	Name: function_7a677105
	Namespace: weapons
	Checksum: 0x577B952C
	Offset: 0x1418
	Size: 0xD0
	Parameters: 1
	Flags: Linked
*/
function function_7a677105(weapon)
{
	/#
		assert(isdefined(weapon.customsettings), "" + weapon.name);
	#/
	if(!isdefined(level.var_825acea))
	{
		level.var_825acea = [];
	}
	var_f0bf9259 = hash(weapon.name);
	if(!isdefined(level.var_825acea[var_f0bf9259]))
	{
		level.var_825acea[var_f0bf9259] = getscriptbundle(weapon.customsettings);
	}
	return level.var_825acea[var_f0bf9259];
}

/*
	Name: is_primary_weapon
	Namespace: weapons
	Checksum: 0x66700485
	Offset: 0x14F0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function is_primary_weapon(weapon)
{
	root_weapon = weapon.rootweapon;
	return root_weapon != level.weaponnone && ((isdefined(weapon.var_251796e3) ? weapon.var_251796e3 : 0));
}

/*
	Name: is_side_arm
	Namespace: weapons
	Checksum: 0xE9DD20BE
	Offset: 0x1568
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function is_side_arm(weapon)
{
	root_weapon = weapon.rootweapon;
	return root_weapon != level.weaponnone && isdefined(level.side_arm_array[root_weapon]);
}

/*
	Name: is_inventory
	Namespace: weapons
	Checksum: 0x6E5726D4
	Offset: 0x15B8
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function is_inventory(weapon)
{
	root_weapon = weapon.rootweapon;
	return root_weapon != level.weaponnone && isdefined(level.inventory_array[root_weapon]);
}

/*
	Name: is_grenade
	Namespace: weapons
	Checksum: 0x903EBFFB
	Offset: 0x1608
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function is_grenade(weapon)
{
	root_weapon = weapon.rootweapon;
	return root_weapon != level.weaponnone && isdefined(level.grenade_array[root_weapon]);
}

/*
	Name: force_stowed_weapon_update
	Namespace: weapons
	Checksum: 0x3FEF927C
	Offset: 0x1658
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function force_stowed_weapon_update()
{
	detach_all_weapons();
	stow_on_back();
	stow_on_hip();
}

/*
	Name: detach_carry_object_model
	Namespace: weapons
	Checksum: 0xB279216A
	Offset: 0x1698
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function detach_carry_object_model()
{
	if(isdefined(self.carryobject) && isdefined(self.carryobject gameobjects::get_visible_carrier_model()))
	{
		if(isdefined(self.tag_stowed_back))
		{
			self detach(self.tag_stowed_back, "tag_stowed_back");
			self.tag_stowed_back = undefined;
		}
		if(isdefined(self.var_9ed9707e))
		{
			self.var_9ed9707e delete();
		}
	}
}

/*
	Name: detach_all_weapons
	Namespace: weapons
	Checksum: 0x8331B70
	Offset: 0x1738
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function detach_all_weapons()
{
	if(isdefined(self.tag_stowed_back))
	{
		clear_weapon = 1;
		if(isdefined(self.carryobject))
		{
			carriermodel = self.carryobject gameobjects::get_visible_carrier_model();
			if(isdefined(carriermodel) && carriermodel == self.tag_stowed_back)
			{
				self detach(self.tag_stowed_back, "tag_stowed_back");
				clear_weapon = 0;
			}
		}
		if(clear_weapon)
		{
			self clearstowedweapon();
		}
		self.tag_stowed_back = undefined;
	}
	else
	{
		self clearstowedweapon();
	}
	if(isdefined(self.tag_stowed_hip))
	{
		detach_model = self.tag_stowed_hip.worldmodel;
		self detach(detach_model, "tag_stowed_hip_rear");
		self.tag_stowed_hip = undefined;
	}
	if(isdefined(self.var_9ed9707e))
	{
		self.var_9ed9707e delete();
	}
}

/*
	Name: stow_on_back
	Namespace: weapons
	Checksum: 0xA9064530
	Offset: 0x1888
	Size: 0x424
	Parameters: 1
	Flags: Linked
*/
function stow_on_back(current)
{
	currentweapon = self getcurrentweapon();
	currentaltweapon = currentweapon.altweapon;
	self.tag_stowed_back = undefined;
	weaponoptions = 0;
	index_weapon = level.weaponnone;
	if(isdefined(self.carryobject) && isdefined(self.carryobject gameobjects::get_visible_carrier_model()))
	{
		if(self.carryobject.identifier === #"hash_7044a4ac19b5324e")
		{
			return;
		}
		self.tag_stowed_back = self.carryobject gameobjects::get_visible_carrier_model();
		if(isdefined(self.carryobject.identifier) && self.carryobject.identifier == "resource_object")
		{
			self.var_9ed9707e = util::spawn_model(self.tag_stowed_back, self gettagorigin("tag_origin"));
			var_ce671f2b = self.carryobject.e_object.var_265cccf1;
			if(issubstr(var_ce671f2b, "medium"))
			{
				v_link_offset = (20, 15, 10);
				var_6a84bf5b = (0, 0, 0);
			}
			else if(var_ce671f2b === "heavy")
			{
				v_link_offset = (30, 0, 20);
				var_6a84bf5b = vectorscale((0, 1, 0), 90);
			}
			self.var_9ed9707e linkto(self, "tag_origin", v_link_offset, var_6a84bf5b);
			self.var_9ed9707e setplayercollision(0);
			self.tag_stowed_back = undefined;
		}
		else
		{
			self attach(self.tag_stowed_back, "tag_stowed_back", 1);
		}
		return;
	}
	if(currentweapon != level.weaponnone)
	{
		if(isarray(self.weapon_array_primary))
		{
			for(idx = 0; idx < self.weapon_array_primary.size; idx++)
			{
				temp_index_weapon = self.weapon_array_primary[idx];
				/#
					assert(isdefined(temp_index_weapon), "");
				#/
				if(temp_index_weapon == currentweapon)
				{
					continue;
				}
				if(temp_index_weapon == currentaltweapon)
				{
					continue;
				}
				if(temp_index_weapon.nonstowedweapon)
				{
					continue;
				}
				if(util::function_72cbea07(self, temp_index_weapon))
				{
					continue;
				}
				index_weapon = temp_index_weapon;
			}
		}
		if(index_weapon == level.weaponnone && isarray(self.weapon_array_sidearm))
		{
			for(idx = 0; idx < self.weapon_array_sidearm.size; idx++)
			{
				temp_index_weapon = self.weapon_array_sidearm[idx];
				/#
					assert(isdefined(temp_index_weapon), "");
				#/
				if(temp_index_weapon == currentweapon)
				{
					continue;
				}
				if(temp_index_weapon == currentaltweapon)
				{
					continue;
				}
				if(temp_index_weapon.nonstowedweapon)
				{
					continue;
				}
				index_weapon = temp_index_weapon;
			}
		}
	}
	self setstowedweapon(index_weapon);
}

/*
	Name: stow_on_hip
	Namespace: weapons
	Checksum: 0x36EAB5FC
	Offset: 0x1CB8
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function stow_on_hip()
{
	if(!isdefined(self.weapon_array_inventory))
	{
		return;
	}
	currentweapon = self getcurrentweapon();
	self.tag_stowed_hip = undefined;
	for(idx = 0; idx < self.weapon_array_inventory.size; idx++)
	{
		if(self.weapon_array_inventory[idx] == currentweapon)
		{
			continue;
		}
		if(!self getweaponammostock(self.weapon_array_inventory[idx]))
		{
			continue;
		}
		self.tag_stowed_hip = self.weapon_array_inventory[idx];
	}
	if(!isdefined(self.tag_stowed_hip))
	{
		return;
	}
	self attach(self.tag_stowed_hip.worldmodel, "tag_stowed_hip_rear", 1);
}

/*
	Name: weapondamagetracepassed
	Namespace: weapons
	Checksum: 0x62B32E5D
	Offset: 0x1DB8
	Size: 0x64
	Parameters: 4
	Flags: None
*/
function weapondamagetracepassed(from, to, startradius, ignore)
{
	trace = weapondamagetrace(from, to, startradius, ignore);
	return trace[#"fraction"] == 1;
}

/*
	Name: weapondamagetrace
	Namespace: weapons
	Checksum: 0x7AF2B47B
	Offset: 0x1E28
	Size: 0x1D8
	Parameters: 4
	Flags: Linked
*/
function weapondamagetrace(from, to, startradius, ignore)
{
	midpos = undefined;
	diff = to - from;
	if(lengthsquared(diff) < startradius * startradius)
	{
		midpos = to;
	}
	dir = vectornormalize(diff);
	midpos = from + (dir[0] * startradius, dir[1] * startradius, dir[2] * startradius);
	trace = bullettrace(midpos, to, 0, ignore);
	/#
		if(getdvarint(#"scr_damage_debug", 0) != 0)
		{
			if(trace[#"fraction"] == 1)
			{
				thread debug::drawdebugline(midpos, to, (1, 1, 1), 600);
			}
			else
			{
				thread debug::drawdebugline(midpos, trace[#"position"], (1, 0.9, 0.8), 600);
				thread debug::drawdebugline(trace[#"position"], to, (1, 0.4, 0.3), 600);
			}
		}
	#/
	return trace;
}

/*
	Name: has_lmg
	Namespace: weapons
	Checksum: 0x310864A4
	Offset: 0x2008
	Size: 0x38
	Parameters: 0
	Flags: Linked
*/
function has_lmg()
{
	weapon = self getcurrentweapon();
	return weapon.weapclass == "mg";
}

/*
	Name: has_launcher
	Namespace: weapons
	Checksum: 0x47BD4D00
	Offset: 0x2048
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function has_launcher()
{
	weapon = self getcurrentweapon();
	return weapon.isrocketlauncher;
}

/*
	Name: has_heavy_weapon
	Namespace: weapons
	Checksum: 0x1EF171B8
	Offset: 0x2080
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function has_heavy_weapon()
{
	weapon = self getcurrentweapon();
	return weapon.isheavyweapon;
}

/*
	Name: has_lockon
	Namespace: weapons
	Checksum: 0x7A1F9D40
	Offset: 0x20B8
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function has_lockon(target)
{
	player = self;
	clientnum = player getentitynumber();
	return isdefined(target.locked_on) && target.locked_on & (1 << clientnum);
}

/*
	Name: function_74bbb3fa
	Namespace: weapons
	Checksum: 0x5327B823
	Offset: 0x2120
	Size: 0x40
	Parameters: 3
	Flags: Linked
*/
function function_74bbb3fa(damage, weapon, target)
{
	if(target.var_eb19d8cb)
	{
		weapon = weapon * target.var_eb19d8cb;
	}
	return weapon;
}

