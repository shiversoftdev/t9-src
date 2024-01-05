#using script_4dc6a9b234b838e1;
#using script_2f9a68261f6a17be;
#using script_6951ea86fdae9ae0;
#using scripts\zm_common\trials\zm_trial_restrict_loadout.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using script_62caa307a394c18c;
#using script_5f261a5d57de5f7c;
#using scripts\core_common\throttle_shared.gsc;
#using script_35598499769dbb3d;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_perk_slider;

/*
	Name: function_39239882
	Namespace: zm_perk_slider
	Checksum: 0xD47A2D84
	Offset: 0x2C0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_39239882()
{
	level notify(-1379583820);
}

/*
	Name: __init__system__
	Namespace: zm_perk_slider
	Checksum: 0x255B04CD
	Offset: 0x2E0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_perk_slider", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_perk_slider
	Checksum: 0x45F29FEE
	Offset: 0x338
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(getgametypesetting(#"hash_4b8929fb898a9e80")))
	{
		return;
	}
	level.var_bc9564f4 = new class_c6c0e94();
	[[ level.var_bc9564f4 ]]->initialize(#"hash_184ea4de3979541", 1, float(function_60d95f53()) / 1000);
	enable_slider_perk_for_level();
}

/*
	Name: function_8ac3bea9
	Namespace: zm_perk_slider
	Checksum: 0x80F724D1
	Offset: 0x3F8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: enable_slider_perk_for_level
	Namespace: zm_perk_slider
	Checksum: 0xDADC560F
	Offset: 0x408
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function enable_slider_perk_for_level()
{
	zm_perks::register_perk_basic_info(#"hash_3417450e1347185", #"perk_slider", 2000, #"zombie/perk_slider", getweapon("zombie_perk_bottle_slider"), undefined, #"zmperksphdslider");
	zm_perks::register_perk_precache_func(#"hash_3417450e1347185", &function_1781c013);
	zm_perks::register_perk_clientfields(#"hash_3417450e1347185", &function_5ba17a72, &function_90f58801);
	zm_perks::register_perk_machine(#"hash_3417450e1347185", &function_ef14badb, &init_slider);
	zm_perks::register_perk_host_migration_params(#"hash_3417450e1347185", "vending_slider", "slider_light");
	zm_perks::register_perk_threads(#"hash_3417450e1347185", &function_1d4d3034, &function_ae56fb1a);
	zm_perks::register_perk_damage_override_func(&function_9e712df);
}

/*
	Name: init_slider
	Namespace: zm_perk_slider
	Checksum: 0x80F724D1
	Offset: 0x5C0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_slider()
{
}

/*
	Name: function_1781c013
	Namespace: zm_perk_slider
	Checksum: 0xF901F49F
	Offset: 0x5D0
	Size: 0x106
	Parameters: 0
	Flags: Linked
*/
function function_1781c013()
{
	level._effect[#"slider_light"] = "zombie/fx9_perk_phd_slider";
	level.machine_assets[#"hash_3417450e1347185"] = spawnstruct();
	level.machine_assets[#"hash_3417450e1347185"].weapon = getweapon("zombie_perk_bottle_slider");
	level.machine_assets[#"hash_3417450e1347185"].off_model = "p9_sur_machine_phd_slider";
	level.machine_assets[#"hash_3417450e1347185"].on_model = "p9_sur_machine_phd_slider";
	level.machine_assets[#"hash_3417450e1347185"].power_on_callback = &function_c60d9d72;
}

/*
	Name: function_5ba17a72
	Namespace: zm_perk_slider
	Checksum: 0x87ED97F0
	Offset: 0x6E0
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_5ba17a72()
{
	clientfield::register("toplayer", "slide_fx", 17000, 1, "int");
	if(zm_utility::is_classic())
	{
		clientfield::register("scriptmover", "phd_slider_machine_rob_poweron", 17000, 1, "int");
		clientfield::register("scriptmover", "phd_slider_machine_rob_purchase", 17000, 1, "counter");
	}
}

/*
	Name: function_90f58801
	Namespace: zm_perk_slider
	Checksum: 0xFA74F57A
	Offset: 0x790
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_90f58801(state)
{
}

/*
	Name: function_c60d9d72
	Namespace: zm_perk_slider
	Checksum: 0x81E9CA95
	Offset: 0x7A8
	Size: 0x54
	Parameters: 0
	Flags: Linked
*/
function function_c60d9d72()
{
	level endon(#"end_game");
	self.use_func = &function_5fd3f2ba;
	self clientfield::set("phd_slider_machine_rob_poweron", 1);
}

/*
	Name: function_5fd3f2ba
	Namespace: zm_perk_slider
	Checksum: 0xD304D798
	Offset: 0x808
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_5fd3f2ba(player)
{
	self endon(#"death");
	self clientfield::increment("phd_slider_machine_rob_purchase", 1);
}

/*
	Name: function_ef14badb
	Namespace: zm_perk_slider
	Checksum: 0x3239347B
	Offset: 0x858
	Size: 0x9A
	Parameters: 4
	Flags: Linked
*/
function function_ef14badb(use_trigger, perk_machine, bump_trigger, collision)
{
	perk_machine.script_sound = "mus_perks_phd_jingle";
	perk_machine.script_string = "phd_slider_perk";
	perk_machine.script_label = "mus_perks_phd_sting";
	perk_machine.target = "vending_slider";
	bump_trigger.script_string = "phd_slider_perk";
	bump_trigger.targetname = "vending_slider";
	if(isdefined(collision))
	{
		collision.script_string = "phd_slider_perk";
	}
}

/*
	Name: function_1d4d3034
	Namespace: zm_perk_slider
	Checksum: 0x64C6E6D7
	Offset: 0x900
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_1d4d3034()
{
	self thread function_dc9a257a();
	if(namespace_e86ffa8::function_582d36be(5))
	{
		self thread function_815172d1();
	}
}

/*
	Name: function_ae56fb1a
	Namespace: zm_perk_slider
	Checksum: 0xEF0D499A
	Offset: 0x958
	Size: 0x46
	Parameters: 4
	Flags: Linked
*/
function function_ae56fb1a(b_pause, str_perk, str_result, n_slot)
{
	self notify(#"hash_6939dd7af68cec");
	self notify(#"hash_19d583212e9b3200");
}

/*
	Name: function_dc9a257a
	Namespace: zm_perk_slider
	Checksum: 0x94A73038
	Offset: 0x9A8
	Size: 0x198
	Parameters: 0
	Flags: Linked
*/
function function_dc9a257a()
{
	self notify(#"hash_6939dd7af68cec");
	self endon(#"disconnect", #"hash_6939dd7af68cec");
	self.var_287f4e8 = undefined;
	while(true)
	{
		self waittill(#"slide_begin");
		v_start_position = self.origin;
		tag_fx = (self haspart("tag_fx") ? "tag_fx" : "tag_origin");
		self clientfield::set_to_player("slide_fx", 1);
		self playsound(#"hash_80b7cd28685b769");
		self.var_f354086e = 0;
		self thread function_d2991c92(v_start_position);
		self waittill(#"slide_end");
		self clientfield::set_to_player("slide_fx", 0);
		self.var_287f4e8 = undefined;
		self stopsound(#"hash_80b7cd28685b769");
		self playsound(#"hash_66ded3093973b658");
	}
}

/*
	Name: function_d2991c92
	Namespace: zm_perk_slider
	Checksum: 0x24E6D132
	Offset: 0xB48
	Size: 0x1B0
	Parameters: 1
	Flags: Linked
*/
function function_d2991c92(v_start_position)
{
	self endon(#"death", #"hash_6939dd7af68cec");
	while(self issliding())
	{
		n_distance = distance(v_start_position, self.origin);
		self.var_f354086e = self.var_f354086e + n_distance;
		if(self.var_f354086e >= 32)
		{
			var_6c77565b = self getenemiesinradius(self.origin, 64);
			var_6c77565b = arraysortclosest(var_6c77565b, self.origin);
			if(isarray(var_6c77565b) && var_6c77565b.size >= 1)
			{
				if(isalive(var_6c77565b[0]))
				{
					var_b61c0138 = bullettracepassed(self.origin, var_6c77565b[0].origin, 0, var_6c77565b[0]);
					if(var_b61c0138)
					{
						self setvelocity((0, 0, 0));
						self slide_explosion(self.var_f354086e);
						return;
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: slide_explosion
	Namespace: zm_perk_slider
	Checksum: 0xDDAD9F6
	Offset: 0xD00
	Size: 0x14C
	Parameters: 2
	Flags: Linked
*/
function slide_explosion(var_980edc69, var_8b77e4de)
{
	if(!isdefined(var_8b77e4de))
	{
		var_8b77e4de = 0;
	}
	var_a25d1f0 = 0;
	explosion_radius = 0;
	if(var_980edc69 < 64)
	{
		explosion_radius = 64;
		var_a25d1f0 = 150;
	}
	else
	{
		if(var_980edc69 < 128 && var_980edc69 >= 64)
		{
			explosion_radius = 96;
			var_a25d1f0 = 200;
		}
		else
		{
			if(var_980edc69 < 256 && var_980edc69 >= 128)
			{
				explosion_radius = 128;
				var_a25d1f0 = 250;
			}
			else
			{
				if(var_980edc69 < 512 && var_980edc69 >= 256)
				{
					explosion_radius = 256;
					var_a25d1f0 = 300;
				}
				else if(var_980edc69 >= 512)
				{
					explosion_radius = 256;
					var_a25d1f0 = 350;
				}
			}
		}
	}
	if(!is_true(self.var_287f4e8))
	{
		self thread function_4d806c6a(var_a25d1f0, explosion_radius, var_8b77e4de);
	}
}

/*
	Name: function_4d806c6a
	Namespace: zm_perk_slider
	Checksum: 0x2B27458D
	Offset: 0xE58
	Size: 0x95A
	Parameters: 3
	Flags: Linked
*/
function function_4d806c6a(var_a25d1f0, explosion_radius, var_8b77e4de)
{
	if(!isdefined(var_a25d1f0))
	{
		var_a25d1f0 = 25;
	}
	if(!isdefined(explosion_radius))
	{
		explosion_radius = 64;
	}
	if(!isdefined(var_8b77e4de))
	{
		var_8b77e4de = 0;
	}
	self endon(#"death");
	self notify("3620da51b4cca731");
	self endon("3620da51b4cca731");
	self.var_287f4e8 = 1;
	if(self isinvehicle())
	{
		var_b498a002 = 128;
		vehicle = self getvehicleoccupied();
		trace = groundtrace(vehicle.origin + (0, 0, var_b498a002), vehicle.origin - (0, 0, var_b498a002), 0, vehicle, 1, 1);
	}
	else
	{
		var_b498a002 = 64;
		trace = groundtrace(self.origin + (0, 0, var_b498a002), self.origin - (0, 0, var_b498a002), 0, self, 1, 1);
	}
	if(isdefined(trace[#"position"]))
	{
		explosion_pos = trace[#"position"];
	}
	else
	{
		explosion_pos = (self.origin[0], self.origin[1], self.origin[2] + 16);
	}
	forward = anglestoforward(self.angles);
	forward = vectornormalize(forward);
	forward = vectorscale(forward, 64);
	explosion_pos = explosion_pos + forward;
	var_c37cb40 = 1;
	switch(explosion_radius)
	{
		case 64:
		{
			playfx(#"hash_7d2bc89d5f26531", explosion_pos, forward, (0, 0, 1));
			playsoundatposition(#"hash_e74488608c9e54b", explosion_pos + vectorscale((0, 0, 1), 30));
			break;
		}
		case 96:
		{
			var_c37cb40 = 2;
			playfx(#"hash_7dd3089d5fb7ed2", explosion_pos, forward, (0, 0, 1));
			playsoundatposition(#"hash_20bca686136afed1", explosion_pos + vectorscale((0, 0, 1), 30));
			break;
		}
		case 128:
		{
			var_c37cb40 = 2;
			playfx(#"hash_7e74089d603ee87", explosion_pos, forward, (0, 0, 1));
			playsoundatposition(#"hash_20bca686136afed1", explosion_pos + vectorscale((0, 0, 1), 30));
			break;
		}
		case 256:
		{
			var_c37cb40 = 2;
			playfx(#"hash_2cf4993681bf5b51", explosion_pos, forward, (0, 0, 1));
			playsoundatposition(#"hash_2b37bc8619de96ec", explosion_pos + vectorscale((0, 0, 1), 30));
			break;
		}
	}
	if(isarray(level.var_eda01097))
	{
		arrayremovevalue(level.var_eda01097, undefined);
		if(level.var_eda01097.size != 0)
		{
			foreach(entity in level.var_eda01097)
			{
				if(isvec(entity.origin) && distance2d(self.origin, entity.origin) < explosion_radius && var_8b77e4de)
				{
					entity notify(#"hash_81e93f0d0293b61", {#attacker:self, #damage:var_a25d1f0, #mod:"MOD_EXPLOSIVE"});
				}
			}
		}
	}
	var_6c77565b = self getenemiesinradius(self.origin, explosion_radius);
	var_6c77565b = arraysortclosest(var_6c77565b, self.origin);
	var_b61c0138 = 1;
	foreach(zombie in var_6c77565b)
	{
		if(i > var_6c77565b.size / 2)
		{
			var_b61c0138 = bullettracepassed(self.origin, zombie.origin, 0, zombie);
		}
		if(isalive(zombie) && var_b61c0138)
		{
			var_4ce7aa6d = 0;
			if(zm_utility::is_survival())
			{
				var_a25d1f0 = zm_equipment::function_739fbb72(var_a25d1f0, undefined, zombie.var_6f84b820, zombie.maxhealth);
			}
			else
			{
				var_a25d1f0 = zm_equipment::function_379f6b5d(var_a25d1f0, undefined, zombie.var_6f84b820, zombie.maxhealth);
			}
			if(var_a25d1f0 >= zombie.health)
			{
				if(zombie.var_6f84b820 === #"normal")
				{
					var_4ce7aa6d = 1;
				}
				zombie.var_390850ac = 1;
			}
			zombie namespace_42457a0::function_601fabe9(#"explosive", var_a25d1f0, zombie.origin, self, undefined, "none", "MOD_UNKNOWN", 0, level.weaponnone);
			if(var_4ce7aa6d)
			{
				zombie namespace_cc411409::function_706a56ae(explosion_pos, var_c37cb40);
				zombie thread function_3fb4ce3b();
			}
			else if(var_8b77e4de)
			{
				zombie zombie_utility::setup_zombie_knockdown(explosion_pos);
			}
		}
		var_be7c9b40 = {};
		[[ level.var_bc9564f4 ]]->waitinqueue(var_be7c9b40);
	}
	if(var_8b77e4de)
	{
		var_6c77565b = self getenemiesinradius(self.origin, explosion_radius * 2);
		foreach(zombie in var_6c77565b)
		{
			if(isalive(zombie) && !is_true(zombie.var_390850ac))
			{
				zombie zombie_utility::setup_zombie_knockdown(explosion_pos);
			}
		}
	}
	self.var_287f4e8 = undefined;
}

/*
	Name: function_3fb4ce3b
	Namespace: zm_perk_slider
	Checksum: 0xDA3AE6CD
	Offset: 0x17C0
	Size: 0x84
	Parameters: 0
	Flags: Linked
*/
function function_3fb4ce3b()
{
	util::wait_network_frame();
	if(isdefined(self))
	{
		if(self.health < -300)
		{
			if(math::cointoss())
			{
				gibserverutils::annihilate(self);
			}
			else
			{
				self zombie_utility::gib_random_parts();
			}
		}
		else
		{
			self zombie_utility::gib_random_parts();
		}
	}
}

/*
	Name: function_9e712df
	Namespace: zm_perk_slider
	Checksum: 0xBFC06568
	Offset: 0x1850
	Size: 0xC2
	Parameters: 10
	Flags: Linked
*/
function function_9e712df(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(self namespace_e86ffa8::function_582d36be(1) && self issliding())
	{
		if(psoffsettime == "MOD_TRIGGER_HURT" || psoffsettime == "MOD_BURNED" || psoffsettime == "MOD_DOT")
		{
			return false;
		}
	}
}

/*
	Name: function_de916514
	Namespace: zm_perk_slider
	Checksum: 0x70441C0C
	Offset: 0x1920
	Size: 0x54
	Parameters: 1
	Flags: Event
*/
event function_de916514(eventstruct)
{
	if(zm_utility::is_survival() && isplayer(self))
	{
		self thread function_55fdc82d(eventstruct.vehicle);
	}
}

/*
	Name: function_feb0a2aa
	Namespace: zm_perk_slider
	Checksum: 0x2CF13795
	Offset: 0x1980
	Size: 0x4E
	Parameters: 1
	Flags: Event
*/
event function_feb0a2aa(eventstruct)
{
	if(zm_utility::is_survival() && isplayer(self))
	{
		self notify(#"hash_49c8852035063bfd");
	}
}

/*
	Name: function_55fdc82d
	Namespace: zm_perk_slider
	Checksum: 0xC357DED5
	Offset: 0x19D8
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_55fdc82d(vehicle)
{
	self endon(#"death", #"disconnect", #"hash_49c8852035063bfd");
	while(true)
	{
		vehicle waittill(#"veh_inair");
		self.var_6d563065 = 1;
		vehicle waittill(#"veh_landed");
		self.var_6d563065 = undefined;
	}
}

/*
	Name: function_815172d1
	Namespace: zm_perk_slider
	Checksum: 0xD671B4C1
	Offset: 0x1A78
	Size: 0x3C4
	Parameters: 0
	Flags: Linked
*/
function function_815172d1()
{
	self endon(#"death", #"disconnect", #"hash_19d583212e9b3200");
	var_be3643e6 = 0;
	while(true)
	{
		self.var_e9571d8b = undefined;
		onground = 1;
		if(self isinvehicle())
		{
			if(is_true(self.var_6d563065))
			{
				onground = 0;
			}
		}
		else if(!isdefined(self getgroundent()))
		{
			onground = 0;
		}
		while(!onground && !self isparachuting() && !self function_b4813488())
		{
			if(!var_be3643e6)
			{
				var_be3643e6 = 1;
				self.var_af850774 = 0;
				var_62a70da1 = self.origin[2];
			}
			else if(var_62a70da1 < self.origin[2])
			{
				var_62a70da1 = self.origin[2];
			}
			waitframe(1);
			onground = 1;
			if(self isinvehicle())
			{
				if(is_true(self.var_6d563065))
				{
					onground = 0;
				}
			}
			else if(!isdefined(self getgroundent()))
			{
				onground = 0;
			}
		}
		if(self isparachuting() || self function_b4813488())
		{
			var_be3643e6 = 0;
		}
		if(var_be3643e6 && !self isparachuting() && !self function_b4813488())
		{
			self.var_e9571d8b = max(0, var_62a70da1 - self.origin[2]);
			var_be3643e6 = 0;
			if(self.var_e9571d8b > 128)
			{
				if(self.var_e9571d8b >= 128 && self.var_e9571d8b < (128 + 32))
				{
					self slide_explosion(64, 1);
				}
				else
				{
					if(self.var_e9571d8b >= (128 + 32) && self.var_e9571d8b < (128 + (32 * 2)))
					{
						self slide_explosion(128, 1);
					}
					else
					{
						if(self.var_e9571d8b >= (128 + (32 * 2)) && self.var_e9571d8b < (128 + (32 * 3)))
						{
							self slide_explosion(256, 1);
						}
						else if(self.var_e9571d8b >= (128 + (32 * 3)))
						{
							self slide_explosion(512, 1);
						}
					}
				}
			}
			waitframe(1);
		}
		waitframe(1);
	}
}

