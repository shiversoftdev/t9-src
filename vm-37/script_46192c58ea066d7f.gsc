#using script_471b31bd963b388e;
#using script_4ba46a0f73534383;
#using script_6c8abe14025b47c4;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\clientfield_shared.gsc;

#namespace namespace_234f0efc;

/*
	Name: init
	Namespace: namespace_234f0efc
	Checksum: 0xFAAA78BF
	Offset: 0xC0
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_a27256f0 = &function_a27256f0;
}

/*
	Name: function_a27256f0
	Namespace: namespace_234f0efc
	Checksum: 0xFA0E2191
	Offset: 0xE8
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_a27256f0(killstreaktype)
{
	self function_d5766919(0);
}

/*
	Name: drop_armor
	Namespace: namespace_234f0efc
	Checksum: 0xA191FE5D
	Offset: 0x118
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function drop_armor(var_4c42f7cf)
{
	/#
		assert(isplayer(self));
	#/
	var_d90e0e15 = function_4ba8fde(#"hash_fb37841b0d2d7e7");
	for(index = 0; index < self.var_7d7d976a; index++)
	{
		level thread item_drop::function_7910964d(var_4c42f7cf + index, undefined, 1, 0, var_d90e0e15.id, self.origin, (0, randomintrange(0, 360), 0), 2);
	}
	return var_4c42f7cf + index;
}

/*
	Name: function_d912fa6e
	Namespace: namespace_234f0efc
	Checksum: 0x37A2CC01
	Offset: 0x208
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_d912fa6e(player)
{
	/#
		assert(isplayer(player));
	#/
	return player.var_c52363ab == 10;
}

/*
	Name: function_dd8cb464
	Namespace: namespace_234f0efc
	Checksum: 0x22144B5F
	Offset: 0x258
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function function_dd8cb464(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slot)
{
	if(!function_d912fa6e(slot))
	{
		slot namespace_2ed67032::function_e12c220a(10);
		return true;
	}
	return false;
}

/*
	Name: function_b31f892b
	Namespace: namespace_234f0efc
	Checksum: 0x1FBD3119
	Offset: 0x2E0
	Size: 0xD6
	Parameters: 1
	Flags: None
*/
function function_b31f892b(var_4c42f7cf)
{
	/#
		assert(isplayer(self));
	#/
	index = 0;
	if(function_d912fa6e(self))
	{
		var_d90e0e15 = function_4ba8fde("armor_pouch_item_t9");
		level thread item_drop::function_7910964d(var_4c42f7cf + index, undefined, 1, 0, var_d90e0e15.id, self.origin, (0, randomintrange(0, 360), 0), 2);
		index++;
	}
	return var_4c42f7cf + index;
}

/*
	Name: function_d5766919
	Namespace: namespace_234f0efc
	Checksum: 0xC83832B9
	Offset: 0x3C0
	Size: 0x312
	Parameters: 1
	Flags: None
*/
function function_d5766919(var_4c42f7cf)
{
	/#
		assert(isplayer(self));
	#/
	weapons = self getweaponslist();
	index = 0;
	foreach(weapon in weapons)
	{
		var_16f12c31 = namespace_ad5a0cd6::function_3531b9ba(weapon.name);
		if(!isdefined(var_16f12c31))
		{
			continue;
		}
		ammo = self getweaponammostock(weapon);
		hasammo = ammo > 0;
		if(hasammo)
		{
			var_d90e0e15 = function_4ba8fde(var_16f12c31);
			killstreakbundle = getscriptbundle(var_d90e0e15.var_a6762160.killstreak);
			killstreaks::take(killstreakbundle.var_d3413870);
			var_f8ffe143 = 0;
			if(killstreakbundle.var_fc0c8eae.name == #"inventory_recon_car")
			{
				if(self hasweapon(killstreakbundle.var_1ab696c6))
				{
					var_f8ffe143 = 1;
				}
			}
			else if(killstreakbundle.var_fc0c8eae.name == #"inventory_planemortar")
			{
				ammo = (isdefined(self.pers[#"hash_1aaccfe69e328d6e"][3]) ? self.pers[#"hash_1aaccfe69e328d6e"][3] : 3);
			}
			if(!var_f8ffe143)
			{
				level thread item_drop::function_7910964d(var_4c42f7cf + index, undefined, 1, ammo, var_d90e0e15.id, self.origin, (0, randomintrange(0, 360), 0), 2);
				index++;
			}
			self takeweapon(weapon);
		}
	}
	self.pers[#"killstreaks"] = [];
	return var_4c42f7cf + index;
}

/*
	Name: function_e50b5cec
	Namespace: namespace_234f0efc
	Checksum: 0x9CDC765A
	Offset: 0x6E0
	Size: 0x114
	Parameters: 1
	Flags: None
*/
function function_e50b5cec(var_4c42f7cf)
{
	/#
		assert(isplayer(self));
	#/
	var_6a4efe8e = self clientfield::get_player_uimodel("hud_items.selfReviveAvailable");
	if(var_6a4efe8e)
	{
		self clientfield::set_player_uimodel("hud_items.selfReviveAvailable", 0);
		var_d90e0e15 = function_4ba8fde(#"hash_b8b2580ac5556e1");
		level thread item_drop::function_7910964d(var_4c42f7cf + 1, undefined, 1, 0, var_d90e0e15.id, self.origin, (0, randomintrange(0, 360), 0), 2);
		return var_4c42f7cf + 1;
	}
	return var_4c42f7cf;
}

