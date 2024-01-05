#using script_618d6f5ff5d18933;
#using script_3d35e2ff167b3a82;
#using scripts\core_common\player\player_stats.csc;
#using script_2358831c5878ace3;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using script_7ebad89114ecedb1;
#using script_680dddbda86931fa;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace item_inventory;

/*
	Name: function_b207a44b
	Namespace: item_inventory
	Checksum: 0x5FDA887
	Offset: 0x9F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b207a44b()
{
	level notify(1965938996);
}

/*
	Name: __init__system__
	Namespace: item_inventory
	Checksum: 0x1B74FFFA
	Offset: 0xA10
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"item_inventory", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: item_inventory
	Checksum: 0x6EFC02A5
	Offset: 0xA60
	Size: 0x154
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!item_world_util::use_item_spawns())
	{
		return;
	}
	if(function_7d5553ac())
	{
		return;
	}
	clientfield::register("toplayer", "inventoryThirdWeapon", 8000, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.healthItemstackCount", #"hud_items", #"hash_6a60c3e33988b66f", 1, 8, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.equipmentStackCount", #"hud_items", #"hash_3ae366d663c0f130", 1, 8, "int", undefined, 0, 0);
	callback::on_localplayer_spawned(&_on_localplayer_spawned);
	level thread function_d2f05352();
	level.var_53854c4 = &function_53854c4;
}

/*
	Name: function_7d5553ac
	Namespace: item_inventory
	Checksum: 0xF8FE8674
	Offset: 0xBC0
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function function_7d5553ac()
{
	return true;
}

/*
	Name: _on_localplayer_spawned
	Namespace: item_inventory
	Checksum: 0xAB647A1D
	Offset: 0xC18
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private _on_localplayer_spawned(localclientnum)
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
	Namespace: item_inventory
	Checksum: 0x3D61011B
	Offset: 0xCF0
	Size: 0x23E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6636af5c(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("6dd32345b3185f8b");
	self endon("6dd32345b3185f8b");
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
				var_bd027dd9 = item_world_util::function_970b8d86(var_a4250c2b);
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
	Namespace: item_inventory
	Checksum: 0xB7A43354
	Offset: 0xF38
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
	Namespace: item_inventory
	Checksum: 0xA8ED0F4A
	Offset: 0x1040
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_88da0c8e(localclientnum)
{
	paintcans = stats::get_stat_global(localclientnum, #"items_paint_cans_collected");
	return (isdefined(paintcans) ? paintcans : 0) >= 150;
}

/*
	Name: function_99b22bbc
	Namespace: item_inventory
	Checksum: 0x63B45B58
	Offset: 0x1098
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
	Namespace: item_inventory
	Checksum: 0xAB7E3217
	Offset: 0x1100
	Size: 0x3EA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ca87f318(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("69cca0891268fb44");
	self endon("69cca0891268fb44");
	clientdata = item_world::function_a7e98a1a(localclientnum);
	while(!isdefined(clientdata))
	{
		waitframe(1);
		clientdata = item_world::function_a7e98a1a(localclientnum);
	}
	var_790695cc = "inventory_equip" + localclientnum;
	var_6e7b39bc = "inventory_detach" + localclientnum;
	clientdata.var_b9730e2b = gettime();
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_790695cc, var_6e7b39bc);
		if(gettime() - clientdata.var_b9730e2b < 300)
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
						inventoryitem = data.inventory.items[index];
						if(!isdefined(inventoryitem.var_a6762160) || isdefined(inventoryitem.endtime))
						{
							continue;
						}
						if(inventoryitem.var_bd027dd9 == var_bd027dd9)
						{
							continue;
						}
						if(name == (isdefined(inventoryitem.var_a6762160.parentname) ? inventoryitem.var_a6762160.parentname : inventoryitem.var_a6762160.name))
						{
							var_bd027dd9 = inventoryitem.var_bd027dd9;
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
		clientdata.var_b9730e2b = gettime();
	}
}

/*
	Name: function_10861362
	Namespace: item_inventory
	Checksum: 0x5DAD4C50
	Offset: 0x14F8
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
	Namespace: item_inventory
	Checksum: 0x93FD06CA
	Offset: 0x1590
	Size: 0x98
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ee44351a(localclientnum, inventoryitem)
{
	weapon = item_world_util::function_35e06774(inventoryitem.var_a6762160);
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
	Namespace: item_inventory
	Checksum: 0x7E1E95B4
	Offset: 0x1630
	Size: 0x1CA
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e23e5e85(localclientnum)
{
	clientdata = item_world::function_a7e98a1a(localclientnum);
	if(!isdefined(clientdata) || !isdefined(clientdata.inventory) || !isdefined(clientdata.inventory.items))
	{
		return false;
	}
	armoritem = clientdata.inventory.items[6];
	if(!isdefined(armoritem) || armoritem.var_bd027dd9 === 32767 || armoritem.var_a6762160.itemtype !== #"armor")
	{
		return false;
	}
	clientmodel = getuimodelvalue(getuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "predictedClientModel"));
	armormodel = getuimodel(clientmodel, "armor");
	var_15663411 = getuimodel(armoritem.itemuimodel, "armorMax");
	if(!isdefined(armormodel) || !isdefined(var_15663411) || getuimodelvalue(armormodel) == getuimodelvalue(var_15663411))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e094fd92
	Namespace: item_inventory
	Checksum: 0x8E82D190
	Offset: 0x1808
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
	Namespace: item_inventory
	Checksum: 0x2C2F93D8
	Offset: 0x18A8
	Size: 0xDE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f3ef5269(localclientnum)
{
	perksarray = [];
	clientdata = item_world::function_a7e98a1a(localclientnum);
	for(i = 0; i < 5; i++)
	{
		currentitem = clientdata.inventory.items[i];
		if(function_e094fd92(currentitem))
		{
			if(!isdefined(perksarray))
			{
				perksarray = [];
			}
			else if(!isarray(perksarray))
			{
				perksarray = array(perksarray);
			}
			perksarray[perksarray.size] = currentitem;
		}
	}
	return perksarray;
}

/*
	Name: function_e090a831
	Namespace: item_inventory
	Checksum: 0xE658EE02
	Offset: 0x1990
	Size: 0xBE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e090a831(localclientnum, var_bd027dd9)
{
	clientdata = item_world::function_a7e98a1a(localclientnum);
	perkindex = 0;
	for(i = 0; i < 5; i++)
	{
		currentitem = clientdata.inventory.items[i];
		if(function_e094fd92(currentitem))
		{
			if(currentitem.var_bd027dd9 == var_bd027dd9)
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
	Namespace: item_inventory
	Checksum: 0xD0266DE0
	Offset: 0x1A58
	Size: 0x170
	Parameters: 2
	Flags: Linked, Private
*/
function private function_535a5a06(localclientnum, var_6e51c00)
{
	/#
		assert(var_6e51c00 >= -1 && var_6e51c00 <= 1);
	#/
	inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	var_f99434b1 = createuimodel(inventoryuimodel, "quickConsumeIndex");
	perksarray = function_f3ef5269(localclientnum);
	var_be32fa6d = perksarray.size;
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
	Namespace: item_inventory
	Checksum: 0xDAE2CA1B
	Offset: 0x1BD0
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
	Namespace: item_inventory
	Checksum: 0xD235B5D1
	Offset: 0x1C00
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
	Namespace: item_inventory
	Checksum: 0x7387EE26
	Offset: 0x1C30
	Size: 0x124
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1606ff3(localclientnum, var_6e51c00)
{
	perksarray = function_f3ef5269(localclientnum);
	currentindex = function_535a5a06(localclientnum, var_6e51c00);
	inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	var_98d32f1c = createuimodel(inventoryuimodel, "quickConsumeNetworkId");
	if(isdefined(perksarray[currentindex]))
	{
		setuimodelvalue(var_98d32f1c, perksarray[currentindex].var_bd027dd9);
	}
	else
	{
		setuimodelvalue(var_98d32f1c, 32767);
	}
	if(perksarray.size > 1)
	{
		playsound(localclientnum, #"hash_4d31bd9927d823c3");
	}
}

/*
	Name: function_22759012
	Namespace: item_inventory
	Checksum: 0xF2DB9343
	Offset: 0x1D60
	Size: 0x104
	Parameters: 2
	Flags: Linked, Private
*/
function private function_22759012(localclientnum, var_bd027dd9)
{
	perkindex = function_e090a831(localclientnum, var_bd027dd9);
	if(perkindex > -1)
	{
		inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		var_f99434b1 = createuimodel(inventoryuimodel, "quickConsumeIndex");
		setuimodelvalue(var_f99434b1, perkindex);
		var_98d32f1c = createuimodel(inventoryuimodel, "quickConsumeNetworkId");
		setuimodelvalue(var_98d32f1c, var_bd027dd9);
	}
	else
	{
		function_9f5d2dc8(localclientnum);
	}
}

/*
	Name: function_1470ccfe
	Namespace: item_inventory
	Checksum: 0x6B92B21
	Offset: 0x1E70
	Size: 0xEE
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1470ccfe(localclientnum, item)
{
	clientdata = item_world::function_a7e98a1a(localclientnum);
	for(i = 0; i < 5; i++)
	{
		currentitem = clientdata.inventory.items[i];
		if(currentitem.var_bd027dd9 == 32767 || !namespace_a0d533d1::function_73593286(item.var_a6762160, currentitem.var_a6762160) || !isdefined(currentitem.availableaction) || item.availableaction != currentitem.availableaction)
		{
			continue;
		}
		return currentitem.var_bd027dd9;
	}
	return undefined;
}

/*
	Name: function_9b83c65d
	Namespace: item_inventory
	Checksum: 0x615FA649
	Offset: 0x1F68
	Size: 0xBA2
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9b83c65d(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("179a6a1d25a3afbb");
	self endon("179a6a1d25a3afbb");
	clientdata = item_world::function_a7e98a1a(localclientnum);
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
			inventoryitem = function_15d578f4(localclientnum, waitresult.id);
			function_22759012(localclientnum, inventoryitem.var_bd027dd9);
		}
		else
		{
			if(waitresult._notify === var_17bdd1c3)
			{
				inventoryitem = function_15d578f4(localclientnum, waitresult.id);
				var_bd027dd9 = function_1470ccfe(localclientnum, inventoryitem);
				function_22759012(localclientnum, (isdefined(var_bd027dd9) ? inventoryitem.var_bd027dd9 : var_bd027dd9));
				continue;
			}
			else
			{
				if(waitresult._notify === var_6a10d173)
				{
					currentindex = function_535a5a06(localclientnum, 0);
					perksarray = function_f3ef5269(localclientnum);
					if(isdefined(perksarray[currentindex]))
					{
						inventoryitem = perksarray[currentindex];
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
						inventoryitem = clientdata.inventory.items[11];
						if(!isdefined(inventoryitem) || inventoryitem.var_bd027dd9 === 32767 || inventoryitem.var_a6762160.itemtype !== #"armor_shard")
						{
							if(waitresult._notify === var_e2d1f454)
							{
								inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
								var_3ea10284 = createuimodel(inventoryuimodel, "armorShardNotAvailable");
								forcenotifyuimodel(var_3ea10284);
							}
							continue;
						}
						var_a3162739 = isdefined(clientdata.inventory.var_f3518190) && inventoryitem == clientdata.inventory.var_f3518190.item;
						if(waitresult._notify === var_e2d1f454)
						{
							if(!function_e23e5e85(localclientnum) || inventoryitem.count == 0 || !function_10861362(localclientnum))
							{
								self playsound(localclientnum, #"uin_default_action_denied");
								inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
								var_3ea10284 = createuimodel(inventoryuimodel, "armorShardNotAvailable");
								forcenotifyuimodel(var_3ea10284);
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
		if(!isdefined(inventoryitem.var_a6762160.casttime) || inventoryitem.var_a6762160.casttime <= 0)
		{
			function_97fedb0d(localclientnum, 4, inventoryitem.var_bd027dd9);
			continue;
		}
		var_eaae8ced = 0;
		if(isdefined(clientdata.inventory.consumed.items) && isarray(clientdata.inventory.consumed.items))
		{
			foreach(consumeditem in clientdata.inventory.consumed.items)
			{
				if(isdefined(consumeditem.var_a6762160.talents) && isarray(consumeditem.var_a6762160.talents))
				{
					foreach(talent in consumeditem.var_a6762160.talents)
					{
						if(talent.talent == #"talent_consumer_wz")
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
		if(isdefined(clientdata.inventory.var_f3518190))
		{
			if(inventoryitem != clientdata.inventory.var_f3518190.item)
			{
				setuimodelvalue(createuimodel(clientdata.inventory.var_f3518190.item.itemuimodel, "castTimeFraction"), 0, 0);
				playsound(localclientnum, #"hash_4d31bd9927d823c3");
				var_f3518190 = spawnstruct();
				var_f3518190.item = inventoryitem;
				var_f3518190.caststart = gettime();
				var_f3518190.castend = var_f3518190.caststart + (int((isdefined((var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime)) ? (var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime) : 0) * 1000));
				clientdata.inventory.var_f3518190 = var_f3518190;
				function_de74158f(localclientnum, var_f3518190.item.var_bd027dd9);
				clientdata.inventory.var_4d4ec560 = inventoryitem.var_bd027dd9;
			}
			else
			{
				setuimodelvalue(createuimodel(clientdata.inventory.var_f3518190.item.itemuimodel, "castTimeFraction"), 0, 0);
				setuimodelvalue(clientdata.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
				clientdata.inventory.var_f3518190 = undefined;
				clientdata.inventory.var_4d4ec560 = undefined;
			}
		}
		else if(!isdefined(clientdata.inventory.var_4d4ec560) || clientdata.inventory.var_4d4ec560 != inventoryitem.var_bd027dd9)
		{
			playsound(localclientnum, #"hash_4d31bd9927d823c3");
			var_f3518190 = spawnstruct();
			var_f3518190.item = inventoryitem;
			var_f3518190.caststart = gettime();
			var_f3518190.castend = var_f3518190.caststart + (int((isdefined((var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime)) ? (var_eaae8ced ? var_f3518190.item.var_a6762160.casttime * 0.5 : var_f3518190.item.var_a6762160.casttime) : 0) * 1000));
			clientdata.inventory.var_f3518190 = var_f3518190;
			function_de74158f(localclientnum, var_f3518190.item.var_bd027dd9);
			clientdata.inventory.var_4d4ec560 = inventoryitem.var_bd027dd9;
		}
	}
}

/*
	Name: function_ac4df751
	Namespace: item_inventory
	Checksum: 0x99B90103
	Offset: 0x2B18
	Size: 0x4A0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ac4df751(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("3393788adbb60e13");
	self endon("3393788adbb60e13");
	clientdata = item_world::function_a7e98a1a(localclientnum);
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
			itemid = item_world::function_28b42f1c(localclientnum, var_bd027dd9);
			if(itemid != 32767)
			{
				if(function_6d9d9cd7(waitresult.selectedindex))
				{
					inventoryitem = clientdata.inventory.items[waitresult.selectedindex];
					if(isdefined(inventoryitem) && !function_ee44351a(localclientnum, inventoryitem))
					{
						continue;
					}
				}
				if(isdefined(clientdata.inventory.var_f3518190) && clientdata.inventory.var_f3518190.item.id == itemid)
				{
					clientdata.inventory.var_f3518190 = undefined;
					clientdata.inventory.var_4d4ec560 = undefined;
					setuimodelvalue(clientdata.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
				}
				function_97fedb0d(localclientnum, 5, var_bd027dd9, count);
			}
		}
		else
		{
			if(waitresult._notify === var_ffec0c46 || waitresult._notify === var_fcd005cc)
			{
				var_4838b749 = (isdefined(waitresult.slotid) ? array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1)[waitresult.slotid] : function_d768ea30(localclientnum));
				if(isdefined(var_4838b749))
				{
					var_bd027dd9 = item_world_util::function_970b8d86(var_4838b749);
					function_97fedb0d(localclientnum, 5, var_bd027dd9);
				}
			}
			else if(waitresult._notify === var_46a7a0e3 || waitresult._notify === var_3d759450)
			{
				var_4838b749 = (isdefined(waitresult.slotid) ? array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1)[waitresult.slotid] : function_d768ea30(localclientnum));
				if(isdefined(var_4838b749))
				{
					var_bd027dd9 = item_world_util::function_970b8d86(var_4838b749);
					function_97fedb0d(localclientnum, 8, var_bd027dd9);
				}
			}
		}
	}
}

/*
	Name: function_8edef5cc
	Namespace: item_inventory
	Checksum: 0x322B3BA
	Offset: 0x2FC0
	Size: 0x1D0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8edef5cc(localclientnum, inventoryitem)
{
	data = item_world::function_a7e98a1a(localclientnum);
	slot = function_daf3ebda(localclientnum, inventoryitem.var_a6762160);
	if(!isdefined(slot))
	{
		slot = self function_78ed4455(localclientnum, inventoryitem.var_a6762160);
	}
	if(isdefined(slot))
	{
		if(inventoryitem.var_a6762160.type != #"attachment")
		{
			item = data.inventory.items[slot];
			setuimodelvalue(createuimodel(item.itemuimodel, "focusTarget"), 1);
		}
	}
	else if(function_ad4c6116(localclientnum, inventoryitem.var_a6762160))
	{
		for(i = 0; i < data.inventory.var_c212de25; i++)
		{
			if(data.inventory.items[i].var_bd027dd9 === 32767)
			{
				setuimodelvalue(createuimodel(data.inventory.items[i].itemuimodel, "focusTarget"), 1);
				break;
			}
		}
	}
}

/*
	Name: function_96ce9058
	Namespace: item_inventory
	Checksum: 0x70D590F2
	Offset: 0x3198
	Size: 0x178
	Parameters: 4
	Flags: Linked, Private
*/
function private function_96ce9058(localclientnum, var_6c2b2289, inventoryitem, item)
{
	level endon(var_6c2b2289);
	self notify("6e9aa99adae2490e");
	self endon("6e9aa99adae2490e");
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
					value = stats::get_stat_global(localclientnum, item.var_a6762160.objectives[i].var_7e835304);
					if(isdefined(value) && value != var_1ce96a13[i])
					{
						var_1ce96a13[i] = value;
						function_39b663b7(localclientnum, inventoryitem, item);
					}
				}
			}
		}
	}
}

/*
	Name: function_7f35a045
	Namespace: item_inventory
	Checksum: 0x5987A6D7
	Offset: 0x3318
	Size: 0x99C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7f35a045(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("26a9a816baee50ca");
	self endon("26a9a816baee50ca");
	clientdata = item_world::function_a7e98a1a(localclientnum);
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
		foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
		{
			foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
			{
				var_f9f8c0b5 = var_4838b749 + var_259f58f3;
				item = data.inventory.items[var_f9f8c0b5];
				setuimodelvalue(createuimodel(item.itemuimodel, "focusTarget"), 0);
				setuimodelvalue(createuimodel(item.itemuimodel, "notAvailable"), 0);
			}
		}
		setuimodelvalue(createuimodel(data.inventory.items[6].itemuimodel, "focusTarget"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[8].itemuimodel, "focusTarget"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[7].itemuimodel, "focusTarget"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[5].itemuimodel, "focusTarget"), 0);
		for(i = 0; i < 5; i++)
		{
			setuimodelvalue(createuimodel(data.inventory.items[i].itemuimodel, "focusTarget"), 0);
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
		inventoryitem = function_15d578f4(localclientnum, var_bd027dd9);
		if(isdefined(inventoryitem) && 32767 != inventoryitem.id)
		{
			item = function_b1702735(inventoryitem.id);
			if(isdefined(item) && isdefined(item.var_a6762160))
			{
				self thread function_96ce9058(localclientnum, var_6c2b2289, inventoryitem, item);
			}
		}
		if(!isdefined(inventoryitem) && item_world::function_a5c2a6b8(localclientnum) && self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2)
		{
			arrayremovevalue(data.groupitems, undefined, 0);
			for(index = 0; index < data.groupitems.size; index++)
			{
				var_81bb13f5 = data.groupitems[index];
				if(var_81bb13f5.var_bd027dd9 === var_bd027dd9)
				{
					if(var_81bb13f5.var_a6762160.itemtype != #"ammo" && var_81bb13f5.var_a6762160.itemtype != #"weapon")
					{
						inventoryitem = var_81bb13f5;
						function_8edef5cc(localclientnum, inventoryitem);
					}
					break;
				}
			}
		}
		if(!isdefined(inventoryitem) || !isdefined(inventoryitem.var_a6762160) || inventoryitem.var_a6762160.itemtype !== #"attachment")
		{
			continue;
		}
		var_a4250c2b = function_d768ea30(localclientnum);
		foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
		{
			weaponitem = data.inventory.items[var_4838b749];
			if(weaponitem.id === 32767)
			{
				continue;
			}
			var_ceefbd10 = namespace_a0d533d1::function_837f4a57(inventoryitem.var_a6762160);
			var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_ceefbd10);
			attachmentname = namespace_a0d533d1::function_2ced1d34(weaponitem, inventoryitem.var_a6762160);
			var_86364446 = data.inventory.items[var_f9f8c0b5];
			if(isdefined(attachmentname))
			{
				if(var_bd027dd9 != var_86364446.var_bd027dd9)
				{
					setuimodelvalue(createuimodel(var_86364446.itemuimodel, "focusTarget"), 1);
				}
				var_fdc9fcff = (var_a4250c2b == (17 + 1) ? ((17 + 1) + 8) + 1 : 17 + 1);
				if(var_fdc9fcff == var_4838b749)
				{
					setuimodelvalue(level.var_6d21daaf[localclientnum], 1);
				}
				continue;
			}
			setuimodelvalue(createuimodel(var_86364446.itemuimodel, "notAvailable"), 1);
		}
	}
}

/*
	Name: function_2ae9881d
	Namespace: item_inventory
	Checksum: 0x1F5FF6DD
	Offset: 0x3CC0
	Size: 0x212
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2ae9881d(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("2efea69b7a720b0c");
	self endon("2efea69b7a720b0c");
	clientdata = item_world::function_a7e98a1a(localclientnum);
	while(!isdefined(clientdata))
	{
		waitframe(1);
		clientdata = item_world::function_a7e98a1a(localclientnum);
	}
	var_f3efb06b = "cycle_health" + localclientnum;
	var_db83305d = "cycle_equipment" + localclientnum;
	var_d991a20a = "cycle_scorestreak" + localclientnum;
	var_58ea832 = "cycle_field_upgrade" + localclientnum;
	clientdata.var_cb55ac3c = gettime();
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_f3efb06b, var_db83305d, var_d991a20a, var_58ea832);
		if(gettime() - clientdata.var_cb55ac3c < 200)
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
		clientdata.var_cb55ac3c = gettime();
	}
}

/*
	Name: function_53854c4
	Namespace: item_inventory
	Checksum: 0xBFCE9D06
	Offset: 0x3EE0
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
	clientdata = item_world::function_a7e98a1a(localclientnum);
	currentitem = self.var_9b882d22;
	if(!isdefined(currentitem) || !isdefined(currentitem.var_a6762160))
	{
		return false;
	}
	var_512ddf16 = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2;
	if(item_world_util::function_83c20f83(self.var_9b882d22) && !var_512ddf16)
	{
		return false;
	}
	if(var_512ddf16 && self.var_54d9f4a6)
	{
		return false;
	}
	origin = getlocalclienteyepos(localclientnum);
	if(distance2dsquared(origin, currentitem.origin) > sqr(128) || (abs(origin[2] - currentitem.origin[2])) > 128)
	{
		return false;
	}
	if(!isdefined(currentitem.var_a6762160))
	{
		return false;
	}
	var_fc7876fd = 0;
	if(!function_ad4c6116(localclientnum, currentitem.var_a6762160))
	{
		swap = 0;
		data = item_world::function_a7e98a1a(localclientnum);
		switch(currentitem.var_a6762160.itemtype)
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
		function_97fedb0d(localclientnum, 7, currentitem.var_bd027dd9, 2);
		return true;
	}
	switch(currentitem.var_a6762160.itemtype)
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
	function_97fedb0d(localclientnum, 7, currentitem.var_bd027dd9, var_fc7876fd);
	return true;
}

/*
	Name: function_6d9d9cd7
	Namespace: item_inventory
	Checksum: 0x3CF5321
	Offset: 0x42C0
	Size: 0x12C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6d9d9cd7(slotid)
{
	/#
		assert(isint(slotid));
	#/
	foreach(slot in array(5, 6, 12, 7, 13, 8, 17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1, 14, 15, 16, 17))
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
	Namespace: item_inventory
	Checksum: 0x601E0295
	Offset: 0x43F8
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
					item.itemuimodel = createuimodel(consumed.uimodel, "item" + (var_cfa0e915.size - 1));
					function_1a99656a(localclientnum, item, item.var_bd027dd9, item.id, 0, 0, 0, 0);
				}
				frac = 1;
				if(duration > 0)
				{
					frac = 1 - (timeremaining / duration);
				}
				setuimodelvalue(createuimodel(item.itemuimodel, "endStartFraction"), frac, 0);
			}
			var_f3518190 = data.inventory.var_f3518190;
			if(isdefined(var_f3518190) && var_f3518190.item.id != 32767)
			{
				duration = var_f3518190.castend - var_f3518190.caststart;
				timeremaining = var_f3518190.castend - time;
				if(timeremaining <= 0)
				{
					function_97fedb0d(localclientnum, 4, var_f3518190.item.var_bd027dd9);
					setuimodelvalue(createuimodel(var_f3518190.item.itemuimodel, "castTimeFraction"), 0, 0);
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
					setuimodelvalue(createuimodel(var_f3518190.item.itemuimodel, "castTimeFraction"), 1 - (timeremaining / duration), 0);
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
				setuimodelvalue(createuimodel(item.itemuimodel, "endStartFraction"), frac, 0);
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
	Namespace: item_inventory
	Checksum: 0x7193DF12
	Offset: 0x4B40
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
	Namespace: item_inventory
	Checksum: 0x9213900A
	Offset: 0x4BC0
	Size: 0x1FCC
	Parameters: 10
	Flags: Linked, Private
*/
function private function_1a99656a(localclientnum, inventoryitem, var_bd027dd9, itemid, count, totalcount, availableaction, var_e35261f6, var_189fcf49, var_1204dfe9)
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
	if(itemid == 32767 && isdefined(inventoryitem.var_bd027dd9) && inventoryitem.var_bd027dd9 != 32767)
	{
		data = level.var_d342a3fd[localclientnum];
	}
	else
	{
		if(itemid != 32767 && inventoryitem.var_bd027dd9 === 32767)
		{
			data = level.var_d342a3fd[localclientnum];
		}
		else if(isdefined(inventoryitem.var_a6762160) && (inventoryitem.var_a6762160.itemtype === #"armor_shard" || inventoryitem.var_a6762160.itemtype === #"scorestreak" || item_world_util::function_a57773a4(inventoryitem.var_a6762160)))
		{
			data = level.var_d342a3fd[localclientnum];
		}
	}
	var_dbce1e30 = 0;
	if(inventoryitem.id === itemid && isdefined(inventoryitem.count) && inventoryitem.count > count)
	{
		var_dbce1e30 = 1;
		if(isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"armor_shard")
		{
			clientdata = item_world::function_a7e98a1a(localclientnum);
			if(isdefined(clientdata) && isdefined(clientdata.inventory) && var_bd027dd9 === clientdata.inventory.var_4d4ec560)
			{
				clientdata.inventory.var_4d4ec560 = undefined;
			}
		}
	}
	player = function_27673a7(localclientnum);
	var_1bd87f37 = 1;
	if(isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype == #"armor_shard" && var_bd027dd9 == 32767 && var_1204dfe9 == 0)
	{
		var_1bd87f37 = 0;
	}
	var_e3f9d92b = item_world_util::function_a57773a4(inventoryitem.var_a6762160);
	var_75b43169 = isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"scorestreak";
	var_d5042302 = isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"attachment";
	var_1c54cff7 = inventoryitem.var_a6762160;
	if(var_1bd87f37)
	{
		inventoryitem.id = itemid;
		inventoryitem.var_bd027dd9 = var_bd027dd9;
	}
	else
	{
		itemid = inventoryitem.id;
		var_bd027dd9 = inventoryitem.var_bd027dd9;
	}
	inventoryitem.count = count;
	inventoryitem.var_a6762160 = (32767 == itemid ? undefined : function_b1702735(itemid).var_a6762160);
	inventoryitem.availableaction = availableaction;
	inventoryitem.consumable = (isdefined(inventoryitem.var_a6762160) ? inventoryitem.var_a6762160.consumable : undefined);
	inventoryitem.quickequip = 0;
	if(var_e35261f6)
	{
		inventoryitem.starttime = undefined;
		inventoryitem.endtime = undefined;
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "endStartFraction"), 0, 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTimeFraction"), 0, 0);
	}
	setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "id"), inventoryitem.var_bd027dd9);
	setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "realId"), inventoryitem.id);
	setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "stackCount"), count);
	if(isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype == #"armor_shard")
	{
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "totalCount"), count);
	}
	else
	{
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "totalCount"), totalcount);
	}
	item = undefined;
	if(itemid != 32767)
	{
		item = function_b1702735(itemid);
	}
	if(itemid == 32767 || !isdefined(item.var_a6762160))
	{
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "name"), #"");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "icon"), #"blacktransparent");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rarity"), "None");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "availableAction"), availableaction);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "stowedAvailableAction"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "canTransferAttachment"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "consumable"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "assetName"), #"");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "description"), #"");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTime"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "type"), "");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "equipped"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "endStartFraction"), 0, 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTimeFraction"), 0, 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "notAvailable"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "notAccessible"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "focusTarget"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "cycle"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "armorMax"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "hasAttachments"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "supportsAttachments"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "unlockableItemRef"), #"");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quote"), #"");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rewardName"), #"");
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "ammoType"), #"");
		function_442857e2(localclientnum, var_1c54cff7);
	}
	else
	{
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "name"), item_world::get_item_name(item.var_a6762160));
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "icon"), (isdefined(item.var_a6762160.icon) ? item.var_a6762160.icon : #"blacktransparent"));
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rarity"), (isdefined(item.var_a6762160.rarity) ? item.var_a6762160.rarity : "None"));
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "assetName"), function_fe189514(item.var_a6762160));
		armormax = 0;
		if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype == #"armor")
		{
			armormax = (isdefined(item.var_a6762160.amount) ? item.var_a6762160.amount : 0);
		}
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "armorMax"), armormax);
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
				setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "notAccessible"), 1);
				description = (isdefined(item.var_a6762160.var_3b8219fd) ? item.var_a6762160.var_3b8219fd : description);
			}
		}
		if(isdefined(item.var_a6762160) && item.var_a6762160.itemtype === #"weapon")
		{
			supportsattachments = namespace_a0d533d1::function_4bd83c04(item);
			setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "supportsAttachments"), supportsattachments);
			var_754fe8c5 = getweaponammotype(item.var_a6762160.weapon);
			if(isdefined(level.var_c53d118f) && isdefined(level.var_c53d118f[var_754fe8c5]))
			{
				setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "ammoType"), level.var_c53d118f[var_754fe8c5]);
			}
			else
			{
				setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "ammoType"), #"");
			}
		}
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "description"), description);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "castTime"), (isdefined(item.var_a6762160.casttime) ? item.var_a6762160.casttime : 0));
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "type"), item.var_a6762160.itemtype);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "equipped"), isdefined(inventoryitem.endtime));
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "availableAction"), availableaction);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "stowedAvailableAction"), 0);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "consumable"), 0);
		if(isdefined(item.var_a6762160.unlockableitemref))
		{
			function_39b663b7(localclientnum, inventoryitem, item);
		}
		else
		{
			setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "unlockableItemRef"), #"");
			setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quote"), #"");
			setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rewardName"), #"");
		}
		if(!var_189fcf49)
		{
			function_442857e2(localclientnum, (isdefined(inventoryitem.var_a6762160) ? inventoryitem.var_a6762160 : var_1c54cff7));
		}
		if(count != 0 && !var_dbce1e30)
		{
			function_8ffee46f(localclientnum, inventoryitem);
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
		inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		setuimodelvalue(createuimodel(inventoryuimodel, "filledSlots"), filledslots);
		setuimodelvalue(createuimodel(inventoryuimodel, "canUseQuickInventory"), canusequickinventory);
		var_a966c73b = data.inventory.items[10];
		if(var_a966c73b.var_bd027dd9 != 32767)
		{
			setuimodelvalue(createuimodel(inventoryuimodel, "resourceCount"), 2);
		}
		else
		{
			setuimodelvalue(createuimodel(inventoryuimodel, "resourceCount"), 1);
		}
		if(var_e3f9d92b)
		{
			function_950ae846(localclientnum);
		}
		if(var_75b43169)
		{
			function_b5b6a9a4(localclientnum);
		}
		if(itemid !== 32767 && isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"weapon")
		{
			foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
			{
				if(data.inventory.items[var_4838b749].var_bd027dd9 === var_bd027dd9)
				{
					attachmentslots = array("attachSlotOptics", "attachSlotMuzzle", "attachSlotBarrel", "attachSlotUnderbarrel", "attachSlotBody", "attachSlotMagazine", "attachSlotHandle", "attachSlotStock");
					foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
					{
						slot = attachmentslots[index];
						var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
						attachmentitem = data.inventory.items[var_f9f8c0b5];
						if(!isdefined(inventoryitem.var_a6762160.(slot)))
						{
							setuimodelvalue(createuimodel(attachmentitem.itemuimodel, "disabled"), 1);
							continue;
						}
						setuimodelvalue(createuimodel(attachmentitem.itemuimodel, "disabled"), 0);
					}
					break;
				}
			}
		}
		if(itemid !== 32767 && isdefined(inventoryitem.var_a6762160) && inventoryitem.var_a6762160.itemtype === #"attachment")
		{
			var_f9f8c0b5 = item_world_util::function_808be9a3(inventoryitem.var_bd027dd9);
			var_2cf6fb05 = undefined;
			foreach(var_4838b749 in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
			{
				if(namespace_a0d533d1::function_398b9770(var_4838b749, var_f9f8c0b5))
				{
					var_2cf6fb05 = var_4838b749;
					break;
				}
			}
			if(isdefined(var_2cf6fb05))
			{
				function_cb7cfe5b(localclientnum, var_2cf6fb05, inventoryitem);
				hasattachments = has_attachments(localclientnum, var_2cf6fb05);
				var_508262d4 = data.inventory.items[var_2cf6fb05];
				if(hasattachments)
				{
					setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 1);
				}
				else
				{
					setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 0);
				}
			}
			else
			{
				var_a4250c2b = player function_d768ea30(localclientnum);
				function_cb7cfe5b(localclientnum, var_a4250c2b, inventoryitem);
			}
			function_ce628f27(localclientnum);
		}
		else if(var_d5042302)
		{
			var_a4250c2b = player function_d768ea30(localclientnum);
			hasattachments = has_attachments(localclientnum, var_a4250c2b);
			if(isdefined(var_a4250c2b))
			{
				var_508262d4 = data.inventory.items[var_a4250c2b];
				if(hasattachments)
				{
					setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 1);
				}
				else
				{
					setuimodelvalue(createuimodel(var_508262d4.itemuimodel, "hasAttachments"), 0);
				}
			}
			function_deddbdf0(localclientnum, var_a4250c2b);
			function_ce628f27(localclientnum);
		}
	}
}

/*
	Name: function_2ecc089c
	Namespace: item_inventory
	Checksum: 0x43EBEF5B
	Offset: 0x6B98
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
	currentitem = data.inventory.items[var_67bed85d];
	var_7007b688 = [];
	if(isdefined(currentitem.var_a6762160))
	{
		var_7007b688 = item_world_util::function_4cbb6617(data.inventory, type, var_bd4c63f1, currentitem.var_a6762160);
	}
	for(index = 0; index < var_7007b688.size && index < var_9286261; index++)
	{
		item = var_a3a763a3[index];
		inventoryitem = var_7007b688[index];
		function_1a99656a(localclientnum, item, inventoryitem.var_bd027dd9, inventoryitem.id, inventoryitem.count, function_bba770de(localclientnum, inventoryitem.var_a6762160), inventoryitem.availableaction, undefined, 1);
		setuimodelvalue(createuimodel(item.itemuimodel, "cycle"), 1);
		forcenotifyuimodel(createuimodel(item.itemuimodel, "totalCount"));
	}
	for(index = var_7007b688.size; index < var_9286261; index++)
	{
		item = var_a3a763a3[index];
		function_1a99656a(localclientnum, item, 32767, 32767, 0, 0, 0, undefined, 1);
		setuimodelvalue(createuimodel(item.itemuimodel, "cycle"), 0);
	}
}

/*
	Name: function_442857e2
	Namespace: item_inventory
	Checksum: 0x899030F
	Offset: 0x6E08
	Size: 0xC7C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_442857e2(localclientnum, var_a6762160)
{
	if(!isdefined(var_a6762160))
	{
		return;
	}
	if(var_a6762160.itemtype !== #"equipment" && var_a6762160.itemtype !== #"field_upgrade" && var_a6762160.itemtype !== #"tactical" && var_a6762160.itemtype !== #"generic" && var_a6762160.itemtype !== #"health" && var_a6762160.itemtype !== #"killstreak" && var_a6762160.itemtype !== #"scorestreak" && var_a6762160.itemtype !== #"attachment" && var_a6762160.itemtype !== #"armor_shard")
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
				inventoryitem = data.inventory.items[var_f9f8c0b5];
				if(inventoryitem.var_bd027dd9 != 32767 && namespace_a0d533d1::function_73593286(var_a6762160, inventoryitem.var_a6762160))
				{
					var_6962e967 = 1;
					break;
				}
			}
		}
	}
	else
	{
		if(var_a6762160.itemtype == #"armor_shard")
		{
			inventoryitem = data.inventory.items[11];
		}
		else
		{
			foreach(slot in array(5, 6, 12, 7, 13, 8, 17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1, 14, 15, 16, 17))
			{
				inventoryitem = data.inventory.items[slot];
				if(inventoryitem.var_bd027dd9 != 32767 && namespace_a0d533d1::function_73593286(var_a6762160, inventoryitem.var_a6762160))
				{
					var_6962e967 = 1;
					break;
				}
			}
		}
	}
	totalcount = function_bba770de(localclientnum, var_a6762160);
	if(var_a6762160.itemtype == #"armor_shard")
	{
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), totalcount > 0);
	}
	else
	{
		var_6d4bb070 = 0;
		for(index = 0; index < 5; index++)
		{
			inventoryitem = data.inventory.items[index];
			if(inventoryitem.var_bd027dd9 == 32767 || !namespace_a0d533d1::function_73593286(var_a6762160, inventoryitem.var_a6762160))
			{
				continue;
			}
			if(var_6962e967 || var_6d4bb070 || isdefined(inventoryitem.endtime))
			{
				setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), 0);
				inventoryitem.quickequip = 0;
			}
			else if(!var_6d4bb070)
			{
				setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quickEquip"), 1);
				inventoryitem.quickequip = 1;
				var_6d4bb070 = 1;
			}
			setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "totalCount"), totalcount);
		}
	}
	if(var_a6762160.itemtype === #"health")
	{
		function_2ecc089c(localclientnum, 5, #"health", array(#"health_item_small", #"health_item_medium", #"health_item_large", #"health_item_squad", #"hash_20699a922abaf2e1"), 2, data.inventory.healthitems);
	}
	else
	{
		if(var_a6762160.itemtype === #"equipment")
		{
			function_2ecc089c(localclientnum, 7, #"equipment", array(#"frag_grenade_wz_item", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"acid_bomb_wz_item", #"molotov_wz_item", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"wraithfire_wz_item", #"hatchet_wz_item", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"tomahawk_t8_wz_item", #"seeker_mine_wz_item", #"dart_wz_item", #"hawk_wz_item", #"ultimate_turret_wz_item", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de", #"grapple_wz_item", #"hash_12fde8b0da04d262", #"barricade_wz_item", #"spiked_barrier_wz_item", #"trophy_system_wz_item", #"concertina_wire_wz_item", #"sensor_dart_wz_item", #"supply_pod_wz_item", #"trip_wire_wz_item", #"cymbal_monkey_wz_item", #"homunculus_wz_item", #"vision_pulse_wz_item", #"flare_gun_wz_item", #"wz_snowball", #"wz_waterballoon", #"hash_1ae9ade20084359f"), 2, data.inventory.equipmentitems);
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
	Namespace: item_inventory
	Checksum: 0x959524CF
	Offset: 0x7A90
	Size: 0x56C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_39b663b7(localclientnum, inventoryitem, item)
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
			objectivemodel = createuimodel(var_10d25c94, "objective" + (i + 1));
			if(!isdefined(objectivemodel))
			{
				continue;
			}
			if(!isdefined(getuimodel(objectivemodel, "state")))
			{
				setuimodelvalue(createuimodel(objectivemodel, "state"), 0);
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
					var_2571317b = setuimodelvalue(createuimodel(objectivemodel, "unlockProgress"), stats::get_stat_global(localclientnum, item.var_a6762160.objectives[i].var_7e835304));
				}
				else
				{
					setuimodelvalue(createuimodel(objectivemodel, "unlockProgress"), -1);
				}
				if(!setuimodelvalue(createuimodel(objectivemodel, "description"), description) && var_2571317b)
				{
					forcenotifyuimodel(createuimodel(objectivemodel, "description"));
				}
				continue;
			}
			setuimodelvalue(createuimodel(objectivemodel, "unlockProgress"), -1);
			setuimodelvalue(createuimodel(objectivemodel, "description"), #"");
		}
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "unlockableItemRef"), item.var_a6762160.unlockableitemref);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "quote"), item.var_a6762160.var_e8b98a8a);
		setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "rewardName"), item.var_a6762160.rewardname);
	}
}

/*
	Name: function_cb7cfe5b
	Namespace: item_inventory
	Checksum: 0x77C53986
	Offset: 0x8008
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
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 0);
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 1);
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
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 0);
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 1);
		if(var_cdef462d)
		{
			setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 0);
			return;
		}
	}
	var_ceefbd10 = namespace_a0d533d1::function_837f4a57(var_ac517de7.var_a6762160);
	if(isdefined(namespace_a0d533d1::function_2ced1d34(var_ac044d12, var_ac517de7.var_a6762160)))
	{
		var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_a4250c2b, var_ceefbd10);
		if(data.inventory.items[var_f9f8c0b5].var_bd027dd9 !== 32767)
		{
			setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 3);
		}
		else
		{
			setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 2);
		}
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 0);
		function_442857e2(localclientnum, var_ac517de7.var_a6762160);
	}
	else
	{
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "availableAction"), 0);
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "notAvailable"), 1);
	}
	if(var_cdef462d)
	{
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 0);
		return;
	}
	if(isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160)))
	{
		var_50f8a92d = namespace_a0d533d1::function_dfaca25e(var_fdc9fcff, var_ceefbd10);
		if(data.inventory.items[var_50f8a92d].var_bd027dd9 !== 32767)
		{
			setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 3);
		}
		else
		{
			setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 2);
		}
	}
	else
	{
		setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "stowedAvailableAction"), 0);
	}
}

/*
	Name: function_deddbdf0
	Namespace: item_inventory
	Checksum: 0x20A21285
	Offset: 0x8648
	Size: 0x9C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_deddbdf0(localclientnum, var_f7956021)
{
	data = item_world::function_a7e98a1a(localclientnum);
	for(itemindex = 0; itemindex < data.inventory.var_c212de25; itemindex++)
	{
		inventoryitem = data.inventory.items[itemindex];
		function_cb7cfe5b(localclientnum, var_f7956021, inventoryitem);
	}
}

/*
	Name: function_950ae846
	Namespace: item_inventory
	Checksum: 0x41BC83E8
	Offset: 0x86F0
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_950ae846(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	for(itemindex = 0; itemindex < data.inventory.var_c212de25; itemindex++)
	{
		inventoryitem = data.inventory.items[itemindex];
		if(!isdefined(inventoryitem.var_a6762160) || !item_world_util::function_a57773a4(inventoryitem.var_a6762160))
		{
			continue;
		}
		availableaction = function_30697356(localclientnum, inventoryitem.var_a6762160);
		if(inventoryitem.availableaction != availableaction)
		{
			totalcount = function_bba770de(localclientnum, inventoryitem.var_a6762160);
			function_1a99656a(localclientnum, inventoryitem, inventoryitem.var_bd027dd9, inventoryitem.id, inventoryitem.count, totalcount, availableaction);
		}
	}
}

/*
	Name: function_b5b6a9a4
	Namespace: item_inventory
	Checksum: 0xDA06533A
	Offset: 0x8848
	Size: 0x14C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b5b6a9a4(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	for(itemindex = 0; itemindex < data.inventory.var_c212de25; itemindex++)
	{
		inventoryitem = data.inventory.items[itemindex];
		if(!isdefined(inventoryitem.var_a6762160) || inventoryitem.var_a6762160.itemtype != #"scorestreak")
		{
			continue;
		}
		availableaction = function_30697356(localclientnum, inventoryitem.var_a6762160);
		if(inventoryitem.availableaction != availableaction)
		{
			totalcount = function_bba770de(localclientnum, inventoryitem.var_a6762160);
			function_1a99656a(localclientnum, inventoryitem, inventoryitem.var_bd027dd9, inventoryitem.id, inventoryitem.count, totalcount, availableaction);
		}
	}
}

/*
	Name: function_ce628f27
	Namespace: item_inventory
	Checksum: 0x8DC60833
	Offset: 0x89A0
	Size: 0x42C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ce628f27(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	foreach(var_a4250c2b in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
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
					setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 2);
					continue;
				}
				setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 0);
				continue;
			}
			if(isdefined(namespace_a0d533d1::function_2ced1d34(var_ffd2f6e4, var_ac517de7.var_a6762160)) && isdefined(namespace_a0d533d1::function_2ced1d34(var_ac044d12, var_3c2da577.var_a6762160)))
			{
				setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 3);
				continue;
			}
			setuimodelvalue(createuimodel(var_ac517de7.itemuimodel, "canTransferAttachment"), 0);
		}
	}
}

/*
	Name: is_inventory_item
	Namespace: item_inventory
	Checksum: 0xDBB49627
	Offset: 0x8DD8
	Size: 0x58
	Parameters: 2
	Flags: Linked
*/
function is_inventory_item(localclientnum, var_a6762160)
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
	Namespace: item_inventory
	Checksum: 0x1B61669C
	Offset: 0x8E38
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
	Namespace: item_inventory
	Checksum: 0xB9D61F7F
	Offset: 0x8E70
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
	maxstack = namespace_a0d533d1::function_cfa794ca(data.inventory.var_7658cbec, var_a6762160);
	if(maxstack <= 1)
	{
		return undefined;
	}
	clientdata = item_world::function_a7e98a1a(localclientnum);
	if(var_a6762160.itemtype == #"resource")
	{
		if(item_world_util::function_41f06d9d(var_a6762160) && isdefined(clientdata.inventory) && clientdata.inventory.items[9].count < maxstack)
		{
			return 9;
		}
		var_ee79c3a4 = clientdata.inventory.items[10];
		if(!isdefined(var_ee79c3a4.id) || var_ee79c3a4.id == 32767)
		{
			return 10;
		}
		if(var_ee79c3a4.var_a6762160.name !== var_a6762160.name)
		{
			return undefined;
		}
		if(var_ee79c3a4.count < maxstack)
		{
			return 10;
		}
		return undefined;
	}
	if(var_a6762160.itemtype == #"armor_shard")
	{
		if(clientdata.inventory.items[11].count < maxstack)
		{
			return 11;
		}
		return undefined;
	}
	for(i = 0; i < clientdata.inventory.items.size; i++)
	{
		if(!isdefined(clientdata.inventory.items[i].id) || clientdata.inventory.items[i].id == 32767)
		{
			continue;
		}
		inventoryitem = function_b1702735(clientdata.inventory.items[i].id);
		if(!isdefined(inventoryitem) || !isdefined(inventoryitem.var_a6762160))
		{
			continue;
		}
		if(inventoryitem.var_a6762160.name !== var_a6762160.name)
		{
			continue;
		}
		if(clientdata.inventory.items[i].count < maxstack)
		{
			return i;
		}
	}
	return undefined;
}

/*
	Name: function_3e624606
	Namespace: item_inventory
	Checksum: 0x2DF3CC28
	Offset: 0x91B0
	Size: 0x236
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3e624606(localclientnum)
{
	self endon(#"shutdown", #"death");
	self notify("3eab2700bd4abc9");
	self endon("3eab2700bd4abc9");
	clientdata = item_world::function_a7e98a1a(localclientnum);
	var_99fe8c78 = "multi_item_pickup" + localclientnum;
	var_dab12fb1 = "multi_item_pickup_stowed_weapon" + localclientnum;
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittill(var_99fe8c78, var_dab12fb1);
		if(self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2)
		{
			var_bd027dd9 = waitresult.id;
			index = item_world::function_73436347(clientdata.groupitems, var_bd027dd9);
			itemid = item_world::function_28b42f1c(localclientnum, var_bd027dd9);
			if(itemid == 32767)
			{
				continue;
			}
			if(isdefined(index))
			{
				item = function_b1702735(itemid);
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
				if(!is_inventory_item(localclientnum, item.var_a6762160))
				{
					continue;
				}
			}
		}
	}
}

/*
	Name: function_30697356
	Namespace: item_inventory
	Checksum: 0xB177647A
	Offset: 0x93F0
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
	if(var_a6762160.itemtype === #"armor_shard")
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
	Namespace: item_inventory
	Checksum: 0xFEF9CF75
	Offset: 0x9570
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
	if(!is_inventory_item(localclientnum, var_a6762160))
	{
		return 1;
	}
	if(var_a6762160.itemtype == #"resource")
	{
		if(item_world_util::function_41f06d9d(var_a6762160))
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
	if(var_a6762160.itemtype == #"armor_shard")
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
		ammoweapon = var_a6762160.weapon;
		var_1326fcc7 = (isdefined(var_1326fcc7) ? var_1326fcc7 : (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1));
		var_2f399b51 = namespace_a0d533d1::function_2879cbe0(data.inventory.var_7658cbec, ammoweapon);
		currentammostock = self getweaponammostock(localclientnum, ammoweapon);
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
	Namespace: item_inventory
	Checksum: 0x704228C0
	Offset: 0x9C50
	Size: 0x4FC
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
			foreach(var_4838b749 in namespace_a0d533d1::function_4905dddf())
			{
				if(data.inventory.items[var_4838b749].var_bd027dd9 == 32767)
				{
					return 1;
				}
			}
			return 0;
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
	Namespace: item_inventory
	Checksum: 0xB1C314BB
	Offset: 0xA158
	Size: 0x13C
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
	switch(function_9f1cc9a9(currentweapon))
	{
		case 1:
		{
			return ((17 + 1) + 8) + 1;
			break;
		}
		case 2:
		{
			return ((((17 + 1) + 8) + 1) + 8) + 1;
			break;
		}
		default:
		{
			break;
		}
	}
	return 17 + 1;
}

/*
	Name: function_78ed4455
	Namespace: item_inventory
	Checksum: 0x28D33D56
	Offset: 0xA2A0
	Size: 0x394
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
			foreach(var_4838b749 in namespace_a0d533d1::function_4905dddf())
			{
				if(data.inventory.items[var_4838b749].var_bd027dd9 == 32767)
				{
					return var_4838b749;
				}
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
	Namespace: item_inventory
	Checksum: 0xADE3DFB3
	Offset: 0xA640
	Size: 0x27C
	Parameters: 4
	Flags: Linked
*/
function function_9c4460e0(localclientnum, itemid, count, slotid)
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
		assert(isint(itemid));
	#/
	if(!isdefined(itemid))
	{
		return;
	}
	point = function_b1702735(itemid);
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
				println(("" + itemid) + "");
			#/
			return;
		}
	}
	player = function_27673a7(localclientnum);
	var_bd027dd9 = item_world_util::function_970b8d86(selectedindex);
	inventoryitem = undefined;
	if(selectedindex < data.inventory.items.size)
	{
		inventoryitem = data.inventory.items[selectedindex];
	}
	/#
		assert(isdefined(inventoryitem));
	#/
	totalcount = function_bba770de(localclientnum, var_a6762160);
	totalcount = totalcount + count;
	player function_1a99656a(localclientnum, inventoryitem, var_bd027dd9, itemid, count, totalcount, availableaction);
}

/*
	Name: function_1415f8f1
	Namespace: item_inventory
	Checksum: 0x169CEE3B
	Offset: 0xA8C8
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
		var_f0dc4e93 = item_world_util::function_970b8d86(var_4838b749);
		if(data.inventory.items[var_4838b749].var_bd027dd9 == 32767)
		{
			return;
		}
		var_ceefbd10 = namespace_a0d533d1::function_837f4a57(var_a6762160);
		var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_ceefbd10);
		weaponitem = self function_15d578f4(localclientnum, var_f0dc4e93);
		attachmentname = namespace_a0d533d1::function_2ced1d34(weaponitem, var_a6762160);
		if(isdefined(attachmentname))
		{
			return var_f9f8c0b5;
		}
	}
}

/*
	Name: function_bba770de
	Namespace: item_inventory
	Checksum: 0x7D50E5DF
	Offset: 0xAA50
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
		inventoryitem = data.inventory.items[index];
		if(!isdefined(inventoryitem.var_a6762160) || isdefined(inventoryitem.endtime))
		{
			continue;
		}
		if(name == (isdefined(inventoryitem.var_a6762160.parentname) ? inventoryitem.var_a6762160.parentname : inventoryitem.var_a6762160.name))
		{
			count = count + inventoryitem.count;
		}
	}
	return count;
}

/*
	Name: function_6b087eb4
	Namespace: item_inventory
	Checksum: 0xE553501E
	Offset: 0xABC0
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
		weapon1 = item_world_util::function_35e06774(weapon1.var_a6762160);
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
		weapon2 = item_world_util::function_35e06774(weapon2.var_a6762160);
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
	Name: can_pickup_ammo
	Namespace: item_inventory
	Checksum: 0x5E8F5C99
	Offset: 0xAD88
	Size: 0x176
	Parameters: 3
	Flags: Linked
*/
function can_pickup_ammo(localclientnum, item, var_1326fcc7)
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
	ammoweapon = var_a6762160.weapon;
	var_1326fcc7 = (isdefined(var_1326fcc7) ? var_1326fcc7 : (isdefined(var_a6762160.amount) ? var_a6762160.amount : 1));
	var_2f399b51 = namespace_a0d533d1::function_2879cbe0(data.inventory.var_7658cbec, ammoweapon);
	currentammostock = self getweaponammostock(localclientnum, ammoweapon);
	var_9b9ba643 = var_2f399b51 - currentammostock;
	addammo = int(min(var_1326fcc7, var_9b9ba643));
	return addammo > 0;
}

/*
	Name: function_85645978
	Namespace: item_inventory
	Checksum: 0x69DE4930
	Offset: 0xAF08
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
	Namespace: item_inventory
	Checksum: 0x9D4CACED
	Offset: 0xAFF8
	Size: 0x126
	Parameters: 2
	Flags: Linked
*/
function function_52e537be(localclientnum, var_bd027dd9)
{
	item = function_15d578f4(localclientnum, var_bd027dd9);
	if(isdefined(item))
	{
		setuimodelvalue(createuimodel(item.itemuimodel, "castTimeFraction"), 0, 0);
	}
	data = item_world::function_a7e98a1a(localclientnum);
	if(isdefined(data) && isdefined(data.inventory) && var_bd027dd9 === data.inventory.var_4d4ec560)
	{
		setuimodelvalue(data.inventory.consumed.var_a25538fb, function_3fe6ef04(localclientnum));
		data.inventory.var_4d4ec560 = undefined;
	}
}

/*
	Name: consume_item
	Namespace: item_inventory
	Checksum: 0x3A1C2EDF
	Offset: 0xB128
	Size: 0x4FC
	Parameters: 2
	Flags: Linked
*/
function consume_item(localclientnum, var_bd027dd9)
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
			inventoryitem = data.inventory.items[index];
			if(!isdefined(inventoryitem.endtime))
			{
				continue;
			}
			if(inventoryitem.var_a6762160.name == item.var_a6762160.name)
			{
				inventoryitem.starttime = consumeditem.starttime;
				inventoryitem.endtime = consumeditem.endtime;
			}
		}
	}
	else
	{
		consumeditem = spawnstruct();
		consumeditem.id = item.id;
		consumeditem.var_a6762160 = item.var_a6762160;
		consumeditem.itemuimodel = createuimodel(data.inventory.consumed.uimodel, "item" + var_cfa0e915.size);
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
	Namespace: item_inventory
	Checksum: 0x85365896
	Offset: 0xB630
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
	consumeditem.itemuimodel = createuimodel(data.inventory.consumed.uimodel, "item" + var_cfa0e915.size);
	var_cfa0e915[consumeditem.var_a6762160.name] = 1;
	function_1a99656a(localclientnum, consumeditem, 32767, 32767, 0, 0, 0, 0);
	function_1a99656a(localclientnum, consumeditem, var_bd027dd9, item.id, 0, 0, 0, 0);
	setuimodelvalue(data.inventory.consumed.var_a25538fb, var_cfa0e915.size);
	level thread function_451ebd83(localclientnum, item.var_a6762160, undefined);
}

/*
	Name: function_7f056944
	Namespace: item_inventory
	Checksum: 0xE2C73DE0
	Offset: 0xB8C8
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
	Namespace: item_inventory
	Checksum: 0x658409B0
	Offset: 0xB958
	Size: 0x132
	Parameters: 2
	Flags: Linked
*/
function function_3bd1836f(localclientnum, var_bd027dd9)
{
	if(var_bd027dd9 == item_world_util::function_970b8d86(8))
	{
		give_backpack(localclientnum, var_bd027dd9);
		return;
	}
	data = item_world::function_a7e98a1a(localclientnum);
	foreach(inventoryitem in data.inventory.items)
	{
		if(inventoryitem.var_bd027dd9 === var_bd027dd9)
		{
			function_8063170(inventoryitem, 1);
			playsound(localclientnum, #"hash_4d31bd9927d823c3");
			return;
		}
	}
}

/*
	Name: give_backpack
	Namespace: item_inventory
	Checksum: 0x118A10DF
	Offset: 0xBA98
	Size: 0x204
	Parameters: 2
	Flags: Linked
*/
function give_backpack(localclientnum, var_bd027dd9)
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
			inventoryitem = data.inventory.items[index];
			setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "disabled"), 0);
		}
		data.inventory.var_c212de25 = 5;
		inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		setuimodelvalue(createuimodel(inventoryuimodel, "count"), data.inventory.var_c212de25);
	}
}

/*
	Name: function_15d578f4
	Namespace: item_inventory
	Checksum: 0x15F936E
	Offset: 0xBCA8
	Size: 0x13A
	Parameters: 2
	Flags: Linked
*/
function function_15d578f4(localclientnum, var_bd027dd9)
{
	/#
		assert(isdefined(localclientnum));
	#/
	/#
		assert(item_world_util::function_d9648161(var_bd027dd9));
	#/
	data = item_world::function_a7e98a1a(localclientnum);
	/#
		assert(isdefined(data));
	#/
	if(isdefined(data.inventory.items) && isarray(data.inventory.items))
	{
		for(index = 0; index < data.inventory.items.size; index++)
		{
			inventoryitem = data.inventory.items[index];
			if(inventoryitem.var_bd027dd9 === var_bd027dd9)
			{
				return inventoryitem;
			}
		}
	}
}

/*
	Name: function_c48cd17f
	Namespace: item_inventory
	Checksum: 0x1EA69513
	Offset: 0xBDF0
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
	Name: has_attachments
	Namespace: item_inventory
	Checksum: 0xBC5104E2
	Offset: 0xBE48
	Size: 0x140
	Parameters: 2
	Flags: Linked
*/
function has_attachments(localclientnum, var_4838b749)
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
	Name: inventory_init
	Namespace: item_inventory
	Checksum: 0x66745BC1
	Offset: 0xBF90
	Size: 0xFA4
	Parameters: 1
	Flags: Linked
*/
function inventory_init(localclientnum)
{
	data = item_world::function_a7e98a1a(localclientnum);
	inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	pickedupammotypes = createuimodel(inventoryuimodel, "pickedUpAmmoTypes");
	setuimodelvalue(createuimodel(pickedupammotypes, "count"), 0);
	data.inventory = spawnstruct();
	data.inventory.consumed = {};
	data.inventory.consumed.items = [];
	data.inventory.count = ((((((17 + 1) + 8) + 1) + 8) + 1) + 8) + 1;
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
		data.inventory.items[index].itemuimodel = createuimodel(inventoryuimodel, "item" + index);
		setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "backpackSlot"), 0);
		setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "disabled"), 0);
	}
	for(index = 3; index < 5; index++)
	{
		data.inventory.items[index].itemuimodel = createuimodel(inventoryuimodel, "item" + index);
		setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "backpackSlot"), 1);
		setuimodelvalue(createuimodel(data.inventory.items[index].itemuimodel, "disabled"), 1);
	}
	data.inventory.items[5].itemuimodel = createuimodel(inventoryuimodel, "health");
	data.inventory.items[6].itemuimodel = createuimodel(inventoryuimodel, "gear");
	data.inventory.items[8].itemuimodel = createuimodel(inventoryuimodel, "storage");
	data.inventory.items[7].itemuimodel = createuimodel(inventoryuimodel, "equipment");
	data.inventory.items[12].itemuimodel = createuimodel(inventoryuimodel, "fieldUpgrade");
	data.inventory.items[13].itemuimodel = createuimodel(inventoryuimodel, "tactical");
	data.inventory.items[9].itemuimodel = createuimodel(inventoryuimodel, "resource0");
	data.inventory.items[10].itemuimodel = createuimodel(inventoryuimodel, "resource1");
	data.inventory.items[11].itemuimodel = createuimodel(inventoryuimodel, "shard0");
	foreach(index, slotid in array(14, 15, 16))
	{
		data.inventory.items[slotid].itemuimodel = createuimodel(inventoryuimodel, "perk" + index);
	}
	data.inventory.items[17].itemuimodel = createuimodel(inventoryuimodel, "scorestreak");
	weaponslots = array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1);
	for(index = 0; index < weaponslots.size; index++)
	{
		var_4838b749 = weaponslots[index];
		data.inventory.items[var_4838b749].itemuimodel = createuimodel(inventoryuimodel, "weapon" + index);
		var_55022c4f = array(1, 2, 3, 4, 5, 6, 7, 8);
		for(attachmentindex = 0; attachmentindex < var_55022c4f.size; attachmentindex++)
		{
			var_259f58f3 = var_55022c4f[attachmentindex];
			var_f9f8c0b5 = namespace_a0d533d1::function_dfaca25e(var_4838b749, var_259f58f3);
			uimodelindex = attachmentindex + (index * var_55022c4f.size);
			data.inventory.items[var_f9f8c0b5].itemuimodel = createuimodel(inventoryuimodel, "attachment" + uimodelindex);
		}
	}
	for(index = 0; index < data.inventory.items.size; index++)
	{
		if(!isdefined(data.inventory.items[index].itemuimodel))
		{
			continue;
		}
		function_1a99656a(localclientnum, data.inventory.items[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.healthitems = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.healthitems[index] = spawnstruct();
		data.inventory.healthitems[index].itemuimodel = createuimodel(inventoryuimodel, "health" + index);
		function_1a99656a(localclientnum, data.inventory.healthitems[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.equipmentitems = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.equipmentitems[index] = spawnstruct();
		data.inventory.equipmentitems[index].itemuimodel = createuimodel(inventoryuimodel, "equipment" + index);
		function_1a99656a(localclientnum, data.inventory.equipmentitems[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.var_d4de469a = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.var_d4de469a[index] = spawnstruct();
		data.inventory.var_d4de469a[index].itemuimodel = createuimodel(inventoryuimodel, "fieldUpgrade" + index);
		function_1a99656a(localclientnum, data.inventory.var_d4de469a[index], 32767, 32767, 0, 0, 0);
	}
	data.inventory.var_cb8b68cf = [];
	for(index = 0; index < 2; index++)
	{
		data.inventory.var_cb8b68cf[index] = spawnstruct();
		data.inventory.var_cb8b68cf[index].itemuimodel = createuimodel(inventoryuimodel, "scorestreak" + index);
		function_1a99656a(localclientnum, data.inventory.var_cb8b68cf[index], 32767, 32767, 0, 0, 0);
	}
	setuimodelvalue(createuimodel(inventoryuimodel, "count"), 3);
	setuimodelvalue(createuimodel(inventoryuimodel, "filledSlots"), 0);
	setuimodelvalue(createuimodel(inventoryuimodel, "attachmentCount"), 8);
	setuimodelvalue(createuimodel(inventoryuimodel, "resourceCount"), 1);
	setuimodelvalue(createuimodel(inventoryuimodel, "perkCount"), array(14, 15, 16).size);
	setuimodelvalue(createuimodel(inventoryuimodel, "scorestreakCount"), 1);
	setuimodelvalue(createuimodel(inventoryuimodel, "shardCount"), 1);
	setuimodelvalue(createuimodel(inventoryuimodel, "canUseQuickInventory"), 0);
	if(function_88da0c8e(localclientnum))
	{
		setuimodelvalue(createuimodel(data.inventory.items[9].itemuimodel, "notAccessible"), 1);
	}
	data.inventory.consumed.uimodel = createuimodel(inventoryuimodel, "consumed");
	data.inventory.consumed.var_a25538fb = createuimodel(data.inventory.consumed.uimodel, "count");
	setuimodelvalue(data.inventory.consumed.var_a25538fb, 0);
	level thread function_dab42db1(localclientnum);
	level thread function_d7869556(localclientnum);
	level thread function_cf96d951(localclientnum);
	level thread function_3b3ad5c2(localclientnum);
	level thread function_99bb24f8(localclientnum);
	forcenotifyuimodel(createuimodel(inventoryuimodel, "initialize"));
}

/*
	Name: function_dab42db1
	Namespace: item_inventory
	Checksum: 0x7ACF65E0
	Offset: 0xCF40
	Size: 0x1EC
	Parameters: 1
	Flags: Linked
*/
function function_dab42db1(localclientnum)
{
	level flag::wait_till(#"item_world_initialized");
	foreach(ammotype in array(#"hash_837a6ea0c2864a8", #"hash_1cdb9172a79b9080", #"hash_54f3f08c1d7d45d3", #"hash_4ab594460fa1627b", #"hash_f9e29721ba5715e", #"hash_75bef4d329c1080b"))
	{
		point = function_4ba8fde(ammotype);
		if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"ammo")
		{
			function_4f16aa30(localclientnum, point.id);
		}
	}
	inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
	pickedupammotypes = createuimodel(inventoryuimodel, "pickedUpAmmoTypes");
	forcenotifyuimodel(pickedupammotypes);
}

/*
	Name: function_cf96d951
	Namespace: item_inventory
	Checksum: 0x2E9AD55A
	Offset: 0xD138
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_cf96d951(localclientnum)
{
	level flag::wait_till(#"item_world_initialized");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"armor_shard_item");
	if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"armor_shard")
	{
		function_1a99656a(localclientnum, data.inventory.items[11], point.var_bd027dd9, point.id, 0, 0, 0);
	}
}

/*
	Name: function_d7869556
	Namespace: item_inventory
	Checksum: 0xFA7F9130
	Offset: 0xD238
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_d7869556(localclientnum)
{
	level flag::wait_till(#"item_world_initialized");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"resource_item_paint");
	if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"resource")
	{
		function_1a99656a(localclientnum, data.inventory.items[9], point.var_bd027dd9, point.id, 0, 0, 0);
	}
}

/*
	Name: function_3b3ad5c2
	Namespace: item_inventory
	Checksum: 0x56231404
	Offset: 0xD338
	Size: 0x178
	Parameters: 1
	Flags: Linked
*/
function function_3b3ad5c2(localclientnum)
{
	level flag::wait_till(#"item_world_initialized");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"hash_383a1390efa15e8a");
	if(isdefined(point) && isdefined(point.var_a6762160) && item_world_util::function_a57773a4(point.var_a6762160))
	{
		foreach(slotid in array(14, 15, 16))
		{
			function_1a99656a(localclientnum, data.inventory.items[slotid], point.var_bd027dd9, point.id, 0, 0, 0);
		}
	}
}

/*
	Name: function_99bb24f8
	Namespace: item_inventory
	Checksum: 0x4987CB4F
	Offset: 0xD4B8
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_99bb24f8(localclientnum)
{
	level flag::wait_till(#"item_world_initialized");
	data = item_world::function_a7e98a1a(localclientnum);
	point = function_4ba8fde(#"hash_668192b8df645b73");
	if(isdefined(point) && isdefined(point.var_a6762160) && point.var_a6762160.itemtype == #"scorestreak")
	{
		function_1a99656a(localclientnum, data.inventory.items[17], point.var_bd027dd9, point.id, 0, 0, 0);
	}
}

/*
	Name: function_534dcb9c
	Namespace: item_inventory
	Checksum: 0xB612C6B
	Offset: 0xD5B8
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
		inventoryuimodel = function_1df4c3b0(localclientnum, #"hash_159966ba825013a2");
		level.var_aa75d3e[localclientnum] = createuimodel(inventoryuimodel, "currentWeaponIndex");
		level.var_af8f97c8[localclientnum] = createuimodel(inventoryuimodel, "currentWeapon.itemIndex");
		level.var_c8a5f79b[localclientnum] = createuimodel(inventoryuimodel, "currentWeapon.ammoType");
		level.var_53cbbb33[localclientnum] = createuimodel(inventoryuimodel, "currentWeapon.isOperator");
		level.var_3a0390dd[localclientnum] = createuimodel(inventoryuimodel, "currentWeapon.isTactical");
		level.var_830a8516[localclientnum] = createuimodel(inventoryuimodel, "currentWeapon.rarity");
		level.var_7086ad4f[localclientnum] = createuimodel(inventoryuimodel, "showAttachments");
		level.var_6d21daaf[localclientnum] = createuimodel(inventoryuimodel, "canTransferFromStash");
		setuimodelvalue(level.var_830a8516[localclientnum], "Loadout");
	}
}

/*
	Name: function_6231c19
	Namespace: item_inventory
	Checksum: 0xC1C52448
	Offset: 0xDA30
	Size: 0x9C4
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
			foreach(slot in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
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
				forcenotifyuimodel(level.var_aa75d3e[params.localclientnum]);
			}
			if(!setuimodelvalue(level.var_af8f97c8[params.localclientnum], itemindex))
			{
				forcenotifyuimodel(level.var_af8f97c8[params.localclientnum]);
			}
			setuimodelvalue(level.var_830a8516[params.localclientnum], "Loadout");
			function_deddbdf0(params.localclientnum);
			function_ce628f27(params.localclientnum);
			return;
		}
		var_a4250c2b = self function_d768ea30(params.localclientnum);
		foreach(slot in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
		{
			if(slot === var_a4250c2b)
			{
				if(!setuimodelvalue(level.var_aa75d3e[params.localclientnum], index))
				{
					forcenotifyuimodel(level.var_aa75d3e[params.localclientnum]);
				}
				break;
			}
		}
		var_bd027dd9 = item_world_util::function_970b8d86(var_a4250c2b);
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
		var_754fe8c5 = getweaponammotype(params.weapon);
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
		forcenotifyuimodel(level.var_af8f97c8[params.localclientnum]);
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
	Namespace: item_inventory
	Checksum: 0x6C9022A1
	Offset: 0xE400
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
		forcenotifyuimodel(var_f9b70cae);
	}
	if(item.var_a6762160.itemtype == #"weapon")
	{
		var_d9659d2a = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "pickedUpWeapon");
		if(!setuimodelvalue(var_d9659d2a, itemname))
		{
			forcenotifyuimodel(var_d9659d2a);
		}
	}
	else if(item.var_a6762160.itemtype == #"generic")
	{
		function_22759012(localclientnum, item.var_bd027dd9);
	}
}

/*
	Name: function_c9764f6d
	Namespace: item_inventory
	Checksum: 0x432045BB
	Offset: 0xE598
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_c9764f6d(localclientnum)
{
	var_80c295ff = createuimodel(function_1df4c3b0(localclientnum, #"hash_159966ba825013a2"), "droppedWeapon");
	forcenotifyuimodel(var_80c295ff);
}

/*
	Name: function_451ebd83
	Namespace: item_inventory
	Checksum: 0x9A08BC3
	Offset: 0xE608
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
		forcenotifyuimodel(var_e16dbee1);
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
	Namespace: item_inventory
	Checksum: 0xF84CBF5B
	Offset: 0xE740
	Size: 0x4D4
	Parameters: 2
	Flags: Linked
*/
function function_4f16aa30(localclientnum, itemid)
{
	if(!isdefined(level.var_c53d118f))
	{
		level.var_c53d118f = [];
	}
	/#
		assert(item_world_util::function_2c7fc531(itemid));
	#/
	item = function_b1702735(itemid);
	if(!isdefined(item.var_a6762160))
	{
		return;
	}
	var_754fe8c5 = getweaponammotype(item.var_a6762160.weapon);
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
				setuimodelvalue(createuimodel(var_acd2831f, "id"), itemid);
				setuimodelvalue(createuimodel(var_acd2831f, "canDrop"), item.var_a6762160.itemtype == #"ammo");
			}
			return;
		}
	}
	level.var_c53d118f[var_754fe8c5] = item.var_a6762160.displayname;
	var_acd2831f = createuimodel(var_7268d07, "" + (var_b4676aed + 1));
	setuimodelvalue(createuimodel(var_acd2831f, "assetName"), var_754fe8c5);
	setuimodelvalue(createuimodel(var_acd2831f, "id"), itemid);
	setuimodelvalue(createuimodel(var_acd2831f, "canDrop"), 1);
	setuimodelvalue(createuimodel(var_acd2831f, "name"), item.var_a6762160.displayname);
	setuimodelvalue(createuimodel(var_acd2831f, "icon"), item.var_a6762160.icon);
	setuimodelvalue(createuimodel(var_acd2831f, "description"), item.var_a6762160.description);
	setuimodelvalue(var_5a2db7bb, var_b4676aed + 1);
}

/*
	Name: function_b1136fc8
	Namespace: item_inventory
	Checksum: 0x65ACAFB3
	Offset: 0xEC20
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
	Namespace: item_inventory
	Checksum: 0xD2439F16
	Offset: 0xF078
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
	Namespace: item_inventory
	Checksum: 0xAD8C267F
	Offset: 0xF128
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
	Namespace: item_inventory
	Checksum: 0xEB6D0318
	Offset: 0xF580
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
				inventoryitem = data.inventory.items[index];
				if(!isdefined(inventoryitem.endtime))
				{
					continue;
				}
				if(inventoryitem.var_a6762160.name == item.var_a6762160.name)
				{
					var_ee0e9af9[var_ee0e9af9.size] = inventoryitem;
				}
			}
			remaining = consumeditem.endtime - gettime();
			consumeditem.endtime = consumeditem.endtime - (remaining / var_ee0e9af9.size);
			for(index = 0; index < var_ee0e9af9.size; index++)
			{
				inventoryitem = var_ee0e9af9[index];
				inventoryitem.starttime = consumeditem.starttime;
				inventoryitem.endtime = consumeditem.endtime;
			}
		}
	}
	var_6177806b = 0;
	if(item_world_util::function_a57773a4(item.var_a6762160))
	{
		slotid = item_world_util::function_808be9a3(var_bd027dd9);
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
		slotid = item_world_util::function_808be9a3(var_bd027dd9);
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
		take_backpack(localclientnum, var_bd027dd9);
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
	Namespace: item_inventory
	Checksum: 0x7199F3E
	Offset: 0xFC98
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_8063170(inventoryitem, equipped)
{
	if(!isdefined(inventoryitem) || !isdefined(inventoryitem.var_a6762160))
	{
		return;
	}
	if(inventoryitem.var_a6762160.itemtype === #"armor_shard")
	{
		return;
	}
	if(inventoryitem.var_a6762160.itemtype === #"attachment" || inventoryitem.var_a6762160.itemtype === #"weapon")
	{
		availableaction = inventoryitem.availableaction;
	}
	else
	{
		availableaction = inventoryitem.availableaction && !equipped;
	}
	setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "availableAction"), availableaction);
}

/*
	Name: function_26c87da8
	Namespace: item_inventory
	Checksum: 0xB0E10606
	Offset: 0xFDB0
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
	fromitem = data.inventory.items[var_c9293a27];
	toitem = data.inventory.items[var_8f194e5a];
	var_23501832 = fromitem.var_bd027dd9;
	var_a2dd129a = fromitem.id;
	var_b208c7e1 = fromitem.var_a6762160;
	var_3907299e = fromitem.count;
	var_57b0c2f = fromitem.availableaction;
	var_9269cd0a = toitem.var_bd027dd9;
	var_d3a45360 = toitem.id;
	var_ec763bb2 = toitem.var_a6762160;
	var_532f304 = toitem.count;
	var_ad138826 = toitem.availableaction;
	player = function_27673a7(localclientnum);
	if(var_3907299e == 0)
	{
		var_23501832 = 32767;
	}
	player function_1a99656a(localclientnum, toitem, (var_23501832 != 32767 ? item_world_util::function_970b8d86(var_8f194e5a) : 32767), var_a2dd129a, var_3907299e, function_bba770de(localclientnum, var_b208c7e1), var_57b0c2f, undefined, 1);
	if(var_532f304 == 0)
	{
		var_9269cd0a = 32767;
	}
	player function_1a99656a(localclientnum, fromitem, (var_9269cd0a != 32767 ? item_world_util::function_970b8d86(var_c9293a27) : 32767), var_d3a45360, var_532f304, function_bba770de(localclientnum, var_ec763bb2), var_ad138826, undefined, 1);
	function_442857e2(localclientnum, var_ec763bb2);
	function_442857e2(localclientnum, var_b208c7e1);
	function_ce628f27(localclientnum);
	var_a4250c2b = player function_d768ea30(localclientnum);
	function_deddbdf0(localclientnum, var_a4250c2b);
}

/*
	Name: take_backpack
	Namespace: item_inventory
	Checksum: 0x1C950F98
	Offset: 0x100D0
	Size: 0x15C
	Parameters: 2
	Flags: Linked
*/
function take_backpack(localclientnum, var_bd027dd9)
{
	data = item_world::function_a7e98a1a(var_bd027dd9);
	data.inventory.var_7658cbec = 0;
	if(data.inventory.var_c212de25 == 5)
	{
		for(index = 3; index < 5; index++)
		{
			inventoryitem = data.inventory.items[index];
			setuimodelvalue(createuimodel(inventoryitem.itemuimodel, "disabled"), 1);
		}
		data.inventory.var_c212de25 = 3;
		inventoryuimodel = function_1df4c3b0(var_bd027dd9, #"hash_159966ba825013a2");
		setuimodelvalue(createuimodel(inventoryuimodel, "count"), data.inventory.var_c212de25);
	}
}

/*
	Name: function_fa372100
	Namespace: item_inventory
	Checksum: 0x25D5DADE
	Offset: 0x10238
	Size: 0xDC
	Parameters: 2
	Flags: Linked
*/
function function_fa372100(localclientnum, var_bd027dd9)
{
	data = item_world::function_a7e98a1a(localclientnum);
	foreach(inventoryitem in data.inventory.items)
	{
		if(inventoryitem.var_bd027dd9 === var_bd027dd9)
		{
			function_8063170(inventoryitem, 0);
			break;
		}
	}
}

/*
	Name: update_inventory_item
	Namespace: item_inventory
	Checksum: 0xB0A7B86B
	Offset: 0x10320
	Size: 0x1AC
	Parameters: 3
	Flags: Linked
*/
function update_inventory_item(localclientnum, var_bd027dd9, count)
{
	data = item_world::function_a7e98a1a(localclientnum);
	player = function_27673a7(localclientnum);
	foreach(inventoryitem in data.inventory.items)
	{
		if(inventoryitem.var_bd027dd9 === var_bd027dd9)
		{
			var_338e8597 = (isdefined(inventoryitem.count) ? inventoryitem.count : 0);
			totalcount = function_bba770de(localclientnum, inventoryitem.var_a6762160);
			totalcount = totalcount + (count - var_338e8597);
			function_1a99656a(localclientnum, inventoryitem, inventoryitem.var_bd027dd9, inventoryitem.id, count, totalcount, inventoryitem.availableaction);
			function_8063170(inventoryitem, function_6d9d9cd7(inventoryslot));
			break;
		}
	}
}

