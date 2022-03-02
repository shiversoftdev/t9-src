#using script_4108035fe400ce67;
#using script_68d2ee1489345a1d;
#using script_7bafaa95bb1b427e;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\serverfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_2ed67032;

/*
	Name: function_e41a1412
	Namespace: namespace_2ed67032
	Checksum: 0x8039409
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e41a1412()
{
	level notify(440924494);
}

/*
	Name: function_89f2df9
	Namespace: namespace_2ed67032
	Checksum: 0x2907D96
	Offset: 0x120
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7aac5c09cf9461e3", &function_70a657d8, undefined, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_2ed67032
	Checksum: 0xAF815BFB
	Offset: 0x170
	Size: 0x124
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_8ef8b9e8 = getweapon(#"hash_9825a3f1d038c6f");
	clientfield::function_a8bbc967("hudItems.armorPlateCount", 1, 4, "int");
	clientfield::function_a8bbc967("hudItems.armorPlateMaxCarry", 1, 4, "int");
	callback::on_spawned(&on_player_spawned);
	callback::on_connect(&on_player_connect);
	callback::add_callback(#"on_loadout", &on_player_loadout);
	serverfield::register("armor_plate_behavior", 1, 1, "int", &function_deb3cb98);
}

/*
	Name: finalize
	Namespace: namespace_2ed67032
	Checksum: 0x9B31B526
	Offset: 0x2A0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private finalize()
{
	item_world::function_861f348d(#"generic_pickup", &function_e74225a7);
}

/*
	Name: function_deb3cb98
	Namespace: namespace_2ed67032
	Checksum: 0xBE3D12E0
	Offset: 0x2E0
	Size: 0x3E
	Parameters: 2
	Flags: None
*/
function function_deb3cb98(oldval, newval)
{
	if(!isplayer(self))
	{
		return;
	}
	self.var_8d801ee2 = newval;
}

/*
	Name: on_player_connect
	Namespace: namespace_2ed67032
	Checksum: 0xEF29A238
	Offset: 0x328
	Size: 0x5A
	Parameters: 0
	Flags: Private
*/
function private on_player_connect()
{
	if(!isdefined(self.var_8d801ee2))
	{
		self.var_8d801ee2 = (isdefined(self serverfield::get("armor_plate_behavior")) ? self serverfield::get("armor_plate_behavior") : 0);
	}
}

/*
	Name: on_player_spawned
	Namespace: namespace_2ed67032
	Checksum: 0x2094544
	Offset: 0x390
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private on_player_spawned()
{
	self.var_7d7d976a = 0;
	self.var_c52363ab = 5;
	self clientfield::set_player_uimodel("hudItems.armorPlateCount", self.var_7d7d976a);
	self clientfield::set_player_uimodel("hudItems.armorPlateMaxCarry", self.var_c52363ab);
}

/*
	Name: on_player_loadout
	Namespace: namespace_2ed67032
	Checksum: 0x3C40183E
	Offset: 0x400
	Size: 0x1A4
	Parameters: 0
	Flags: Private
*/
function private on_player_loadout()
{
	self giveweapon(level.var_8ef8b9e8);
	self function_28602a03(level.var_8ef8b9e8, 1, 1);
	if(is_true(getgametypesetting(#"hash_5700fdc9d17186f7")))
	{
		self armor::set_armor(225, 225, 3, 0.4, 1, 0.5, 0, 1, 1, 1);
	}
	self armor::set_armor(getgametypesetting(#"hash_64f2892e3a0fd0b") * 75, 225, 3, 0.4, 1, 0.5, 0, 1, 1, 1);
}

/*
	Name: function_e74225a7
	Namespace: namespace_2ed67032
	Checksum: 0x18D92529
	Offset: 0x5B0
	Size: 0xF0
	Parameters: 7
	Flags: Private
*/
function private function_e74225a7(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slot)
{
	if(itemcount.var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		var_82da4e0 = int(min(slot, self.var_c52363ab - var_aec6fa7f.var_7d7d976a));
		var_aec6fa7f.var_7d7d976a = var_aec6fa7f.var_7d7d976a + var_82da4e0;
		var_aec6fa7f clientfield::set_player_uimodel("hudItems.armorPlateCount", var_aec6fa7f.var_7d7d976a);
		return slot - var_82da4e0;
	}
	return slot;
}

/*
	Name: function_86b9a404
	Namespace: namespace_2ed67032
	Checksum: 0xA5DF4808
	Offset: 0x6A8
	Size: 0xC2
	Parameters: 0
	Flags: Private
*/
function private function_86b9a404()
{
	if(self isonladder() || self function_b4813488() || self inlaststand() || self isparachuting() || self isinfreefall() || self isskydiving())
	{
		return 0;
	}
	return self.var_7d7d976a > 0 && armor::function_4f977182() < 225;
}

/*
	Name: function_e12c220a
	Namespace: namespace_2ed67032
	Checksum: 0xCF82D401
	Offset: 0x778
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_e12c220a(var_16888a24)
{
	/#
		assert(isplayer(self));
	#/
	if(!isplayer(self))
	{
		return;
	}
	self.var_c52363ab = var_16888a24;
	self clientfield::set_player_uimodel("hudItems.armorPlateMaxCarry", self.var_c52363ab);
}

/*
	Name: function_d66636df
	Namespace: namespace_2ed67032
	Checksum: 0x3DDF5C6C
	Offset: 0x808
	Size: 0x114
	Parameters: 0
	Flags: Private
*/
function private function_d66636df()
{
	if(function_86b9a404())
	{
		self.var_7d7d976a = self.var_7d7d976a - 1;
		self clientfield::set_player_uimodel("hudItems.armorPlateCount", self.var_7d7d976a);
		var_8b8faf32 = armor::function_4f977182();
		var_3d557ef9 = var_8b8faf32 + 75;
		var_3d557ef9 = int(min(var_3d557ef9, 225));
		self armor::set_armor(var_3d557ef9, 225, 3, 0.4, 1, 0.5, 0, 1, 1, 1);
		return true;
	}
	return false;
}

/*
	Name: function_a7879258
	Namespace: namespace_2ed67032
	Checksum: 0x6327A6C2
	Offset: 0x928
	Size: 0x3C4
	Parameters: 1
	Flags: Private
*/
function private function_a7879258(lastweapon)
{
	self endon(#"disconnect");
	if(lastweapon === level.var_8ef8b9e8 || lastweapon === level.weaponnone)
	{
		lastweapon = undefined;
	}
	var_b2cde03b = function_ce353466(lastweapon);
	if(self getcurrentweapon() === level.var_8ef8b9e8 && !self isswitchingweapons())
	{
		self weapons::function_d571ac59(lastweapon, 0, 0, var_b2cde03b);
		return;
	}
	waitresult = undefined;
	waitresult = self waittilltimeout(2, #"weapon_change_complete", #"death", #"enter_vehicle", #"exit_vehicle");
	if(waitresult._notify !== #"weapon_change_complete")
	{
		self weapons::function_d571ac59(lastweapon, 0, 0, var_b2cde03b);
		return;
	}
	if(self getcurrentweapon() === level.var_8ef8b9e8)
	{
		if(!isdefined(self.var_8d801ee2))
		{
			self.var_8d801ee2 = (isdefined(self serverfield::get("armor_plate_behavior")) ? self serverfield::get("armor_plate_behavior") : 0);
		}
		self.var_6a0f2dd7 = 0;
		self.var_32b4a72a = 0;
		if(self.var_8d801ee2 != 1)
		{
			self thread function_c81e4a7c();
		}
		for(;;)
		{
			if(!function_86b9a404() || (self.var_32b4a72a === 1 && self.var_6a0f2dd7))
			{
				self weapons::function_d571ac59(lastweapon, 0, 0, var_b2cde03b);
				return;
			}
			waitresult = undefined;
			waitresult = self waittilltimeout(1.1, #"death", #"enter_vehicle", #"exit_vehicle");
			if(waitresult._notify !== #"timeout")
			{
				self weapons::function_d571ac59(lastweapon, 0, 0, var_b2cde03b);
				return;
			}
			if(self getcurrentweapon() !== level.var_8ef8b9e8 || self isdroppingweapon())
			{
				break;
			}
			if(function_d66636df())
			{
				self.var_6a0f2dd7 = 1;
			}
		}
	}
	else
	{
		return;
	}
	currentweapon = self getcurrentweapon();
	if(currentweapon === level.var_8ef8b9e8 || currentweapon === level.weaponnone)
	{
		self weapons::function_d571ac59(lastweapon, 0, 0, var_b2cde03b);
	}
}

/*
	Name: function_ce353466
	Namespace: namespace_2ed67032
	Checksum: 0x205AA490
	Offset: 0xCF8
	Size: 0xE8
	Parameters: 1
	Flags: Private
*/
function private function_ce353466(last_weapon)
{
	if(!isdefined(last_weapon) || last_weapon === level.weaponnone || last_weapon === level.var_8ef8b9e8)
	{
		return false;
	}
	if(!self hasweapon(last_weapon))
	{
		return false;
	}
	if(last_weapon === level.laststandpistol)
	{
		return false;
	}
	if(killstreaks::is_killstreak_weapon(last_weapon) && last_weapon.iscarriedkillstreak !== 1)
	{
		return false;
	}
	if(last_weapon.isgameplayweapon || last_weapon.var_29d24e37 || last_weapon.var_9a789947 || last_weapon.isnotdroppable)
	{
		return false;
	}
	return true;
}

/*
	Name: function_c81e4a7c
	Namespace: namespace_2ed67032
	Checksum: 0xC2C9CAF0
	Offset: 0xDE8
	Size: 0xBA
	Parameters: 0
	Flags: Private
*/
function private function_c81e4a7c()
{
	self endon(#"disconnect");
	self.var_32b4a72a = 0;
	while(isalive(self) && (self weaponswitchbuttonpressed() || self function_315b0f70()) && self getcurrentweapon() === level.var_8ef8b9e8 && !self isdroppingweapon())
	{
		waitframe(1);
	}
	self.var_32b4a72a = 1;
}

/*
	Name: function_62befac0
	Namespace: namespace_2ed67032
	Checksum: 0x980C4EE4
	Offset: 0xEB0
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event function_62befac0(eventstruct)
{
	if(eventstruct.weapon === level.var_8ef8b9e8)
	{
		self thread function_a7879258(eventstruct.last_weapon);
	}
}

