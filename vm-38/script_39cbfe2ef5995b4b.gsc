#using scripts\core_common\armor.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using script_471b31bd963b388e;
#using script_4108035fe400ce67;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_efff98ec;

/*
	Name: function_45d34149
	Namespace: namespace_efff98ec
	Checksum: 0xE0ED3BA3
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_45d34149()
{
	level notify(626170097);
}

/*
	Name: __init__system__
	Namespace: namespace_efff98ec
	Checksum: 0xC815CD49
	Offset: 0xE8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_fd2ea50703c7073", &function_70a657d8, undefined, undefined, #"item_world");
}

/*
	Name: function_70a657d8
	Namespace: namespace_efff98ec
	Checksum: 0x97F38E17
	Offset: 0x138
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(item_inventory::function_7d5553ac())
	{
		return;
	}
	function_116fd9a7();
}

/*
	Name: function_116fd9a7
	Namespace: namespace_efff98ec
	Checksum: 0x81AFDDB6
	Offset: 0x170
	Size: 0x3F4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_116fd9a7()
{
	item_world::function_861f348d(#"hash_9ed0c30684ca35a", &function_d045e83b);
	item_world::function_861f348d(#"hash_76a324a4d6073913", &function_2e5b5858);
	item_world::function_861f348d(#"hash_3bfb97e39d67e5f9", &function_cb9b4dd7);
	item_world::function_861f348d(#"hash_788c59214ead02af", &function_14b2eddf);
	item_world::function_861f348d(#"hash_6247ea34d3b1ddb6", &function_42ffe9b2);
	item_world::function_861f348d(#"hash_2cbf15cbb314c93e", &function_2eebeff5);
	item_world::function_861f348d(#"hash_51b30f6e7331e136", &function_349d4c26);
	item_world::function_861f348d(#"hash_2b4dff2e0db72d06", &function_670cce3f);
	item_world::function_861f348d(#"generic_pickup", &function_41a52251);
	item_world::function_861f348d(#"hash_5c844f5c1207159c", &function_2b2e9302);
	item_world::function_861f348d(#"hash_57df81951e3bc37c", &function_7de52ecc);
	item_world::function_861f348d(#"hash_1f0d729dc6dd1202", &function_898628ef);
	item_world::function_861f348d(#"hash_31380667bf69d3a0", &function_a240798a);
	item_world::function_861f348d(#"hash_29f7ad396d214a52", &function_d46c2559);
	item_world::function_861f348d(#"hash_50375e5de228e9fc", &function_a712496a);
	item_world::function_861f348d(#"hash_ff2bc61e2c18f43", &function_80ef3ea5);
	item_world::function_861f348d(#"hash_4213c4725d9f115", &function_753fb11f);
	item_world::function_861f348d(#"hash_68c089ceb01f806b", &function_2650d5c6);
	item_world::function_861f348d(#"hash_3115e37ace8310b1", &function_c3f4d281);
	item_world::function_861f348d(#"hash_292f5be0001274a4", &function_24dc1d12);
	item_world::function_861f348d(#"hash_1002a9af0882010e", &function_88803841);
}

/*
	Name: function_d045e83b
	Namespace: namespace_efff98ec
	Checksum: 0x75AB8C7F
	Offset: 0x570
	Size: 0x122
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d045e83b(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slot)
{
	if(itemid.var_a6762160.itemtype !== #"ammo")
	{
		/#
			assertmsg(("" + itemid.name) + "");
		#/
		return 0;
	}
	if(!self item_inventory::can_pickup_ammo(itemid))
	{
		return (isdefined(slot) ? slot : (isdefined(itemid.var_a6762160.amount) ? itemid.var_a6762160.amount : 1));
	}
	itemcount function_b00db06(8, var_aec6fa7f);
	return itemcount item_inventory::equip_ammo(itemid, slot);
}

/*
	Name: function_2e5b5858
	Namespace: namespace_efff98ec
	Checksum: 0x3F87651E
	Offset: 0x6A0
	Size: 0x3F8
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2e5b5858(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	droppeditem = undefined;
	var_3d1f9df4 = 0;
	var_b0938bd7 = undefined;
	var_381f3b39 = 0;
	var_77e61fc6 = 0;
	if(var_bd027dd9.var_a6762160.var_4a1a4613 === #"hash_2358855db2698362")
	{
		if(itemid armor::has_armor())
		{
			inventoryitem = itemid.inventory.items[6];
			if(inventoryitem.var_bd027dd9 != 32767)
			{
				droppeditem = inventoryitem.var_a6762160;
				var_3d1f9df4 = droppeditem.amount;
			}
		}
		itemid item_inventory::drop_armor();
		var_77e61fc6 = itemid item_inventory::give_inventory_item(var_bd027dd9, 1, var_aec6fa7f, slotid);
		if(var_77e61fc6 < itemcount)
		{
			if(isdefined(var_bd027dd9.var_bd027dd9) && item_world_util::function_db35e94f(var_bd027dd9.var_bd027dd9))
			{
				var_bd027dd9 = item_inventory::get_inventory_item(var_bd027dd9.var_bd027dd9);
			}
			if(itemid item_inventory::function_fba4a353(var_bd027dd9))
			{
				itemid item_inventory::equip_armor(var_bd027dd9);
				var_b0938bd7 = var_bd027dd9.var_a6762160;
				var_381f3b39 = var_bd027dd9.var_a6762160.amount;
			}
		}
	}
	else if(var_bd027dd9.var_a6762160.var_4a1a4613 === #"hash_3d98ea1d4a033e97")
	{
		noarmor = 1;
		if(itemid.armortier > 0)
		{
			if(var_bd027dd9.var_a6762160.armortier > itemid.armortier)
			{
				inventoryitem = itemid.inventory.items[6];
				var_4d7e11d8 = itemid item_inventory::drop_inventory_item(inventoryitem.var_bd027dd9);
				var_4d7e11d8 delete();
				noarmor = 1;
			}
			else
			{
				noarmor = 0;
				if(isdefined(itemid.armor) && isdefined(itemid.maxarmor))
				{
					inventoryitem = itemid.inventory.items[6];
					inventoryitem.amount = itemid.maxarmor;
					itemid.armor = itemid.maxarmor;
				}
			}
		}
		if(noarmor)
		{
			itemid item_inventory::give_inventory_item(var_bd027dd9, 1, var_aec6fa7f, slotid);
			if(isdefined(var_bd027dd9.var_bd027dd9) && item_world_util::function_db35e94f(var_bd027dd9.var_bd027dd9))
			{
				var_bd027dd9 = item_inventory::get_inventory_item(var_bd027dd9.var_bd027dd9);
			}
			if(itemid item_inventory::function_fba4a353(var_bd027dd9))
			{
				itemid item_inventory::equip_armor(var_bd027dd9);
				var_b0938bd7 = var_bd027dd9.var_a6762160;
				var_381f3b39 = var_bd027dd9.var_a6762160.amount;
			}
		}
	}
	item_world::function_1a46c8ae(itemid, droppeditem, var_3d1f9df4, var_b0938bd7, var_381f3b39);
	return var_77e61fc6;
}

/*
	Name: function_cb9b4dd7
	Namespace: namespace_efff98ec
	Checksum: 0x10802546
	Offset: 0xAA0
	Size: 0x80
	Parameters: 7
	Flags: Linked, Private
*/
function private function_cb9b4dd7(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	itemcount item_inventory::function_3d113bfb();
	return var_77e61fc6;
}

/*
	Name: function_14b2eddf
	Namespace: namespace_efff98ec
	Checksum: 0xAFFB5302
	Offset: 0xB28
	Size: 0x168
	Parameters: 7
	Flags: Linked, Private
*/
function private function_14b2eddf(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_f0dc4e93 = itemcount item_inventory::function_ec087745();
	var_4838b749 = undefined;
	if(isdefined(var_f0dc4e93) && var_f0dc4e93 != 32767)
	{
		var_4838b749 = itemcount item_inventory::function_b246c573(var_f0dc4e93);
	}
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	if(isdefined(var_4838b749) && isdefined(slotid) && namespace_a0d533d1::function_398b9770(var_4838b749, slotid))
	{
		if(isdefined(itemid.var_bd027dd9) && item_world_util::function_db35e94f(itemid.var_bd027dd9))
		{
			itemid = item_inventory::get_inventory_item(itemid.var_bd027dd9);
		}
		itemcount item_inventory::equip_attachment(itemid, var_f0dc4e93, undefined, 0);
	}
	return var_77e61fc6;
}

/*
	Name: function_42ffe9b2
	Namespace: namespace_efff98ec
	Checksum: 0xF560C55
	Offset: 0xC98
	Size: 0x108
	Parameters: 7
	Flags: Linked, Private
*/
function private function_42ffe9b2(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	if(itemcount item_inventory::function_fba4a353(itemid))
	{
		slotid = 8;
	}
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	if(var_77e61fc6 < var_aec6fa7f && slotid === 8)
	{
		if(isdefined(itemid.var_bd027dd9) && item_world_util::function_db35e94f(itemid.var_bd027dd9))
		{
			itemid = item_inventory::get_inventory_item(itemid.var_bd027dd9);
		}
		itemcount item_inventory::equip_backpack(itemid);
	}
	return var_77e61fc6;
}

/*
	Name: function_2eebeff5
	Namespace: namespace_efff98ec
	Checksum: 0xA8B4A6DD
	Offset: 0xDA8
	Size: 0xE8
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2eebeff5(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemid item_inventory::give_inventory_item(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && item_world_util::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = item_inventory::get_inventory_item(var_bd027dd9.var_bd027dd9);
		}
		if(itemid item_inventory::function_fba4a353(var_bd027dd9))
		{
			itemid thread item_inventory::equip_equipment(var_bd027dd9);
		}
	}
	return var_77e61fc6;
}

/*
	Name: function_349d4c26
	Namespace: namespace_efff98ec
	Checksum: 0x957AE264
	Offset: 0xE98
	Size: 0xE8
	Parameters: 7
	Flags: Linked, Private
*/
function private function_349d4c26(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	if(var_77e61fc6 < var_aec6fa7f)
	{
		if(isdefined(itemid.var_bd027dd9) && item_world_util::function_db35e94f(itemid.var_bd027dd9))
		{
			itemid = item_inventory::get_inventory_item(itemid.var_bd027dd9);
		}
		if(itemcount item_inventory::function_fba4a353(itemid))
		{
			itemcount thread item_inventory::equip_health(itemid);
		}
	}
	return var_77e61fc6;
}

/*
	Name: function_670cce3f
	Namespace: namespace_efff98ec
	Checksum: 0xA4ECC5EC
	Offset: 0xF88
	Size: 0x6A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_670cce3f(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	return var_77e61fc6;
}

/*
	Name: function_41a52251
	Namespace: namespace_efff98ec
	Checksum: 0x734D35DB
	Offset: 0x1000
	Size: 0x6A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_41a52251(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	return var_77e61fc6;
}

/*
	Name: function_2b2e9302
	Namespace: namespace_efff98ec
	Checksum: 0x647E0A5E
	Offset: 0x1078
	Size: 0x90
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2b2e9302(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	itemcount callback::callback(#"hash_3b891b6daa75c782", itemid);
	return var_77e61fc6;
}

/*
	Name: function_7de52ecc
	Namespace: namespace_efff98ec
	Checksum: 0x81C1E67A
	Offset: 0x1110
	Size: 0xE8
	Parameters: 7
	Flags: Linked, Private
*/
function private function_7de52ecc(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemid item_inventory::give_inventory_item(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && item_world_util::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = item_inventory::get_inventory_item(var_bd027dd9.var_bd027dd9);
		}
		if(itemid item_inventory::function_fba4a353(var_bd027dd9))
		{
			itemid thread item_inventory::function_854cf2c3(var_bd027dd9);
		}
	}
	return var_77e61fc6;
}

/*
	Name: function_898628ef
	Namespace: namespace_efff98ec
	Checksum: 0xB87BF770
	Offset: 0x1200
	Size: 0x100
	Parameters: 7
	Flags: Linked, Private
*/
function private function_898628ef(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemid item_inventory::give_inventory_item(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	stockammo = var_bd027dd9.stockammo;
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && item_world_util::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = item_inventory::get_inventory_item(var_bd027dd9.var_bd027dd9);
		}
		if(itemid item_inventory::function_fba4a353(var_bd027dd9))
		{
			itemid thread item_inventory::function_1ac37022(var_bd027dd9, stockammo);
		}
	}
	return var_77e61fc6;
}

/*
	Name: function_a240798a
	Namespace: namespace_efff98ec
	Checksum: 0x64E3EF7D
	Offset: 0x1308
	Size: 0x6A
	Parameters: 7
	Flags: Linked, Private
*/
function private function_a240798a(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount item_inventory::give_inventory_item(itemid, var_aec6fa7f, undefined, slotid);
	return var_77e61fc6;
}

/*
	Name: function_24dc1d12
	Namespace: namespace_efff98ec
	Checksum: 0xF2A6EC20
	Offset: 0x1380
	Size: 0x3E
	Parameters: 7
	Flags: Linked, Private
*/
function private function_24dc1d12(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	return false;
}

/*
	Name: function_c3f4d281
	Namespace: namespace_efff98ec
	Checksum: 0xAC69E770
	Offset: 0x13C8
	Size: 0x272
	Parameters: 7
	Flags: Linked, Private
*/
function private function_c3f4d281(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	self hud::function_4a4de0de();
	nullweapon = getweapon(#"none");
	var_f945fa92 = getweapon(#"bare_hands");
	foreach(weaponslot in namespace_a0d533d1::function_4905dddf())
	{
		inventoryweapon = self namespace_a0d533d1::function_2b83d3ff(self item_inventory::function_2e711614(weaponslot));
		if(isdefined(inventoryweapon) && inventoryweapon != nullweapon && inventoryweapon != var_f945fa92 && inventoryweapon.weapclass != "melee")
		{
			var_1326fcc7 = (isdefined(slotid.var_a6762160.amount) ? slotid.var_a6762160.amount : 20);
			maxammo = inventoryweapon.maxammo;
			var_e6527384 = maxammo * (var_1326fcc7 / 100);
			currentammostock = self getweaponammostock(inventoryweapon);
			var_e6527384 = currentammostock + var_e6527384;
			if(var_e6527384 < 0)
			{
				var_e6527384 = 0;
			}
			else if(var_e6527384 > maxammo)
			{
				var_e6527384 = maxammo;
			}
			self setweaponammostock(inventoryweapon, int(var_e6527384));
		}
	}
	return false;
}

/*
	Name: function_80ef3ea5
	Namespace: namespace_efff98ec
	Checksum: 0x39EF3755
	Offset: 0x1648
	Size: 0x3E
	Parameters: 7
	Flags: Linked, Private
*/
function private function_80ef3ea5(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	return false;
}

/*
	Name: function_753fb11f
	Namespace: namespace_efff98ec
	Checksum: 0x2A25E6DE
	Offset: 0x1690
	Size: 0x3E
	Parameters: 7
	Flags: Linked, Private
*/
function private function_753fb11f(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	return false;
}

/*
	Name: function_88803841
	Namespace: namespace_efff98ec
	Checksum: 0x19A80FFF
	Offset: 0x16D8
	Size: 0x3E
	Parameters: 7
	Flags: Linked, Private
*/
function private function_88803841(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	return false;
}

/*
	Name: function_d46c2559
	Namespace: namespace_efff98ec
	Checksum: 0xA7E6C24C
	Offset: 0x1720
	Size: 0x56
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d46c2559(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	item_drop::function_d8342646(slotid.var_25b21f27);
	return false;
}

/*
	Name: function_2650d5c6
	Namespace: namespace_efff98ec
	Checksum: 0x3A8E9CE6
	Offset: 0x1780
	Size: 0x148
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2650d5c6(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	self hud::function_801bf40f();
	var_2cacdde7 = 50;
	inventoryitem = slotid.inventory.items[6];
	if(isdefined(inventoryitem))
	{
		var_2cacdde7 = (isdefined(inventoryitem.var_a6762160.var_a3aa1ca2) ? inventoryitem.var_a6762160.var_a3aa1ca2 : 50);
		if(isdefined(level.var_8cc294a7))
		{
			var_2cacdde7 = [[level.var_8cc294a7]](var_2cacdde7);
		}
		if(var_2cacdde7 == 0)
		{
			var_2cacdde7 = 50;
		}
	}
	var_2cacdde7 = int(var_2cacdde7);
	self.armor = self.armor + math::clamp(var_2cacdde7, 0, self.maxarmor);
	return false;
}

/*
	Name: function_a712496a
	Namespace: namespace_efff98ec
	Checksum: 0x4EEAC4BC
	Offset: 0x18D0
	Size: 0x3B0
	Parameters: 7
	Flags: Linked, Private
*/
function private function_a712496a(item, player, var_bd027dd9, itemid, itemcount, var_aec6fa7f, slotid)
{
	/#
		assert(isplayer(self));
	#/
	stockammo = var_bd027dd9.stockammo;
	if(isdefined(var_bd027dd9.weaponoverride))
	{
		foreach(attachment in var_bd027dd9.weaponoverride.attachments)
		{
			attachmentname = item_world_util::function_6a0ee21a(attachment);
			if(!isdefined(attachmentname))
			{
				continue;
			}
			attachmentitem = item_world_util::function_49ce7663(attachmentname);
			if(!isdefined(attachmentitem))
			{
				continue;
			}
			namespace_a0d533d1::function_9e9c82a6(var_bd027dd9, attachmentitem);
		}
	}
	if(item_inventory::get_weapon_count() == namespace_a0d533d1::function_80fb4b76())
	{
		stashitem = item_world_util::function_83c20f83(var_bd027dd9);
		stashitem = stashitem & (~(isdefined(var_bd027dd9.deathstash) ? var_bd027dd9.deathstash : 0));
		weaponitem = item_inventory::function_230ceec4(itemid.currentweapon);
		if(!isdefined(weaponitem))
		{
			itemid takeweapon(itemid.currentweapon);
		}
		else
		{
			itemid item_inventory::drop_inventory_item(weaponitem.var_bd027dd9, stashitem, itemid.origin, (isdefined(var_bd027dd9.var_67169c0b) ? var_bd027dd9.var_67169c0b : var_bd027dd9.targetname), undefined, 1);
		}
	}
	var_77e61fc6 = itemid item_inventory::give_inventory_item(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && item_world_util::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = item_inventory::get_inventory_item(var_bd027dd9.var_bd027dd9);
		}
		if(isdefined(var_bd027dd9.var_a6762160.var_b079a6e6))
		{
			itemid item_inventory::function_b579540e(var_bd027dd9, var_bd027dd9.var_a6762160.var_b079a6e6);
			weapon = namespace_a0d533d1::function_2b83d3ff(var_bd027dd9);
			itemid aat::acquire(weapon, var_bd027dd9.var_a6762160.var_b079a6e6);
		}
		itemid item_inventory::equip_weapon(var_bd027dd9, 1, 1, 0, 1, stockammo);
	}
	return var_77e61fc6;
}

