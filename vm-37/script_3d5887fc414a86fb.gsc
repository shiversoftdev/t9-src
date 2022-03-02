#using script_2358831c5878ace3;
#using script_240ef62ff60b2694;
#using script_3d35e2ff167b3a82;
#using script_618d6f5ff5d18933;
#using script_680dddbda86931fa;
#using script_7ebad89114ecedb1;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_b376ff3f;

/*
	Name: function_89f2df9
	Namespace: namespace_b376ff3f
	Checksum: 0x2AC0A0C8
	Offset: 0x9C8
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
	Checksum: 0x347EE573
	Offset: 0xA18
	Size: 0x11C
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
	clientfield::function_a8bbc967("hudItems.healthItemstackCount", #"hud_items", #"hash_6a60c3e33988b66f", 1, 8, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.equipmentStackCount", #"hud_items", #"hash_3ae366d663c0f130", 1, 8, "int", undefined, 0, 0);
	callback::on_localplayer_spawned(&function_1877f414);
	level thread function_d2f05352();
	level.var_53854c4 = &function_53854c4;
}

/*
	Name: function_7d5553ac
	Namespace: namespace_b376ff3f
	Checksum: 0xB80908A1
	Offset: 0xB40
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function function_7d5553ac()
{
	return true;
}

/*
	Name: function_1877f414
	Namespace: namespace_b376ff3f
	Checksum: 0x1F536133
	Offset: 0xB98
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1877f414(localclientnum)
{
	if(self function_da43934d())
	{
		self thread function_3e624606(localclientnum);
		self thread function_ac4df751(localclientnum);
		self thread function_ca87f318(localclientnum);
		self thread function_7f35a045(localclientnum);
		self thread function_2ae9881d(localclientnum);
		self thread function_9b83c65d(localclientnum);
		self thread function_6636af5c(localclientnum);
	}
}

/*
	Name: function_6636af5c
	Namespace: namespace_b376ff3f
	Checksum: 0x17325BC1
	Offset: 0xC70
	Size: 0x23E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6636af5c(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("616993f811a15581");
	self endon("616993f811a15581");
	function_534dcb9c(localclientnum);
	while(true)
	{
		item = undefined;
		weapon = getcurrentweapon(localclientnum);
		data = item_world::function_a7e98a1a(localclientnum);
		if(isdefined(weapon) && isdefined(data))
		{
			var_16f12c31 = data.inventory.items[17];
			if(isdefined(var_16f12c31) && weapon.rootweapon === var_16f12c31.var_a6762160.weapon)
			{
				item = var_16f12c31;
			}
		}
		if(!isdefined(item))
		{
			var_a4250c2b = function_d768ea30(localclientnum);
			if(isdefined(var_a4250c2b))
			{
				var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_a4250c2b);
				item = function_15d578f4(localclientnum, var_bd027dd9);
			}
		}
		if(isdefined(item) && isdefined(item.var_a6762160) && isdefined(item.var_a6762160.rarity) && item.var_a6762160.rarity != "")
		{
			setuimodelvalue(level.var_830a8516[localclientnum], item.var_a6762160.rarity);
		}
		else
		{
			setuimodelvalue(level.var_830a8516[localclientnum], "Loadout");
		}
		waitframe(1);
	}
}

/*
	Name: function_3fe6ef04
	Namespace: namespace_b376ff3f
	Checksum: 0x5CB3DE7A
	Offset: 0xEB8
	Size: 0xFE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3fe6ef04(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	var_cfa0e915 = [];
	foreach(consumeditem in data.inventory.consumed.items)
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
	Name: function_88da0c8e
	Namespace: namespace_b376ff3f
	Checksum: 0xE455C3A3
	Offset: 0xFC0
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_88da0c8e(localclientnum)
{
	var_8b39f54e = stats::function_441050ca(localclientnum, #"hash_7bb5510daa652f5e");
	return (isdefined(var_8b39f54e) ? var_8b39f54e : 0) >= 150;
}

/*
	Name: function_99b22bbc
	Namespace: namespace_b376ff3f
	Checksum: 0xA74BD678
	Offset: 0x1018
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_99b22bbc(localclientnum)
{
	if(function_96d4f30e(localclientnum))
	{
		return false;
	}
	if(isgrappling(localclientnum))
	{
		return false;
	}
	if(function_d5f07a6e(localclientnum))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ca87f318
	Namespace: namespace_b376ff3f
	Checksum: 0xEB9CDDAA
	Offset: 0x1080
	Size: 0x3BA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ca87f318(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("212930c8e4f20245");
	self endon("212930c8e4f20245");
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	var_790695cc = "inventory_equip" + localclientnum;
	var_6e7b39bc = "inventory_detach" + localclientnum;
	var_8040e225.var_b9730e2b = gettime();
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_790695cc, var_6e7b39bc);
		if(gettime() - var_8040e225.var_b9730e2b < 300)
		{
			continue;
		}
		if(waitresult._notify === var_790695cc)
		{
			var_bd027dd9 = waitresult.id;
			quickequip = (isdefined(waitresult.var_d9b84a57) ? waitresult.var_d9b84a57 : 0);
			if(quickequip)
			{
				var_ed98a5fe = function_15d578f4(localclientnum, var_bd027dd9);
				if(isdefined(var_ed98a5fe))
				{
					var_a6762160 = var_ed98a5fe.var_a6762160;
				}
				if(isdefined(var_a6762160) && (var_a6762160.itemtype == #"generic" || var_a6762160.itemtype == #"killstreak"))
				{
					data = item_world::function_a7e98a1a(localclientnum);
					name = (isdefined(var_a6762160.parentname) ? var_a6762160.parentname : var_a6762160.name);
					for(index = 0; index < data.inventory.items.size && index < (17 + 1); index++)
					{
						var_b619c089 = data.inventory.items[index];
						if(!isdefined(var_b619c089.var_a6762160) || isdefined(var_b619c089.endtime))
						{
							continue;
						}
						if(var_b619c089.var_bd027dd9 == var_bd027dd9)
						{
							continue;
						}
						if(name == (isdefined(var_b619c089.var_a6762160.parentname) ? var_b619c089.var_a6762160.parentname : var_b619c089.var_a6762160.name))
						{
							var_bd027dd9 = var_b619c089.var_bd027dd9;
							break;
						}
					}
				}
			}
			if(isdefined(waitresult.var_31a0fb28))
			{
				function_97fedb0d(localclientnum, 11, var_bd027dd9, quickequip);
			}
			else
			{
				function_97fedb0d(localclientnum, 4, var_bd027dd9, quickequip);
			}
		}
		else if(waitresult._notify === var_6e7b39bc)
		{
			var_bd027dd9 = waitresult.id;
			function_97fedb0d(localclientnum, 6, var_bd027dd9);
		}
		var_8040e225.var_b9730e2b = gettime();
	}
}

/*
	Name: function_10861362
	Namespace: namespace_b376ff3f
	Checksum: 0xFFA998C6
	Offset: 0x1448
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_10861362(localclientnum)
{
	vehicle = getplayervehicle(self);
	if(!isdefined(vehicle))
	{
		return true;
	}
	var_88fa0205 = vehicle getoccupantseat(localclientnum, self);
	if(isdefined(var_88fa0205) && (var_88fa0205 == 0 || var_88fa0205 == 4))
	{
		return false;
	}
	return true;
}

/*
	Name: function_ee44351a
	Namespace: namespace_b376ff3f
	Checksum: 0x56314F95
	Offset: 0x14E0
	Size: 0x98
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ee44351a(localclientnum, var_b619c089)
{
	weapon = namespace_ad5a0cd6::function_35e06774(var_b619c089.var_a6762160);
	if(!isdefined(weapon))
	{
		return 1;
	}
	if(weapon == getcurrentweapon(localclientnum) || weapon == function_e9fe14ee(localclientnum))
	{
		return function_99b22bbc(localclientnum);
	}
	return 1;
}

/*
	Name: function_e23e5e85
	Namespace: namespace_b376ff3f
	Checksum: 0xF96520F1
	Offset: 0x1580
	Size: 0x1CA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e23e5e85(localclientnum)
{
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	if(!isdefined(var_8040e225) || !isdefined(var_8040e225.inventory) || !isdefined(var_8040e225.inventory.items))
	{
		return false;
	}
	var_344a1b3d = var_8040e225.inventory.items[6];
	if(!isdefined(var_344a1b3d) || var_344a1b3d.var_bd027dd9 === 32767 || var_344a1b3d.var_a6762160.itemtype !== #"armor")
	{
		return false;
	}
	var_35b0780f = getuimodelvalue(getuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "predictedClientModel"));
	var_a4d193fa = getuimodel(var_35b0780f, "armor");
	var_15663411 = getuimodel(var_344a1b3d.var_e4130a92, "armorMax");
	if(!isdefined(var_a4d193fa) || !isdefined(var_15663411) || getuimodelvalue(var_a4d193fa) == getuimodelvalue(var_15663411))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e094fd92
	Namespace: namespace_b376ff3f
	Checksum: 0xF1B30F44
	Offset: 0x1758
	Size: 0x96
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e094fd92(item)
{
	if(!isdefined(item) || !isdefined(item.var_bd027dd9) || item.var_bd027dd9 == 32767 || !isdefined(item.quickequip) || item.quickequip != 1 || !isdefined(item.consumable) || item.consumable != 1)
	{
		return false;
	}
	return true;
}

/*
	Name: function_f3ef5269
	Namespace: namespace_b376ff3f
	Checksum: 0x6404FF8D
	Offset: 0x17F8
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f3ef5269(localclientnum)
{
	var_b25b2894 = [];
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	for(i = 0; i < 5; i++)
	{
		var_a638d314 = var_8040e225.inventory.items[i];
		if(function_e094fd92(var_a638d314))
		{
			if(!isdefined(var_b25b2894))
			{
				var_b25b2894 = [];
			}
			else if(!isarray(var_b25b2894))
			{
				var_b25b2894 = array(var_b25b2894);
			}
			var_b25b2894[var_b25b2894.size] = var_a638d314;
		}
	}
	return var_b25b2894;
}

/*
	Name: function_e090a831
	Namespace: namespace_b376ff3f
	Checksum: 0xA90CBF44
	Offset: 0x18E0
	Size: 0xBE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e090a831(localclientnum, var_bd027dd9)
{
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	perkindex = 0;
	for(i = 0; i < 5; i++)
	{
		var_a638d314 = var_8040e225.inventory.items[i];
		if(function_e094fd92(var_a638d314))
		{
			if(var_a638d314.var_bd027dd9 == var_bd027dd9)
			{
				return perkindex;
			}
			perkindex++;
		}
	}
	return -1;
}

/*
	Name: function_535a5a06
	Namespace: namespace_b376ff3f
	Checksum: 0xE1DD6BBF
	Offset: 0x19A8
	Size: 0x170
	Parameters: 2
	Flags: Linked, Private
*/
function private function_535a5a06(localclientnum, var_6e51c00)
{
	/#
		assert(var_6e51c00 >= -1 && var_6e51c00 <= 1);
	#/
	var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	var_f99434b1 = createuimodel(var_dcb56aa8, "quickConsumeIndex");
	var_b25b2894 = function_f3ef5269(localclientnum);
	var_be32fa6d = var_b25b2894.size;
	if(var_be32fa6d < 2)
	{
		setuimodelvalue(var_f99434b1, 0);
		return 0;
	}
	quickconsumeindex = getuimodelvalue(var_f99434b1);
	if(!isdefined(quickconsumeindex))
	{
		quickconsumeindex = 0;
	}
	quickconsumeindex = quickconsumeindex + var_6e51c00;
	if(quickconsumeindex >= var_be32fa6d)
	{
		quickconsumeindex = 0;
	}
	else if(quickconsumeindex < 0)
	{
		quickconsumeindex = var_be32fa6d - 1;
	}
	setuimodelvalue(var_f99434b1, quickconsumeindex);
	return quickconsumeindex;
}

/*
	Name: function_91483494
	Namespace: namespace_b376ff3f
	Checksum: 0x5FBB50C1
	Offset: 0x1B20
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_91483494(localclientnum)
{
	return function_1606ff3(localclientnum, 1);
}

/*
	Name: function_9f5d2dc8
	Namespace: namespace_b376ff3f
	Checksum: 0x85209C24
	Offset: 0x1B50
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9f5d2dc8(localclientnum)
{
	return function_1606ff3(localclientnum, 0);
}

/*
	Name: function_1606ff3
	Namespace: namespace_b376ff3f
	Checksum: 0x4E178A11
	Offset: 0x1B80
	Size: 0x124
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1606ff3(localclientnum, var_6e51c00)
{
	var_b25b2894 = function_f3ef5269(localclientnum);
	currentindex = function_535a5a06(localclientnum, var_6e51c00);
	var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	var_98d32f1c = createuimodel(var_dcb56aa8, "quickConsumeNetworkId");
	if(isdefined(var_b25b2894[currentindex]))
	{
		setuimodelvalue(var_98d32f1c, var_b25b2894[currentindex].var_bd027dd9);
	}
	else
	{
		setuimodelvalue(var_98d32f1c, 32767);
	}
	if(var_b25b2894.size > 1)
	{
		playsound(localclientnum, #"hash_4d31bd9927d823c3");
	}
}

/*
	Name: function_22759012
	Namespace: namespace_b376ff3f
	Checksum: 0xC7B38825
	Offset: 0x1CB0
	Size: 0x104
	Parameters: 2
	Flags: Linked, Private
*/
function private function_22759012(localclientnum, var_bd027dd9)
{
	perkindex = function_e090a831(localclientnum, var_bd027dd9);
	if(perkindex > -1)
	{
		var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		var_f99434b1 = createuimodel(var_dcb56aa8, "quickConsumeIndex");
		setuimodelvalue(var_f99434b1, perkindex);
		var_98d32f1c = createuimodel(var_dcb56aa8, "quickConsumeNetworkId");
		setuimodelvalue(var_98d32f1c, var_bd027dd9);
	}
	else
	{
		function_9f5d2dc8(localclientnum);
	}
}

/*
	Name: function_1470ccfe
	Namespace: namespace_b376ff3f
	Checksum: 0x44C0A5C7
	Offset: 0x1DC0
	Size: 0xEE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1470ccfe(localclientnum, item)
{
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	for(i = 0; i < 5; i++)
	{
		var_a638d314 = var_8040e225.inventory.items[i];
		if(var_a638d314.var_bd027dd9 == 32767 || !namespace_a0d533d1::function_73593286(item.var_a6762160, var_a638d314.var_a6762160) || !isdefined(var_a638d314.availableaction) || item.availableaction != var_a638d314.availableaction)
		{
			continue;
		}
		return var_a638d314.var_bd027dd9;
	}
	return undefined;
}

/*
	Name: function_9b83c65d
	Namespace: namespace_b376ff3f
	Checksum: 0x4E6F0701
	Offset: 0x1EB8
	Size: 0xBA2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9b83c65d(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("696b17e2c16abf47");
	self endon("696b17e2c16abf47");
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	var_ca4fc719 = "inventory_consume" + localclientnum;
	var_e2d1f454 = "inventory_armor_repair_pressed" + localclientnum;
	var_3731e165 = "inventory_armor_repair_released" + localclientnum;
	var_6a10d173 = "inventory_quick_consume" + localclientnum;
	var_ce5c0b10 = "inventory_cycle_quick_consumable" + localclientnum;
	var_17bdd1c3 = "inventory_equip_quick_consumable" + localclientnum;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_ca4fc719, var_e2d1f454, var_3731e165, var_6a10d173, var_ce5c0b10, var_17bdd1c3);
		if(waitresult._notify === var_ca4fc719)
		{
			if(!function_10861362(localclientnum))
			{
				self playsound(localclientnum, #"uin_default_action_denied");
				continue;
			}
			var_b619c089 = function_15d578f4(localclientnum, waitresult.id);
			function_22759012(localclientnum, var_b619c089.var_bd027dd9);
		}
		else
		{
			if(waitresult._notify === var_17bdd1c3)
			{
				var_b619c089 = function_15d578f4(localclientnum, waitresult.id);
				var_bd027dd9 = function_1470ccfe(localclientnum, var_b619c089);
				function_22759012(localclientnum, (isdefined(var_bd027dd9) ? var_b619c089.var_bd027dd9 : var_bd027dd9));
				continue;
			}
			else
			{
				if(waitresult._notify === var_6a10d173)
				{
					currentindex = function_535a5a06(localclientnum, 0);
					var_b25b2894 = function_f3ef5269(localclientnum);
					if(isdefined(var_b25b2894[currentindex]))
					{
						var_b619c089 = var_b25b2894[currentindex];
					}
					else
					{
						continue;
					}
				}
				else
				{
					if(waitresult._notify === var_ce5c0b10)
					{
						function_91483494(localclientnum);
						continue;
					}
					else
					{
						var_b619c089 = var_8040e225.inventory.items[11];
						if(!isdefined(var_b619c089) || var_b619c089.var_bd027dd9 === 32767 || var_b619c089.var_a6762160.itemtype !== #"hash_56d6621e6c4caf07")
						{
							if(waitresult._notify === var_e2d1f454)
							{
								var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
								var_3ea10284 = createuimodel(var_dcb56aa8, "armorShardNotAvailable");
								function_9a227103(var_3ea10284);
							}
							continue;
						}
						var_a3162739 = isdefined(var_8040e225.inventory.var_f3518190) && var_b619c089 == var_8040e225.inventory.var_f3518190.item;
						if(waitresult._notify === var_e2d1f454)
						{
							if(!function_e23e5e85(localclientnum) || var_b619c089.count == 0 || !function_10861362(localclientnum))
							{
								self playsound(localclientnum, #"uin_default_action_denied");
								var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
								var_3ea10284 = createuimodel(var_dcb56aa8, "armorShardNotAvailable");
								function_9a227103(var_3ea10284);
								continue;
							}
						}
						else if(!var_a3162739)
						{
							continue;
						}
					}
				}
			}
		}
		if(!isdefined(var_b619c089.var_a6762160.casttime) || var_b619c089.var_a6762160.casttime <= 0)
		{
			function_97fedb0d(localclientnum, 4, var_b619c089.var_bd027dd9);
			continue;
		}
		var_eaae8ced = 0;
		if(isdefined(var_8040e225.inventory.consumed.items) && isarray(var_8040e225.inventory.consumed.items))
		{
			foreach(consumeditem in var_8040e225.inventory.consumed.items)
			{
				if(isdefined(consumeditem.var_a6762160.talents) && isarray(consumeditem.var_a6762160.talents))
				{
					foreach(talent in consumeditem.var_a6762160.talents)
					{
						if(talent.talent == #"hash_20c8c24a2156176c")
						{
							var_eaae8ced = 1;
							break;
						}
					}
				}
				if(var_eaae8ced)
				{
					break;
				}
			}
		}
		if(isdefined(var_8040e225.inventory.var_f3518190))
		{
			if(var_b619c089 != var_8040e225.inventory.var_f3518190.item)
			{
				setuimodelvalue(createuimodel(var_8040e225.inventory.var_f3518190.item.var_e4130a92, "castTimeFraction"), 0, 0);
				playsound(localclientnum, #"hash_4d31bd9927d823c3");
				var_f3518190 = spawnstruct();
				var_f3518190.item = var_b619c089;
				var_f3518190.caststart = gettime();
				var_f3518190.castend = var_f3518190.caststart + (int((isdefined((var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime)) ? (var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime) : 0) * 1000));
				var_8040e225.inventory.var_f3518190 = var_f3518190;
				function_de74158f(localclientnum, var_f3518190.item.var_bd027dd9);
				var_8040e225.inventory.var_4d4ec560 = var_b619c089.var_bd027dd9;
			}
			else
			{
				setuimodelvalue(createuimodel(var_8040e225.inventory.var_f3518190.item.var_e4130a92, "castTimeFraction"), 0, 0);
				setuimodelvalue(var_8040e225.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
				var_8040e225.inventory.var_f3518190 = undefined;
				var_8040e225.inventory.var_4d4ec560 = undefined;
			}
		}
		else if(!isdefined(var_8040e225.inventory.var_4d4ec560) || var_8040e225.inventory.var_4d4ec560 != var_b619c089.var_bd027dd9)
		{
			playsound(localclientnum, #"hash_4d31bd9927d823c3");
			var_f3518190 = spawnstruct();
			var_f3518190.item = var_b619c089;
			var_f3518190.caststart = gettime();
			var_f3518190.castend = var_f3518190.caststart + (int((isdefined((var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime)) ? (var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime) : 0) * 1000));
			var_8040e225.inventory.var_f3518190 = var_f3518190;
			function_de74158f(localclientnum, var_f3518190.item.var_bd027dd9);
			var_8040e225.inventory.var_4d4ec560 = var_b619c089.var_bd027dd9;
		}
	}
}

/*
	Name: function_ac4df751
	Namespace: namespace_b376ff3f
	Checksum: 0xAF96A2B6
	Offset: 0x2A68
	Size: 0x460
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ac4df751(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("75b843eee0f0138c");
	self endon("75b843eee0f0138c");
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	var_5054e2f7 = "inventory_drop" + localclientnum;
	var_ffec0c46 = "inventory_drop_current_weapon" + localclientnum;
	var_46a7a0e3 = "inventory_drop_current_weapon_and_detach" + localclientnum;
	var_fcd005cc = "inventory_drop_weapon_in_slot" + localclientnum;
	var_3d759450 = "inventory_drop_weapon_in_slot_and_detach" + localclientnum;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_5054e2f7, var_ffec0c46, var_46a7a0e3, var_fcd005cc, var_3d759450);
		if(waitresult._notify === var_5054e2f7)
		{
			var_bd027dd9 = waitresult.id;
			count = waitresult.var_d9b84a57;
			var_d8138db2 = item_world::function_28b42f1c(localclientnum, var_bd027dd9);
			if(var_d8138db2 != 32767)
			{
				if(function_6d9d9cd7(waitresult.selectedindex))
				{
					var_b619c089 = var_8040e225.inventory.items[waitresult.selectedindex];
					if(isdefined(var_b619c089) && !function_ee44351a(localclientnum, var_b619c089))
					{
						continue;
					}
				}
				if(isdefined(var_8040e225.inventory.var_f3518190) && var_8040e225.inventory.var_f3518190.item.id == var_d8138db2)
				{
					var_8040e225.inventory.var_f3518190 = undefined;
					var_8040e225.inventory.var_4d4ec560 = undefined;
					setuimodelvalue(var_8040e225.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
				}
				function_97fedb0d(localclientnum, 5, var_bd027dd9, count);
			}
		}
		else
		{
			if(waitresult._notify === var_ffec0c46 || waitresult._notify === var_fcd005cc)
			{
				var_4838b749 = (isdefined(waitresult.slotid) ? array(17 + 1, ((17 + 1) + 8) + 1)[waitresult.slotid] : function_d768ea30(localclientnum));
				if(isdefined(var_4838b749))
				{
					var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_4838b749);
					function_97fedb0d(localclientnum, 5, var_bd027dd9);
				}
			}
			else if(waitresult._notify === var_46a7a0e3 || waitresult._notify === var_3d759450)
			{
				var_4838b749 = (isdefined(waitresult.slotid) ? array(17 + 1, ((17 + 1) + 8) + 1)[waitresult.slotid] : function_d768ea30(localclientnum));
				if(isdefined(var_4838b749))
				{
					var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_4838b749);
					function_97fedb0d(localclientnum, 8, var_bd027dd9);
				}
			}
		}
	}
}

/*
	Name: function_8edef5cc
	Namespace: namespace_b376ff3f
	Checksum: 0xDB43538A
	Offset: 0x2ED0
	Size: 0x1D0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8edef5cc(localclientnum, var_b619c089)
{
	data = item_world::function_a7e98a1a(localclientnum);
	slot = function_daf3ebda(localclientnum, var_b619c089.var_a6762160);
	if(!isdefined(slot))
	{
		slot = self function_78ed4455(localclientnum, var_b619c089.var_a6762160);
	}
	if(isdefined(slot))
	{
		if(var_b619c089.var_a6762160.type != #"attachment")
		{
			item = data.inventory.items[slot];
			setuimodelvalue(createuimodel(item.var_e4130a92, "focusTarget"), 1);
		}
	}
	else if(function_ad4c6116(localclientnum, var_b619c089.var_a6762160))
	{
		for(i = 0; i < data.inventory.var_c212de25; i++)
		{
			if(data.inventory.items[i].var_bd027dd9 === 32767)
			{
				setuimodelvalue(createuimodel(data.inventory.items[i].var_e4130a92, "focusTarget"), 1);
				break;
			}
		}
	}
}

/*
	Name: function_96ce9058
	Namespace: namespace_b376ff3f
	Checksum: 0x97EC7738
	Offset: 0x30A8
	Size: 0x178
	Parameters: 4
	Flags: Linked, Private
*/
function private function_96ce9058(localclientnum, var_6c2b2289, var_b619c089, item)
{
	level endon(var_6c2b2289);
	self notify("36aa4d277b09b4c1");
	self endon("36aa4d277b09b4c1");
	if(isdefined(item.var_a6762160.unlockableitemref))
	{
		var_1ce96a13 = array(0, 0, 0, 0, 0);
		while(true)
		{
			waitframe(1);
			for(i = 0; i < 5; i++)
			{
				if(isdefined(item.var_a6762160.objectives[i]) && isdefined(item.var_a6762160.objectives[i].var_7e835304))
				{
					value = stats::function_441050ca(localclientnum, item.var_a6762160.objectives[i].var_7e835304);
					if(isdefined(value) && value != var_1ce96a13[i])
					{
						var_1ce96a13[i] = value;
						function_39b663b7(localclientnum, var_b619c089, item);
					}
				}
			}
		}
	}
}

/*
	Name: function_7f35a045
	Namespace: namespace_b376ff3f
	Checksum: 0xF0C4C472
	Offset: 0x3228
	Size: 0x954
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7f35a045(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("3d704743961ef84e");
	self endon("3d704743961ef84e");
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	var_6c2b2289 = "inventory_item_focus" + localclientnum;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_6c2b2289);
		data = item_world::function_a7e98a1a(localclientnum);
		function_534dcb9c(localclientnum);
		if(isdefined(level.var_6d21daaf[localclientnum]))
		{
			setuimodelvalue(level.var_6d21daaf[localclientnum], 0);
		}
		foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1))
		{
			foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
			{
				var_f9f8c0b5 = var_4838b749 + var_259f58f3;
				item = data.inventory.items[var_f9f8c0b5];
				setuimodelvalue(createuimodel(item.var_e4130a92, "focusTarget"), 0);
				setuimodelvalue(createuimodel(item.var_e4130a92, "notAvailable"), 0);
			}
		}
		setuimodelvalue(createuimodel(data.inventory.items[6].var_e4130a92, "focusTarget"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[8].var_e4130a92, "focusTarget"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[7].var_e4130a92, "focusTarget"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[5].var_e4130a92, "focusTarget"), 0);
		for(i = 0; i < 5; i++)
		{
			setuimodelvalue(createuimodel(data.inventory.items[i].var_e4130a92, "focusTarget"), 0);
		}
		if(waitresult._notify !== var_6c2b2289)
		{
			continue;
		}
		var_bd027dd9 = waitresult.id;
		data.inventory.var_9d51958c = var_bd027dd9;
		if(var_bd027dd9 === 32767)
		{
			continue;
		}
		var_b619c089 = function_15d578f4(localclientnum, var_bd027dd9);
		if(isdefined(var_b619c089) && 32767 != var_b619c089.id)
		{
			item = function_b1702735(var_b619c089.id);
			if(isdefined(item) && isdefined(item.var_a6762160))
			{
				self thread function_96ce9058(localclientnum, var_6c2b2289, var_b619c089, item);
			}
		}
		if(!isdefined(var_b619c089) && item_world::function_a5c2a6b8(localclientnum) && self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2)
		{
			arrayremovevalue(data.var_f0f7e918, undefined, 0);
			for(index = 0; index < data.var_f0f7e918.size; index++)
			{
				var_81bb13f5 = data.var_f0f7e918[index];
				if(var_81bb13f5.var_bd027dd9 === var_bd027dd9)
				{
					if(var_81bb13f5.var_a6762160.itemtype != #"ammo" && var_81bb13f5.var_a6762160.itemtype != #"weapon")
					{
						var_b619c089 = var_81bb13f5;
						function_8edef5cc(localclientnum, var_b619c089);
					}
					break;
				}
			}
		}
		if(!isdefined(var_b619c089) || !isdefined(var_b619c089.var_a6762160) || var_b619c089.var_a6762160.itemtype !== #"attachment")
		{
			continue;
		}
		var_a4250c2b = function_d768ea30(localclientnum);
		foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1))
		{
			var_64d58696 = data.inventory.items[var_4838b749];
			if(var_64d58696.id === 32767)
			{
				continue;
			}
			var_ceefbd10 = namespace_a0d533d1::function_837f4a57(var_b619c089.var_a6762160);
			var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_ceefbd10);
			attachmentname = namespace_a0d533d1::function_2ced1d34(var_64d58696, var_b619c089.var_a6762160);
			var_86364446 = data.inventory.items[var_f9f8c0b5];
			if(isdefined(attachmentname))
			{
				if(var_bd027dd9 != var_86364446.var_bd027dd9)
				{
					setuimodelvalue(createuimodel(var_86364446.var_e4130a92, "focusTarget"), 1);
				}
				var_fdc9fcff = (var_a4250c2b == (17 + 1) ? ((17 + 1) + 8) + 1 : 17 + 1);
				if(var_fdc9fcff == var_4838b749)
				{
					setuimodelvalue(level.var_6d21daaf[localclientnum], 1);
				}
				continue;
			}
			setuimodelvalue(createuimodel(var_86364446.var_e4130a92, "notAvailable"), 1);
		}
	}
}

/*
	Name: function_2ae9881d
	Namespace: namespace_b376ff3f
	Checksum: 0xE1A7B908
	Offset: 0x3B88
	Size: 0x1EA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2ae9881d(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("1a7ea0ed7d48cc91");
	self endon("1a7ea0ed7d48cc91");
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	var_f3efb06b = "cycle_health" + localclientnum;
	var_db83305d = "cycle_equipment" + localclientnum;
	var_d991a20a = "cycle_scorestreak" + localclientnum;
	var_58ea832 = "cycle_field_upgrade" + localclientnum;
	var_8040e225.var_cb55ac3c = gettime();
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_f3efb06b, var_db83305d, var_d991a20a, var_58ea832);
		if(gettime() - var_8040e225.var_cb55ac3c < 200)
		{
			continue;
		}
		if(waitresult._notify === var_f3efb06b)
		{
			function_97fedb0d(localclientnum, 10);
		}
		else
		{
			if(waitresult._notify === var_db83305d)
			{
				function_97fedb0d(localclientnum, 9);
			}
			else
			{
				if(waitresult._notify === var_d991a20a)
				{
					function_97fedb0d(localclientnum, 14);
				}
				else if(waitresult._notify === var_58ea832)
				{
					function_97fedb0d(localclientnum, 15);
				}
			}
		}
		var_8040e225.var_cb55ac3c = gettime();
	}
}

/*
	Name: function_53854c4
	Namespace: namespace_b376ff3f
	Checksum: 0x160100A9
	Offset: 0x3D80
	Size: 0x3D8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_53854c4(localclientnum)
{
	if(!isalive(self))
	{
		return;
	}
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	var_a638d314 = self.var_9b882d22;
	if(!isdefined(var_a638d314) || !isdefined(var_a638d314.var_a6762160))
	{
		return false;
	}
	var_512ddf16 = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2;
	if(namespace_ad5a0cd6::function_83c20f83(self.var_9b882d22) && !var_512ddf16)
	{
		return false;
	}
	if(var_512ddf16 && self.var_54d9f4a6)
	{
		return false;
	}
	origin = getlocalclienteyepos(localclientnum);
	if(distance2dsquared(origin, var_a638d314.origin) > sqr(128) || (abs(origin[2] - var_a638d314.origin[2])) > 128)
	{
		return false;
	}
	if(!isdefined(var_a638d314.var_a6762160))
	{
		return false;
	}
	var_fc7876fd = 0;
	if(!function_ad4c6116(localclientnum, var_a638d314.var_a6762160))
	{
		swap = 0;
		data = item_world::function_a7e98a1a(localclientnum);
		switch(var_a638d314.var_a6762160.itemtype)
		{
			case "tactical":
			case "scorestreak":
			case "equipment":
			case "field_upgrade":
			case "hash_63c2e39c90346280":
			case "hash_63c2e49c90346433":
			case "hash_63c2e59c903465e6":
			case "health":
			{
				swap = 1;
				break;
			}
			default:
			{
				break;
			}
		}
		if(!swap)
		{
			return false;
		}
		function_97fedb0d(localclientnum, 7, var_a638d314.var_bd027dd9, 2);
		return true;
	}
	switch(var_a638d314.var_a6762160.itemtype)
	{
		case "tactical":
		case "weapon":
		case "scorestreak":
		case "equipment":
		case "field_upgrade":
		case "hash_63c2e39c90346280":
		case "hash_63c2e49c90346433":
		case "hash_63c2e59c903465e6":
		case "health":
		{
			var_fc7876fd = 1;
			break;
		}
	}
	function_97fedb0d(localclientnum, 7, var_a638d314.var_bd027dd9, var_fc7876fd);
	return true;
}

/*
	Name: function_6d9d9cd7
	Namespace: namespace_b376ff3f
	Checksum: 0x11360614
	Offset: 0x4160
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6d9d9cd7(slotid)
{
	/#
		assert(isint(slotid));
	#/
	foreach(slot in array(5, 6, 12, 7, 13, 8, 17 + 1, ((17 + 1) + 8) + 1, 14, 15, 16, 17))
	{
		if(slot == slotid)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d2f05352
	Namespace: namespace_b376ff3f
	Checksum: 0xDB4132F0
	Offset: 0x4270
	Size: 0x740
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d2f05352()
{
	level endon(#"shutdown");
	waitframe(1);
	while(true)
	{
		players = getlocalplayers();
		time = gettime();
		foreach(player in players)
		{
			if(!isalive(player))
			{
				continue;
			}
			localclientnum = player getlocalclientnumber();
			if(!isdefined(localclientnum))
			{
				continue;
			}
			data = item_world::function_a7e98a1a(localclientnum);
			if(!isdefined(data) || !isdefined(data.inventory) || !isdefined(data.inventory.items))
			{
				continue;
			}
			consumed = data.inventory.consumed;
			var_3ef517e = data.inventory.consumed.items;
			var_95dcc077 = 0;
			i = 0;
			while(i < var_3ef517e.size)
			{
				item = var_3ef517e[i];
				if(item.endtime <= time)
				{
					var_95dcc077 = 1;
					arrayremoveindex(var_3ef517e, i);
					playsound(localclientnum, #"hash_4c7a6e162e2f26a0");
				}
				else
				{
					i++;
				}
			}
			var_cfa0e915 = [];
			for(i = 0; i < var_3ef517e.size; i++)
			{
				item = var_3ef517e[i];
				if(isdefined(var_cfa0e915[item.var_a6762160.name]))
				{
					continue;
				}
				var_cfa0e915[item.var_a6762160.name] = 1;
				duration = item.endtime - item.starttime;
				timeremaining = item.endtime - time;
				if(var_95dcc077)
				{
					item.var_e4130a92 = createuimodel(consumed.uimodel, "item" + (var_cfa0e915.size - 1));
					function_1a99656a(localclientnum, item, item.var_bd027dd9, item.id, 0, 0, 0, 0);
				}
				frac = 1;
				if(duration > 0)
				{
					frac = 1 - (timeremaining / duration);
				}
				setuimodelvalue(createuimodel(item.var_e4130a92, "endStartFraction"), frac, 0);
			}
			var_f3518190 = data.inventory.var_f3518190;
			if(isdefined(var_f3518190) && var_f3518190.item.id != 32767)
			{
				duration = var_f3518190.castend - var_f3518190.caststart;
				timeremaining = var_f3518190.castend - time;
				if(timeremaining <= 0)
				{
					function_97fedb0d(localclientnum, 4, var_f3518190.item.var_bd027dd9);
					setuimodelvalue(createuimodel(var_f3518190.item.var_e4130a92, "castTimeFraction"), 0, 0);
					data.inventory.var_f3518190 = undefined;
					if(var_f3518190.item.var_bd027dd9 == data.inventory.items[11].var_bd027dd9)
					{
						var_95dcc077 = 1;
						if(!function_e23e5e85(localclientnum))
						{
							data.inventory.var_4d4ec560 = undefined;
						}
					}
				}
				else
				{
					setuimodelvalue(createuimodel(var_f3518190.item.var_e4130a92, "castTimeFraction"), 1 - (timeremaining / duration), 0);
					uimodel = getuimodel(data.inventory.consumed.uimodel, "item" + function_3fe6ef04(localclientnum));
					if(isdefined(uimodel))
					{
						setuimodelvalue(createuimodel(uimodel, "castTimeFraction"), 1 - (timeremaining / duration), 0);
					}
				}
			}
			for(index = 0; index < 5; index++)
			{
				item = data.inventory.items[index];
				if(!isdefined(item.endtime))
				{
					continue;
				}
				duration = item.endtime - item.starttime;
				timeremaining = item.endtime - time;
				frac = 1;
				if(duration > 0)
				{
					frac = 1 - (timeremaining / duration);
				}
				setuimodelvalue(createuimodel(item.var_e4130a92, "endStartFraction"), frac, 0);
			}
			if(var_95dcc077)
			{
				setuimodelvalue(consumed.var_a25538fb, var_cfa0e915.size);
				function_9f5d2dc8(localclientnum);
			}
		}
		players = undefined;
		waitframe(1);
	}
}

/*
	Name: function_fe189514
	Namespace: namespace_b376ff3f
	Checksum: 0xDF2A3DEF
	Offset: 0x49B8
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe189514(var_a6762160)
{
	if(isdefined(var_a6762160) && isdefined(var_a6762160.weapon))
	{
		return (isdefined(var_a6762160.weapon.name) ? var_a6762160.weapon.name : #"");
	}
	return #"";
}

/*
	Name: function_1a99656a
	Namespace: namespace_b376ff3f
	Checksum: 0xFE550DDC
	Offset: 0x4A38
	Size: 0x1F84
	Parameters: 10
	Flags: Linked, Private
*/
function private function_1a99656a(localclientnum, var_b619c089, var_bd027dd9, var_d8138db2, count, totalcount, availableaction, var_e35261f6, var_189fcf49, var_1204dfe9)
{
	if(!isdefined(var_e35261f6))
	{
		var_e35261f6 = 1;
	}
	if(!isdefined(var_189fcf49))
	{
		var_189fcf49 = 0;
	}
	if(!isdefined(var_1204dfe9))
	{
		var_1204dfe9 = 1;
	}
	data = undefined;
	if(var_d8138db2 == 32767 && isdefined(var_b619c089.var_bd027dd9) && var_b619c089.var_bd027dd9 != 32767)
	{
		data = level.var_d342a3fd[localclientnum];
	}
	else
	{
		if(var_d8138db2 != 32767 && var_b619c089.var_bd027dd9 === 32767)
		{
			data = level.var_d342a3fd[localclientnum];
		}
		else if(isdefined(var_b619c089.var_a6762160) && (var_b619c089.var_a6762160.itemtype === #"hash_56d6621e6c4caf07" || var_b619c089.var_a6762160.itemtype === #"scorestreak" || namespace_ad5a0cd6::function_a57773a4(var_b619c089.var_a6762160)))
		{
			data = level.var_d342a3fd[localclientnum];
		}
	}
	var_dbce1e30 = 0;
	if(var_b619c089.id === var_d8138db2 && isdefined(var_b619c089.count) && var_b619c089.count > count)
	{
		var_dbce1e30 = 1;
		if(isdefined(var_b619c089.var_a6762160) && var_b619c089.var_a6762160.itemtype === #"hash_56d6621e6c4caf07")
		{
			var_8040e225 = item_world::function_a7e98a1a(localclientnum);
			if(isdefined(var_8040e225) && isdefined(var_8040e225.inventory) && var_bd027dd9 === var_8040e225.inventory.var_4d4ec560)
			{
				var_8040e225.inventory.var_4d4ec560 = undefined;
			}
		}
	}
	player = function_27673a7(localclientnum);
	var_1bd87f37 = 1;
	if(isdefined(var_b619c089.var_a6762160) && var_b619c089.var_a6762160.itemtype == #"hash_56d6621e6c4caf07" && var_bd027dd9 == 32767 && var_1204dfe9 == 0)
	{
		var_1bd87f37 = 0;
	}
	var_e3f9d92b = namespace_ad5a0cd6::function_a57773a4(var_b619c089.var_a6762160);
	var_75b43169 = isdefined(var_b619c089.var_a6762160) && var_b619c089.var_a6762160.itemtype === #"scorestreak";
	var_d5042302 = isdefined(var_b619c089.var_a6762160) && var_b619c089.var_a6762160.itemtype === #"attachment";
	var_1c54cff7 = var_b619c089.var_a6762160;
	if(var_1bd87f37)
	{
		var_b619c089.id = var_d8138db2;
		var_b619c089.var_bd027dd9 = var_bd027dd9;
	}
	else
	{
		var_d8138db2 = var_b619c089.id;
		var_bd027dd9 = var_b619c089.var_bd027dd9;
	}
	var_b619c089.count = count;
	var_b619c089.var_a6762160 = (32767 == var_d8138db2 ? undefined : function_b1702735(var_d8138db2).var_a6762160);
	var_b619c089.availableaction = availableaction;
	var_b619c089.consumable = (isdefined(var_b619c089.var_a6762160) ? var_b619c089.var_a6762160.consumable : undefined);
	var_b619c089.quickequip = 0;
	if(var_e35261f6)
	{
		var_b619c089.starttime = undefined;
		var_b619c089.endtime = undefined;
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "endStartFraction"), 0, 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "castTimeFraction"), 0, 0);
	}
	setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "id"), var_b619c089.var_bd027dd9);
	setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "realId"), var_b619c089.id);
	setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "stackCount"), count);
	if(isdefined(var_b619c089.var_a6762160) && var_b619c089.var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "totalCount"), count);
	}
	else
	{
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "totalCount"), totalcount);
	}
	item = undefined;
	if(var_d8138db2 != 32767)
	{
		item = function_b1702735(var_d8138db2);
	}
	if(var_d8138db2 == 32767 || !isdefined(item.var_a6762160))
	{
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "name"), #"");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "icon"), #"blacktransparent");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "rarity"), "None");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "availableAction"), availableaction);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "stowedAvailableAction"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "canTransferAttachment"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "consumable"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "assetName"), #"");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "description"), #"");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "castTime"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "type"), "");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "equipped"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "endStartFraction"), 0, 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "castTimeFraction"), 0, 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "notAvailable"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "notAccessible"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "focusTarget"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "quickEquip"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "cycle"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "armorMax"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "hasAttachments"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "supportsAttachments"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "unlockableItemRef"), #"");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "quote"), #"");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "rewardName"), #"");
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "ammoType"), #"");
		function_442857e2(localclientnum, var_1c54cff7);
	}
	else
	{
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "name"), item_world::get_item_name(item.var_a6762160));
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "icon"), (isdefined(item.var_a6762160.icon) ? item.var_a6762160.icon : #"blacktransparent"));
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "rarity"), (isdefined(item.var_a6762160.rarity) ? item.var_a6762160.rarity : "None"));
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "assetName"), function_fe189514(item.var_a6762160));
		armormax = 0;
		if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"armor")
		{
			armormax = (isdefined(item.var_a6762160.amount) ? item.var_a6762160.amount : 0);
		}
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "armorMax"), armormax);
		description = (isdefined(item.var_a6762160.description) ? item.var_a6762160.description : #"");
		if(getdvar(#"hash_4a5fd7d94cfc9dfd", 0) == 1)
		{
			if(isdefined(item.var_a6762160.unlockableitemref))
			{
				if(isdefined(item.var_a6762160.var_a51bc1f7))
				{
					description = (isdefined(item.var_a6762160.var_a51bc1f7) ? item.var_a6762160.var_a51bc1f7 : #"");
				}
			}
		}
		if(description == #"" && isdefined(item.var_a6762160.weapon))
		{
			itemindex = getitemindexfromref(item.var_a6762160.weapon.name);
			var_97dcd0a5 = getunlockableiteminfofromindex(itemindex);
			if(isdefined(var_97dcd0a5) && isdefined(var_97dcd0a5.description))
			{
				description = var_97dcd0a5.description;
			}
		}
		if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"resource")
		{
			if(function_88da0c8e(localclientnum))
			{
				setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "notAccessible"), 1);
				description = (isdefined(item.var_a6762160.var_3b8219fd) ? item.var_a6762160.var_3b8219fd : description);
			}
		}
		if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"weapon")
		{
			supportsattachments = namespace_a0d533d1::function_4bd83c04(item);
			setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "supportsAttachments"), supportsattachments);
			var_754fe8c5 = function_e36b5f2c(item.var_a6762160.weapon);
			if(isdefined(level.var_c53d118f) && isdefined(level.var_c53d118f[var_754fe8c5]))
			{
				setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "ammoType"), level.var_c53d118f[var_754fe8c5]);
			}
			else
			{
				setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "ammoType"), #"");
			}
		}
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "description"), description);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "castTime"), (isdefined(item.var_a6762160.casttime) ? item.var_a6762160.casttime : 0));
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "type"), item.var_a6762160.itemtype);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "equipped"), isdefined(var_b619c089.endtime));
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "availableAction"), availableaction);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "stowedAvailableAction"), 0);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "consumable"), 0);
		if(isdefined(item.var_a6762160.unlockableitemref))
		{
			function_39b663b7(localclientnum, var_b619c089, item);
		}
		else
		{
			setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "unlockableItemRef"), #"");
			setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "quote"), #"");
			setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "rewardName"), #"");
		}
		if(!var_189fcf49)
		{
			function_442857e2(localclientnum, (isdefined(var_b619c089.var_a6762160) ? var_b619c089.var_a6762160 : var_1c54cff7));
		}
		if(count != 0 && !var_dbce1e30)
		{
			function_8ffee46f(localclientnum, var_b619c089);
		}
	}
	if(isdefined(data))
	{
		canusequickinventory = 0;
		filledslots = 0;
		for(i = 0; i < data.inventory.var_c212de25; i++)
		{
			if(data.inventory.items[i].var_bd027dd9 != 32767)
			{
				if(data.inventory.items[i].availableaction == 1 || data.inventory.items[i].availableaction == 4 || data.inventory.items[i].availableaction == 2 || data.inventory.items[i].availableaction == 6)
				{
					if(is_true(data.inventory.items[i].quickequip))
					{
						canusequickinventory = canusequickinventory | 1;
					}
				}
				filledslots++;
			}
		}
		shardcount = 0;
		if(data.inventory.items[11].var_bd027dd9 != 32767 && data.inventory.items[11].count > 0)
		{
			filledslots++;
			canusequickinventory = canusequickinventory | 1;
		}
		if(isdefined(level.var_37076fe8))
		{
			var_22eb977c = [[level.var_37076fe8]](player);
			if(var_22eb977c)
			{
				canusequickinventory = 0;
			}
		}
		var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		setuimodelvalue(createuimodel(var_dcb56aa8, "filledSlots"), filledslots);
		setuimodelvalue(createuimodel(var_dcb56aa8, "canUseQuickInventory"), canusequickinventory);
		var_a966c73b = data.inventory.items[10];
		if(var_a966c73b.var_bd027dd9 != 32767)
		{
			setuimodelvalue(createuimodel(var_dcb56aa8, "resourceCount"), 2);
		}
		else
		{
			setuimodelvalue(createuimodel(var_dcb56aa8, "resourceCount"), 1);
		}
		if(var_e3f9d92b)
		{
			function_950ae846(localclientnum);
		}
		if(var_75b43169)
		{
			function_b5b6a9a4(localclientnum);
		}
		if(var_d8138db2 !== 32767 && isdefined(var_b619c089.var_a6762160) && var_b619c089.var_a6762160.itemtype === #"weapon")
		{
			foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1))
			{
				if(data.inventory.items[var_4838b749].var_bd027dd9 === var_bd027dd9)
				{
					var_2a311ae = array("attachSlotOptics", "attachSlotMuzzle", "attachSlotBarrel", "attachSlotUnderbarrel", "attachSlotBody", "attachSlotMagazine", "attachSlotHandle", "attachSlotStock");
					foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
					{
						slot = var_2a311ae[index];
						var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
						var_84704ed7 = data.inventory.items[var_f9f8c0b5];
						if(!isdefined(var_b619c089.var_a6762160.(slot)))
						{
							setuimodelvalue(createuimodel(var_84704ed7.var_e4130a92, "disabled"), 1);
							continue;
						}
						setuimodelvalue(createuimodel(var_84704ed7.var_e4130a92, "disabled"), 0);
					}
					break;
				}
			}
		}
		if(var_d8138db2 !== 32767 && isdefined(var_b619c089.var_a6762160) && var_b619c089.var_a6762160.itemtype === #"attachment")
		{
			var_f9f8c0b5 = namespace_ad5a0cd6::function_808be9a3(var_b619c089.var_bd027dd9);
			var_2cf6fb05 = undefined;
			foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1))
			{
				if(namespace_a0d533d1::function_398b9770(var_4838b749, var_f9f8c0b5))
				{
					var_2cf6fb05 = var_4838b749;
					break;
				}
			}
			if(isdefined(var_2cf6fb05))
			{
				function_cb7cfe5b(localclientnum, var_2cf6fb05, var_b619c089);
				hasattachments = function_850588f4(localclientnum, var_2cf6fb05);
				var_508262d4 = data.inventory.items[var_2cf6fb05];
				if(hasattachments)
				{
					setuimodelvalue(createuimodel(var_508262d4.var_e4130a92, "hasAttachments"), 1);
				}
				else
				{
					setuimodelvalue(createuimodel(var_508262d4.var_e4130a92, "hasAttachments"), 0);
				}
			}
			else
			{
				var_a4250c2b = player function_d768ea30(localclientnum);
				function_cb7cfe5b(localclientnum, var_a4250c2b, var_b619c089);
			}
			function_ce628f27(localclientnum);
		}
		else if(var_d5042302)
		{
			var_a4250c2b = player function_d768ea30(localclientnum);
			hasattachments = function_850588f4(localclientnum, var_a4250c2b);
			if(isdefined(var_a4250c2b))
			{
				var_508262d4 = data.inventory.items[var_a4250c2b];
				if(hasattachments)
				{
					setuimodelvalue(createuimodel(var_508262d4.var_e4130a92, "hasAttachments"), 1);
				}
				else
				{
					setuimodelvalue(createuimodel(var_508262d4.var_e4130a92, "hasAttachments"), 0);
				}
			}
			function_deddbdf0(localclientnum, var_a4250c2b);
			function_ce628f27(localclientnum);
		}
	}
}

/*
	Name: function_2ecc089c
	Namespace: namespace_b376ff3f
	Checksum: 0xB23A409A
	Offset: 0x69C8
	Size: 0x264
	Parameters: 6
	Flags: Linked, Private
*/
function private function_2ecc089c(localclientnum, var_67bed85d, type, var_bd4c63f1, var_9286261, var_a3a763a3)
{
	data = item_world::function_a7e98a1a(localclientnum);
	if(!isdefined(data))
	{
		return;
	}
	var_a638d314 = data.inventory.items[var_67bed85d];
	var_7007b688 = [];
	if(isdefined(var_a638d314.var_a6762160))
	{
		var_7007b688 = namespace_ad5a0cd6::function_4cbb6617(data.inventory, type, var_bd4c63f1, var_a638d314.var_a6762160);
	}
	for(index = 0; index < var_7007b688.size && index < var_9286261; index++)
	{
		item = var_a3a763a3[index];
		var_b619c089 = var_7007b688[index];
		function_1a99656a(localclientnum, item, var_b619c089.var_bd027dd9, var_b619c089.id, var_b619c089.count, function_bba770de(localclientnum, var_b619c089.var_a6762160), var_b619c089.availableaction, undefined, 1);
		setuimodelvalue(createuimodel(item.var_e4130a92, "cycle"), 1);
		function_9a227103(createuimodel(item.var_e4130a92, "totalCount"));
	}
	for(index = var_7007b688.size; index < var_9286261; index++)
	{
		item = var_a3a763a3[index];
		function_1a99656a(localclientnum, item, 32767, 32767, 0, 0, 0, undefined, 1);
		setuimodelvalue(createuimodel(item.var_e4130a92, "cycle"), 0);
	}
}

/*
	Name: function_442857e2
	Namespace: namespace_b376ff3f
	Checksum: 0x923D712A
	Offset: 0x6C38
	Size: 0xC5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_442857e2(localclientnum, var_a6762160)
{
	if(!isdefined(var_a6762160))
	{
		return;
	}
	if(var_a6762160.itemtype !== #"equipment" && var_a6762160.itemtype !== #"field_upgrade" && var_a6762160.itemtype !== #"tactical" && var_a6762160.itemtype !== #"generic" && var_a6762160.itemtype !== #"health" && var_a6762160.itemtype !== #"killstreak" && var_a6762160.itemtype !== #"scorestreak" && var_a6762160.itemtype !== #"attachment" && var_a6762160.itemtype !== #"hash_56d6621e6c4caf07")
	{
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	if(!isdefined(data))
	{
		return;
	}
	var_6962e967 = 0;
	if(var_a6762160.itemtype == #"attachment")
	{
		player = function_27673a7(localclientnum);
		var_a4250c2b = player function_d768ea30(localclientnum);
		if(isdefined(var_a4250c2b))
		{
			var_55022c4f = array(1, 2, 3, 4, 5, 6, 7, 8);
			for(attachmentindex = 0; attachmentindex < var_55022c4f.size; attachmentindex++)
			{
				var_259f58f3 = var_55022c4f[attachmentindex];
				var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_a4250c2b, var_259f58f3);
				var_b619c089 = data.inventory.items[var_f9f8c0b5];
				if(var_b619c089.var_bd027dd9 != 32767 && namespace_a0d533d1::function_73593286(var_a6762160, var_b619c089.var_a6762160))
				{
					var_6962e967 = 1;
					break;
				}
			}
		}
	}
	else
	{
		if(var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
		{
			var_b619c089 = data.inventory.items[11];
		}
		else
		{
			foreach(slot in array(5, 6, 12, 7, 13, 8, 17 + 1, ((17 + 1) + 8) + 1, 14, 15, 16, 17))
			{
				var_b619c089 = data.inventory.items[slot];
				if(var_b619c089.var_bd027dd9 != 32767 && namespace_a0d533d1::function_73593286(var_a6762160, var_b619c089.var_a6762160))
				{
					var_6962e967 = 1;
					break;
				}
			}
		}
	}
	totalcount = function_bba770de(localclientnum, var_a6762160);
	if(var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "quickEquip"), totalcount > 0);
	}
	else
	{
		var_6d4bb070 = 0;
		for(index = 0; index < 5; index++)
		{
			var_b619c089 = data.inventory.items[index];
			if(var_b619c089.var_bd027dd9 == 32767 || !namespace_a0d533d1::function_73593286(var_a6762160, var_b619c089.var_a6762160))
			{
				continue;
			}
			if(var_6962e967 || var_6d4bb070 || isdefined(var_b619c089.endtime))
			{
				setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "quickEquip"), 0);
				var_b619c089.quickequip = 0;
			}
			else if(!var_6d4bb070)
			{
				setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "quickEquip"), 1);
				var_b619c089.quickequip = 1;
				var_6d4bb070 = 1;
			}
			setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "totalCount"), totalcount);
		}
	}
	if(var_a6762160.itemtype === #"health")
	{
		function_2ecc089c(localclientnum, 5, #"health", array(#"hash_1abfcce0e9955057", #"hash_ff50c93155e445f", #"hash_80292d121740f6f", #"hash_45ced3880667df22", #"hash_20699a922abaf2e1"), 2, data.inventory.healthitems);
	}
	else
	{
		if(var_a6762160.itemtype === #"equipment")
		{
			function_2ecc089c(localclientnum, 7, #"equipment", array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de", #"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f"), 2, data.inventory.var_a101f33c);
		}
		else
		{
			if(var_a6762160.itemtype === #"field_upgrade")
			{
				function_2ecc089c(localclientnum, 12, #"field_upgrade", array(#"hash_3f154f45479130ed", #"hash_2c9b75b17410f2de", #"hash_7ea42360bdf2de16", #"hash_649e3a841620150f", #"hash_47954c9090e3f900", #"hash_12f4d7321d9c5005", #"hash_681471b56324b3e"), 2, data.inventory.var_d4de469a);
			}
			else
			{
				if(var_a6762160.itemtype === #"tactical")
				{
					function_2ecc089c(localclientnum, 13, #"tactical", array(), 2, data.inventory.var_d4de469a);
				}
				else if(var_a6762160.itemtype === #"scorestreak")
				{
					function_2ecc089c(localclientnum, 17, #"scorestreak", array(#"hash_6eb09ea5da35e18f", #"hash_654445f6cc7a7e1c", #"hash_5f6d7361258230a", #"hash_ba416827a85877c", #"hash_24a1df9928527c11", #"hash_2294e52d4ac78b9a", #"hash_cefb3af28fb800b", #"hash_18fa1f3e4e43437c"), 2, data.inventory.var_cb8b68cf);
				}
			}
		}
	}
}

/*
	Name: function_39b663b7
	Namespace: namespace_b376ff3f
	Checksum: 0x5D3FC484
	Offset: 0x78A0
	Size: 0x56C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_39b663b7(localclientnum, var_b619c089, item)
{
	var_409a5960 = function_1df4c3b0(localclientnum, #"hash_1bfcdf95a55f5ed6");
	itemindex = getitemindexfromref(item.var_a6762160.unlockableitemref);
	if(itemindex !== 0)
	{
		var_10d25c94 = createuimodel(var_409a5960, itemindex);
		if(!isdefined(getuimodel(var_10d25c94, "completed")))
		{
			setuimodelvalue(createuimodel(var_10d25c94, "completed"), 0);
		}
		for(i = 0; i < 5; i++)
		{
			description = undefined;
			var_1bd2adc2 = createuimodel(var_10d25c94, "objective" + (i + 1));
			if(!isdefined(var_1bd2adc2))
			{
				continue;
			}
			if(!isdefined(getuimodel(var_1bd2adc2, "state")))
			{
				setuimodelvalue(createuimodel(var_1bd2adc2, "state"), 0);
			}
			if(isdefined(item.var_a6762160.objectives[i]))
			{
				if(isdefined(item.var_a6762160.objectives[i].var_eea04f51) && item.var_a6762160.objectives[i].var_eea04f51.size > 0)
				{
					numplayers = getgametypesetting("maxTeamPlayers");
					foreach(objectivestruct in item.var_a6762160.objectives[i].var_eea04f51)
					{
						if(objectivestruct.teamsize == numplayers)
						{
							description = objectivestruct.description;
							break;
						}
					}
				}
				if(!isdefined(description))
				{
					description = item.var_a6762160.objectives[i].description;
				}
				var_2571317b = 0;
				if(isdefined(item.var_a6762160.objectives[i].var_7e835304))
				{
					var_2571317b = setuimodelvalue(createuimodel(var_1bd2adc2, "unlockProgress"), stats::function_441050ca(localclientnum, item.var_a6762160.objectives[i].var_7e835304));
				}
				else
				{
					setuimodelvalue(createuimodel(var_1bd2adc2, "unlockProgress"), -1);
				}
				if(!setuimodelvalue(createuimodel(var_1bd2adc2, "description"), description) && var_2571317b)
				{
					function_9a227103(createuimodel(var_1bd2adc2, "description"));
				}
				continue;
			}
			setuimodelvalue(createuimodel(var_1bd2adc2, "unlockProgress"), -1);
			setuimodelvalue(createuimodel(var_1bd2adc2, "description"), #"");
		}
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "unlockableItemRef"), item.var_a6762160.unlockableitemref);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "quote"), item.var_a6762160.var_e8b98a8a);
		setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "rewardName"), item.var_a6762160.rewardname);
	}
}

/*
	Name: function_cb7cfe5b
	Namespace: namespace_b376ff3f
	Checksum: 0x70622814
	Offset: 0x7E18
	Size: 0x634
	Parameters: 3
	Flags: Linked, Private
*/
function private function_cb7cfe5b(localclientnum, var_a4250c2b, var_ac517de7)
{
	if(var_ac517de7.var_bd027dd9 === 32767 || !isdefined(var_ac517de7.var_a6762160) || var_ac517de7.var_a6762160.itemtype !== #"attachment")
	{
		return;
	}
	if(!isdefined(var_a4250c2b))
	{
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "availableAction"), 0);
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "notAvailable"), 1);
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	var_ac044d12 = undefined;
	var_fdc9fcff = undefined;
	var_ffd2f6e4 = undefined;
	var_ac044d12 = data.inventory.items[var_a4250c2b];
	var_fdc9fcff = (var_a4250c2b == (17 + 1) ? ((17 + 1) + 8) + 1 : 17 + 1);
	var_ffd2f6e4 = data.inventory.items[var_fdc9fcff];
	noweapon = !isdefined(var_ac044d12) || var_ac044d12.var_bd027dd9 === 32767 || !isdefined(var_ac044d12.var_a6762160) || var_ac044d12.var_a6762160.itemtype !== #"weapon";
	var_cdef462d = !isdefined(var_ffd2f6e4) || var_ffd2f6e4.var_bd027dd9 === 32767 || !isdefined(var_ffd2f6e4.var_a6762160) || var_ffd2f6e4.var_a6762160.itemtype !== #"weapon";
	if(noweapon)
	{
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "availableAction"), 0);
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "notAvailable"), 1);
		if(var_cdef462d)
		{
			setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "stowedAvailableAction"), 0);
			return;
		}
	}
	var_ceefbd10 = namespace_a0d533d1::function_837f4a57(var_ac517de7.var_a6762160);
	if(isdefined(namespace_a0d533d1::function_2ced1d34(var_ac044d12, var_ac517de7.var_a6762160)))
	{
		var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_a4250c2b, var_ceefbd10);
		if(data.inventory.items[var_f9f8c0b5].var_bd027dd9 !== 32767)
		{
			setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "availableAction"), 3);
		}
		else
		{
			setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "availableAction"), 2);
		}
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "notAvailable"), 0);
		function_442857e2(localclientnum, var_ac517de7.var_a6762160);
	}
	else
	{
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "availableAction"), 0);
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "notAvailable"), 1);
	}
	if(var_cdef462d)
	{
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "stowedAvailableAction"), 0);
		return;
	}
	if(isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160)))
	{
		var_50f8a92d = namespace_a0d533d1::function_dfaca25e(var_fdc9fcff, var_ceefbd10);
		if(data.inventory.items[var_50f8a92d].var_bd027dd9 !== 32767)
		{
			setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "stowedAvailableAction"), 3);
		}
		else
		{
			setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "stowedAvailableAction"), 2);
		}
	}
	else
	{
		setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "stowedAvailableAction"), 0);
	}
}

/*
	Name: function_deddbdf0
	Namespace: namespace_b376ff3f
	Checksum: 0x7F416693
	Offset: 0x8458
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_deddbdf0(localclientnum, var_f7956021)
{
	data = item_world::function_a7e98a1a(localclientnum);
	for(itemindex = 0; itemindex < data.inventory.var_c212de25; itemindex++)
	{
		var_b619c089 = data.inventory.items[itemindex];
		function_cb7cfe5b(localclientnum, var_f7956021, var_b619c089);
	}
}

/*
	Name: function_950ae846
	Namespace: namespace_b376ff3f
	Checksum: 0x552058AB
	Offset: 0x8500
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_950ae846(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	for(itemindex = 0; itemindex < data.inventory.var_c212de25; itemindex++)
	{
		var_b619c089 = data.inventory.items[itemindex];
		if(!isdefined(var_b619c089.var_a6762160) || !namespace_ad5a0cd6::function_a57773a4(var_b619c089.var_a6762160))
		{
			continue;
		}
		availableaction = function_30697356(localclientnum, var_b619c089.var_a6762160);
		if(var_b619c089.availableaction != availableaction)
		{
			totalcount = function_bba770de(localclientnum, var_b619c089.var_a6762160);
			function_1a99656a(localclientnum, var_b619c089, var_b619c089.var_bd027dd9, var_b619c089.id, var_b619c089.count, totalcount, availableaction);
		}
	}
}

/*
	Name: function_b5b6a9a4
	Namespace: namespace_b376ff3f
	Checksum: 0x89D0518C
	Offset: 0x8658
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b5b6a9a4(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	for(itemindex = 0; itemindex < data.inventory.var_c212de25; itemindex++)
	{
		var_b619c089 = data.inventory.items[itemindex];
		if(!isdefined(var_b619c089.var_a6762160) || var_b619c089.var_a6762160.itemtype != #"scorestreak")
		{
			continue;
		}
		availableaction = function_30697356(localclientnum, var_b619c089.var_a6762160);
		if(var_b619c089.availableaction != availableaction)
		{
			totalcount = function_bba770de(localclientnum, var_b619c089.var_a6762160);
			function_1a99656a(localclientnum, var_b619c089, var_b619c089.var_bd027dd9, var_b619c089.id, var_b619c089.count, totalcount, availableaction);
		}
	}
}

/*
	Name: function_ce628f27
	Namespace: namespace_b376ff3f
	Checksum: 0xF90E4037
	Offset: 0x87B0
	Size: 0x40C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ce628f27(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	foreach(var_a4250c2b in array(17 + 1, ((17 + 1) + 8) + 1))
	{
		var_ac044d12 = data.inventory.items[var_a4250c2b];
		var_fdc9fcff = (var_a4250c2b == (17 + 1) ? ((17 + 1) + 8) + 1 : 17 + 1);
		var_ffd2f6e4 = data.inventory.items[var_fdc9fcff];
		foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
		{
			var_f9f8c0b5 = var_a4250c2b + var_259f58f3;
			var_50f8a92d = var_fdc9fcff + var_259f58f3;
			var_ac517de7 = data.inventory.items[var_f9f8c0b5];
			var_3c2da577 = data.inventory.items[var_50f8a92d];
			if(var_ac517de7.var_bd027dd9 === 32767 || !isdefined(var_ac517de7.var_a6762160))
			{
				continue;
			}
			if(var_3c2da577.var_bd027dd9 === 32767 || !isdefined(var_3c2da577.var_a6762160))
			{
				if(isdefined(var_ffd2f6e4) && isdefined(var_ffd2f6e4.var_a6762160) && isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160)))
				{
					setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "canTransferAttachment"), 2);
					continue;
				}
				setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "canTransferAttachment"), 0);
				continue;
			}
			if(isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160)) && isdefined(namespace_a0d533d1::function_2ced1d34(var_ac044d12, var_3c2da577.var_a6762160)))
			{
				setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "canTransferAttachment"), 3);
				continue;
			}
			setuimodelvalue(createuimodel(var_ac517de7.var_e4130a92, "canTransferAttachment"), 0);
		}
	}
}

/*
	Name: function_7146ceb2
	Namespace: namespace_b376ff3f
	Checksum: 0x586E6CF3
	Offset: 0x8BC8
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function function_7146ceb2(localclientnum, var_a6762160)
{
	data = item_world::function_a7e98a1a(localclientnum);
	if(var_a6762160.itemtype == #"ammo")
	{
		return false;
	}
	return true;
}

/*
	Name: function_a303c8ef
	Namespace: namespace_b376ff3f
	Checksum: 0xE41AD47A
	Offset: 0x8C28
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_a303c8ef(localclientnum, var_a6762160)
{
	return isdefined(function_daf3ebda(localclientnum, var_a6762160));
}

/*
	Name: function_daf3ebda
	Namespace: namespace_b376ff3f
	Checksum: 0x2BA78D00
	Offset: 0x8C60
	Size: 0x336
	Parameters: 2
	Flags: Linked
*/
function function_daf3ebda(localclientnum, var_a6762160)
{
	if(function_7d5553ac())
	{
		return undefined;
	}
	if(!is_true(var_a6762160.stackable))
	{
		return undefined;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	var_590b4c51 = namespace_a0d533d1::function_cfa794ca(data.inventory.var_7658cbec, var_a6762160);
	if(var_590b4c51 <= 1)
	{
		return undefined;
	}
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	if(var_a6762160.itemtype == #"resource")
	{
		if(namespace_ad5a0cd6::function_41f06d9d(var_a6762160) && isdefined(var_8040e225.inventory) && var_8040e225.inventory.items[9].count < var_590b4c51)
		{
			return 9;
		}
		var_ee79c3a4 = var_8040e225.inventory.items[10];
		if(!isdefined(var_ee79c3a4.id) || var_ee79c3a4.id == 32767)
		{
			return 10;
		}
		if(var_ee79c3a4.var_a6762160.name !== var_a6762160.name)
		{
			return undefined;
		}
		if(var_ee79c3a4.count < var_590b4c51)
		{
			return 10;
		}
		return undefined;
	}
	if(var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		if(var_8040e225.inventory.items[11].count < var_590b4c51)
		{
			return 11;
		}
		return undefined;
	}
	for(i = 0; i < var_8040e225.inventory.items.size; i++)
	{
		if(!isdefined(var_8040e225.inventory.items[i].id) || var_8040e225.inventory.items[i].id == 32767)
		{
			continue;
		}
		var_b619c089 = function_b1702735(var_8040e225.inventory.items[i].id);
		if(!isdefined(var_b619c089) || !isdefined(var_b619c089.var_a6762160))
		{
			continue;
		}
		if(var_b619c089.var_a6762160.name !== var_a6762160.name)
		{
			continue;
		}
		if(var_8040e225.inventory.items[i].count < var_590b4c51)
		{
			return i;
		}
	}
	return undefined;
}

/*
	Name: function_3e624606
	Namespace: namespace_b376ff3f
	Checksum: 0xA178BC68
	Offset: 0x8FA0
	Size: 0x236
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3e624606(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("12517205b89d9752");
	self endon("12517205b89d9752");
	var_8040e225 = item_world::function_a7e98a1a(localclientnum);
	var_99fe8c78 = "multi_item_pickup" + localclientnum;
	var_dab12fb1 = "multi_item_pickup_stowed_weapon" + localclientnum;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_99fe8c78, var_dab12fb1);
		if(self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2)
		{
			var_bd027dd9 = waitresult.id;
			index = item_world::function_73436347(var_8040e225.var_f0f7e918, var_bd027dd9);
			var_d8138db2 = item_world::function_28b42f1c(localclientnum, var_bd027dd9);
			if(var_d8138db2 == 32767)
			{
				continue;
			}
			if(isdefined(index))
			{
				item = function_b1702735(var_d8138db2);
				if(!function_ad4c6116(localclientnum, item.var_a6762160))
				{
					continue;
				}
				if(waitresult._notify === var_dab12fb1)
				{
					function_97fedb0d(localclientnum, 12, var_bd027dd9);
				}
				else
				{
					function_97fedb0d(localclientnum, 3, var_bd027dd9);
				}
				function_7f056944(localclientnum, index);
				if(!function_7146ceb2(localclientnum, item.var_a6762160))
				{
					continue;
				}
			}
		}
	}
}

/*
	Name: function_30697356
	Namespace: namespace_b376ff3f
	Checksum: 0x463DE000
	Offset: 0x91E0
	Size: 0x172
	Parameters: 2
	Flags: Linked, Private
*/
function private function_30697356(localclientnum, var_a6762160)
{
	if(!isdefined(var_a6762160))
	{
		return 0;
	}
	if(var_a6762160.itemtype === #"hash_56d6621e6c4caf07")
	{
		return 6;
	}
	if(is_true(var_a6762160.consumable))
	{
		return 4;
	}
	if(var_a6762160.itemtype === #"generic")
	{
		return 0;
	}
	if(var_a6762160.itemtype === #"cash")
	{
		return 0;
	}
	if(var_a6762160.itemtype === #"killstreak")
	{
		return 4;
	}
	if(var_a6762160.itemtype === #"armor")
	{
		return 0;
	}
	if(var_a6762160.itemtype === #"ammo")
	{
		return 0;
	}
	if(var_a6762160.itemtype == #"weapon")
	{
		return 0;
	}
	if(var_a6762160.itemtype == #"quest")
	{
		return 0;
	}
	if(var_a6762160.itemtype === #"attachment")
	{
		return 2;
	}
	return 1;
}

/*
	Name: function_ad4c6116
	Namespace: namespace_b376ff3f
	Checksum: 0x166804BF
	Offset: 0x9360
	Size: 0x6D8
	Parameters: 2
	Flags: Linked
*/
function function_ad4c6116(localclientnum, var_a6762160)
{
	if(var_a6762160.itemtype == #"weapon")
	{
		return 1;
	}
	if(!function_7146ceb2(localclientnum, var_a6762160))
	{
		return 1;
	}
	if(var_a6762160.itemtype == #"resource")
	{
		if(namespace_ad5a0cd6::function_41f06d9d(var_a6762160))
		{
			return !function_88da0c8e(localclientnum);
		}
	}
	if(var_a6762160.itemtype == #"armor")
	{
		if(var_a6762160.var_4a1a4613 === #"hash_3d98ea1d4a033e97")
		{
			data = item_world::function_a7e98a1a(localclientnum);
			var_8b8faf32 = self function_e8ef30cc();
			maxarmor = self function_a07288ec();
			armortier = 0;
			var_fda5463f = data.inventory.items[6];
			if(isdefined(var_fda5463f) && var_fda5463f.var_bd027dd9 != 32767)
			{
				armortier = var_fda5463f.var_a6762160.armortier;
			}
			armortier = (isdefined(armortier) ? armortier : 0);
			if((isdefined(var_a6762160.armortier) ? var_a6762160.armortier : 0) > armortier)
			{
				return 1;
			}
			if((isdefined(maxarmor) ? maxarmor : 0) != 0 && var_8b8faf32 == maxarmor)
			{
				return 0;
			}
		}
		return 1;
	}
	if(var_a6762160.itemtype == #"attachment")
	{
		slotid = function_1415f8f1(localclientnum, var_a6762160);
		if(isdefined(slotid))
		{
			return 1;
		}
	}
	if(function_a243ddd6(localclientnum, var_a6762160))
	{
		return 1;
	}
	if(function_a303c8ef(localclientnum, var_a6762160))
	{
		return 1;
	}
	if(var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		return 0;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	if(var_a6762160.itemtype == #"resource")
	{
		if(data.inventory.items[10].var_bd027dd9 === 32767)
		{
			return 1;
		}
		return 0;
	}
	if(var_a6762160.name === #"hash_2cdb76a587cf7a3b")
	{
		if(self clientfield::get_player_uimodel("ZMInventoryPersonal.self_revive_count") > 0)
		{
			return 0;
		}
		return 1;
	}
	if(var_a6762160.itemtype === #"hash_7064fc95aa1c1bbe")
	{
		var_50f64cdb = self function_6b087eb4(localclientnum);
		return !var_50f64cdb;
	}
	if(var_a6762160.itemtype === #"hash_70823406977e7c34")
	{
		var_6c32d092 = 0;
		if(isdefined(var_a6762160.talents))
		{
			foreach(talent in var_a6762160.talents)
			{
				if(self function_6c32d092(localclientnum, talent.talent))
				{
					var_6c32d092 = 1;
					break;
				}
			}
		}
		return !var_6c32d092;
	}
	if(var_a6762160.itemtype === #"hash_576593319dc02d70")
	{
		var_8b8faf32 = self function_e8ef30cc();
		maxarmor = self function_a07288ec();
		if(maxarmor <= 0)
		{
			return 0;
		}
		if(var_8b8faf32 == maxarmor)
		{
			return 0;
		}
		return 1;
	}
	if(var_a6762160.itemtype == #"hash_3a094c949a87214d")
	{
		return 1;
	}
	if(var_a6762160.itemtype == #"hash_910bf9605abbcea")
	{
		return 1;
	}
	if(var_a6762160.itemtype == #"hash_fc797c2a8f4d208")
	{
		data = item_world::function_a7e98a1a(localclientnum);
		var_95162a97 = var_a6762160.weapon;
		var_1326fcc7 = (isdefined(var_1326fcc7) ? var_1326fcc7 : (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1));
		var_2f399b51 = namespace_a0d533d1::function_2879cbe0(data.inventory.var_7658cbec, var_95162a97);
		currentammostock = self getweaponammostock(localclientnum, var_95162a97);
		var_9b9ba643 = var_2f399b51 - currentammostock;
		addammo = int(min(var_1326fcc7, var_9b9ba643));
		return addammo > 0;
	}
	if(!namespace_a0d533d1::function_819781bf())
	{
		for(i = 0; i < data.inventory.var_c212de25; i++)
		{
			if(data.inventory.items[i].var_bd027dd9 === 32767)
			{
				return 1;
			}
		}
	}
	return 0;
}

/*
	Name: function_a243ddd6
	Namespace: namespace_b376ff3f
	Checksum: 0x1E9440A1
	Offset: 0x9A40
	Size: 0x4BC
	Parameters: 2
	Flags: Linked
*/
function function_a243ddd6(localclientnum, var_a6762160)
{
	data = item_world::function_a7e98a1a(localclientnum);
	if(namespace_a0d533d1::function_819781bf())
	{
		var_662e1704 = 1;
	}
	else
	{
		var_662e1704 = 0;
	}
	switch(var_a6762160.itemtype)
	{
		case "attachment":
		{
			slotid = function_1415f8f1(localclientnum, var_a6762160);
			if(!isdefined(slotid))
			{
				return 0;
			}
			return data.inventory.items[slotid].var_bd027dd9 == 32767;
		}
		case "armor":
		{
			return data.inventory.items[6].var_bd027dd9 == 32767;
		}
		case "backpack":
		{
			return data.inventory.items[8].var_bd027dd9 == 32767;
		}
		case "equipment":
		{
			return var_662e1704 || data.inventory.items[7].var_bd027dd9 == 32767;
		}
		case "field_upgrade":
		{
			return var_662e1704 || data.inventory.items[12].var_bd027dd9 == 32767;
		}
		case "tactical":
		{
			return var_662e1704 || data.inventory.items[13].var_bd027dd9 == 32767;
		}
		case "health":
		{
			return var_662e1704 || data.inventory.items[5].var_bd027dd9 == 32767;
		}
		case "weapon":
		{
			return (data.inventory.items[17 + 1].var_bd027dd9) == 32767 || (data.inventory.items[((17 + 1) + 8) + 1].var_bd027dd9) == 32767;
		}
		case "hash_63c2e59c903465e6":
		{
			point = function_4ba8fde(#"hash_383a1390efa15e8a");
			return var_662e1704 || data.inventory.items[14].var_bd027dd9 == point.id;
		}
		case "hash_63c2e49c90346433":
		{
			point = function_4ba8fde(#"hash_383a1390efa15e8a");
			return var_662e1704 || data.inventory.items[15].var_bd027dd9 == point.id;
		}
		case "hash_63c2e39c90346280":
		{
			point = function_4ba8fde(#"hash_383a1390efa15e8a");
			return var_662e1704 || data.inventory.items[16].var_bd027dd9 == point.id;
		}
		case "scorestreak":
		{
			point = function_4ba8fde(#"hash_668192b8df645b73");
			return var_662e1704 || data.inventory.items[17].var_bd027dd9 == point.id;
		}
		case "ammo":
		case "generic":
		case "killstreak":
		case "cash":
		default:
		{
			return 0;
		}
	}
	return 0;
}

/*
	Name: function_d768ea30
	Namespace: namespace_b376ff3f
	Checksum: 0x12A13816
	Offset: 0x9F08
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_d768ea30(localclientnum)
{
	/#
		assert(isdefined(self));
	#/
	currentweapon = (isdefined(self.currentweapon) ? weapons::function_251ec78c(self.currentweapon) : self.weapon);
	if(currentweapon == level.weaponbasemeleeheld)
	{
		data = item_world::function_a7e98a1a(localclientnum);
		return;
	}
	if(function_9f1cc9a9(currentweapon) > 0)
	{
		return ((17 + 1) + 8) + 1;
	}
	return 17 + 1;
}

/*
	Name: function_78ed4455
	Namespace: namespace_b376ff3f
	Checksum: 0x4DDCB02C
	Offset: 0x9FE8
	Size: 0x384
	Parameters: 2
	Flags: Linked
*/
function function_78ed4455(localclientnum, var_a6762160)
{
	/#
		assert(isplayer(self));
	#/
	data = item_world::function_a7e98a1a(localclientnum);
	switch(var_a6762160.itemtype)
	{
		case "armor":
		{
			return 6;
		}
		case "backpack":
		{
			return 8;
		}
		case "equipment":
		{
			if(data.inventory.items[7].var_bd027dd9 == 32767)
			{
				return 7;
			}
			break;
		}
		case "field_upgrade":
		{
			if(data.inventory.items[12].var_bd027dd9 == 32767)
			{
				return 12;
			}
			break;
		}
		case "tactical":
		{
			if(data.inventory.items[13].var_bd027dd9 == 32767)
			{
				return 13;
			}
			break;
		}
		case "health":
		{
			if(data.inventory.items[5].var_bd027dd9 == 32767)
			{
				return 5;
			}
			break;
		}
		case "weapon":
		{
			if((data.inventory.items[17 + 1].var_bd027dd9) == 32767)
			{
				return 17 + 1;
			}
			else if((data.inventory.items[((17 + 1) + 8) + 1].var_bd027dd9) == 32767)
			{
				return ((17 + 1) + 8) + 1;
			}
			break;
		}
		case "scorestreak":
		{
			if(data.inventory.items[17].var_bd027dd9 == 32767)
			{
				return 17;
			}
			break;
		}
		case "hash_63c2e59c903465e6":
		{
			if(data.inventory.items[14].var_bd027dd9 == 32767)
			{
				return 14;
			}
			break;
		}
		case "hash_63c2e49c90346433":
		{
			if(data.inventory.items[15].var_bd027dd9 == 32767)
			{
				return 15;
			}
			break;
		}
		case "hash_63c2e39c90346280":
		{
			if(data.inventory.items[16].var_bd027dd9 == 32767)
			{
				return 16;
			}
			break;
		}
	}
	if(var_a6762160.itemtype == #"attachment")
	{
		return function_1415f8f1(localclientnum, var_a6762160);
	}
}

/*
	Name: function_9c4460e0
	Namespace: namespace_b376ff3f
	Checksum: 0x9E071D78
	Offset: 0xA378
	Size: 0x27C
	Parameters: 4
	Flags: Linked
*/
function function_9c4460e0(localclientnum, var_d8138db2, count, slotid)
{
	if(!isdefined(count))
	{
		count = 1;
	}
	if(!isdefined(slotid))
	{
		slotid = undefined;
	}
	/#
		assert(isint(var_d8138db2));
	#/
	if(!isdefined(var_d8138db2))
	{
		return;
	}
	point = function_b1702735(var_d8138db2);
	if(!isdefined(point))
	{
		return;
	}
	var_a6762160 = point.var_a6762160;
	availableaction = function_30697356(localclientnum, var_a6762160);
	data = item_world::function_a7e98a1a(localclientnum);
	selectedindex = undefined;
	if(count == 0)
	{
		return;
	}
	if(!isdefined(selectedindex) && isdefined(slotid))
	{
		selectedindex = slotid;
	}
	if(!isdefined(selectedindex))
	{
		selectedindex = item_world::function_73436347(data.inventory.items, 32767);
		if(!isdefined(selectedindex))
		{
			/#
				println(("" + var_d8138db2) + "");
			#/
			return;
		}
	}
	player = function_27673a7(localclientnum);
	var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(selectedindex);
	var_b619c089 = undefined;
	if(selectedindex < data.inventory.items.size)
	{
		var_b619c089 = data.inventory.items[selectedindex];
	}
	/#
		assert(isdefined(var_b619c089));
	#/
	totalcount = function_bba770de(localclientnum, var_a6762160);
	totalcount = totalcount + count;
	player function_1a99656a(localclientnum, var_b619c089, var_bd027dd9, var_d8138db2, count, totalcount, availableaction);
}

/*
	Name: function_1415f8f1
	Namespace: namespace_b376ff3f
	Checksum: 0x8E28FAF9
	Offset: 0xA600
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function function_1415f8f1(localclientnum, var_a6762160)
{
	/#
		assert(isplayer(self));
	#/
	data = item_world::function_a7e98a1a(localclientnum);
	if(var_a6762160.itemtype == #"attachment")
	{
		var_4838b749 = function_d768ea30(localclientnum);
		if(!isdefined(var_4838b749))
		{
			return;
		}
		var_f0dc4e93 = namespace_ad5a0cd6::function_970b8d86(var_4838b749);
		if(data.inventory.items[var_4838b749].var_bd027dd9 == 32767)
		{
			return;
		}
		var_ceefbd10 = namespace_a0d533d1::function_837f4a57(var_a6762160);
		var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_ceefbd10);
		var_64d58696 = self function_15d578f4(localclientnum, var_f0dc4e93);
		attachmentname = namespace_a0d533d1::function_2ced1d34(var_64d58696, var_a6762160);
		if(isdefined(attachmentname))
		{
			return var_f9f8c0b5;
		}
	}
}

/*
	Name: function_bba770de
	Namespace: namespace_b376ff3f
	Checksum: 0x6CAC7F7
	Offset: 0xA788
	Size: 0x168
	Parameters: 2
	Flags: Linked
*/
function function_bba770de(localclientnum, var_a6762160)
{
	data = item_world::function_a7e98a1a(localclientnum);
	count = 0;
	if(!isdefined(var_a6762160))
	{
		return count;
	}
	name = (isdefined(var_a6762160.parentname) ? var_a6762160.parentname : var_a6762160.name);
	for(index = 0; index < data.inventory.items.size && index < (17 + 1); index++)
	{
		var_b619c089 = data.inventory.items[index];
		if(!isdefined(var_b619c089.var_a6762160) || isdefined(var_b619c089.endtime))
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
	Name: function_6b087eb4
	Namespace: namespace_b376ff3f
	Checksum: 0x8C6A0DEA
	Offset: 0xA8F8
	Size: 0x1C0
	Parameters: 1
	Flags: Linked
*/
function function_6b087eb4(localclientnum)
{
	var_e20637be = 1;
	data = item_world::function_a7e98a1a(localclientnum);
	weapon1 = data.inventory.items[17 + 1];
	weapon2 = data.inventory.items[((17 + 1) + 8) + 1];
	if(isdefined(weapon1))
	{
		weapon1 = namespace_ad5a0cd6::function_35e06774(weapon1.var_a6762160);
		if(isdefined(weapon1))
		{
			if(weapon1 != level.weaponnone && weapon1 != level.weaponbasemeleeheld)
			{
				maxammo = weapon1.maxammo;
				currentammostock = self getweaponammostock(localclientnum, weapon1);
				if(currentammostock < maxammo)
				{
					var_e20637be = 0;
				}
			}
		}
	}
	if(isdefined(weapon2))
	{
		weapon2 = namespace_ad5a0cd6::function_35e06774(weapon2.var_a6762160);
		if(isdefined(weapon2))
		{
			if(weapon2 != level.weaponnone && weapon2 != level.weaponbasemeleeheld)
			{
				maxammo = weapon2.maxammo;
				currentammostock = self getweaponammostock(localclientnum, weapon2);
				if(currentammostock < maxammo)
				{
					var_e20637be = 0;
				}
			}
		}
	}
	return var_e20637be;
}

/*
	Name: function_e106cbe9
	Namespace: namespace_b376ff3f
	Checksum: 0xEF5D2766
	Offset: 0xAAC0
	Size: 0x176
	Parameters: 3
	Flags: Linked
*/
function function_e106cbe9(localclientnum, item, var_1326fcc7)
{
	if(!isdefined(var_1326fcc7))
	{
		var_1326fcc7 = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	data = item_world::function_a7e98a1a(localclientnum);
	var_a6762160 = item.var_a6762160;
	var_95162a97 = var_a6762160.weapon;
	var_1326fcc7 = (isdefined(var_1326fcc7) ? var_1326fcc7 : (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1));
	var_2f399b51 = namespace_a0d533d1::function_2879cbe0(data.inventory.var_7658cbec, var_95162a97);
	currentammostock = self getweaponammostock(localclientnum, var_95162a97);
	var_9b9ba643 = var_2f399b51 - currentammostock;
	addammo = int(min(var_1326fcc7, var_9b9ba643));
	return addammo > 0;
}

/*
	Name: function_85645978
	Namespace: namespace_b376ff3f
	Checksum: 0x4B6A9733
	Offset: 0xAC40
	Size: 0xE2
	Parameters: 2
	Flags: Linked, Private
*/
function private function_85645978(data, item)
{
	currtime = gettime();
	foreach(consumeditem in data.inventory.consumed.items)
	{
		if(item.var_a6762160.name == consumeditem.var_a6762160.name && currtime < consumeditem.endtime)
		{
			return consumeditem;
		}
	}
	return undefined;
}

/*
	Name: function_52e537be
	Namespace: namespace_b376ff3f
	Checksum: 0xF974D865
	Offset: 0xAD30
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function function_52e537be(localclientnum, var_bd027dd9)
{
	item = function_15d578f4(localclientnum, var_bd027dd9);
	if(isdefined(item))
	{
		setuimodelvalue(createuimodel(item.var_e4130a92, "castTimeFraction"), 0, 0);
	}
	data = item_world::function_a7e98a1a(localclientnum);
	if(isdefined(data) && isdefined(data.inventory) && var_bd027dd9 === data.inventory.var_4d4ec560)
	{
		setuimodelvalue(data.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
		data.inventory.var_4d4ec560 = undefined;
	}
}

/*
	Name: function_7730442c
	Namespace: namespace_b376ff3f
	Checksum: 0x8384D439
	Offset: 0xAE60
	Size: 0x4FC
	Parameters: 2
	Flags: Linked
*/
function function_7730442c(localclientnum, var_bd027dd9)
{
	/#
		assert(var_bd027dd9 != 32767);
	#/
	if(var_bd027dd9 == 32767)
	{
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	item = function_15d578f4(localclientnum, var_bd027dd9);
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return;
	}
	duration = int((isdefined(item.var_a6762160.duration) ? item.var_a6762160.duration : 0) * 1000);
	starttime = gettime();
	endtime = starttime + duration;
	item.starttime = starttime;
	item.endtime = endtime;
	totalcount = function_bba770de(localclientnum, item.var_a6762160);
	function_1a99656a(localclientnum, item, var_bd027dd9, item.id, 1, totalcount, 5, 0);
	var_3285d88f = data.inventory.consumed.items.size;
	var_cfa0e915 = [];
	foreach(consumeditem in data.inventory.consumed.items)
	{
		if(isdefined(var_cfa0e915[consumeditem.var_a6762160.name]))
		{
			continue;
		}
		var_cfa0e915[consumeditem.var_a6762160.name] = 1;
	}
	consumeditem = function_85645978(data, item);
	if(isdefined(consumeditem))
	{
		consumeditem.endtime = consumeditem.endtime + duration;
		for(index = 0; index < 5; index++)
		{
			var_b619c089 = data.inventory.items[index];
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
		consumeditem.var_e4130a92 = createuimodel(data.inventory.consumed.uimodel, "item" + var_cfa0e915.size);
		consumeditem.starttime = gettime();
		consumeditem.endtime = consumeditem.starttime + duration;
		var_cfa0e915[consumeditem.var_a6762160.name] = 1;
	}
	data.inventory.consumed.items[var_3285d88f] = consumeditem;
	var_31c78e6f = consumeditem.var_a6762160;
	function_1a99656a(localclientnum, consumeditem, 32767, 32767, 0, 0, 0, 0);
	function_1a99656a(localclientnum, consumeditem, var_bd027dd9, item.id, 0, 0, 0, 0);
	setuimodelvalue(data.inventory.consumed.var_a25538fb, var_cfa0e915.size);
	function_442857e2(localclientnum, var_31c78e6f);
	level thread function_451ebd83(localclientnum, consumeditem.var_a6762160, var_bd027dd9);
}

/*
	Name: function_de74158f
	Namespace: namespace_b376ff3f
	Checksum: 0x72925483
	Offset: 0xB368
	Size: 0x28C
	Parameters: 2
	Flags: Linked
*/
function function_de74158f(localclientnum, var_bd027dd9)
{
	/#
		assert(var_bd027dd9 != 32767);
	#/
	if(var_bd027dd9 == 32767)
	{
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	item = function_15d578f4(localclientnum, var_bd027dd9);
	if(!isdefined(item))
	{
		return;
	}
	var_cfa0e915 = [];
	foreach(consumeditem in data.inventory.consumed.items)
	{
		if(isdefined(var_cfa0e915[consumeditem.var_a6762160.name]))
		{
			continue;
		}
		var_cfa0e915[consumeditem.var_a6762160.name] = 1;
	}
	consumeditem = spawnstruct();
	consumeditem.id = item.id;
	consumeditem.var_a6762160 = item.var_a6762160;
	consumeditem.var_e4130a92 = createuimodel(data.inventory.consumed.uimodel, "item" + var_cfa0e915.size);
	var_cfa0e915[consumeditem.var_a6762160.name] = 1;
	function_1a99656a(localclientnum, consumeditem, 32767, 32767, 0, 0, 0, 0);
	function_1a99656a(localclientnum, consumeditem, var_bd027dd9, item.id, 0, 0, 0, 0);
	setuimodelvalue(data.inventory.consumed.var_a25538fb, var_cfa0e915.size);
	level thread function_451ebd83(localclientnum, item.var_a6762160, undefined);
}

/*
	Name: function_7f056944
	Namespace: namespace_b376ff3f
	Checksum: 0x3B79D494
	Offset: 0xB600
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_7f056944(localclientnum, index)
{
	var_6e2c91d0 = function_1df4c3b0(localclientnum, #"hash_23febb0b8f867ca1");
	setuimodelvalue(createuimodel(var_6e2c91d0, ("item" + index) + ".disabled"), 1);
}

/*
	Name: function_3bd1836f
	Namespace: namespace_b376ff3f
	Checksum: 0x2B55488F
	Offset: 0xB690
	Size: 0x132
	Parameters: 2
	Flags: Linked
*/
function function_3bd1836f(localclientnum, var_bd027dd9)
{
	if(var_bd027dd9 == namespace_ad5a0cd6::function_970b8d86(8))
	{
		function_5f44b06(localclientnum, var_bd027dd9);
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	foreach(var_b619c089 in data.inventory.items)
	{
		if(var_b619c089.var_bd027dd9 === var_bd027dd9)
		{
			function_8063170(var_b619c089, 1);
			playsound(localclientnum, #"hash_4d31bd9927d823c3");
			return;
		}
	}
}

/*
	Name: function_5f44b06
	Namespace: namespace_b376ff3f
	Checksum: 0x244D4537
	Offset: 0xB7D0
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function function_5f44b06(localclientnum, var_bd027dd9)
{
	data = item_world::function_a7e98a1a(localclientnum);
	if(!isdefined(data))
	{
		return;
	}
	item = function_15d578f4(localclientnum, var_bd027dd9);
	if(!isdefined(item))
	{
		waittillframeend();
		item = function_15d578f4(localclientnum, var_bd027dd9);
		if(!isdefined(item))
		{
			return;
		}
	}
	data.inventory.var_7658cbec = namespace_a0d533d1::function_d8cebda3(item.var_a6762160);
	if(data.inventory.var_7658cbec & 1 && data.inventory.var_c212de25 != 5)
	{
		for(index = data.inventory.var_c212de25; index < 5; index++)
		{
			var_b619c089 = data.inventory.items[index];
			setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "disabled"), 0);
		}
		data.inventory.var_c212de25 = 5;
		var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		setuimodelvalue(createuimodel(var_dcb56aa8, "count"), data.inventory.var_c212de25);
	}
}

/*
	Name: function_15d578f4
	Namespace: namespace_b376ff3f
	Checksum: 0x3CA5C868
	Offset: 0xB9E0
	Size: 0xFE
	Parameters: 2
	Flags: Linked
*/
function function_15d578f4(localclientnum, var_bd027dd9)
{
	/#
		assert(isdefined(localclientnum));
	#/
	/#
		assert(namespace_ad5a0cd6::function_d9648161(var_bd027dd9));
	#/
	data = item_world::function_a7e98a1a(localclientnum);
	/#
		assert(isdefined(data));
	#/
	for(index = 0; index < data.inventory.items.size; index++)
	{
		var_b619c089 = data.inventory.items[index];
		if(var_b619c089.var_bd027dd9 === var_bd027dd9)
		{
			return var_b619c089;
		}
	}
}

/*
	Name: function_c48cd17f
	Namespace: namespace_b376ff3f
	Checksum: 0xD2A9146D
	Offset: 0xBAE8
	Size: 0x4C
	Parameters: 2
	Flags: Linked
*/
function function_c48cd17f(localclientnum, var_bd027dd9)
{
	item = function_15d578f4(localclientnum, var_bd027dd9);
	if(isdefined(item))
	{
		return item.id;
	}
	return 32767;
}

/*
	Name: function_850588f4
	Namespace: namespace_b376ff3f
	Checksum: 0x55DAC764
	Offset: 0xBB40
	Size: 0x140
	Parameters: 2
	Flags: Linked
*/
function function_850588f4(localclientnum, var_4838b749)
{
	/#
		assert(isdefined(localclientnum));
	#/
	if(!isdefined(var_4838b749))
	{
		return false;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
	{
		slotid = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
		if(data.inventory.items[slotid].var_bd027dd9 != 32767)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_42e2bb1a
	Namespace: namespace_b376ff3f
	Checksum: 0x458A1CD3
	Offset: 0xBC88
	Size: 0xF74
	Parameters: 1
	Flags: Linked
*/
function function_42e2bb1a(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	pickedupammotypes = createuimodel(var_dcb56aa8, "pickedUpAmmoTypes");
	setuimodelvalue(createuimodel(pickedupammotypes, "count"), 0);
	data.inventory = spawnstruct();
	data.inventory.consumed = {};
	data.inventory.consumed.items = [];
	data.inventory.count = ((((17 + 1) + 8) + 1) + 8) + 1;
	data.inventory.items = [];
	data.inventory.var_a7a2b773 = 0;
	data.inventory.var_c212de25 = 3;
	data.inventory.var_7658cbec = 0;
	data.inventory.var_f3518190 = undefined;
	data.inventory.var_4d4ec560 = undefined;
	for(index = 0; index < data.inventory.count; index++)
	{
		data.inventory.items[index] = spawnstruct();
	}
	for(index = 0; index < 3; index++)
	{
		data.inventory.items[index].var_e4130a92 = createuimodel(var_dcb56aa8, "item" + index);
		setuimodelvalue(createuimodel(data.inventory.items[index].var_e4130a92, "backpackSlot"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[index].var_e4130a92, "disabled"), 0);
	}
	for(index = 3; index < 5; index++)
	{
		data.inventory.items[index].var_e4130a92 = createuimodel(var_dcb56aa8, "item" + index);
		setuimodelvalue(createuimodel(data.inventory.items[index].var_e4130a92, "backpackSlot"), 1);
		setuimodelvalue(createuimodel(data.inventory.items[index].var_e4130a92, "disabled"), 1);
	}
	data.inventory.items[5].var_e4130a92 = createuimodel(var_dcb56aa8, "health");
	data.inventory.items[6].var_e4130a92 = createuimodel(var_dcb56aa8, "gear");
	data.inventory.items[8].var_e4130a92 = createuimodel(var_dcb56aa8, "storage");
	data.inventory.items[7].var_e4130a92 = createuimodel(var_dcb56aa8, "equipment");
	data.inventory.items[12].var_e4130a92 = createuimodel(var_dcb56aa8, "fieldUpgrade");
	data.inventory.items[13].var_e4130a92 = createuimodel(var_dcb56aa8, "tactical");
	data.inventory.items[9].var_e4130a92 = createuimodel(var_dcb56aa8, "resource0");
	data.inventory.items[10].var_e4130a92 = createuimodel(var_dcb56aa8, "resource1");
	data.inventory.items[11].var_e4130a92 = createuimodel(var_dcb56aa8, "shard0");
	foreach(index, slotid in array(14, 15, 16))
	{
		data.inventory.items[slotid].var_e4130a92 = createuimodel(var_dcb56aa8, "perk" + index);
	}
	data.inventory.items[17].var_e4130a92 = createuimodel(var_dcb56aa8, "scorestreak");
	var_d42bc614 = array(17 + 1, ((17 + 1) + 8) + 1);
	for(index = 0; index < var_d42bc614.size; index++)
	{
		var_4838b749 = var_d42bc614[index];
		data.inventory.items[var_4838b749].var_e4130a92 = createuimodel(var_dcb56aa8, "weapon" + index);
		var_55022c4f = array(1, 2, 3, 4, 5, 6, 7, 8);
		for(attachmentindex = 0; attachmentindex < var_55022c4f.size; attachmentindex++)
		{
			var_259f58f3 = var_55022c4f[attachmentindex];
			var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
			var_cdc380b6 = attachmentindex + (index * var_55022c4f.size);
			data.inventory.items[var_f9f8c0b5].var_e4130a92 = createuimodel(var_dcb56aa8, "attachment" + var_cdc380b6);
		}
	}
	for(index = 0; index < data.inventory.items.size; index++)
	{
		if(!isdefined(data.inventory.items[index].var_e4130a92))
		{
			continue;
		}
		function_1a99656a(localclientnum, data.inventory.items[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.healthitems = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.healthitems[index] = spawnstruct();
		data.inventory.healthitems[index].var_e4130a92 = createuimodel(var_dcb56aa8, "health" + index);
		function_1a99656a(localclientnum, data.inventory.healthitems[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.var_a101f33c = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.var_a101f33c[index] = spawnstruct();
		data.inventory.var_a101f33c[index].var_e4130a92 = createuimodel(var_dcb56aa8, "equipment" + index);
		function_1a99656a(localclientnum, data.inventory.var_a101f33c[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.var_d4de469a = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.var_d4de469a[index] = spawnstruct();
		data.inventory.var_d4de469a[index].var_e4130a92 = createuimodel(var_dcb56aa8, "fieldUpgrade" + index);
		function_1a99656a(localclientnum, data.inventory.var_d4de469a[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.var_cb8b68cf = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.var_cb8b68cf[index] = spawnstruct();
		data.inventory.var_cb8b68cf[index].var_e4130a92 = createuimodel(var_dcb56aa8, "scorestreak" + index);
		function_1a99656a(localclientnum, data.inventory.var_cb8b68cf[index], 32767, 32767, 0, 0, 0);
	}
	setuimodelvalue(createuimodel(var_dcb56aa8, "count"), 3);
	setuimodelvalue(createuimodel(var_dcb56aa8, "filledSlots"), 0);
	setuimodelvalue(createuimodel(var_dcb56aa8, "attachmentCount"), 8);
	setuimodelvalue(createuimodel(var_dcb56aa8, "resourceCount"), 1);
	setuimodelvalue(createuimodel(var_dcb56aa8, "perkCount"), array(14, 15, 16).size);
	setuimodelvalue(createuimodel(var_dcb56aa8, "scorestreakCount"), 1);
	setuimodelvalue(createuimodel(var_dcb56aa8, "shardCount"), 1);
	setuimodelvalue(createuimodel(var_dcb56aa8, "canUseQuickInventory"), 0);
	if(function_88da0c8e(localclientnum))
	{
		setuimodelvalue(createuimodel(data.inventory.items[9].var_e4130a92, "notAccessible"), 1);
	}
	data.inventory.consumed.uimodel = createuimodel(var_dcb56aa8, "consumed");
	data.inventory.consumed.var_a25538fb = createuimodel(data.inventory.consumed.uimodel, "count");
	setuimodelvalue(data.inventory.consumed.var_a25538fb, 0);
	level thread function_dab42db1(localclientnum);
	level thread function_d7869556(localclientnum);
	level thread function_cf96d951(localclientnum);
	level thread function_3b3ad5c2(localclientnum);
	level thread function_99bb24f8(localclientnum);
	function_9a227103(createuimodel(var_dcb56aa8, "initialize"));
}

/*
	Name: function_dab42db1
	Namespace: namespace_b376ff3f
	Checksum: 0x4B78B3E6
	Offset: 0xCC08
	Size: 0x1EC
	Parameters: 1
	Flags: Linked
*/
function function_dab42db1(localclientnum)
{
	level flag::wait_till(#"hash_51daecff754729dc");
	foreach(ammotype in array(#"hash_837a6ea0c2864a8", #"hash_1cdb9172a79b9080", #"hash_54f3f08c1d7d45d3", #"hash_4ab594460fa1627b", #"hash_f9e29721ba5715e", #"hash_75bef4d329c1080b"))
	{
		point = function_4ba8fde(ammotype);
		if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"ammo")
		{
			function_4f16aa30(localclientnum, point.id);
		}
	}
	var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	pickedupammotypes = createuimodel(var_dcb56aa8, "pickedUpAmmoTypes");
	function_9a227103(pickedupammotypes);
}

/*
	Name: function_cf96d951
	Namespace: namespace_b376ff3f
	Checksum: 0x46D5370A
	Offset: 0xCE00
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_cf96d951(localclientnum)
{
	level flag::wait_till(#"hash_51daecff754729dc");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"hash_2e33ce38d6cda617");
	if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"hash_56d6621e6c4caf07")
	{
		function_1a99656a(localclientnum, data.inventory.items[11], point.var_bd027dd9, point.id, 0, 0, 0);
	}
}

/*
	Name: function_d7869556
	Namespace: namespace_b376ff3f
	Checksum: 0xA51C4D8C
	Offset: 0xCF00
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_d7869556(localclientnum)
{
	level flag::wait_till(#"hash_51daecff754729dc");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"hash_5e9c3f9821e1ee0a");
	if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"resource")
	{
		function_1a99656a(localclientnum, data.inventory.items[9], point.var_bd027dd9, point.id, 0, 0, 0);
	}
}

/*
	Name: function_3b3ad5c2
	Namespace: namespace_b376ff3f
	Checksum: 0x600BE900
	Offset: 0xD000
	Size: 0x178
	Parameters: 1
	Flags: Linked
*/
function function_3b3ad5c2(localclientnum)
{
	level flag::wait_till(#"hash_51daecff754729dc");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"hash_383a1390efa15e8a");
	if(isdefined(point) && isdefined(point.var_a6762160) && namespace_ad5a0cd6::function_a57773a4(point.var_a6762160))
	{
		foreach(slotid in array(14, 15, 16))
		{
			function_1a99656a(localclientnum, data.inventory.items[slotid], point.var_bd027dd9, point.id, 0, 0, 0);
		}
	}
}

/*
	Name: function_99bb24f8
	Namespace: namespace_b376ff3f
	Checksum: 0x15B16091
	Offset: 0xD180
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_99bb24f8(localclientnum)
{
	level flag::wait_till(#"hash_51daecff754729dc");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"hash_668192b8df645b73");
	if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"scorestreak")
	{
		function_1a99656a(localclientnum, data.inventory.items[17], point.var_bd027dd9, point.id, 0, 0, 0);
	}
}

/*
	Name: function_534dcb9c
	Namespace: namespace_b376ff3f
	Checksum: 0x9C9C438B
	Offset: 0xD280
	Size: 0x46C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_534dcb9c(localclientnum)
{
	if(!isdefined(level.var_af8f97c8) || !isdefined(level.var_af8f97c8[localclientnum]))
	{
		if(!isdefined(level.var_aa75d3e))
		{
			level.var_aa75d3e = [];
		}
		else if(!isarray(level.var_aa75d3e))
		{
			level.var_aa75d3e = array(level.var_aa75d3e);
		}
		if(!isdefined(level.var_af8f97c8))
		{
			level.var_af8f97c8 = [];
		}
		else if(!isarray(level.var_af8f97c8))
		{
			level.var_af8f97c8 = array(level.var_af8f97c8);
		}
		if(!isdefined(level.var_53cbbb33))
		{
			level.var_53cbbb33 = [];
		}
		else if(!isarray(level.var_53cbbb33))
		{
			level.var_53cbbb33 = array(level.var_53cbbb33);
		}
		if(!isdefined(level.var_3a0390dd))
		{
			level.var_3a0390dd = [];
		}
		else if(!isarray(level.var_3a0390dd))
		{
			level.var_3a0390dd = array(level.var_3a0390dd);
		}
		if(!isdefined(level.var_c8a5f79b))
		{
			level.var_c8a5f79b = [];
		}
		else if(!isarray(level.var_c8a5f79b))
		{
			level.var_c8a5f79b = array(level.var_c8a5f79b);
		}
		if(!isdefined(level.var_830a8516))
		{
			level.var_830a8516 = [];
		}
		else if(!isarray(level.var_830a8516))
		{
			level.var_830a8516 = array(level.var_830a8516);
		}
		if(!isdefined(level.var_7086ad4f))
		{
			level.var_7086ad4f = [];
		}
		else if(!isarray(level.var_7086ad4f))
		{
			level.var_7086ad4f = array(level.var_7086ad4f);
		}
		var_dcb56aa8 = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		level.var_aa75d3e[localclientnum] = createuimodel(var_dcb56aa8, "currentWeaponIndex");
		level.var_af8f97c8[localclientnum] = createuimodel(var_dcb56aa8, "currentWeapon.itemIndex");
		level.var_c8a5f79b[localclientnum] = createuimodel(var_dcb56aa8, "currentWeapon.ammoType");
		level.var_53cbbb33[localclientnum] = createuimodel(var_dcb56aa8, "currentWeapon.isOperator");
		level.var_3a0390dd[localclientnum] = createuimodel(var_dcb56aa8, "currentWeapon.isTactical");
		level.var_830a8516[localclientnum] = createuimodel(var_dcb56aa8, "currentWeapon.rarity");
		level.var_7086ad4f[localclientnum] = createuimodel(var_dcb56aa8, "showAttachments");
		level.var_6d21daaf[localclientnum] = createuimodel(var_dcb56aa8, "canTransferFromStash");
		setuimodelvalue(level.var_830a8516[localclientnum], "Loadout");
	}
}

/*
	Name: function_6231c19
	Namespace: namespace_b376ff3f
	Checksum: 0x678B961D
	Offset: 0xD6F8
	Size: 0x984
	Parameters: 1
	Flags: Linked
*/
function function_6231c19(params)
{
	if(params.weapon.name == #"none")
	{
		return;
	}
	if(isstruct(self))
	{
		return;
	}
	if(!self function_da43934d() || !isplayer(self) || !isalive(self))
	{
		return;
	}
	function_534dcb9c(params.localclientnum);
	if(isdefined(params.weapon))
	{
		data = item_world::function_a7e98a1a(params.localclientnum);
		if(!isdefined(data) || !isdefined(data.inventory) || !isdefined(data.inventory.items) || data.inventory.items.size == 0)
		{
			return;
		}
		self.currentweapon = params.weapon;
		if(params.weapon == level.weaponbasemeleeheld)
		{
			setuimodelvalue(level.var_7086ad4f[params.localclientnum], 0);
			itemindex = getbaseweaponitemindex(getweapon(#"none"));
			foreach(slot in array(17 + 1, ((17 + 1) + 8) + 1))
			{
				if(data.inventory.items[slot].var_bd027dd9 == 32767)
				{
					break;
				}
			}
			if(!isdefined(index))
			{
				return;
			}
			setuimodelvalue(level.var_3a0390dd[params.localclientnum], 0);
			setuimodelvalue(level.var_53cbbb33[params.localclientnum], 0);
			if(!setuimodelvalue(level.var_aa75d3e[params.localclientnum], index))
			{
				function_9a227103(level.var_aa75d3e[params.localclientnum]);
			}
			if(!setuimodelvalue(level.var_af8f97c8[params.localclientnum], itemindex))
			{
				function_9a227103(level.var_af8f97c8[params.localclientnum]);
			}
			setuimodelvalue(level.var_830a8516[params.localclientnum], "Loadout");
			function_deddbdf0(params.localclientnum);
			function_ce628f27(params.localclientnum);
			return;
		}
		var_a4250c2b = self function_d768ea30(params.localclientnum);
		foreach(slot in array(17 + 1, ((17 + 1) + 8) + 1))
		{
			if(slot === var_a4250c2b)
			{
				if(!setuimodelvalue(level.var_aa75d3e[params.localclientnum], index))
				{
					function_9a227103(level.var_aa75d3e[params.localclientnum]);
				}
				break;
			}
		}
		var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_a4250c2b);
		item = function_15d578f4(params.localclientnum, var_bd027dd9);
		if(isdefined(item) && isdefined(item.var_a6762160) && is_true(item.var_a6762160.var_340eac1f))
		{
			setuimodelvalue(level.var_53cbbb33[params.localclientnum], 0);
			setuimodelvalue(level.var_3a0390dd[params.localclientnum], 1);
		}
		else
		{
			if(isdefined(item) && isdefined(item.var_a6762160) && is_true(item.var_a6762160.var_dc6c5d3b))
			{
				setuimodelvalue(level.var_3a0390dd[params.localclientnum], 0);
				setuimodelvalue(level.var_53cbbb33[params.localclientnum], 1);
			}
			else
			{
				setuimodelvalue(level.var_3a0390dd[params.localclientnum], 0);
				setuimodelvalue(level.var_53cbbb33[params.localclientnum], 0);
			}
		}
		if(isdefined(params.weapon.statname) && params.weapon.statname != #"")
		{
			itemindex = getbaseweaponitemindex(getweapon(params.weapon.statname));
		}
		else
		{
			itemindex = getbaseweaponitemindex(params.weapon);
		}
		var_754fe8c5 = function_e36b5f2c(params.weapon);
		if(isdefined(level.var_c53d118f) && isdefined(level.var_c53d118f[var_754fe8c5]))
		{
			setuimodelvalue(level.var_c8a5f79b[params.localclientnum], level.var_c53d118f[var_754fe8c5]);
		}
		else
		{
			setuimodelvalue(level.var_c8a5f79b[params.localclientnum], #"");
		}
		if(isdefined(item.var_a6762160.rarity) && item.var_a6762160.rarity != "")
		{
			setuimodelvalue(level.var_830a8516[params.localclientnum], item.var_a6762160.rarity);
		}
		else
		{
			setuimodelvalue(level.var_830a8516[params.localclientnum], "Loadout");
		}
		setuimodelvalue(level.var_af8f97c8[params.localclientnum], itemindex);
		function_9a227103(level.var_af8f97c8[params.localclientnum]);
		supportsattachments = 0;
		if(isdefined(item))
		{
			supportsattachments = namespace_a0d533d1::function_4bd83c04(item);
		}
		setuimodelvalue(level.var_7086ad4f[params.localclientnum], supportsattachments);
		function_deddbdf0(params.localclientnum, var_a4250c2b);
		function_ce628f27(params.localclientnum);
	}
}

/*
	Name: function_8ffee46f
	Namespace: namespace_b376ff3f
	Checksum: 0x15AA572
	Offset: 0xE088
	Size: 0x18C
	Parameters: 2
	Flags: Linked
*/
function function_8ffee46f(localclientnum, item)
{
	var_f9b70cae = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "pickedUpItem");
	itemname = item_world::get_item_name(item.var_a6762160);
	if(!setuimodelvalue(var_f9b70cae, itemname))
	{
		function_9a227103(var_f9b70cae);
	}
	if(item.var_a6762160.itemtype == #"weapon")
	{
		var_d9659d2a = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "pickedUpWeapon");
		if(!setuimodelvalue(var_d9659d2a, itemname))
		{
			function_9a227103(var_d9659d2a);
		}
	}
	else if(item.var_a6762160.itemtype == #"generic")
	{
		function_22759012(localclientnum, item.var_bd027dd9);
	}
}

/*
	Name: function_c9764f6d
	Namespace: namespace_b376ff3f
	Checksum: 0x2B1FF1CF
	Offset: 0xE220
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_c9764f6d(localclientnum)
{
	var_80c295ff = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "droppedWeapon");
	function_9a227103(var_80c295ff);
}

/*
	Name: function_451ebd83
	Namespace: namespace_b376ff3f
	Checksum: 0x2745F02F
	Offset: 0xE290
	Size: 0x12C
	Parameters: 3
	Flags: Linked
*/
function function_451ebd83(localclientnum, item, var_bd027dd9)
{
	itemname = item_world::get_item_name(item);
	waittillframeend();
	var_e16dbee1 = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "consumedItem");
	if(!setuimodelvalue(var_e16dbee1, itemname))
	{
		function_9a227103(var_e16dbee1);
	}
	data = item_world::function_a7e98a1a(localclientnum);
	if(isdefined(data) && isdefined(data.inventory) && var_bd027dd9 === data.inventory.var_4d4ec560)
	{
		data.inventory.var_4d4ec560 = undefined;
	}
	function_9f5d2dc8(localclientnum);
}

/*
	Name: function_4f16aa30
	Namespace: namespace_b376ff3f
	Checksum: 0x638CE4AF
	Offset: 0xE3C8
	Size: 0x4D4
	Parameters: 2
	Flags: Linked
*/
function function_4f16aa30(localclientnum, var_d8138db2)
{
	if(!isdefined(level.var_c53d118f))
	{
		level.var_c53d118f = [];
	}
	/#
		assert(namespace_ad5a0cd6::function_2c7fc531(var_d8138db2));
	#/
	item = function_b1702735(var_d8138db2);
	if(!isdefined(item.var_a6762160))
	{
		return;
	}
	var_754fe8c5 = function_e36b5f2c(item.var_a6762160.weapon);
	if(!isdefined(var_754fe8c5) || item.var_a6762160.itemtype !== #"ammo")
	{
		return;
	}
	var_f9b70cae = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "pickedUpItem");
	var_7268d07 = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "pickedUpAmmoTypes");
	var_5a2db7bb = createuimodel(var_7268d07, "count");
	var_b4676aed = getuimodelvalue(var_5a2db7bb);
	for(i = 0; i < var_b4676aed; i++)
	{
		var_acd2831f = createuimodel(var_7268d07, "" + (i + 1));
		if(getuimodelvalue(createuimodel(var_acd2831f, "assetName")) == var_754fe8c5)
		{
			if(item.var_a6762160.itemtype == #"ammo" && !getuimodelvalue(createuimodel(var_acd2831f, "canDrop")))
			{
				setuimodelvalue(createuimodel(var_acd2831f, "id"), var_d8138db2);
				setuimodelvalue(createuimodel(var_acd2831f, "canDrop"), item.var_a6762160.itemtype == #"ammo");
			}
			return;
		}
	}
	level.var_c53d118f[var_754fe8c5] = item.var_a6762160.displayname;
	var_acd2831f = createuimodel(var_7268d07, "" + (var_b4676aed + 1));
	setuimodelvalue(createuimodel(var_acd2831f, "assetName"), var_754fe8c5);
	setuimodelvalue(createuimodel(var_acd2831f, "id"), var_d8138db2);
	setuimodelvalue(createuimodel(var_acd2831f, "canDrop"), 1);
	setuimodelvalue(createuimodel(var_acd2831f, "name"), item.var_a6762160.displayname);
	setuimodelvalue(createuimodel(var_acd2831f, "icon"), item.var_a6762160.icon);
	setuimodelvalue(createuimodel(var_acd2831f, "description"), item.var_a6762160.description);
	setuimodelvalue(var_5a2db7bb, var_b4676aed + 1);
}

/*
	Name: function_b1136fc8
	Namespace: namespace_b376ff3f
	Checksum: 0xD00B78C0
	Offset: 0xE8A8
	Size: 0x44A
	Parameters: 2
	Flags: Linked
*/
function function_b1136fc8(localclientnum, item)
{
	if(isdefined(item) && isdefined(item.origin) && isdefined(item.var_a6762160))
	{
		if(isdefined(item.var_a6762160.var_36781d9f))
		{
			playsound(localclientnum, item.var_a6762160.var_36781d9f, item.origin);
			return;
		}
		switch(item.var_a6762160.itemtype)
		{
			case "weapon":
			{
				playsound(localclientnum, #"hash_67fed8a52accbb23", item.origin);
				break;
			}
			case "ammo":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "health":
			{
				playsound(localclientnum, #"hash_4d393a136d0df945", item.origin);
				break;
			}
			case "equipment":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "field_upgrade":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "tactical":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "armor":
			{
				playsound(localclientnum, #"hash_6bd51d5a531ff32", item.origin);
				break;
			}
			case "backpack":
			{
				playsound(localclientnum, #"hash_60e9138ddc9660ed", item.origin);
				break;
			}
			case "attachment":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "quest":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "generic":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "cash":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "hash_63c2e39c90346280":
			case "hash_63c2e49c90346433":
			case "hash_63c2e59c903465e6":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
			case "scorestreak":
			{
				playsound(localclientnum, #"hash_24fef443bbac697c", item.origin);
				break;
			}
		}
	}
}

/*
	Name: function_d1da833d
	Namespace: namespace_b376ff3f
	Checksum: 0x1649686
	Offset: 0xED00
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function function_d1da833d(localclientnum, item)
{
	if(isdefined(item) && isdefined(item.origin) && isdefined(item.var_a6762160))
	{
		if(isdefined(item.var_a6762160.var_1b0b57d1))
		{
			playsound(localclientnum, item.var_a6762160.var_1b0b57d1, item.origin);
			return;
		}
		function_31868137(localclientnum, item);
	}
}

/*
	Name: function_31868137
	Namespace: namespace_b376ff3f
	Checksum: 0x63D7BEE0
	Offset: 0xEDB0
	Size: 0x44A
	Parameters: 2
	Flags: Linked
*/
function function_31868137(localclientnum, item)
{
	if(isdefined(item) && isdefined(item.origin) && isdefined(item.var_a6762160))
	{
		if(isdefined(item.var_a6762160.pickupsound))
		{
			playsound(localclientnum, item.var_a6762160.pickupsound, item.origin);
			return;
		}
		switch(item.var_a6762160.itemtype)
		{
			case "weapon":
			{
				playsound(localclientnum, #"hash_62fabedcce13774c", item.origin);
				break;
			}
			case "ammo":
			{
				playsound(localclientnum, #"hash_36c9bf9c68a692f6", item.origin);
				break;
			}
			case "health":
			{
				playsound(localclientnum, #"hash_7cb9f9cf7068ccee", item.origin);
				break;
			}
			case "equipment":
			{
				playsound(localclientnum, #"hash_615c575c66ed8695", item.origin);
				break;
			}
			case "field_upgrade":
			{
				playsound(localclientnum, #"hash_615c575c66ed8695", item.origin);
				break;
			}
			case "tactical":
			{
				playsound(localclientnum, #"hash_615c575c66ed8695", item.origin);
				break;
			}
			case "armor":
			{
				playsound(localclientnum, #"hash_2d8e1c5a5387840f", item.origin);
				break;
			}
			case "backpack":
			{
				playsound(localclientnum, #"hash_69949bb7db9ef21e", item.origin);
				break;
			}
			case "attachment":
			{
				playsound(localclientnum, #"hash_48ae9b1190e79fc5", item.origin);
				break;
			}
			case "quest":
			{
				playsound(localclientnum, #"hash_5738a0fcb2e4efca", item.origin);
				break;
			}
			case "generic":
			{
				playsound(localclientnum, #"hash_615c575c66ed8695", item.origin);
				break;
			}
			case "cash":
			{
				playsound(localclientnum, #"hash_615c575c66ed8695", item.origin);
				break;
			}
			case "hash_63c2e39c90346280":
			case "hash_63c2e49c90346433":
			case "hash_63c2e59c903465e6":
			{
				playsound(localclientnum, #"hash_615c575c66ed8695", item.origin);
				break;
			}
			case "scorestreak":
			{
				playsound(localclientnum, #"hash_615c575c66ed8695", item.origin);
				break;
			}
		}
	}
}

/*
	Name: function_c6ff0aa2
	Namespace: namespace_b376ff3f
	Checksum: 0x3A0B2EA4
	Offset: 0xF208
	Size: 0x70C
	Parameters: 2
	Flags: Linked
*/
function function_c6ff0aa2(localclientnum, var_bd027dd9)
{
	data = item_world::function_a7e98a1a(localclientnum);
	index = item_world::function_73436347(data.inventory.items, var_bd027dd9);
	if(!isdefined(index))
	{
		/#
			println(("" + var_bd027dd9) + "");
		#/
		return;
	}
	item = data.inventory.items[index];
	isweapon = isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"weapon";
	var_53aa3063 = isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"generic";
	var_ac3edb34 = item.var_a6762160;
	if(isdefined(item.endtime))
	{
		consumeditem = function_85645978(data, item);
		if(isdefined(consumeditem))
		{
			var_ee0e9af9 = [];
			for(index = 0; index < 5; index++)
			{
				var_b619c089 = data.inventory.items[index];
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
			consumeditem.endtime = consumeditem.endtime - (remaining / var_ee0e9af9.size);
			for(index = 0; index < var_ee0e9af9.size; index++)
			{
				var_b619c089 = var_ee0e9af9[index];
				var_b619c089.starttime = consumeditem.starttime;
				var_b619c089.endtime = consumeditem.endtime;
			}
		}
	}
	var_6177806b = 0;
	if(namespace_ad5a0cd6::function_a57773a4(item.var_a6762160))
	{
		slotid = namespace_ad5a0cd6::function_808be9a3(var_bd027dd9);
		foreach(var_204192a2 in array(14, 15, 16))
		{
			if(slotid == var_204192a2)
			{
				var_6177806b = 1;
				break;
			}
		}
		if(var_6177806b)
		{
			point = function_4ba8fde(#"hash_383a1390efa15e8a");
			var_6fd9b15e = point.id;
			var_904ed6d7 = point.id;
		}
	}
	else if(item.var_a6762160.itemtype == #"scorestreak")
	{
		slotid = namespace_ad5a0cd6::function_808be9a3(var_bd027dd9);
		if(slotid == 17)
		{
			var_6177806b = 1;
			point = function_4ba8fde(#"hash_668192b8df645b73");
			var_6fd9b15e = point.id;
			var_904ed6d7 = point.id;
		}
	}
	if(var_6177806b)
	{
		function_1a99656a(localclientnum, item, var_6fd9b15e, var_904ed6d7, 0, 0, 0, 1, 0, 0);
	}
	else
	{
		function_1a99656a(localclientnum, item, 32767, 32767, 0, 0, 0, 1, 0, 0);
	}
	player = function_27673a7(localclientnum);
	if(player.weapon.name == #"none" || player.weapon.name == #"bare_hands")
	{
		var_a4250c2b = player function_d768ea30(localclientnum);
		if(isdefined(var_a4250c2b) && var_a4250c2b == index)
		{
			primaryweapons = player getweaponslistprimaries();
			nextweapon = level.weaponbasemeleeheld;
			foreach(weapon in primaryweapons)
			{
				if(weapon !== weapons::function_251ec78c(player.currentweapon))
				{
					nextweapon = weapon;
					break;
				}
			}
			var_a3eec6f2 = spawnstruct();
			var_a3eec6f2.localclientnum = localclientnum;
			var_a3eec6f2.weapon = nextweapon;
			player function_6231c19(var_a3eec6f2);
		}
	}
	if(index == 8)
	{
		function_687852e(localclientnum, var_bd027dd9);
	}
	if(isweapon)
	{
		function_c9764f6d(localclientnum);
		function_ce628f27(localclientnum);
	}
	else if(var_53aa3063)
	{
		function_9f5d2dc8(localclientnum);
	}
}

/*
	Name: function_8063170
	Namespace: namespace_b376ff3f
	Checksum: 0xDD91CC55
	Offset: 0xF920
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_8063170(var_b619c089, equipped)
{
	if(!isdefined(var_b619c089) || !isdefined(var_b619c089.var_a6762160))
	{
		return;
	}
	if(var_b619c089.var_a6762160.itemtype === #"hash_56d6621e6c4caf07")
	{
		return;
	}
	if(var_b619c089.var_a6762160.itemtype === #"attachment" || var_b619c089.var_a6762160.itemtype === #"weapon")
	{
		availableaction = var_b619c089.availableaction;
	}
	else
	{
		availableaction = var_b619c089.availableaction && !equipped;
	}
	setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "availableAction"), availableaction);
}

/*
	Name: function_26c87da8
	Namespace: namespace_b376ff3f
	Checksum: 0x44501189
	Offset: 0xFA38
	Size: 0x314
	Parameters: 3
	Flags: Linked
*/
function function_26c87da8(localclientnum, var_c9293a27, var_8f194e5a)
{
	/#
		assert(isdefined(var_c9293a27) && isdefined(var_8f194e5a));
	#/
	if(var_c9293a27 == var_8f194e5a)
	{
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	var_48e276d5 = data.inventory.items[var_c9293a27];
	var_47684cd2 = data.inventory.items[var_8f194e5a];
	var_23501832 = var_48e276d5.var_bd027dd9;
	var_a2dd129a = var_48e276d5.id;
	var_b208c7e1 = var_48e276d5.var_a6762160;
	var_3907299e = var_48e276d5.count;
	var_57b0c2f = var_48e276d5.availableaction;
	var_9269cd0a = var_47684cd2.var_bd027dd9;
	var_d3a45360 = var_47684cd2.id;
	var_ec763bb2 = var_47684cd2.var_a6762160;
	var_532f304 = var_47684cd2.count;
	var_ad138826 = var_47684cd2.availableaction;
	player = function_27673a7(localclientnum);
	if(var_3907299e == 0)
	{
		var_23501832 = 32767;
	}
	player function_1a99656a(localclientnum, var_47684cd2, (var_23501832 != 32767 ? namespace_ad5a0cd6::function_970b8d86(var_8f194e5a) : 32767), var_a2dd129a, var_3907299e, function_bba770de(localclientnum, var_b208c7e1), var_57b0c2f, undefined, 1);
	if(var_532f304 == 0)
	{
		var_9269cd0a = 32767;
	}
	player function_1a99656a(localclientnum, var_48e276d5, (var_9269cd0a != 32767 ? namespace_ad5a0cd6::function_970b8d86(var_c9293a27) : 32767), var_d3a45360, var_532f304, function_bba770de(localclientnum, var_ec763bb2), var_ad138826, undefined, 1);
	function_442857e2(localclientnum, var_ec763bb2);
	function_442857e2(localclientnum, var_b208c7e1);
	function_ce628f27(localclientnum);
	var_a4250c2b = player function_d768ea30(localclientnum);
	function_deddbdf0(localclientnum, var_a4250c2b);
}

/*
	Name: function_687852e
	Namespace: namespace_b376ff3f
	Checksum: 0xD1AF6EB6
	Offset: 0xFD58
	Size: 0x15C
	Parameters: 2
	Flags: Linked
*/
function function_687852e(localclientnum, var_bd027dd9)
{
	data = item_world::function_a7e98a1a(var_bd027dd9);
	data.inventory.var_7658cbec = 0;
	if(data.inventory.var_c212de25 == 5)
	{
		for(index = 3; index < 5; index++)
		{
			var_b619c089 = data.inventory.items[index];
			setuimodelvalue(createuimodel(var_b619c089.var_e4130a92, "disabled"), 1);
		}
		data.inventory.var_c212de25 = 3;
		var_dcb56aa8 = function_1df4c3b0(var_bd027dd9, #"hash_159966ba825013a2");
		setuimodelvalue(createuimodel(var_dcb56aa8, "count"), data.inventory.var_c212de25);
	}
}

/*
	Name: function_fa372100
	Namespace: namespace_b376ff3f
	Checksum: 0xF7706E73
	Offset: 0xFEC0
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_fa372100(localclientnum, var_bd027dd9)
{
	data = item_world::function_a7e98a1a(localclientnum);
	foreach(var_b619c089 in data.inventory.items)
	{
		if(var_b619c089.var_bd027dd9 === var_bd027dd9)
		{
			function_8063170(var_b619c089, 0);
			break;
		}
	}
}

/*
	Name: function_6490a112
	Namespace: namespace_b376ff3f
	Checksum: 0x3554ED18
	Offset: 0xFFA8
	Size: 0x1AC
	Parameters: 3
	Flags: Linked
*/
function function_6490a112(localclientnum, var_bd027dd9, count)
{
	data = item_world::function_a7e98a1a(localclientnum);
	player = function_27673a7(localclientnum);
	foreach(var_b619c089 in data.inventory.items)
	{
		if(var_b619c089.var_bd027dd9 === var_bd027dd9)
		{
			var_338e8597 = (isdefined(var_b619c089.count) ? var_b619c089.count : 0);
			totalcount = function_bba770de(localclientnum, var_b619c089.var_a6762160);
			totalcount = totalcount + (count - var_338e8597);
			function_1a99656a(localclientnum, var_b619c089, var_b619c089.var_bd027dd9, var_b619c089.id, count, totalcount, var_b619c089.availableaction);
			function_8063170(var_b619c089, function_6d9d9cd7(var_14f7206c));
			break;
		}
	}
}

