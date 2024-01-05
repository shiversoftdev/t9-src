#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace perks;

/*
	Name: __init__system__
	Namespace: perks
	Checksum: 0xF2C244CE
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2af3fdb587243686", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: perks
	Checksum: 0xD616C13D
	Offset: 0x188
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register_clientuimodel("hudItems.ammoCooldowns.equipment.tactical", 1, 5, "float", 0);
	clientfield::register_clientuimodel("hudItems.ammoCooldowns.equipment.lethal", 1, 5, "float", 0);
	callback::on_spawned(&on_player_spawned);
	level.var_b8e083d0 = &function_b8e083d0;
}

/*
	Name: perk_setperk
	Namespace: perks
	Checksum: 0xC9305325
	Offset: 0x220
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function perk_setperk(str_perk)
{
	if(!isdefined(self.var_fb3c9d6a))
	{
		self.var_fb3c9d6a = [];
	}
	if(!isdefined(self.var_fb3c9d6a[str_perk]))
	{
		self.var_fb3c9d6a[str_perk] = 0;
	}
	/#
		assert(self.var_fb3c9d6a[str_perk] >= 0, "");
	#/
	/#
		assert(self.var_fb3c9d6a[str_perk] < 23, "");
	#/
	self.var_fb3c9d6a[str_perk]++;
	self setperk(str_perk);
}

/*
	Name: perk_unsetperk
	Namespace: perks
	Checksum: 0xED68E9A0
	Offset: 0x300
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function perk_unsetperk(str_perk)
{
	if(!isdefined(self.var_fb3c9d6a))
	{
		self.var_fb3c9d6a = [];
	}
	if(!isdefined(self.var_fb3c9d6a[str_perk]))
	{
		self.var_fb3c9d6a[str_perk] = 0;
	}
	self.var_fb3c9d6a[str_perk]--;
	/#
		assert(self.var_fb3c9d6a[str_perk] >= 0, "");
	#/
	if(self.var_fb3c9d6a[str_perk] <= 0)
	{
		self unsetperk(str_perk);
	}
}

/*
	Name: perk_hasperk
	Namespace: perks
	Checksum: 0x71434E84
	Offset: 0x3C0
	Size: 0x4A
	Parameters: 1
	Flags: Linked
*/
function perk_hasperk(str_perk)
{
	if(isdefined(self.var_fb3c9d6a) && isdefined(self.var_fb3c9d6a[str_perk]) && self.var_fb3c9d6a[str_perk] > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: perk_reset_all
	Namespace: perks
	Checksum: 0xF14DBAA7
	Offset: 0x418
	Size: 0x26
	Parameters: 0
	Flags: Linked
*/
function perk_reset_all()
{
	self clearperks();
	self.var_fb3c9d6a = [];
}

/*
	Name: on_player_spawned
	Namespace: perks
	Checksum: 0x269872BE
	Offset: 0x448
	Size: 0x44
	Parameters: 0
	Flags: Linked, Private
*/
function private on_player_spawned()
{
	self clientfield::set_player_uimodel("hudItems.ammoCooldowns.equipment.tactical", 0);
	self clientfield::set_player_uimodel("hudItems.ammoCooldowns.equipment.lethal", 0);
}

/*
	Name: function_4776caf4
	Namespace: perks
	Checksum: 0xC59345BB
	Offset: 0x498
	Size: 0x244
	Parameters: 1
	Flags: Private, Event
*/
event private function_4776caf4(eventstruct)
{
	weapon = eventstruct.weapon;
	if(isplayer(self) && self hasperk("specialty_equipmentrecharge") && (weapon.offhandslot == "Lethal grenade" || weapon.offhandslot == "Tactical grenade"))
	{
		self endon(#"death");
		waittillframeend();
		if(is_true(eventstruct.projectile.throwback) || !isalive(self))
		{
			return;
		}
		var_acddd81e = isdefined(weapon.var_7d4c12af) && weapon.var_7d4c12af != "None";
		var_e0ca50e9 = {#hash_acddd81e:var_acddd81e, #weapon:weapon, #slot:weapon.offhandslot};
		if(!isdefined(self.var_7cedc725))
		{
			self.var_7cedc725 = [];
		}
		else if(!isarray(self.var_7cedc725))
		{
			self.var_7cedc725 = array(self.var_7cedc725);
		}
		self.var_7cedc725[self.var_7cedc725.size] = var_e0ca50e9;
		cf = (var_e0ca50e9.slot == "Lethal grenade" ? "hudItems.ammoCooldowns.equipment.lethal" : "hudItems.ammoCooldowns.equipment.tactical");
		self clientfield::set_player_uimodel(cf, 0);
		if(self.var_7cedc725.size == 1)
		{
			self thread function_78976b52();
		}
	}
}

/*
	Name: function_7d697841
	Namespace: perks
	Checksum: 0x6246CFD6
	Offset: 0x6E8
	Size: 0x224
	Parameters: 1
	Flags: Private, Event
*/
event private function_7d697841(eventstruct)
{
	player = eventstruct.entity;
	weapon = eventstruct.weapon;
	if(level.var_222e62a6 === 1)
	{
		if(isplayer(player) && weapon.name == #"eq_stimshot")
		{
			player thread function_845e1139();
		}
	}
	else if(isplayer(player) && player hasperk("specialty_equipmentrecharge") && weapon.name == #"eq_stimshot")
	{
		var_e0ca50e9 = {#hash_acddd81e:0, #weapon:weapon, #slot:weapon.offhandslot};
		if(!isdefined(player.var_7cedc725))
		{
			player.var_7cedc725 = [];
		}
		else if(!isarray(player.var_7cedc725))
		{
			player.var_7cedc725 = array(player.var_7cedc725);
		}
		player.var_7cedc725[player.var_7cedc725.size] = var_e0ca50e9;
		cf = (var_e0ca50e9.slot == "Lethal grenade" ? "hudItems.ammoCooldowns.equipment.lethal" : "hudItems.ammoCooldowns.equipment.tactical");
		player clientfield::set_player_uimodel(cf, 0);
		if(player.var_7cedc725.size == 1)
		{
			player thread function_78976b52();
		}
	}
}

/*
	Name: function_845e1139
	Namespace: perks
	Checksum: 0x1EA20C16
	Offset: 0x918
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private function_845e1139()
{
	self endoncallback(&function_c2b5717d, #"death", #"resupply");
	self clientfield::set_player_uimodel("hudItems.ammoCooldowns.equipment.tactical", 0);
	success = self function_e5f5216f("hudItems.ammoCooldowns.equipment.tactical");
	if(is_true(success))
	{
		weapon = getweapon(#"eq_stimshot");
		if(self hasweapon(weapon))
		{
			currentcount = self getammocount(weapon);
			if(currentcount < self function_b7f1fd2c(weapon))
			{
				self setweaponammoclip(weapon, currentcount + 1);
			}
		}
	}
	self clientfield::set_player_uimodel("hudItems.ammoCooldowns.equipment.tactical", 0);
}

/*
	Name: function_78976b52
	Namespace: perks
	Checksum: 0x72D335EF
	Offset: 0xA78
	Size: 0x266
	Parameters: 0
	Flags: Linked, Private
*/
function private function_78976b52()
{
	self endoncallback(&function_4ed3bc25, #"death", #"resupply");
	offhandslot = self.var_7cedc725[0].slot;
	weapon = self.var_7cedc725[0].weapon;
	cf = (offhandslot == "Lethal grenade" ? "hudItems.ammoCooldowns.equipment.lethal" : "hudItems.ammoCooldowns.equipment.tactical");
	success = self function_691948bf(cf);
	if(is_true(success))
	{
		arrayremoveindex(self.var_7cedc725, 0);
		if(self hasweapon(weapon))
		{
			currentoffhand = weapon;
		}
		else
		{
			if(offhandslot == "Lethal grenade")
			{
				var_396a7de9 = self function_826ed2dd();
			}
			else
			{
				var_396a7de9 = getweapon(self function_b958b70d(self.class_num, "secondarygrenade"));
			}
			if(self hasweapon(var_396a7de9))
			{
				currentoffhand = var_396a7de9;
			}
		}
		if(isdefined(currentoffhand))
		{
			currentcount = self getammocount(currentoffhand);
			if(currentcount < self function_b7f1fd2c(currentoffhand))
			{
				self setweaponammoclip(currentoffhand, currentcount + 1);
			}
		}
	}
	self clientfield::set_player_uimodel(cf, 0);
	if(self.var_7cedc725.size)
	{
		self thread function_78976b52();
		return;
	}
	self.var_7cedc725 = undefined;
}

/*
	Name: function_e5f5216f
	Namespace: perks
	Checksum: 0xEB71D38B
	Offset: 0xCE8
	Size: 0x100
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e5f5216f(cf)
{
	rechargetime = getdvarint(#"hash_72fe00ba2b98e139", 11);
	elapsedtime = 0;
	starttime = gettime();
	while(elapsedtime < rechargetime)
	{
		progress = elapsedtime / rechargetime;
		self clientfield::set_player_uimodel(cf, progress);
		waitframe(1);
		elapsedtime = (float(gettime() - starttime)) / 1000;
	}
	self playsoundtoplayer(#"hash_23df0ddc8d4048a2", self);
	self clientfield::set_player_uimodel("hudItems.ammoCooldowns.equipment.tactical", 1);
	return true;
}

/*
	Name: function_691948bf
	Namespace: perks
	Checksum: 0x3FEFEA4A
	Offset: 0xDF0
	Size: 0x150
	Parameters: 1
	Flags: Linked, Private
*/
function private function_691948bf(cf)
{
	self endon(#"hash_5c998eb8e3fcffe5");
	rechargetime = getdvarint(#"hash_3d104eb411be9f06", 25);
	elapsedtime = 0;
	starttime = gettime();
	while(elapsedtime < rechargetime)
	{
		progress = elapsedtime / rechargetime;
		self clientfield::set_player_uimodel(cf, progress);
		waitframe(1);
		elapsedtime = gettime() - starttime;
		elapsedtime = float(elapsedtime) / 1000;
	}
	sound = (cf == "hudItems.ammoCooldowns.equipment.lethal" ? #"hash_6d4b6b0490117874" : #"hash_23df0ddc8d4048a2");
	self playsoundtoplayer(sound, self);
	self clientfield::set_player_uimodel(cf, 1);
	return true;
}

/*
	Name: function_b8e083d0
	Namespace: perks
	Checksum: 0x537AC516
	Offset: 0xF48
	Size: 0xFE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b8e083d0(weapon)
{
	if(isdefined(self.var_7cedc725))
	{
		for(i = 0; i < self.var_7cedc725.size; i++)
		{
			if(weapon == self.var_7cedc725[i].weapon)
			{
				if(i == 0)
				{
					if(self.var_7cedc725.size > 1)
					{
						for(j = 1; j < self.var_7cedc725.size; j++)
						{
							if(weapon == self.var_7cedc725[j].weapon)
							{
								arrayremoveindex(self.var_7cedc725, j);
								return;
							}
						}
					}
					self notify(#"hash_5c998eb8e3fcffe5");
				}
				arrayremoveindex(self.var_7cedc725, i);
				return;
			}
		}
	}
}

/*
	Name: function_4ed3bc25
	Namespace: perks
	Checksum: 0x7AAF95D4
	Offset: 0x1050
	Size: 0x7E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4ed3bc25(notifyhash)
{
	offhandslot = self.var_7cedc725[0].slot;
	cf = (offhandslot == "Lethal grenade" ? "hudItems.ammoCooldowns.equipment.lethal" : "hudItems.ammoCooldowns.equipment.tactical");
	self clientfield::set_player_uimodel(cf, 0);
	self.var_7cedc725 = undefined;
}

/*
	Name: function_c2b5717d
	Namespace: perks
	Checksum: 0x27D90E05
	Offset: 0x10D8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c2b5717d(notifyhash)
{
	self clientfield::set_player_uimodel("hudItems.ammoCooldowns.equipment.tactical", 0);
}

