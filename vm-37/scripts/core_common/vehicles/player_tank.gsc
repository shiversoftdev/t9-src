#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_40fc784c60f9fa7b;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace player_tank;

/*
	Name: __init__system__
	Namespace: player_tank
	Checksum: 0x4D9184FD
	Offset: 0x1E0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"player_tank", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: player_tank
	Checksum: 0x6508D58B
	Offset: 0x230
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_tank", &function_c0f1d81b);
	clientfield::register("scriptmover", "tank_deathfx", 1, 1, "int");
	clientfield::register("vehicle", "tank_shellejectfx", 1, 1, "int");
}

/*
	Name: function_c0f1d81b
	Namespace: player_tank
	Checksum: 0x3371D8D9
	Offset: 0x2C8
	Size: 0x19C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c0f1d81b()
{
	self setmovingplatformenabled(1, 0);
	self.var_84fed14b = 0;
	self.var_d6691161 = 0;
	self.var_5d662124 = 2;
	self.var_3daa0191 = &function_b61c27bb;
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_96f5d31b);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_cd8db309);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_b8458486);
	callback::function_d8abfc3d(#"hash_551381cffdc79048", &function_ed6455e7);
	callback::function_d8abfc3d(#"on_vehicle_damage", &on_vehicle_damage);
	callback::function_d8abfc3d(#"on_vehicle_killed", &function_4366bf50);
	self thread player_vehicle::function_5bce3f3a(1, 100);
}

/*
	Name: function_b61c27bb
	Namespace: player_tank
	Checksum: 0x90E2DB79
	Offset: 0x470
	Size: 0x234
	Parameters: 15
	Flags: Linked, Private
*/
function private function_b61c27bb(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	occupants = self getvehoccupants();
	if(isdefined(occupants))
	{
		foreach(occupant in occupants)
		{
			if(isplayer(occupant) && !isbot(occupant))
			{
				damagepct = modelindex / self.maxhealth;
				damagepct = int(max(damagepct, 3));
				damagedirection = undefined;
				if(isdefined(damagefromunderneath) || isdefined(psoffsettime))
				{
					if(isdefined(psoffsettime) && (partname === "MOD_RIFLE_BULLET" || partname === "MOD_PISTOL_BULLET"))
					{
						damagedirection = vectornormalize(occupant.origin - psoffsettime.origin);
					}
					else
					{
						damagedirection = vsurfacenormal;
					}
				}
				occupant addtodamageindicator(damagepct, damagedirection);
				break;
			}
		}
	}
}

/*
	Name: function_ed6455e7
	Namespace: player_tank
	Checksum: 0x656AAB56
	Offset: 0x6B0
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ed6455e7(params)
{
	if(!isalive(self))
	{
		return;
	}
	driver = self getseatoccupant(0);
	if(!isdefined(driver))
	{
		return;
	}
	if(isvehicle(params.entity) && params.entity.scriptvehicletype !== "player_tank")
	{
		array::add(self.var_9be5a571, params.entity, 0);
	}
}

/*
	Name: function_53f7a11f
	Namespace: player_tank
	Checksum: 0x39E41485
	Offset: 0x770
	Size: 0x22E
	Parameters: 1
	Flags: Linked
*/
function function_53f7a11f(player)
{
	self notify("67adb1131f66ca42");
	self endon("67adb1131f66ca42");
	self endon(#"death");
	player endon(#"death", #"exit_vehicle", #"change_seat");
	while(true)
	{
		self.overridevehicledamage = undefined;
		if(self.var_9be5a571.size > 0)
		{
			for(i = self.var_9be5a571.size - 1; i >= 0; i--)
			{
				vehicle = self.var_9be5a571[i];
				if(isvehicle(vehicle))
				{
					dist = distance2dsquared(self.origin, vehicle.origin);
					if(dist >= 64000)
					{
						arrayremovevalue(self.var_9be5a571, vehicle);
						continue;
					}
					z_dist = self.origin[2] - vehicle.origin[2];
					if(z_dist > 0 && dist <= 9000)
					{
						if(isalive(vehicle))
						{
							self.overridevehicledamage = &function_eed77231;
							vehicle.var_369c83bd = 1;
							vehicle.var_475b9991 = 1;
							vehicle.var_c0381a15 = 1;
							vehicle dodamage(vehicle.health, self.origin, player, self);
						}
						arrayremovevalue(self.var_9be5a571, vehicle);
					}
				}
			}
		}
		waitframe(1);
	}
}

/*
	Name: function_4366bf50
	Namespace: player_tank
	Checksum: 0x9BAFEF82
	Offset: 0x9A8
	Size: 0x354
	Parameters: 1
	Flags: Linked
*/
function function_4366bf50(params)
{
	eattacker = params.eattacker;
	weapon = params.weapon;
	if(isdefined(self.team) && isdefined(eattacker.team) && self.team != #"neutral" && util::function_fbce7263(self.team, eattacker.team) && self getvehoccupants().size > 0)
	{
		scoreevents::processscoreevent(#"destroyed_tank", eattacker, undefined, weapon);
	}
	deathmodel = spawn("script_model", self.origin + vectorscale((0, 0, 1), 80));
	deathmodel setmodel(#"hash_311c24b6407eaa02");
	deathmodel.angles = self function_bc2f1cb8(0);
	side_offset = getdvarint(#"hash_2163abe439abdd44", 5);
	right_offset = randomintrange(side_offset * -1, side_offset);
	var_a20a7474 = getdvarint(#"hash_3ad1ffe3739de420", 10);
	forward = anglestoforward(deathmodel.angles);
	right = anglestoright(deathmodel.angles);
	contact_point = deathmodel.origin;
	contact_point = contact_point + (forward * var_a20a7474);
	contact_point = contact_point + (right * right_offset);
	var_f0436c8a = getdvarint(#"hash_7a9d06ee19067d4f", 150);
	var_da0636d8 = getdvarint(#"hash_7a81f4ee18ef9701", 180);
	var_9a1e332d = randomintrange(var_f0436c8a, var_da0636d8);
	deathmodel physicslaunch(contact_point, (0, 0, var_9a1e332d));
	deathmodel clientfield::set("tank_deathfx", 1);
	deathmodel waittilltimeout(20, #"death");
	if(isdefined(deathmodel))
	{
		deathmodel deletedelay();
	}
}

/*
	Name: function_96f5d31b
	Namespace: player_tank
	Checksum: 0xE4BE85E1
	Offset: 0xD08
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_96f5d31b(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index === 0)
	{
		self function_11397df9(player);
	}
	self thread function_2014e301(player);
}

/*
	Name: function_cd8db309
	Namespace: player_tank
	Checksum: 0x6C648E18
	Offset: 0xD98
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cd8db309(params)
{
	eventstruct = params.eventstruct;
	player = params.player;
	if(eventstruct.seat_index === 0)
	{
		self function_eba4498a(player);
	}
}

/*
	Name: function_b8458486
	Namespace: player_tank
	Checksum: 0x1DEF2FC8
	Offset: 0xE00
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_b8458486(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index === 0)
	{
		self function_11397df9(player);
		self thread function_2014e301(player);
	}
	else
	{
		self function_eba4498a(player);
	}
}

/*
	Name: function_44f6c97c
	Namespace: player_tank
	Checksum: 0x7521D199
	Offset: 0xEA8
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_44f6c97c()
{
	self endon(#"death");
	self notify("23492c7aa9350f27");
	self endon("23492c7aa9350f27");
	wait(0.5);
	self vehicle::toggle_control_bone_group(1, 1);
	self playsound("veh_tank_shell_hatch_open");
	wait(0.5);
	self clientfield::set("tank_shellejectfx", 1);
	wait(1.25);
	self clientfield::set("tank_shellejectfx", 0);
	self vehicle::toggle_control_bone_group(1, 0);
	self playsound("veh_tank_shell_hatch_close");
}

/*
	Name: function_2014e301
	Namespace: player_tank
	Checksum: 0x83CDE534
	Offset: 0xFB8
	Size: 0x130
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2014e301(player)
{
	player endon(#"hash_27646c99772610b4", #"death", #"exit_vehicle");
	self endon(#"death");
	while(true)
	{
		self waittill(#"weapon_fired");
		if(!is_true(self.var_1bc57b69))
		{
			self thread function_44f6c97c();
		}
		var_3212abd9 = self seatgetweapon(0);
		var_610cfafc = int(var_3212abd9.reloadtime * 1000);
		player setvehicleweaponwaitduration(var_610cfafc);
		player setvehicleweaponwaitendtime(gettime() + var_610cfafc);
	}
}

/*
	Name: function_11397df9
	Namespace: player_tank
	Checksum: 0xDD684F26
	Offset: 0x10F0
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function function_11397df9(player)
{
	if(!isdefined(self.var_9be5a571))
	{
		self.var_9be5a571 = [];
	}
	player.overrideplayerdamage = &function_7daf5af2;
	self thread function_53f7a11f(player);
}

/*
	Name: function_eba4498a
	Namespace: player_tank
	Checksum: 0x30E1483F
	Offset: 0x1150
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_eba4498a(player)
{
	self.overridevehicledamage = undefined;
	if(isdefined(player))
	{
		player.overrideplayerdamage = undefined;
		player notify(#"hash_27646c99772610b4");
	}
}

/*
	Name: on_vehicle_damage
	Namespace: player_tank
	Checksum: 0x99E7D263
	Offset: 0x1198
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private on_vehicle_damage(params)
{
	if(isplayer(params.eattacker) && params.eattacker isinvehicle() && params.smeansofdeath === "MOD_PROJECTILE")
	{
		self playsound(#"hash_301ede6e928927f2");
	}
}

/*
	Name: function_eed77231
	Namespace: player_tank
	Checksum: 0x9A32D94E
	Offset: 0x1228
	Size: 0x104
	Parameters: 15
	Flags: Linked, Private
*/
function private function_eed77231(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	damage = partname;
	if(isplayer(modelindex))
	{
		var_284da85d = modelindex getvehicleoccupied();
		if(var_284da85d === self)
		{
			if(isvehicle(damagefromunderneath) && vsurfacenormal === "MOD_EXPLOSIVE")
			{
				damage = 0;
			}
		}
	}
	return damage;
}

/*
	Name: function_7daf5af2
	Namespace: player_tank
	Checksum: 0xF9C2D984
	Offset: 0x1338
	Size: 0x128
	Parameters: 16
	Flags: Linked, Private
*/
function private function_7daf5af2(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
{
	damage = partname;
	vehicle = self getvehicleoccupied();
	if(!isvehicle(vehicle) || !isalive(vehicle))
	{
		return damage;
	}
	if(vsurfacenormal === "MOD_DEATH_CIRCLE")
	{
		return damage;
	}
	if(vsurfacenormal === "MOD_TRIGGER_HURT")
	{
		return damage;
	}
	damage = 0;
	return damage;
}

