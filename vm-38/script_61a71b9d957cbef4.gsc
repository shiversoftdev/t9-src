#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;

#namespace namespace_ba4f7a20;

/*
	Name: function_b35d21e2
	Namespace: namespace_ba4f7a20
	Checksum: 0xA65AEF
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b35d21e2()
{
	level notify(-14764661);
}

/*
	Name: function_8c49355e
	Namespace: namespace_ba4f7a20
	Checksum: 0xC7F2FD53
	Offset: 0x118
	Size: 0x6DC
	Parameters: 0
	Flags: AutoExec
*/
function autoexec function_8c49355e()
{
	if(isdefined(level.var_ebf9c160))
	{
		return;
	}
	level.var_ebf9c160 = [];
	level.var_ebf9c160[#"eq_slow_grenade"] = #"hash_234815c9f71b452d";
	level.var_ebf9c160[#"eq_flash_grenade"] = #"hash_676aa70930960427";
	level.var_ebf9c160[#"frag_grenade"] = #"hash_29548403dc2ff36d";
	level.var_ebf9c160[#"hatchet"] = #"hash_73b7240912c1f754";
	level.var_ebf9c160[#"eq_molotov"] = #"hash_6d0e3a9a902d2201";
	level.var_ebf9c160[#"satchel_charge"] = #"hash_281638550b45be2a";
	level.var_ebf9c160[#"eq_sticky_grenade"] = #"hash_732cfbea10210169";
	level.var_ebf9c160[#"willy_pete"] = #"hash_7126c22f114c7382";
	level.var_ebf9c160[#"gadget_jammer"] = #"hash_3f154f45479130ed";
	level.var_ebf9c160[#"land_mine"] = #"hash_2c9b75b17410f2de";
	level.var_ebf9c160[#"tear_gas"] = #"hash_5f67f7b32b01ae53";
	level.var_ebf9c160[#"hash_455c48edddb3a457"] = #"hash_70827bb0890deb43";
	level.var_ebf9c160[#"hash_457e3eedddd079bf"] = #"hash_70827bb0890deb43";
	level.var_ebf9c160[#"hash_22fd2b0ed330a3d4"] = #"hash_1e1f0e613c0e08da";
	level.var_ebf9c160[#"hash_2348290ed3708be8"] = #"hash_1e1f0e613c0e08da";
	level.var_ebf9c160[#"hash_1b4c269b5a2c7cca"] = #"hash_70dc4c4ac95659ec";
	level.var_ebf9c160[#"hash_1b02189b59ee2c86"] = #"hash_70dc4c4ac95659ec";
	level.var_ebf9c160[#"hash_2728af291a906d67"] = #"hash_610beb0316617e7f";
	level.var_ebf9c160[#"hash_26dda5291a5070ef"] = #"hash_610beb0316617e7f";
	level.var_ebf9c160[#"hash_2189719c57fda8c5"] = #"hash_2054151f3619703d";
	level.var_ebf9c160[#"hash_219e7b9c581015cd"] = #"hash_2054151f3619703d";
	level.var_ebf9c160[#"hash_765b9959bc318ff8"] = #"hash_72d83f9cbd5a3066";
	level.var_ebf9c160[#"hash_76a69759bc71780c"] = #"hash_72d83f9cbd5a3066";
	level.var_ebf9c160[#"hash_510b4c02046fffad"] = #"hash_5697d6bc1cbfe279";
	level.var_ebf9c160[#"hash_5156460204afe0f5"] = #"hash_5697d6bc1cbfe279";
	level.var_ebf9c160[#"hash_746873701fc96f8a"] = #"hash_51999086d0658088";
	level.var_ebf9c160[#"hash_741d65701f896c46"] = #"hash_51999086d0658088";
	level.var_ebf9c160[#"hash_375b41755865b990"] = #"hash_5818d29b1abc2276";
	level.var_ebf9c160[#"hash_376f4f7558767a64"] = #"hash_5818d29b1abc2276";
	level.var_ebf9c160[#"hash_174fc52673f20b2c"] = #"hash_23acee0a0e2a7122";
	level.var_ebf9c160[#"hash_1764b326740448a0"] = #"hash_23acee0a0e2a7122";
	level.var_ebf9c160[#"hash_5e421a41883cbedd"] = #"hash_2fb51673d8713589";
	level.var_ebf9c160[#"hash_5e201441881fce45"] = #"hash_2fb51673d8713589";
	level.var_ebf9c160[#"hash_2d0972cc34c8d313"] = #"hash_5da2a16de0fdf4b7";
	level.var_ebf9c160[#"hash_2cbe78cc3488f1cb"] = #"hash_5da2a16de0fdf4b7";
	level.var_ebf9c160[#"hash_6e85dea4185486ab"] = #"hash_6aeabeaa41082a2b";
	level.var_ebf9c160[#"hash_6eded4a418a09e83"] = #"hash_6aeabeaa41082a2b";
	level.var_ebf9c160[#"hash_7de1f8b27833f161"] = #"hash_7e37f0313afc4b45";
	level.var_ebf9c160[#"hash_7d89f2b277e97159"] = #"hash_7e37f0313afc4b45";
	level.var_ebf9c160[#"hash_15e00b577a530dc6"] = #"hash_1eecd6a11bd4edb0";
	level.var_ebf9c160[#"hash_15e00b577a530dc6"] = #"hash_1eecd6a11bd4edb0";
	level.var_ebf9c160[#"hash_571e7ec0302ceb28"] = #"hash_5eb296644ce7caf2";
	level.var_ebf9c160[#"hash_571e7ec0302ceb28"] = #"hash_5eb296644ce7caf2";
}

/*
	Name: function_9243f770
	Namespace: namespace_ba4f7a20
	Checksum: 0xAE07DEE9
	Offset: 0x800
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_9243f770(weapon_name)
{
	if(isdefined(level.var_ebf9c160[weapon_name]))
	{
		item = function_4ba8fde(level.var_ebf9c160[weapon_name]);
		return item;
	}
}

/*
	Name: function_52df229a
	Namespace: namespace_ba4f7a20
	Checksum: 0x86D31D73
	Offset: 0x860
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private function_52df229a(weapon_name)
{
	item = function_9243f770(weapon_name);
	if(isdefined(item))
	{
		var_fa3df96 = self item_inventory::function_e66dcff5(item);
		self item_world::function_de2018e3(item, self, var_fa3df96);
	}
}

/*
	Name: give_weapon
	Namespace: namespace_ba4f7a20
	Checksum: 0x49BAEA26
	Offset: 0x8E0
	Size: 0x284
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
	if(!isdefined(weapon))
	{
		/#
			assert(0);
		#/
		return;
	}
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
			attachment = item_world_util::function_49ce7663(attachmentname + "_t9_item");
			namespace_a0d533d1::function_9e9c82a6(weapon, attachment);
		}
		weapon.amount = self getweaponammoclipsize(namespace_a0d533d1::function_2b83d3ff(weapon));
	}
	self item_world::function_de2018e3(weapon, self, var_fa3df96);
}

/*
	Name: function_e97afe1
	Namespace: namespace_ba4f7a20
	Checksum: 0xFD34B478
	Offset: 0xB70
	Size: 0x44C
	Parameters: 3
	Flags: None
*/
function function_e97afe1(player, class_num, var_66b7a94e)
{
	if(!isdefined(var_66b7a94e))
	{
		var_66b7a94e = undefined;
	}
	if(!isplayer(player))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!isint(class_num))
	{
		/#
			assert(0);
		#/
		return;
	}
	function_8c49355e();
	talents = self function_fd62a2aa(class_num);
	foreach(talent in talents)
	{
		if(!isfunctionptr(var_66b7a94e) || player [[var_66b7a94e]](talent.namehash))
		{
			function_52df229a(talent.namehash);
		}
	}
	primary = self getloadoutweapon(class_num, "primary");
	if(!isfunctionptr(var_66b7a94e) || player [[var_66b7a94e]](primary.rootweapon.name))
	{
		give_weapon(primary.rootweapon.name + "_item", primary.attachments);
	}
	secondary = self getloadoutweapon(class_num, "secondary");
	if(!isfunctionptr(var_66b7a94e) || player [[var_66b7a94e]](secondary.rootweapon.name))
	{
		give_weapon(secondary.rootweapon.name + "_item", secondary.attachments);
	}
	primarygrenade = self function_b958b70d(class_num, "primarygrenade");
	if(!isfunctionptr(var_66b7a94e) || player [[var_66b7a94e]](primarygrenade))
	{
		function_52df229a(primarygrenade);
	}
	secondarygrenade = self function_b958b70d(class_num, "secondarygrenade");
	if(!isfunctionptr(var_66b7a94e) || player [[var_66b7a94e]](secondarygrenade))
	{
		function_52df229a(secondarygrenade);
	}
	specialgrenade = self function_b958b70d(class_num, "specialgrenade");
	if(!isfunctionptr(var_66b7a94e) || player [[var_66b7a94e]](specialgrenade))
	{
		function_52df229a(specialgrenade);
	}
	ultimate = self function_b958b70d(class_num, "ultimate");
	if(!isfunctionptr(var_66b7a94e) || player [[var_66b7a94e]](ultimate))
	{
		function_52df229a(ultimate);
	}
}

