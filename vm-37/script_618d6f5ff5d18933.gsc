#using script_101d8280497ff416;
#using script_158d50d476435605;
#using script_3d35e2ff167b3a82;
#using script_3d5887fc414a86fb;
#using script_474309807eb94f34;
#using script_680dddbda86931fa;
#using script_6971dbf38c33bf47;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace item_world;

/*
	Name: function_89f2df9
	Namespace: item_world
	Checksum: 0xED216154
	Offset: 0x408
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"item_world", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: item_world
	Checksum: 0x8378F88F
	Offset: 0x450
	Size: 0x113C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!namespace_ad5a0cd6::use_item_spawns())
	{
		return;
	}
	register_client_fields();
	level.var_2c47298b = [];
	level.var_89f832ca = [];
	level.var_62c91473 = [];
	level.var_ce95aace = [];
	level.var_7e2f5883 = [];
	level.var_19cf0be9 = [];
	level.var_fc13a25a = [];
	level.var_d42ffee1 = [];
	level.var_418d51ad = array(#"hash_837a6ea0c2864a8", #"hash_1cdb9172a79b9080", #"hash_54f3f08c1d7d45d3", #"hash_4ab594460fa1627b", #"hash_f9e29721ba5715e", #"hash_75bef4d329c1080b");
	level.var_69ee9282 = array(#"hash_568173e016d45c2a", #"hash_8578856a247ab60", #"hash_6f80136c3b79d9e", #"hash_2661e6734ef7668", #"hash_41c0e83a04d8c646", #"hash_101c48eb461af954", #"hash_7bc70addda19ca00", #"hash_7777b2b5970da847", #"hash_35675bbd363f934a");
	level.var_6cb314b1 = array(#"hash_18e6f0326e75bce4", #"hash_23c6d9e19274be66", #"hash_a1deb882d59a069", #"hash_5506836b90ed93a9", #"hash_7961d565386d1c56", #"hash_2b2bf36e2ea5ab8f", #"hash_19c5c6ca805715e5", #"hash_559f58d5af0b432d", #"hash_460aadea32c22c61", #"hash_2a10ad247a663aaa", #"hash_43b78d5eff27f2f7", #"hash_66023e3bee6c58a1", #"hash_513a787ad3a20198", #"hash_38821d90f8209d05", #"hash_43d8944b55b1e63c", #"hash_7bdf38527a146679", #"hash_5cadbeaa35cf0a4b", #"hash_74efc2f0523a1b43", #"hash_5951baf77aea4bb5", #"hash_28efceaacc63752f", #"hash_3e4ff275ec81e8b1", #"hash_af064392d860f1f", #"hash_20b99d912e487ba1", #"hash_62fe2eebac0f72a4", #"hash_52158dff02a348c", #"hash_2cdf0a02b981e7ea", #"hash_628946b7b73932f2", #"hash_4675294c5c3e11d4", #"hash_3ff4acf337c05bc", #"hash_347f02dfc677355a", #"hash_19f62bc8c271d062", #"hash_57d51fc4b72dcd7b", #"hash_6d40b7ae79307bad", #"hash_7212c9ac06e56bab", #"hash_2107d3747677659d", #"hash_2551991b0ce4278e", #"hash_67b9395b2e0029e6", #"hash_43a7c00ebad019fc", #"hash_29445e5eef449964", #"hash_8337602f5a165af", #"hash_68c9e1eaf1008e31", #"hash_7ec532c309e0eef7", #"hash_e5c35c6be678059", #"hash_780b6e02fd11b515", #"hash_1e87409dae378d95", #"hash_57976ae65aa47edf", #"hash_77228486973b1c5f", #"hash_72c4fa7a2b91b0b3", #"hash_3458660ffe1b7fa5", #"hash_5e8e59ff7a020c33", #"hash_2a9b80bf6e719e25", #"hash_2b8002d0d1dd882a", #"hash_c8e1dbdf1b9a532", #"hash_776efcf8d78c80", #"hash_70e74393ae147f98", #"hash_12aaf0a984a5418b", #"hash_5dd5b8fd48364b3d", #"hash_767e2b6d5150883b", #"hash_14cdaa7fd97c546d", #"hash_6cd8671e4bd51c28", #"hash_57d83338a5296980", #"hash_59f84dd254fda616", #"hash_66b9864ca183b4ae", #"hash_3bf739cbe86888f0", #"hash_1cafcd4206d28888");
	level.var_3fd5d8f0 = array(#"hash_53a2516ec1d3a096", #"hash_29548403dc2ff36d", #"hash_49b7001ce02a0797", #"hash_3074c41bb205ed8c", #"hash_732cfbea10210169", #"hash_6174ad2674c82ec3", #"hash_2b5027622c0b6d07", #"hash_4cec712579f1202f", #"hash_6d0e3a9a902d2201", #"hash_1223df8e913d431b", #"hash_57504010ce1814dc", #"hash_5752a7e130ea202a", #"hash_73b7240912c1f754", #"hash_49c0448e11cb523c", #"hash_4edf613e9b9032da", #"hash_28da32d9304b6296", #"hash_4a2739676c12d92a", #"hash_140318e970e711ce", #"hash_50b970644e43947b", #"hash_49bb95f2912e68ad", #"hash_3c9430c4ac7d082e", #"hash_6a5294b915f32d32", #"hash_6cd8041bb6cd21b1", #"hash_6a07ccefe7f84985", #"hash_17f8849a56eba20f", #"hash_281638550b45be2a", #"hash_61247be669e9b732", #"hash_2c9b75b17410f2de", #"hash_627144159973c325", #"hash_676aa70930960427", #"hash_1a7edb90a484158b", #"hash_234815c9f71b452d", #"hash_745d80b3e4f28da1", #"hash_56e573d15c6402bc", #"hash_7126c22f114c7382", #"hash_213093d947c30be6", #"hash_7e8c84081fafaea4", #"hash_5f67f7b32b01ae53", #"hash_725e305ff465e73d", #"hash_6ab225c69027e657", #"hash_7f37566c7dd7ecb", #"hash_76ebb51bb24696a1", #"hash_51f70aff8a2ad330", #"hash_689c84ba4e75b1c8", #"hash_655ce01a6ec0cc8b", #"hash_77975eb76986243d", #"hash_665eccfe5d58f636", #"hash_12fde8b0da04d262", #"hash_2b06a3f530395182", #"hash_16a1f841da0b877d", #"hash_1242946e889704c7", #"hash_14b578e446580ad5", #"hash_300914db9caf4033", #"hash_3a3d830a9a4559d4", #"hash_743b859c2367ff54", #"hash_5e5f2ed57ac4601f", #"hash_105f32560e2fb0fe", #"hash_18056dab055a44c9", #"hash_2e8b13391f6544", #"hash_7f877a112c8c4187", #"hash_7aca06dcd83beef3", #"hash_1ae9ade20084359f");
	level.var_9bc8c1bc = array(#"hash_1abfcce0e9955057", #"hash_ff50c93155e445f", #"hash_80292d121740f6f", #"hash_45ced3880667df22", #"hash_20699a922abaf2e1");
	level.var_683c7e30 = array(#"hash_5df4c523191c9bf7", #"hash_799f875c8f064a83", #"hash_332dd2a4956f495f", #"hash_5d7898105fc6595a", #"hash_1f0f67f0ad9a766", #"hash_61d6c77ca964fa5b", #"hash_2011eafeff274fc8", #"hash_3ccd209713ecb085", #"hash_58c7fc0e9b3387bf", #"hash_1b898a6e72d622d8", #"hash_5d35f83e51965781", #"hash_1a79c2970ba8bf79", #"hash_35f5430256d9c158", #"hash_750be705a5c4201e", #"hash_3d82033b67579745");
	level.var_e93e16b = array(#"hash_347dc9157efc6a42", #"hash_3063198fc139e3b0", #"hash_2f73719d945fc6b5", #"hash_6d33368b7b126df8", #"hash_1caa1516c9ea66af", #"hash_199230a69a867bf8", #"hash_1efebec8697e5720", #"hash_59da79c0dcf9cf76", #"hash_21779574e3841392", #"hash_52083f0c0759df13", #"hash_321c0010d0c7fdc5", #"hash_7a53240a3664fe64", #"hash_52d37104fb5e6eb5", #"hash_363ed03cee79d627", #"hash_1b69ed326eaa32c4", #"hash_2a4214db930e08a7", #"hash_6fbf66e753d55ddd", #"hash_7dced4169cb1c6bd", #"hash_6857c7a83fc6cdb1", #"hash_e0a40edfec418ef", #"hash_1bd3cb5b4becaad9", #"hash_9dcbf9df7b19434", #"hash_2799bb4fa8f20048", #"hash_1bfc7320c1335797", #"hash_524268075ef65e1e", #"hash_499748ba05372c7", #"hash_250876d81f2e6f6e", #"hash_32834da10f1048b0");
	level.var_b9917a92 = array(#"hash_347dc9157efc6a42", #"hash_3063198fc139e3b0", #"hash_2f73719d945fc6b5", #"hash_7313f9c02b023a53", #"hash_6cfcc2143e6ee6ee", #"hash_38628762fb7c16eb", #"hash_75ed0988ff325bea", #"hash_298f2c53101e30eb", #"hash_75c91bcbb2ac5f3", #"hash_154ee1cd494fed23", #"hash_75142ec69bd0df71", #"hash_29f4e28734c2613d", #"hash_938a51cfa9e21fe", #"hash_6c6c011df03c8f18", #"hash_3aa75724345f7f87", #"hash_47b346d1e63e6488", #"hash_36349aad8f680651", #"hash_67066bd07e97f183", #"hash_4e96ed69230e28a2", #"hash_11366e8cbf37dea7", #"hash_38406c9af972cfc8", #"hash_7868873aabca7422", #"hash_15f30a19a23c0190", #"hash_36978e3a9321b430", #"hash_15cefca07f84f894", #"hash_73ba92c06ae7102a", #"hash_6e9c599da45ee952", #"hash_25b4ece6d3e0173c", #"hash_59cfdb25a9e268d7", #"hash_60d59d946f08ce33", #"hash_6a992c957fb327bb", #"hash_4de51ae74e7ee746", #"hash_6bbeca41cf389982", #"hash_2e486f8abfbeba49", #"hash_5cc9b5e23093ac03", #"hash_20a15fcfdd27d464", #"hash_2c228a7b8b32e6b9", #"hash_3d4da55492286012", #"hash_1027e27ab32a64ef", #"hash_32c805d452b5f91b");
	level.var_be4583aa = spawnstruct();
	level.var_be4583aa.var_2e3efdda = &function_2e3efdda;
	level.var_be4583aa.var_9b71de90 = &function_9b71de90;
	level.var_d89ef54a = getgametypesetting(#"hash_2f0beae14bf17810");
	level.weaponbasemeleeheld = getweapon(#"bare_hands");
	callback::on_localclient_connect(&function_86c5661a);
	callback::on_localplayer_spawned(&function_1877f414);
	level.var_45ca79e5 = &function_9160538;
	level.var_a6c75fcb = &function_9e4552fe;
	level.var_d342a3fd = [];
	if(!isdefined(level.var_5862f2ce))
	{
		level.var_5862f2ce = [];
	}
	if(!isdefined(level.var_a4a4012e))
	{
		level.var_a4a4012e = [];
	}
	if(!isdefined(level.var_624588d5))
	{
		level.var_624588d5 = [];
	}
	level thread namespace_65181344::init_spawn_system();
}

/*
	Name: register_client_fields
	Namespace: item_world
	Checksum: 0x1059EB25
	Offset: 0x1598
	Size: 0x1FC
	Parameters: 0
	Flags: Linked, Private
*/
function private register_client_fields()
{
	clientfield::register("world", "item_world_seed", 1, 31, "int", &function_4e9220ab, 1, 0);
	clientfield::register("world", "item_world_sanity_random", 1, 16, "int", &function_7e3cc2ff, 1, 0);
	clientfield::register("world", "item_world_disable", 1, 1, "int", &function_60386766, 0, 0);
	clientfield::function_a8bbc967("hudItems.pickupHintGold", #"hud_items", #"hash_32da46b7138b722e", 1, 1, "int", undefined, 0, 0);
	clientfield::register("scriptmover", "item_world_attachments", 1, 1, "int", undefined, 0, 0);
	clientfield::register("toplayer", "disableItemPickup", 1, 1, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.multiItemPickup.status", #"hash_23febb0b8f867ca1", #"status", 1, 3, "int", &function_38ebb2a1, 0, 1);
}

/*
	Name: function_38ebb2a1
	Namespace: item_world
	Checksum: 0xFEA18D37
	Offset: 0x17A0
	Size: 0x2F8
	Parameters: 7
	Flags: Linked, Private
*/
function private function_38ebb2a1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_8040e225 = function_a7e98a1a(binitialsnap);
	if(bwastimejump == 2)
	{
		var_8040e225.var_ff9e7e43 = 1;
		if(function_a5c2a6b8(binitialsnap))
		{
			var_8040e225.var_f0f7e918 = [];
			if(is_true(level.var_102be329))
			{
				setuimodelvalue(createuimodel(function_1df4c3b0(binitialsnap, #"hash_159966ba825013a2"), "canUseQuickInventory"), 0);
			}
		}
	}
	else
	{
		if(bwastimejump == 0)
		{
			var_8040e225.var_f0f7e918 = [];
			player = function_27673a7(binitialsnap);
			if(isplayer(player) && isalive(player))
			{
				player function_9116bb0e(binitialsnap, 1);
			}
		}
		if(is_true(level.var_102be329) && fieldname == 2)
		{
			for(i = 0; i < var_8040e225.inventory.var_c212de25; i++)
			{
				if(var_8040e225.inventory.items[i].var_bd027dd9 != 32767)
				{
					if(var_8040e225.inventory.items[i].availableaction == 1 || var_8040e225.inventory.items[i].availableaction == 4 || var_8040e225.inventory.items[i].availableaction == 2 || var_8040e225.inventory.items[i].availableaction == 6)
					{
						setuimodelvalue(createuimodel(function_1df4c3b0(binitialsnap, #"hash_159966ba825013a2"), "canUseQuickInventory"), 1);
						break;
					}
				}
			}
		}
	}
}

/*
	Name: function_9116bb0e
	Namespace: item_world
	Checksum: 0x4721019D
	Offset: 0x1AA0
	Size: 0xE34
	Parameters: 2
	Flags: Linked
*/
function function_9116bb0e(localclientnum, closed)
{
	if(!isdefined(closed))
	{
		closed = 0;
	}
	/#
		assert(isplayer(self));
	#/
	var_8040e225 = function_a7e98a1a(localclientnum);
	var_6e2c91d0 = function_1df4c3b0(localclientnum, #"hash_23febb0b8f867ca1");
	var_cc67e8b = createuimodel(var_6e2c91d0, "count");
	if(isdefined(var_8040e225.var_f0f7e918) && !closed)
	{
		arrayremovevalue(var_8040e225.var_f0f7e918, undefined, 0);
		foreach(i, itemdef in var_8040e225.var_f0f7e918)
		{
			var_23c48bd3 = createuimodel(var_6e2c91d0, "item" + i);
			setuimodelvalue(createuimodel(var_23c48bd3, "id"), itemdef.var_bd027dd9);
			if(!isdefined(itemdef.var_a6762160))
			{
				setuimodelvalue(createuimodel(var_23c48bd3, "inventoryFull"), 0);
				setuimodelvalue(createuimodel(var_23c48bd3, "icon"), #"blacktransparent");
				setuimodelvalue(createuimodel(var_23c48bd3, "rarity"), "none");
				setuimodelvalue(createuimodel(var_23c48bd3, "name"), #"");
				setuimodelvalue(createuimodel(var_23c48bd3, "claimsInventorySlot"), 0);
				setuimodelvalue(createuimodel(var_23c48bd3, "stackCount"), 0);
				setuimodelvalue(createuimodel(var_23c48bd3, "stashStackSize"), 0);
				setuimodelvalue(createuimodel(var_23c48bd3, "armorTier"), 1);
				setuimodelvalue(createuimodel(var_23c48bd3, "armor"), 0);
				setuimodelvalue(createuimodel(var_23c48bd3, "armorMax"), 1);
				setuimodelvalue(createuimodel(var_23c48bd3, "itemtype"), "none");
				setuimodelvalue(createuimodel(var_23c48bd3, "specialItem"), 0);
				setuimodelvalue(createuimodel(var_23c48bd3, "description"), #"");
				continue;
			}
			setuimodelvalue(createuimodel(var_23c48bd3, "itemtype"), itemdef.var_a6762160.itemtype);
			if(itemdef.var_a6762160.itemtype === #"ammo")
			{
				var_75c2784 = self function_c199bcc6(localclientnum, itemdef);
				setuimodelvalue(createuimodel(var_23c48bd3, "inventoryFull"), !var_75c2784);
			}
			else
			{
				if(itemdef.var_a6762160.itemtype === #"hash_56d6621e6c4caf07")
				{
					var_75c2784 = self function_87e71bc0(localclientnum, itemdef.var_a6762160);
					setuimodelvalue(createuimodel(var_23c48bd3, "inventoryFull"), !var_75c2784);
				}
				else
				{
					setuimodelvalue(createuimodel(var_23c48bd3, "inventoryFull"), 0);
				}
			}
			description = (isdefined(itemdef.var_a6762160.description) ? itemdef.var_a6762160.description : #"");
			if(description == #"" && isdefined(itemdef.var_a6762160.weapon))
			{
				itemindex = getitemindexfromref(itemdef.var_a6762160.weapon.name);
				var_97dcd0a5 = getunlockableiteminfofromindex(itemindex);
				if(isdefined(var_97dcd0a5) && isdefined(var_97dcd0a5.description))
				{
					description = var_97dcd0a5.description;
				}
			}
			setuimodelvalue(createuimodel(var_23c48bd3, "description"), (isdefined(description) ? description : #""));
			pickupicon = (isdefined(itemdef.var_a6762160.pickupicon) ? itemdef.var_a6762160.pickupicon : itemdef.var_a6762160.icon);
			var_9507cf45 = (isdefined(itemdef.var_a6762160.var_9507cf45) ? itemdef.var_a6762160.var_9507cf45 : pickupicon);
			setuimodelvalue(createuimodel(var_23c48bd3, "icon"), (isdefined(var_9507cf45) ? var_9507cf45 : #"blacktransparent"));
			setuimodelvalue(createuimodel(var_23c48bd3, "rarity"), itemdef.var_a6762160.rarity);
			setuimodelvalue(createuimodel(var_23c48bd3, "name"), get_item_name(itemdef.var_a6762160));
			claimsinventoryslot = namespace_b376ff3f::function_7146ceb2(localclientnum, itemdef.var_a6762160) && !namespace_b376ff3f::function_a303c8ef(localclientnum, itemdef.var_a6762160);
			setuimodelvalue(createuimodel(var_23c48bd3, "claimsInventorySlot"), claimsinventoryslot);
			setuimodelvalue(createuimodel(var_23c48bd3, "stackCount"), 0);
			setuimodelvalue(createuimodel(var_23c48bd3, "stashStackSize"), 0);
			if(itemdef.var_a6762160.itemtype === #"armor")
			{
				setuimodelvalue(createuimodel(var_23c48bd3, "armorTier"), itemdef.var_a6762160.armortier);
				setuimodelvalue(createuimodel(var_23c48bd3, "armor"), (isdefined((isdefined(itemdef.amount) ? itemdef.amount : itemdef.var_a6762160.amount)) ? (isdefined(itemdef.amount) ? itemdef.amount : itemdef.var_a6762160.amount) : 0));
				setuimodelvalue(createuimodel(var_23c48bd3, "armorMax"), (isdefined(itemdef.var_a6762160.amount) ? itemdef.var_a6762160.amount : 1));
			}
			else
			{
				setuimodelvalue(createuimodel(var_23c48bd3, "armorTier"), 1);
				setuimodelvalue(createuimodel(var_23c48bd3, "armor"), 0);
				setuimodelvalue(createuimodel(var_23c48bd3, "armorMax"), 1);
			}
			if(is_true(itemdef.var_a6762160.stackable) || itemdef.var_a6762160.itemtype === #"ammo")
			{
				if(itemdef.var_a6762160.itemtype === #"ammo" || isstruct(itemdef) && !isdefined(itemdef.amount))
				{
					setuimodelvalue(createuimodel(var_23c48bd3, "stackCount"), (isdefined(itemdef.var_a6762160.amount) ? itemdef.var_a6762160.amount : 1));
				}
				else
				{
					setuimodelvalue(createuimodel(var_23c48bd3, "stackCount"), int(max((isdefined(itemdef.amount) ? itemdef.amount : 1), (isdefined(itemdef.count) ? itemdef.count : 1))));
				}
			}
			else
			{
				setuimodelvalue(createuimodel(var_23c48bd3, "stashStackSize"), (isdefined(itemdef.count) ? itemdef.count : 1));
			}
			if(is_true(itemdef.var_41f13734))
			{
				setuimodelvalue(createuimodel(var_23c48bd3, "specialItem"), 1);
			}
		}
		currentcount = getuimodelvalue(var_cc67e8b);
		setuimodelvalue(var_cc67e8b, var_8040e225.var_f0f7e918.size);
		var_aaa1adcb = createuimodel(var_6e2c91d0, "forceNotifyAmmoList");
		function_9a227103(var_aaa1adcb);
	}
	else
	{
		setuimodelvalue(var_cc67e8b, 0);
	}
}

/*
	Name: function_a5c2a6b8
	Namespace: item_world
	Checksum: 0x885A724E
	Offset: 0x28E0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_a5c2a6b8(localclientnum)
{
	return is_true(level.var_102be329) || !gamepadusedlast(localclientnum);
}

/*
	Name: function_3d7c12a6
	Namespace: item_world
	Checksum: 0xBA2B160C
	Offset: 0x2928
	Size: 0xF0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3d7c12a6(localclientnum, var_1bcc6d7e)
{
	var_ab111430 = [];
	for(i = 1; i <= var_1bcc6d7e; i++)
	{
		model = spawn(localclientnum, vectorscale((0, 0, -1), 10000), "script_model");
		model function_e082e650(localclientnum, undefined, #"tag_origin", 1);
		model hide();
		model notsolid();
		var_ab111430[i * -1] = model;
	}
	return var_ab111430;
}

/*
	Name: function_37175e73
	Namespace: item_world
	Checksum: 0x35BCB0A0
	Offset: 0x2A20
	Size: 0x104
	Parameters: 1
	Flags: Linked, Private
*/
function private function_37175e73(var_fee74908)
{
	level endon(#"game_ended");
	if(var_fee74908.size <= 0)
	{
		return;
	}
	level flag::wait_till_clear(#"hash_2d3b2a4d082ba5ee");
	level flag::wait_till(#"hash_51daecff754729dc");
	for(var_5473c308 = 0; var_5473c308 < var_fee74908.size; var_5473c308++)
	{
		for(var_82402c2 = 0; var_82402c2 < 32; var_82402c2++)
		{
			if(var_fee74908[var_5473c308] & (1 << var_82402c2))
			{
				itemindex = (var_5473c308 * 32) + var_82402c2;
				function_222205a3(-1, itemindex);
			}
		}
	}
}

/*
	Name: function_952d97dc
	Namespace: item_world
	Checksum: 0xBF0CA7F1
	Offset: 0x2B30
	Size: 0x334
	Parameters: 1
	Flags: Linked, Private
*/
function private function_952d97dc(localclientnum)
{
	data = spawnstruct();
	data.var_ab111430 = function_3d7c12a6(localclientnum, 125);
	data.var_d58b471d = 0;
	data.var_79b15dd1 = 0;
	data.var_ffc1c0e1 = [];
	data.var_baf65690 = [];
	level.var_d342a3fd[localclientnum] = data;
	if(!namespace_b376ff3f::function_7d5553ac())
	{
		namespace_b376ff3f::function_42e2bb1a(localclientnum);
	}
	level.var_d9beffb9 = util::getnextobjid(localclientnum);
	objective_add(localclientnum, level.var_d9beffb9, "invisible", #"weapon_pickup");
	level.var_383edf80 = util::getnextobjid(localclientnum);
	objective_add(localclientnum, level.var_383edf80, "invisible", #"multi_item_pickup");
	var_acc39f5a = function_1df4c3b0(localclientnum, #"hud_items");
	level.var_2c47298b[localclientnum] = createuimodel(var_acc39f5a, "showPickupHint");
	level.var_89f832ca[localclientnum] = createuimodel(var_acc39f5a, "pickupHintText");
	level.var_62c91473[localclientnum] = createuimodel(var_acc39f5a, "pickupHintTextOverride");
	level.var_ce95aace[localclientnum] = createuimodel(var_acc39f5a, "weapon3dHintState");
	level.var_7e2f5883[localclientnum] = createuimodel(var_acc39f5a, "weapon3dForcedHintItem");
	level.var_19cf0be9[localclientnum] = createuimodel(var_acc39f5a, "pickupHintImage");
	level.var_d42ffee1[localclientnum] = createuimodel(var_acc39f5a, "cursorHintIcon");
	level.var_437da950[localclientnum] = createuimodel(var_acc39f5a, "pickupRarity");
	level.var_d2215e8f[localclientnum] = createuimodel(var_acc39f5a, "pickupType");
	level.var_fc13a25a[localclientnum] = createuimodel(var_acc39f5a, "pickupCount");
	callback::callback(#"hash_2127e02e6728950d", localclientnum);
}

/*
	Name: function_cdd9b388
	Namespace: item_world
	Checksum: 0x34CD158D
	Offset: 0x2E70
	Size: 0x1B4
	Parameters: 0
	Flags: Private
*/
function private function_cdd9b388()
{
	/#
		self notify("");
		self endon("");
		self endon(#"shutdown");
		while(true)
		{
			waitframe(1);
			if(getdvarint(#"hash_3fdd3b60f349d462", 0))
			{
				if(isdefined(self))
				{
					origin = self.origin;
					var_f4b807cb = function_2e3efdda(origin, undefined, 128, 2000);
					foreach(item in var_f4b807cb)
					{
						hidden = (item.var_8e092725 > 0 ? "" : "");
						print3d(item.origin, ((("" + item.var_bd027dd9) + hidden) + "") + item.var_a6762160.name, (0, 0, 1), 1, 0.4);
					}
				}
			}
		}
	#/
}

/*
	Name: function_3ee12d25
	Namespace: item_world
	Checksum: 0xE3DCB79
	Offset: 0x3030
	Size: 0x6C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3ee12d25(localclientnum, model)
{
	if(!isdefined(model))
	{
		return;
	}
	if(isdefined(model.var_2584a90d))
	{
		model function_f6e99a8d(model.var_2584a90d);
	}
	model.var_2584a90d = undefined;
	function_2990e5f(localclientnum, model);
}

/*
	Name: function_2990e5f
	Namespace: item_world
	Checksum: 0x261570FA
	Offset: 0x30A8
	Size: 0xC2
	Parameters: 2
	Flags: Linked
*/
function function_2990e5f(localclientnum, model)
{
	if(!isdefined(model))
	{
		return;
	}
	if(isdefined(model.var_f7fa2943))
	{
		foreach(fx in model.var_f7fa2943)
		{
			stopfx(localclientnum, fx);
		}
		model.var_f7fa2943 = undefined;
	}
}

/*
	Name: function_48b8fc19
	Namespace: item_world
	Checksum: 0xC47964C1
	Offset: 0x3178
	Size: 0x27A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_48b8fc19(localclientnum)
{
	var_7d8899cd = function_d634ed59();
	for(index = 0; index < var_7d8899cd; index++)
	{
		point = function_b1702735(index);
		if(!isdefined(point) || !isdefined(point.var_a6762160))
		{
			break;
		}
		xmodel = function_78a9fd5f(point);
		if(isdefined(xmodel))
		{
			forcestreamxmodel(xmodel, 1, 1);
		}
		if(((index + 1) % 50) == 0)
		{
			waitframe(1);
		}
	}
	player = function_5c10bd79(localclientnum);
	while(!isdefined(player) || !isplayer(player) || !isdefined(player.type) || player.type != #"player" || player ishidden() || player isinfreefall() || player function_9a0edd92())
	{
		waitframe(1);
		player = function_5c10bd79(localclientnum);
	}
	wait(15);
	for(index = 0; index < var_7d8899cd; index++)
	{
		point = function_b1702735(index);
		if(!isdefined(point) || !isdefined(point.var_a6762160))
		{
			break;
		}
		xmodel = function_78a9fd5f(point);
		if(isdefined(xmodel))
		{
			stopforcestreamingxmodel(xmodel);
		}
		if(((index + 1) % 50) == 0)
		{
			waitframe(1);
		}
	}
}

/*
	Name: function_c17fe536
	Namespace: item_world
	Checksum: 0xE8BB6654
	Offset: 0x3400
	Size: 0x142
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c17fe536(localclientnum, var_8040e225, var_bd027dd9)
{
	model = function_839d4c20(localclientnum, var_8040e225, var_bd027dd9);
	if(!isdefined(model) && isdefined(var_bd027dd9) && namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
	{
		model = function_b1702735(var_bd027dd9);
		if(!namespace_ad5a0cd6::function_83c20f83(model))
		{
			model = undefined;
		}
	}
	if(!isdefined(model))
	{
		return;
	}
	var_1ba7b9c8 = arraysortclosest(level.var_5862f2ce, model.origin, 1, 0, 12);
	if(var_1ba7b9c8.size > 0)
	{
		return var_1ba7b9c8[0];
	}
	var_6594679a = arraysortclosest(level.var_624588d5, model.origin, 1, 0, 12);
	if(var_6594679a.size > 0)
	{
		return var_6594679a[0];
	}
}

/*
	Name: function_839d4c20
	Namespace: item_world
	Checksum: 0x4349E4DB
	Offset: 0x3550
	Size: 0x84
	Parameters: 3
	Flags: Linked, Private
*/
function private function_839d4c20(localclientnum, var_8040e225, var_bd027dd9)
{
	if(!isdefined(var_bd027dd9))
	{
		return;
	}
	if(isdefined(var_8040e225.var_ab111430[var_bd027dd9]))
	{
		model = var_8040e225.var_ab111430[var_bd027dd9];
	}
	else if(isdefined(level.var_a4a4012e[var_bd027dd9]))
	{
		model = level.var_a4a4012e[var_bd027dd9];
	}
	return model;
}

/*
	Name: function_61f5d33a
	Namespace: item_world
	Checksum: 0x4A8C9393
	Offset: 0x35E0
	Size: 0x98
	Parameters: 3
	Flags: Linked, Private
*/
function private function_61f5d33a(localclientnum, var_8040e225, var_bd027dd9)
{
	model = function_839d4c20(localclientnum, var_8040e225, var_bd027dd9);
	if(!isdefined(model) && namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
	{
		model = function_b1702735(var_bd027dd9);
		if(!namespace_ad5a0cd6::function_83c20f83(model))
		{
			model = undefined;
		}
	}
	return model;
}

/*
	Name: function_fcfd6064
	Namespace: item_world
	Checksum: 0x5F7579CD
	Offset: 0x3680
	Size: 0x28A
	Parameters: 4
	Flags: Linked
*/
function function_fcfd6064(localclientnum, var_a6762160, var_8040e225, var_bd027dd9)
{
	var_8ad7f92f = #"hash_312ceb838675b80";
	if(isdefined(var_a6762160))
	{
		switch(var_a6762160.rarity)
		{
			case "none":
			{
				break;
			}
			case "resource":
			{
				var_8ad7f92f = #"hash_312ceb838675b80";
				break;
			}
			case "uncommon":
			{
				var_8ad7f92f = #"hash_70c807782a37573e";
				break;
			}
			case "rare":
			{
				var_8ad7f92f = #"hash_5b08235c0b55a003";
				break;
			}
			case "epic":
			{
				var_8ad7f92f = #"hash_646d58f646eba5ed";
				break;
			}
			case "legendary":
			{
				var_8ad7f92f = #"hash_64261dabb4df88cd";
				break;
			}
			case "ultra":
			{
				var_8ad7f92f = #"hash_7bed6d31a7d8d425";
				break;
			}
			case "loadout":
			{
				var_8ad7f92f = #"hash_3088f081654a720e";
				break;
			}
		}
		if(var_a6762160.itemtype == #"resource")
		{
			var_8ad7f92f = #"hash_2f523d47697a9ce3";
		}
		if(is_true(var_a6762160.var_47f145b4))
		{
			var_8ad7f92f = #"hash_52f7937d76fafca0";
		}
		if(isdefined(var_a6762160.var_599225da))
		{
			var_8ad7f92f = var_a6762160.var_599225da;
		}
	}
	if(isdefined(var_bd027dd9) && isdefined(var_8040e225) && isdefined(var_8040e225.var_ffc1c0e1))
	{
		if(isdefined(var_8040e225.var_ffc1c0e1[var_bd027dd9]) && var_8040e225.var_ffc1c0e1[var_bd027dd9].servertime > getservertime(localclientnum, 1))
		{
			var_8ad7f92f = #"hash_3d6eb4b9bbc74fbd";
		}
	}
	return var_8ad7f92f;
}

/*
	Name: function_78bf134c
	Namespace: item_world
	Checksum: 0x5AB496F2
	Offset: 0x3918
	Size: 0x1AC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_78bf134c(localclientnum, var_8040e225, var_bd027dd9, model, var_a6762160)
{
	if(!isdefined(model))
	{
		return;
	}
	if(!isdefined(var_a6762160))
	{
		if(isdefined(model.var_bad13452))
		{
			if(model.var_bad13452 == 2)
			{
				function_3ee12d25(localclientnum, model);
				return;
			}
		}
		else if(!isdefined(model.type))
		{
			state = function_ffdbe8c2(model);
			if(state == 2)
			{
				function_3ee12d25(localclientnum, model);
				return;
			}
		}
	}
	var_8ad7f92f = function_fcfd6064(localclientnum, var_a6762160, var_8040e225, var_bd027dd9);
	if(isdefined(model.var_2584a90d) && model.var_2584a90d !== var_8ad7f92f)
	{
		model function_f6e99a8d(model.var_2584a90d);
	}
	if(isdefined(var_8ad7f92f))
	{
		if(!model function_d2503806(var_8ad7f92f))
		{
			model function_bf9d3071(var_8ad7f92f);
		}
	}
	model.var_2584a90d = var_8ad7f92f;
	if(isdefined(var_a6762160))
	{
		function_84964a9e(localclientnum, var_a6762160, model, var_bd027dd9);
	}
}

/*
	Name: function_84964a9e
	Namespace: item_world
	Checksum: 0xB5A0117D
	Offset: 0x3AD0
	Size: 0x47C
	Parameters: 4
	Flags: Linked
*/
function function_84964a9e(localclientnum, var_a6762160, model, var_bd027dd9)
{
	if(isdefined(var_a6762160) && isdefined(var_a6762160.worldfx) && var_a6762160.worldfx.size > 0 && !isdefined(model.var_f7fa2943) && !model ishidden())
	{
		if(isdefined(var_bd027dd9) && namespace_ad5a0cd6::function_da09de95(var_bd027dd9))
		{
			entnum = namespace_ad5a0cd6::function_c094ccd3(var_bd027dd9);
			if(isdefined(entnum))
			{
				var_95b3bee0 = getentbynum(localclientnum, entnum);
			}
		}
		if(!isdefined(var_95b3bee0) || isdefined(var_95b3bee0))
		{
			model.var_f7fa2943 = [];
			if(!isdefined(var_a6762160.var_22d128f2) && !isdefined(var_a6762160.var_22d128f2) && !isdefined(var_a6762160.var_22d128f2))
			{
				foreach(var_a6f47d78 in var_a6762160.worldfx)
				{
					model.var_f7fa2943[model.var_f7fa2943.size] = util::playfxontag(localclientnum, var_a6f47d78.worldfx, model, "tag_origin");
				}
			}
			else
			{
				originoffset = ((isdefined(var_a6762160.var_5dc4470b) ? var_a6762160.var_5dc4470b : 0), (isdefined(var_a6762160.var_54a3b4ca) ? var_a6762160.var_54a3b4ca : 0), (isdefined(var_a6762160.var_3e688854) ? var_a6762160.var_3e688854 : 0));
				originoffset = rotatepoint(originoffset * -1, model.angles);
				originoffset = originoffset + rotatepoint(((isdefined(var_a6762160.var_22d128f2) ? var_a6762160.var_22d128f2 : 0), (isdefined(var_a6762160.var_48907470) ? var_a6762160.var_48907470 : 0), (isdefined(var_a6762160.var_702943a1) ? var_a6762160.var_702943a1 : 0)), model.angles);
				angles = combineangles(model.angles, ((isdefined(var_a6762160.var_15b88fde) ? var_a6762160.var_15b88fde : 0), (isdefined(var_a6762160.var_8c9a7dc8) ? var_a6762160.var_8c9a7dc8 : 0), (isdefined(var_a6762160.var_7a51d937) ? var_a6762160.var_7a51d937 : 0)));
				forward = anglestoforward(angles);
				up = anglestoup(angles);
				foreach(var_a6f47d78 in var_a6762160.worldfx)
				{
					model.var_f7fa2943[model.var_f7fa2943.size] = playfx(localclientnum, var_a6f47d78.worldfx, model.origin + originoffset, forward, up);
				}
			}
		}
	}
}

/*
	Name: function_3bd99d2f
	Namespace: item_world
	Checksum: 0x6718E373
	Offset: 0x3F58
	Size: 0xB2
	Parameters: 4
	Flags: Linked, Private
*/
function private function_3bd99d2f(localclientnum, var_8040e225, vehicle, clear)
{
	if(!isdefined(clear))
	{
		clear = 0;
	}
	if(!isdefined(vehicle))
	{
		return;
	}
	if(clear)
	{
		function_3ee12d25(var_8040e225, vehicle);
		return;
	}
	var_8ad7f92f = #"hash_3d6eb4b9bbc74fbd";
	if(!vehicle function_d2503806(var_8ad7f92f))
	{
		vehicle function_bf9d3071(var_8ad7f92f);
	}
	vehicle.var_2584a90d = var_8ad7f92f;
}

/*
	Name: function_7731d23c
	Namespace: item_world
	Checksum: 0xB914368C
	Offset: 0x4018
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_7731d23c(var_8040e225)
{
	model = (isdefined(self.var_bd027dd9) ? var_8040e225.var_ab111430[self.var_bd027dd9] : self);
	if(isdefined(self.type) && self.type === #"missile")
	{
		model = self;
	}
	if(!isdefined(model) && isentity(self))
	{
		model = self;
	}
	return model;
}

/*
	Name: function_e2c19e6b
	Namespace: item_world
	Checksum: 0xF7B03028
	Offset: 0x40B8
	Size: 0x23E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e2c19e6b(localclientnum)
{
	self endon(#"shutdown");
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(!isdefined(var_8040e225))
	{
		return;
	}
	if(var_8040e225.var_d7bd75b5)
	{
		return;
	}
	var_8040e225.var_d7bd75b5 = 1;
	var_7c7fec2b = arraycopy(level.var_2b5a36e1);
	var_7b429234 = getarraykeys(var_7c7fec2b);
	servertime = getservertime(localclientnum);
	waitframe(1);
	var_f1ae160a = 0;
	for(index = 0; index < var_7b429234.size; index++)
	{
		var_f1ae160a++;
		var_b7d66c97 = var_7c7fec2b[var_7b429234[index]];
		if((var_f1ae160a % 20) == 0)
		{
			waitframe(1);
		}
		if(!isdefined(var_b7d66c97) || !isdefined(var_b7d66c97.var_8e092725))
		{
			continue;
		}
		if(var_b7d66c97.var_8e092725 > 0 && var_b7d66c97.var_8e092725 < servertime)
		{
			continue;
		}
		model = var_8040e225.var_ab111430[var_b7d66c97.var_bd027dd9];
		if(!isdefined(model))
		{
			continue;
		}
		timeoutlength = servertime - var_b7d66c97.var_f4522f8c;
		var_8cc6abc2 = ((int(floor(timeoutlength / 400))) % 2) == 0;
		if(var_8cc6abc2)
		{
			model show();
			continue;
		}
		model hide();
	}
	var_8040e225.var_d7bd75b5 = 0;
}

/*
	Name: function_d889880b
	Namespace: item_world
	Checksum: 0xEAFED87E
	Offset: 0x4300
	Size: 0xFB6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d889880b(localclientnum, draworigin)
{
	self endon(#"shutdown");
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(!isdefined(var_8040e225))
	{
		return;
	}
	var_5f6ea063 = is_true(self.var_5f6ea063);
	self.var_5f6ea063 = undefined;
	self.var_506495f9 = undefined;
	servertime = getservertime(localclientnum, 0);
	var_8040e225.var_79b15dd1 = servertime;
	var_8040e225.drawing = 1;
	var_6369afab = function_963d3f6e();
	if(isplayer(self) && (self isinfreefall() || self function_9a0edd92()))
	{
		var_6369afab = 4050;
	}
	maxdist = getdvarfloat(#"hash_2cd1a08f81049564", var_6369afab);
	var_f4b807cb = function_abaeb170(draworigin, undefined, 125, maxdist, -1, 1, servertime);
	var_6665e24 = arraysortclosest(level.var_a4a4012e, draworigin, 125, 0, maxdist);
	var_13e4be37 = [];
	foreach(var_ae944413 in var_6665e24)
	{
		if(isdefined(var_ae944413) && !namespace_ad5a0cd6::function_83c20f83(var_ae944413))
		{
			var_13e4be37[var_13e4be37.size] = var_ae944413;
		}
	}
	if(var_13e4be37.size > 0)
	{
		var_f4b807cb = arraycombine(var_f4b807cb, var_13e4be37, 1, 0);
		var_f4b807cb = arraysortclosest(var_f4b807cb, draworigin, 125, 0, maxdist);
	}
	waitframe(1);
	var_8040e225.var_89e328b4 = var_8040e225.var_ab111430;
	var_8040e225.var_ab111430 = [];
	var_c29769e0 = [];
	index = 0;
	/#
		assert(var_8040e225.var_89e328b4.size == 125);
	#/
	for(index = 0; index < var_f4b807cb.size; index++)
	{
		item = var_f4b807cb[index];
		if(!isdefined(item))
		{
			continue;
		}
		id = item.var_bd027dd9;
		if(isdefined(var_8040e225.var_89e328b4[id]))
		{
			model = var_8040e225.var_89e328b4[id];
			var_8040e225.var_ab111430[id] = model;
			var_8040e225.var_89e328b4[id] = undefined;
		}
		else
		{
			var_c29769e0[var_c29769e0.size] = item;
		}
		if(((index + 1) % 20) == 0)
		{
			waitframe(1);
		}
	}
	waitframe(1);
	arrayremovevalue(var_8040e225.var_89e328b4, undefined, 0);
	waitframe(1);
	/#
		assert((var_8040e225.var_89e328b4.size + var_8040e225.var_ab111430.size) == 125);
	#/
	/#
		assert(var_8040e225.var_89e328b4.size >= var_c29769e0.size);
	#/
	for(index = 0; index < var_c29769e0.size && index < var_8040e225.var_89e328b4.size; index++)
	{
		item = var_c29769e0[index];
		model = var_8040e225.var_89e328b4[index];
		model unlink();
		if(!isdefined(item))
		{
			model hide();
			function_2990e5f(localclientnum, model);
			function_3ee12d25(localclientnum, model);
			var_8040e225.var_ab111430[(index * -1) - 1] = model;
		}
		else
		{
			model.origin = item.origin;
			model.angles = item.angles;
			model function_e082e650(localclientnum, item, function_78a9fd5f(item), item.var_a6762160.modelscale);
			model.id = item.id;
			model.var_bd027dd9 = item.var_bd027dd9;
			var_b318478d = namespace_ad5a0cd6::function_da09de95(item.var_bd027dd9) && namespace_ad5a0cd6::can_pick_up(item, servertime);
			var_b318478d = var_b318478d | (item.var_bd027dd9 < function_8322cf16() && namespace_ad5a0cd6::can_pick_up(function_b1702735(item.var_bd027dd9), servertime));
			var_b318478d = var_b318478d & (!(isdefined(item.type) && item.type === #"missile"));
			if(var_b318478d)
			{
				model show();
			}
			else
			{
				model hide();
				function_2990e5f(localclientnum, model);
			}
			originoffset = ((isdefined(item.var_a6762160.var_5dc4470b) ? item.var_a6762160.var_5dc4470b : 0), (isdefined(item.var_a6762160.var_54a3b4ca) ? item.var_a6762160.var_54a3b4ca : 0), (isdefined(item.var_a6762160.var_3e688854) ? item.var_a6762160.var_3e688854 : 0));
			model.origin = model.origin + rotatepoint(originoffset, model.angles);
			if(namespace_ad5a0cd6::function_da09de95(item.var_bd027dd9))
			{
				model linkto(item);
			}
			var_8040e225.var_ab111430[item.var_bd027dd9] = model;
		}
		if(((index + 1) % 20) == 0)
		{
			waitframe(1);
		}
	}
	/#
		assert(((var_8040e225.var_89e328b4.size - index) + var_8040e225.var_ab111430.size) == 125);
	#/
	waitframe(1);
	while(index < var_8040e225.var_89e328b4.size)
	{
		model = var_8040e225.var_89e328b4[index];
		if(!isdefined(model))
		{
			model = var_8040e225.var_89e328b4[index * -1];
		}
		if(isdefined(model))
		{
			model hide();
			function_2990e5f(localclientnum, model);
			function_3ee12d25(localclientnum, model);
			var_8040e225.var_ab111430[(index * -1) - 1] = model;
		}
		else
		{
			/#
				assert(0);
			#/
		}
		if(((index + 1) % 20) == 0)
		{
			waitframe(1);
		}
		index++;
	}
	/#
		assert(var_8040e225.var_ab111430.size == 125);
	#/
	var_8040e225.var_89e328b4 = undefined;
	waitframe(1);
	/#
		assert(var_8040e225.var_ab111430.size == 125);
	#/
	function_b032ccd(localclientnum, var_8040e225.var_ab111430);
	if(getdvarint(#"hash_220f360a2cc8359a", 1))
	{
		var_b8db3f93 = arraysortclosest(level.var_a4a4012e, draworigin, undefined, maxdist);
		foreach(index, item in var_b8db3f93)
		{
			function_3ee12d25(localclientnum, item);
			if(((index + 1) % 20) == 0)
			{
				waitframe(1);
			}
		}
		waitframe(1);
		var_f945c1d4 = arraysortclosest(level.var_5862f2ce, draworigin, undefined, maxdist);
		foreach(index, var_f4cdfe08 in var_f945c1d4)
		{
			function_3ee12d25(localclientnum, var_f4cdfe08);
			if(((index + 1) % 20) == 0)
			{
				waitframe(1);
			}
		}
		waitframe(1);
		var_8f6dbb2 = arraysortclosest(level.var_624588d5, draworigin, undefined, maxdist);
		foreach(index, var_4961f577 in var_8f6dbb2)
		{
			function_3ee12d25(localclientnum, var_4961f577);
			if(((index + 1) % 20) == 0)
			{
				waitframe(1);
			}
		}
		waitframe(1);
		var_6665e24 = arraysortclosest(level.var_a4a4012e, draworigin, 75, 0, maxdist);
		waitframe(1);
		var_ac2b6007 = arraysortclosest(level.var_5862f2ce, draworigin, 75, 0, maxdist);
		waitframe(1);
		var_c36bd68a = arraysortclosest(level.var_624588d5, draworigin, 75, 0, maxdist);
		waitframe(1);
		var_f4b807cb = arraycombine(var_f4b807cb, var_6665e24, 1, 0);
		waitframe(1);
		var_f4b807cb = arraycombine(var_f4b807cb, var_ac2b6007, 1, 0);
		waitframe(1);
		var_f4b807cb = arraycombine(var_f4b807cb, var_c36bd68a, 1, 0);
		waitframe(1);
		var_f4b807cb = arraysortclosest(var_f4b807cb, draworigin, 125 + var_6665e24.size, 0, maxdist);
		waitframe(1);
		if(isdefined(self) && var_5f6ea063)
		{
			for(index = 0; index < var_f4b807cb.size; index++)
			{
				item = var_f4b807cb[index];
				if(!isdefined(item))
				{
					continue;
				}
				model = item function_7731d23c(var_8040e225);
				function_3ee12d25(localclientnum, model);
				if(((index + 1) % 20) == 0)
				{
					waitframe(1);
				}
			}
		}
		waitframe(1);
		for(index = int(min(75, var_f4b807cb.size)); index < 125 && index < var_f4b807cb.size; index++)
		{
			item = var_f4b807cb[index];
			if(!isdefined(item))
			{
				continue;
			}
			model = item function_7731d23c(var_8040e225);
			function_3ee12d25(localclientnum, model);
			if(((index + 1) % 20) == 0)
			{
				waitframe(1);
			}
		}
		waitframe(1);
		for(index = 0; index < 75 && index < var_f4b807cb.size; index++)
		{
			item = var_f4b807cb[index];
			if(!isdefined(item))
			{
				continue;
			}
			model = item function_7731d23c(var_8040e225);
			function_78bf134c(localclientnum, var_8040e225, item.var_bd027dd9, model, item.var_a6762160);
			if(((index + 1) % 20) == 0)
			{
				waitframe(1);
			}
		}
	}
	var_8040e225.var_844c8166 = draworigin;
	var_8040e225.var_f4b807cb = var_f4b807cb;
	var_8040e225.var_d58b471d = var_f4b807cb.size;
	var_8040e225.drawing = undefined;
}

/*
	Name: function_78a9fd5f
	Namespace: item_world
	Checksum: 0x6FEE1189
	Offset: 0x52C0
	Size: 0x1E4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_78a9fd5f(point)
{
	if(!isdefined(level.var_8c615e33))
	{
		level.var_8c615e33 = [];
	}
	if(!isstruct(point) && isdefined(point.type == #"scriptmover") && isdefined(point.var_a6762160.var_77d2cbb5) && point getentitynumber() < 1024)
	{
		return point.var_a6762160.var_77d2cbb5;
	}
	if(!isdefined(level.var_8c615e33[point.var_a6762160.name]))
	{
		if(isdefined(point.var_a6762160.model) && point.var_a6762160.model != "")
		{
			level.var_8c615e33[point.var_a6762160.name] = point.var_a6762160.model;
		}
		else
		{
			if(isdefined(point.var_a6762160.weapon) && point.var_a6762160.weapon !== level.weaponnone)
			{
				level.var_8c615e33[point.var_a6762160.name] = point.var_a6762160.weapon.worldmodel;
			}
			else
			{
				level.var_8c615e33[point.var_a6762160.name] = "tag_origin";
			}
		}
	}
	return level.var_8c615e33[point.var_a6762160.name];
}

/*
	Name: function_8cf40a8c
	Namespace: item_world
	Checksum: 0x2B621117
	Offset: 0x54B0
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8cf40a8c(localclientnum)
{
	return getcamposbylocalclientnum(localclientnum);
}

/*
	Name: function_9e4552fe
	Namespace: item_world
	Checksum: 0xD93D30A1
	Offset: 0x54E0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e4552fe(var_fee74908)
{
	level thread function_37175e73(var_fee74908);
}

/*
	Name: function_9160538
	Namespace: item_world
	Checksum: 0x79393D7B
	Offset: 0x5510
	Size: 0x652
	Parameters: 5
	Flags: Linked, Private
*/
function private function_9160538(localclientnum, eventtype, eventdata, var_c5a66313, var_567004a8)
{
	waitframe(1);
	level flag::wait_till(#"hash_51daecff754729dc");
	if(!isdefined(level.var_d342a3fd[localclientnum]))
	{
		return;
	}
	player = function_27673a7(localclientnum);
	isalive = isalive(player);
	switch(eventtype)
	{
		case 2:
		{
			function_1b11e73c();
			var_bd027dd9 = eventdata;
			function_222205a3(localclientnum, var_bd027dd9);
			function_b78a9820(localclientnum);
			item = function_b1702735(var_bd027dd9);
			namespace_b376ff3f::function_31868137(localclientnum, item);
			function_3de69770(localclientnum, item);
			break;
		}
		case 3:
		{
			var_bd027dd9 = eventdata;
			var_7ba775ef = is_true(var_c5a66313);
			function_1b11e73c();
			waittillframeend();
			show_item(localclientnum, var_bd027dd9, var_7ba775ef);
			function_b78a9820(localclientnum);
			var_8040e225 = function_a7e98a1a(localclientnum);
			model = function_61f5d33a(localclientnum, var_8040e225, var_bd027dd9);
			if(isdefined(model))
			{
				function_a4886b1e(localclientnum, var_bd027dd9, model);
			}
			function_4409aa59(localclientnum, var_bd027dd9);
			break;
		}
		case 4:
		{
			var_d8138db2 = eventdata;
			count = var_c5a66313;
			slotid = (var_567004a8 ? var_567004a8 - 1 : undefined);
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_9c4460e0(localclientnum, var_d8138db2, count, slotid);
			function_b78a9820(localclientnum);
			break;
		}
		case 11:
		{
			var_bd027dd9 = eventdata;
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_7730442c(localclientnum, var_bd027dd9);
			break;
		}
		case 15:
		{
			var_bd027dd9 = eventdata;
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_52e537be(localclientnum, var_bd027dd9);
			break;
		}
		case 5:
		{
			var_bd027dd9 = eventdata;
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_c6ff0aa2(localclientnum, var_bd027dd9);
			function_b78a9820(localclientnum);
			break;
		}
		case 6:
		{
			var_bd027dd9 = eventdata;
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_3bd1836f(localclientnum, var_bd027dd9);
			function_b78a9820(localclientnum);
			break;
		}
		case 12:
		{
			var_c9293a27 = eventdata;
			var_8f194e5a = var_c5a66313;
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_26c87da8(localclientnum, var_c9293a27, var_8f194e5a);
			break;
		}
		case 7:
		{
			var_bd027dd9 = eventdata;
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_fa372100(localclientnum, var_bd027dd9);
			break;
		}
		case 8:
		{
			var_bd027dd9 = eventdata;
			function_b78a9820(localclientnum);
			break;
		}
		case 9:
		{
			var_bd027dd9 = eventdata;
			count = var_c5a66313;
			if(!isalive)
			{
				return;
			}
			namespace_b376ff3f::function_6490a112(localclientnum, var_bd027dd9, count);
			function_b78a9820(localclientnum);
			break;
		}
		case 10:
		{
			namespace_b376ff3f::function_42e2bb1a(localclientnum);
			break;
		}
		case 13:
		{
			var_bd027dd9 = eventdata;
			var_2ccf7a1c = var_c5a66313;
			function_347698a5(localclientnum, var_bd027dd9, var_2ccf7a1c);
			break;
		}
		case 14:
		{
			var_7b9b4259 = eventdata;
			var_2ccf7a1c = var_c5a66313;
			function_d2f95c1a(localclientnum, var_7b9b4259, var_2ccf7a1c);
			break;
		}
		default:
		{
			/#
				assertmsg("" + eventtype);
			#/
			break;
		}
	}
}

/*
	Name: function_60386766
	Namespace: item_world
	Checksum: 0x22F57587
	Offset: 0x5B70
	Size: 0xE8
	Parameters: 7
	Flags: Linked, Private
*/
function private function_60386766(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level flag::wait_till(#"hash_51daecff754729dc");
	foreach(var_b7c28bcc in level.var_5862f2ce)
	{
		setdynentenabled(var_b7c28bcc, !bwastimejump);
	}
}

/*
	Name: function_4e9220ab
	Namespace: item_world
	Checksum: 0x2FB32BB
	Offset: 0x5C60
	Size: 0x504
	Parameters: 7
	Flags: Linked, Private
*/
function private function_4e9220ab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level.var_ac56bfa4 = undefined;
		waitframe(1);
		if(isdemoplaying())
		{
			function_8722e0f2(1);
		}
		if(!issplitscreenhost(fieldname))
		{
			function_1b11e73c();
		}
		level flag::wait_till_clear(#"hash_2d3b2a4d082ba5ee");
		level flag::set(#"hash_2d3b2a4d082ba5ee");
		if(level flag::get(#"hash_38a387462f3a9ad"))
		{
			return;
		}
		seed = bwastimejump;
		level.var_cca3647d = seed;
		level flag::set(#"hash_38a387462f3a9ad");
		level flag::clear(#"hash_51daecff754729dc");
		data = function_a7e98a1a(fieldname);
		if(!isdefined(data.inventory) && !namespace_b376ff3f::function_7d5553ac())
		{
			level namespace_b376ff3f::function_42e2bb1a(fieldname);
		}
		var_8040e225 = function_a7e98a1a(fieldname);
		if(isdefined(var_8040e225) && isdefined(var_8040e225.var_ab111430))
		{
			models = [];
			foreach(model in var_8040e225.var_ab111430)
			{
				model notsolid();
				model hide();
				function_2990e5f(fieldname, model);
				function_3ee12d25(fieldname, model);
				models[(models.size * -1) - 1] = model;
			}
			var_8040e225.var_ab111430 = models;
		}
		foreach(var_ee7a9894 in var_8040e225.var_ffc1c0e1)
		{
			var_8040e225.var_ffc1c0e1[var_bd027dd9].servertime = 0;
		}
		foreach(var_ee7a9894 in var_8040e225.var_baf65690)
		{
			var_8040e225.var_baf65690[var_7b9b4259].servertime = 0;
		}
		if(issplitscreenhost(fieldname))
		{
			level namespace_f0884ae5::setup(fieldname, seed);
		}
		level thread function_48b8fc19(fieldname);
		player = function_5c10bd79(fieldname);
		player.var_5f6ea063 = 1;
		level flag::set(#"hash_51daecff754729dc");
		level flag::clear(#"hash_2d3b2a4d082ba5ee");
		if(isdemoplaying())
		{
			function_8722e0f2(0);
		}
	}
}

/*
	Name: function_7e3cc2ff
	Namespace: item_world
	Checksum: 0x703A148D
	Offset: 0x6170
	Size: 0x4C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_7e3cc2ff(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level.var_ac56bfa4 = bwastimejump;
}

/*
	Name: function_e2e7ee77
	Namespace: item_world
	Checksum: 0x8A432458
	Offset: 0x61C8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e2e7ee77(localclientnum)
{
	self function_e1f6ddbf(localclientnum);
}

/*
	Name: function_e1f6ddbf
	Namespace: item_world
	Checksum: 0xE816BDA3
	Offset: 0x61F8
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e1f6ddbf(localclientnum)
{
	setting = function_ab88dbd2(localclientnum, #"warzoneprioritypickups");
	if(isdefined(setting))
	{
		function_97fedb0d(localclientnum, 2, setting);
	}
}

/*
	Name: function_86c5661a
	Namespace: item_world
	Checksum: 0x619E90F
	Offset: 0x6260
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_86c5661a(localclientnum)
{
	function_952d97dc(localclientnum);
	self function_e2e7ee77(localclientnum);
}

/*
	Name: function_1877f414
	Namespace: item_world
	Checksum: 0x74040ACD
	Offset: 0x62A8
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1877f414(localclientnum)
{
	/#
		self thread function_cdd9b388();
	#/
	if(self function_21c0fa55())
	{
		self function_e2e7ee77(localclientnum);
		if(!is_true(getgametypesetting(#"hash_36c2645732ad1c3b")) || !namespace_b376ff3f::function_7d5553ac())
		{
			self thread function_6d4050ed(localclientnum);
		}
		level callback::function_6231c19(&namespace_b376ff3f::function_6231c19);
	}
}

/*
	Name: function_cfebeacb
	Namespace: item_world
	Checksum: 0x8B9EC162
	Offset: 0x6390
	Size: 0x266
	Parameters: 2
	Flags: Linked, Private
*/
function private function_cfebeacb(localclientnum, item)
{
	if(isdefined(item) && isdefined(item.var_a6762160.weapon) && !isdefined(item.var_a6762160.model) && isdefined(item.var_a6762160.weapon.worldmodel))
	{
		weapon = namespace_a0d533d1::function_2b83d3ff(item);
		var_e827f698 = undefined;
		var_57fe74e5 = undefined;
		var_fd90b0bb = undefined;
		if((isdefined(getgametypesetting(#"hash_54fe37a58b87c7a0")) ? getgametypesetting(#"hash_54fe37a58b87c7a0") : 0))
		{
			if(isdefined(item.weapon))
			{
				weapon = item.weapon;
			}
			var_e827f698 = activecamo::function_b259f3e0(weapon);
			var_57fe74e5 = self getbuildkitweaponoptions(localclientnum, var_e827f698);
			var_fd90b0bb = self function_1744e243(localclientnum, var_e827f698);
		}
		if(isdefined(var_57fe74e5))
		{
			self useweaponmodel(level.weaponnone, "tag_origin");
			self useweaponmodel(weapon, undefined, var_57fe74e5, var_fd90b0bb);
		}
		else
		{
			self useweaponmodel(weapon);
		}
		self useweaponhidetags(weapon);
		if(isdefined(var_57fe74e5))
		{
			self activecamo::function_6efb762c(localclientnum, var_e827f698, var_57fe74e5);
		}
		return true;
	}
	self detachall();
	self useweaponmodel(level.weaponnone, "tag_origin");
	return false;
}

/*
	Name: function_e082e650
	Namespace: item_world
	Checksum: 0x13DD1E0A
	Offset: 0x6600
	Size: 0xFC
	Parameters: 4
	Flags: Linked, Private
*/
function private function_e082e650(localclientnum, item, newmodel, scale)
{
	if(newmodel === self.model)
	{
		if(!isdefined(item) && self.weapon == level.weaponnone)
		{
			return;
		}
	}
	function_2990e5f(localclientnum, item);
	function_3ee12d25(localclientnum, self);
	self setscale(scale);
	if(isdefined(newmodel) && (!self function_cfebeacb(localclientnum, item) || isdefined(item.var_a6762160.model)))
	{
		self setmodel(newmodel);
	}
}

/*
	Name: function_96fa1c6d
	Namespace: item_world
	Checksum: 0xE82AFA88
	Offset: 0x6708
	Size: 0x168
	Parameters: 1
	Flags: Linked, Private
*/
function private function_96fa1c6d(localclientnum)
{
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(is_true(var_8040e225.drawing))
	{
		return false;
	}
	if(!isdefined(var_8040e225.var_844c8166))
	{
		return true;
	}
	if(function_1cbf351b(localclientnum))
	{
		return true;
	}
	servertime = getservertime(localclientnum);
	if(servertime < var_8040e225.var_79b15dd1)
	{
		return true;
	}
	var_605384fe = function_8cf40a8c(localclientnum);
	var_48f611aa = distancesquared(var_8040e225.var_844c8166, var_605384fe);
	if(var_48f611aa >= sqr(72))
	{
		return true;
	}
	if(is_true(self.var_5f6ea063) || is_true(self.var_506495f9))
	{
		return true;
	}
	return false;
}

/*
	Name: function_c7e5c26
	Namespace: item_world
	Checksum: 0xF3A27CE5
	Offset: 0x6878
	Size: 0x56
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c7e5c26(localclientnum)
{
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(is_true(var_8040e225.var_a4ad122e))
	{
		return false;
	}
	return true;
}

/*
	Name: function_34418003
	Namespace: item_world
	Checksum: 0x95BFEBF1
	Offset: 0x68D8
	Size: 0x72
	Parameters: 3
	Flags: Linked, Private
*/
function private function_34418003(localclientnum, eyepos, angles)
{
	var_8040e225 = function_a7e98a1a(angles);
	if(is_true(var_8040e225.var_ff9e7e43))
	{
		var_8040e225.var_ff9e7e43 = 0;
		return true;
	}
	return false;
}

/*
	Name: function_5cbe24ea
	Namespace: item_world
	Checksum: 0xAB5DEBBB
	Offset: 0x6958
	Size: 0x2DA
	Parameters: 3
	Flags: Linked, Private
*/
function private function_5cbe24ea(&dest, &source, &order)
{
	items = [];
	foreach(item in source)
	{
		if(!isdefined(item))
		{
			continue;
		}
		itemname = item.var_a6762160.name;
		if(!isdefined(items[itemname]))
		{
			items[itemname] = [];
		}
		size = items[itemname].size;
		items[itemname][size] = item;
	}
	foreach(itemname in order)
	{
		if(isdefined(items[itemname]))
		{
			foreach(item in items[itemname])
			{
				dest[dest.size] = item;
			}
		}
		items[itemname] = undefined;
	}
	foreach(var_d27015ab in items)
	{
		if(!isdefined(var_d27015ab))
		{
			continue;
		}
		foreach(item in var_d27015ab)
		{
			if(!isdefined(item))
			{
				continue;
			}
			dest[dest.size] = item;
		}
	}
}

/*
	Name: function_43d3ebe1
	Namespace: item_world
	Checksum: 0xD2B43C68
	Offset: 0x6C40
	Size: 0x11CE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43d3ebe1(&items)
{
	/#
		assert(isplayer(self));
	#/
	if(items.size <= 1)
	{
		return items;
	}
	arrayremovevalue(items, undefined, 0);
	sorted = [];
	var_b2f6f151 = [];
	stash = namespace_ad5a0cd6::function_31f5aa51(items[0]);
	var_e30063d2 = isdefined(stash) && is_true(stash.var_1ed4b650);
	if(var_e30063d2)
	{
		var_bcb39afb = self namespace_a0d533d1::function_169cea63();
		if(var_bcb39afb.size > 0)
		{
			var_41f13734 = var_bcb39afb[0];
			for(index = 0; index < items.size; index++)
			{
				item = items[index];
				if(!isdefined(items[index].var_a6762160) || !isdefined(items[index].var_a6762160.weapon))
				{
					continue;
				}
				if(items[index].var_a6762160.weapon.name == var_41f13734)
				{
					var_dd3170c7 = sorted.size;
					sorted[var_dd3170c7] = items[index];
					sorted[var_dd3170c7].var_41f13734 = 1;
					arrayremoveindex(items, index, 0);
					break;
				}
			}
		}
	}
	for(index = 0; index < items.size; index++)
	{
		if(!isdefined(items[index]))
		{
			continue;
		}
		var_a6762160 = items[index].var_a6762160;
		if(!isdefined(var_b2f6f151[var_a6762160.itemtype]))
		{
			var_b2f6f151[var_a6762160.itemtype] = [];
		}
		size = var_b2f6f151[var_a6762160.itemtype].size;
		var_b2f6f151[var_a6762160.itemtype][size] = items[index];
	}
	waitframe(1);
	if(isdefined(var_b2f6f151[#"dogtag"]))
	{
		foreach(entry in var_b2f6f151[#"dogtag"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"quest"]))
	{
		foreach(entry in var_b2f6f151[#"quest"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"cash"]))
	{
		foreach(entry in var_b2f6f151[#"cash"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"armor"]))
	{
		function_5cbe24ea(sorted, var_b2f6f151[#"armor"], level.var_69ee9282);
		waitframe(1);
	}
	if(isdefined(var_b2f6f151[#"hash_56d6621e6c4caf07"]))
	{
		foreach(entry in var_b2f6f151[#"hash_56d6621e6c4caf07"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"weapon"]))
	{
		var_610b8743 = [];
		foreach(item in var_b2f6f151[#"weapon"])
		{
			if(!isdefined(item))
			{
				continue;
			}
			if(item.var_a6762160.rarity == #"epic")
			{
				var_610b8743[var_610b8743.size] = item;
			}
		}
		if(isdefined(var_610b8743))
		{
			function_5cbe24ea(sorted, var_610b8743, level.var_e93e16b);
			waitframe(1);
		}
	}
	if(isdefined(var_b2f6f151[#"weapon"]))
	{
		weapons = [];
		foreach(item in var_b2f6f151[#"weapon"])
		{
			if(!isdefined(item))
			{
				continue;
			}
			if(item.var_a6762160.rarity != #"epic")
			{
				weapons[weapons.size] = item;
			}
		}
		if(isdefined(weapons))
		{
			function_5cbe24ea(sorted, weapons, level.var_b9917a92);
			waitframe(1);
		}
	}
	if(isdefined(var_b2f6f151[#"health"]))
	{
		function_5cbe24ea(sorted, var_b2f6f151[#"health"], level.var_9bc8c1bc);
		waitframe(1);
	}
	if(isdefined(var_b2f6f151[#"backpack"]))
	{
		foreach(entry in var_b2f6f151[#"backpack"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"attachment"]))
	{
		function_5cbe24ea(sorted, var_b2f6f151[#"attachment"], level.var_6cb314b1);
		waitframe(1);
	}
	if(isdefined(var_b2f6f151[#"killstreak"]))
	{
		foreach(entry in var_b2f6f151[#"killstreak"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"field_upgrade"]))
	{
		foreach(entry in var_b2f6f151[#"field_upgrade"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"equipment"]))
	{
		function_5cbe24ea(sorted, var_b2f6f151[#"equipment"], level.var_3fd5d8f0);
		waitframe(1);
	}
	if(isdefined(var_b2f6f151[#"tactical"]))
	{
		foreach(entry in var_b2f6f151[#"tactical"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"generic"]))
	{
		function_5cbe24ea(sorted, var_b2f6f151[#"generic"], level.var_683c7e30);
		waitframe(1);
	}
	if(isdefined(var_b2f6f151[#"hash_63c2e59c903465e6"]))
	{
		foreach(entry in var_b2f6f151[#"hash_63c2e59c903465e6"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_63c2e49c90346433"]))
	{
		foreach(entry in var_b2f6f151[#"hash_63c2e49c90346433"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_63c2e39c90346280"]))
	{
		foreach(entry in var_b2f6f151[#"hash_63c2e39c90346280"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"scorestreak"]))
	{
		foreach(entry in var_b2f6f151[#"scorestreak"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_576593319dc02d70"]))
	{
		foreach(entry in var_b2f6f151[#"hash_576593319dc02d70"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"ammo"]))
	{
		function_5cbe24ea(sorted, var_b2f6f151[#"ammo"], level.var_418d51ad);
		waitframe(1);
	}
	if(isdefined(var_b2f6f151[#"resource"]))
	{
		foreach(entry in var_b2f6f151[#"resource"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_910bf9605abbcea"]))
	{
		foreach(entry in var_b2f6f151[#"hash_910bf9605abbcea"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_576593319dc02d70"]))
	{
		foreach(entry in var_b2f6f151[#"hash_576593319dc02d70"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_7064fc95aa1c1bbe"]))
	{
		foreach(entry in var_b2f6f151[#"hash_7064fc95aa1c1bbe"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_70823406977e7c34"]))
	{
		foreach(entry in var_b2f6f151[#"hash_70823406977e7c34"])
		{
			sorted[sorted.size] = entry;
		}
	}
	if(isdefined(var_b2f6f151[#"hash_fc797c2a8f4d208"]))
	{
		foreach(entry in var_b2f6f151[#"hash_fc797c2a8f4d208"])
		{
			sorted[sorted.size] = entry;
		}
	}
	return sorted;
}

/*
	Name: function_b21002cb
	Namespace: item_world
	Checksum: 0x8697C83D
	Offset: 0x7E18
	Size: 0xEC
	Parameters: 4
	Flags: Linked, Private
*/
function private function_b21002cb(localclientnum, objid, obj, objstate)
{
	if(obj.type === "scriptmover" || obj.type === "missile")
	{
		objective_onentity(localclientnum, objid, obj, 0, 0, 0);
	}
	else
	{
		objective_clearentity(localclientnum, objid);
		objective_setposition(localclientnum, objid, obj.origin);
	}
	objective_setgamemodeflags(localclientnum, objid, objstate);
	objective_setstate(localclientnum, objid, "active");
}

/*
	Name: function_c3f5f99b
	Namespace: item_world
	Checksum: 0x3C43E0C1
	Offset: 0x7F10
	Size: 0xEC
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c3f5f99b(localclientnum, objid, obj)
{
	objective_setstate(localclientnum, objid, "invisible");
	objective_setgamemodeflags(localclientnum, objid, 0);
	if(isdefined(obj))
	{
		if(obj.type === "scriptmover" || obj.type === "missile")
		{
			objective_onentity(localclientnum, objid, obj, 0, 0, 0);
		}
		else
		{
			objective_clearentity(localclientnum, objid);
			objective_setposition(localclientnum, objid, obj.origin);
		}
	}
}

/*
	Name: function_b0af857f
	Namespace: item_world
	Checksum: 0x9A616D48
	Offset: 0x8008
	Size: 0x59A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b0af857f(localclientnum)
{
	self endon(#"death");
	self notify("4c32239d14323259");
	self endon("4c32239d14323259");
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(is_true(var_8040e225.var_a4ad122e))
	{
		return;
	}
	var_8040e225.var_a4ad122e = 1;
	var_da43934d = self function_da43934d();
	if(var_da43934d)
	{
		if(!self inlaststand() && !clientfield::get_to_player("disableItemPickup"))
		{
			eyepos = getlocalclienteyepos(localclientnum);
			angles = getlocalclientangles(localclientnum);
			maxdist = undefined;
			var_512ddf16 = self clientfield::get_player_uimodel("hudItems.multiItemPickup.status") == 2;
			if(var_512ddf16)
			{
				maxdist = 128;
			}
			else
			{
				model = getuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hash_23febb0b8f867ca1"), "currentSelection"));
				if(isdefined(model))
				{
					uimodel = createuimodel(model, "id");
					if(isdefined(uimodel))
					{
						var_d8138db2 = getuimodelvalue(uimodel);
						if(isdefined(var_d8138db2) && var_d8138db2 != 32767)
						{
							setuimodelvalue(createuimodel(model, "id"), 32767);
						}
					}
				}
			}
			self.var_54d9f4a6 = 0;
			if(var_512ddf16)
			{
				self.var_9b882d22 = undefined;
				self.var_cdaade8c = undefined;
				model = getuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hash_23febb0b8f867ca1"), "currentSelection"));
				if(isdefined(model))
				{
					uimodel = createuimodel(model, "id");
					if(isdefined(uimodel))
					{
						var_d8138db2 = getuimodelvalue(uimodel);
						if(isdefined(var_d8138db2) && var_d8138db2 != 32767)
						{
							if(namespace_ad5a0cd6::function_2c7fc531(var_d8138db2))
							{
								self.var_9b882d22 = function_b1702735(var_d8138db2);
							}
							else if(namespace_ad5a0cd6::function_da09de95(var_d8138db2))
							{
								if(isdefined(level.var_a4a4012e[var_d8138db2]))
								{
									self.var_9b882d22 = level.var_a4a4012e[var_d8138db2];
								}
							}
							if(isdefined(self.var_9b882d22))
							{
								self.var_9b882d22.var_5d97fed1 = namespace_ad5a0cd6::function_83c20f83(self.var_9b882d22);
							}
						}
					}
				}
				if(!isdefined(self.var_9b882d22))
				{
					self.var_54d9f4a6 = 1;
					foreach(item in var_8040e225.var_f0f7e918)
					{
						if(self namespace_ad5a0cd6::can_pick_up(item))
						{
							self.var_9b882d22 = item;
							self.var_9b882d22.var_5d97fed1 = namespace_ad5a0cd6::function_83c20f83(self.var_9b882d22);
							break;
						}
					}
				}
			}
			if(!var_512ddf16 || !isdefined(self.var_9b882d22))
			{
				self.var_9b882d22 = function_94db1536(localclientnum, eyepos, angles, maxdist);
				if(isdefined(self.var_9b882d22))
				{
					self.var_cdaade8c = self.var_9b882d22.origin;
				}
			}
		}
		else
		{
			self.var_9b882d22 = undefined;
		}
		waitframe(1);
		function_802915bc(localclientnum);
	}
	if(is_true(self.disableitempickup))
	{
		self.var_9b882d22 = undefined;
	}
	var_8040e225.var_a4ad122e = 0;
}

/*
	Name: function_802915bc
	Namespace: item_world
	Checksum: 0xCCC12D30
	Offset: 0x85B0
	Size: 0x2CC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_802915bc(localclientnum)
{
	if(!isdefined(level.var_62c91473) || !isdefined(level.var_62c91473[localclientnum]))
	{
		return;
	}
	eyepos = getlocalclienteyepos(localclientnum);
	if(isdefined(self.var_9b882d22) && self.var_9b882d22.var_5d97fed1)
	{
		var_1ba7b9c8 = arraysortclosest(level.var_624588d5, self.var_9b882d22.origin, 1, 0, 12);
		hinttext = #"hash_1b179a759b7f05c8";
		if(var_1ba7b9c8.size > 0)
		{
			var_d8c17bc2 = var_1ba7b9c8[0].var_ed175c5 === 2;
			hinttext = (var_d8c17bc2 ? #"hash_7b3fd580a423c4ef" : #"hash_378637b14671886");
		}
		else
		{
			var_1ba7b9c8 = arraysortclosest(level.var_5862f2ce, self.var_9b882d22.origin, 1, 0, 12);
			if(var_1ba7b9c8.size > 0 && isdefined(var_1ba7b9c8[0].displayname))
			{
				hinttext = var_1ba7b9c8[0].displayname;
			}
		}
		setuimodelvalue(level.var_62c91473[localclientnum], hinttext);
	}
	else
	{
		if(!isdefined(self.var_9b882d22) || distance2dsquared(self.var_9b882d22.origin, eyepos) > sqr(128))
		{
			angles = getlocalclientangles(localclientnum);
			vehicle = namespace_ad5a0cd6::function_6af455de(localclientnum, eyepos, angles);
			hintstring = namespace_ad5a0cd6::function_c62ad9a7(vehicle);
			setuimodelvalue(level.var_62c91473[localclientnum], hintstring);
		}
		else
		{
			setuimodelvalue(level.var_62c91473[localclientnum], #"");
		}
	}
}

/*
	Name: function_c46425e0
	Namespace: item_world
	Checksum: 0xE56A0B1
	Offset: 0x8888
	Size: 0x6C4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c46425e0(localclientnum)
{
	if(isdefined(self))
	{
		var_f4b807cb = function_2e3efdda(self.origin, undefined, 64, 256, -1, 0);
		if(!isdefined(var_f4b807cb) || !var_f4b807cb.size)
		{
			return;
		}
		var_1988b305 = [];
		var_d61d8afa = [];
		for(index = 0; index < var_f4b807cb.size; index++)
		{
			item = var_f4b807cb[index];
			if(!isdefined(item))
			{
				continue;
			}
			if(isdefined(item.var_a6762160))
			{
				if(item.var_a6762160.itemtype == #"weapon")
				{
					if(isdefined(item.weapon) && item.weapon != level.weaponnone && item.weapon !== item.var_a6762160.weapon)
					{
						var_e827f698 = activecamo::function_b259f3e0(item.weapon);
						var_57fe74e5 = self getbuildkitweaponoptions(localclientnum, var_e827f698);
						var_fd90b0bb = self function_1744e243(localclientnum, var_e827f698);
						var_493cfe65 = item.weapon;
						function_d780f794(localclientnum, var_493cfe65, var_57fe74e5, var_fd90b0bb);
						var_1988b305[var_493cfe65] = var_57fe74e5;
					}
					else if(isdefined(item.var_a6762160.weapon) && item.var_a6762160.weapon != level.weaponnone)
					{
						var_e827f698 = activecamo::function_b259f3e0(item.var_a6762160.weapon);
						var_57fe74e5 = self getbuildkitweaponoptions(localclientnum, var_e827f698);
						var_fd90b0bb = self function_1744e243(localclientnum, var_e827f698);
						var_493cfe65 = namespace_a0d533d1::function_2b83d3ff(item);
						function_d780f794(localclientnum, var_493cfe65, var_57fe74e5, var_fd90b0bb);
						var_1988b305[var_493cfe65] = var_57fe74e5;
					}
					continue;
				}
				if(item.var_a6762160.itemtype == #"attachment")
				{
					if(isdefined(item.var_a6762160.attachments))
					{
						foreach(attachment in item.var_a6762160.attachments)
						{
							if(isdefined(attachment.var_6be1bec7))
							{
								var_d61d8afa[attachment.var_6be1bec7] = attachment.var_6be1bec7;
							}
						}
					}
				}
			}
		}
		currentweapon = self function_d2c2b168();
		if(isdefined(currentweapon) && currentweapon != level.weaponnone && currentweapon != level.weaponbasemeleeheld)
		{
			foreach(attachment in var_d61d8afa)
			{
				if(!weaponhasattachment(currentweapon, attachment))
				{
					weaponoptions = self function_e10e6c37();
					var_493cfe65 = getweapon(currentweapon.rootweapon.name, attachment);
					if(isdefined(var_493cfe65) && weaponhasattachment(var_493cfe65, attachment))
					{
						function_d780f794(localclientnum, var_493cfe65, weaponoptions, 0);
					}
				}
			}
			if(var_1988b305.size)
			{
				var_1bf1ce1 = getweaponattachments(currentweapon);
				if(isdefined(var_1bf1ce1) && var_1bf1ce1.size)
				{
					foreach(weaponoptions in var_1988b305)
					{
						var_37eedd1 = weapon(key);
						if(var_37eedd1.rootweapon != currentweapon.rootweapon)
						{
							foreach(attachment in var_1bf1ce1)
							{
								if(attachment !== "null" && !weaponhasattachment(var_37eedd1, attachment))
								{
									var_493cfe65 = getweapon(var_37eedd1.name, attachment);
									if(isdefined(var_493cfe65) && var_493cfe65 != var_37eedd1 && weaponhasattachment(var_493cfe65, attachment))
									{
										function_d780f794(localclientnum, var_493cfe65, weaponoptions, 0);
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

/*
	Name: function_48ec057f
	Namespace: item_world
	Checksum: 0x61F70CD
	Offset: 0x8F58
	Size: 0x26E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_48ec057f(localclientnum)
{
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(!isdefined(var_8040e225))
	{
		return;
	}
	var_f1530a67 = getservertime(localclientnum, 1);
	var_bea3e246 = [];
	foreach(var_ee7a9894 in var_8040e225.var_ffc1c0e1)
	{
		model = function_61f5d33a(localclientnum, var_8040e225, var_bd027dd9);
		if(isdefined(model))
		{
			function_a4886b1e(localclientnum, var_bd027dd9, model);
		}
		if(var_ee7a9894.servertime >= var_f1530a67)
		{
			var_bea3e246[var_bd027dd9] = var_ee7a9894;
		}
	}
	var_8040e225.var_ffc1c0e1 = var_bea3e246;
	var_bf2d48f6 = [];
	foreach(var_ee7a9894 in var_8040e225.var_baf65690)
	{
		vehicle = getentbynum(localclientnum, var_7b9b4259);
		if(isdefined(vehicle) && var_ee7a9894.servertime >= var_f1530a67 && !function_97980fde(localclientnum, vehicle))
		{
			var_bf2d48f6[var_7b9b4259] = var_ee7a9894;
			function_3bd99d2f(localclientnum, var_8040e225, vehicle);
			continue;
		}
		function_3bd99d2f(localclientnum, var_8040e225, vehicle, 1);
	}
	var_8040e225.var_baf65690 = var_bf2d48f6;
}

/*
	Name: function_6d4050ed
	Namespace: item_world
	Checksum: 0x8ECD4A7
	Offset: 0x91D0
	Size: 0x1A6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6d4050ed(localclientnum)
{
	self endon(#"shutdown");
	self notify("48b04ccaa6c811c3");
	self endon("48b04ccaa6c811c3");
	waitframe(1);
	var_8040e225 = function_a7e98a1a(localclientnum);
	var_8040e225.var_a4ad122e = 0;
	var_8040e225.var_d7bd75b5 = 0;
	function_1b11e73c();
	while(true)
	{
		if(!isdefined(self))
		{
			return;
		}
		if(function_96fa1c6d(localclientnum))
		{
			draworigin = function_8cf40a8c(localclientnum);
			self thread function_d889880b(localclientnum, draworigin);
		}
		waitframe(1);
		function_48ec057f(localclientnum);
		function_c46425e0(localclientnum);
		waitframe(1);
		if(isalive(self))
		{
			self thread function_e2c19e6b(localclientnum);
			if(function_c7e5c26(localclientnum))
			{
				self thread function_b0af857f(localclientnum);
			}
			function_48ca0bbb(localclientnum);
		}
		waitframe(1);
	}
}

/*
	Name: function_c199bcc6
	Namespace: item_world
	Checksum: 0x205FB303
	Offset: 0x9380
	Size: 0x42
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c199bcc6(localclientnum, item)
{
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return 0;
	}
	return namespace_b376ff3f::function_e106cbe9(localclientnum, item);
}

/*
	Name: function_87e71bc0
	Namespace: item_world
	Checksum: 0xBF33F343
	Offset: 0x93D0
	Size: 0xAA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_87e71bc0(localclientnum, var_a6762160)
{
	if(isdefined(level.var_75f7e612))
	{
		result = [[level.var_75f7e612]](localclientnum, var_a6762160);
		/#
			assert(result === 1 || result === 0);
		#/
		return result;
	}
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return 1;
	}
	return namespace_b376ff3f::function_ad4c6116(localclientnum, var_a6762160);
}

/*
	Name: function_8c4dc71f
	Namespace: item_world
	Checksum: 0x714438F3
	Offset: 0x9488
	Size: 0x7C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_8c4dc71f(localclientnum, var_a6762160)
{
	if(isdefined(level.var_977ee0c2))
	{
		result = [[level.var_977ee0c2]](localclientnum, var_a6762160);
		/#
			assert(result === 1 || result === 0);
		#/
		return result;
	}
	return 0;
}

/*
	Name: function_76eb0584
	Namespace: item_world
	Checksum: 0xFE8E6CE4
	Offset: 0x9510
	Size: 0xAA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_76eb0584(localclientnum, var_a6762160)
{
	if(isdefined(level.var_b637a0c0))
	{
		result = [[level.var_b637a0c0]](localclientnum, var_a6762160);
		/#
			assert(result === 1 || result === 0);
		#/
		return result;
	}
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return 1;
	}
	return namespace_b376ff3f::function_a243ddd6(localclientnum, var_a6762160);
}

/*
	Name: function_c76c61d6
	Namespace: item_world
	Checksum: 0x7FD211A3
	Offset: 0x95C8
	Size: 0x42
	Parameters: 2
	Flags: Linked, Private
*/
function private function_c76c61d6(localclientnum, var_a6762160)
{
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return;
	}
	return namespace_b376ff3f::function_78ed4455(localclientnum, var_a6762160);
}

/*
	Name: function_cc2f075
	Namespace: item_world
	Checksum: 0xB0F6BB67
	Offset: 0x9618
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc2f075(localclientnum)
{
	if(namespace_b376ff3f::function_7d5553ac())
	{
		return;
	}
	return namespace_b376ff3f::function_d768ea30(localclientnum);
}

/*
	Name: function_48ca0bbb
	Namespace: item_world
	Checksum: 0xEFA9B913
	Offset: 0x9658
	Size: 0xCEC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_48ca0bbb(localclientnum)
{
	var_da43934d = self function_da43934d();
	if(var_da43934d)
	{
		eyepos = getlocalclienteyepos(localclientnum);
		angles = getlocalclientangles(localclientnum);
		var_1f50aeea = self clientfield::get_player_uimodel("hudItems.pickupHintWeaponIndex");
		if(!var_1f50aeea && isdefined(self.var_9b882d22) && isdefined(self.var_9b882d22.var_a6762160) && !isdefined(getplayervehicle(self)))
		{
			var_a6762160 = self.var_9b882d22.var_a6762160;
			var_77055f15 = 0;
			var_fa3df96 = undefined;
			if(var_a6762160.itemtype == #"ammo" && !function_c199bcc6(localclientnum, self.var_9b882d22))
			{
				var_77055f15 = 64;
			}
			else
			{
				if(function_8c4dc71f(localclientnum, var_a6762160))
				{
					var_77055f15 = 2;
				}
				else
				{
					if(function_76eb0584(localclientnum, var_a6762160))
					{
						var_77055f15 = 1;
						if(var_a6762160.itemtype == #"attachment")
						{
							var_77055f15 = 1;
							if(function_87e71bc0(localclientnum, var_a6762160))
							{
								var_77055f15 = var_77055f15 | 32;
							}
						}
						else
						{
							if(var_a6762160.itemtype == #"weapon")
							{
								var_a4250c2b = self function_cc2f075(localclientnum);
								if(isdefined(var_a4250c2b) && namespace_a0d533d1::function_4bd83c04(self.var_9b882d22) && self namespace_b376ff3f::function_850588f4(localclientnum, var_a4250c2b) && !is_true(level.var_8c46cf7a))
								{
									var_77055f15 = var_77055f15 | 512;
								}
							}
							else if(var_a6762160.itemtype == #"armor")
							{
								if(!function_87e71bc0(localclientnum, var_a6762160))
								{
									var_77055f15 = 4;
								}
							}
						}
					}
					else
					{
						if(var_a6762160.itemtype == #"weapon")
						{
							var_77055f15 = 2;
							var_a4250c2b = self function_cc2f075(localclientnum);
							if(isdefined(var_a4250c2b) && namespace_a0d533d1::function_4bd83c04(self.var_9b882d22) && self namespace_b376ff3f::function_850588f4(localclientnum, var_a4250c2b) && !is_true(level.var_8c46cf7a))
							{
								var_77055f15 = var_77055f15 | 512;
							}
							if(isdefined(level.var_69fa4969))
							{
								if(![[level.var_69fa4969]](localclientnum, var_a6762160))
								{
									var_77055f15 = 8192;
								}
							}
						}
						else
						{
							var_fa3df96 = self function_c76c61d6(localclientnum, var_a6762160);
							if(isdefined(var_fa3df96))
							{
								var_77055f15 = 2;
								if(var_a6762160.itemtype == #"armor")
								{
									if(!function_87e71bc0(localclientnum, var_a6762160))
									{
										var_77055f15 = 2048;
									}
								}
								else if(var_a6762160.itemtype == #"attachment")
								{
									var_fa3df96 = undefined;
									if(function_87e71bc0(localclientnum, var_a6762160))
									{
										var_77055f15 = var_77055f15 | 32;
									}
								}
							}
							else
							{
								if(!function_87e71bc0(localclientnum, var_a6762160))
								{
									if(var_a6762160.itemtype == #"resource" && namespace_ad5a0cd6::function_41f06d9d(var_a6762160))
									{
										var_77055f15 = 128;
									}
									else
									{
										var_77055f15 = 4;
									}
									if(var_a6762160.itemtype == #"scorestreak" || var_a6762160.itemtype == #"health" || namespace_a0d533d1::function_1507e6f0(var_a6762160) || namespace_ad5a0cd6::function_a57773a4(var_a6762160))
									{
										var_77055f15 = var_77055f15 | 1024;
									}
									if(var_a6762160.itemtype == #"hash_7064fc95aa1c1bbe")
									{
										var_77055f15 = 64;
									}
									if(var_a6762160.itemtype == #"hash_576593319dc02d70")
									{
										maxarmor = self function_a07288ec();
										if(maxarmor === 0)
										{
											var_77055f15 = 4096;
										}
										else
										{
											var_77055f15 = 2048;
										}
									}
									if(var_a6762160.name === #"hash_2cdb76a587cf7a3b")
									{
										var_77055f15 = 8192;
									}
								}
								else if(var_a6762160.itemtype == #"scorestreak" || var_a6762160.itemtype == #"health" || namespace_a0d533d1::function_1507e6f0(var_a6762160) || namespace_ad5a0cd6::function_a57773a4(var_a6762160))
								{
									if(function_87e71bc0(localclientnum, var_a6762160))
									{
										var_77055f15 = var_77055f15 | 256;
									}
								}
							}
						}
					}
				}
			}
			objstate = 0;
			if(isdefined(self.var_9b882d22.var_5a15eef2) && self.var_9b882d22.var_5a15eef2)
			{
				objstate = 1;
			}
			pickupicon = (is_true(level.var_abaea458[self.var_9b882d22.var_bd027dd9]) ? #"" : (isdefined(var_a6762160.pickupicon) ? var_a6762160.pickupicon : var_a6762160.icon));
			if(self.var_54d9f4a6)
			{
				var_77055f15 = 16;
			}
			setuimodelvalue(level.var_7e2f5883[localclientnum], (isdefined(var_fa3df96) ? var_fa3df96 : -1));
			setuimodelvalue(level.var_ce95aace[localclientnum], var_77055f15);
			setuimodelvalue(level.var_437da950[localclientnum], (isdefined(var_a6762160.rarity) ? var_a6762160.rarity : ""));
			itemcount = (isdefined(self.var_9b882d22.count) ? self.var_9b882d22.count : 1);
			if(itemcount > 1)
			{
				setuimodelvalue(level.var_fc13a25a[localclientnum], " x" + itemcount);
			}
			else
			{
				setuimodelvalue(level.var_fc13a25a[localclientnum], "");
			}
			var_13c39926 = #"";
			if(isdefined(var_a6762160.itemtype))
			{
				if(!function_7a600918(var_a6762160.itemtype))
				{
					var_13c39926 = hash(var_a6762160.itemtype);
				}
				else
				{
					var_13c39926 = var_a6762160.itemtype;
				}
			}
			setuimodelvalue(level.var_d2215e8f[localclientnum], var_13c39926);
			if(getuimodelvalue(level.var_d42ffee1[localclientnum]) !== 10)
			{
				setuimodelvalue(level.var_19cf0be9[localclientnum], (isdefined(pickupicon) ? pickupicon : #"blacktransparent"));
			}
			if(self.var_9b882d22.var_5d97fed1)
			{
				function_b21002cb(localclientnum, level.var_383edf80, self.var_9b882d22, objstate);
				function_c3f5f99b(localclientnum, level.var_d9beffb9);
			}
			else if(self namespace_ad5a0cd6::can_pick_up(self.var_9b882d22))
			{
				hintstring = self function_2fc74639();
				var_d1fce876 = #"";
				if(isdefined(var_a6762160.hintstring))
				{
					var_d1fce876 = var_a6762160.hintstring;
				}
				else
				{
					if(isdefined(var_a6762160.weapon))
					{
						var_d1fce876 = var_a6762160.weapon.displayname;
					}
					else
					{
						var_d1fce876 = (isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"");
					}
				}
				if(var_d1fce876 == hintstring)
				{
					function_b21002cb(localclientnum, level.var_d9beffb9, self.var_9b882d22, objstate);
					function_c3f5f99b(localclientnum, level.var_383edf80);
				}
				else
				{
					if(!is_true(self.var_9b882d22.var_dae3e8db))
					{
						function_b21002cb(localclientnum, level.var_d9beffb9, self.var_9b882d22, objstate);
					}
					else
					{
						function_c3f5f99b(localclientnum, level.var_d9beffb9, self.var_9b882d22);
					}
					function_c3f5f99b(localclientnum, level.var_383edf80, self.var_9b882d22);
				}
			}
		}
		else
		{
			if(var_1f50aeea)
			{
				setuimodelvalue(level.var_ce95aace[localclientnum], 16384);
			}
			if(getuimodelvalue(level.var_d42ffee1[localclientnum]) !== 10)
			{
				setuimodelvalue(level.var_19cf0be9[localclientnum], #"blacktransparent");
			}
			function_c3f5f99b(localclientnum, level.var_d9beffb9);
			function_c3f5f99b(localclientnum, level.var_383edf80);
		}
		if(self function_34418003(localclientnum, eyepos, angles))
		{
			self function_7c84312d(localclientnum, eyepos, angles);
		}
	}
}

/*
	Name: function_94db1536
	Namespace: item_world
	Checksum: 0x10CB61BE
	Offset: 0xA350
	Size: 0x152
	Parameters: 4
	Flags: Linked, Private
*/
function private function_94db1536(localclientnum, origin, angles, maxdist)
{
	if(!isdefined(maxdist))
	{
		maxdist = undefined;
	}
	/#
		assert(isplayer(self));
	#/
	var_8040e225 = function_a7e98a1a(localclientnum);
	forward = vectornormalize(anglestoforward(angles));
	if(!isdefined(maxdist))
	{
		maxdist = util::function_16fb0a3b();
	}
	var_f4b807cb = function_2e3efdda(origin, forward, 128, maxdist, 0);
	var_4bd72bfe = function_ab88dbd2(localclientnum, #"warzoneprioritypickups");
	var_9b882d22 = namespace_ad5a0cd6::function_6061a15(var_f4b807cb, maxdist, origin, angles, forward, var_4bd72bfe, 1);
	return var_9b882d22;
}

/*
	Name: function_c5b6693a
	Namespace: item_world
	Checksum: 0xD104EB8A
	Offset: 0xA4B0
	Size: 0x6A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c5b6693a()
{
	item = spawnstruct();
	item.amount = 0;
	item.count = 0;
	item.id = 32767;
	item.var_bd027dd9 = 32767;
	item.var_a6762160 = undefined;
	item.var_627c698b = undefined;
	return item;
}

/*
	Name: function_7c84312d
	Namespace: item_world
	Checksum: 0x54471A47
	Offset: 0xA528
	Size: 0x18C
	Parameters: 3
	Flags: Linked, Private
*/
function private function_7c84312d(localclientnum, origin, angles)
{
	/#
		assert(isplayer(self));
	#/
	var_8040e225 = function_a7e98a1a(angles);
	while(is_true(var_8040e225.var_a4ad122e))
	{
		waitframe(1);
	}
	if(!isplayer(self))
	{
		return;
	}
	if(isdefined(self.var_9b882d22))
	{
		var_433d429 = 14;
		var_f0f7e918 = function_2e3efdda(self.var_9b882d22.origin, undefined, 128, var_433d429, undefined, 1);
		var_f0f7e918 = self function_43d3ebe1(var_f0f7e918);
		if(!isdefined(self))
		{
			return;
		}
		arrayremovevalue(var_f0f7e918, undefined, 0);
		var_8040e225.var_f0f7e918 = function_83e328e1(var_8040e225.var_f0f7e918, var_f0f7e918);
	}
	else
	{
		var_8040e225.var_f0f7e918 = [];
	}
	self function_9116bb0e(angles);
}

/*
	Name: function_83e328e1
	Namespace: item_world
	Checksum: 0xCD15BF8D
	Offset: 0xA6C0
	Size: 0x336
	Parameters: 2
	Flags: Linked, Private
*/
function private function_83e328e1(var_78ddf4e2, var_ea9f2d5b)
{
	if(!isdefined(var_78ddf4e2))
	{
		return var_ea9f2d5b;
	}
	items = [];
	var_313b3d43 = 0;
	var_4717ba7d = 0;
	var_21198c86 = [];
	foreach(newitem in var_ea9f2d5b)
	{
		if(!isdefined(newitem))
		{
			continue;
		}
		var_f613370d = newitem;
		if(isstruct(var_f613370d) && namespace_ad5a0cd6::function_2c7fc531(var_f613370d.var_bd027dd9))
		{
			var_f613370d = function_b1702735(var_f613370d.var_bd027dd9);
		}
		if(self namespace_ad5a0cd6::can_pick_up(var_f613370d))
		{
			var_21198c86[var_21198c86.size] = var_f613370d;
		}
	}
	foreach(var_319b917b in var_78ddf4e2)
	{
		var_f59eabca = var_319b917b;
		if(isstruct(var_f59eabca) && namespace_ad5a0cd6::function_2c7fc531(var_f59eabca.var_bd027dd9))
		{
			var_f59eabca = function_b1702735(var_f59eabca.var_bd027dd9);
		}
		if(!isdefined(var_f59eabca) || !self namespace_ad5a0cd6::can_pick_up(var_f59eabca))
		{
			var_313b3d43++;
			items[items.size] = function_c5b6693a();
			continue;
		}
		foreach(newitem in var_21198c86)
		{
			if(newitem.var_bd027dd9 == var_f59eabca.var_bd027dd9)
			{
				var_4717ba7d++;
				items[items.size] = newitem;
			}
		}
	}
	if(var_21198c86.size == var_4717ba7d && var_78ddf4e2.size == (var_4717ba7d + var_313b3d43))
	{
		return items;
	}
	return var_ea9f2d5b;
}

/*
	Name: function_1b42632a
	Namespace: item_world
	Checksum: 0x7FC45323
	Offset: 0xAA00
	Size: 0x234
	Parameters: 3
	Flags: Linked, Private
*/
function private function_1b42632a(localclientnum, var_8040e225, var_2ccf7a1c)
{
	var_f0a9e97d = undefined;
	var_e7349b30 = undefined;
	foreach(var_7d6cdf6f, var_ee7a9894 in var_8040e225.var_ffc1c0e1)
	{
		if(var_ee7a9894.var_2ccf7a1c == var_2ccf7a1c)
		{
			var_f0a9e97d = var_7d6cdf6f;
			var_e7349b30 = var_ee7a9894;
			break;
		}
	}
	if(isdefined(var_f0a9e97d))
	{
		var_8040e225.var_ffc1c0e1[var_f0a9e97d] = undefined;
		model = function_61f5d33a(localclientnum, var_8040e225, var_f0a9e97d);
		if(isdefined(model))
		{
			function_a4886b1e(localclientnum, var_f0a9e97d, model);
		}
	}
	var_cd3b74d6 = undefined;
	var_e7349b30 = undefined;
	foreach(var_7b9b4259, var_ee7a9894 in var_8040e225.var_baf65690)
	{
		if(var_ee7a9894.var_2ccf7a1c == var_2ccf7a1c)
		{
			var_cd3b74d6 = var_7b9b4259;
			var_e7349b30 = var_ee7a9894;
			break;
		}
	}
	if(isdefined(var_cd3b74d6))
	{
		var_8040e225.var_baf65690[var_cd3b74d6] = undefined;
		vehicle = getentbynum(localclientnum, var_cd3b74d6);
		if(isdefined(vehicle))
		{
			function_3bd99d2f(localclientnum, var_8040e225, vehicle, 1);
		}
	}
}

/*
	Name: function_347698a5
	Namespace: item_world
	Checksum: 0x1916CA52
	Offset: 0xAC40
	Size: 0xF4
	Parameters: 3
	Flags: Linked
*/
function function_347698a5(localclientnum, var_bd027dd9, var_2ccf7a1c)
{
	var_8040e225 = function_a7e98a1a(localclientnum);
	function_1b42632a(localclientnum, var_8040e225, var_2ccf7a1c);
	endtime = getservertime(localclientnum, 1) + 60000;
	var_8040e225.var_ffc1c0e1[var_bd027dd9] = {#hash_2ccf7a1c:var_2ccf7a1c, #servertime:endtime};
	model = function_61f5d33a(localclientnum, var_8040e225, var_bd027dd9);
	if(isdefined(model))
	{
		function_a4886b1e(localclientnum, var_bd027dd9, model);
	}
}

/*
	Name: function_d2f95c1a
	Namespace: item_world
	Checksum: 0x6CB2B6B2
	Offset: 0xAD40
	Size: 0xEC
	Parameters: 3
	Flags: Linked
*/
function function_d2f95c1a(localclientnum, var_7b9b4259, var_2ccf7a1c)
{
	var_8040e225 = function_a7e98a1a(localclientnum);
	function_1b42632a(localclientnum, var_8040e225, var_2ccf7a1c);
	endtime = getservertime(localclientnum, 1) + 60000;
	var_8040e225.var_baf65690[var_7b9b4259] = {#hash_2ccf7a1c:var_2ccf7a1c, #servertime:endtime};
	vehicle = getentbynum(localclientnum, var_7b9b4259);
	function_d223645e(localclientnum, vehicle);
}

/*
	Name: function_a7e98a1a
	Namespace: item_world
	Checksum: 0x8826D7DD
	Offset: 0xAE38
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_a7e98a1a(localclientnum)
{
	return level.var_d342a3fd[localclientnum];
}

/*
	Name: function_963d3f6e
	Namespace: item_world
	Checksum: 0x9DF69813
	Offset: 0xAE60
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_963d3f6e()
{
	return getgametypesetting(#"hash_47dd11084763c671");
}

/*
	Name: function_73436347
	Namespace: item_world
	Checksum: 0x11E105DC
	Offset: 0xAE90
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function function_73436347(itemgroup, var_bd027dd9)
{
	/#
		assert(isarray(itemgroup));
	#/
	/#
		assert(isint(var_bd027dd9));
	#/
	for(index = 0; index < itemgroup.size; index++)
	{
		item = itemgroup[index];
		if(isdefined(item) && item.var_bd027dd9 === var_bd027dd9)
		{
			return index;
		}
	}
	return undefined;
}

/*
	Name: function_d223645e
	Namespace: item_world
	Checksum: 0xF1936F2F
	Offset: 0xAF58
	Size: 0x8C
	Parameters: 2
	Flags: Linked
*/
function function_d223645e(localclientnum, vehicle)
{
	/#
		assert(isdefined(vehicle));
	#/
	if(!isdefined(vehicle) || !function_97980fde(localclientnum, vehicle))
	{
		return;
	}
	var_8040e225 = function_a7e98a1a(localclientnum);
	function_3bd99d2f(localclientnum, var_8040e225, vehicle);
}

/*
	Name: function_a4886b1e
	Namespace: item_world
	Checksum: 0x5C5BE87F
	Offset: 0xAFF0
	Size: 0x21C
	Parameters: 3
	Flags: Linked
*/
function function_a4886b1e(localclientnum, var_bd027dd9, model)
{
	/#
		assert(isdefined(model));
	#/
	if(!isdefined(model))
	{
		return;
	}
	draworigin = function_8cf40a8c(localclientnum);
	maxdist = getdvarfloat(#"hash_2cd1a08f81049564", function_963d3f6e());
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(is_true(model.var_5d97fed1) || namespace_ad5a0cd6::function_83c20f83(model))
	{
		stash = function_c17fe536(localclientnum, var_8040e225, var_bd027dd9);
		function_78bf134c(localclientnum, var_8040e225, var_bd027dd9, stash);
	}
	else if(distancesquared(draworigin, model.origin) <= sqr(maxdist))
	{
		var_a6762160 = undefined;
		if(isdefined(var_bd027dd9))
		{
			if(namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
			{
				var_a6762160 = function_b1702735(var_bd027dd9).var_a6762160;
			}
			else if(namespace_ad5a0cd6::function_da09de95(var_bd027dd9))
			{
				if(isdefined(level.var_a4a4012e[var_bd027dd9]))
				{
					var_a6762160 = level.var_a4a4012e[var_bd027dd9].var_a6762160;
				}
			}
		}
		function_78bf134c(localclientnum, var_8040e225, var_bd027dd9, model, var_a6762160);
	}
}

/*
	Name: function_4409aa59
	Namespace: item_world
	Checksum: 0xD23EEB1D
	Offset: 0xB218
	Size: 0x19C
	Parameters: 2
	Flags: Linked
*/
function function_4409aa59(localclientnum, var_bd027dd9)
{
	if(!isdefined(var_bd027dd9))
	{
		return;
	}
	item = undefined;
	if(namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
	{
		item = function_b1702735(var_bd027dd9);
	}
	else if(namespace_ad5a0cd6::function_da09de95(var_bd027dd9))
	{
		if(isdefined(level.var_a4a4012e[var_bd027dd9]))
		{
			item = level.var_a4a4012e[var_bd027dd9];
		}
	}
	if(!isdefined(item) || !isdefined(item.var_a6762160) || !isdefined(item.var_a6762160.var_86d1fc36))
	{
		return;
	}
	var_a6762160 = item.var_a6762160;
	originoffset = function_7571fda9(item);
	angles = function_118d052e(item);
	forward = anglestoforward(angles);
	up = anglestoup(angles);
	playfx(localclientnum, var_a6762160.var_86d1fc36, item.origin + originoffset, forward, up);
}

/*
	Name: function_3de69770
	Namespace: item_world
	Checksum: 0xF4F6A3C1
	Offset: 0xB3C0
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function function_3de69770(localclientnum, item)
{
	if(!isdefined(item) || !isdefined(item.var_a6762160) || !isdefined(item.var_a6762160.var_37cd55af))
	{
		return;
	}
	var_a6762160 = item.var_a6762160;
	originoffset = function_7571fda9(item);
	angles = function_118d052e(item);
	forward = anglestoforward(angles);
	up = anglestoup(angles);
	playfx(localclientnum, var_a6762160.var_37cd55af, item.origin + originoffset, forward, up);
}

/*
	Name: function_7571fda9
	Namespace: item_world
	Checksum: 0xF525A65D
	Offset: 0xB4E0
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function function_7571fda9(item)
{
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return (0, 0, 0);
	}
	var_a6762160 = item.var_a6762160;
	originoffset = ((isdefined(var_a6762160.var_5dc4470b) ? var_a6762160.var_5dc4470b : 0), (isdefined(var_a6762160.var_54a3b4ca) ? var_a6762160.var_54a3b4ca : 0), (isdefined(var_a6762160.var_3e688854) ? var_a6762160.var_3e688854 : 0));
	originoffset = rotatepoint(originoffset * -1, item.angles);
	return originoffset;
}

/*
	Name: function_118d052e
	Namespace: item_world
	Checksum: 0xC15B2871
	Offset: 0xB5C8
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function function_118d052e(item)
{
	if(!isdefined(item))
	{
		return (0, 0, 0);
	}
	var_a6762160 = item.var_a6762160;
	if(!isdefined(item.var_a6762160))
	{
		return item.angles;
	}
	angles = combineangles(item.angles, ((isdefined(var_a6762160.var_15b88fde) ? var_a6762160.var_15b88fde : 0), (isdefined(var_a6762160.var_8c9a7dc8) ? var_a6762160.var_8c9a7dc8 : 0), (isdefined(var_a6762160.var_7a51d937) ? var_a6762160.var_7a51d937 : 0)));
	return angles;
}

/*
	Name: function_28b42f1c
	Namespace: item_world
	Checksum: 0x6096FC64
	Offset: 0xB6A8
	Size: 0xC0
	Parameters: 2
	Flags: Linked
*/
function function_28b42f1c(localclientnum, var_bd027dd9)
{
	if(namespace_ad5a0cd6::function_d9648161(var_bd027dd9))
	{
		if(namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
		{
			return var_bd027dd9;
		}
		if(namespace_ad5a0cd6::function_da09de95(var_bd027dd9))
		{
			if(isdefined(level.var_a4a4012e[var_bd027dd9]))
			{
				return level.var_a4a4012e[var_bd027dd9].id;
			}
		}
		else if(!namespace_b376ff3f::function_7d5553ac())
		{
			return namespace_b376ff3f::function_c48cd17f(localclientnum, var_bd027dd9);
		}
	}
	return 32767;
}

/*
	Name: get_item_name
	Namespace: item_world
	Checksum: 0xF1831847
	Offset: 0xB770
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function get_item_name(item)
{
	if(isdefined(item.displayname))
	{
		return item.displayname;
	}
	if(isdefined(item.weapon))
	{
		if(item.weapon.displayname != #"")
		{
			return item.weapon.displayname;
		}
	}
	return (isdefined(item.displayname) ? item.displayname : #"");
}

/*
	Name: function_6fe428b3
	Namespace: item_world
	Checksum: 0xDC66937F
	Offset: 0xB820
	Size: 0x52
	Parameters: 1
	Flags: Linked
*/
function function_6fe428b3(item)
{
	if(isdefined(item.pickupicon))
	{
		return item.pickupicon;
	}
	return (isdefined(item.icon) ? item.icon : #"");
}

/*
	Name: function_c59d8d2b
	Namespace: item_world
	Checksum: 0xA2BB9F96
	Offset: 0xB880
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_c59d8d2b(item)
{
	if(isdefined(item.var_e9898330) && item.var_e9898330 != "")
	{
		return item.var_e9898330;
	}
	if(isdefined(item.weapon.var_e9898330) && item.weapon.var_e9898330 != "")
	{
		return item.weapon.var_e9898330;
	}
	return undefined;
}

/*
	Name: function_2e3efdda
	Namespace: item_world
	Checksum: 0xAF0FE09F
	Offset: 0xB918
	Size: 0x15C
	Parameters: 6
	Flags: Linked
*/
function function_2e3efdda(origin, dir, var_4e7bdb02, maxdistance, dot, var_653b55e5)
{
	if(!isdefined(var_653b55e5))
	{
		var_653b55e5 = 0;
	}
	var_f4b807cb = function_abaeb170(origin, dir, var_4e7bdb02, maxdistance, dot, 1, 2147483647);
	var_6665e24 = arraysortclosest(level.var_a4a4012e, origin, var_4e7bdb02, 0, maxdistance);
	var_f4b807cb = arraycombine(var_f4b807cb, var_6665e24, 1, 0);
	var_f4b807cb = arraysortclosest(var_f4b807cb, origin, var_4e7bdb02, 0, maxdistance);
	if(var_653b55e5)
	{
		var_bad52796 = [];
		for(index = 0; index < var_f4b807cb.size; index++)
		{
			if(namespace_ad5a0cd6::function_83c20f83(var_f4b807cb[index]))
			{
				var_bad52796[var_bad52796.size] = var_f4b807cb[index];
			}
		}
		var_f4b807cb = var_bad52796;
	}
	return var_f4b807cb;
}

/*
	Name: function_222205a3
	Namespace: item_world
	Checksum: 0xF59C7803
	Offset: 0xBA80
	Size: 0x2EA
	Parameters: 2
	Flags: Linked
*/
function function_222205a3(localclientnum, var_bd027dd9)
{
	if(namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
	{
		if(function_54ca5536(var_bd027dd9, getservertime(0, 1)) == 0)
		{
			return;
		}
	}
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(isdefined(var_8040e225))
	{
		if(isdefined(var_8040e225.var_ab111430[var_bd027dd9]))
		{
			var_8040e225.var_ab111430[var_bd027dd9] hide();
			var_8040e225.var_ab111430[var_bd027dd9 * -1] = var_8040e225.var_ab111430[var_bd027dd9];
			function_2990e5f(localclientnum, var_8040e225.var_ab111430[var_bd027dd9]);
			arrayremoveindex(var_8040e225.var_ab111430, var_bd027dd9, 1);
			function_b032ccd(localclientnum, var_8040e225.var_ab111430);
		}
		if(isdefined(var_8040e225.var_89e328b4) && isdefined(var_8040e225.var_89e328b4[var_bd027dd9]))
		{
			var_8040e225.var_89e328b4[var_bd027dd9] hide();
			var_8040e225.var_89e328b4[var_bd027dd9 * -1] = var_8040e225.var_89e328b4[var_bd027dd9];
			function_2990e5f(localclientnum, var_8040e225.var_89e328b4[var_bd027dd9]);
			arrayremoveindex(var_8040e225.var_89e328b4, var_bd027dd9, 1);
			function_b032ccd(localclientnum, var_8040e225.var_ab111430);
		}
		if(isarray(var_8040e225.var_f0f7e918))
		{
			foreach(item in var_8040e225.var_f0f7e918)
			{
				if(isdefined(item) && item.var_bd027dd9 === var_bd027dd9)
				{
					if(isstruct(item))
					{
						item.var_8e092725 = gettime();
					}
					break;
				}
			}
		}
	}
}

/*
	Name: show_item
	Namespace: item_world
	Checksum: 0x93BFA77
	Offset: 0xBD78
	Size: 0x2B4
	Parameters: 3
	Flags: Linked
*/
function show_item(localclientnum, var_bd027dd9, var_7ba775ef)
{
	item = undefined;
	if(namespace_ad5a0cd6::function_2c7fc531(var_bd027dd9))
	{
		function_54ca5536(var_bd027dd9, (var_7ba775ef ? 0 : -1));
		player = function_5c10bd79(localclientnum);
		item = function_b1702735(var_bd027dd9);
		var_6369afab = function_963d3f6e();
		if(!isdefined(item.origin))
		{
			return;
		}
		if(isplayer(player) && distance2dsquared(item.origin, player.origin) <= sqr(var_6369afab))
		{
			player.var_506495f9 = 1;
		}
	}
	else
	{
		item = level.var_a4a4012e[var_bd027dd9];
	}
	var_8040e225 = function_a7e98a1a(localclientnum);
	if(isdefined(var_8040e225) && isdefined(item))
	{
		if(isdefined(var_8040e225.var_ab111430[var_bd027dd9]))
		{
			var_8040e225.var_ab111430[var_bd027dd9] show();
			function_78bf134c(localclientnum, var_8040e225, var_bd027dd9, var_8040e225.var_ab111430[var_bd027dd9], item.var_a6762160);
			function_84964a9e(localclientnum, item.var_a6762160, var_8040e225.var_ab111430[var_bd027dd9], var_bd027dd9);
		}
		if(isdefined(var_8040e225.var_89e328b4) && isdefined(var_8040e225.var_89e328b4[var_bd027dd9]))
		{
			var_8040e225.var_89e328b4[var_bd027dd9] show();
			function_78bf134c(localclientnum, var_8040e225, var_bd027dd9, var_8040e225.var_89e328b4[var_bd027dd9], item.var_a6762160);
			function_84964a9e(localclientnum, item.var_a6762160, var_8040e225.var_89e328b4[var_bd027dd9], var_bd027dd9);
		}
	}
}

/*
	Name: function_b78a9820
	Namespace: item_world
	Checksum: 0xBD7CE164
	Offset: 0xC038
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_b78a9820(localclientnum)
{
	var_8040e225 = function_a7e98a1a(localclientnum);
	var_8040e225.var_ff9e7e43 = 1;
}

/*
	Name: function_1b11e73c
	Namespace: item_world
	Checksum: 0x174EC346
	Offset: 0xC080
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_1b11e73c()
{
	level flag::wait_till(#"hash_51daecff754729dc");
}

/*
	Name: function_9b71de90
	Namespace: item_world
	Checksum: 0xA16A3CD3
	Offset: 0xC0B0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_9b71de90(localclientnum)
{
	model = function_425ed700(localclientnum);
	if(isdefined(model) && isdefined(model.id))
	{
		return model;
	}
}

