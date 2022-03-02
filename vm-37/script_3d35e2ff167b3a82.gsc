#using script_680dddbda86931fa;

#namespace namespace_a0d533d1;

/*
	Name: function_c92543a0
	Namespace: namespace_a0d533d1
	Checksum: 0xE30FA810
	Offset: 0x228
	Size: 0x6E
	Parameters: 2
	Flags: Private
*/
function private function_c92543a0(var_84704ed7, attachmentname)
{
	attachment = spawnstruct();
	attachment.id = var_84704ed7.id;
	attachment.var_bd027dd9 = var_84704ed7.var_bd027dd9;
	attachment.var_a6762160 = var_84704ed7.var_a6762160;
	attachment.var_4c342187 = attachmentname;
	return attachment;
}

/*
	Name: function_8b7b98f
	Namespace: namespace_a0d533d1
	Checksum: 0x58EEFE01
	Offset: 0x2A0
	Size: 0x2A0
	Parameters: 4
	Flags: Linked
*/
function function_8b7b98f(item, var_84704ed7, var_41a74919, var_31d2edc5)
{
	if(!isdefined(var_41a74919))
	{
		var_41a74919 = 1;
	}
	if(!isdefined(var_31d2edc5))
	{
		var_31d2edc5 = 0;
	}
	/#
		assert(isentity(item));
	#/
	/#
		assert(isstruct(var_84704ed7));
	#/
	if(!isdefined(item.var_a6762160) || item.var_a6762160.itemtype != #"weapon")
	{
		return false;
	}
	if(!isdefined(var_84704ed7.var_a6762160) || !isdefined(var_84704ed7.var_bd027dd9) || var_84704ed7.var_a6762160.itemtype != #"attachment")
	{
		return false;
	}
	if(isdefined(item.attachments))
	{
		foreach(attachment in item.attachments)
		{
			if(isdefined(attachment) && attachment.var_bd027dd9 == var_84704ed7.var_bd027dd9)
			{
				return false;
			}
		}
	}
	attachmentname = function_2ced1d34(item, var_84704ed7.var_a6762160, var_31d2edc5);
	if(!isdefined(attachmentname))
	{
		return false;
	}
	var_84704ed7.var_4c342187 = attachmentname;
	if(!isdefined(item.attachments))
	{
		item.attachments = [];
	}
	else if(!isarray(item.attachments))
	{
		item.attachments = array(item.attachments);
	}
	item.attachments[item.attachments.size] = var_84704ed7;
	if(var_41a74919)
	{
		function_6e9e7169(item);
	}
	return true;
}

/*
	Name: function_9e9c82a6
	Namespace: namespace_a0d533d1
	Checksum: 0x3073810E
	Offset: 0x548
	Size: 0x2C0
	Parameters: 4
	Flags: None
*/
function function_9e9c82a6(item, var_84704ed7, var_41a74919, var_31d2edc5)
{
	if(!isdefined(var_41a74919))
	{
		var_41a74919 = 1;
	}
	if(!isdefined(var_31d2edc5))
	{
		var_31d2edc5 = 0;
	}
	/#
		assert(isstruct(item));
	#/
	/#
		assert(isstruct(var_84704ed7));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160) || item.var_a6762160.itemtype != #"weapon")
	{
		return false;
	}
	if(!isdefined(var_84704ed7) || !isdefined(var_84704ed7.var_a6762160) || !isdefined(var_84704ed7.var_bd027dd9) || var_84704ed7.var_a6762160.itemtype != #"attachment")
	{
		return false;
	}
	if(isdefined(item.attachments))
	{
		foreach(attachment in item.attachments)
		{
			if(isdefined(attachment) && attachment.var_bd027dd9 == var_84704ed7.var_bd027dd9)
			{
				return false;
			}
		}
	}
	attachmentname = function_2ced1d34(item, var_84704ed7.var_a6762160, var_31d2edc5);
	if(!isdefined(attachmentname))
	{
		return false;
	}
	var_84704ed7.var_4c342187 = attachmentname;
	if(!isdefined(item.attachments))
	{
		item.attachments = [];
	}
	else if(!isarray(item.attachments))
	{
		item.attachments = array(item.attachments);
	}
	item.attachments[item.attachments.size] = var_84704ed7;
	if(var_41a74919)
	{
		function_6e9e7169(item);
	}
	return true;
}

/*
	Name: function_2ced1d34
	Namespace: namespace_a0d533d1
	Checksum: 0x8B94C3A8
	Offset: 0x810
	Size: 0x514
	Parameters: 3
	Flags: Linked
*/
function function_2ced1d34(item, var_fe35755b, var_21055e1a)
{
	if(!isdefined(var_21055e1a))
	{
		var_21055e1a = 0;
	}
	/#
		assert(isdefined(item));
	#/
	/#
		assert(isdefined(var_fe35755b));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return;
	}
	if(!isdefined(var_fe35755b))
	{
		return;
	}
	if(item.var_a6762160.itemtype != #"weapon")
	{
		/#
			assert(0, "");
		#/
		return;
	}
	if(var_fe35755b.itemtype != #"attachment")
	{
		/#
			assert(0, "");
		#/
		return;
	}
	if(!isdefined(var_fe35755b.attachments) || var_fe35755b.attachments.size <= 0)
	{
		return;
	}
	weapon = namespace_ad5a0cd6::function_35e06774(item.var_a6762160);
	if(isdefined(weapon) && isdefined(weapon.statname) && weapon.statname != #"" && !isdefined(weapon.dualwieldweapon))
	{
		weapon = getweapon(weapon.statname);
	}
	if(!isdefined(weapon) || !isdefined(weapon.supportedattachments) || weapon.supportedattachments.size <= 0)
	{
		return;
	}
	supportedattachments = weapon.supportedattachments;
	var_a2fe3d54 = undefined;
	foreach(attachment in var_fe35755b.attachments)
	{
		if(!isdefined(attachment))
		{
			continue;
		}
		attachmenttype = attachment.var_6be1bec7;
		if(!isdefined(attachmenttype) || attachmenttype == "")
		{
			continue;
		}
		foreach(var_987851f5 in weapon.supportedattachments)
		{
			if(attachmenttype == var_987851f5)
			{
				var_a2fe3d54 = attachmenttype;
				break;
			}
		}
		if(isdefined(var_a2fe3d54))
		{
			break;
		}
	}
	if(!isdefined(var_a2fe3d54))
	{
		return;
	}
	if(isdefined(item.attachments) && !var_21055e1a)
	{
		foreach(attachment in item.attachments)
		{
			if(!isdefined(attachment))
			{
				continue;
			}
			if(attachment.var_4c342187 === var_a2fe3d54)
			{
				return;
			}
		}
	}
	foreach(slot in array("attachSlotOptics", "attachSlotMuzzle", "attachSlotBarrel", "attachSlotUnderbarrel", "attachSlotBody", "attachSlotMagazine", "attachSlotHandle", "attachSlotStock"))
	{
		if(!isdefined(var_fe35755b.(slot)))
		{
			continue;
		}
		if(var_fe35755b.(slot) && !is_true(item.var_a6762160.(slot)))
		{
			return;
		}
	}
	return var_a2fe3d54;
}

/*
	Name: function_dfaca25e
	Namespace: namespace_a0d533d1
	Checksum: 0x89088908
	Offset: 0xD30
	Size: 0x1A
	Parameters: 2
	Flags: Linked
*/
function function_dfaca25e(weaponid, var_259f58f3)
{
	return weaponid + var_259f58f3;
}

/*
	Name: function_837f4a57
	Namespace: namespace_a0d533d1
	Checksum: 0x60A6CED8
	Offset: 0xD58
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_837f4a57(var_fe35755b)
{
	if(!isdefined(var_fe35755b) || var_fe35755b.itemtype != #"attachment")
	{
		return;
	}
	slots = array("attachSlotOptics", "attachSlotMuzzle", "attachSlotBarrel", "attachSlotUnderbarrel", "attachSlotBody", "attachSlotMagazine", "attachSlotHandle", "attachSlotStock");
	offsets = array(1, 2, 3, 4, 5, 6, 7, 8);
	/#
		assert(slots.size == offsets.size);
	#/
	for(index = 0; index < offsets.size; index++)
	{
		slot = slots[index];
		if(!isdefined(var_fe35755b.(slot)))
		{
			continue;
		}
		return offsets[index];
	}
}

/*
	Name: function_d8cebda3
	Namespace: namespace_a0d533d1
	Checksum: 0x8D953D5F
	Offset: 0xEA8
	Size: 0x12E
	Parameters: 1
	Flags: Linked
*/
function function_d8cebda3(var_a6762160)
{
	/#
		assert(isstruct(var_a6762160));
	#/
	mutators = 0;
	if(isdefined(var_a6762160))
	{
		var_b80d223d = array("doubleinventory", "doublesmallcaliber", "doublear", "doublelargecaliber", "doublesniper", "doubleshotgun", "doublespecial", "doublesmallhealth", "doublemediumhealth", "doublelargehealth", "doublesquadhealth", "doublelethalgrenades", "doubletacticalgrenades", "doubleequipment");
		for(index = 0; index < var_b80d223d.size; index++)
		{
			if(is_true(var_a6762160.(var_b80d223d[index])))
			{
				mutators = mutators | (1 << index);
			}
		}
	}
	return mutators;
}

/*
	Name: function_2879cbe0
	Namespace: namespace_a0d533d1
	Checksum: 0xDBC80FE0
	Offset: 0xFE0
	Size: 0x256
	Parameters: 2
	Flags: Linked
*/
function function_2879cbe0(mutators, var_95162a97)
{
	/#
		assert(isint(mutators));
	#/
	/#
		assert(isweapon(var_95162a97));
	#/
	if(!isdefined(level.var_98c8f260))
	{
		level.var_98c8f260 = [];
		var_13339abf = array(#"hash_837a6ea0c2864a8", #"hash_1cdb9172a79b9080", #"hash_54f3f08c1d7d45d3", #"hash_4ab594460fa1627b", #"hash_f9e29721ba5715e", #"hash_75bef4d329c1080b");
		var_c2043143 = array(2, 4, 8, 16, 32, 64);
		for(index = 0; index < var_13339abf.size; index++)
		{
			var_375298f3 = var_13339abf[index];
			var_f415ce36 = getscriptbundle(var_375298f3);
			if(!isdefined(var_f415ce36))
			{
				continue;
			}
			weapon = var_f415ce36.weapon;
			/#
				assert(isdefined(weapon));
			#/
			if(!isdefined(weapon))
			{
				continue;
			}
			var_3160a910 = weapon.ammoindex;
			level.var_98c8f260[var_3160a910] = var_c2043143[index];
		}
	}
	maxammo = var_95162a97.maxammo;
	var_6f2df38a = level.var_98c8f260[var_95162a97.ammoindex];
	if(isdefined(var_6f2df38a) && mutators & var_6f2df38a)
	{
		maxammo = maxammo * 2;
	}
	return maxammo;
}

/*
	Name: function_cfa794ca
	Namespace: namespace_a0d533d1
	Checksum: 0x182D5FEB
	Offset: 0x1240
	Size: 0x706
	Parameters: 2
	Flags: Linked
*/
function function_cfa794ca(mutators, var_a6762160)
{
	/#
		assert(isdefined(var_a6762160));
	#/
	weapon = namespace_ad5a0cd6::function_35e06774(var_a6762160);
	if(isdefined(weapon))
	{
		if(weapon.name == #"eq_tripwire")
		{
			if(mutators & 8192)
			{
				return 8;
			}
			return 4;
		}
		if(var_a6762160.itemtype == #"health")
		{
			var_9b624be0 = array(#"hash_1abfcce0e9955057", #"hash_ff50c93155e445f", #"hash_80292d121740f6f", #"hash_45ced3880667df22", #"hash_20699a922abaf2e1");
			var_448bc079 = array(128, 256, 512, 1024, 256);
			for(index = 0; index < var_9b624be0.size; index++)
			{
				if(var_a6762160.name != var_9b624be0[index])
				{
					continue;
				}
				if(mutators & var_448bc079[index])
				{
					return (isdefined(var_a6762160.stackcount) ? var_a6762160.stackcount : 1) * 2;
				}
			}
		}
		else if(function_1507e6f0(var_a6762160))
		{
			var_3e9ef0a1 = array(array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de"), array(#"hash_627144159973c325", #"hash_676aa70930960427", #"hash_1a7edb90a484158b", #"hash_234815c9f71b452d", #"hash_745d80b3e4f28da1", #"hash_56e573d15c6402bc", #"hash_7126c22f114c7382", #"hash_213093d947c30be6", #"hash_7e8c84081fafaea4", #"hash_5f67f7b32b01ae53", #"hash_725e305ff465e73d", #"hash_6ab225c69027e657", #"hash_7f37566c7dd7ecb", #"hash_76ebb51bb24696a1", #"hash_51f70aff8a2ad330", #"hash_689c84ba4e75b1c8", #"hash_655ce01a6ec0cc8b", #"hash_77975eb76986243d"), array(#"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f"));
			var_24e18bcb = array(2048, 4096, 8192);
			for(var_25c45152 = 0; var_25c45152 < var_3e9ef0a1.size; var_25c45152++)
			{
				if(!mutators & var_24e18bcb[var_25c45152])
				{
					continue;
				}
				var_3e45b393 = var_3e9ef0a1[var_25c45152];
				for(index = 0; index < var_3e45b393.size; index++)
				{
					if(var_a6762160.name != var_3e45b393[index])
					{
						continue;
					}
					return (isdefined(var_a6762160.stackcount) ? var_a6762160.stackcount : 1) * 2;
				}
			}
		}
		return (isdefined(var_a6762160.stackcount) ? var_a6762160.stackcount : 1);
	}
	return (isdefined(var_a6762160.stackcount) ? var_a6762160.stackcount : 1);
}

/*
	Name: function_ca5531a5
	Namespace: namespace_a0d533d1
	Checksum: 0x67ED1DB0
	Offset: 0x1950
	Size: 0x20C
	Parameters: 5
	Flags: None
*/
function function_ca5531a5(inventory, var_a6762160, item, itemtype, var_310b4dff)
{
	/#
		assert(isdefined(inventory));
	#/
	/#
		assert(isdefined(var_a6762160));
	#/
	/#
		assert(isdefined(itemtype));
	#/
	/#
		assert(isarray(var_310b4dff));
	#/
	if(var_a6762160.itemtype != itemtype)
	{
		return;
	}
	var_efc570b5 = undefined;
	var_accd61d5 = var_310b4dff;
	for(index = var_accd61d5.size - 1; index >= 0; index--)
	{
		slotid = var_accd61d5[index];
		if(isdefined(item))
		{
			var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(slotid);
			if(self.inventory.items[slotid].var_bd027dd9 !== 32767 && self.inventory.items[slotid].var_bd027dd9 == item.var_bd027dd9)
			{
				var_efc570b5 = slotid;
				break;
			}
		}
		if(inventory.items[slotid].var_bd027dd9 == 32767 || inventory.items[slotid].count <= 0)
		{
			var_efc570b5 = slotid;
			continue;
		}
		if(function_73593286(inventory.items[slotid].var_a6762160, var_a6762160))
		{
			var_efc570b5 = undefined;
			break;
		}
	}
	return var_efc570b5;
}

/*
	Name: function_417ec8b9
	Namespace: namespace_a0d533d1
	Checksum: 0x87384A75
	Offset: 0x1B68
	Size: 0xB2
	Parameters: 1
	Flags: None
*/
function function_417ec8b9(var_a6762160)
{
	if(!isdefined(var_a6762160))
	{
		/#
			assert(0);
		#/
		return;
	}
	switch(var_a6762160.itemtype)
	{
		case "hash_63c2e59c903465e6":
		{
			return 14;
		}
		case "hash_63c2e49c90346433":
		{
			return 15;
		}
		case "hash_63c2e39c90346280":
		{
			return 16;
		}
		default:
		{
			/#
				assert(0);
			#/
		}
	}
}

/*
	Name: function_4bd83c04
	Namespace: namespace_a0d533d1
	Checksum: 0xBA97E7F5
	Offset: 0x1C28
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_4bd83c04(item)
{
	/#
		assert(isdefined(item));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return false;
	}
	foreach(slot in array("attachSlotOptics", "attachSlotMuzzle", "attachSlotBarrel", "attachSlotUnderbarrel", "attachSlotBody", "attachSlotMagazine", "attachSlotHandle", "attachSlotStock"))
	{
		if(is_true(item.var_a6762160.(slot)))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_169cea63
	Namespace: namespace_a0d533d1
	Checksum: 0xF16C6A8D
	Offset: 0x1D60
	Size: 0x1AA
	Parameters: 0
	Flags: Linked
*/
function function_169cea63()
{
	/#
		assert(isplayer(self));
	#/
	if(!(isdefined(getgametypesetting(#"hash_7c8ad12994670d63")) ? getgametypesetting(#"hash_7c8ad12994670d63") : 0))
	{
		return array();
	}
	if(!isplayer(self))
	{
		return array();
	}
	var_bcb39afb = self function_cf9658ca();
	var_a448692e = [];
	var_bc8a634e = associativearray(#"ar_galil_t8", 1);
	foreach(weaponname in var_bcb39afb)
	{
		if(isdefined(var_bc8a634e[weaponname]))
		{
			continue;
		}
		var_a448692e[var_a448692e.size] = weaponname;
	}
	return var_a448692e;
}

/*
	Name: function_70b12595
	Namespace: namespace_a0d533d1
	Checksum: 0xC46DBEA4
	Offset: 0x1F18
	Size: 0x1CC
	Parameters: 1
	Flags: None
*/
function function_70b12595(item)
{
	/#
		assert(isdefined(item));
	#/
	/#
		assert(isdefined(item.var_a6762160));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return 0;
	}
	if(!isdefined(item.attachments) || !isdefined(item.var_a6762160.attachments))
	{
		return 1;
	}
	if(item.attachments.size < item.var_a6762160.attachments.size)
	{
		var_8697fbe7 = 0;
		foreach(attachment in item.var_a6762160.attachments)
		{
			var_fe35755b = getscriptbundle(attachment.var_6be1bec7);
			if(!isdefined(var_fe35755b) || var_fe35755b.type != #"hash_10587321f369e7f3" || !isarray(var_fe35755b.attachments))
			{
				continue;
			}
			var_8697fbe7++;
		}
		return item.attachments.size >= var_8697fbe7;
	}
	return 1;
}

/*
	Name: function_ee669356
	Namespace: namespace_a0d533d1
	Checksum: 0x6467D056
	Offset: 0x20F0
	Size: 0x262
	Parameters: 1
	Flags: None
*/
function function_ee669356(item)
{
	/#
		assert(isdefined(item));
	#/
	/#
		assert(isdefined(item.var_a6762160));
	#/
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return false;
	}
	if(!isdefined(item.attachments) || !isdefined(item.var_a6762160.attachments))
	{
		return true;
	}
	foreach(attachment in item.var_a6762160.attachments)
	{
		if(!namespace_ad5a0cd6::function_7363384a(attachment.var_6be1bec7))
		{
			continue;
		}
		var_84704ed7 = function_4ba8fde(attachment.var_6be1bec7);
		if(!isdefined(var_84704ed7) || !isdefined(var_84704ed7.var_a6762160))
		{
			return false;
		}
		if(!isdefined(item.attachments) || item.attachments.size <= 0)
		{
			return false;
		}
		hasattachment = 0;
		foreach(var_d7172da7 in item.attachments)
		{
			if(function_73593286(var_d7172da7.var_a6762160, var_84704ed7.var_a6762160))
			{
				hasattachment = 1;
				break;
			}
		}
		if(!hasattachment)
		{
			return false;
		}
	}
	return true;
}

/*
	Name: function_b6a27222
	Namespace: namespace_a0d533d1
	Checksum: 0xC604730B
	Offset: 0x2360
	Size: 0x16E
	Parameters: 1
	Flags: None
*/
function function_b6a27222(slotid)
{
	/#
		assert(isdefined(slotid));
	#/
	foreach(weaponslot in array(17 + 1, ((17 + 1) + 8) + 1))
	{
		foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
		{
			if(slotid == (weaponslot + var_259f58f3))
			{
				return true;
			}
		}
	}
	return false;
}

/*
	Name: function_73593286
	Namespace: namespace_a0d533d1
	Checksum: 0xFA317A20
	Offset: 0x24D8
	Size: 0x94
	Parameters: 2
	Flags: Linked
*/
function function_73593286(var_2ff7916e, var_21b4f4e9)
{
	if(!isdefined(var_2ff7916e) || !isdefined(var_21b4f4e9))
	{
		return 0;
	}
	var_f9adb977 = (isdefined(var_2ff7916e.parentname) ? var_2ff7916e.parentname : var_2ff7916e.name);
	var_a3508cbe = (isdefined(var_21b4f4e9.parentname) ? var_21b4f4e9.parentname : var_21b4f4e9.name);
	return var_f9adb977 == var_a3508cbe;
}

/*
	Name: function_819781bf
	Namespace: namespace_a0d533d1
	Checksum: 0xE611C66B
	Offset: 0x2578
	Size: 0x50
	Parameters: 0
	Flags: Linked
*/
function function_819781bf()
{
	return true;
}

/*
	Name: function_1507e6f0
	Namespace: namespace_a0d533d1
	Checksum: 0x3AF22AD4
	Offset: 0x25D0
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_1507e6f0(var_a6762160)
{
	return var_a6762160.itemtype == #"equipment" || var_a6762160.itemtype == #"field_upgrade" || var_a6762160.itemtype == #"tactical";
}

/*
	Name: function_398b9770
	Namespace: namespace_a0d533d1
	Checksum: 0x2D6C50DA
	Offset: 0x2640
	Size: 0xF2
	Parameters: 2
	Flags: Linked
*/
function function_398b9770(var_4838b749, var_f9f8c0b5)
{
	/#
		assert(isdefined(var_4838b749));
	#/
	/#
		assert(isdefined(var_f9f8c0b5));
	#/
	foreach(var_259f58f3 in array(1, 2, 3, 4, 5, 6, 7, 8))
	{
		if(var_f9f8c0b5 == (var_4838b749 + var_259f58f3))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_31a0b1ef
	Namespace: namespace_a0d533d1
	Checksum: 0xEA077332
	Offset: 0x2740
	Size: 0x1F8
	Parameters: 3
	Flags: None
*/
function function_31a0b1ef(item, var_84704ed7, var_41a74919)
{
	if(!isdefined(var_41a74919))
	{
		var_41a74919 = 1;
	}
	/#
		assert(isstruct(item));
	#/
	/#
		assert(isstruct(var_84704ed7));
	#/
	if(!isdefined(item) || !isdefined(item.attachments) || item.attachments.size <= 0 || !isdefined(item.var_a6762160) || item.var_a6762160.itemtype != #"weapon")
	{
		return 0;
	}
	if(!isdefined(var_84704ed7) || !isdefined(var_84704ed7.var_a6762160) || var_84704ed7.var_a6762160.itemtype != #"attachment")
	{
		return 0;
	}
	var_2496b555 = 0;
	for(index = 0; index < item.attachments.size; index++)
	{
		attachment = item.attachments[index];
		if(isdefined(attachment) && attachment.var_bd027dd9 === var_84704ed7.var_bd027dd9)
		{
			var_2496b555 = 1;
			arrayremoveindex(item.attachments, index, 0);
			break;
		}
	}
	if(var_2496b555 && var_41a74919)
	{
		function_6e9e7169(item);
	}
	return var_2496b555;
}

/*
	Name: function_6e9e7169
	Namespace: namespace_a0d533d1
	Checksum: 0x644D948C
	Offset: 0x2940
	Size: 0x1F2
	Parameters: 1
	Flags: Linked
*/
function function_6e9e7169(item)
{
	/#
		assert(isdefined(item));
	#/
	weapon = namespace_ad5a0cd6::function_35e06774(item.var_a6762160);
	if(!isdefined(weapon))
	{
		return;
	}
	attachments = weapon.attachments;
	if(isdefined(item.attachments))
	{
		foreach(attachment in item.attachments)
		{
			if(isdefined(attachment))
			{
				attachments[attachments.size] = attachment.var_4c342187;
			}
		}
	}
	weapon = getweapon(weapon.name, attachments);
	weapon = function_1242e467(weapon);
	if(is_true(item.var_59361ab4))
	{
		weapon = function_eeddea9a(weapon, 1);
	}
	/#
		assert(weapon.attachments.size == attachments.size, ((("" + attachments.size) + "") + function_9e72a96(weapon.name) + "") + weapon.attachments.size);
	#/
	item.var_627c698b = weapon;
}

/*
	Name: function_2b83d3ff
	Namespace: namespace_a0d533d1
	Checksum: 0x1506A4F7
	Offset: 0x2B40
	Size: 0xEA
	Parameters: 1
	Flags: Linked
*/
function function_2b83d3ff(item)
{
	/#
		assert(isdefined(item));
	#/
	if(!isdefined(item))
	{
		return undefined;
	}
	if(isdefined(item.var_627c698b))
	{
		return item.var_627c698b;
	}
	if(isdefined(item.weaponoverride))
	{
		return item.weaponoverride;
	}
	if(isdefined(item.weapon))
	{
		return item.weapon;
	}
	var_48cfb6ca = 0;
	if(!isdefined(item.attachments) && isdefined(item.var_a6762160) && isdefined(item.var_a6762160.attachments))
	{
		var_48cfb6ca = 1;
	}
	return namespace_ad5a0cd6::function_35e06774(item.var_a6762160, var_48cfb6ca);
}

