#using script_1c65dbfc2f1c8d8f;
#using script_1caf36ff04a85ff6;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using script_7bacb32f8222fa3e;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\armor.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;

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
	Name: function_89f2df9
	Namespace: namespace_efff98ec
	Checksum: 0xC815CD49
	Offset: 0xE8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
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
	if(namespace_b376ff3f::function_7d5553ac())
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
function private function_d045e83b(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slot)
{
	if(var_d8138db2.var_a6762160.itemtype !== #"ammo")
	{
		/#
			assertmsg(("" + var_d8138db2.name) + "");
		#/
		return 0;
	}
	if(!self namespace_b376ff3f::function_e106cbe9(var_d8138db2))
	{
		return (isdefined(slot) ? slot : (isdefined(var_d8138db2.var_a6762160.amount) ? var_d8138db2.var_a6762160.amount : 1));
	}
	itemcount function_b00db06(8, var_aec6fa7f);
	return itemcount namespace_b376ff3f::function_11089ed8(var_d8138db2, slot);
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
function private function_2e5b5858(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	droppeditem = undefined;
	var_3d1f9df4 = 0;
	var_b0938bd7 = undefined;
	var_381f3b39 = 0;
	var_77e61fc6 = 0;
	if(var_bd027dd9.var_a6762160.var_4a1a4613 === #"hash_2358855db2698362")
	{
		if(var_d8138db2 armor::has_armor())
		{
			var_b619c089 = var_d8138db2.inventory.items[6];
			if(var_b619c089.var_bd027dd9 != 32767)
			{
				droppeditem = var_b619c089.var_a6762160;
				var_3d1f9df4 = droppeditem.amount;
			}
		}
		var_d8138db2 namespace_b376ff3f::drop_armor();
		var_77e61fc6 = var_d8138db2 namespace_b376ff3f::function_e274f1fe(var_bd027dd9, 1, var_aec6fa7f, slotid);
		if(var_77e61fc6 < itemcount)
		{
			if(isdefined(var_bd027dd9.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_bd027dd9.var_bd027dd9))
			{
				var_bd027dd9 = namespace_b376ff3f::function_dfcacdc2(var_bd027dd9.var_bd027dd9);
			}
			if(var_d8138db2 namespace_b376ff3f::function_fba4a353(var_bd027dd9))
			{
				var_d8138db2 namespace_b376ff3f::equip_armor(var_bd027dd9);
				var_b0938bd7 = var_bd027dd9.var_a6762160;
				var_381f3b39 = var_bd027dd9.var_a6762160.amount;
			}
		}
	}
	else if(var_bd027dd9.var_a6762160.var_4a1a4613 === #"hash_3d98ea1d4a033e97")
	{
		noarmor = 1;
		if(var_d8138db2.armortier > 0)
		{
			if(var_bd027dd9.var_a6762160.armortier > var_d8138db2.armortier)
			{
				var_b619c089 = var_d8138db2.inventory.items[6];
				var_4d7e11d8 = var_d8138db2 namespace_b376ff3f::function_418f9eb8(var_b619c089.var_bd027dd9);
				var_4d7e11d8 delete();
				noarmor = 1;
			}
			else
			{
				noarmor = 0;
				if(isdefined(var_d8138db2.armor) && isdefined(var_d8138db2.maxarmor))
				{
					var_b619c089 = var_d8138db2.inventory.items[6];
					var_b619c089.amount = var_d8138db2.maxarmor;
					var_d8138db2.armor = var_d8138db2.maxarmor;
				}
			}
		}
		if(noarmor)
		{
			var_d8138db2 namespace_b376ff3f::function_e274f1fe(var_bd027dd9, 1, var_aec6fa7f, slotid);
			if(isdefined(var_bd027dd9.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_bd027dd9.var_bd027dd9))
			{
				var_bd027dd9 = namespace_b376ff3f::function_dfcacdc2(var_bd027dd9.var_bd027dd9);
			}
			if(var_d8138db2 namespace_b376ff3f::function_fba4a353(var_bd027dd9))
			{
				var_d8138db2 namespace_b376ff3f::equip_armor(var_bd027dd9);
				var_b0938bd7 = var_bd027dd9.var_a6762160;
				var_381f3b39 = var_bd027dd9.var_a6762160.amount;
			}
		}
	}
	item_world::function_1a46c8ae(var_d8138db2, droppeditem, var_3d1f9df4, var_b0938bd7, var_381f3b39);
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
function private function_cb9b4dd7(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
	itemcount namespace_b376ff3f::function_3d113bfb();
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
function private function_14b2eddf(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_f0dc4e93 = itemcount namespace_b376ff3f::function_ec087745();
	var_4838b749 = undefined;
	if(isdefined(var_f0dc4e93) && var_f0dc4e93 != 32767)
	{
		var_4838b749 = itemcount namespace_b376ff3f::function_b246c573(var_f0dc4e93);
	}
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
	if(isdefined(var_4838b749) && isdefined(slotid) && namespace_a0d533d1::function_398b9770(var_4838b749, slotid))
	{
		if(isdefined(var_d8138db2.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_d8138db2.var_bd027dd9))
		{
			var_d8138db2 = namespace_b376ff3f::function_dfcacdc2(var_d8138db2.var_bd027dd9);
		}
		itemcount namespace_b376ff3f::function_224c09c9(var_d8138db2, var_f0dc4e93, undefined, 0);
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
function private function_42ffe9b2(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	if(itemcount namespace_b376ff3f::function_fba4a353(var_d8138db2))
	{
		slotid = 8;
	}
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
	if(var_77e61fc6 < var_aec6fa7f && slotid === 8)
	{
		if(isdefined(var_d8138db2.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_d8138db2.var_bd027dd9))
		{
			var_d8138db2 = namespace_b376ff3f::function_dfcacdc2(var_d8138db2.var_bd027dd9);
		}
		itemcount namespace_b376ff3f::function_2dab8a7f(var_d8138db2);
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
function private function_2eebeff5(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = var_d8138db2 namespace_b376ff3f::function_e274f1fe(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = namespace_b376ff3f::function_dfcacdc2(var_bd027dd9.var_bd027dd9);
		}
		if(var_d8138db2 namespace_b376ff3f::function_fba4a353(var_bd027dd9))
		{
			var_d8138db2 thread namespace_b376ff3f::function_c8bedf1b(var_bd027dd9);
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
function private function_349d4c26(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
	if(var_77e61fc6 < var_aec6fa7f)
	{
		if(isdefined(var_d8138db2.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_d8138db2.var_bd027dd9))
		{
			var_d8138db2 = namespace_b376ff3f::function_dfcacdc2(var_d8138db2.var_bd027dd9);
		}
		if(itemcount namespace_b376ff3f::function_fba4a353(var_d8138db2))
		{
			itemcount thread namespace_b376ff3f::function_11fc9fa9(var_d8138db2);
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
function private function_670cce3f(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
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
function private function_41a52251(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
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
function private function_2b2e9302(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
	itemcount callback::callback(#"hash_3b891b6daa75c782", var_d8138db2);
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
function private function_7de52ecc(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = var_d8138db2 namespace_b376ff3f::function_e274f1fe(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = namespace_b376ff3f::function_dfcacdc2(var_bd027dd9.var_bd027dd9);
		}
		if(var_d8138db2 namespace_b376ff3f::function_fba4a353(var_bd027dd9))
		{
			var_d8138db2 thread namespace_b376ff3f::function_854cf2c3(var_bd027dd9);
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
function private function_898628ef(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = var_d8138db2 namespace_b376ff3f::function_e274f1fe(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	stockammo = var_bd027dd9.stockammo;
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = namespace_b376ff3f::function_dfcacdc2(var_bd027dd9.var_bd027dd9);
		}
		if(var_d8138db2 namespace_b376ff3f::function_fba4a353(var_bd027dd9))
		{
			var_d8138db2 thread namespace_b376ff3f::function_1ac37022(var_bd027dd9, stockammo);
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
function private function_a240798a(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	var_77e61fc6 = itemcount namespace_b376ff3f::function_e274f1fe(var_d8138db2, var_aec6fa7f, undefined, slotid);
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
function private function_24dc1d12(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
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
function private function_c3f4d281(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	self hud::function_4a4de0de();
	nullweapon = getweapon(#"none");
	var_f945fa92 = getweapon(#"bare_hands");
	foreach(weaponslot in namespace_a0d533d1::function_4905dddf())
	{
		inventoryweapon = self namespace_a0d533d1::function_2b83d3ff(self namespace_b376ff3f::function_2e711614(weaponslot));
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
function private function_80ef3ea5(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
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
function private function_753fb11f(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
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
function private function_88803841(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
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
function private function_d46c2559(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
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
function private function_2650d5c6(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	self hud::function_801bf40f();
	var_2cacdde7 = 50;
	var_b619c089 = slotid.inventory.items[6];
	if(isdefined(var_b619c089))
	{
		var_2cacdde7 = (isdefined(var_b619c089.var_a6762160.var_a3aa1ca2) ? var_b619c089.var_a6762160.var_a3aa1ca2 : 50);
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
function private function_a712496a(item, player, var_bd027dd9, var_d8138db2, itemcount, var_aec6fa7f, slotid)
{
	/#
		assert(isplayer(self));
	#/
	stockammo = var_bd027dd9.stockammo;
	if(isdefined(var_bd027dd9.weaponoverride))
	{
		foreach(attachment in var_bd027dd9.weaponoverride.attachments)
		{
			attachmentname = namespace_ad5a0cd6::function_6a0ee21a(attachment);
			if(!isdefined(attachmentname))
			{
				continue;
			}
			var_84704ed7 = namespace_ad5a0cd6::function_49ce7663(attachmentname);
			if(!isdefined(var_84704ed7))
			{
				continue;
			}
			namespace_a0d533d1::function_9e9c82a6(var_bd027dd9, var_84704ed7);
		}
	}
	if(namespace_b376ff3f::function_57eac2ca() == namespace_a0d533d1::function_80fb4b76())
	{
		var_be90d3da = namespace_ad5a0cd6::function_83c20f83(var_bd027dd9);
		var_be90d3da = var_be90d3da & (~(isdefined(var_bd027dd9.var_4961f577) ? var_bd027dd9.var_4961f577 : 0));
		var_64d58696 = namespace_b376ff3f::function_230ceec4(var_d8138db2.currentweapon);
		if(!isdefined(var_64d58696))
		{
			var_d8138db2 takeweapon(var_d8138db2.currentweapon);
		}
		else
		{
			var_d8138db2 namespace_b376ff3f::function_418f9eb8(var_64d58696.var_bd027dd9, var_be90d3da, var_d8138db2.origin, (isdefined(var_bd027dd9.var_67169c0b) ? var_bd027dd9.var_67169c0b : var_bd027dd9.targetname), undefined, 1);
		}
	}
	var_77e61fc6 = var_d8138db2 namespace_b376ff3f::function_e274f1fe(var_bd027dd9, itemcount, var_aec6fa7f, slotid);
	if(var_77e61fc6 < itemcount)
	{
		if(isdefined(var_bd027dd9.var_bd027dd9) && namespace_ad5a0cd6::function_db35e94f(var_bd027dd9.var_bd027dd9))
		{
			var_bd027dd9 = namespace_b376ff3f::function_dfcacdc2(var_bd027dd9.var_bd027dd9);
		}
		if(isdefined(var_bd027dd9.var_a6762160.var_b079a6e6))
		{
			var_d8138db2 namespace_b376ff3f::function_b579540e(var_bd027dd9, var_bd027dd9.var_a6762160.var_b079a6e6);
			weapon = namespace_a0d533d1::function_2b83d3ff(var_bd027dd9);
			var_d8138db2 aat::acquire(weapon, var_bd027dd9.var_a6762160.var_b079a6e6);
		}
		var_d8138db2 namespace_b376ff3f::function_2b4d7b66(var_bd027dd9, 1, 1, 0, 1, stockammo);
	}
	return var_77e61fc6;
}

