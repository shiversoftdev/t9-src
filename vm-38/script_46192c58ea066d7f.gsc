#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using script_4ba46a0f73534383;
#using script_6c8abe14025b47c4;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_234f0efc;

/*
	Name: function_41fccd45
	Namespace: namespace_234f0efc
	Checksum: 0xBBCE8BC3
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_41fccd45()
{
	level notify(2023891420);
}

/*
	Name: function_89f2df9
	Namespace: namespace_234f0efc
	Checksum: 0xEB3C0873
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_296b16535a22f50f", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_234f0efc
	Checksum: 0xB1454A01
	Offset: 0x180
	Size: 0x2C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::function_a8bbc967("hudItems.radiationVestHealth", 1, 5, "float");
}

/*
	Name: init
	Namespace: namespace_234f0efc
	Checksum: 0x15D67768
	Offset: 0x1B8
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
	Checksum: 0xC1FE2AC6
	Offset: 0x1E0
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
	Checksum: 0x5BB0223F
	Offset: 0x210
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
	Checksum: 0xC56AE3CB
	Offset: 0x300
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
	Checksum: 0x2E836C23
	Offset: 0x350
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
	Checksum: 0x6ED353E1
	Offset: 0x3D8
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
	Checksum: 0x24DB3A1F
	Offset: 0x4B8
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
	Checksum: 0x43555228
	Offset: 0x7D8
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

/*
	Name: function_aecae28d
	Namespace: namespace_234f0efc
	Checksum: 0x17DF13FC
	Offset: 0x8F8
	Size: 0x148
	Parameters: 1
	Flags: None
*/
function function_aecae28d(damage)
{
	if(!isplayer(self))
	{
		return damage;
	}
	if(self.var_1181c08b <= 0)
	{
		return damage;
	}
	var_babbb09b = 0;
	var_e67d2721 = damage - self.var_dba54111;
	if(var_e67d2721 < 0)
	{
		var_e67d2721 = 0;
	}
	self.var_1181c08b = self.var_1181c08b - var_e67d2721;
	if(self.var_1181c08b < 0)
	{
		var_babbb09b = self.var_1181c08b;
	}
	self.var_1181c08b = max(self.var_1181c08b, 0);
	if(self.var_1181c08b == 0)
	{
		self.var_dba54111 = 0;
		self.var_4a1cb171 = 0;
	}
	var_db01f8df = (self.var_4a1cb171 <= 0 ? 0 : self.var_1181c08b / self.var_4a1cb171);
	self clientfield::set_player_uimodel("hudItems.radiationVestHealth", var_db01f8df);
	return var_babbb09b;
}

/*
	Name: function_b0000c15
	Namespace: namespace_234f0efc
	Checksum: 0x8FF1A28
	Offset: 0xA48
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function function_b0000c15()
{
	/#
		assert(isplayer(self));
	#/
	self.var_1181c08b = 0;
	self.var_dba54111 = 0;
	self.var_4a1cb171 = 0;
	self clientfield::set_player_uimodel("hudItems.radiationVestHealth", 0);
}

/*
	Name: function_98942433
	Namespace: namespace_234f0efc
	Checksum: 0xD7E6E14A
	Offset: 0xAC0
	Size: 0x102
	Parameters: 7
	Flags: None
*/
function function_98942433(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slot)
{
	if(function_36b9f4fe(slot))
	{
		return false;
	}
	slot clientfield::set_player_uimodel("hudItems.radiationVestHealth", 1);
	slot.var_1181c08b = (isdefined(var_aec6fa7f.var_a6762160.var_1181c08b) ? var_aec6fa7f.var_a6762160.var_1181c08b : 0);
	slot.var_4a1cb171 = slot.var_1181c08b;
	slot.var_dba54111 = (isdefined(var_aec6fa7f.var_a6762160.var_dba54111) ? var_aec6fa7f.var_a6762160.var_dba54111 : 0);
	return true;
}

/*
	Name: function_36b9f4fe
	Namespace: namespace_234f0efc
	Checksum: 0x7DE612AD
	Offset: 0xBD0
	Size: 0x58
	Parameters: 1
	Flags: None
*/
function function_36b9f4fe(player)
{
	/#
		assert(isplayer(player));
	#/
	return player clientfield::get_player_uimodel("hudItems.radiationVestHealth") >= 1;
}

/*
	Name: function_72a7b6cf
	Namespace: namespace_234f0efc
	Checksum: 0xB5BBAE9A
	Offset: 0xC30
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function function_72a7b6cf(player)
{
	/#
		assert(isplayer(player));
	#/
	return player clientfield::get_player_uimodel("hudItems.radiationVestHealth") > 0;
}

/*
	Name: function_8d066de9
	Namespace: namespace_234f0efc
	Checksum: 0x137148E4
	Offset: 0xC90
	Size: 0xB4
	Parameters: 4
	Flags: None
*/
function function_8d066de9(var_feb0fc80, var_27ad329a, var_40f483c8, var_212c9055)
{
	level endon(#"game_ended");
	level.var_f8299840 = var_feb0fc80;
	level.var_9d86498a = var_27ad329a;
	level.var_c121bd48 = var_40f483c8;
	level.var_a17d47bf = var_212c9055;
	level waittill(#"hash_38a387462f3a9ad");
	level thread function_588a586d(#"hash_3aa45f7379bfb316", level.var_f8299840);
}

/*
	Name: function_588a586d
	Namespace: namespace_234f0efc
	Checksum: 0x921D3C8A
	Offset: 0xD50
	Size: 0x1C4
	Parameters: 2
	Flags: None
*/
function function_588a586d(targetname, probability)
{
	level flag::wait_till(#"hash_38a387462f3a9ad");
	probability = (isdefined(probability) ? probability : level.var_f8299840);
	dynents = item_world::function_7a0c5d2e(probability, targetname);
	var_b0d9d129 = spawnstruct();
	var_81e77cec = [];
	var_d73eec3b = [];
	foreach(dynent in dynents)
	{
		dynent.onuse = &chest_opened;
		if(function_ffdbe8c2(dynent) == 3)
		{
			var_81e77cec[var_81e77cec.size] = dynent;
			continue;
		}
		var_d73eec3b[var_d73eec3b.size] = dynent;
	}
	var_81e77cec = array::randomize(var_81e77cec);
	var_b0d9d129.targetname = targetname;
	var_b0d9d129.var_81e77cec = var_81e77cec;
	var_b0d9d129.var_d73eec3b = var_d73eec3b;
	level thread function_361e7925(var_b0d9d129);
}

/*
	Name: function_657c0cbf
	Namespace: namespace_234f0efc
	Checksum: 0x62490CCA
	Offset: 0xF20
	Size: 0x22C
	Parameters: 2
	Flags: None
*/
function function_657c0cbf(container, var_b0d9d129)
{
	level endon(#"game_ended");
	wait(level.var_a17d47bf);
	item_world::function_160294c7(container);
	wait(randomintrange(level.var_9d86498a, level.var_c121bd48));
	if(var_b0d9d129.var_81e77cec.size <= 0)
	{
		return;
	}
	if(isdefined(var_b0d9d129.var_81e77cec[0].var_b91441dd.var_7fb0967b))
	{
		var_b9ea4e83 = sqr(var_b0d9d129.var_81e77cec[0].var_b91441dd.var_7fb0967b);
		for(var_8017ce8 = 0; var_8017ce8 < var_b0d9d129.var_81e77cec.size; var_8017ce8++)
		{
			var_da1a8a8a = var_b0d9d129.var_81e77cec[var_8017ce8];
			var_9bf5a850 = 1;
			for(var_31371606 = 0; var_31371606 < var_b0d9d129.var_d73eec3b.size; var_31371606++)
			{
				var_f51e9342 = var_b0d9d129.var_d73eec3b[var_31371606];
				if(distancesquared(var_da1a8a8a.origin, var_f51e9342.origin) < var_b9ea4e83)
				{
					var_9bf5a850 = 0;
					break;
				}
			}
			if(var_9bf5a850)
			{
				break;
			}
			var_da1a8a8a = undefined;
		}
	}
	if(!isdefined(var_da1a8a8a))
	{
		var_da1a8a8a = var_b0d9d129.var_81e77cec[0];
	}
	arrayremoveindex(var_b0d9d129.var_81e77cec, 0, 0);
	item_world::function_8eee98dd(var_da1a8a8a);
	var_da1a8a8a.onuse = &chest_opened;
	var_b0d9d129.var_d73eec3b[var_b0d9d129.var_d73eec3b.size] = var_da1a8a8a;
}

/*
	Name: function_361e7925
	Namespace: namespace_234f0efc
	Checksum: 0x4FDB621A
	Offset: 0x1158
	Size: 0xB0
	Parameters: 1
	Flags: None
*/
function function_361e7925(var_b0d9d129)
{
	level endon(#"game_ended");
	while(true)
	{
		container = undefined;
		container = level waittill(var_b0d9d129.targetname + "_opened");
		arrayremovevalue(var_b0d9d129.var_d73eec3b, container, 0);
		var_b0d9d129.var_81e77cec[var_b0d9d129.var_81e77cec.size] = container;
		level thread function_657c0cbf(container, var_b0d9d129);
	}
}

/*
	Name: chest_opened
	Namespace: namespace_234f0efc
	Checksum: 0x63E2AF1
	Offset: 0x1210
	Size: 0x5E
	Parameters: 3
	Flags: None
*/
function chest_opened(activator, laststate, state)
{
	if(state == 2)
	{
		level notify((isdefined(self.targetname) ? self.targetname : self.target) + "_opened", self);
	}
}

