#using script_1caf36ff04a85ff6;
#using script_1f41849126bfc83d;
#using script_256b8879317373de;
#using script_2dc48f46bfeac894;
#using script_4108035fe400ce67;
#using script_4663ec59d864e437;
#using script_471b31bd963b388e;
#using script_47fb62300ac0bd60;
#using script_67c87580908a0a00;
#using script_68d2ee1489345a1d;
#using script_6c8abe14025b47c4;
#using script_7bacb32f8222fa3e;
#using script_7f6cd71c43c45c57;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_b376ff3f;

/*
	Name: function_a164ffcf
	Namespace: namespace_b376ff3f
	Checksum: 0xF444069D
	Offset: 0x608
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a164ffcf()
{
	level notify(623060451);
}

/*
	Name: function_89f2df9
	Namespace: namespace_b376ff3f
	Checksum: 0xA9E04209
	Offset: 0x628
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_568e72715a5f3355", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_b376ff3f
	Checksum: 0xAE8D88B5
	Offset: 0x678
	Size: 0x2AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_ad5a0cd6::use_item_spawns())
	{
		return;
	}
	if(function_7d5553ac())
	{
		return;
	}
	clientfield::register("toplayer", "inventoryThirdWeapon", 8000, 1, "int");
	clientfield::function_a8bbc967("hudItems.healthItemstackCount", 1, 8, "int", 0);
	clientfield::function_a8bbc967("hudItems.equipmentStackCount", 1, 8, "int", 0);
	level.var_67f4fd41 = &function_38d1ea04;
	level.specialty_quieter_complete = &function_bdc03d88;
	level.var_cf16ff75 = &function_a2162b3b;
	level.var_6ec46eeb = &function_d85c5382;
	level.var_f208fb92 = [];
	level.var_c3a003ad = &function_ce3288cf;
	ability_player::register_gadget_activation_callbacks(23, &function_f7d084ce, &function_cb475dfc);
	ability_player::register_gadget_primed_callbacks(23, &function_d116a346);
	level.var_d3b4a4db = &function_64d3e50;
	level thread function_d2f05352();
	level.var_b398b662 = &function_f58e80e2;
	if(!isdefined(level.var_5c14d2e6))
	{
		level.var_5c14d2e6 = &function_3f7ef88;
	}
	if(!isdefined(level.var_317fb13c))
	{
		level.var_317fb13c = &function_3f7ef88;
	}
	if(!isdefined(level.var_4cf92425))
	{
		level.var_4cf92425 = [];
	}
	callback::on_connect(&function_4d97b664);
	callback::on_spawned(&function_e4a4b07b);
	callback::add_callback(#"hash_4a1cdf56005f9fb3", &function_7b39c6f9);
}

/*
	Name: function_4d97b664
	Namespace: namespace_b376ff3f
	Checksum: 0x61A7C6EE
	Offset: 0x930
	Size: 0x1C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4d97b664()
{
	self function_814b5785();
}

/*
	Name: function_e4a4b07b
	Namespace: namespace_b376ff3f
	Checksum: 0x85F1B5F9
	Offset: 0x958
	Size: 0x3C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_e4a4b07b()
{
	if(!isdefined(self.inventory))
	{
		self function_814b5785();
	}
	/#
		self thread function_76eb9bd7();
	#/
}

/*
	Name: function_7d5553ac
	Namespace: namespace_b376ff3f
	Checksum: 0xF4BC0DAF
	Offset: 0x9A0
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function function_7d5553ac()
{
	return currentsessionmode() == 4 || (isdefined(getgametypesetting(#"hash_1cc3f98086d6f5dd")) ? getgametypesetting(#"hash_1cc3f98086d6f5dd") : 0);
}

/*
	Name: function_64d3e50
	Namespace: namespace_b376ff3f
	Checksum: 0xF89A0250
	Offset: 0xA18
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function function_64d3e50(var_b4d5813c)
{
	if(!isdefined(self) || !isdefined(self.inventory) || !isdefined(self.inventory.items) || !isdefined(self.inventory.items[5]))
	{
		return;
	}
	var_bd027dd9 = self.inventory.items[5].var_bd027dd9;
	if(isdefined(var_bd027dd9) && var_bd027dd9 != 32767)
	{
		item = function_dfcacdc2(var_bd027dd9);
		if(item.var_a6762160.name == #"hash_6d9b83e07c57fb35")
		{
			if(var_b4d5813c)
			{
				self thread function_6e376bb1(var_bd027dd9, 1, 0);
			}
		}
		else
		{
			self thread function_6e376bb1(var_bd027dd9, 1, 0);
		}
	}
}

/*
	Name: function_299d2131
	Namespace: namespace_b376ff3f
	Checksum: 0xFD8A56BA
	Offset: 0xB48
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function function_299d2131(maxhealth, var_5af5a1bf, var_4465ef1e)
{
	self endon(#"death");
	while(self.heal.enabled)
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	self.var_44d52546 = 1;
	self player::function_9080887a(maxhealth);
	self.heal.var_bc840360 = math::clamp(var_5af5a1bf + self.health, 0, maxhealth);
	self.heal.rate = var_5af5a1bf / var_4465ef1e;
	self gadget_health_regen::function_ddfdddb1();
	self gadget_health_regen::function_1e02d458();
	self callback::function_d8abfc3d(#"hash_25663702210244cc", &function_4a257174);
}

/*
	Name: function_4a257174
	Namespace: namespace_b376ff3f
	Checksum: 0x699AED48
	Offset: 0xC78
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_4a257174()
{
	if(isdefined(self))
	{
		self callback::function_52ac9652(#"hash_25663702210244cc", &function_4a257174);
		self.var_44d52546 = undefined;
		gadget_health_regen::function_7993d50e();
	}
}

/*
	Name: function_fc04b237
	Namespace: namespace_b376ff3f
	Checksum: 0xFDBAA68E
	Offset: 0xCE0
	Size: 0x24A
	Parameters: 2
	Flags: Linked
*/
function function_fc04b237(weapon, weaponoptions)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(weapon));
	#/
	if(!isdefined(weaponoptions))
	{
		return;
	}
	if(!isdefined(self.pers) || !isdefined(self.pers[#"activecamo"]))
	{
		return weaponoptions;
	}
	camoindex = getcamoindex(weaponoptions);
	activecamoname = function_11c873a(camoindex);
	if(!isdefined(activecamoname) || !isdefined(self.pers[#"activecamo"][activecamoname]))
	{
		return weaponoptions;
	}
	activecamo = self.pers[#"activecamo"][activecamoname];
	if(!isdefined(activecamo) || !isdefined(activecamo.var_dd54a13b))
	{
		return weaponoptions;
	}
	var_28c04c49 = activecamo::function_c14cb514(weapon);
	weaponstate = activecamo.var_dd54a13b[var_28c04c49];
	if(!isdefined(weaponstate))
	{
		return weaponoptions;
	}
	var_d1a848d9 = weaponstate.var_d1a848d9;
	if(!isdefined(var_d1a848d9))
	{
		return weaponoptions;
	}
	stage = activecamo.stages[var_d1a848d9];
	var_7df02232 = stage.var_19b6044e;
	if(!isdefined(var_7df02232))
	{
		return weaponoptions;
	}
	var_b7659ba0 = activecamo::function_b259f3e0(weapon);
	weaponoptions = self getbuildkitweaponoptions(var_b7659ba0, var_7df02232, var_d1a848d9);
	return weaponoptions;
}

/*
	Name: function_a2162b3b
	Namespace: namespace_b376ff3f
	Checksum: 0xEE7D8F49
	Offset: 0xF38
	Size: 0xB2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a2162b3b(var_de56bf19)
{
	if(isplayer(self))
	{
		if(var_de56bf19 === self.var_cc111ddc)
		{
			self.var_cc111ddc = undefined;
		}
		if(var_de56bf19 === self.var_8181d952)
		{
			self.var_8181d952 = undefined;
		}
		if(var_de56bf19 === self.var_cd3bc45b)
		{
			self.var_cd3bc45b = undefined;
		}
		if(var_de56bf19 === self.var_d0015cb3)
		{
			self.var_d0015cb3 = undefined;
		}
		if(var_de56bf19 === self.var_14c391cc)
		{
			self.var_14c391cc = undefined;
		}
	}
}

/*
	Name: function_d62822d5
	Namespace: namespace_b376ff3f
	Checksum: 0x905DE7F0
	Offset: 0xFF8
	Size: 0x2E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d62822d5()
{
	self.var_cc111ddc = undefined;
	self.var_8181d952 = undefined;
	self.var_cd3bc45b = undefined;
	self.var_d0015cb3 = undefined;
	self.var_14c391cc = undefined;
}

/*
	Name: function_76646dad
	Namespace: namespace_b376ff3f
	Checksum: 0x2C213E3A
	Offset: 0x1030
	Size: 0x116
	Parameters: 1
	Flags: Linked, Private
*/
function private function_76646dad(weapon)
{
	if(weapon.name == #"hash_7cd9fb78e5309f96" || weapon.name == #"cymbal_monkey" || weapon.name == #"eq_stimshot" || weapon.name == #"snowball")
	{
		return 1;
	}
	if(weapon.gadget_type != 0)
	{
		slot = self gadgetgetslot(weapon);
		return slot == 0;
	}
	return weapon.inventorytype === "offhand" || weapon.inventorytype === "offhand_primary" || weapon.inventorytype === "ability";
}

/*
	Name: function_e72d56f9
	Namespace: namespace_b376ff3f
	Checksum: 0xD6EE61E2
	Offset: 0x1150
	Size: 0x17C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e72d56f9(weapon, usecount)
{
	/#
		assert(isdefined(weapon));
	#/
	if(isplayer(self) && isalive(self))
	{
		self function_d62822d5();
		if(isdefined(level.var_ce82b9ae))
		{
			if(!self [[level.var_ce82b9ae]](weapon))
			{
				return;
			}
		}
		var_bd027dd9 = self function_a33744de(weapon);
		if(var_bd027dd9 != 32767)
		{
			self function_6e376bb1(var_bd027dd9, usecount, 0);
			item = self function_dfcacdc2(var_bd027dd9);
			if(isdefined(item) && item.count > 0)
			{
				if(weapon.gadget_type == 0)
				{
					self setweaponammoclip(weapon, item.count);
				}
				else
				{
					self function_c6be9f7f(weapon, item.count);
				}
			}
		}
	}
}

/*
	Name: function_9e4c68e2
	Namespace: namespace_b376ff3f
	Checksum: 0xF0C5E1A2
	Offset: 0x12D8
	Size: 0x82
	Parameters: 1
	Flags: Private, Event
*/
event private function_9e4c68e2(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	if(isplayer(self) && isalive(self) && self function_76646dad(eventstruct.weapon))
	{
		self.var_cd3bc45b = eventstruct.weapon;
	}
}

/*
	Name: function_2f677e9d
	Namespace: namespace_b376ff3f
	Checksum: 0x3303AE43
	Offset: 0x1368
	Size: 0x82
	Parameters: 1
	Flags: Event
*/
event function_2f677e9d(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	if(isplayer(self) && isalive(self) && self function_76646dad(eventstruct.weapon))
	{
		self.var_d0015cb3 = eventstruct.weapon;
	}
}

/*
	Name: function_4776caf4
	Namespace: namespace_b376ff3f
	Checksum: 0x1234B1
	Offset: 0x13F8
	Size: 0x6B0
	Parameters: 1
	Flags: Private, Event
*/
event private function_4776caf4(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	if(isplayer(self) && isalive(self) && self function_76646dad(eventstruct.weapon))
	{
		self.var_8181d952 = eventstruct.weapon;
		var_994e5c9a = 0;
		equipments = array(#"ability_smart_cover", #"eq_concertina_wire", #"hash_3a19c6a9c8caef33", #"dart", #"eq_hawk", #"ultimate_turret");
		arrayremovevalue(equipments, #"eq_concertina_wire", 0);
		foreach(equipmentname in equipments)
		{
			if(eventstruct.weapon.name == equipmentname)
			{
				var_994e5c9a = 1;
				break;
			}
		}
		var_aec6fa7f = undefined;
		if(!var_994e5c9a)
		{
			weapon = eventstruct.weapon;
			var_bd027dd9 = self function_a33744de(weapon);
			if(var_bd027dd9 != 32767)
			{
				item = self function_dfcacdc2(var_bd027dd9);
				if(isdefined(item) && item.amount > 0)
				{
					var_aec6fa7f = item.amount;
				}
			}
			self function_e72d56f9(weapon, 1);
		}
		weaponname = eventstruct.weapon.name;
		var_8efce1dc = 0;
		var_5ac24c15 = 0;
		foreach(var_4308a069 in array(#"trophy_system", #"hatchet", #"tomahawk_t8", #"hash_7cd9fb78e5309f96", #"gadget_jammer", #"satchel_charge"))
		{
			if(var_4308a069 == weaponname)
			{
				var_8efce1dc = 1;
				break;
			}
		}
		if(!var_8efce1dc && isarray(level.var_d385a742))
		{
			foreach(var_10add516 in level.var_d385a742)
			{
				if(var_10add516.weapon_name == weaponname)
				{
					var_5ac24c15 = 1;
					var_4a908873 = var_10add516.item_name;
					break;
				}
			}
		}
		if(var_8efce1dc || var_5ac24c15)
		{
			if(isdefined(eventstruct.projectile))
			{
				dropitem = eventstruct.projectile;
				dropitem endon(#"death");
				if(weaponname == #"hash_7cd9fb78e5309f96")
				{
					dropitem setinvisibletoplayer(self);
					wait(0.25);
					if(isdefined(self))
					{
						dropitem setvisibletoplayer(self);
					}
				}
				if(weaponname == #"trophy_system")
				{
					if(isdefined(item))
					{
						self._trophy_system_ammo1 = var_aec6fa7f;
					}
				}
				wait(0.5);
				if(!isdefined(dropitem))
				{
					return;
				}
				if(var_8efce1dc)
				{
					var_f77e15f6 = function_d08934c6(weaponname);
				}
				else if(isdefined(var_4a908873))
				{
					var_f77e15f6 = function_4ba8fde(var_4a908873);
				}
				if(!isdefined(var_f77e15f6))
				{
					return;
				}
				/#
					assert(var_f77e15f6.id < 2048);
				#/
				dropitem.id = var_f77e15f6.id;
				dropitem.var_bd027dd9 = namespace_ad5a0cd6::function_1f0def85(dropitem);
				dropitem.var_a6762160 = var_f77e15f6.var_a6762160;
				dropitem.var_8e092725 = 0;
				dropitem.amount = (eventstruct.weapon.name == #"hash_7cd9fb78e5309f96" ? 1 : 0);
				dropitem.count = 1;
				dropitem clientfield::set("dynamic_item_drop", 1);
				dropitem function_46d7f921(dropitem.id);
				level.var_a4a4012e[dropitem.var_bd027dd9] = dropitem;
			}
		}
	}
}

/*
	Name: function_f5883bb1
	Namespace: namespace_b376ff3f
	Checksum: 0xD2F3E5B6
	Offset: 0x1AB0
	Size: 0x96
	Parameters: 1
	Flags: Private, Event
*/
event private function_f5883bb1(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	self.next_weapon = undefined;
	if(isplayer(self) && isalive(self))
	{
		if(eventstruct.weapon.isprimary && eventstruct.weapon != eventstruct.last_weapon)
		{
			self.next_weapon = eventstruct.weapon;
		}
	}
}

/*
	Name: function_a8c42ee4
	Namespace: namespace_b376ff3f
	Checksum: 0x98C78609
	Offset: 0x1B50
	Size: 0x222
	Parameters: 1
	Flags: Private, Event
*/
event private function_a8c42ee4(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	if(isplayer(self) && isalive(self))
	{
		if(isdefined(self.var_8181d952))
		{
			weapon = self.var_8181d952;
			equipments = array(#"ability_smart_cover");
			foreach(equipmentname in equipments)
			{
				if(weapon.name == equipmentname)
				{
					self function_e72d56f9(weapon, 1);
					return;
				}
			}
		}
		if(isdefined(self.var_d0015cb3))
		{
			weapon = self.var_d0015cb3;
			equipments = array(#"ability_smart_cover", #"eq_concertina_wire", #"ultimate_turret");
			foreach(equipmentname in equipments)
			{
				if(weapon.name == equipmentname)
				{
					self function_e72d56f9(weapon, 1);
					return;
				}
			}
		}
	}
}

/*
	Name: gadget_primed_callback
	Namespace: namespace_b376ff3f
	Checksum: 0xC26D78E3
	Offset: 0x1D80
	Size: 0xAE
	Parameters: 1
	Flags: Event
*/
event gadget_primed_callback(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	player = eventstruct.entity;
	if(isplayer(player) && isalive(player) && player function_76646dad(eventstruct.weapon))
	{
		function_d62822d5();
		player.var_cc111ddc = eventstruct.weapon;
	}
}

/*
	Name: gadget_on_callback
	Namespace: namespace_b376ff3f
	Checksum: 0xC8D5D669
	Offset: 0x1E38
	Size: 0x1A0
	Parameters: 1
	Flags: Event
*/
event gadget_on_callback(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	player = eventstruct.entity;
	if(isplayer(player) && isalive(player) && player function_76646dad(eventstruct.weapon))
	{
		equipments = array(#"hash_3a19c6a9c8caef33", #"dart", #"eq_hawk", #"eq_stimshot");
		foreach(equipmentname in equipments)
		{
			if(eventstruct.weapon.name == equipmentname)
			{
				weapon = eventstruct.weapon;
				player function_e72d56f9(weapon, 1);
			}
		}
	}
}

/*
	Name: function_40d8d1ec
	Namespace: namespace_b376ff3f
	Checksum: 0x2554E720
	Offset: 0x1FE0
	Size: 0x9A
	Parameters: 1
	Flags: Event
*/
event function_40d8d1ec(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	player = eventstruct.entity;
	if(isplayer(player) && isalive(player) && player function_76646dad(eventstruct.weapon))
	{
		player.var_14c391cc = eventstruct.weapon;
	}
}

/*
	Name: function_2aa4e6cf
	Namespace: namespace_b376ff3f
	Checksum: 0xAD79CE6D
	Offset: 0x2088
	Size: 0x9C
	Parameters: 1
	Flags: Event
*/
event function_2aa4e6cf(eventstruct)
{
	if(function_7d5553ac())
	{
		return;
	}
	player = self;
	if(isplayer(player) && isalive(player))
	{
		if(eventstruct.seat_index == 0 && player function_2cceca7b())
		{
			player forceoffhandend();
		}
	}
}

/*
	Name: function_ce3288cf
	Namespace: namespace_b376ff3f
	Checksum: 0xF9D251CD
	Offset: 0x2130
	Size: 0x1D4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ce3288cf(damage)
{
	if(!isdefined(self.inventory))
	{
		return damage;
	}
	var_ef60bf87 = damage;
	var_e67d2721 = 0;
	foreach(item in self.inventory.items)
	{
		if(item.id == 32767)
		{
			continue;
		}
		if(!isdefined(item.var_a6762160.var_dba54111) || item.var_a6762160.var_dba54111 == 0)
		{
			continue;
		}
		var_babbb09b = item.var_a6762160.var_dba54111;
		var_e67d2721 = var_e67d2721 + var_babbb09b;
		if(var_e67d2721 > var_ef60bf87)
		{
			var_babbb09b = var_e67d2721 - var_ef60bf87;
		}
		var_e67d2721 = min(var_e67d2721, var_ef60bf87);
		if(isdefined(item.var_1181c08b) && item.var_1181c08b > 0)
		{
			item.var_1181c08b = item.var_1181c08b - var_babbb09b;
			if(item.var_1181c08b <= 0)
			{
				function_5852cb7b(item.var_bd027dd9, 0, 1);
			}
		}
		if(var_e67d2721 >= damage)
		{
			break;
		}
	}
	return damage - var_e67d2721;
}

/*
	Name: function_38d1ea04
	Namespace: namespace_b376ff3f
	Checksum: 0x61523824
	Offset: 0x2310
	Size: 0x1A4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_38d1ea04()
{
	if(isplayer(self) && isdefined(self.inventory))
	{
		var_b619c089 = self.inventory.items[6];
		if(!is_true(var_b619c089.var_a6762160.var_b5b2485b))
		{
			return;
		}
		if(isdefined(var_b619c089) && isdefined(var_b619c089.var_a6762160))
		{
			var_39c78394 = var_b619c089.var_a6762160.var_39c78394;
		}
		if(isdefined(var_39c78394) && var_39c78394 > 0)
		{
			var_dd88a936 = function_4ba8fde(#"hash_fb37841b0d2d7e7");
			if(isdefined(var_dd88a936))
			{
				var_7841fe31 = self function_e274f1fe(var_dd88a936, var_39c78394, undefined, 11);
				if(var_7841fe31 > 0)
				{
					function_d7944517(var_dd88a936.id, undefined, var_7841fe31);
				}
			}
		}
		if(var_b619c089.var_bd027dd9 != 32767 && var_b619c089.var_a6762160.itemtype == #"armor")
		{
			self function_5852cb7b(var_b619c089.var_bd027dd9);
		}
	}
}

/*
	Name: function_bdc03d88
	Namespace: namespace_b376ff3f
	Checksum: 0x4B1B6EC2
	Offset: 0x24C0
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bdc03d88()
{
	if(isplayer(self) && isdefined(self.inventory))
	{
		var_b619c089 = self.inventory.items[6];
		if(var_b619c089.var_bd027dd9 != 32767 && var_b619c089.var_a6762160.itemtype == #"armor")
		{
			var_b619c089.amount = armor::function_4f977182();
			if(function_27cd171b(var_b619c089))
			{
				self setperk(#"hash_4df21972dd2a3a87");
			}
		}
	}
}

/*
	Name: function_434d0c2b
	Namespace: namespace_b376ff3f
	Checksum: 0xE6D6715D
	Offset: 0x25A0
	Size: 0x2D4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_434d0c2b(itemtype, var_da328e7b, var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(function_7a600918(itemtype));
	#/
	/#
		assert(isarray(var_da328e7b));
	#/
	items = [];
	var_e3c48c83 = namespace_ad5a0cd6::function_d73e17cb(var_ab9610ad);
	foreach(item in self.inventory.items)
	{
		if(item.id == 32767)
		{
			continue;
		}
		var_b74300d3 = namespace_ad5a0cd6::function_d73e17cb(item.var_a6762160);
		if(var_e3c48c83 === var_b74300d3)
		{
			return item;
		}
		if(item.var_a6762160.itemtype == itemtype)
		{
			if(isdefined(items[var_b74300d3]))
			{
				if(item.count > items[var_b74300d3].count)
				{
					items[var_b74300d3] = item;
				}
				continue;
			}
			items[var_b74300d3] = item;
		}
	}
	foreach(var_b74300d3 in var_da328e7b)
	{
		if(isdefined(items[var_b74300d3]))
		{
			return items[var_b74300d3];
		}
	}
	foreach(item in items)
	{
		if(isdefined(item))
		{
			return item;
		}
	}
}

/*
	Name: function_c42f2717
	Namespace: namespace_b376ff3f
	Checksum: 0x7062393B
	Offset: 0x2880
	Size: 0x292
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c42f2717(itemtype, var_da328e7b, var_bcc2655a)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(function_7a600918(itemtype));
	#/
	/#
		assert(isarray(var_da328e7b));
	#/
	if(!isdefined(var_bcc2655a))
	{
		return;
	}
	items = [];
	var_c7837092 = namespace_ad5a0cd6::function_d73e17cb(var_bcc2655a);
	foreach(item in self.inventory.items)
	{
		if(item.id == 32767)
		{
			continue;
		}
		var_b74300d3 = namespace_ad5a0cd6::function_d73e17cb(item.var_a6762160);
		if(item.var_a6762160.itemtype == itemtype)
		{
			if(isdefined(items[var_b74300d3]))
			{
				if(item.count > items[var_b74300d3].count)
				{
					items[var_b74300d3] = item;
				}
				continue;
			}
			items[var_b74300d3] = item;
		}
	}
	for(currentindex = 0; currentindex < var_da328e7b.size; currentindex++)
	{
		if(var_da328e7b[currentindex] == var_c7837092)
		{
			break;
		}
	}
	for(index = currentindex + 1; index < var_da328e7b.size; index++)
	{
		var_b74300d3 = var_da328e7b[index];
		if(isdefined(items[var_b74300d3]))
		{
			return items[var_b74300d3];
		}
	}
	if(currentindex < var_da328e7b.size)
	{
		for(index = 0; index < currentindex; index++)
		{
			var_b74300d3 = var_da328e7b[index];
			if(isdefined(items[var_b74300d3]))
			{
				return items[var_b74300d3];
			}
		}
	}
}

/*
	Name: function_9da31874
	Namespace: namespace_b376ff3f
	Checksum: 0xDC2B6BB2
	Offset: 0x2B20
	Size: 0x1DE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9da31874(itemtype)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(function_7a600918(itemtype));
	#/
	items = [];
	foreach(index, item in self.inventory.items)
	{
		if(index >= 5)
		{
			break;
		}
		if(item.id == 32767 || item.var_a6762160.itemtype != itemtype)
		{
			continue;
		}
		items[items.size] = item;
	}
	currentindex = (isdefined(self.inventory.var_a0290b96[itemtype]) ? self.inventory.var_a0290b96[itemtype] : 0);
	if(currentindex < 0)
	{
		currentindex = 0;
	}
	else if(currentindex > items.size)
	{
		currentindex = items.size;
	}
	if(items.size > 0)
	{
		currentindex = (currentindex + 1) % items.size;
		self.inventory.var_a0290b96[itemtype] = currentindex;
	}
	return items[currentindex];
}

/*
	Name: function_283a29c8
	Namespace: namespace_b376ff3f
	Checksum: 0xAABF61A3
	Offset: 0x2D08
	Size: 0x374
	Parameters: 1
	Flags: Linked, Private
*/
function private function_283a29c8(var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(function_fe402108())
	{
		return;
	}
	item = function_434d0c2b(#"equipment", array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de", #"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f"), var_ab9610ad);
	if(isdefined(item))
	{
		function_c8bedf1b(item);
	}
}

/*
	Name: function_bf956054
	Namespace: namespace_b376ff3f
	Checksum: 0x85BD5973
	Offset: 0x3088
	Size: 0x374
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bf956054(var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(function_fe402108())
	{
		return;
	}
	item = function_434d0c2b(#"field_upgrade", array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de", #"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f"), var_ab9610ad);
	if(isdefined(item))
	{
		function_c8bedf1b(item);
	}
}

/*
	Name: function_cd5393a9
	Namespace: namespace_b376ff3f
	Checksum: 0x88043D8D
	Offset: 0x3408
	Size: 0x374
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cd5393a9(var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(function_fe402108())
	{
		return;
	}
	item = function_434d0c2b(#"tactical", array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de", #"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f"), var_ab9610ad);
	if(isdefined(item))
	{
		function_c8bedf1b(item);
	}
}

/*
	Name: function_714fce55
	Namespace: namespace_b376ff3f
	Checksum: 0x639EEEC
	Offset: 0x3788
	Size: 0x12C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_714fce55(itemtype, var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(function_fe402108())
	{
		return;
	}
	item = function_434d0c2b(itemtype, array(#"hash_6eb09ea5da35e18f", #"hash_654445f6cc7a7e1c", #"hash_5f6d7361258230a", #"hash_ba416827a85877c", #"hash_24a1df9928527c11", #"hash_2294e52d4ac78b9a", #"hash_cefb3af28fb800b", #"hash_18fa1f3e4e43437c"), var_ab9610ad);
	if(isdefined(item))
	{
		function_854cf2c3(item);
	}
}

/*
	Name: function_986801b8
	Namespace: namespace_b376ff3f
	Checksum: 0xC2706FA0
	Offset: 0x38C0
	Size: 0x134
	Parameters: 1
	Flags: Linked, Private
*/
function private function_986801b8(var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(function_fe402108())
	{
		return;
	}
	item = function_434d0c2b(#"scorestreak", array(#"hash_6eb09ea5da35e18f", #"hash_654445f6cc7a7e1c", #"hash_5f6d7361258230a", #"hash_ba416827a85877c", #"hash_24a1df9928527c11", #"hash_2294e52d4ac78b9a", #"hash_cefb3af28fb800b", #"hash_18fa1f3e4e43437c"), var_ab9610ad);
	if(isdefined(item))
	{
		function_1ac37022(item);
	}
}

/*
	Name: function_2e10e66e
	Namespace: namespace_b376ff3f
	Checksum: 0x1DF0A789
	Offset: 0x3A00
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2e10e66e(var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(function_fe402108())
	{
		return;
	}
	item = function_434d0c2b(#"backpack", array(#"hash_7c3701ba5f0879c2"), var_ab9610ad);
	if(isdefined(item))
	{
		function_2dab8a7f(item);
	}
}

/*
	Name: function_a7d62e18
	Namespace: namespace_b376ff3f
	Checksum: 0xC62372D5
	Offset: 0x3AD0
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a7d62e18(var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(function_fe402108())
	{
		return;
	}
	item = function_434d0c2b(#"health", array(#"hash_1abfcce0e9955057", #"hash_ff50c93155e445f", #"hash_80292d121740f6f", #"hash_45ced3880667df22", #"hash_20699a922abaf2e1"), var_ab9610ad);
	if(isdefined(item))
	{
		function_11fc9fa9(item);
	}
}

/*
	Name: function_9d805044
	Namespace: namespace_b376ff3f
	Checksum: 0x1B80E4D5
	Offset: 0x3BE0
	Size: 0x212
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9d805044(itemtype, var_ab9610ad)
{
	if(!isdefined(var_ab9610ad))
	{
		var_ab9610ad = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isstring(itemtype) || function_7a600918(itemtype));
	#/
	if(function_fe402108())
	{
		return;
	}
	switch(itemtype)
	{
		case "backpack":
		{
			function_2e10e66e(var_ab9610ad);
			break;
		}
		case "equipment":
		{
			function_283a29c8(var_ab9610ad);
			break;
		}
		case "field_upgrade":
		{
			function_bf956054(var_ab9610ad);
			break;
		}
		case "tactical":
		{
			function_cd5393a9(var_ab9610ad);
			break;
		}
		case "health":
		{
			function_a7d62e18(var_ab9610ad);
			break;
		}
		case "scorestreak":
		{
			function_986801b8(var_ab9610ad);
			break;
		}
		case "hash_63c2e39c90346280":
		case "hash_63c2e49c90346433":
		case "hash_63c2e59c903465e6":
		{
			function_714fce55(hash(itemtype), var_ab9610ad);
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_d08934c6
	Namespace: namespace_b376ff3f
	Checksum: 0xCDB8C611
	Offset: 0x3E00
	Size: 0x1E4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d08934c6(equipment)
{
	var_b74300d3 = undefined;
	switch(equipment)
	{
		case "satchel_charge":
		{
			var_b74300d3 = (sessionmodeiszombiesgame() ? #"hash_61247be669e9b732" : #"hash_281638550b45be2a");
			break;
		}
		case "hatchet":
		{
			var_b74300d3 = (sessionmodeiszombiesgame() ? #"hash_49c0448e11cb523c" : #"hash_73b7240912c1f754");
			break;
		}
		case "tomahawk_t8":
		{
			var_b74300d3 = #"hash_4edf613e9b9032da";
			break;
		}
		case "hash_7cd9fb78e5309f96":
		{
			var_b74300d3 = #"hash_65e1752e269c2960";
			break;
		}
		case "cymbal_monkey":
		{
			var_b74300d3 = (sessionmodeiszombiesgame() ? #"hash_7f37566c7dd7ecb" : #"hash_5e5f2ed57ac4601f");
			break;
		}
		case "trophy_system":
		{
			var_b74300d3 = #"hash_1242946e889704c7";
			break;
		}
		case "gadget_jammer":
		{
			var_b74300d3 = (sessionmodeiszombiesgame() ? #"hash_5aeb970e93a31c17" : #"hash_3f154f45479130ed");
			break;
		}
	}
	if(isdefined(var_b74300d3))
	{
		return function_4ba8fde(var_b74300d3);
	}
}

/*
	Name: function_520b16d6
	Namespace: namespace_b376ff3f
	Checksum: 0x4FDE4302
	Offset: 0x3FF0
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function function_520b16d6()
{
	item = spawnstruct();
	item.amount = 0;
	item.count = 0;
	item.id = 32767;
	item.var_bd027dd9 = 32767;
	item.var_a6762160 = undefined;
	item.var_627c698b = undefined;
	item.weaponoptions = undefined;
	item.var_e91aba42 = undefined;
	return item;
}

/*
	Name: function_27cd171b
	Namespace: namespace_b376ff3f
	Checksum: 0x21DD8478
	Offset: 0x4080
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_27cd171b(var_b619c089)
{
	if(!isdefined(var_b619c089.amount))
	{
		return 0;
	}
	if(var_b619c089.amount <= 0)
	{
		return 1;
	}
	return (var_b619c089.amount / var_b619c089.var_a6762160.amount) <= 0.5;
}

/*
	Name: function_d85c5382
	Namespace: namespace_b376ff3f
	Checksum: 0xF56675B2
	Offset: 0x40E8
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_d85c5382(var_711e35e5, player)
{
	level.var_f208fb92[level.var_f208fb92.size] = player;
	arrayremovevalue(level.var_f208fb92, undefined);
}

/*
	Name: function_d2f05352
	Namespace: namespace_b376ff3f
	Checksum: 0x44840DE3
	Offset: 0x4140
	Size: 0x254
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d2f05352()
{
	level endon(#"game_ended");
	while(true)
	{
		players = getplayers();
		time = gettime();
		for(playerindex = 0; playerindex < players.size; playerindex++)
		{
			if(((playerindex + 1) % 15) == 0)
			{
				waitframe(1);
			}
			player = players[playerindex];
			if(!isdefined(player) || player.sessionstate != "playing" || !isalive(player) || !isdefined(player.inventory) || player.inventory.consumed.size <= 0)
			{
				continue;
			}
			consumed = player.inventory.consumed;
			var_1bc7a1b2 = 0;
			i = 0;
			while(i < consumed.size)
			{
				item = consumed[i];
				if(item.endtime <= time)
				{
					arrayremoveindex(consumed, i);
					var_1bc7a1b2 = 1;
				}
				else
				{
					i++;
				}
			}
			if(var_1bc7a1b2)
			{
				player function_6c36ab6b();
			}
			for(index = 0; index < 5; index++)
			{
				item = player.inventory.items[index];
				if(isdefined(item.endtime) && item.endtime <= time)
				{
					player function_6e376bb1(item.var_bd027dd9, 1, 0);
				}
			}
		}
		players = undefined;
		waitframe(1);
	}
}

/*
	Name: function_755a35c5
	Namespace: namespace_b376ff3f
	Checksum: 0x66CA4243
	Offset: 0x43A0
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_755a35c5()
{
	/#
		assert(isplayer(self));
	#/
	var_1c7f6d0f = 0;
	var_78d7ac4a = self.inventory.items[5];
	if(var_78d7ac4a.var_bd027dd9 !== 32767)
	{
		if(var_78d7ac4a.var_a6762160.name == #"hash_6d9b83e07c57fb35")
		{
			var_1c7f6d0f = function_bba770de(var_78d7ac4a.var_a6762160);
		}
	}
	gadget_health_regen::function_6eef7f4f(var_1c7f6d0f);
}

/*
	Name: function_a4413333
	Namespace: namespace_b376ff3f
	Checksum: 0x54BE1D58
	Offset: 0x4478
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a4413333()
{
	/#
		assert(isplayer(self));
	#/
	var_78d7ac4a = self.inventory.items[5];
	if(var_78d7ac4a.var_bd027dd9 !== 32767)
	{
		self clientfield::set_player_uimodel("hudItems.healthItemstackCount", function_bba770de(var_78d7ac4a.var_a6762160));
	}
	var_7f695eed = self.inventory.items[7];
	if(var_7f695eed.var_bd027dd9 !== 32767)
	{
		self clientfield::set_player_uimodel("hudItems.equipmentStackCount", function_bba770de(var_7f695eed.var_a6762160));
	}
}

/*
	Name: function_6c36ab6b
	Namespace: namespace_b376ff3f
	Checksum: 0x27BFFCAA
	Offset: 0x4580
	Size: 0x4AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6c36ab6b()
{
	self function_e6f9e3cd();
	foreach(slotid, item in self.inventory.items)
	{
		var_a6762160 = item.var_a6762160;
		if(isdefined(var_a6762160) && !is_true(var_a6762160.consumable) && isarray(var_a6762160.talents))
		{
			if(is_true(var_a6762160.var_97c5ead1) && slotid < 5)
			{
				continue;
			}
			foreach(var_9de7969b in var_a6762160.talents)
			{
				self function_b5feff95(var_9de7969b.talent);
			}
		}
	}
	foreach(item in self.inventory.consumed)
	{
		var_a6762160 = item.var_a6762160;
		if(isdefined(var_a6762160) && isarray(var_a6762160.talents))
		{
			foreach(var_9de7969b in var_a6762160.talents)
			{
				self function_b5feff95(var_9de7969b.talent);
			}
		}
	}
	if(isdefined(self.var_7341f980))
	{
		foreach(talent in self.var_7341f980)
		{
			self function_b5feff95(talent);
		}
	}
	if(isdefined(self.class_num))
	{
		self.specialty = self getloadoutperks(self.class_num);
	}
	else
	{
		self.specialty = [];
	}
	if(isdefined(level.var_74b10e67))
	{
		self [[level.var_74b10e67]]();
	}
	var_344a1b3d = self.inventory.items[6];
	if(var_344a1b3d.var_bd027dd9 != 32767 && var_344a1b3d.var_a6762160.itemtype == #"armor")
	{
		if(function_27cd171b(var_344a1b3d))
		{
			self setperk(#"hash_4df21972dd2a3a87");
		}
	}
	self.var_66cb03ad = (isdefined(self.var_66cb03ad) ? self.var_66cb03ad : self.spawnhealth);
	self player::function_9080887a();
	self player::function_b2b139e6();
}

/*
	Name: function_60706bdb
	Namespace: namespace_b376ff3f
	Checksum: 0x32FF2C31
	Offset: 0x4A38
	Size: 0xE2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_60706bdb(var_bd027dd9)
{
	/#
		assert(isplayer(self));
	#/
	item = function_dfcacdc2(var_bd027dd9);
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return;
	}
	if(item.var_a6762160.itemtype == #"weapon")
	{
		weapon = namespace_a0d533d1::function_2b83d3ff(item);
		ammoclip = self getweaponammoclip(weapon);
		item.amount = ammoclip;
	}
}

/*
	Name: function_d7944517
	Namespace: namespace_b376ff3f
	Checksum: 0x40936220
	Offset: 0x4B28
	Size: 0x24C
	Parameters: 15
	Flags: Linked, Private
*/
function private function_d7944517(var_d8138db2, weapon, count, amount, var_be90d3da, var_7cab8e12, targetname, attachments, stockammo, aat, var_a8bccf69, immediately, weaponoptions, var_e91aba42, var_908f65ca)
{
	if(!isdefined(var_be90d3da))
	{
		var_be90d3da = 0;
	}
	if(!isdefined(var_7cab8e12))
	{
		var_7cab8e12 = undefined;
	}
	if(!isdefined(targetname))
	{
		targetname = undefined;
	}
	if(!isdefined(attachments))
	{
		attachments = undefined;
	}
	if(!isdefined(stockammo))
	{
		stockammo = undefined;
	}
	if(!isdefined(aat))
	{
		aat = undefined;
	}
	if(!isdefined(var_a8bccf69))
	{
		var_a8bccf69 = undefined;
	}
	if(!isdefined(immediately))
	{
		immediately = 0;
	}
	if(!isdefined(weaponoptions))
	{
		weaponoptions = undefined;
	}
	if(!isdefined(var_e91aba42))
	{
		var_e91aba42 = undefined;
	}
	if(!isdefined(var_908f65ca))
	{
		var_908f65ca = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(namespace_ad5a0cd6::function_2c7fc531(var_d8138db2));
	#/
	self endon(#"death");
	droppos = var_7cab8e12;
	if(!var_be90d3da)
	{
		droppos = self.origin;
	}
	if(!immediately)
	{
		return self item_drop::function_fd9026e4(0, weapon, count, amount, var_d8138db2, droppos, self.angles, 2, var_be90d3da, 0, targetname, undefined, attachments, undefined, weaponoptions, var_e91aba42, var_908f65ca, undefined, stockammo, aat, var_a8bccf69);
	}
	self thread item_drop::function_fd9026e4(0, weapon, count, amount, var_d8138db2, droppos, self.angles, 2, var_be90d3da, 0, targetname, undefined, attachments, undefined, weaponoptions, var_e91aba42, var_908f65ca, undefined, stockammo, aat, var_a8bccf69);
}

/*
	Name: function_d116a346
	Namespace: namespace_b376ff3f
	Checksum: 0x212363E
	Offset: 0x4D80
	Size: 0x3A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d116a346(slot, weapon)
{
	if(isplayer(self))
	{
		self.var_e42fb511 = weapon;
	}
}

/*
	Name: function_f7d084ce
	Namespace: namespace_b376ff3f
	Checksum: 0x8431ECD1
	Offset: 0x4DC8
	Size: 0x3A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f7d084ce(slot, weapon)
{
	if(isplayer(self))
	{
		self.var_d6cd7d80 = weapon;
	}
}

/*
	Name: function_cb475dfc
	Namespace: namespace_b376ff3f
	Checksum: 0x5B3BE831
	Offset: 0x4E10
	Size: 0x3E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_cb475dfc(slot, weapon)
{
	if(isplayer(self))
	{
		self.var_d6cd7d80 = undefined;
		self.var_e42fb511 = undefined;
	}
}

/*
	Name: function_2cceca7b
	Namespace: namespace_b376ff3f
	Checksum: 0xCCA62ECC
	Offset: 0x4E58
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2cceca7b()
{
	return self isgrappling() || self isusingoffhand() || self function_55acff10(1);
}

/*
	Name: function_c1cef1ec
	Namespace: namespace_b376ff3f
	Checksum: 0x4983A2B0
	Offset: 0x4EB8
	Size: 0x42
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c1cef1ec(weapon)
{
	if(weapon != self getcurrentoffhand())
	{
		return 0;
	}
	return self function_2cceca7b();
}

/*
	Name: function_c6be9f7f
	Namespace: namespace_b376ff3f
	Checksum: 0x1EB8D602
	Offset: 0x4F08
	Size: 0x1CC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c6be9f7f(weapon, ammo)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(weapon));
	#/
	slot = self gadgetgetslot(weapon);
	if(slot >= 0 && slot < 3)
	{
		if("ammo" != weapon.var_11389297)
		{
			return;
		}
		if(weapon.name == #"eq_tripwire")
		{
			newpower = weapon.gadget_powermax;
			ammo = weapon.clipsize;
		}
		else
		{
			if(!weapon.clipsize)
			{
				var_35935a45 = weapon.gadget_powermax;
			}
			else
			{
				var_35935a45 = weapon.gadget_powermax / weapon.clipsize;
			}
			newammo = ammo;
			if(newammo > weapon.clipsize)
			{
				newammo = weapon.clipsize;
			}
			newpower = newammo * var_35935a45;
		}
		power = self gadgetpowerset(slot, newpower);
		self setweaponammoclip(weapon, ammo);
		debug_print((("set_gadget_power: " + power) + ", ammo: ") + ammo, weapon);
	}
}

/*
	Name: function_ee9ce1c4
	Namespace: namespace_b376ff3f
	Checksum: 0x19CBA60E
	Offset: 0x50E0
	Size: 0xEE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ee9ce1c4(var_a6762160, var_dfe6c7e5)
{
	self endon(#"death");
	self.var_10abd91d = 1;
	var_cbdeb265 = level.nullprimaryoffhand;
	switch(var_dfe6c7e5.itemtype)
	{
		case "tactical":
		{
			var_cbdeb265 = level.nullsecondaryoffhand;
			break;
		}
		case "field_upgrade":
		{
			var_cbdeb265 = level.var_3488e988;
			break;
		}
	}
	self function_5110caa3(namespace_ad5a0cd6::function_35e06774(var_dfe6c7e5), var_cbdeb265);
	self function_c6be9f7f(var_cbdeb265, 0);
	self.var_10abd91d = 0;
}

/*
	Name: function_8214f1b6
	Namespace: namespace_b376ff3f
	Checksum: 0xA213529E
	Offset: 0x51D8
	Size: 0xFE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8214f1b6(var_a6762160, var_dfe6c7e5)
{
	self endon(#"death");
	self.var_10abd91d = 1;
	weapon = namespace_ad5a0cd6::function_35e06774(var_dfe6c7e5);
	slot = self gadgetgetslot(weapon);
	if(slot >= 0 && slot < 3)
	{
		while(self function_af359de(slot))
		{
			waitframe(1);
		}
	}
	self function_5110caa3(weapon, level.var_ef61b4b5);
	self function_755a35c5();
	self.var_10abd91d = 0;
}

/*
	Name: function_bba770de
	Namespace: namespace_b376ff3f
	Checksum: 0x8B5B6530
	Offset: 0x52E0
	Size: 0x1B0
	Parameters: 1
	Flags: Linked
*/
function function_bba770de(var_a6762160)
{
	/#
		assert(isplayer(self));
	#/
	count = 0;
	if(!isdefined(var_a6762160))
	{
		return count;
	}
	if(!isdefined(self) || !isdefined(self.inventory) || !isdefined(self.inventory.items))
	{
		return count;
	}
	if(is_true(var_a6762160.unlimited))
	{
		return count;
	}
	name = (isdefined(var_a6762160.parentname) ? var_a6762160.parentname : var_a6762160.name);
	for(index = 0; index < self.inventory.items.size && index < (17 + 1); index++)
	{
		var_b619c089 = self.inventory.items[index];
		if(!isdefined(var_b619c089.var_a6762160))
		{
			continue;
		}
		if(name == (isdefined(var_b619c089.var_a6762160.parentname) ? var_b619c089.var_a6762160.parentname : var_b619c089.var_a6762160.name))
		{
			count = count + var_b619c089.count;
		}
	}
	return count;
}

/*
	Name: function_e106cbe9
	Namespace: namespace_b376ff3f
	Checksum: 0x59EE7ED1
	Offset: 0x5498
	Size: 0x146
	Parameters: 2
	Flags: Linked
*/
function function_e106cbe9(item, var_1326fcc7)
{
	if(!isdefined(var_1326fcc7))
	{
		var_1326fcc7 = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	var_a6762160 = item.var_a6762160;
	var_95162a97 = var_a6762160.weapon;
	var_1326fcc7 = (isdefined(var_1326fcc7) ? var_1326fcc7 : (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1));
	var_2f399b51 = namespace_a0d533d1::function_2879cbe0(self.inventory.var_7658cbec, var_95162a97);
	currentammostock = self getweaponammostock(var_95162a97);
	var_9b9ba643 = var_2f399b51 - currentammostock;
	addammo = int(min(var_1326fcc7, var_9b9ba643));
	return addammo > 0;
}

/*
	Name: function_550fcb41
	Namespace: namespace_b376ff3f
	Checksum: 0xDEC4B8A5
	Offset: 0x55E8
	Size: 0x15E
	Parameters: 1
	Flags: Linked
*/
function function_550fcb41(item)
{
	/#
		assert(isplayer(self));
	#/
	if(!is_true(item.var_a6762160.stackable))
	{
		return false;
	}
	var_590b4c51 = namespace_a0d533d1::function_cfa794ca(self.inventory.var_7658cbec, item.var_a6762160);
	if(var_590b4c51 <= 1)
	{
		return false;
	}
	for(i = 0; i < self.inventory.items.size; i++)
	{
		if(self.inventory.items[i].id == 32767)
		{
			continue;
		}
		if(self.inventory.items[i].var_a6762160.name != item.var_a6762160.name)
		{
			continue;
		}
		if(self.inventory.items[i].count < var_590b4c51)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_85645978
	Namespace: namespace_b376ff3f
	Checksum: 0x2C0D3C48
	Offset: 0x5750
	Size: 0xD2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_85645978(item)
{
	currtime = gettime();
	foreach(consumeditem in self.inventory.consumed)
	{
		if(item.var_a6762160.name == consumeditem.var_a6762160.name && currtime < consumeditem.endtime)
		{
			return consumeditem;
		}
	}
	return undefined;
}

/*
	Name: function_3fe6ef04
	Namespace: namespace_b376ff3f
	Checksum: 0xA0B0D7A1
	Offset: 0x5830
	Size: 0xF2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3fe6ef04()
{
	/#
		assert(isplayer(self));
	#/
	var_cfa0e915 = [];
	foreach(consumeditem in self.inventory.consumed)
	{
		if(isdefined(var_cfa0e915[consumeditem.var_a6762160.name]))
		{
			continue;
		}
		var_cfa0e915[consumeditem.var_a6762160.name] = 1;
	}
	return var_cfa0e915.size;
}

/*
	Name: function_7730442c
	Namespace: namespace_b376ff3f
	Checksum: 0xE892D467
	Offset: 0x5930
	Size: 0x570
	Parameters: 1
	Flags: Linked
*/
function function_7730442c(item)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(item));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return 0;
	}
	if(isdefined(item.starttime))
	{
		return 0;
	}
	if(self isinvehicle())
	{
		vehicle = self getvehicleoccupied();
		if(vehicle getoccupantseat(self) == 0)
		{
			self playsoundtoplayer(#"uin_default_action_denied", self);
			return 0;
		}
		currentweapon = self getcurrentweapon();
		if(isdefined(currentweapon) && is_true(currentweapon.var_29d24e37))
		{
			self playsoundtoplayer(#"uin_default_action_denied", self);
			return 0;
		}
	}
	if(item.var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		return function_6d647220(item);
	}
	consumeditem = self function_85645978(item);
	if(!isdefined(consumeditem) && self function_3fe6ef04() >= 10)
	{
		self playsoundtoplayer(#"uin_default_action_denied", self);
		return 0;
	}
	self callback::callback(#"hash_5775ae80fc576ea6", item);
	duration = int((isdefined(item.var_a6762160.duration) ? item.var_a6762160.duration : 0) * 1000);
	starttime = gettime();
	endtime = starttime + duration;
	item.starttime = starttime;
	item.endtime = endtime;
	if(isdefined(consumeditem))
	{
		consumeditem.endtime = consumeditem.endtime + duration;
		for(index = 0; index < 5; index++)
		{
			var_b619c089 = self.inventory.items[index];
			if(!isdefined(var_b619c089.endtime))
			{
				continue;
			}
			if(var_b619c089.var_a6762160.name == item.var_a6762160.name)
			{
				var_b619c089.starttime = consumeditem.starttime;
				var_b619c089.endtime = consumeditem.endtime;
			}
		}
	}
	else
	{
		consumeditem = spawnstruct();
		consumeditem.id = item.id;
		consumeditem.var_a6762160 = item.var_a6762160;
		consumeditem.starttime = gettime();
		consumeditem.endtime = consumeditem.starttime + duration;
	}
	self.inventory.consumed[self.inventory.consumed.size] = consumeditem;
	self function_b00db06(11, item.var_bd027dd9);
	self function_db2abc4(item);
	self function_6c36ab6b();
	if(isdefined(consumeditem.var_a6762160) && isdefined(consumeditem.var_a6762160.talents) && isarray(consumeditem.var_a6762160.talents))
	{
		foreach(talent in consumeditem.var_a6762160.talents)
		{
			if(talent.talent == #"hash_6b4f1f8c0c22026f")
			{
				self thread function_299d2131(300, 100, 0.1);
				break;
			}
		}
	}
	return 1;
}

/*
	Name: function_6d647220
	Namespace: namespace_b376ff3f
	Checksum: 0x87D3CDE
	Offset: 0x5EA8
	Size: 0x2D0
	Parameters: 1
	Flags: Linked
*/
function function_6d647220(item)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(item));
	#/
	if(!isdefined(item) || item.var_bd027dd9 == 32767)
	{
		return false;
	}
	if(!has_armor())
	{
		return false;
	}
	if(!isdefined(self.armor) || !isdefined(self.maxarmor))
	{
		return false;
	}
	if(self.armor == self.maxarmor)
	{
		return false;
	}
	self function_6e376bb1(item.var_bd027dd9, 1);
	var_344a1b3d = undefined;
	if(isplayer(self) && isdefined(self.inventory))
	{
		var_344a1b3d = self.inventory.items[6];
		if(!isdefined(var_344a1b3d) || var_344a1b3d.var_bd027dd9 == 32767 || var_344a1b3d.var_a6762160.itemtype != #"armor")
		{
			return false;
		}
	}
	if(isdefined(self.var_3f1410dd))
	{
		self.var_3f1410dd.var_2b021e34 = self.var_3f1410dd.var_2b021e34 + (int(min((isdefined(var_344a1b3d.var_a6762160.var_a3aa1ca2) ? var_344a1b3d.var_a6762160.var_a3aa1ca2 : 0), self.maxarmor - self.armor)));
		self.var_3f1410dd.var_7352c057++;
	}
	self.armor = int(min(self.armor + (isdefined(var_344a1b3d.var_a6762160.var_a3aa1ca2) ? var_344a1b3d.var_a6762160.var_a3aa1ca2 : 0), self.maxarmor));
	function_bdc03d88();
	self function_6c36ab6b();
	self function_db2abc4(item);
	return true;
}

/*
	Name: function_20ecd64d
	Namespace: namespace_b376ff3f
	Checksum: 0xEF5FB4FB
	Offset: 0x6180
	Size: 0x414
	Parameters: 0
	Flags: Linked
*/
function function_20ecd64d()
{
	/#
		assert(isplayer(self));
	#/
	var_bcc2655a = undefined;
	var_7f695eed = self.inventory.items[7];
	if(var_7f695eed.var_bd027dd9 !== 32767)
	{
		var_bcc2655a = var_7f695eed.var_a6762160;
	}
	if(getdvarint(#"hash_4cd4e3d15cf4ee7e", 1))
	{
		item = function_c42f2717(#"equipment", array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de", #"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f"), var_bcc2655a);
	}
	else
	{
		item = function_9da31874(#"equipment");
	}
	if(isdefined(item))
	{
		function_c8bedf1b(item);
	}
	else
	{
		self playsoundtoplayer(#"uin_default_action_denied", self);
	}
}

/*
	Name: function_e46ef859
	Namespace: namespace_b376ff3f
	Checksum: 0x3F088004
	Offset: 0x65A0
	Size: 0x1A4
	Parameters: 0
	Flags: Linked
*/
function function_e46ef859()
{
	/#
		assert(isplayer(self));
	#/
	var_bcc2655a = undefined;
	var_78d7ac4a = self.inventory.items[5];
	if(var_78d7ac4a.var_bd027dd9 !== 32767)
	{
		var_bcc2655a = var_78d7ac4a.var_a6762160;
	}
	if(getdvarint(#"hash_4cd4e3d15cf4ee7e", 1))
	{
		item = function_c42f2717(#"health", array(#"hash_1abfcce0e9955057", #"hash_ff50c93155e445f", #"hash_80292d121740f6f", #"hash_45ced3880667df22", #"hash_20699a922abaf2e1"), var_bcc2655a);
	}
	else
	{
		item = function_9da31874(#"health");
	}
	if(isdefined(item))
	{
		function_11fc9fa9(item);
	}
	else
	{
		self playsoundtoplayer(#"uin_default_action_denied", self);
	}
}

/*
	Name: function_fa4bb600
	Namespace: namespace_b376ff3f
	Checksum: 0xB2CC0A55
	Offset: 0x6750
	Size: 0x1D4
	Parameters: 0
	Flags: Linked
*/
function function_fa4bb600()
{
	/#
		assert(isplayer(self));
	#/
	var_bcc2655a = undefined;
	var_16f12c31 = self.inventory.items[17];
	if(var_16f12c31.var_bd027dd9 !== 32767)
	{
		var_bcc2655a = var_16f12c31.var_a6762160;
	}
	if(getdvarint(#"hash_4cd4e3d15cf4ee7e", 1))
	{
		item = function_c42f2717(#"scorestreak", array(#"hash_6eb09ea5da35e18f", #"hash_654445f6cc7a7e1c", #"hash_5f6d7361258230a", #"hash_ba416827a85877c", #"hash_24a1df9928527c11", #"hash_2294e52d4ac78b9a", #"hash_cefb3af28fb800b", #"hash_18fa1f3e4e43437c"), var_bcc2655a);
	}
	else
	{
		item = function_9da31874(#"scorestreak");
	}
	if(isdefined(item))
	{
		function_1ac37022(item);
	}
	else
	{
		self playsoundtoplayer(#"uin_default_action_denied", self);
	}
}

/*
	Name: function_a50547af
	Namespace: namespace_b376ff3f
	Checksum: 0x7A338FAE
	Offset: 0x6930
	Size: 0x1C4
	Parameters: 0
	Flags: Linked
*/
function function_a50547af()
{
	/#
		assert(isplayer(self));
	#/
	var_bcc2655a = undefined;
	var_16f12c31 = self.inventory.items[12];
	if(var_16f12c31.var_bd027dd9 !== 32767)
	{
		var_bcc2655a = var_16f12c31.var_a6762160;
	}
	if(getdvarint(#"hash_4cd4e3d15cf4ee7e", 1))
	{
		item = function_c42f2717(#"field_upgrade", array(#"hash_3f154f45479130ed", #"hash_2c9b75b17410f2de", #"hash_7ea42360bdf2de16", #"hash_649e3a841620150f", #"hash_47954c9090e3f900", #"hash_12f4d7321d9c5005", #"hash_681471b56324b3e"), var_bcc2655a);
	}
	else
	{
		item = function_9da31874(#"field_upgrade");
	}
	if(isdefined(item))
	{
		function_c8bedf1b(item);
	}
	else
	{
		self playsoundtoplayer(#"uin_default_action_denied", self);
	}
}

/*
	Name: function_9ba10b94
	Namespace: namespace_b376ff3f
	Checksum: 0x56EF9FD6
	Offset: 0x6B00
	Size: 0x244
	Parameters: 1
	Flags: Linked
*/
function function_9ba10b94(var_bd027dd9)
{
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	slotid = function_b246c573(var_bd027dd9);
	if(!isdefined(slotid))
	{
		return;
	}
	var_ad3db3b1 = [];
	var_8e198ed3 = [];
	foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
	{
		var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(slotid, var_259f58f3);
		item = self.inventory.items[var_f9f8c0b5];
		if(item.var_bd027dd9 != 32767)
		{
			var_ad3db3b1[var_ad3db3b1.size] = namespace_ad5a0cd6::function_f4a8d375(item.id);
			var_8e198ed3[var_8e198ed3.size] = item.id;
			function_5852cb7b(item.var_bd027dd9, 0, 1);
		}
	}
	function_418f9eb8(self.inventory.items[slotid].var_bd027dd9);
	for(index = 0; index < var_8e198ed3.size; index++)
	{
		self thread function_d7944517(var_8e198ed3[index], var_ad3db3b1[index], 1, 1);
	}
}

/*
	Name: function_9d102bbd
	Namespace: namespace_b376ff3f
	Checksum: 0xD1C2AF22
	Offset: 0x6D50
	Size: 0x81A
	Parameters: 3
	Flags: Linked
*/
function function_9d102bbd(var_b72297c2, var_bd027dd9, var_f73fa0a8)
{
	if(!isdefined(var_f73fa0a8))
	{
		var_f73fa0a8 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	if(!namespace_ad5a0cd6::can_pick_up(var_b72297c2))
	{
		return 0;
	}
	if(!isdefined(var_b72297c2) || !isdefined(var_b72297c2.var_a6762160) || var_b72297c2.var_a6762160.itemtype !== #"weapon")
	{
		return 0;
	}
	var_64d58696 = function_dfcacdc2(var_bd027dd9);
	if(!isdefined(var_64d58696))
	{
		return 0;
	}
	if(!isdefined(var_64d58696.var_a6762160) || var_64d58696.var_a6762160.itemtype != #"weapon")
	{
		return 0;
	}
	slotid = function_b246c573(var_bd027dd9);
	if(!isdefined(slotid))
	{
		return 0;
	}
	weapon = namespace_a0d533d1::function_2b83d3ff(var_64d58696);
	if(isdefined(self) && isdefined(weapon) && (self function_c1cef1ec(weapon) || !self function_bf2312f1(weapon)))
	{
		return 0;
	}
	if(isentity(var_b72297c2))
	{
		var_b72297c2.var_8e092725 = gettime();
	}
	else
	{
		function_54ca5536(var_b72297c2.id, gettime());
	}
	dropweapons = [];
	var_cf804066 = [];
	var_cc9e34fb = [];
	var_14174938 = [];
	if(namespace_a0d533d1::function_4bd83c04(var_b72297c2))
	{
		foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
		{
			var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(slotid, var_259f58f3);
			item = self.inventory.items[var_f9f8c0b5];
			if(item.var_bd027dd9 != 32767)
			{
				attachmentname = namespace_a0d533d1::function_2ced1d34(var_b72297c2, item.var_a6762160, 1);
				/#
					assert(!isdefined(var_cc9e34fb[var_259f58f3]));
				#/
				if(isdefined(attachmentname) && !isdefined(var_cc9e34fb[var_259f58f3]))
				{
					var_cc9e34fb[var_259f58f3] = item.var_a6762160;
				}
				else
				{
					dropweapons[dropweapons.size] = namespace_ad5a0cd6::function_f4a8d375(item.id);
					var_cf804066[var_cf804066.size] = item.id;
				}
				var_14174938[var_14174938.size] = item.var_bd027dd9;
			}
		}
	}
	if(isdefined(var_b72297c2.attachments) || isdefined(var_b72297c2.var_a6762160.attachments))
	{
		attachments = (isdefined(var_b72297c2.attachments) ? var_b72297c2.attachments : var_b72297c2.var_a6762160.attachments);
		foreach(attachment in attachments)
		{
			var_84704ed7 = attachment;
			if(!isdefined(var_84704ed7))
			{
				continue;
			}
			if(!isdefined(var_84704ed7.var_a6762160))
			{
				if(!namespace_ad5a0cd6::function_7363384a(attachment.var_6be1bec7))
				{
					continue;
				}
				var_84704ed7 = function_4ba8fde(attachment.var_6be1bec7);
				if(!isdefined(var_84704ed7))
				{
					continue;
				}
			}
			var_259f58f3 = namespace_a0d533d1::function_837f4a57(var_84704ed7.var_a6762160);
			if(!isdefined(var_259f58f3))
			{
				continue;
			}
			if(!isdefined(var_cc9e34fb[var_259f58f3]))
			{
				var_cc9e34fb[var_259f58f3] = var_84704ed7.var_a6762160;
				continue;
			}
			dropweapons[dropweapons.size] = namespace_ad5a0cd6::function_f4a8d375(var_84704ed7.id);
			var_cf804066[var_cf804066.size] = var_84704ed7.id;
		}
	}
	var_b72297c2.attachments = [];
	foreach(var_fe35755b in var_cc9e34fb)
	{
		if(isdefined(var_fe35755b.name))
		{
			var_84704ed7 = function_4ba8fde(var_fe35755b.name);
			var_e38a0464 = function_520b16d6();
			var_e38a0464.count = 1;
			var_e38a0464.id = var_84704ed7.id;
			var_e38a0464.var_bd027dd9 = var_e38a0464.id;
			var_e38a0464.var_a6762160 = var_84704ed7.var_a6762160;
			var_b72297c2.attachments[var_b72297c2.attachments.size] = var_e38a0464;
		}
	}
	for(index = 0; index < var_14174938.size; index++)
	{
		var_ddd377f2 = var_14174938[index];
		function_5852cb7b(var_ddd377f2, 0, 1);
	}
	dropweapon = self function_418f9eb8(var_bd027dd9);
	for(index = 0; index < var_cf804066.size; index++)
	{
		self thread function_d7944517(var_cf804066[index], dropweapons[index], 1, 1);
	}
	if(var_f73fa0a8 && isdefined(dropweapon))
	{
		dropweapon.var_864ea466 = 1;
		if(isentity(dropweapon))
		{
			item_world::function_7730442c(dropweapon);
		}
	}
	item_world::function_de2018e3(var_b72297c2, self, slotid);
	item_world::function_7730442c(var_b72297c2);
	if(isdefined(dropweapon))
	{
		return dropweapon;
	}
}

/*
	Name: function_b76f46a0
	Namespace: namespace_b376ff3f
	Checksum: 0x471A13D3
	Offset: 0x7578
	Size: 0x332
	Parameters: 3
	Flags: Linked
*/
function function_b76f46a0(var_b72297c2, var_bd027dd9, var_f73fa0a8)
{
	if(!isdefined(var_f73fa0a8))
	{
		var_f73fa0a8 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	if(!namespace_ad5a0cd6::can_pick_up(var_b72297c2))
	{
		return 0;
	}
	if(!isdefined(var_b72297c2) || !isdefined(var_b72297c2.var_a6762160) || var_b72297c2.var_a6762160.itemtype !== #"weapon")
	{
		return 0;
	}
	var_64d58696 = function_dfcacdc2(var_bd027dd9);
	if(!isdefined(var_64d58696))
	{
		return 0;
	}
	if(!isdefined(var_64d58696.var_a6762160) || var_64d58696.var_a6762160.itemtype != #"weapon")
	{
		return 0;
	}
	slotid = function_b246c573(var_bd027dd9);
	if(!isdefined(slotid))
	{
		return 0;
	}
	weapon = namespace_a0d533d1::function_2b83d3ff(var_64d58696);
	if(isdefined(self) && isdefined(weapon) && (self function_c1cef1ec(weapon) || !self function_bf2312f1(weapon)))
	{
		return 0;
	}
	if(isentity(var_b72297c2))
	{
		var_b72297c2.var_8e092725 = gettime();
	}
	else
	{
		function_54ca5536(var_b72297c2.id, gettime());
	}
	dropweapons = [];
	var_cf804066 = [];
	var_cc9e34fb = [];
	var_14174938 = [];
	dropweapon = self function_418f9eb8(var_bd027dd9);
	for(index = 0; index < var_cf804066.size; index++)
	{
		self thread function_d7944517(var_cf804066[index], dropweapons[index], 1, 1);
	}
	if(var_f73fa0a8 && isdefined(dropweapon))
	{
		dropweapon.var_864ea466 = 1;
		if(isentity(dropweapon))
		{
			item_world::function_7730442c(dropweapon);
		}
	}
	item_world::function_de2018e3(var_b72297c2, self, slotid);
	item_world::function_7730442c(var_b72297c2);
	if(isdefined(dropweapon))
	{
		return dropweapon;
	}
}

/*
	Name: function_fba40e6c
	Namespace: namespace_b376ff3f
	Checksum: 0xDCAB3F4
	Offset: 0x78B8
	Size: 0x1B0
	Parameters: 1
	Flags: Linked
*/
function function_fba40e6c(item)
{
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	if(!namespace_ad5a0cd6::can_pick_up(item))
	{
		return 0;
	}
	var_158e86a3 = self function_e66dcff5(item, 1);
	dropitem = self.inventory.items[var_158e86a3];
	self function_85287396(1);
	self function_418f9eb8(dropitem.var_bd027dd9);
	slotid = function_e66dcff5(item, 1);
	var_a6762160 = item.var_a6762160;
	self item_world::function_de2018e3(item, self, slotid);
	var_b619c089 = self function_8babc9f9(var_a6762160);
	item_world::function_7730442c(item);
	if(isdefined(var_b619c089))
	{
		self function_5a0ba107(var_b619c089.var_bd027dd9);
	}
	self function_85287396(0);
	return dropitem;
}

/*
	Name: function_e66dcff5
	Namespace: namespace_b376ff3f
	Checksum: 0xBB317558
	Offset: 0x7A70
	Size: 0x848
	Parameters: 2
	Flags: Linked
*/
function function_e66dcff5(item, var_662e1704)
{
	if(!isdefined(var_662e1704))
	{
		var_662e1704 = 0;
	}
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.inventory))
	{
		return undefined;
	}
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return undefined;
	}
	if(namespace_a0d533d1::function_819781bf())
	{
		var_662e1704 = 1;
	}
	switch(item.var_a6762160.itemtype)
	{
		case "ammo":
		{
			return undefined;
		}
		case "hash_56d6621e6c4caf07":
		{
			return 11;
		}
		case "weapon":
		{
			foreach(slotid in namespace_a0d533d1::function_4905dddf())
			{
				if(self.inventory.items[slotid].var_bd027dd9 === 32767)
				{
					return slotid;
				}
			}
			var_64d58696 = function_230ceec4(get_current_weapon());
			if(!isdefined(var_64d58696))
			{
				return;
			}
			return function_b246c573(var_64d58696.var_bd027dd9);
		}
		case "backpack":
		{
			return 8;
		}
		case "armor":
		{
			return 6;
		}
		case "resource":
		{
			if(namespace_ad5a0cd6::function_41f06d9d(item.var_a6762160))
			{
				return 9;
			}
			return 10;
		}
		case "equipment":
		{
			if(var_662e1704 || self.inventory.items[7].var_bd027dd9 === 32767)
			{
				return 7;
			}
			break;
		}
		case "field_upgrade":
		{
			if(var_662e1704 || self.inventory.items[12].var_bd027dd9 === 32767)
			{
				return 12;
			}
			break;
		}
		case "tactical":
		{
			if(var_662e1704 || self.inventory.items[13].var_bd027dd9 === 32767)
			{
				return 13;
			}
			break;
		}
		case "health":
		{
			if(var_662e1704 || self.inventory.items[5].var_bd027dd9 === 32767)
			{
				return 5;
			}
			break;
		}
		case "hash_63c2e59c903465e6":
		{
			if(var_662e1704 || self.inventory.items[14].var_bd027dd9 === 32767)
			{
				return 14;
			}
			break;
		}
		case "hash_63c2e49c90346433":
		{
			if(var_662e1704 || self.inventory.items[15].var_bd027dd9 === 32767)
			{
				return 15;
			}
			break;
		}
		case "hash_63c2e39c90346280":
		{
			if(var_662e1704 || self.inventory.items[16].var_bd027dd9 === 32767)
			{
				return 16;
			}
			break;
		}
		case "scorestreak":
		{
			if(var_662e1704 || self.inventory.items[17].var_bd027dd9 === 32767)
			{
				return 17;
			}
			break;
		}
	}
	if(item.var_a6762160.itemtype == #"attachment")
	{
		var_4838b749 = function_d768ea30();
		if(var_662e1704)
		{
			var_4838b749 = (var_4838b749 == (17 + 1) ? ((17 + 1) + 8) + 1 : 17 + 1);
		}
		if(isdefined(var_4838b749))
		{
			var_f0dc4e93 = namespace_ad5a0cd6::function_970b8d86(var_4838b749);
			if(self.inventory.items[var_4838b749].var_bd027dd9 != 32767 && self.inventory.items[var_4838b749].var_a6762160.itemtype != #"scorestreak")
			{
				var_ceefbd10 = namespace_a0d533d1::function_837f4a57(item.var_a6762160);
				var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_ceefbd10);
				var_64d58696 = self function_dfcacdc2(var_f0dc4e93);
				attachmentname = namespace_a0d533d1::function_2ced1d34(var_64d58696, item.var_a6762160, 1);
				if(isdefined(attachmentname))
				{
					return var_f9f8c0b5;
				}
			}
		}
	}
	if(is_true(item.var_a6762160.stackable))
	{
		weapon = namespace_ad5a0cd6::function_35e06774(item.var_a6762160);
		if(isdefined(weapon))
		{
			var_590b4c51 = namespace_a0d533d1::function_cfa794ca(self.inventory.var_7658cbec, item.var_a6762160);
			if(var_590b4c51 > 1)
			{
				foreach(i, spawnitem in self.inventory.items)
				{
					if(spawnitem.id == 32767)
					{
						continue;
					}
					var_b619c089 = function_b1702735(spawnitem.id);
					if(var_b619c089.var_a6762160.name != item.var_a6762160.name)
					{
						continue;
					}
					if(self.inventory.items[i].count < var_590b4c51)
					{
						return i;
					}
				}
			}
		}
	}
	if(!namespace_a0d533d1::function_819781bf())
	{
		for(index = 0; index < self.inventory.var_c212de25; index++)
		{
			if(self.inventory.items[index].id == 32767)
			{
				return index;
			}
		}
	}
	return undefined;
}

/*
	Name: drop_armor
	Namespace: namespace_b376ff3f
	Checksum: 0xEFBFEF41
	Offset: 0x82C0
	Size: 0xDC
	Parameters: 3
	Flags: Linked
*/
function drop_armor(var_be90d3da, var_7cab8e12, targetname)
{
	if(!isdefined(var_be90d3da))
	{
		var_be90d3da = 0;
	}
	if(!isdefined(var_7cab8e12))
	{
		var_7cab8e12 = undefined;
	}
	if(!isdefined(targetname))
	{
		targetname = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	if(self has_armor())
	{
		item = self.inventory.items[6];
		self thread function_418f9eb8(item.var_bd027dd9, var_be90d3da, var_7cab8e12, targetname);
		return true;
	}
	return false;
}

/*
	Name: function_d86d7ac7
	Namespace: namespace_b376ff3f
	Checksum: 0xC779826C
	Offset: 0x83A8
	Size: 0xFC
	Parameters: 3
	Flags: Linked
*/
function function_d86d7ac7(var_be90d3da, var_7cab8e12, targetname)
{
	if(!isdefined(var_be90d3da))
	{
		var_be90d3da = 0;
	}
	if(!isdefined(var_7cab8e12))
	{
		var_7cab8e12 = undefined;
	}
	if(!isdefined(targetname))
	{
		targetname = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	for(index = self.inventory.var_c212de25; index < 5; index++)
	{
		var_b619c089 = self.inventory.items[index];
		if(var_b619c089.var_bd027dd9 != 32767)
		{
			self thread function_418f9eb8(var_b619c089.var_bd027dd9, var_be90d3da, var_7cab8e12, targetname);
		}
	}
}

/*
	Name: function_418f9eb8
	Namespace: namespace_b376ff3f
	Checksum: 0x9475EBF7
	Offset: 0x84B0
	Size: 0x7CA
	Parameters: 6
	Flags: Linked
*/
function function_418f9eb8(var_bd027dd9, var_be90d3da, var_7cab8e12, targetname, var_4a6f595d, immediately)
{
	if(!isdefined(var_be90d3da))
	{
		var_be90d3da = 0;
	}
	if(!isdefined(var_7cab8e12))
	{
		var_7cab8e12 = undefined;
	}
	if(!isdefined(targetname))
	{
		targetname = undefined;
	}
	if(!isdefined(var_4a6f595d))
	{
		var_4a6f595d = 1;
	}
	if(!isdefined(immediately))
	{
		immediately = 0;
	}
	/#
		assert(isplayer(self));
	#/
	self endon(#"death");
	dropitem = undefined;
	item = function_dfcacdc2(var_bd027dd9);
	if(!isdefined(item))
	{
		return dropitem;
	}
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	stockammo = 0;
	var_4f8a16ec = getgametypesetting(#"hash_b76e50c1202aa23");
	if(!var_4f8a16ec && isdefined(weapon) && (item.var_a6762160.itemtype === #"weapon" || item.var_a6762160.itemtype === #"scorestreak"))
	{
		stockammo = self getweaponammostock(weapon);
	}
	if(!immediately && isdefined(self) && isdefined(weapon) && get_current_weapon() == weapon && self isfiring())
	{
		waitframe(1);
	}
	if(!isdefined(self) || (isdefined(weapon) && get_current_weapon() == weapon && self isfiring()))
	{
		return dropitem;
	}
	/#
		if(!isdefined(var_7cab8e12) && getdvarint(#"hash_5f50ef95773c29b5", 0))
		{
			for(i = getdvarint(#"hash_5f50ef95773c29b5", 0); i > 0; i--)
			{
				dropitem = self function_d7944517(item.id, weapon, item.count, item.amount, var_be90d3da, var_7cab8e12, targetname, (isdefined(item.attachments) ? item.attachments : array()));
			}
			return dropitem;
		}
	#/
	function_60706bdb(var_bd027dd9);
	count = (isdefined(item.count) ? item.count : 1);
	amount = (isdefined(item.amount) ? item.amount : 0);
	var_104acafa = isdefined(item.endtime);
	var_337ff88 = self.inventory.items[8].var_bd027dd9 === var_bd027dd9;
	if(self function_23335063(var_bd027dd9, 0))
	{
		if(var_337ff88 && var_4a6f595d)
		{
			function_d86d7ac7(var_be90d3da, var_7cab8e12, targetname);
			function_ec238da8();
		}
		if(count > 0)
		{
			item.var_59361ab4 = 0;
			namespace_a0d533d1::function_6e9e7169(item);
			if(!var_104acafa)
			{
				weapon = namespace_a0d533d1::function_2b83d3ff(item);
				if(isdefined(level.var_fe1dd361) && isdefined(level.var_b059ce9e))
				{
					weaponoptions = [[level.var_fe1dd361]](item);
					var_e91aba42 = [[level.var_b059ce9e]](item);
				}
				if(isdefined(level.var_8822a6d5))
				{
					var_908f65ca = [[level.var_8822a6d5]](item);
				}
				dropitem = self function_d7944517(item.id, weapon, count, amount, var_be90d3da, var_7cab8e12, targetname, (isdefined(item.attachments) ? item.attachments : array()), stockammo, item.aat, item.var_a8bccf69, immediately, weaponoptions, var_e91aba42, var_908f65ca);
			}
			else
			{
				consumeditem = function_85645978(item);
				if(isdefined(consumeditem))
				{
					var_ee0e9af9 = [];
					for(index = 0; index < 5; index++)
					{
						var_b619c089 = self.inventory.items[index];
						if(!isdefined(var_b619c089.endtime))
						{
							continue;
						}
						if(var_b619c089.var_a6762160.name == item.var_a6762160.name)
						{
							var_ee0e9af9[var_ee0e9af9.size] = var_b619c089;
						}
					}
					remaining = consumeditem.endtime - gettime();
					consumeditem.endtime = consumeditem.endtime - (remaining / (var_ee0e9af9.size + 1));
					for(index = 0; index < var_ee0e9af9.size; index++)
					{
						var_b619c089 = var_ee0e9af9[index];
						var_b619c089.starttime = consumeditem.starttime;
						var_b619c089.endtime = consumeditem.endtime;
					}
				}
			}
			if(isdefined(item.attachments))
			{
				attachments = arraycopy(item.attachments);
				foreach(attachment in attachments)
				{
					if(!isdefined(attachment))
					{
						continue;
					}
					function_5852cb7b(attachment.var_bd027dd9);
				}
			}
			return dropitem;
		}
	}
	return dropitem;
}

/*
	Name: function_11089ed8
	Namespace: namespace_b376ff3f
	Checksum: 0xE9EA0FC2
	Offset: 0x8C88
	Size: 0x20A
	Parameters: 2
	Flags: Linked
*/
function function_11089ed8(item, var_aec6fa7f)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(item));
	#/
	self function_db2abc4(item);
	var_a6762160 = item.var_a6762160;
	var_95162a97 = var_a6762160.weapon;
	var_1326fcc7 = (isdefined(var_aec6fa7f) ? var_aec6fa7f : (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1));
	var_2f399b51 = namespace_a0d533d1::function_2879cbe0(self.inventory.var_7658cbec, var_95162a97);
	currentammostock = self getweaponammostock(var_95162a97);
	var_9b9ba643 = var_2f399b51 - currentammostock;
	addammo = int(min(var_1326fcc7, var_9b9ba643));
	if(isdefined(var_95162a97) && var_95162a97 != level.weaponnone)
	{
		self.inventory.ammo[var_95162a97.name] = item.id;
		self function_fc9f8b05(var_95162a97, addammo);
		if(isdefined(var_aec6fa7f))
		{
			return var_1326fcc7 - addammo;
		}
		return 0;
	}
	/#
		assertmsg(("" + var_a6762160.name) + "");
	#/
	return var_1326fcc7 - addammo;
}

/*
	Name: function_4cde30fa
	Namespace: namespace_b376ff3f
	Checksum: 0x167ADD73
	Offset: 0x8EA0
	Size: 0x196
	Parameters: 2
	Flags: Linked
*/
function function_4cde30fa(var_b619c089, var_a6762160)
{
	if(game.state == #"pregame" || !isplayer(self) || isdefined(self.var_3f1410dd) || !isdefined(var_b619c089) || !isdefined(var_a6762160))
	{
		return;
	}
	loc_00008F84:
	self.var_3f1410dd = {#died:0, #broken:0, #hash_2b021e34:0, #hash_7352c057:0, #damage_taken:0, #tier:(isdefined(var_a6762160.armortier) ? var_a6762160.armortier : 1), #hash_4550558c:(isdefined(var_b619c089.amount) ? var_b619c089.amount : 0), #end_time:0, #start_time:function_f8d53445(), #player_xuid:int(self getxuid(1))};
}

/*
	Name: function_bef83dc6
	Namespace: namespace_b376ff3f
	Checksum: 0xC63AFB61
	Offset: 0x9040
	Size: 0xF6
	Parameters: 0
	Flags: Linked
*/
function function_bef83dc6()
{
	if(game.state == #"pregame" || !isplayer(self) || !isdefined(self.var_3f1410dd))
	{
		return;
	}
	self.var_3f1410dd.broken = isdefined(self.armor) && self.armor <= 0;
	self.var_3f1410dd.died = isdefined(self.health) && self.health <= 0;
	self.var_3f1410dd.end_time = function_f8d53445();
	function_92d1707f(#"hash_3d5d9b3e2bc86b28", self.var_3f1410dd);
	self.var_3f1410dd = undefined;
}

/*
	Name: equip_armor
	Namespace: namespace_b376ff3f
	Checksum: 0x5D4379F0
	Offset: 0x9140
	Size: 0x2D4
	Parameters: 1
	Flags: Linked
*/
function equip_armor(item)
{
	var_a6762160 = item.var_a6762160;
	var_b619c089 = function_dfcacdc2(item.var_bd027dd9);
	if(!isdefined(var_b619c089))
	{
		return;
	}
	self function_db2abc4(item);
	self armor::set_armor(var_b619c089.amount, (isdefined(var_a6762160.amount) ? var_a6762160.amount : 0), (isdefined(var_a6762160.armortier) ? var_a6762160.armortier : 1), (isdefined(var_a6762160.var_99c0cb08) ? var_a6762160.var_99c0cb08 : 1), (isdefined(var_a6762160.var_2ee21ae6) ? var_a6762160.var_2ee21ae6 : 1), (isdefined(var_a6762160.var_c690c73d) ? var_a6762160.var_c690c73d : 1), (isdefined(var_a6762160.var_99edb6a3) ? var_a6762160.var_99edb6a3 : 1), (isdefined(var_a6762160.var_22c3ab38) ? var_a6762160.var_22c3ab38 : 1), (isdefined(var_a6762160.var_9f307988) ? var_a6762160.var_9f307988 : 1), (isdefined(var_a6762160.var_7a80f06e) ? var_a6762160.var_7a80f06e : 1), (isdefined(var_a6762160.var_da5a2805) ? var_a6762160.var_da5a2805 : 1), (isdefined(var_a6762160.var_f2902d7b) ? var_a6762160.var_f2902d7b : 1), var_a6762160.var_19f48bbe);
	self function_4cde30fa(var_b619c089, var_a6762160);
	self.inventory.items[6] = var_b619c089;
	self function_b00db06(6, item.var_bd027dd9);
	self clientfield::set_player_uimodel("hudItems.armorType", (isdefined(var_a6762160.armortier) ? var_a6762160.armortier : 1));
	self callback::callback("equip_armor", {#tier:var_a6762160.armortier});
}

/*
	Name: function_e258cef5
	Namespace: namespace_b376ff3f
	Checksum: 0x1C42CCA6
	Offset: 0x9420
	Size: 0x8A
	Parameters: 2
	Flags: Linked
*/
function function_e258cef5(var_bd027dd9, itemtype)
{
	if(var_bd027dd9 == 32767)
	{
		return undefined;
	}
	item = function_dfcacdc2(var_bd027dd9);
	if(!isdefined(item) || !isdefined(item.var_a6762160) || item.var_a6762160.itemtype != itemtype)
	{
		return undefined;
	}
	return item;
}

/*
	Name: function_224c09c9
	Namespace: namespace_b376ff3f
	Checksum: 0xBB950BB8
	Offset: 0x94B8
	Size: 0x464
	Parameters: 5
	Flags: Linked
*/
function function_224c09c9(item, var_610add8d, var_d6f68de7, var_a3a17c55, switchweapon)
{
	if(!isdefined(var_a3a17c55))
	{
		var_a3a17c55 = 1;
	}
	if(!isdefined(switchweapon))
	{
		switchweapon = 1;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isstruct(item));
	#/
	var_4e2a1ed8 = function_e258cef5(var_610add8d, #"weapon");
	if(!isdefined(var_4e2a1ed8))
	{
		return;
	}
	if(namespace_a0d533d1::function_9e9c82a6(var_4e2a1ed8, item, 0))
	{
		function_b3342af3(item, undefined, var_4e2a1ed8);
		offset = namespace_a0d533d1::function_837f4a57(item.var_a6762160);
		var_ac396b2f = function_d7dbfe3c(var_4e2a1ed8);
		if(!isdefined(var_ac396b2f))
		{
			return;
		}
		var_dd6937a8 = namespace_a0d533d1::function_dfaca25e(var_ac396b2f, offset);
		var_2134bf0d = self.inventory.items[var_dd6937a8];
		var_4767e61d = function_b246c573(item.var_bd027dd9);
		if(!isdefined(var_4767e61d))
		{
			return;
		}
		var_97cc940d = 0;
		if(isdefined(var_d6f68de7))
		{
			var_3f6f5f3c = function_e258cef5(var_d6f68de7, #"weapon");
			var_2134bf0d = self.inventory.items[var_dd6937a8];
			if(isdefined(var_3f6f5f3c) && isdefined(var_2134bf0d) && isdefined(function_e258cef5(var_2134bf0d.var_bd027dd9, #"attachment")) && function_f3195b3d(var_2134bf0d.var_bd027dd9))
			{
				var_97cc940d = 1;
			}
		}
		if(!var_97cc940d)
		{
			function_26c87da8(var_4767e61d, var_dd6937a8);
		}
		self function_b00db06(6, item.var_bd027dd9);
		foreach(slot in array("attachSlotOptics", "attachSlotMuzzle", "attachSlotBarrel", "attachSlotUnderbarrel", "attachSlotBody", "attachSlotMagazine", "attachSlotHandle", "attachSlotStock"))
		{
			if(is_true(item.var_a6762160.(slot)))
			{
				function_41a57271(var_4e2a1ed8, slot, undefined, item);
			}
		}
		function_d019bf1d(var_610add8d, undefined, undefined, 0);
		namespace_a0d533d1::function_6e9e7169(var_4e2a1ed8);
		function_2b4d7b66(var_4e2a1ed8, switchweapon, undefined, var_a3a17c55, 0);
		self function_db2abc4(item);
		if(var_97cc940d)
		{
			function_224c09c9(var_2134bf0d, var_d6f68de7, undefined, var_a3a17c55, 1);
		}
	}
}

/*
	Name: function_2dab8a7f
	Namespace: namespace_b376ff3f
	Checksum: 0x4106EF50
	Offset: 0x9928
	Size: 0x16C
	Parameters: 1
	Flags: Linked
*/
function function_2dab8a7f(item)
{
	/#
		assert(isplayer(self));
	#/
	var_b619c089 = function_dfcacdc2(item.var_bd027dd9);
	if(!isdefined(var_b619c089))
	{
		return;
	}
	slotid = function_b246c573(item.var_bd027dd9);
	if(!isdefined(slotid))
	{
		return;
	}
	self function_db2abc4(item);
	function_26c87da8(slotid, 8);
	self.inventory.var_7658cbec = namespace_a0d533d1::function_d8cebda3(item.var_a6762160);
	if(self.inventory.var_7658cbec & 1)
	{
		self.inventory.var_c212de25 = 5;
	}
	self.inventory.items[8] = var_b619c089;
	self function_b00db06(6, item.var_bd027dd9);
	self clientfield::set_player_uimodel("hudItems.hasBackpack", 1);
}

/*
	Name: debug_print
	Namespace: namespace_b376ff3f
	Checksum: 0x8BDEB2A6
	Offset: 0x9AA0
	Size: 0xE4
	Parameters: 2
	Flags: Linked
*/
function debug_print(message, weapon)
{
	/#
		if(getdvarint(#"hash_33bb7d70dd139207", 0) > 0)
		{
			weaponname = "";
			if(isdefined(weapon))
			{
				weaponname = "" + function_9e72a96(weapon.name);
			}
			self iprintlnbold(("" + message) + weaponname);
			println(((("" + self.playername) + "") + message) + weaponname);
		}
	#/
}

/*
	Name: function_c8bedf1b
	Namespace: namespace_b376ff3f
	Checksum: 0xF7AA38F5
	Offset: 0x9B90
	Size: 0x624
	Parameters: 1
	Flags: Linked
*/
function function_c8bedf1b(item)
{
	self notify("1f3817a90cc83229");
	self endon("1f3817a90cc83229");
	/#
		assert(isplayer(self));
	#/
	while(isdefined(self) && is_true(self.var_10abd91d))
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return;
	}
	var_4767e61d = 7;
	switch(item.var_a6762160.itemtype)
	{
		case "field_upgrade":
		{
			var_4767e61d = 12;
			break;
		}
		case "tactical":
		{
			var_4767e61d = 13;
			break;
		}
	}
	var_a6762160 = item.var_a6762160;
	weapon = var_a6762160.weapon;
	debug_print("equip_equipment:", weapon);
	var_7f695eed = self.inventory.items[var_4767e61d];
	if(var_7f695eed.id != 32767)
	{
		var_355db408 = function_b1702735(var_7f695eed.id).var_a6762160.weapon;
		if(isdefined(var_355db408))
		{
			slot = self gadgetgetslot(var_355db408);
			if(slot >= 0 && slot < 3)
			{
				if(self gadgetisprimed(slot))
				{
					debug_print("equip_equipment: fail: GadgetIsPrimed", var_355db408);
					return;
				}
			}
			if(self function_c1cef1ec(var_355db408))
			{
				debug_print("equip_equipment: fail: offhand equipment in use", var_355db408);
				return;
			}
			if(isdefined(self.var_6d2ad74f) && self.var_6d2ad74f === var_355db408)
			{
				debug_print("equip_equipment: fail: equipment waiting for removal", var_355db408);
				return;
			}
			if(var_7f695eed.var_bd027dd9 != item.var_bd027dd9)
			{
				if(namespace_a0d533d1::function_819781bf())
				{
					function_418f9eb8(var_7f695eed.var_bd027dd9);
				}
				else
				{
					function_d019bf1d(var_7f695eed.var_bd027dd9);
				}
			}
		}
	}
	if(isdefined(weapon) && weapon != level.weaponnone)
	{
		self function_db2abc4(item);
		slotid = function_b246c573(item.var_bd027dd9);
		if(isdefined(slotid) && slotid < self.inventory.var_c212de25)
		{
			function_26c87da8(slotid, var_4767e61d);
		}
		weaponoptions = undefined;
		var_e91aba42 = undefined;
		var_908f65ca = undefined;
		var_cbdeb265 = level.nullprimaryoffhand;
		switch(item.var_a6762160.itemtype)
		{
			case "tactical":
			{
				var_cbdeb265 = level.nullsecondaryoffhand;
				break;
			}
			case "field_upgrade":
			{
				var_cbdeb265 = level.var_3488e988;
				break;
			}
		}
		self function_5110caa3(var_cbdeb265, weapon, undefined, undefined, undefined, weaponoptions, var_e91aba42, var_908f65ca);
		self function_b00db06(6, item.var_bd027dd9);
		for(i = 0; i < self.inventory.items.size; i++)
		{
			if(self.inventory.items[i].var_bd027dd9 === item.var_bd027dd9)
			{
				if(weapon.gadget_type == 0)
				{
					if(self hasweapon(weapon))
					{
						self setweaponammoclip(weapon, self.inventory.items[i].count);
					}
				}
				else
				{
					self function_c6be9f7f(weapon, self.inventory.items[i].count);
				}
				break;
			}
		}
		debug_print("equip_equipment: success", weapon);
		if(var_4767e61d == 7)
		{
			self clientfield::set_player_uimodel("hudItems.equipmentStackCount", function_bba770de(self.inventory.items[var_4767e61d].var_a6762160));
		}
		return;
	}
	/#
		assertmsg(("" + var_a6762160.name) + "");
	#/
}

/*
	Name: function_11fc9fa9
	Namespace: namespace_b376ff3f
	Checksum: 0xE6F7253
	Offset: 0xA1C0
	Size: 0x50C
	Parameters: 1
	Flags: Linked
*/
function function_11fc9fa9(item)
{
	self notify("8b0c97c2a607cad");
	self endon("8b0c97c2a607cad");
	/#
		assert(isplayer(self));
	#/
	while(isdefined(self) && is_true(self.var_10abd91d))
	{
		waitframe(1);
	}
	if(!isdefined(item) || !isdefined(self))
	{
		return;
	}
	var_a6762160 = item.var_a6762160;
	weapon = var_a6762160.weapon;
	debug_print("equip_health:", weapon);
	if(isdefined(self.var_d6cd7d80))
	{
		debug_print("equip_health: fail: offhand equipment casting", self.var_d6cd7d80);
		return;
	}
	if(isdefined(self.var_e42fb511))
	{
		debug_print("equip_health: fail: offhand equipment primed", self.var_e42fb511);
		return;
	}
	if(isdefined(self.inventory) && isdefined(self.inventory.items[5]))
	{
		var_b6edb3b2 = self.inventory.items[5].var_bd027dd9;
	}
	if(isdefined(var_b6edb3b2) && var_b6edb3b2 != 32767)
	{
		var_2337367a = function_dfcacdc2(var_b6edb3b2);
		if(isdefined(var_2337367a))
		{
			var_355db408 = namespace_a0d533d1::function_2b83d3ff(var_2337367a);
			if(isdefined(var_355db408))
			{
				slot = self gadgetgetslot(var_355db408);
				if(slot >= 0 && slot < 3)
				{
					if(self gadgetisprimed(slot))
					{
						debug_print("equip_health: fail: GadgetIsPrimed", var_355db408);
						return;
					}
					if(self gadgetisactive(slot))
					{
						debug_print("equip_health: fail: GadgetIsActive", var_355db408);
						return;
					}
				}
				if(self function_c1cef1ec(var_355db408))
				{
					debug_print("equip_health: fail: offhand equipment in use", var_355db408);
					return;
				}
				if(isdefined(self.var_6d2ad74f) && self.var_6d2ad74f === var_355db408)
				{
					debug_print("equip_health: fail: equipment waiting for removal", var_355db408);
					return;
				}
			}
		}
		if(var_2337367a.var_bd027dd9 != item.var_bd027dd9)
		{
			function_d019bf1d(var_b6edb3b2);
		}
	}
	if(isdefined(weapon) && weapon != level.weaponnone)
	{
		self function_db2abc4(item);
		slotid = function_b246c573(item.var_bd027dd9);
		if(isdefined(slotid) && slotid < self.inventory.var_c212de25)
		{
			function_26c87da8(slotid, 5);
		}
		self function_5110caa3(level.var_ef61b4b5, weapon);
		self function_b00db06(6, item.var_bd027dd9);
		self clientfield::set_player_uimodel("hudItems.healthItemstackCount", function_bba770de(item.var_a6762160));
		slot = self gadgetgetslot(weapon);
		if(slot >= 0 && slot < 3)
		{
			self function_19ed70ca(slot, 0);
		}
		debug_print("equip_health: success", weapon);
		self function_755a35c5();
		return;
	}
	/#
		assertmsg(("" + var_a6762160.name) + "");
	#/
}

/*
	Name: function_854cf2c3
	Namespace: namespace_b376ff3f
	Checksum: 0xA106E4DD
	Offset: 0xA6D8
	Size: 0x224
	Parameters: 1
	Flags: Linked
*/
function function_854cf2c3(item)
{
	self notify("46c0bde19c6a9ba5");
	self endon("46c0bde19c6a9ba5");
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return;
	}
	var_b619c089 = function_dfcacdc2(item.var_bd027dd9);
	if(!isdefined(var_b619c089))
	{
		return;
	}
	var_a6762160 = item.var_a6762160;
	weapon = var_a6762160.weapon;
	slotid = function_b246c573(item.var_bd027dd9);
	if(!isdefined(slotid))
	{
		return;
	}
	perkslot = namespace_a0d533d1::function_417ec8b9(var_a6762160);
	if(!isdefined(perkslot))
	{
		return;
	}
	self function_db2abc4(item);
	function_26c87da8(slotid, perkslot);
	if(item.var_a6762160.name == #"hash_6ac2848a2f6492ac")
	{
		backpack = namespace_ad5a0cd6::function_49ce7663(#"hash_6a677bcb21d4432b");
		var_fa3df96 = self function_e66dcff5(backpack);
		self item_world::function_de2018e3(backpack, self, var_fa3df96);
	}
	self.inventory.items[perkslot] = var_b619c089;
	self function_b00db06(6, item.var_bd027dd9);
}

/*
	Name: function_1ac37022
	Namespace: namespace_b376ff3f
	Checksum: 0xF8D80B50
	Offset: 0xA908
	Size: 0x26C
	Parameters: 2
	Flags: Linked
*/
function function_1ac37022(item, ammo)
{
	self notify("528075944681741a");
	self endon("528075944681741a");
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return;
	}
	var_b619c089 = function_dfcacdc2(item.var_bd027dd9);
	if(!isdefined(var_b619c089))
	{
		return;
	}
	var_a6762160 = item.var_a6762160;
	weapon = var_a6762160.weapon;
	slotid = function_b246c573(item.var_bd027dd9);
	if(!isdefined(slotid))
	{
		return;
	}
	var_f4cc972d = 17;
	self function_db2abc4(item);
	function_26c87da8(slotid, var_f4cc972d);
	self.inventory.items[var_f4cc972d] = var_b619c089;
	self function_b00db06(6, item.var_bd027dd9);
	var_4fead4c7 = undefined;
	killstreakbundle = getscriptbundle(item.var_a6762160.killstreak);
	if(is_true(item.var_a6762160.var_ef70c5b3))
	{
		var_4fead4c7 = killstreakbundle.var_fc0c8eae.name;
	}
	else
	{
		var_4fead4c7 = killstreakbundle.var_d3413870;
	}
	if(isdefined(var_4fead4c7))
	{
		killstreaks::give(var_4fead4c7);
		if(isdefined(ammo) && isdefined(weapon) && weapon.name != #"ultimate_turret")
		{
			self setweaponammostock(weapon, ammo);
		}
	}
}

/*
	Name: function_5a0ba107
	Namespace: namespace_b376ff3f
	Checksum: 0xFEB73D25
	Offset: 0xAB80
	Size: 0x402
	Parameters: 3
	Flags: Linked
*/
function function_5a0ba107(var_bd027dd9, quickequip, weaponid)
{
	if(!isdefined(quickequip))
	{
		quickequip = 0;
	}
	if(!isdefined(weaponid))
	{
		weaponid = 0;
	}
	/#
		assert(isplayer(self));
	#/
	item = function_dfcacdc2(var_bd027dd9);
	if(isdefined(item) && isdefined(item.var_a6762160))
	{
		if(is_true(item.var_a6762160.consumable))
		{
			return self function_7730442c(item);
		}
		itemtype = item.var_a6762160.itemtype;
		switch(itemtype)
		{
			case "ammo":
			{
				self function_11089ed8(item);
				break;
			}
			case "armor":
			{
				self equip_armor(item);
				break;
			}
			case "attachment":
			{
				if(weaponid == 0)
				{
					self function_224c09c9(item, function_ec087745(), undefined, !quickequip, 1);
				}
				else
				{
					self function_224c09c9(item, function_c3fb7a6e(), function_ec087745(), !quickequip, 0);
				}
				break;
			}
			case "backpack":
			{
				self function_2dab8a7f(item);
				break;
			}
			case "tactical":
			case "equipment":
			case "field_upgrade":
			{
				self function_c8bedf1b(item);
				break;
			}
			case "hash_63c2e39c90346280":
			case "hash_63c2e49c90346433":
			case "hash_63c2e59c903465e6":
			{
				self function_854cf2c3(item);
				break;
			}
			case "scorestreak":
			{
				self function_1ac37022(item);
				break;
			}
			case "generic":
			case "cash":
			{
				break;
			}
			case "health":
			{
				self function_11fc9fa9(item);
				break;
			}
			case "killstreak":
			{
				self use_killstreak(var_bd027dd9, item);
				break;
			}
			case "weapon":
			{
				self function_2b4d7b66(item);
				break;
			}
			default:
			{
				/#
					assertmsg(("" + (isdefined(item.var_a6762160.itemtype) ? item.var_a6762160.itemtype : "")) + "");
				#/
				return 0;
			}
		}
		return 1;
	}
	return 0;
}

/*
	Name: function_a7f76892
	Namespace: namespace_b376ff3f
	Checksum: 0x812B6716
	Offset: 0xAF90
	Size: 0x26
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a7f76892()
{
	if(self function_2cceca7b())
	{
		return false;
	}
	return true;
}

/*
	Name: function_bf2312f1
	Namespace: namespace_b376ff3f
	Checksum: 0xE9963391
	Offset: 0xAFC0
	Size: 0x8E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bf2312f1(weapon)
{
	currentweapon = self getcurrentweapon();
	if(isdefined(currentweapon) && currentweapon != level.weaponnone && currentweapon == weapon)
	{
		if(self function_55acff10())
		{
			return false;
		}
		if(self isfiring())
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_2b4d7b66
	Namespace: namespace_b376ff3f
	Checksum: 0x13CD8A5E
	Offset: 0xB058
	Size: 0xB24
	Parameters: 6
	Flags: Linked
*/
function function_2b4d7b66(item, switchweapon, var_9fa01da8, var_a3a17c55, initialweaponraise, stockammo)
{
	if(!isdefined(switchweapon))
	{
		switchweapon = 1;
	}
	if(!isdefined(var_9fa01da8))
	{
		var_9fa01da8 = 0;
	}
	if(!isdefined(var_a3a17c55))
	{
		var_a3a17c55 = 0;
	}
	if(!isdefined(initialweaponraise))
	{
		initialweaponraise = 0;
	}
	/#
		assert(isplayer(self));
	#/
	var_a6762160 = item.var_a6762160;
	itemtype = var_a6762160.itemtype;
	/#
		assert(itemtype == #"weapon");
	#/
	currentweapon = level.weaponbasemeleeheld;
	var_68dc9720 = 17 + 1;
	var_6073ab7b = 0;
	var_954e19c7 = function_bad4a3a5();
	if(var_954e19c7 == namespace_a0d533d1::function_80fb4b76())
	{
		if(var_9fa01da8)
		{
			currentweapon = self getstowedweapon();
		}
		else
		{
			currentweapon = get_current_weapon();
		}
		foreach(slotid in namespace_a0d533d1::function_4905dddf())
		{
			var_b8c2759f = self.inventory.items[slotid];
			if(var_b8c2759f.var_bd027dd9 === 32767)
			{
				continue;
			}
			var_355db408 = namespace_a0d533d1::function_2b83d3ff(var_b8c2759f);
			if(currentweapon == var_355db408)
			{
				var_68dc9720 = slotid;
				function_60706bdb(var_b8c2759f.var_bd027dd9);
				function_d019bf1d(var_b8c2759f.var_bd027dd9);
				break;
			}
		}
		currentweapon = level.weaponbasemeleeheld;
	}
	else
	{
		if(var_954e19c7 == 0)
		{
			if(self getcurrentweapon() != level.weaponnone || self getcurrentweapon() != level.weaponbasemeleeheld)
			{
				var_6073ab7b = 1;
			}
			else
			{
				currentweapon = level.weaponnone;
			}
		}
		var_68dc9720 = undefined;
		foreach(slotid in namespace_a0d533d1::function_4905dddf())
		{
			if(self.inventory.items[slotid].var_bd027dd9 === item.var_bd027dd9)
			{
				var_68dc9720 = slotid;
				break;
			}
		}
		if(!isdefined(var_68dc9720))
		{
			foreach(slotid in namespace_a0d533d1::function_4905dddf())
			{
				if(self.inventory.items[slotid].var_bd027dd9 === 32767)
				{
					var_68dc9720 = slotid;
					break;
				}
			}
		}
	}
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	if(isdefined(weapon) && weapon != level.weaponnone)
	{
		var_346dc077 = self getweaponammostock(weapon);
		item.var_59361ab4 = namespace_a0d533d1::function_8746cad9(slotid);
		namespace_a0d533d1::function_6e9e7169(item);
		weapon = namespace_a0d533d1::function_2b83d3ff(item);
		slotid = function_b246c573(item.var_bd027dd9);
		if(!isdefined(slotid))
		{
			return;
		}
		self function_26c87da8(slotid, var_68dc9720);
		if(initialweaponraise && !isdefined(item.weaponoptions) && !isdefined(item.var_e91aba42))
		{
			weaponoptions = undefined;
			var_e91aba42 = undefined;
			if((isdefined(getgametypesetting(#"hash_33c34a7d3c678e37")) ? getgametypesetting(#"hash_33c34a7d3c678e37") : 0))
			{
				renderoptions = function_ea647602("camo", weapon);
				if(renderoptions.size > 0)
				{
					var_9412af4a = randomint(renderoptions.size);
					weaponoptions = self function_6eff28b5(renderoptions[var_9412af4a].item_index, 0, 0);
				}
			}
			else
			{
				var_b7659ba0 = activecamo::function_b259f3e0(weapon);
				weaponoptions = self getbuildkitweaponoptions(var_b7659ba0);
				var_e91aba42 = self function_1744e243(var_b7659ba0);
			}
			if(weaponoptions != self getbuildkitweaponoptions(level.weaponnone))
			{
				item.weaponoptions = weaponoptions;
			}
			if(var_e91aba42 != self function_1744e243(level.weaponnone))
			{
				item.var_e91aba42 = var_e91aba42;
			}
		}
		item.weaponoptions = self function_fc04b237(weapon, item.weaponoptions);
		self function_5110caa3(currentweapon, weapon, 1, initialweaponraise, var_a3a17c55, item.weaponoptions, item.var_e91aba42, item.var_908f65ca);
		if(var_6073ab7b)
		{
			self function_5110caa3(level.weaponnone, level.weaponbasemeleeheld);
		}
		self function_b00db06(6, item.var_bd027dd9);
		var_b619c089 = function_dfcacdc2(item.var_bd027dd9);
		if(!isdefined(var_b619c089))
		{
			return;
		}
		if(weapon !== currentweapon)
		{
			var_b917b36f = int(min(var_346dc077, weapon.clipsize));
			self function_fc9f8b05(weapon, var_b917b36f);
		}
		var_954e19c7 = function_57eac2ca();
		if(var_a3a17c55)
		{
			self function_c9a111a(weapon);
		}
		else
		{
			self shoulddoinitialweaponraise(weapon, initialweaponraise);
		}
		self setweaponammoclip(weapon, int(var_b619c089.amount));
		if(is_true(weapon.isdualwield) && isdefined(weapon.dualwieldweapon) && weapon.dualwieldweapon != level.weaponnone)
		{
			if(isdefined(var_b619c089.var_bce3d77a))
			{
				self setweaponammoclip(weapon.dualwieldweapon, int(var_b619c089.var_bce3d77a));
			}
			else
			{
				self setweaponammoclip(weapon.dualwieldweapon, int(var_b619c089.amount));
			}
		}
		if(switchweapon || var_954e19c7 == 1)
		{
			if(self function_a7f76892())
			{
				self switchtoweapon(weapon, 1);
				self.currentweapon = weapons::function_251ec78c(weapon, 0);
			}
		}
		var_4f8a16ec = getgametypesetting(#"hash_b76e50c1202aa23");
		if(!is_true(var_4f8a16ec))
		{
			if(!isdefined(stockammo))
			{
				self setweaponammostock(weapon, weapon.maxammo);
			}
			else
			{
				self setweaponammostock(weapon, stockammo);
			}
		}
		self function_db2abc4(item);
		return;
	}
	/#
		assertmsg(("" + var_a6762160.name) + "");
	#/
}

/*
	Name: function_ec087745
	Namespace: namespace_b376ff3f
	Checksum: 0x1954BCC6
	Offset: 0xBB88
	Size: 0x162
	Parameters: 1
	Flags: Linked
*/
function function_ec087745(var_75e3ca7a)
{
	if(!isdefined(var_75e3ca7a))
	{
		var_75e3ca7a = 0;
	}
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self) || !isplayer(self))
	{
		return 32767;
	}
	weapon = get_current_weapon();
	var_bd027dd9 = function_a33744de(weapon);
	if(self isswitchingweapons() && var_bd027dd9 == 32767)
	{
		var_bd027dd9 = function_a33744de(get_current_weapon());
	}
	return var_bd027dd9;
}

/*
	Name: function_c3fb7a6e
	Namespace: namespace_b376ff3f
	Checksum: 0xD65C063E
	Offset: 0xBCF8
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_c3fb7a6e()
{
	/#
		assert(isplayer(self));
	#/
	var_53c16cb = self function_ec087745();
	foreach(weaponslot in namespace_a0d533d1::function_4905dddf())
	{
		item = self.inventory.items[weaponslot];
		if(!isdefined(item) || item.var_bd027dd9 === 32767 || var_53c16cb === item.var_bd027dd9)
		{
			continue;
		}
		return item.var_bd027dd9;
	}
	return 32767;
}

/*
	Name: get_current_weapon
	Namespace: namespace_b376ff3f
	Checksum: 0x1D0077AD
	Offset: 0xBE30
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function get_current_weapon()
{
	return weapons::function_251ec78c(self.currentweapon, 0);
}

/*
	Name: function_6f73f57d
	Namespace: namespace_b376ff3f
	Checksum: 0x27D639EA
	Offset: 0xBE58
	Size: 0xFE
	Parameters: 2
	Flags: Linked
*/
function function_6f73f57d(rootweaponname, var_5c695210)
{
	self endon(#"death");
	currentweapon = self get_current_weapon();
	if(!isdefined(var_5c695210))
	{
		var_5c695210 = function_9f1cc9a9(currentweapon);
	}
	start_time = gettime();
	while((gettime() - start_time) < 5000 && (var_5c695210 != function_9f1cc9a9(currentweapon) || rootweaponname !== currentweapon.rootweapon.name))
	{
		waitframe(1);
		currentweapon = self get_current_weapon();
	}
	return ((gettime() - start_time) >= 5000 ? undefined : currentweapon);
}

/*
	Name: function_d768ea30
	Namespace: namespace_b376ff3f
	Checksum: 0xCE79CB3
	Offset: 0xBF60
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function function_d768ea30()
{
	/#
		assert(isplayer(self));
	#/
	var_bd027dd9 = self function_ec087745();
	if(var_bd027dd9 === 32767)
	{
		return;
	}
	return namespace_ad5a0cd6::function_808be9a3(var_bd027dd9);
}

/*
	Name: function_bad4a3a5
	Namespace: namespace_b376ff3f
	Checksum: 0x3115D584
	Offset: 0xBFE0
	Size: 0x116
	Parameters: 0
	Flags: Linked
*/
function function_bad4a3a5()
{
	/#
		assert(isplayer(self));
	#/
	weaponcount = 0;
	weapons = self getweaponslistprimaries();
	foreach(weapon in weapons)
	{
		if(is_true(weapon.var_29d24e37))
		{
			continue;
		}
		if(weapon != level.weaponnone && weapon != level.weaponbasemeleeheld)
		{
			weaponcount++;
		}
	}
	return weaponcount;
}

/*
	Name: function_777cc133
	Namespace: namespace_b376ff3f
	Checksum: 0x3A7BDFFE
	Offset: 0xC100
	Size: 0x9A
	Parameters: 0
	Flags: Linked
*/
function function_777cc133()
{
	/#
		assert(isplayer(self));
	#/
	if(namespace_a0d533d1::function_819781bf())
	{
		return;
	}
	for(index = 0; index < self.inventory.var_c212de25; index++)
	{
		if(self.inventory.items[index].var_bd027dd9 == 32767)
		{
			return index;
		}
	}
}

/*
	Name: function_2e711614
	Namespace: namespace_b376ff3f
	Checksum: 0xEE08833
	Offset: 0xC1A8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_2e711614(slotid)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.inventory))
	{
		return;
	}
	if(!isdefined(self.inventory.items))
	{
		return;
	}
	return self.inventory.items[slotid];
}

/*
	Name: function_230ceec4
	Namespace: namespace_b376ff3f
	Checksum: 0x4484DD1A
	Offset: 0xC230
	Size: 0x23E
	Parameters: 1
	Flags: Linked
*/
function function_230ceec4(weapon)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isweapon(weapon));
	#/
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.inventory))
	{
		return;
	}
	if(!isdefined(self.inventory.items))
	{
		return;
	}
	if(isdefined(weapon.dualwieldweapon) && is_true(weapon.var_bf0eb41))
	{
		weapon = weapon.dualwieldweapon;
	}
	if(is_true(weapon.isaltmode))
	{
		weapon = weapon.altweapon;
	}
	foreach(weaponslot in array(5, 6, 12, 7, 13, 8, 17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1, 14, 15, 16, 17))
	{
		item = self.inventory.items[weaponslot];
		if(!isdefined(item))
		{
			continue;
		}
		if(item.var_bd027dd9 === 32767)
		{
			continue;
		}
		if(namespace_a0d533d1::function_2b83d3ff(item) === weapon)
		{
			return item;
		}
	}
}

/*
	Name: function_a33744de
	Namespace: namespace_b376ff3f
	Checksum: 0xDE215A70
	Offset: 0xC478
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_a33744de(weapon)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isweapon(weapon));
	#/
	var_64d58696 = function_230ceec4(weapon);
	return (isdefined(var_64d58696) ? var_64d58696.var_bd027dd9 : 32767);
}

/*
	Name: function_b246c573
	Namespace: namespace_b376ff3f
	Checksum: 0x4639B6BA
	Offset: 0xC518
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_b246c573(var_bd027dd9)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(namespace_ad5a0cd6::function_db35e94f(var_bd027dd9));
	#/
	for(i = 0; i < self.inventory.items.size; i++)
	{
		if(self.inventory.items[i].var_bd027dd9 === var_bd027dd9)
		{
			return i;
		}
	}
}

/*
	Name: function_dfcacdc2
	Namespace: namespace_b376ff3f
	Checksum: 0x2A044BDA
	Offset: 0xC5D8
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function function_dfcacdc2(var_bd027dd9)
{
	/#
		assert(isint(var_bd027dd9) && var_bd027dd9 != 32767);
	#/
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(self.inventory))
	{
		return;
	}
	if(!isdefined(self.inventory.items))
	{
		return;
	}
	for(i = 0; i < self.inventory.items.size; i++)
	{
		if(self.inventory.items[i].var_bd027dd9 === var_bd027dd9)
		{
			return self.inventory.items[i];
		}
	}
}

/*
	Name: function_8babc9f9
	Namespace: namespace_b376ff3f
	Checksum: 0xB4CB1195
	Offset: 0xC6C0
	Size: 0x162
	Parameters: 1
	Flags: Linked
*/
function function_8babc9f9(var_a6762160)
{
	/#
		assert(isplayer(self));
	#/
	name = (isdefined(var_a6762160.parentname) ? var_a6762160.parentname : var_a6762160.name);
	if(!isdefined(self) || !isdefined(self.inventory) || !isdefined(self.inventory.items))
	{
		return undefined;
	}
	for(index = 0; index < self.inventory.items.size && index < (17 + 1); index++)
	{
		var_b619c089 = self.inventory.items[index];
		if(!isdefined(var_b619c089.var_a6762160))
		{
			continue;
		}
		if(name == (isdefined(var_b619c089.var_a6762160.parentname) ? var_b619c089.var_a6762160.parentname : var_b619c089.var_a6762160.name))
		{
			return var_b619c089;
		}
	}
}

/*
	Name: function_c48cd17f
	Namespace: namespace_b376ff3f
	Checksum: 0x3FF89607
	Offset: 0xC830
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_c48cd17f(var_bd027dd9)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(namespace_ad5a0cd6::function_d9648161(var_bd027dd9));
	#/
	item = function_dfcacdc2(var_bd027dd9);
	if(isdefined(item))
	{
		return item.id;
	}
	return 32767;
}

/*
	Name: function_189a93f8
	Namespace: namespace_b376ff3f
	Checksum: 0x5B914A23
	Offset: 0xC8D0
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function function_189a93f8(weapon)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isweapon(weapon));
	#/
	item = function_230ceec4(weapon);
	if(isdefined(item))
	{
		return item.id;
	}
	return 32767;
}

/*
	Name: function_57eac2ca
	Namespace: namespace_b376ff3f
	Checksum: 0x3B1990B3
	Offset: 0xC970
	Size: 0x130
	Parameters: 0
	Flags: Linked
*/
function function_57eac2ca()
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.inventory))
	{
		return 0;
	}
	weaponcount = 0;
	foreach(slotid in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
	{
		if(self.inventory.items[slotid].var_bd027dd9 != 32767)
		{
			weaponcount++;
		}
	}
	return weaponcount;
}

/*
	Name: function_d7dbfe3c
	Namespace: namespace_b376ff3f
	Checksum: 0xABC02F47
	Offset: 0xCAA8
	Size: 0x10A
	Parameters: 1
	Flags: Linked
*/
function function_d7dbfe3c(item)
{
	if(item.var_bd027dd9 === 32767)
	{
		return;
	}
	foreach(slotid in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
	{
		if(self.inventory.items[slotid].var_bd027dd9 == item.var_bd027dd9)
		{
			return slotid;
		}
	}
}

/*
	Name: function_3f7ef88
	Namespace: namespace_b376ff3f
	Checksum: 0xA5989B71
	Offset: 0xCBC0
	Size: 0x356
	Parameters: 0
	Flags: Linked
*/
function function_3f7ef88()
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
	pistol = function_4ba8fde(#"hash_5cc9b5e23093ac03");
	var_fa3df96 = self function_e66dcff5(pistol);
	if(!isdefined(pistol))
	{
		return;
	}
	pistol.attachments = [];
	attachment = function_4ba8fde(#"hash_513a787ad3a20198");
	var_e38a0464 = function_520b16d6();
	var_e38a0464.count = 1;
	var_e38a0464.id = attachment.id;
	var_e38a0464.var_bd027dd9 = var_e38a0464.id;
	var_e38a0464.var_a6762160 = attachment.var_a6762160;
	namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
	attachment = function_4ba8fde(#"hash_19c5c6ca805715e5");
	var_e38a0464 = function_520b16d6();
	var_e38a0464.count = 1;
	var_e38a0464.id = attachment.id;
	var_e38a0464.var_bd027dd9 = var_e38a0464.id;
	var_e38a0464.var_a6762160 = attachment.var_a6762160;
	namespace_a0d533d1::function_9e9c82a6(pistol, attachment);
	pistol.amount = self function_f09c133d(namespace_a0d533d1::function_2b83d3ff(pistol));
	self item_world::function_de2018e3(pistol, self, var_fa3df96);
	ammo = function_4ba8fde(#"hash_837a6ea0c2864a8");
	var_fa3df96 = self function_e66dcff5(ammo);
	self item_world::function_de2018e3(ammo, self, var_fa3df96);
	health = function_4ba8fde(#"hash_1abfcce0e9955057");
	health.count = 5;
	var_fa3df96 = self function_e66dcff5(health);
	self item_world::function_de2018e3(health, self, var_fa3df96);
	self.var_554ec2e2 = undefined;
}

/*
	Name: function_e274f1fe
	Namespace: namespace_b376ff3f
	Checksum: 0x775E9D3B
	Offset: 0xCF20
	Size: 0xEC0
	Parameters: 4
	Flags: Linked
*/
function function_e274f1fe(item, itemcount, var_aec6fa7f, slotid)
{
	if(!isdefined(itemcount))
	{
		itemcount = 1;
	}
	if(!isdefined(var_aec6fa7f))
	{
		var_aec6fa7f = 0;
	}
	if(!isdefined(slotid))
	{
		slotid = undefined;
	}
	if(!isplayer(self) || !isdefined(self.inventory))
	{
		/#
			assert(0, "");
		#/
		return 0;
	}
	if(!isdefined(item))
	{
		/#
			assert(0, "");
		#/
		return 0;
	}
	var_a6762160 = item.var_a6762160;
	var_d8138db2 = item.id;
	if(isdefined(item.var_a6762160.var_456aa154))
	{
		var_456aa154 = getscriptbundle(item.var_a6762160.var_456aa154);
		if(isdefined(var_456aa154))
		{
			var_a6762160 = var_456aa154;
		}
		var_8c36ae16 = function_4ba8fde(item.var_a6762160.var_456aa154);
		if(isdefined(var_8c36ae16))
		{
			var_d8138db2 = var_8c36ae16.id;
		}
	}
	var_a057551d = namespace_a0d533d1::function_cfa794ca(self.inventory.var_7658cbec, item.var_a6762160);
	var_1393d318 = var_a057551d > 1;
	if(item.var_a6762160.itemtype == #"resource" && namespace_ad5a0cd6::function_41f06d9d(item.var_a6762160))
	{
		var_92d652f2 = self.inventory.items[slotid];
		var_b41045b2 = int(max(150 - self stats::function_441050ca(#"hash_7bb5510daa652f5e"), 0));
		var_a057551d = var_b41045b2 + (isdefined(var_92d652f2.count) ? var_92d652f2.count : 0);
	}
	if(isdefined(var_a6762160.name) && var_1393d318)
	{
		for(i = 0; i < self.inventory.items.size; i++)
		{
			if(self.inventory.items[i].id != 32767)
			{
				if(self.inventory.items[i].var_a6762160.name != var_a6762160.name)
				{
					continue;
				}
				var_35f34839 = var_a057551d - self.inventory.items[i].count;
				if(var_35f34839 <= 0)
				{
					continue;
				}
				var_8c6165fc = int(min(itemcount, var_35f34839));
				self.inventory.items[i].count = self.inventory.items[i].count + var_8c6165fc;
				item.var_bd027dd9 = self.inventory.items[i].var_bd027dd9;
				self function_b00db06(9, self.inventory.items[i].var_bd027dd9, self.inventory.items[i].count);
				if(i == 5)
				{
					self clientfield::set_player_uimodel("hudItems.healthItemstackCount", function_bba770de(self.inventory.items[i].var_a6762160));
				}
				else if(i == 7)
				{
					self clientfield::set_player_uimodel("hudItems.equipmentStackCount", function_bba770de(self.inventory.items[i].var_a6762160));
				}
				inventoryweapon = namespace_a0d533d1::function_2b83d3ff(self.inventory.items[i]);
				if(isdefined(inventoryweapon))
				{
					self function_c6be9f7f(inventoryweapon, self.inventory.items[i].count);
				}
				itemcount = itemcount - var_8c6165fc;
				/#
					assert(itemcount >= 0);
				#/
				if(itemcount <= 0)
				{
					self function_b00db06(4, var_d8138db2, 0);
					self function_755a35c5();
					self function_6c36ab6b();
					self function_a4413333();
					self function_1caf5c88();
					return 0;
				}
			}
		}
	}
	if(isdefined(slotid))
	{
		var_92d652f2 = undefined;
		if(slotid < self.inventory.items.size)
		{
			var_92d652f2 = self.inventory.items[slotid];
		}
		/#
			assert(isdefined(var_92d652f2));
		#/
		if(var_92d652f2.var_bd027dd9 == 32767)
		{
			var_8c6165fc = int(min(itemcount, var_a057551d));
			item.var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(slotid);
			namespace_a0d533d1::function_6e9e7169(item);
			var_92d652f2.amount = var_aec6fa7f;
			var_92d652f2.count = var_8c6165fc;
			var_92d652f2.id = var_d8138db2;
			var_92d652f2.var_bd027dd9 = item.var_bd027dd9;
			var_92d652f2.var_a6762160 = var_a6762160;
			var_92d652f2.starttime = undefined;
			var_92d652f2.endtime = undefined;
			var_92d652f2.weaponoptions = undefined;
			var_92d652f2.var_e91aba42 = undefined;
			self function_b00db06(4, item.id, var_8c6165fc, slotid + 1);
			itemcount = itemcount - var_8c6165fc;
			/#
				assert(itemcount >= 0);
			#/
			if(itemcount <= 0)
			{
				if(isdefined(item.attachments))
				{
					foreach(var_84704ed7 in item.attachments)
					{
						if(!isdefined(var_84704ed7))
						{
							continue;
						}
						var_769a94ae = namespace_a0d533d1::function_837f4a57(var_84704ed7.var_a6762160);
						if(!isdefined(var_769a94ae))
						{
							continue;
						}
						var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(slotid, var_769a94ae);
						function_e274f1fe(var_84704ed7, undefined, undefined, var_f9f8c0b5);
						var_84704ed7 = function_dfcacdc2(var_84704ed7.var_bd027dd9);
						if(!isdefined(var_84704ed7))
						{
							continue;
						}
						namespace_a0d533d1::function_9e9c82a6(var_92d652f2, var_84704ed7, 0);
					}
					namespace_a0d533d1::function_6e9e7169(var_92d652f2);
				}
				else if(isdefined(var_a6762160.attachments))
				{
					if(namespace_a0d533d1::function_4bd83c04(item))
					{
						foreach(attachment in var_a6762160.attachments)
						{
							if(!namespace_ad5a0cd6::function_7363384a(attachment.var_6be1bec7))
							{
								continue;
							}
							var_84704ed7 = function_4ba8fde(attachment.var_6be1bec7);
							if(!isdefined(var_84704ed7))
							{
								continue;
							}
							var_769a94ae = namespace_a0d533d1::function_837f4a57(var_84704ed7.var_a6762160);
							if(!isdefined(var_769a94ae))
							{
								continue;
							}
							var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(slotid, var_769a94ae);
							function_e274f1fe(var_84704ed7, undefined, undefined, var_f9f8c0b5);
							var_84704ed7 = function_dfcacdc2(var_84704ed7.var_bd027dd9);
							if(!isdefined(var_84704ed7))
							{
								continue;
							}
							namespace_a0d533d1::function_9e9c82a6(var_92d652f2, var_84704ed7, 0);
						}
						namespace_a0d533d1::function_6e9e7169(var_92d652f2);
						weapon = namespace_a0d533d1::function_2b83d3ff(var_92d652f2);
						if(isdefined(weapon))
						{
							var_92d652f2.amount = self function_f09c133d(namespace_a0d533d1::function_2b83d3ff(var_92d652f2));
						}
					}
				}
				var_92d652f2.weaponoptions = item.weaponoptions;
				var_92d652f2.var_e91aba42 = item.var_e91aba42;
				var_92d652f2.var_908f65ca = item.var_908f65ca;
				var_92d652f2.var_1181c08b = item.var_1181c08b;
				self function_755a35c5();
				self function_6c36ab6b();
				self function_a4413333();
				self function_1caf5c88();
				return 0;
			}
		}
		if(slotid === 9 || slotid === 10 || slotid == 11 && var_92d652f2.var_bd027dd9 != 32767)
		{
			return itemcount;
		}
	}
	if(!namespace_a0d533d1::function_819781bf())
	{
		for(i = 0; i < self.inventory.var_c212de25; i++)
		{
			if(self.inventory.items[i].var_bd027dd9 === 32767)
			{
				var_8c6165fc = int(min(itemcount, var_a057551d));
				item.var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(i);
				self.inventory.items[i].amount = var_aec6fa7f;
				self.inventory.items[i].count = var_8c6165fc;
				self.inventory.items[i].id = var_d8138db2;
				self.inventory.items[i].var_bd027dd9 = item.var_bd027dd9;
				self.inventory.items[i].var_a6762160 = var_a6762160;
				self.inventory.items[i].starttime = undefined;
				self.inventory.items[i].endtime = undefined;
				self.inventory.items[i].var_1181c08b = item.var_1181c08b;
				namespace_a0d533d1::function_6e9e7169(self.inventory.items[i]);
				self function_b00db06(4, item.id, var_8c6165fc, i + 1);
				itemcount = itemcount - var_8c6165fc;
				/#
					assert(itemcount >= 0);
				#/
				if(itemcount <= 0)
				{
					break;
				}
			}
		}
	}
	self function_755a35c5();
	self function_6c36ab6b();
	self function_a4413333();
	self function_1caf5c88();
	return itemcount;
}

/*
	Name: function_461de298
	Namespace: namespace_b376ff3f
	Checksum: 0x7D01B882
	Offset: 0xDDE8
	Size: 0x134
	Parameters: 0
	Flags: Linked
*/
function function_461de298()
{
	/#
		assert(isplayer(self));
	#/
	if(!(isdefined(getgametypesetting(#"hash_7c8ad12994670d63")) ? getgametypesetting(#"hash_7c8ad12994670d63") : 0))
	{
		return;
	}
	if(!isplayer(self))
	{
		return;
	}
	var_73869e24 = function_4ba8fde(#"hash_211559ff9a516b7d");
	var_bcb39afb = self namespace_a0d533d1::function_169cea63();
	var_51c5992 = min(var_bcb39afb.size, 2);
	if(var_51c5992 > 0)
	{
		self function_e274f1fe(var_73869e24, var_51c5992, 0, 10);
	}
}

/*
	Name: function_44f1ab43
	Namespace: namespace_b376ff3f
	Checksum: 0xB1B33DA6
	Offset: 0xDF28
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_44f1ab43()
{
	/#
		assert(isplayer(self));
	#/
	self function_461de298();
	/#
		self thread function_76eb9bd7();
	#/
}

/*
	Name: has_armor
	Namespace: namespace_b376ff3f
	Checksum: 0x6E7B4F2F
	Offset: 0xDF90
	Size: 0xE6
	Parameters: 0
	Flags: Linked
*/
function has_armor()
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self))
	{
		return 0;
	}
	if(!isdefined(self.inventory))
	{
		return 0;
	}
	if(!isdefined(self.inventory.items))
	{
		return 0;
	}
	if(!isdefined(self.inventory.items[6]))
	{
		return 0;
	}
	hasarmor = self.inventory.items[6].var_bd027dd9 != 32767 && self.inventory.items[6].var_a6762160.itemtype == #"armor";
	return hasarmor;
}

/*
	Name: has_backpack
	Namespace: namespace_b376ff3f
	Checksum: 0x35CFA610
	Offset: 0xE080
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function has_backpack()
{
	/#
		assert(isplayer(self));
	#/
	var_4f583f35 = isdefined(self.inventory) && isdefined(self.inventory.items) && isdefined(self.inventory.items[8]) && isdefined(self.inventory.items[8].var_a6762160) && self.inventory.items[8].var_a6762160.itemtype == #"backpack";
	return var_4f583f35;
}

/*
	Name: function_471897e2
	Namespace: namespace_b376ff3f
	Checksum: 0x32DE6E4B
	Offset: 0xE160
	Size: 0x10E
	Parameters: 0
	Flags: Linked
*/
function function_471897e2()
{
	/#
		assert(isplayer(self));
	#/
	var_22939dc4 = isdefined(self.inventory) && isdefined(self.inventory.items) && isdefined(self.inventory.items[10]) && isdefined(self.inventory.items[10].var_a6762160) && self.inventory.items[10].var_a6762160.itemtype == #"resource" && self.inventory.items[10].var_a6762160.name == #"hash_211559ff9a516b7d";
	return var_22939dc4;
}

/*
	Name: function_7fe4ce88
	Namespace: namespace_b376ff3f
	Checksum: 0x7E76C318
	Offset: 0xE278
	Size: 0x102
	Parameters: 1
	Flags: None
*/
function function_7fe4ce88(item_name)
{
	/#
		assert(isplayer(self));
	#/
	if(!isdefined(self.inventory))
	{
		return undefined;
	}
	foreach(item in self.inventory.items)
	{
		if(item.id == 32767)
		{
			continue;
		}
		var_b74300d3 = namespace_ad5a0cd6::function_d73e17cb(item.var_a6762160);
		if(item_name == var_b74300d3)
		{
			return item;
		}
	}
}

/*
	Name: function_f62713c3
	Namespace: namespace_b376ff3f
	Checksum: 0x3648D8C7
	Offset: 0xE388
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function function_f62713c3(slotid)
{
	/#
		assert(isplayer(self));
	#/
	return isdefined(self.inventory.items[slotid]) && self.inventory.items[slotid].var_bd027dd9 != 32767;
}

/*
	Name: function_814b5785
	Namespace: namespace_b376ff3f
	Checksum: 0xB3A6DED8
	Offset: 0xE408
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_814b5785()
{
	if(function_7d5553ac())
	{
		return;
	}
	/#
		assert(isplayer(self));
	#/
	self.inventory = spawnstruct();
	self.inventory.items = [];
	for(i = 0; i < ((((((17 + 1) + 8) + 1) + 8) + 1) + 8) + 1; i++)
	{
		self.inventory.items[i] = function_520b16d6();
	}
	self.inventory.ammo = [];
	self.inventory.consumed = [];
	self.inventory.var_c212de25 = 3;
	self.inventory.var_7658cbec = 0;
	self.inventory.var_a0290b96 = [];
	self function_85287396(0);
}

/*
	Name: function_fe402108
	Namespace: namespace_b376ff3f
	Checksum: 0x32A6064F
	Offset: 0xE560
	Size: 0x1A
	Parameters: 0
	Flags: Linked
*/
function function_fe402108()
{
	return is_true(self.var_11921c74);
}

/*
	Name: function_e7af31c6
	Namespace: namespace_b376ff3f
	Checksum: 0x46A681FC
	Offset: 0xE588
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function function_e7af31c6(slotid)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(slotid >= 0 && slotid < (((((((17 + 1) + 8) + 1) + 8) + 1) + 8) + 1));
	#/
	return self.inventory.items[slotid].var_bd027dd9 != 32767;
}

/*
	Name: function_f3195b3d
	Namespace: namespace_b376ff3f
	Checksum: 0x3D515834
	Offset: 0xE640
	Size: 0x324
	Parameters: 1
	Flags: Linked
*/
function function_f3195b3d(var_bd027dd9)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isint(var_bd027dd9) && var_bd027dd9 != 32767);
	#/
	foreach(slot in array(5, 6, 12, 7, 13, 8, 17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1, 14, 15, 16, 17))
	{
		if(self.inventory.items[slot].var_bd027dd9 === var_bd027dd9)
		{
			return true;
		}
	}
	foreach(weaponid in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
	{
		foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
		{
			var_2c3486a7 = namespace_a0d533d1::function_dfaca25e(weaponid, var_259f58f3);
			if(self.inventory.items[var_2c3486a7].var_bd027dd9 === var_bd027dd9)
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_7b39c6f9
	Namespace: namespace_b376ff3f
	Checksum: 0x2B88838C
	Offset: 0xE970
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_7b39c6f9(params)
{
	if(!isdefined(params) || !isdefined(params.player))
	{
		return;
	}
	if(!isdefined(params.player.inventory))
	{
		return;
	}
	item = params.player.inventory.items[17];
	if(item.var_bd027dd9 == 32767)
	{
		return;
	}
	if(!isdefined(item.var_a6762160.killstreak))
	{
		return;
	}
	killstreakbundle = getscriptbundle(item.var_a6762160.killstreak);
	if(killstreakbundle.var_d3413870 == params.killstreaktype)
	{
		function_6e376bb1(item.var_bd027dd9, 1);
	}
}

/*
	Name: function_db2abc4
	Namespace: namespace_b376ff3f
	Checksum: 0x34785590
	Offset: 0xEA78
	Size: 0x1F2
	Parameters: 1
	Flags: Linked
*/
function function_db2abc4(item)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(item));
	#/
	if(isdefined(item) && isdefined(item.var_a6762160))
	{
		if(is_true(item.var_a6762160.consumable))
		{
			if(isdefined(item.var_a6762160.var_3785127d))
			{
				self playsoundtoplayer(item.var_a6762160.var_3785127d, self);
				return;
			}
		}
		switch(item.var_a6762160.itemtype)
		{
			case "weapon":
			{
				break;
			}
			case "ammo":
			{
				break;
			}
			case "health":
			{
				break;
			}
			case "equipment":
			{
				break;
			}
			case "field_upgrade":
			{
				break;
			}
			case "tactical":
			{
				break;
			}
			case "armor":
			{
				break;
			}
			case "backpack":
			{
				break;
			}
			case "attachment":
			{
				if(isdefined(item.var_a6762160.var_3785127d))
				{
					self playsoundtoplayer(item.var_a6762160.var_3785127d, self);
				}
				break;
			}
			case "generic":
			{
				break;
			}
		}
	}
}

/*
	Name: function_a24d6e36
	Namespace: namespace_b376ff3f
	Checksum: 0xB441838F
	Offset: 0xEC78
	Size: 0x284
	Parameters: 3
	Flags: Linked
*/
function function_a24d6e36(var_bd027dd9, var_b44c0e7e, var_cda2ff12)
{
	if(!isdefined(var_b44c0e7e))
	{
		var_b44c0e7e = 1;
	}
	if(!isdefined(var_cda2ff12))
	{
		var_cda2ff12 = 1;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isint(var_bd027dd9) && var_bd027dd9 != 32767);
	#/
	self endon(#"death");
	var_d8138db2 = function_c48cd17f(var_bd027dd9);
	if(var_d8138db2 == 32767)
	{
		return false;
	}
	item = function_dfcacdc2(var_bd027dd9);
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	if(isdefined(weapon))
	{
		self.var_6d2ad74f = weapon;
		slot = self gadgetgetslot(weapon);
		if(slot >= 0 && slot < 3)
		{
			self function_19ed70ca(slot, 1);
			self gadgetpowerset(slot, 0);
		}
		while(isdefined(self) && (self function_c1cef1ec(weapon) || !self function_bf2312f1(weapon) || self isremotecontrolling()))
		{
			waitframe(1);
		}
	}
	if(item.count > 0 && isdefined(weapon))
	{
		self function_19ed70ca(slot, 0);
		self gadgetpowerset(slot, weapon.gadget_powermax);
	}
	else
	{
		self function_5852cb7b(var_bd027dd9, 0, var_b44c0e7e, var_cda2ff12);
	}
}

/*
	Name: function_eb70ad46
	Namespace: namespace_b376ff3f
	Checksum: 0xCB1EA77E
	Offset: 0xEF08
	Size: 0x204
	Parameters: 3
	Flags: Linked, Private
*/
function private function_eb70ad46(var_bd027dd9, var_b44c0e7e, var_cda2ff12)
{
	if(!isdefined(var_b44c0e7e))
	{
		var_b44c0e7e = 1;
	}
	if(!isdefined(var_cda2ff12))
	{
		var_cda2ff12 = 1;
	}
	item = function_dfcacdc2(var_bd027dd9);
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	var_a6762160 = item.var_a6762160;
	self.inventory.items[8] = function_520b16d6();
	self.inventory.var_c212de25 = 3;
	self.inventory.var_7658cbec = 0;
	if(var_b44c0e7e)
	{
		self function_b00db06(5, var_bd027dd9);
	}
	function_9d805044(var_a6762160.itemtype, var_a6762160);
	if(var_cda2ff12)
	{
		for(index = self.inventory.var_c212de25; index < 5; index++)
		{
			var_b619c089 = self.inventory.items[index];
			if(var_b619c089.var_bd027dd9 != 32767)
			{
				function_5852cb7b(var_b619c089.var_bd027dd9);
			}
		}
	}
	if(isdefined(self.var_6d2ad74f) && self.var_6d2ad74f === weapon)
	{
		self.var_6d2ad74f = undefined;
	}
	debug_print("remove_inventory_item: Success!", weapon);
	self clientfield::set_player_uimodel("hudItems.hasBackpack", 0);
}

/*
	Name: function_5852cb7b
	Namespace: namespace_b376ff3f
	Checksum: 0xAF023854
	Offset: 0xF118
	Size: 0x4FE
	Parameters: 4
	Flags: Linked
*/
function function_5852cb7b(var_bd027dd9, var_dfe6c7e5, var_b44c0e7e, var_cda2ff12)
{
	if(!isdefined(var_dfe6c7e5))
	{
		var_dfe6c7e5 = 0;
	}
	if(!isdefined(var_b44c0e7e))
	{
		var_b44c0e7e = 1;
	}
	if(!isdefined(var_cda2ff12))
	{
		var_cda2ff12 = 1;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isint(var_bd027dd9) && var_bd027dd9 != 32767);
	#/
	var_d8138db2 = function_c48cd17f(var_bd027dd9);
	if(var_d8138db2 == 32767)
	{
		debug_print("remove_inventory_item: failed! No ItemId");
		return false;
	}
	item = function_dfcacdc2(var_bd027dd9);
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	var_a6762160 = item.var_a6762160;
	if(isdefined(self) && isdefined(weapon) && (self function_c1cef1ec(weapon) || !self function_bf2312f1(weapon)))
	{
		debug_print("remove_inventory_item: failed! Weapon in Use");
		return false;
	}
	if(self.inventory.items[8].var_bd027dd9 === var_bd027dd9)
	{
		function_eb70ad46(var_bd027dd9, var_b44c0e7e, var_cda2ff12);
		return true;
	}
	for(i = 0; i < self.inventory.items.size; i++)
	{
		if(self.inventory.items[i].var_bd027dd9 === var_bd027dd9)
		{
			unequipped = self function_d019bf1d(var_bd027dd9, var_dfe6c7e5, var_b44c0e7e, var_cda2ff12);
			self.inventory.items[i] = function_520b16d6();
			if(self function_8b1a219a())
			{
				if(isdefined(array::find(array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1), i)) && function_57eac2ca() == 0)
				{
					self sortheldweapons();
				}
			}
			self function_755a35c5();
			self function_6c36ab6b();
			self function_a4413333();
			self function_1caf5c88();
			if(var_b44c0e7e)
			{
				self function_b00db06(5, var_bd027dd9);
			}
			if(i == 5)
			{
				self clientfield::set_player_uimodel("hudItems.healthItemstackCount", 0);
			}
			else if(i == 7)
			{
				self clientfield::set_player_uimodel("hudItems.equipmentStackCount", 0);
			}
			if(unequipped)
			{
				function_9d805044(var_a6762160.itemtype, var_a6762160);
			}
			if(isdefined(self.var_6d2ad74f) && self.var_6d2ad74f === weapon)
			{
				self.var_6d2ad74f = undefined;
			}
			if(var_a6762160.itemtype == #"cash")
			{
				self function_3d113bfb();
			}
			debug_print("remove_inventory_item: Success!", weapon);
			return true;
		}
		if(!isdefined(self.inventory))
		{
			return false;
		}
	}
	debug_print("remove_inventory_item: Failed!", weapon);
	return false;
}

/*
	Name: function_5110caa3
	Namespace: namespace_b376ff3f
	Checksum: 0x712A14D6
	Offset: 0xF620
	Size: 0x28E
	Parameters: 8
	Flags: Linked
*/
function function_5110caa3(old_weapon, new_weapon, primary_weapon, var_e47b0bf, var_6086c488, options, var_f879230e, var_cf5d5d60)
{
	if(!isdefined(primary_weapon))
	{
		primary_weapon = 0;
	}
	if(!isdefined(var_e47b0bf))
	{
		var_e47b0bf = 1;
	}
	if(!isdefined(var_6086c488))
	{
		var_6086c488 = 0;
	}
	if(!isdefined(options))
	{
		options = undefined;
	}
	if(!isdefined(var_f879230e))
	{
		var_f879230e = undefined;
	}
	if(!isdefined(var_cf5d5d60))
	{
		var_cf5d5d60 = undefined;
	}
	/#
		assert(isdefined(old_weapon));
	#/
	/#
		assert(isdefined(new_weapon));
	#/
	if(isdefined(old_weapon) && old_weapon != level.weaponnone)
	{
		var_6ac5075d = 1;
		if(old_weapon == level.nullprimaryoffhand || old_weapon == level.nullsecondaryoffhand || old_weapon == level.var_3488e988)
		{
			if(new_weapon.gadget_type == 0 && (new_weapon.inventorytype == "offhand" || new_weapon.inventorytype == "offhand_primary" || new_weapon.inventorytype == "ability"))
			{
				var_6ac5075d = 0;
			}
		}
		if(var_6ac5075d)
		{
			self replaceweapon(old_weapon, 0, new_weapon, options, var_f879230e, var_cf5d5d60);
			self takeweapon(old_weapon);
		}
		else
		{
			self giveweapon(new_weapon, options, var_f879230e, var_cf5d5d60);
		}
	}
	else
	{
		self giveweapon(new_weapon, options, var_f879230e, var_cf5d5d60);
	}
	if(var_6086c488)
	{
		self function_c9a111a(new_weapon);
	}
	else
	{
		self shoulddoinitialweaponraise(new_weapon, var_e47b0bf);
	}
	if(primary_weapon && self isinvehicle())
	{
		self.currentweapon = new_weapon;
	}
}

/*
	Name: function_61b8a91f
	Namespace: namespace_b376ff3f
	Checksum: 0xE853726D
	Offset: 0xF8B8
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_61b8a91f(allow)
{
	if(!isplayer(self))
	{
		/#
			assert(0);
		#/
		return;
	}
	if(!allow)
	{
		var_b619c089 = self.inventory.items[((((17 + 1) + 8) + 1) + 8) + 1];
		if(var_b619c089.var_bd027dd9 != 32767)
		{
			function_5852cb7b(var_b619c089.var_bd027dd9);
		}
	}
	self clientfield::set_to_player("inventoryThirdWeapon", allow);
}

/*
	Name: function_85287396
	Namespace: namespace_b376ff3f
	Checksum: 0x2CA779DE
	Offset: 0xF998
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_85287396(enabled)
{
	if(isdefined(self))
	{
		self.var_11921c74 = enabled;
	}
}

/*
	Name: function_fba4a353
	Namespace: namespace_b376ff3f
	Checksum: 0xAD9EBA5F
	Offset: 0xF9C8
	Size: 0x37E
	Parameters: 1
	Flags: Linked
*/
function function_fba4a353(item)
{
	if(!isplayer(self) || !isdefined(self.inventory))
	{
		/#
			assert(0, "");
		#/
		return;
	}
	/#
		assert(isdefined(item));
	#/
	if(namespace_a0d533d1::function_819781bf())
	{
		return true;
	}
	if(1 && isdefined(item) && isdefined(item.var_a6762160))
	{
		slotid = undefined;
		switch(item.var_a6762160.itemtype)
		{
			case "armor":
			{
				slotid = 6;
				break;
			}
			case "backpack":
			{
				slotid = 8;
				break;
			}
			case "equipment":
			{
				slotid = 7;
				break;
			}
			case "field_upgrade":
			{
				slotid = 12;
				break;
			}
			case "tactical":
			{
				slotid = 13;
				break;
			}
			case "health":
			{
				slotid = 5;
				break;
			}
			case "weapon":
			{
				slotid = namespace_a0d533d1::function_4905dddf();
				break;
			}
			case "hash_63c2e59c903465e6":
			{
				slotid = 14;
				break;
			}
			case "hash_63c2e49c90346433":
			{
				slotid = 15;
				break;
			}
			case "hash_63c2e39c90346280":
			{
				slotid = 16;
				break;
			}
			case "scorestreak":
			{
				slotid = 17;
				break;
			}
		}
		if(isarray(slotid))
		{
			emptyslot = 0;
			foreach(id in slotid)
			{
				if(self.inventory.items[id].var_bd027dd9 === 32767 || self.inventory.items[id].var_bd027dd9 === item.var_bd027dd9)
				{
					emptyslot = 1;
					break;
				}
			}
			if(!emptyslot)
			{
				return false;
			}
		}
		else if(self.inventory.items[slotid].var_bd027dd9 !== 32767 && self.inventory.items[slotid].var_bd027dd9 !== item.var_bd027dd9)
		{
			return false;
		}
		return true;
	}
	return false;
}

/*
	Name: function_ecd1c667
	Namespace: namespace_b376ff3f
	Checksum: 0x423009B5
	Offset: 0xFD50
	Size: 0x1B4
	Parameters: 2
	Flags: Linked
*/
function function_ecd1c667(var_d8138db2, count)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(namespace_ad5a0cd6::function_2c7fc531(var_d8138db2));
	#/
	self endon(#"death");
	item = function_b1702735(var_d8138db2);
	/#
		assert(item.var_a6762160.itemtype == #"ammo");
	#/
	weapon = item.var_a6762160.weapon;
	maxammo = self getweaponammostock(weapon);
	count = int(min((isdefined(count) ? count : maxammo), maxammo));
	if(count <= 0)
	{
		return;
	}
	self function_fc9f8b05(weapon, count * -1);
	self function_d7944517(item.id, item.var_a6762160.weapon, 1, count);
}

/*
	Name: function_cfe0e919
	Namespace: namespace_b376ff3f
	Checksum: 0xEB455337
	Offset: 0xFF10
	Size: 0x20C
	Parameters: 2
	Flags: Linked
*/
function function_cfe0e919(var_bd027dd9, count)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isint(count) && count > 0);
	#/
	self endon(#"death");
	item = function_dfcacdc2(var_bd027dd9);
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return;
	}
	var_aa3af497 = self.inventory.items[7].var_bd027dd9 == var_bd027dd9 || self.inventory.items[12].var_bd027dd9 == var_bd027dd9;
	if(var_aa3af497 && isdefined(self.var_8181d952) && self.var_8181d952 == item.var_a6762160.weapon)
	{
		if(item.count == count)
		{
			count--;
		}
	}
	count = int(min(item.count, count));
	if(count <= 0)
	{
		return;
	}
	weapon = item.var_a6762160.weapon;
	self function_d7944517(item.id, item.var_a6762160.weapon, count, 0);
	self function_6e376bb1(var_bd027dd9, count);
}

/*
	Name: function_23335063
	Namespace: namespace_b376ff3f
	Checksum: 0xFD7EC3EE
	Offset: 0x10128
	Size: 0x4E
	Parameters: 2
	Flags: Linked
*/
function function_23335063(var_bd027dd9, var_cda2ff12)
{
	if(!isdefined(var_cda2ff12))
	{
		var_cda2ff12 = 1;
	}
	if(!self function_5852cb7b(var_bd027dd9, undefined, undefined, var_cda2ff12))
	{
		return false;
	}
	return true;
}

/*
	Name: function_c4468806
	Namespace: namespace_b376ff3f
	Checksum: 0x2440F9E8
	Offset: 0x10180
	Size: 0x134
	Parameters: 2
	Flags: Linked
*/
function function_c4468806(player, item)
{
	if(game.state == #"pregame" || !isdefined(item))
	{
		return;
	}
	data = {#item:hash(item.var_a6762160.name), #player_xuid:int(player getxuid(1)), #game_time:function_f8d53445()};
	/#
		println("" + item.var_a6762160.name);
	#/
	function_92d1707f(#"hash_50be59ef12074ce", data);
}

/*
	Name: function_394d85cd
	Namespace: namespace_b376ff3f
	Checksum: 0x3CE8884E
	Offset: 0x102C0
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function function_394d85cd()
{
	/#
		assert(isplayer(self));
	#/
	var_13339abf = (isdefined(level.var_13339abf) ? level.var_13339abf : array(#"hash_837a6ea0c2864a8", #"hash_1cdb9172a79b9080", #"hash_54f3f08c1d7d45d3", #"hash_4ab594460fa1627b", #"hash_f9e29721ba5715e", #"hash_75bef4d329c1080b"));
	var_c2043143 = array(2, 4, 8, 16, 32, 64);
	for(index = 0; index < var_13339abf.size; index++)
	{
		if(self.inventory.var_7658cbec & var_c2043143[index])
		{
			continue;
		}
		var_375298f3 = var_13339abf[index];
		var_f415ce36 = getscriptbundle(var_375298f3);
		weapon = var_f415ce36.weapon;
		/#
			assert(isdefined(weapon));
		#/
		if(!isdefined(weapon))
		{
			continue;
		}
		maxammo = namespace_a0d533d1::function_2879cbe0(self.inventory.var_7658cbec, weapon);
		var_346dc077 = self getweaponammostock(weapon);
		if(var_346dc077 > maxammo)
		{
			var_f580278d = function_4ba8fde(var_375298f3).id;
			function_ecd1c667(var_f580278d, var_346dc077 - maxammo);
		}
	}
}

/*
	Name: function_a2c7ce35
	Namespace: namespace_b376ff3f
	Checksum: 0x3CCBB1D3
	Offset: 0x10510
	Size: 0x70C
	Parameters: 0
	Flags: Linked
*/
function function_a2c7ce35()
{
	/#
		assert(isplayer(self));
	#/
	var_3e9ef0a1 = array(array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de"), array(#"hash_627144159973c325", #"hash_676aa70930960427", #"hash_1a7edb90a484158b", #"hash_234815c9f71b452d", #"hash_745d80b3e4f28da1", #"hash_56e573d15c6402bc", #"hash_7126c22f114c7382", #"hash_213093d947c30be6", #"hash_7e8c84081fafaea4", #"hash_5f67f7b32b01ae53", #"hash_725e305ff465e73d", #"hash_6ab225c69027e657", #"hash_7f37566c7dd7ecb", #"hash_76ebb51bb24696a1", #"hash_51f70aff8a2ad330", #"hash_689c84ba4e75b1c8", #"hash_655ce01a6ec0cc8b", #"hash_77975eb76986243d"), array(#"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f"));
	var_c77511ea = array(2048, 4096, 8192);
	var_710be50e = array(7);
	for(itemindex = 0; itemindex < 5; itemindex++)
	{
		var_710be50e[var_710be50e.size] = itemindex;
	}
	for(var_25c45152 = 0; var_25c45152 < var_3e9ef0a1.size; var_25c45152++)
	{
		if(self.inventory.var_7658cbec & var_c77511ea[var_25c45152])
		{
			continue;
		}
		var_a101f33c = var_3e9ef0a1[var_25c45152];
		for(index = 0; index < var_a101f33c.size; index++)
		{
			var_7f695eed = var_a101f33c[index];
			var_f77e15f6 = function_4ba8fde(var_7f695eed);
			if(!isdefined(var_f77e15f6))
			{
				continue;
			}
			var_590b4c51 = namespace_a0d533d1::function_cfa794ca(self.inventory.var_7658cbec, var_f77e15f6.var_a6762160);
			for(itemindex = 0; itemindex < var_710be50e.size; itemindex++)
			{
				item = self.inventory.items[var_710be50e[itemindex]];
				if(item.var_bd027dd9 == 32767)
				{
					continue;
				}
				if(item.var_a6762160.name != var_7f695eed)
				{
					continue;
				}
				if(item.count <= var_590b4c51)
				{
					continue;
				}
				var_9311e423 = item.count - var_590b4c51;
				self function_6e376bb1(item.var_bd027dd9, var_9311e423);
				newitem = spawnstruct();
				newitem.id = item.id;
				newitem.var_a6762160 = item.var_a6762160;
				var_77e61fc6 = function_e274f1fe(newitem, var_9311e423);
				if(var_77e61fc6 > 0)
				{
					self function_d7944517(newitem.id, newitem.var_a6762160.weapon, var_77e61fc6, 0);
				}
			}
		}
	}
}

/*
	Name: function_2bb3a825
	Namespace: namespace_b376ff3f
	Checksum: 0xF4DC09A9
	Offset: 0x10C28
	Size: 0x32C
	Parameters: 0
	Flags: Linked
*/
function function_2bb3a825()
{
	/#
		assert(isplayer(self));
	#/
	var_9b624be0 = array(#"hash_1abfcce0e9955057", #"hash_ff50c93155e445f", #"hash_80292d121740f6f", #"hash_45ced3880667df22", #"hash_20699a922abaf2e1");
	var_448bc079 = array(128, 256, 512, 1024, 256);
	var_5675add1 = array(5);
	for(itemindex = 0; itemindex < 5; itemindex++)
	{
		var_5675add1[var_5675add1.size] = itemindex;
	}
	for(index = var_9b624be0.size - 1; index >= 0; index--)
	{
		if(self.inventory.var_7658cbec & var_448bc079[index])
		{
			continue;
		}
		var_78d7ac4a = var_9b624be0[index];
		var_f77e15f6 = function_4ba8fde(var_78d7ac4a);
		if(!isdefined(var_f77e15f6))
		{
			continue;
		}
		var_590b4c51 = namespace_a0d533d1::function_cfa794ca(self.inventory.var_7658cbec, var_f77e15f6.var_a6762160);
		for(itemindex = 0; itemindex < var_5675add1.size; itemindex++)
		{
			item = self.inventory.items[var_5675add1[itemindex]];
			if(item.var_bd027dd9 == 32767)
			{
				continue;
			}
			if(item.var_a6762160.name != var_78d7ac4a)
			{
				continue;
			}
			if(item.count <= var_590b4c51)
			{
				continue;
			}
			var_9311e423 = item.count - var_590b4c51;
			self function_6e376bb1(item.var_bd027dd9, var_9311e423);
			newitem = spawnstruct();
			newitem.id = item.id;
			newitem.var_a6762160 = item.var_a6762160;
			var_77e61fc6 = function_e274f1fe(newitem, var_9311e423);
			if(var_77e61fc6 > 0)
			{
				self function_d7944517(newitem.id, newitem.var_a6762160.weapon, var_77e61fc6, 0);
			}
		}
	}
}

/*
	Name: function_2521e90f
	Namespace: namespace_b376ff3f
	Checksum: 0xD4C621F3
	Offset: 0x10F60
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_2521e90f()
{
	for(index = self.inventory.var_c212de25; index < 5; index++)
	{
		item = self.inventory.items[index];
		if(item.var_bd027dd9 == 32767)
		{
			continue;
		}
		newitem = spawnstruct();
		newitem.id = item.id;
		newitem.var_a6762160 = item.var_a6762160;
		newitem.count = item.count;
		function_5852cb7b(item.var_bd027dd9, 0, 1, 1);
		var_77e61fc6 = function_e274f1fe(newitem, newitem.count);
		if(var_77e61fc6 > 0)
		{
			self function_d7944517(newitem.id, newitem.var_a6762160.weapon, var_77e61fc6, 0);
		}
	}
}

/*
	Name: function_ec238da8
	Namespace: namespace_b376ff3f
	Checksum: 0x95308BDF
	Offset: 0x110B0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_ec238da8()
{
	function_394d85cd();
	function_a2c7ce35();
	function_2bb3a825();
	function_2521e90f();
}

/*
	Name: function_56a681fb
	Namespace: namespace_b376ff3f
	Checksum: 0x6A5F3CC8
	Offset: 0x11100
	Size: 0x3EC
	Parameters: 1
	Flags: Linked
*/
function function_56a681fb(givecustomloadout)
{
	if(!isdefined(givecustomloadout))
	{
		givecustomloadout = 1;
	}
	if(function_7d5553ac())
	{
		return;
	}
	self endon(#"death", #"disconnect");
	/#
		assert(isplayer(self));
	#/
	self.var_7bba6210 = 1;
	self disableoffhandspecial();
	self disableoffhandweapons();
	while(self function_2cceca7b())
	{
		waitframe(1);
	}
	if(!isdefined(self) || !isdefined(self.inventory))
	{
		return;
	}
	self function_d62822d5();
	foreach(var_b619c089 in self.inventory.items)
	{
		if(var_b619c089.var_bd027dd9 != 32767)
		{
			function_5852cb7b(var_b619c089.var_bd027dd9, 0, 0);
		}
	}
	foreach(var_d8138db2 in self.inventory.ammo)
	{
		weapon = getweapon(var_95162a97);
		self setweaponammostock(weapon, 0);
	}
	if(is_true(givecustomloadout) && isdefined(level.givecustomloadout))
	{
		self [[level.givecustomloadout]](1);
	}
	self function_814b5785();
	self function_6c36ab6b();
	self function_755a35c5();
	self function_1caf5c88();
	self function_b00db06(10);
	self clientfield::set_player_uimodel("hudItems.armorType", 0);
	self clientfield::set_player_uimodel("hudItems.hasBackpack", 0);
	self clientfield::set_player_uimodel("hudItems.healthItemstackCount", 0);
	self clientfield::set_player_uimodel("hudItems.equipmentStackCount", 0);
	self.var_7bba6210 = undefined;
	self enableoffhandspecial();
	self enableoffhandweapons();
	self callback::callback(#"hash_5acf7bf1a288eb9f");
}

/*
	Name: function_26c87da8
	Namespace: namespace_b376ff3f
	Checksum: 0x7D319D2F
	Offset: 0x114F8
	Size: 0x1EC
	Parameters: 2
	Flags: Linked
*/
function function_26c87da8(var_c9293a27, var_8f194e5a)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(var_c9293a27) && isdefined(var_8f194e5a));
	#/
	if(!isdefined(var_c9293a27) || !isdefined(var_8f194e5a))
	{
		return;
	}
	if(var_c9293a27 == var_8f194e5a)
	{
		return;
	}
	var_48e276d5 = self.inventory.items[var_c9293a27];
	var_47684cd2 = self.inventory.items[var_8f194e5a];
	self.inventory.items[var_c9293a27] = var_47684cd2;
	self.inventory.items[var_8f194e5a] = var_48e276d5;
	if(isdefined(var_48e276d5.var_a6762160))
	{
		var_48e276d5.var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_8f194e5a);
	}
	if(isdefined(var_47684cd2.var_a6762160))
	{
		var_47684cd2.var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_c9293a27);
	}
	if(var_8f194e5a == 5)
	{
		self clientfield::set_player_uimodel("hudItems.healthItemstackCount", function_bba770de(var_47684cd2.var_a6762160));
	}
	else if(var_8f194e5a == 7)
	{
		self clientfield::set_player_uimodel("hudItems.equipmentStackCount", function_bba770de(var_47684cd2.var_a6762160));
	}
	self function_b00db06(12, var_c9293a27, var_8f194e5a);
}

/*
	Name: function_b3342af3
	Namespace: namespace_b376ff3f
	Checksum: 0x1639141B
	Offset: 0x116F0
	Size: 0x3C8
	Parameters: 3
	Flags: Linked
*/
function function_b3342af3(item, var_b44c0e7e, var_2ea908ac)
{
	if(!isdefined(var_b44c0e7e))
	{
		var_b44c0e7e = 1;
	}
	if(!isdefined(var_2ea908ac))
	{
		var_2ea908ac = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isstruct(item));
	#/
	foreach(slotid in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
	{
		var_f0dc4e93 = self.inventory.items[slotid].var_bd027dd9;
		if(var_f0dc4e93 == 32767)
		{
			continue;
		}
		if(isdefined(var_2ea908ac) && var_2ea908ac.var_bd027dd9 === var_f0dc4e93)
		{
			continue;
		}
		var_64d58696 = function_dfcacdc2(var_f0dc4e93);
		if(!isdefined(var_64d58696) || !isdefined(var_64d58696.var_a6762160) || var_64d58696.var_a6762160.itemtype != #"weapon")
		{
			/#
				assert(0);
			#/
			continue;
		}
		currentammo = self getweaponammoclip(namespace_a0d533d1::function_2b83d3ff(var_64d58696));
		if(namespace_a0d533d1::function_31a0b1ef(var_64d58696, item, 0))
		{
			itemtype = item.var_a6762160.itemtype;
			var_bd027dd9 = item.var_bd027dd9;
			if(var_b44c0e7e)
			{
				self function_b00db06(7, var_bd027dd9);
			}
			weapon = namespace_a0d533d1::function_2b83d3ff(var_64d58696);
			iscurrentweapon = weapon == get_current_weapon();
			function_d019bf1d(var_f0dc4e93, undefined, var_b44c0e7e, 0);
			namespace_a0d533d1::function_6e9e7169(var_64d58696);
			function_2b4d7b66(var_64d58696, iscurrentweapon, undefined, 1, 0);
			newammo = self function_f09c133d(namespace_a0d533d1::function_2b83d3ff(var_64d58696));
			var_b917b36f = currentammo - newammo;
			if(var_b917b36f > 0)
			{
				self function_fc9f8b05(weapon, var_b917b36f);
			}
			return true;
		}
	}
	return false;
}

/*
	Name: function_41a57271
	Namespace: namespace_b376ff3f
	Checksum: 0x51CCCBA8
	Offset: 0x11AC0
	Size: 0x1D8
	Parameters: 4
	Flags: Linked
*/
function function_41a57271(item, slot, var_b44c0e7e, var_b2bd0862)
{
	if(!isdefined(var_b44c0e7e))
	{
		var_b44c0e7e = 1;
	}
	if(!isdefined(var_b2bd0862))
	{
		var_b2bd0862 = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isstruct(item));
	#/
	if(!isdefined(item.attachments))
	{
		return false;
	}
	attachments = arraycopy(item.attachments);
	foreach(attachment in attachments)
	{
		if(!isdefined(attachment) || !isdefined(attachment.var_a6762160))
		{
			continue;
		}
		if(isdefined(var_b2bd0862) && var_b2bd0862.var_bd027dd9 == attachment.var_bd027dd9)
		{
			continue;
		}
		if(is_true(attachment.var_a6762160.(slot)))
		{
			function_b3342af3(function_dfcacdc2(attachment.var_bd027dd9), var_b44c0e7e);
		}
	}
}

/*
	Name: function_d019bf1d
	Namespace: namespace_b376ff3f
	Checksum: 0xDCE4C9B1
	Offset: 0x11CA0
	Size: 0x428
	Parameters: 4
	Flags: Linked
*/
function function_d019bf1d(var_bd027dd9, var_dfe6c7e5, var_b44c0e7e, var_8eb4edca)
{
	if(!isdefined(var_dfe6c7e5))
	{
		var_dfe6c7e5 = 0;
	}
	if(!isdefined(var_b44c0e7e))
	{
		var_b44c0e7e = 1;
	}
	if(!isdefined(var_8eb4edca))
	{
		var_8eb4edca = 1;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isint(var_bd027dd9) && var_bd027dd9 != 32767);
	#/
	if(!function_f3195b3d(var_bd027dd9))
	{
		return 0;
	}
	item = function_dfcacdc2(var_bd027dd9);
	if(!isdefined(item))
	{
		return 0;
	}
	var_a6762160 = item.var_a6762160;
	itemtype = var_a6762160.itemtype;
	if(itemtype == #"weapon")
	{
		return function_3f5b2e2e(item, var_b44c0e7e, var_8eb4edca);
	}
	if(itemtype == #"attachment")
	{
		return function_b3342af3(item, var_b44c0e7e);
	}
	if(itemtype == #"armor")
	{
		self function_bef83dc6();
		self armor::set_armor(0, 0, 0, 1, 0);
		self clientfield::set_player_uimodel("hudItems.armorType", 0);
	}
	else
	{
		if(namespace_a0d533d1::function_1507e6f0(var_a6762160))
		{
			self thread function_ee9ce1c4(var_a6762160, var_dfe6c7e5);
		}
		else
		{
			if(itemtype == #"health")
			{
				self thread function_8214f1b6(var_a6762160, var_dfe6c7e5);
			}
			else
			{
				if(itemtype == #"hash_63c2e59c903465e6" || itemtype == #"hash_63c2e49c90346433" || itemtype == #"hash_63c2e39c90346280")
				{
					if(var_a6762160.name == #"hash_6ac2848a2f6492ac")
					{
						function_5852cb7b(namespace_ad5a0cd6::function_970b8d86(8), undefined, undefined, 0);
						function_d86d7ac7();
						function_ec238da8();
					}
				}
				else if(itemtype == #"scorestreak")
				{
					slotid = function_b246c573(item.var_bd027dd9);
					killstreakbundle = getscriptbundle(item.var_a6762160.killstreak);
					if(isdefined(killstreakbundle))
					{
						self thread killstreaks::take(killstreakbundle.var_d3413870);
						self.pers[#"killstreaks"] = [];
						if(isdefined(killstreakbundle.var_1ab696c6))
						{
							self takeweapon(killstreakbundle.var_1ab696c6);
						}
					}
				}
			}
		}
	}
	if(var_b44c0e7e)
	{
		self function_b00db06(7, var_bd027dd9);
	}
	return 1;
}

/*
	Name: function_3f5b2e2e
	Namespace: namespace_b376ff3f
	Checksum: 0x3FD5D52D
	Offset: 0x120D8
	Size: 0x530
	Parameters: 3
	Flags: Linked
*/
function function_3f5b2e2e(item, var_b44c0e7e, var_8eb4edca)
{
	if(!isdefined(var_b44c0e7e))
	{
		var_b44c0e7e = 1;
	}
	if(!isdefined(var_8eb4edca))
	{
		var_8eb4edca = 1;
	}
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isstruct(item));
	#/
	itemtype = item.var_a6762160.itemtype;
	var_bd027dd9 = item.var_bd027dd9;
	function_60706bdb(var_bd027dd9);
	if(isdefined(item.attachments) && var_8eb4edca)
	{
		var_687225b = [];
		foreach(attachment in item.attachments)
		{
			if(!isdefined(attachment))
			{
				continue;
			}
			var_84704ed7 = function_dfcacdc2(attachment.var_bd027dd9);
			var_687225b[var_687225b.size] = var_84704ed7;
		}
		foreach(var_84704ed7 in var_687225b)
		{
			function_b3342af3(var_84704ed7, 1);
		}
	}
	weapon = namespace_a0d533d1::function_2b83d3ff(item);
	item.weaponoptions = self function_fc04b237(weapon, item.weaponoptions);
	if(function_57eac2ca() > 1)
	{
		self function_5110caa3(weapon, level.weaponbasemeleeheld, 1);
		foreach(slotid in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
		{
			if(self.inventory.items[slotid].var_bd027dd9 != 32767 && self.inventory.items[slotid].var_bd027dd9 != item.var_bd027dd9)
			{
				altweapon = namespace_a0d533d1::function_2b83d3ff(self.inventory.items[slotid]);
				currentweapon = self getcurrentweapon();
				if(altweapon != currentweapon)
				{
					self switchtoweapon(altweapon, 1);
				}
				self.currentweapon = altweapon;
				break;
			}
		}
	}
	else
	{
		self function_5110caa3(weapon, level.weaponbasemeleeheld, 1);
		if(weapon == get_current_weapon())
		{
			currentweapon = self getcurrentweapon();
			if(level.weaponbasemeleeheld != currentweapon)
			{
				self switchtoweapon(level.weaponbasemeleeheld, 1);
			}
			self.currentweapon = level.weaponbasemeleeheld;
		}
	}
	self clearstowedweapon();
	if(var_b44c0e7e)
	{
		self function_b00db06(7, var_bd027dd9);
	}
	return true;
}

/*
	Name: function_6e376bb1
	Namespace: namespace_b376ff3f
	Checksum: 0xB4ABABB2
	Offset: 0x12610
	Size: 0x2D0
	Parameters: 3
	Flags: Linked
*/
function function_6e376bb1(var_bd027dd9, usecount, var_dfe6c7e5)
{
	if(!isdefined(var_dfe6c7e5))
	{
		var_dfe6c7e5 = 1;
	}
	self endon(#"death");
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isint(usecount) && usecount != 32767);
	#/
	for(i = 0; i < self.inventory.items.size; i++)
	{
		if(self.inventory.items[i].var_bd027dd9 === usecount)
		{
			if(is_true(self.inventory.items[i].var_a6762160.unlimited))
			{
				break;
			}
			self.inventory.items[i].count = self.inventory.items[i].count - var_dfe6c7e5;
			if(self.inventory.items[i].count < 0)
			{
				self.inventory.items[i].count = 0;
				break;
			}
			var_641929a7 = {#item:self.inventory.items[i]};
			self callback::callback(#"hash_41c107b83320aba2", var_641929a7);
			self function_b00db06(9, usecount, self.inventory.items[i].count);
			function_755a35c5();
			function_a4413333();
			function_c4468806(self, self.inventory.items[i]);
			if(self.inventory.items[i].count <= 0)
			{
				self thread function_a24d6e36(usecount, 1);
			}
			break;
		}
	}
}

/*
	Name: function_956a8ecd
	Namespace: namespace_b376ff3f
	Checksum: 0x5AA6BAEE
	Offset: 0x128E8
	Size: 0x364
	Parameters: 0
	Flags: Linked
*/
function function_956a8ecd()
{
	/#
		assert(isentity(self));
	#/
	if(!isentity(self))
	{
		return;
	}
	self waittill(#"hash_363004a4e0ccc1f", #"hash_47147249212b6a46", #"death", #"stationary");
	var_d783088e = [];
	foreach(var_711e35e5 in level.var_f208fb92)
	{
		if(!isdefined(var_711e35e5))
		{
			continue;
		}
		parentent = var_711e35e5 getlinkedent();
		if(isdefined(parentent) && parentent == self)
		{
			var_d783088e[var_d783088e.size] = var_711e35e5;
		}
	}
	if(isdefined(level.var_9911d36f))
	{
		if(!isdefined(self) || self.health <= 0)
		{
			foreach(var_711e35e5 in var_d783088e)
			{
				var_711e35e5 thread [[level.var_9911d36f]]();
			}
			return;
		}
	}
	angles = self.angles;
	origin = self.origin;
	dropitem = item_drop::drop_item(0, undefined, 1, 0, self.id, origin, angles);
	if(isdefined(dropitem) && namespace_ad5a0cd6::function_74e1e547(origin))
	{
		dropitem.var_d783088e = var_d783088e;
	}
	else if(isdefined(level.var_9911d36f))
	{
		foreach(var_711e35e5 in var_d783088e)
		{
			var_711e35e5 thread [[level.var_9911d36f]]();
		}
	}
	util::wait_network_frame(1);
	if(isdefined(self))
	{
		self delete();
		arrayremovevalue(level.var_d79f1ee4, undefined, 0);
	}
}

/*
	Name: function_d8ceeeec
	Namespace: namespace_b376ff3f
	Checksum: 0xA163ADF5
	Offset: 0x12C58
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d8ceeeec(notifyhash)
{
	self val::reset(#"hash_546302f07800b5e5", "freezecontrols_allowlook");
}

/*
	Name: use_killstreak
	Namespace: namespace_b376ff3f
	Checksum: 0x760A883D
	Offset: 0x12C98
	Size: 0x85C
	Parameters: 2
	Flags: Linked
*/
function use_killstreak(var_bd027dd9, item)
{
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isdefined(item));
	#/
	self endoncallback(&function_d8ceeeec, #"death");
	if(self isinvehicle())
	{
		return;
	}
	if(self function_2cceca7b())
	{
		return;
	}
	if(self inlaststand())
	{
		return;
	}
	if(self isonladder() || self function_b4813488() || self function_e128a831())
	{
		return;
	}
	vehicletype = item.var_a6762160.vehicle;
	if(item.var_a6762160.weapon.deployable)
	{
		traceresults = self function_242060b9(item.var_a6762160.weapon);
		if(traceresults.isvalid)
		{
			if(isdefined(level.var_1f020f16) && isdefined(vehicletype) && isdefined(level.var_1f020f16[vehicletype]))
			{
				traceresults.isvalid = self [[level.var_1f020f16[vehicletype]]](item.var_a6762160.vehicle, item.var_a6762160.weapon, traceresults);
			}
		}
	}
	else
	{
		if(isdefined(level.var_4cf92425[vehicletype]))
		{
			traceresults = self [[level.var_4cf92425[vehicletype]]](item.var_a6762160.vehicle);
		}
		else
		{
			var_8d430fcb = self getplayerangles();
			forward = anglestoforward(var_8d430fcb);
			eyepos = self getplayercamerapos();
			endpos = eyepos + (forward * 50);
			var_f45df727 = eyepos + (forward * 100);
			traceresults = {};
			traceresults.trace = bullettrace(eyepos, var_f45df727, 1, self, 1, 1);
			traceresults.isvalid = traceresults.trace[#"fraction"] >= 1;
			traceresults.waterdepth = 0;
			traceresults.origin = endpos;
			traceresults.angles = var_8d430fcb;
		}
	}
	if(traceresults.isvalid)
	{
		remoteweapon = getweapon(#"killstreak_remote");
		if(self hasweapon(remoteweapon))
		{
			return;
		}
		if(self isswitchingweapons())
		{
			self waittilltimeout(2, #"weapon_change");
		}
		self val::set(#"hash_546302f07800b5e5", "freezecontrols_allowlook", 1);
		self giveweapon(remoteweapon);
		self switchtoweapon(remoteweapon, 1);
		self waittilltimeout(2, #"weapon_change");
		if(self getcurrentweapon() != remoteweapon)
		{
			self takeweapon(remoteweapon);
			self val::reset(#"hash_546302f07800b5e5", "freezecontrols_allowlook");
			return;
		}
		function_5852cb7b(var_bd027dd9);
		self closeingamemenu();
		var_7f11909d = undefined;
		var_2e2dbfa3 = undefined;
		if(isdefined(traceresults.hitent))
		{
			var_7f11909d = traceresults.origin - traceresults.hitent.origin;
			var_2e2dbfa3 = traceresults.hitent.angles;
		}
		spawnorigin = traceresults.origin;
		if(isdefined(traceresults.hitent) && isdefined(var_7f11909d))
		{
			anglesdelta = traceresults.hitent.angles - var_2e2dbfa3;
			spawnorigin = traceresults.hitent.origin + rotatepoint(var_7f11909d, anglesdelta);
		}
		vehicle = spawnvehicle(vehicletype, spawnorigin, traceresults.angles);
		if(isdefined(vehicle))
		{
			if(isdefined(vehicle.vehicleclass) && vehicle.vehicleclass == #"helicopter")
			{
				vehicle.origin = vehicle.origin + (0, 0, vehicle.height);
			}
			level.var_d79f1ee4[level.var_d79f1ee4.size] = vehicle;
		}
		util::wait_network_frame(1);
		if(isdefined(vehicle))
		{
			vehicle.id = item.id;
			if(isdefined(vehicle.vehicleclass) && vehicle.vehicleclass != #"helicopter")
			{
				vehicle thread function_956a8ecd();
			}
			vehicle setteam(self.team);
			vehicle.team = self.team;
			if(!isai(vehicle))
			{
				vehicle setowner(self);
			}
			vehicle.owner = self;
			vehicle.ownerentnum = self.entnum;
			if(vehicle isremotecontrol())
			{
				self val::reset(#"hash_546302f07800b5e5", "freezecontrols_allowlook");
				vehicle usevehicle(self, 0);
				self waittill(#"exit_vehicle");
			}
			else if(isdefined(vehicle.var_7feead71))
			{
				vehicle [[vehicle.var_7feead71]](self);
			}
		}
		self val::reset(#"hash_546302f07800b5e5", "freezecontrols_allowlook");
		self takeweapon(remoteweapon);
	}
	else
	{
		self sethintstring(#"hash_37605398dce96965");
		wait(1.5);
		if(isdefined(self))
		{
			self sethintstring(#"");
		}
	}
}

/*
	Name: function_3d113bfb
	Namespace: namespace_b376ff3f
	Checksum: 0xF80C4C29
	Offset: 0x13500
	Size: 0x1EC
	Parameters: 0
	Flags: Linked
*/
function function_3d113bfb()
{
	if(!isplayer(self))
	{
		return;
	}
	if(!isdefined(self.var_a097ccb7))
	{
		self.var_a097ccb7 = 0;
	}
	if(!isstruct(self.inventory) || !isarray(self.inventory.items))
	{
		return;
	}
	cash = 0;
	foreach(item in self.inventory.items)
	{
		if(!isdefined(item) || !isstruct(item.var_a6762160) || item.var_a6762160.itemtype !== #"cash")
		{
			continue;
		}
		cash = cash + (isdefined(item.var_a6762160.amount) ? item.var_a6762160.amount : 0);
	}
	self.var_a097ccb7 = cash;
	if(self.var_a097ccb7 > 0)
	{
		self clientfield::set("wz_cash_carrying", 1);
	}
	else
	{
		self clientfield::set("wz_cash_carrying", 0);
	}
}

/*
	Name: function_9f438f15
	Namespace: namespace_b376ff3f
	Checksum: 0x78927763
	Offset: 0x136F8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function function_9f438f15()
{
	self function_6c36ab6b();
}

/*
	Name: function_1caf5c88
	Namespace: namespace_b376ff3f
	Checksum: 0x4204A909
	Offset: 0x13720
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function function_1caf5c88()
{
	if(!isdefined(self.inventory))
	{
		return;
	}
	reduction = 0;
	foreach(item in self.inventory.items)
	{
		if(item.id == 32767)
		{
			continue;
		}
		if(!isdefined(item.var_a6762160.var_dba54111) || item.var_a6762160.var_dba54111 == 0)
		{
			continue;
		}
		reduction = reduction + item.var_a6762160.var_dba54111;
	}
	namespace_6615ea91::function_cca7424d(self, reduction);
}

/*
	Name: function_b579540e
	Namespace: namespace_b376ff3f
	Checksum: 0xC8E5A742
	Offset: 0x13840
	Size: 0xA2
	Parameters: 2
	Flags: Linked
*/
function function_b579540e(item, aat_name)
{
	/#
		assert(isstruct(item));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160) || item.var_a6762160.itemtype != #"weapon")
	{
		return false;
	}
	if(!isdefined(aat_name))
	{
		return false;
	}
	item.aat = aat_name;
	return true;
}

/*
	Name: function_6af1ccad
	Namespace: namespace_b376ff3f
	Checksum: 0x41FE4E75
	Offset: 0x138F0
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function function_6af1ccad()
{
	weapon = self getcurrentweapon();
	maxammo = weapon.maxammo;
	var_53b14ebf = self function_b7f1fd2c(weapon);
	self setweaponammoclip(weapon, var_53b14ebf);
	self setweaponammostock(weapon, maxammo);
	if(is_true(weapon.isdualwield) && isdefined(weapon.dualwieldweapon) && weapon.dualwieldweapon != level.weaponnone)
	{
		var_c6eb5dd0 = self function_b7f1fd2c(weapon.dualwieldweapon);
		self setweaponammoclip(weapon.dualwieldweapon, var_c6eb5dd0);
	}
}

/*
	Name: function_73ae3380
	Namespace: namespace_b376ff3f
	Checksum: 0xD5234181
	Offset: 0x13A18
	Size: 0x530
	Parameters: 2
	Flags: Linked
*/
function function_73ae3380(item, var_a8bccf69)
{
	self endon(#"death");
	/#
		assert(isstruct(item));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160) || item.var_a6762160.itemtype != #"weapon")
	{
		return 0;
	}
	if(!isdefined(var_a8bccf69))
	{
		return 0;
	}
	var_b72ef6d2 = item.var_a6762160.weapon.displayname;
	var_446d6236 = namespace_ad5a0cd6::function_f4a8d375(item.id);
	if(item.var_a6762160.rarity === #"loadout" || is_true(item.var_b3546c09))
	{
		var_beeb02d3 = 1;
	}
	if(isdefined(level.var_fee1eaaf) && var_a8bccf69 < 2)
	{
		if(isdefined(item.aat))
		{
			aat_name = item.aat;
		}
		var_e9c4fe29 = [[level.var_fee1eaaf]](item);
		if(isdefined(var_e9c4fe29))
		{
			if(is_true(var_beeb02d3) && (isdefined(item.weaponoptions) && isdefined(item.var_e91aba42)))
			{
				var_e9c4fe29.var_b3546c09 = 1;
				var_e9c4fe29.weaponoptions = item.weaponoptions;
				var_e9c4fe29.var_e91aba42 = item.var_e91aba42;
				var_e9c4fe29.var_908f65ca = item.var_908f65ca;
				var_e9c4fe29.weaponoptions = self function_fc04b237(var_446d6236, var_e9c4fe29.weaponoptions);
			}
			var_bd31d7b2 = function_ec087745();
			var_e9c4fe29.var_8e092725 = 0;
			var_e9c4fe29.var_5b4ae99d = 1;
			dropweapon = function_9d102bbd(var_e9c4fe29, var_bd31d7b2);
			if(isentity(dropweapon))
			{
				item_world::function_7730442c(dropweapon);
			}
			currentweapon = self get_current_weapon();
			while(function_4d426f94(currentweapon))
			{
				waitframe(1);
				currentweapon = self get_current_weapon();
			}
			var_ec0c35ac = function_230ceec4(currentweapon);
			if(isdefined(var_ec0c35ac))
			{
				var_ec0c35ac.var_a8bccf69 = var_a8bccf69;
			}
			self function_d92c6b5b(currentweapon);
			if(isdefined(aat_name) && isdefined(var_ec0c35ac))
			{
				var_ec0c35ac.aat = aat_name;
				if(currentweapon.weapclass != "melee")
				{
					self function_bf3044dc(currentweapon, 1);
				}
				self aat::acquire(currentweapon, aat_name);
			}
			if(is_true(var_beeb02d3) && isdefined(var_ec0c35ac))
			{
				var_ec0c35ac.var_b3546c09 = 1;
			}
			self notify(#"hash_75ec9942d2d5fd0f");
			callback::callback(#"hash_75ec9942d2d5fd0f", {#hash_ca3e1138:var_b72ef6d2, #hash_a8bccf69:var_a8bccf69});
			self function_6af1ccad();
			return var_ec0c35ac;
		}
	}
	else
	{
		if(var_a8bccf69 >= 2)
		{
			item.var_a8bccf69 = var_a8bccf69;
		}
		else
		{
			return 0;
		}
	}
	self function_d92c6b5b();
	self notify(#"hash_75ec9942d2d5fd0f");
	callback::callback(#"hash_75ec9942d2d5fd0f", {#hash_ca3e1138:var_b72ef6d2, #hash_a8bccf69:var_a8bccf69});
	self function_6af1ccad();
	return 1;
}

/*
	Name: function_4d426f94
	Namespace: namespace_b376ff3f
	Checksum: 0x8B72DAAC
	Offset: 0x13F50
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_4d426f94(weapon)
{
	return weapon === level.weaponnone || weapon === level.weaponbasemeleeheld || !isdefined(weapon);
}

/*
	Name: function_d92c6b5b
	Namespace: namespace_b376ff3f
	Checksum: 0xB5AB4644
	Offset: 0x13F98
	Size: 0x272
	Parameters: 3
	Flags: Linked
*/
function function_d92c6b5b(currentweapon, var_b681f360, var_27751b99)
{
	self endon(#"death");
	if(!isdefined(currentweapon))
	{
		currentweapon = self get_current_weapon();
		while(function_4d426f94(currentweapon))
		{
			waitframe(1);
			currentweapon = self get_current_weapon();
		}
	}
	var_f879230e = self function_8cbd254d(currentweapon);
	if(isdefined(var_f879230e) && var_f879230e > 0)
	{
		return;
	}
	if(isdefined(var_27751b99))
	{
		switch(var_27751b99)
		{
			case 1:
			{
				self function_bd3cce02(currentweapon, 67);
				return;
			}
			case 2:
			{
				self function_bd3cce02(currentweapon, 68);
				return;
			}
			case 3:
			{
				self function_bd3cce02(currentweapon, 69);
				return;
			}
		}
	}
	weaponoptions = self function_ade49959(currentweapon);
	var_51fbc989 = getcamoindex(weaponoptions);
	if(isdefined(var_b681f360))
	{
		var_51fbc989 = var_b681f360;
	}
	if(!isdefined(var_51fbc989))
	{
		return;
	}
	switch(var_51fbc989)
	{
		case 0:
		{
			self function_bd3cce02(currentweapon, 67);
			break;
		}
		case 67:
		{
			self function_bd3cce02(currentweapon, 68);
			break;
		}
		case 68:
		{
			self function_bd3cce02(currentweapon, 69);
			break;
		}
	}
}

/*
	Name: function_dc5d31be
	Namespace: namespace_b376ff3f
	Checksum: 0x26F8EE19
	Offset: 0x14218
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function function_dc5d31be(var_9c95ad05)
{
	a_items = self.inventory.items;
	n_count = 0;
	if(isdefined(a_items))
	{
		foreach(item in a_items)
		{
			if(isdefined(item.var_a6762160) && isdefined(item.count) && var_9c95ad05 === item.var_a6762160.name)
			{
				n_count = n_count + item.count;
			}
		}
	}
	return n_count;
}

/*
	Name: function_eb0c9b9c
	Namespace: namespace_b376ff3f
	Checksum: 0x6F2DE7FA
	Offset: 0x14320
	Size: 0xFC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_eb0c9b9c()
{
	players = getplayers();
	var_7bba6210 = 1;
	while(var_7bba6210)
	{
		waitframe(1);
		var_7bba6210 = 0;
		foreach(player in players)
		{
			if(isdefined(player) && isalive(player) && is_true(player.var_7bba6210))
			{
				var_7bba6210 = 1;
				break;
			}
		}
	}
}

/*
	Name: function_f58e80e2
	Namespace: namespace_b376ff3f
	Checksum: 0xD581FF40
	Offset: 0x14428
	Size: 0xC4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f58e80e2()
{
	players = getplayers();
	for(index = 0; index < players.size; index++)
	{
		player = players[index];
		if(isalive(player))
		{
			if(!function_7d5553ac())
			{
				player thread function_56a681fb();
			}
		}
		if(((index + 1) % 3) == 0)
		{
			waitframe(1);
		}
	}
	function_eb0c9b9c();
}

/*
	Name: function_76eb9bd7
	Namespace: namespace_b376ff3f
	Checksum: 0x7E2ABB98
	Offset: 0x144F8
	Size: 0x1B8
	Parameters: 0
	Flags: None
*/
function function_76eb9bd7()
{
	/#
		item_world::function_1b11e73c();
		if(!isdefined(self) || !isplayer(self) || !isalive(self))
		{
			return;
		}
		while(isdefined(self) && !isdefined(self.inventory))
		{
			waitframe(1);
		}
		if(!isdefined(self))
		{
			return;
		}
		var_12bd5f2d = getdvarstring(#"hash_7b2be9e03d9785f3", "");
		tokens = strtok(var_12bd5f2d, "");
		foreach(token in tokens)
		{
			item = function_4ba8fde(token);
			if(isdefined(item))
			{
				var_fa3df96 = self function_e66dcff5(item);
				self item_world::function_de2018e3(item, self, var_fa3df96);
			}
		}
	#/
}

