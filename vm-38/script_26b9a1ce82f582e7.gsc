#using script_40fc784c60f9fa7b;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;

#namespace namespace_dff38fd8;

/*
	Name: function_aa22e29e
	Namespace: namespace_dff38fd8
	Checksum: 0xEA71D341
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_aa22e29e()
{
	level notify(901384963);
}

/*
	Name: function_89f2df9
	Namespace: namespace_dff38fd8
	Checksum: 0x7B41510B
	Offset: 0x110
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5899c013879294b7", &function_70a657d8, undefined, undefined, #"player_vehicle");
}

/*
	Name: function_70a657d8
	Namespace: namespace_dff38fd8
	Checksum: 0xB3947D77
	Offset: 0x160
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	vehicle::add_main_callback("player_pbr", &function_cc0af45d);
	setdvar(#"phys_buoyancy", 1);
}

/*
	Name: function_cc0af45d
	Namespace: namespace_dff38fd8
	Checksum: 0x182ACA3B
	Offset: 0x1C0
	Size: 0x184
	Parameters: 0
	Flags: Linked, Private
*/
function private function_cc0af45d()
{
	self setmovingplatformenabled(1, 0);
	callback::function_d8abfc3d(#"hash_666d48a558881a36", &function_b65217f6);
	callback::function_d8abfc3d(#"hash_55f29e0747697500", &function_674b9c5b);
	callback::function_d8abfc3d(#"hash_2c1cafe2a67dfef8", &function_f2626e5f);
	callback::function_d8abfc3d(#"hash_551381cffdc79048", &function_ca11d4c2);
	self.var_3daa0191 = &function_b61c27bb;
	self.var_96c0f900 = [];
	self.var_96c0f900[1] = 1000;
	self.var_96c0f900[2] = 1000;
	self thread player_vehicle::function_5bce3f3a(0, 1000);
	self thread player_vehicle::function_5bce3f3a(1, 1000);
	self thread player_vehicle::function_5bce3f3a(2, 1000);
}

/*
	Name: function_b61c27bb
	Namespace: namespace_dff38fd8
	Checksum: 0x268D5339
	Offset: 0x350
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
	Name: function_b65217f6
	Namespace: namespace_dff38fd8
	Checksum: 0xE8D28302
	Offset: 0x590
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_b65217f6(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index === 0)
	{
		self function_eb39313f(player);
	}
	self thread player_vehicle::function_e8e41bbb();
}

/*
	Name: function_674b9c5b
	Namespace: namespace_dff38fd8
	Checksum: 0xF2B19884
	Offset: 0x620
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_674b9c5b(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(eventstruct.seat_index === 0)
	{
		self function_77fbc7d9(player);
	}
}

/*
	Name: function_f2626e5f
	Namespace: namespace_dff38fd8
	Checksum: 0x9746CCC6
	Offset: 0x688
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_f2626e5f(params)
{
	player = params.player;
	eventstruct = params.eventstruct;
	if(!isdefined(player))
	{
		return;
	}
	if(eventstruct.seat_index === 0)
	{
		self function_eb39313f(player);
	}
	else
	{
		self function_77fbc7d9(player);
	}
}

/*
	Name: function_ca11d4c2
	Namespace: namespace_dff38fd8
	Checksum: 0x228224A4
	Offset: 0x718
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ca11d4c2(params)
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
	if(isvehicle(params.entity) && params.entity.scriptvehicletype !== "player_pbr")
	{
		array::add(self.var_9be5a571, params.entity, 0);
	}
}

/*
	Name: function_eb39313f
	Namespace: namespace_dff38fd8
	Checksum: 0x43C4136A
	Offset: 0x7D8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_eb39313f(player)
{
	if(!isdefined(self.var_9be5a571))
	{
		self.var_9be5a571 = [];
	}
	self thread function_53f7a11f(player);
}

/*
	Name: function_77fbc7d9
	Namespace: namespace_dff38fd8
	Checksum: 0x2BE2B8A
	Offset: 0x820
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function function_77fbc7d9(player)
{
	self.overridevehicledamage = undefined;
	if(isdefined(player))
	{
		player notify(#"hash_2c76be993516dda2");
	}
}

/*
	Name: function_53f7a11f
	Namespace: namespace_dff38fd8
	Checksum: 0xCA23B0D
	Offset: 0x858
	Size: 0x236
	Parameters: 1
	Flags: Linked
*/
function function_53f7a11f(player)
{
	self notify("638241f01faa741a");
	self endon("638241f01faa741a");
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
					if(dist >= 80000)
					{
						arrayremovevalue(self.var_9be5a571, vehicle);
						continue;
					}
					z_dist = self.origin[2] - vehicle.origin[2];
					if(z_dist > 0 && dist <= 9000)
					{
						if(isalive(vehicle))
						{
							self.overridevehicledamage = &function_786eff5d;
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
	Name: function_786eff5d
	Namespace: namespace_dff38fd8
	Checksum: 0x793A969D
	Offset: 0xA98
	Size: 0x104
	Parameters: 15
	Flags: Linked, Private
*/
function private function_786eff5d(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal)
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

