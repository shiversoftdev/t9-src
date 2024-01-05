#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace wz_loadouts;

/*
	Name: function_b25c541a
	Namespace: wz_loadouts
	Checksum: 0xE539BE0E
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b25c541a()
{
	level notify(-1889274902);
}

/*
	Name: __init__system__
	Namespace: wz_loadouts
	Checksum: 0x94E92E20
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_loadouts", &function_70a657d8, undefined, undefined, #"item_inventory");
}

/*
	Name: function_70a657d8
	Namespace: wz_loadouts
	Checksum: 0x506FC234
	Offset: 0x100
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	gametype = util::get_game_type();
	if(gametype !== #"warzone_hot_pursuit" && gametype !== #"warzone_heavy_metal" && gametype !== #"warzone_bigteam_dbno_quad")
	{
		return;
	}
	if((isdefined(getgametypesetting(#"hash_7d8c969e384dd1c9")) ? getgametypesetting(#"hash_7d8c969e384dd1c9") : 0))
	{
		level.var_5c14d2e6 = &function_3fed57dd;
	}
	if((isdefined(getgametypesetting(#"hash_4149d5d65eb07138")) ? getgametypesetting(#"hash_4149d5d65eb07138") : 0))
	{
		level.var_317fb13c = &function_3fed57dd;
		if(gametype === #"warzone_bigteam_dbno_quad")
		{
			level.var_317fb13c = &function_a9b8fa06;
		}
	}
}

/*
	Name: function_a9b8fa06
	Namespace: wz_loadouts
	Checksum: 0x2A675DB6
	Offset: 0x270
	Size: 0xB4
	Parameters: 0
	Flags: None
*/
function function_a9b8fa06()
{
	/#
		assert(isplayer(self));
	#/
	if(!isplayer(self) || !isalive(self))
	{
		return;
	}
	item_world::function_1b11e73c();
	while(isdefined(self) && !isdefined(self.inventory))
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	self function_7376c60d();
}

/*
	Name: function_3fed57dd
	Namespace: wz_loadouts
	Checksum: 0x20D76381
	Offset: 0x330
	Size: 0x1D2
	Parameters: 0
	Flags: None
*/
function function_3fed57dd()
{
	/#
		assert(isplayer(self));
	#/
	if(!isplayer(self) || !isalive(self))
	{
		return;
	}
	item_world::function_1b11e73c();
	while(isdefined(self) && !isdefined(self.inventory))
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(level.deathcircleindex))
	{
		self function_58190f52();
		return;
	}
	switch(level.deathcircleindex)
	{
		case 0:
		{
			self function_58190f52();
			break;
		}
		case 1:
		{
			self function_6667abef();
			break;
		}
		case 2:
		{
			self function_7376c60d();
			break;
		}
		case 3:
		{
			self function_1f091d2f();
			break;
		}
		case 4:
		{
			self function_2d31b980();
			break;
		}
		default:
		{
			self function_58190f52();
			break;
		}
	}
}

/*
	Name: function_52df229a
	Namespace: wz_loadouts
	Checksum: 0x5E1DC6CD
	Offset: 0x510
	Size: 0x174
	Parameters: 2
	Flags: None
*/
function function_52df229a(item_name, item_count)
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isstring(item_name) && !ishash(item_name))
	{
		/#
			assert(0);
		#/
		return;
	}
	item = item_world_util::function_49ce7663(item_name);
	if(isdefined(item_count) && isint(item_count))
	{
		if(item.var_a6762160.itemtype == #"ammo")
		{
			item.amount = item.var_a6762160.amount * item_count;
		}
		else
		{
			item.count = item_count;
		}
	}
	var_fa3df96 = self item_inventory::function_e66dcff5(item);
	self item_world::function_de2018e3(item, self, var_fa3df96);
}

/*
	Name: give_weapon
	Namespace: wz_loadouts
	Checksum: 0x3BE7F974
	Offset: 0x690
	Size: 0x25C
	Parameters: 2
	Flags: None
*/
function give_weapon(weaponname, attachmentnames)
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isstring(weaponname) && !ishash(weaponname))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(isdefined(attachmentnames) && !isarray(attachmentnames))
	{
		/#
			assert(0);
		#/
		return;
	}
	weapon = item_world_util::function_49ce7663(weaponname);
	var_fa3df96 = self item_inventory::function_e66dcff5(weapon);
	if(isdefined(attachmentnames))
	{
		weapon.attachments = [];
		foreach(attachmentname in attachmentnames)
		{
			if(!isstring(attachmentname) && !ishash(attachmentname))
			{
				/#
					assert(0);
				#/
				return;
			}
			attachment = item_world_util::function_49ce7663(attachmentname);
			namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
		}
		weapon.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(weapon));
	}
	self item_world::function_de2018e3(weapon, self, var_fa3df96);
}

/*
	Name: function_58190f52
	Namespace: wz_loadouts
	Checksum: 0x16FF8CD0
	Offset: 0x8F8
	Size: 0x124
	Parameters: 0
	Flags: Private
*/
function private function_58190f52()
{
	gametype = util::get_game_type();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad")
	{
		give_weapon(#"pistol_standard_t8_item");
		function_52df229a(#"ammo_type_45_item");
	}
	else
	{
		if(gametype == #"warzone_heavy_metal")
		{
			give_weapon(#"lmg_spray_t8_item");
			function_52df229a(#"ammo_type_556_item");
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_6667abef
	Namespace: wz_loadouts
	Checksum: 0x6122F091
	Offset: 0xA28
	Size: 0x1CC
	Parameters: 0
	Flags: Private
*/
function private function_6667abef()
{
	gametype = util::get_game_type();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad")
	{
		give_weapon(#"pistol_standard_t8_item", array(#"fastmag_wz_item", #"tritium_wz_item"));
		function_52df229a(#"ammo_type_45_item");
		function_52df229a(#"health_item_small", 5);
	}
	else
	{
		if(gametype == #"warzone_heavy_metal")
		{
			give_weapon(#"lmg_spray_t8_item", array(#"fastmag_wz_item", #"acog_wz_item"));
			function_52df229a(#"ammo_type_556_item");
			function_52df229a(#"health_item_large");
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_7376c60d
	Namespace: wz_loadouts
	Checksum: 0x98FD9A79
	Offset: 0xC00
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_7376c60d()
{
	gametype = util::get_game_type();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad")
	{
		give_weapon(#"smg_standard_t8_item");
		function_52df229a(#"ammo_type_9mm_item");
		function_52df229a(#"health_item_small", 5);
	}
	else
	{
		if(gametype == #"warzone_heavy_metal")
		{
			give_weapon(#"lmg_standard_t8_item");
			function_52df229a(#"ammo_type_762_item");
			function_52df229a(#"health_item_large", 2);
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_1f091d2f
	Namespace: wz_loadouts
	Checksum: 0x86599E79
	Offset: 0xD80
	Size: 0x22C
	Parameters: 0
	Flags: Private
*/
function private function_1f091d2f()
{
	gametype = util::get_game_type();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad")
	{
		give_weapon(#"smg_standard_t8_item", array(#"laser_sight_wz_item"));
		function_52df229a(#"ammo_type_9mm_item");
		function_52df229a(#"health_item_small", 5);
		function_52df229a(#"armor_item_small");
		function_52df229a(#"armor_shard_item", 5);
	}
	else
	{
		if(gametype == #"warzone_heavy_metal")
		{
			give_weapon(#"lmg_standard_t8_item", array(#"fastmag_wz_item", #"acog_wz_item"));
			function_52df229a(#"ammo_type_762_item");
			function_52df229a(#"health_item_large", 3);
			function_52df229a(#"armor_item_large");
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_2d31b980
	Namespace: wz_loadouts
	Checksum: 0x9AC50909
	Offset: 0xFB8
	Size: 0x284
	Parameters: 0
	Flags: Private
*/
function private function_2d31b980()
{
	gametype = util::get_game_type();
	if(gametype == #"warzone_hot_pursuit" || gametype == #"warzone_bigteam_dbno_quad")
	{
		give_weapon(#"smg_standard_t8_item", array(#"holo_wz_item", #"laser_sight_wz_item", #"extbarrel_wz_item"));
		function_52df229a(#"ammo_type_9mm_item");
		function_52df229a(#"health_item_small", 5);
		function_52df229a(#"armor_item_medium");
		function_52df229a(#"armor_shard_item", 5);
	}
	else
	{
		if(gametype == #"warzone_heavy_metal")
		{
			give_weapon(#"lmg_standard_t8_item", array(#"extmag_wz_item", #"reddot_wz_item", #"extbarrel_wz_item"));
			function_52df229a(#"ammo_type_762_item");
			function_52df229a(#"health_item_large", 3);
			function_52df229a(#"armor_item_large");
			function_52df229a(#"armor_shard_item", 5);
		}
		else if(gametype == #"hash_135cf8c5c6396f04")
		{
			function_f56a5599();
		}
	}
}

/*
	Name: function_f56a5599
	Namespace: wz_loadouts
	Checksum: 0x80EA2B9E
	Offset: 0x1248
	Size: 0x104
	Parameters: 0
	Flags: Private
*/
function private function_f56a5599()
{
	give_weapon(#"lmg_stealth_t8_item");
	give_weapon(#"ar_peacekeeper_t8_item");
	function_52df229a(#"ammo_type_556_item", 2);
	function_52df229a(#"health_item_squad", 5);
	function_52df229a(#"armor_item_medium");
	function_52df229a(#"dart_wz_item", 5);
	function_52df229a(#"ultimate_turret_wz_item", 5);
}

