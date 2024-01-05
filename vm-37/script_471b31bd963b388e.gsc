#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace item_world_util;

/*
	Name: __init__
	Namespace: item_world_util
	Checksum: 0xAFD3C2B5
	Offset: 0x80
	Size: 0x174
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init__()
{
	level.var_d8caca76 = function_a3975ce9();
	level.var_3f501cff = function_a04d222e();
	level.var_d051f0fe = function_d634ed59();
	level.var_8ee4985f = ((((17 + 1) + 8) + 1) + 8) + 1;
	level.var_c4160ac0 = level.var_d8caca76 - 2;
	/#
		assert((level.var_c4160ac0 + 1) == 32767);
	#/
	level.var_c1fb34bd = level.var_c4160ac0;
	level.var_b52c46a6 = level.var_c1fb34bd - level.var_8ee4985f;
	level.var_7d942c18 = level.var_b52c46a6 - 1;
	level.var_afaaa0ee = level.var_3f501cff;
	/#
		assert((level.var_7d942c18 - level.var_afaaa0ee) > 1024);
	#/
	level.var_b7364e19 = level.var_afaaa0ee - 1;
	level.var_6e47811c = 0;
}

/*
	Name: function_3531b9ba
	Namespace: item_world_util
	Checksum: 0xCC888C72
	Offset: 0x200
	Size: 0x4FC
	Parameters: 1
	Flags: Linked
*/
function function_3531b9ba(scorestreak)
{
	if(!isdefined(level.var_1953a530))
	{
		level.var_1953a530 = [];
		if(sessionmodeiszombiesgame())
		{
			level.var_1953a530[#"chopper_gunner"] = #"hash_541f29266c6b7df8";
			level.var_1953a530[#"hero_annihilator"] = #"hash_2294e52d4ac78b9a";
			level.var_1953a530[#"hero_flamethrower"] = #"hash_24a1df9928527c11";
			level.var_1953a530[#"hero_pineapplegun"] = #"hash_5f6d7361258230a";
			level.var_1953a530[#"hash_6890f205e1cddc52"] = #"hash_54877da1f10e40b5";
			level.var_1953a530[#"hash_3de3d523512f7cbc"] = #"hash_3e1160ae9d1b5446";
			level.var_1953a530[#"sig_bow_flame"] = #"hash_18ed63a25d0c43d1";
			level.var_1953a530[#"sig_lmg"] = #"hash_ba416827a85877c";
			level.var_1953a530[#"ultimate_turret"] = #"hash_cefb3af28fb800b";
		}
		else
		{
			level.var_1953a530[#"inventory_ac130"] = #"hash_59372818d5a4b00";
			level.var_1953a530[#"inventory_chopper_gunner"] = #"hash_6fa05dcae5ac1c4b";
			level.var_1953a530[#"inventory_counteruav"] = #"hash_6eb09ea5da35e18f";
			level.var_1953a530[#"inventory_helicopter_comlink"] = #"hash_11b95062385cd071";
			level.var_1953a530[#"inventory_helicopter_guard"] = #"hash_52ee32e14c642494";
			level.var_1953a530[#"hash_1ec557912d16a338"] = #"hash_48c54ff5d128d347";
			level.var_1953a530[#"inventory_hero_flamethrower"] = #"hash_5987d17c5829e656";
			level.var_1953a530[#"hash_4f347a4a61713f29"] = #"hash_78406ffa639f4bf";
			level.var_1953a530[#"inventory_hoverjet"] = #"hash_24f5473ce475912e";
			level.var_1953a530[#"hash_49d514608adc6a24"] = #"hash_569b6056354984ee";
			level.var_1953a530[#"hash_67f88dbc909e85f8"] = #"hash_bedd703cad46c40";
			level.var_1953a530[#"inventory_planemortar"] = #"hash_6a7de03254c6a4d5";
			level.var_1953a530[#"inventory_recon_car"] = #"hash_4980f99d633760cf";
			level.var_1953a530[#"inventory_recon_plane"] = #"hash_348085cf61f674ad";
			level.var_1953a530[#"inventory_remote_missile"] = #"hash_6739b1e55d16500";
			level.var_1953a530[#"hash_612a3485cc66289a"] = #"hash_257e121804c12624";
			level.var_1953a530[#"hash_1bb82c01e27085a2"] = #"hash_3cef4b4ca5fd8984";
			level.var_1953a530[#"inventory_straferun"] = #"hash_2640bc24c6eb39bd";
			level.var_1953a530[#"inventory_supply_drop"] = #"hash_e22ed3950927a02";
			level.var_1953a530[#"inventory_uav"] = #"hash_654445f6cc7a7e1c";
			level.var_1953a530[#"inventory_ultimate_turret"] = #"hash_5f50a43f7034eefa";
		}
	}
	return level.var_1953a530[scorestreak];
}

/*
	Name: function_6a0ee21a
	Namespace: item_world_util
	Checksum: 0xC4CFE069
	Offset: 0x708
	Size: 0x1434
	Parameters: 1
	Flags: Linked
*/
function function_6a0ee21a(attachmentname)
{
	if(!isdefined(level.var_4d26e905))
	{
		if(sessionmodeiszombiesgame())
		{
			level.var_4d26e905 = [];
			level.var_4d26e905[#"acog"] = #"hash_5951baf77aea4bb5";
			level.var_4d26e905[#"break"] = #"hash_52158dff02a348c";
			level.var_4d26e905[#"hash_485a77d7a4831afe"] = #"hash_628946b7b73932f2";
			level.var_4d26e905[#"barrel"] = #"hash_9c323d05d70c243";
			level.var_4d26e905[#"barrel2"] = #"hash_60d26e5edbea903b";
			level.var_4d26e905[#"compensator"] = #"hash_4cc226cdaeae487e";
			level.var_4d26e905[#"hash_75990807826703f8"] = #"hash_b5a96736b401cc";
			level.var_4d26e905[#"extclip"] = #"hash_67b9395b2e0029e6";
			level.var_4d26e905[#"extclip2"] = #"hash_29445e5eef449964";
			level.var_4d26e905[#"fastreload"] = #"hash_29c5035db4124cca";
			level.var_4d26e905[#"fastreload2"] = #"hash_c78ec937b30c440";
			level.var_4d26e905[#"grip"] = #"hash_57976ae65aa47edf";
			level.var_4d26e905[#"grip2"] = #"hash_77228486973b1c5f";
			level.var_4d26e905[#"handle"] = #"hash_3458660ffe1b7fa5";
			level.var_4d26e905[#"hash_6dd6c64c51d668b3"] = #"hash_2a9b80bf6e719e25";
			level.var_4d26e905[#"heavy"] = #"hash_69ff77781cdb7e44";
			level.var_4d26e905[#"hash_3fd36eb4bbbd3336"] = #"hash_6b5294a02fc58a1a";
			level.var_4d26e905[#"light"] = #"hash_c2dac0adf881b21";
			level.var_4d26e905[#"light2"] = #"hash_6737da1ec5ceec49";
			level.var_4d26e905[#"mixclip"] = #"hash_68c9e1eaf1008e31";
			level.var_4d26e905[#"hash_14e658b564e40657"] = #"hash_e5c35c6be678059";
			level.var_4d26e905[#"hash_7c6259ce4453863d"] = #"hash_7737198669ce118f";
			level.var_4d26e905[#"hash_2ea4a87e19eccb7d"] = #"hash_71743f1f9fdd9a4f";
			level.var_4d26e905[#"hash_574e57ebbb1fab71"] = #"hash_2b523070346b22a3";
			level.var_4d26e905[#"hash_79caa88ef6d002d9"] = #"hash_67ae49fa210cf21b";
			level.var_4d26e905[#"hash_27231e4565d05f6f"] = #"hash_79d7bb05f68ddc41";
			level.var_4d26e905[#"hash_510bccec01120b07"] = #"hash_3dcbd16782db8ce9";
			level.var_4d26e905[#"hash_6cb337a8f1814a78"] = #"hash_796bd61d402094c";
			level.var_4d26e905[#"hash_35d1de125eb13bbe"] = #"hash_603b80c2dece2932";
			level.var_4d26e905[#"hash_eeef17e8f501f49"] = #"hash_5867887c7438eb6b";
			level.var_4d26e905[#"hash_3023d50d85257e01"] = #"hash_516b9c009f958053";
			level.var_4d26e905[#"hash_2bd32c3c54913ae1"] = #"hash_66518103ed838ff3";
			level.var_4d26e905[#"hash_90efd83b2c6f489"] = #"hash_4ca03fd7fb77142b";
			level.var_4d26e905[#"quickdraw"] = #"hash_c8e1dbdf1b9a532";
			level.var_4d26e905[#"quickdraw2"] = #"hash_70e74393ae147f98";
			level.var_4d26e905[#"reddot"] = #"hash_657c0726e2c50cf5";
			level.var_4d26e905[#"reflex"] = #"hash_3e4ff275ec81e8b1";
			level.var_4d26e905[#"reflex2"] = #"hash_6284d1f01b3447d9";
			level.var_4d26e905[#"reflex3"] = #"hash_798c6f4830e4fd58";
			level.var_4d26e905[#"reflex4"] = #"hash_37872a865636aca3";
			level.var_4d26e905[#"dualoptic"] = #"hash_54b96cd4694b8d8";
			level.var_4d26e905[#"holo"] = #"hash_73abacec2fd5e23b";
			level.var_4d26e905[#"ir"] = #"hash_314a8049e018d6";
			level.var_4d26e905[#"elo"] = #"hash_37f2c1e35818d083";
			level.var_4d26e905[#"elo2"] = #"hash_1201c7fcb7f51efb";
			level.var_4d26e905[#"hash_7f031a605310ffc6"] = #"hash_6e8212c05312bdca";
			level.var_4d26e905[#"hash_487f75e1a5f169b0"] = #"hash_2358dab17bbd3454";
			level.var_4d26e905[#"hash_48977fe1a6060c8f"] = #"hash_20b99d912e487ba1";
			level.var_4d26e905[#"hash_7bdc3beafb1d08b0"] = #"hash_656765b4799b0954";
			level.var_4d26e905[#"hash_14425248b25574e6"] = #"hash_31d80559a5a0ec2a";
			level.var_4d26e905[#"hash_63e025b7feef496c"] = #"hash_4fb8b91096066f0";
			level.var_4d26e905[#"hash_252975a63099aaba"] = #"hash_4af2b13b3c82745e";
			level.var_4d26e905[#"hash_67c1a678b397c04f"] = #"hash_3a06adcc040945e1";
			level.var_4d26e905[#"hash_65ce5c192adc1467"] = #"hash_e248eef6a401689";
			level.var_4d26e905[#"stalker"] = #"hash_5dd5b8fd48364b3d";
			level.var_4d26e905[#"stalker2"] = #"hash_14cdaa7fd97c546d";
			level.var_4d26e905[#"steadyaim"] = #"hash_26ddd582ce81b2a4";
			level.var_4d26e905[#"steadyaim2"] = #"hash_233d4b936507cefa";
			level.var_4d26e905[#"suppressed"] = #"hash_4902fc1a64ffced9";
			level.var_4d26e905[#"suppressed2"] = #"hash_2ffc87f1c781bf91";
			level.var_4d26e905[#"swayreduc"] = #"hash_57d83338a5296980";
			level.var_4d26e905[#"hash_cfd82035c8077ea"] = #"hash_66b9864ca183b4ae";
			level.var_4d26e905[#"tactical"] = #"hash_1cafcd4206d28888";
		}
		else
		{
			level.var_4d26e905 = [];
			level.var_4d26e905[#"acog"] = #"hash_74efc2f0523a1b43";
			level.var_4d26e905[#"break"] = #"hash_62fe2eebac0f72a4";
			level.var_4d26e905[#"hash_485a77d7a4831afe"] = #"hash_2cdf0a02b981e7ea";
			level.var_4d26e905[#"barrel"] = #"hash_3d79e8fa4d04bbe9";
			level.var_4d26e905[#"barrel2"] = #"hash_1bdc6102e1922ee1";
			level.var_4d26e905[#"compensator"] = #"hash_7e68f63f8995b1e6";
			level.var_4d26e905[#"hash_75990807826703f8"] = #"hash_63a257f430cb24e4";
			level.var_4d26e905[#"extclip"] = #"hash_2551991b0ce4278e";
			level.var_4d26e905[#"extclip2"] = #"hash_43a7c00ebad019fc";
			level.var_4d26e905[#"fastreload"] = #"hash_13e7b5e35b27fda2";
			level.var_4d26e905[#"fastreload2"] = #"hash_2a74aa6c21425de8";
			level.var_4d26e905[#"grip"] = #"hash_780b6e02fd11b515";
			level.var_4d26e905[#"grip2"] = #"hash_1e87409dae378d95";
			level.var_4d26e905[#"handle"] = #"hash_72c4fa7a2b91b0b3";
			level.var_4d26e905[#"hash_6dd6c64c51d668b3"] = #"hash_5e8e59ff7a020c33";
			level.var_4d26e905[#"heavy"] = #"hash_355338f948fa31c";
			level.var_4d26e905[#"hash_3fd36eb4bbbd3336"] = #"hash_7a28e0acec4d71b2";
			level.var_4d26e905[#"light"] = #"hash_4e931ec838beed9f";
			level.var_4d26e905[#"light2"] = #"hash_a89044fba7b2c27";
			level.var_4d26e905[#"mixclip"] = #"hash_8337602f5a165af";
			level.var_4d26e905[#"hash_14e658b564e40657"] = #"hash_7ec532c309e0eef7";
			level.var_4d26e905[#"hash_7c6259ce4453863d"] = #"hash_693720c039d99805";
			level.var_4d26e905[#"hash_2ea4a87e19eccb7d"] = #"hash_2beafef30af1e8c5";
			level.var_4d26e905[#"hash_574e57ebbb1fab71"] = #"hash_6d0a8b21a8b8b789";
			level.var_4d26e905[#"hash_79caa88ef6d002d9"] = #"hash_63dd998473d02f01";
			level.var_4d26e905[#"hash_27231e4565d05f6f"] = #"hash_13623c18b49d567f";
			level.var_4d26e905[#"hash_510bccec01120b07"] = #"hash_4bfc4ce4d3e99f07";
			level.var_4d26e905[#"hash_6cb337a8f1814a78"] = #"hash_438ee0a9ed0f3b64";
			level.var_4d26e905[#"hash_35d1de125eb13bbe"] = #"hash_6cc986f0af4b142a";
			level.var_4d26e905[#"hash_eeef17e8f501f49"] = #"hash_311a6366c098f011";
			level.var_4d26e905[#"hash_3023d50d85257e01"] = #"hash_6db3b0a25b06fbb9";
			level.var_4d26e905[#"hash_2bd32c3c54913ae1"] = #"hash_64d48522d34c4f99";
			level.var_4d26e905[#"hash_90efd83b2c6f489"] = #"hash_26a11c1d57bbb4d1";
			level.var_4d26e905[#"quickdraw"] = #"hash_2b8002d0d1dd882a";
			level.var_4d26e905[#"quickdraw2"] = #"hash_776efcf8d78c80";
			level.var_4d26e905[#"reddot"] = #"hash_2ff1e718a658a883";
			level.var_4d26e905[#"reflex"] = #"hash_28efceaacc63752f";
			level.var_4d26e905[#"reflex2"] = #"hash_60df57f4f5a14577";
			level.var_4d26e905[#"reflex3"] = #"hash_53ac88663aebc40";
			level.var_4d26e905[#"reflex4"] = #"hash_7935909de8935589";
			level.var_4d26e905[#"dualoptic"] = #"hash_66f7a79dbd87eec0";
			level.var_4d26e905[#"holo"] = #"hash_6edd00dc752c24e1";
			level.var_4d26e905[#"ir"] = #"hash_13101dfb0ca2d5fe";
			level.var_4d26e905[#"elo"] = #"hash_139fe0e3be289c29";
			level.var_4d26e905[#"elo2"] = #"hash_409656a5454ca9a1";
			level.var_4d26e905[#"hash_7f031a605310ffc6"] = #"hash_1d1e0f96c57550a2";
			level.var_4d26e905[#"hash_487f75e1a5f169b0"] = #"hash_6e6118f39468cb2c";
			level.var_4d26e905[#"hash_48977fe1a6060c8f"] = #"hash_af064392d860f1f";
			level.var_4d26e905[#"hash_7bdc3beafb1d08b0"] = #"hash_4bc121b59bfe4a2c";
			level.var_4d26e905[#"hash_14425248b25574e6"] = #"hash_10ade3abf18cb742";
			level.var_4d26e905[#"hash_63e025b7feef496c"] = #"hash_114f1df6ad46f598";
			level.var_4d26e905[#"hash_252975a63099aaba"] = #"hash_3c63a8769b611006";
			level.var_4d26e905[#"hash_67c1a678b397c04f"] = #"hash_21f2c71ee52d3d5f";
			level.var_4d26e905[#"hash_65ce5c192adc1467"] = #"hash_fddd3e0764a6167";
			level.var_4d26e905[#"stalker"] = #"hash_12aaf0a984a5418b";
			level.var_4d26e905[#"stalker2"] = #"hash_767e2b6d5150883b";
			level.var_4d26e905[#"steadyaim"] = #"hash_1d25af262e371b3c";
			level.var_4d26e905[#"steadyaim2"] = #"hash_100ffabc91f834d2";
			level.var_4d26e905[#"suppressed"] = #"hash_bec81919557da77";
			level.var_4d26e905[#"suppressed2"] = #"hash_7823002429b5d54f";
			level.var_4d26e905[#"swayreduc"] = #"hash_6cd8671e4bd51c28";
			level.var_4d26e905[#"hash_cfd82035c8077ea"] = #"hash_59f84dd254fda616";
			level.var_4d26e905[#"tactical"] = #"hash_3bf739cbe86888f0";
		}
	}
	/#
		assert(isdefined(level.var_4d26e905[attachmentname]));
	#/
	return level.var_4d26e905[attachmentname];
}

/*
	Name: use_item_spawns
	Namespace: item_world_util
	Checksum: 0x9A3CDC73
	Offset: 0x1B48
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function use_item_spawns()
{
	if(util::is_frontend_map())
	{
		return 0;
	}
	return is_true(getgametypesetting(#"useitemspawns"));
}

/*
	Name: function_2eb2c17c
	Namespace: item_world_util
	Checksum: 0x6DCA9E1
	Offset: 0x1BA0
	Size: 0x286
	Parameters: 2
	Flags: Linked
*/
function function_2eb2c17c(origin, item)
{
	traceoffset = vectorscale((0, 0, 1), 4);
	var_5d97fed1 = function_83c20f83(item);
	var_8e2d9611 = item.origin + traceoffset;
	var_b0fbfe59 = bullettrace(origin, var_8e2d9611, 0, self, 0);
	if(var_b0fbfe59[#"fraction"] < 1 && var_b0fbfe59[#"entity"] !== item)
	{
		if(var_5d97fed1)
		{
			var_acdfe076 = isdefined(var_b0fbfe59[#"dynent"]) && distance2dsquared(var_b0fbfe59[#"dynent"].origin, item.origin) <= sqr(12);
			if(var_acdfe076 && isdefined(level.var_7d3131e8) && self [[level.var_7d3131e8]](var_b0fbfe59[#"dynent"], origin, anglestoforward(self getplayerangles())))
			{
				return false;
			}
			var_45127074 = isdefined(var_b0fbfe59[#"entity"]) && distance2dsquared(var_b0fbfe59[#"entity"].origin, item.origin) <= sqr(12);
			if(!var_acdfe076 && !var_45127074)
			{
				return false;
			}
		}
		else
		{
			var_5408bd2a = physicstraceex(origin, var_8e2d9611, (0, 0, 0), (0, 0, 0), self, 1);
			if(var_5408bd2a[#"fraction"] >= 1)
			{
				return true;
			}
			return false;
		}
	}
	return true;
}

/*
	Name: function_6061a15
	Namespace: item_world_util
	Checksum: 0xF870849C
	Offset: 0x1E30
	Size: 0x7B6
	Parameters: 7
	Flags: Linked
*/
function function_6061a15(var_f4b807cb, maxdist, origin, angles, forward, var_4bd72bfe, var_82043550)
{
	if(!isdefined(var_4bd72bfe))
	{
		var_4bd72bfe = 0;
	}
	if(!isdefined(var_82043550))
	{
		var_82043550 = 0;
	}
	var_9b882d22 = undefined;
	bestdot = -1;
	var_1530699e = undefined;
	var_7cd624f6 = 2147483647;
	var_431e5926 = undefined;
	var_548943d3 = 2147483647;
	var_95d4627b = 0;
	var_490fd61a = undefined;
	var_6b7d827a = 2147483647;
	var_404fbede = 0;
	var_ba6bb2bd = undefined;
	var_9fd8216d = -1;
	var_75f6d739 = anglestoforward((0, angles[1], 0));
	var_66347f1f = sqr(115);
	var_6b35a0b8 = sqr(24);
	for(itemindex = 0; itemindex < var_f4b807cb.size; itemindex++)
	{
		itemdef = var_f4b807cb[itemindex];
		if(!isdefined(itemdef))
		{
			continue;
		}
		if(is_true(itemdef.var_a6762160.var_b362e309) && !is_true(itemdef.var_a6762160.var_a6616b9c))
		{
			continue;
		}
		toitem = itemdef.origin - origin;
		var_abd887b5 = distance2dsquared(itemdef.origin, origin);
		if(var_abd887b5 < var_66347f1f && (abs(itemdef.origin[2] - origin[2])) < 72)
		{
			dot = vectordot(forward, vectornormalize(toitem));
			if(dot >= 0.965 && var_abd887b5 < var_66347f1f && dot > var_9fd8216d)
			{
				if(!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef))
				{
					continue;
				}
				var_ba6bb2bd = itemdef;
				var_9fd8216d = dot;
			}
			if(isdefined(var_ba6bb2bd) && var_abd887b5 >= var_66347f1f)
			{
				break;
			}
			var_1777205e = vectordot(var_75f6d739, vectornormalize((toitem[0], toitem[1], 0)));
			var_c5722fe1 = 0;
			if(var_4bd72bfe)
			{
				var_c5722fe1 = itemdef.var_a6762160.itemtype == #"weapon";
			}
			if(var_1777205e >= 0.965 && (var_abd887b5 < var_6b7d827a || (!var_c5722fe1 && var_404fbede)) && var_abd887b5 > var_6b35a0b8)
			{
				if(isdefined(var_490fd61a) && var_c5722fe1 && !var_404fbede)
				{
					continue;
				}
				if(!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef))
				{
					continue;
				}
				var_490fd61a = itemdef;
				var_6b7d827a = var_abd887b5;
				var_404fbede = var_c5722fe1;
			}
			if(isdefined(var_490fd61a) && !var_404fbede)
			{
				break;
			}
			var_19b17831 = var_95d4627b || var_404fbede;
			if(var_1777205e >= 0.866 && var_1777205e < 0.965 && (var_abd887b5 < var_548943d3 || (!var_c5722fe1 && var_19b17831)) && var_abd887b5 > var_6b35a0b8)
			{
				if(isdefined(var_490fd61a) || isdefined(var_431e5926) && var_c5722fe1 && !var_19b17831)
				{
					continue;
				}
				if(!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef))
				{
					continue;
				}
				var_431e5926 = itemdef;
				var_548943d3 = var_abd887b5;
				var_95d4627b = var_c5722fe1;
			}
			continue;
		}
		var_7ef7c839 = isdefined(var_ba6bb2bd) || isdefined(var_490fd61a) || isdefined(var_431e5926) || isdefined(var_1530699e);
		if(var_7ef7c839)
		{
			break;
		}
		var_1777205e = vectordot(var_75f6d739, vectornormalize((toitem[0], toitem[1], 0)));
		if(var_1777205e >= 0.866 && var_abd887b5 < var_7cd624f6)
		{
			if(!self can_pick_up(itemdef) || !function_2eb2c17c(origin, itemdef))
			{
				continue;
			}
			var_1530699e = itemdef;
			var_7cd624f6 = var_abd887b5;
		}
	}
	if(isdefined(var_ba6bb2bd))
	{
		var_9b882d22 = var_ba6bb2bd;
	}
	else
	{
		if(isdefined(var_490fd61a) && (!isdefined(var_431e5926) || !var_404fbede))
		{
			var_9b882d22 = var_490fd61a;
		}
		else
		{
			if(isdefined(var_431e5926))
			{
				var_9b882d22 = var_431e5926;
			}
			else if(isdefined(var_1530699e))
			{
				var_9b882d22 = var_1530699e;
			}
		}
	}
	if(isdefined(var_9b882d22))
	{
		neardist = util::function_4c1656d5();
		var_9b882d22.isfar = neardist < maxdist && distance2dsquared(origin, var_9b882d22.origin) > sqr(neardist);
		var_9b882d22.isclose = distance2dsquared(origin, var_9b882d22.origin) < (sqr(128 - 12));
		var_9b882d22.var_5d97fed1 = function_83c20f83(var_9b882d22);
	}
	return var_9b882d22;
}

/*
	Name: function_45efe0ab
	Namespace: item_world_util
	Checksum: 0x6B80120E
	Offset: 0x25F0
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function function_45efe0ab(var_a6762160)
{
	var_caafaa25 = #"";
	if(isdefined(var_a6762160.weapon) && var_a6762160.weapon != level.weaponnone)
	{
		if(var_a6762160.itemtype != #"ammo")
		{
			var_caafaa25 = var_a6762160.weapon.displayname;
		}
		else
		{
			var_caafaa25 = (isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"");
		}
	}
	else
	{
		var_caafaa25 = (isdefined(var_a6762160.hintstring) ? var_a6762160.hintstring : #"");
	}
	return var_caafaa25;
}

/*
	Name: function_808be9a3
	Namespace: item_world_util
	Checksum: 0xAF757A5A
	Offset: 0x26E0
	Size: 0xB0
	Parameters: 1
	Flags: Linked
*/
function function_808be9a3(var_bd027dd9)
{
	/#
		assert(var_bd027dd9 >= level.var_b52c46a6 && var_bd027dd9 <= level.var_c1fb34bd);
	#/
	slotid = var_bd027dd9 - level.var_b52c46a6;
	/#
		assert(slotid >= 0 && slotid < (((((17 + 1) + 8) + 1) + 8) + 1));
	#/
	return slotid;
}

/*
	Name: function_c094ccd3
	Namespace: item_world_util
	Checksum: 0x871DCFAB
	Offset: 0x2798
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function function_c094ccd3(var_bd027dd9)
{
	if(function_da09de95(var_bd027dd9))
	{
		return var_bd027dd9 - level.var_afaaa0ee;
	}
}

/*
	Name: function_1f0def85
	Namespace: item_world_util
	Checksum: 0xE8668E0E
	Offset: 0x27D8
	Size: 0x130
	Parameters: 1
	Flags: Linked
*/
function function_1f0def85(item)
{
	/#
		assert(isdefined(item));
	#/
	if(!isdefined(item))
	{
		return 32767;
	}
	if(isstruct(item))
	{
		/#
			assert(isdefined(item.id));
		#/
		/#
			assert(item.id >= level.var_6e47811c && item.id <= level.var_b7364e19);
		#/
		return item.id;
	}
	entnum = item getentitynumber();
	var_bd027dd9 = entnum + level.var_afaaa0ee;
	/#
		assert(var_bd027dd9 >= level.var_afaaa0ee && var_bd027dd9 <= level.var_7d942c18);
	#/
	return var_bd027dd9;
}

/*
	Name: function_970b8d86
	Namespace: item_world_util
	Checksum: 0xC4D56D60
	Offset: 0x2910
	Size: 0x110
	Parameters: 2
	Flags: Linked
*/
function function_970b8d86(slotid, var_259f58f3)
{
	if(!isdefined(var_259f58f3))
	{
		var_259f58f3 = undefined;
	}
	if(isdefined(var_259f58f3))
	{
		/#
			assert(var_259f58f3 <= 8);
		#/
		slotid = slotid + var_259f58f3;
	}
	/#
		assert(slotid >= 0 && slotid < (((((17 + 1) + 8) + 1) + 8) + 1));
	#/
	var_f5e3c230 = slotid;
	var_bd027dd9 = var_f5e3c230 + level.var_b52c46a6;
	/#
		assert(var_bd027dd9 >= level.var_b52c46a6 && var_bd027dd9 <= level.var_c1fb34bd);
	#/
	return var_bd027dd9;
}

/*
	Name: function_6af455de
	Namespace: item_world_util
	Checksum: 0x2D198F59
	Offset: 0x2A28
	Size: 0x260
	Parameters: 3
	Flags: Linked
*/
function function_6af455de(localclientnum, origin, angles)
{
	forward = anglestoforward(angles);
	vehicles = getentitiesinradius(origin, 1024, 12);
	var_bf3cabc9 = undefined;
	var_e664ecda = undefined;
	var_33b49591 = undefined;
	var_1dd6e163 = undefined;
	foreach(vehicle in vehicles)
	{
		occupied = 0;
		occupied = vehicle getvehoccupants().size > 0;
		if(occupied)
		{
			continue;
		}
		tovehicle = vectornormalize(vehicle.origin - origin);
		dot = vectordot(forward, tovehicle);
		var_aba3faed = distance2dsquared(vehicle.origin, origin);
		if(dot >= 0.965 && (!isdefined(var_e664ecda) || var_aba3faed < var_e664ecda))
		{
			var_bf3cabc9 = vehicle;
			var_e664ecda = var_aba3faed;
		}
		if(dot >= 0.5 && var_aba3faed <= sqr(128) && (!isdefined(var_1dd6e163) || var_aba3faed < var_1dd6e163))
		{
			var_33b49591 = vehicle;
			var_1dd6e163 = var_aba3faed;
		}
	}
	if(isdefined(var_33b49591))
	{
		return var_33b49591;
	}
	return var_bf3cabc9;
}

/*
	Name: function_c62ad9a7
	Namespace: item_world_util
	Checksum: 0xB259A2D3
	Offset: 0x2C90
	Size: 0x196
	Parameters: 1
	Flags: Linked
*/
function function_c62ad9a7(vehicle)
{
	hinttext = #"";
	if(isdefined(vehicle) && isdefined(vehicle.scriptvehicletype))
	{
		switch(vehicle.scriptvehicletype)
		{
			case "player_atv":
			{
				hinttext = #"wz/player_atv";
				break;
			}
			case "helicopter_light":
			{
				hinttext = #"wz/helicopter";
				break;
			}
			case "cargo_truck_wz":
			{
				hinttext = #"wz/cargo_truck";
				break;
			}
			case "tactical_raft_wz":
			{
				hinttext = #"hash_602556b5bd4f952d";
				break;
			}
			case "player_fav":
			{
				hinttext = #"wz/arav";
				break;
			}
			case "player_suv":
			{
				hinttext = #"wz/suv";
				break;
			}
			case "player_muscle":
			{
				hinttext = #"wz/muscle_car";
				break;
			}
			case "pbr_boat_wz":
			{
				hinttext = #"wz/pbr";
				break;
			}
		}
	}
	return hinttext;
}

/*
	Name: can_pick_up
	Namespace: item_world_util
	Checksum: 0x3F470CEC
	Offset: 0x2E30
	Size: 0x190
	Parameters: 2
	Flags: Linked
*/
function can_pick_up(item, servertime)
{
	if(!isdefined(servertime))
	{
		servertime = undefined;
	}
	if(!isdefined(item) || !isdefined(item.var_a6762160))
	{
		return false;
	}
	if(isdefined(servertime))
	{
		if(item.hidetime > 0 && item.hidetime <= servertime)
		{
			return false;
		}
	}
	else if(item.hidetime > 0 && !function_83c20f83(item))
	{
		return false;
	}
	if(!isstruct(item) && item getitemindex() == 32767)
	{
		return false;
	}
	if(isentity(item))
	{
		var_e9d710c1 = item getentitytype();
		if(var_e9d710c1 == 6 || var_e9d710c1 == 4 || var_e9d710c1 == 12 || var_e9d710c1 == 1)
		{
			if(isdefined(level.var_578f7c6d) && item clientfield::get("isJammed"))
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_4cbb6617
	Namespace: item_world_util
	Checksum: 0xCF356D10
	Offset: 0x2FC8
	Size: 0x2B0
	Parameters: 4
	Flags: None
*/
function function_4cbb6617(inventory, itemtype, var_da328e7b, var_bcc2655a)
{
	/#
		assert(ishash(itemtype));
	#/
	/#
		assert(isarray(var_da328e7b));
	#/
	if(!isdefined(var_bcc2655a))
	{
		return;
	}
	items = [];
	var_c7837092 = get_itemtype(var_bcc2655a);
	foreach(item in inventory.items)
	{
		if(!isdefined(item))
		{
			continue;
		}
		if(item.id == 32767)
		{
			continue;
		}
		if(!isdefined(item.var_a6762160))
		{
			continue;
		}
		var_b74300d3 = get_itemtype(item.var_a6762160);
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
	listitems = [];
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
			listitems[listitems.size] = items[var_b74300d3];
		}
	}
	if(currentindex < var_da328e7b.size)
	{
		for(index = 0; index < currentindex; index++)
		{
			var_b74300d3 = var_da328e7b[index];
			if(isdefined(items[var_b74300d3]))
			{
				listitems[listitems.size] = items[var_b74300d3];
			}
		}
	}
	return listitems;
}

/*
	Name: function_49ce7663
	Namespace: item_world_util
	Checksum: 0xF639EFF7
	Offset: 0x3280
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_49ce7663(itemname)
{
	if(isdefined(level.var_4afb8f5a[itemname]) && level.var_4afb8f5a[itemname] != #"")
	{
		itemname = level.var_4afb8f5a[itemname];
	}
	return function_4ba8fde(itemname);
}

/*
	Name: function_f73bc33
	Namespace: item_world_util
	Checksum: 0xD9128620
	Offset: 0x32F8
	Size: 0x32
	Parameters: 1
	Flags: None
*/
function function_f73bc33(item)
{
	return (isdefined(item.var_bd027dd9) ? item.var_bd027dd9 : item.id);
}

/*
	Name: get_itemtype
	Namespace: item_world_util
	Checksum: 0xD33A847D
	Offset: 0x3338
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function get_itemtype(var_a6762160)
{
	return (isdefined(var_a6762160.var_456aa154) ? getscriptbundle(var_a6762160.var_456aa154).name : var_a6762160.name);
}

/*
	Name: function_31f5aa51
	Namespace: item_world_util
	Checksum: 0x6285347C
	Offset: 0x3388
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_31f5aa51(item)
{
	if(!isdefined(item) || (!isdefined(item.targetname) && !isdefined(item.var_67169c0b)))
	{
		return;
	}
	targetname = (isdefined(item.targetname) ? item.targetname : item.var_67169c0b);
	stashes = level.var_93d08989[targetname];
	if(!isdefined(stashes) || stashes.size <= 0)
	{
		return;
	}
	stashes = arraysortclosest(stashes, item.origin, 1, 0, 12);
	if(stashes.size <= 0)
	{
		return;
	}
	return stashes[0];
}

/*
	Name: function_da09de95
	Namespace: item_world_util
	Checksum: 0x48903237
	Offset: 0x3478
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_da09de95(id)
{
	return id >= level.var_afaaa0ee && id <= level.var_7d942c18;
}

/*
	Name: function_7363384a
	Namespace: item_world_util
	Checksum: 0x2B5D2346
	Offset: 0x34B8
	Size: 0x60
	Parameters: 1
	Flags: Linked
*/
function function_7363384a(name)
{
	bundle = getscriptbundle(name);
	if(!isdefined(bundle))
	{
		return false;
	}
	if(bundle.type != #"hash_10587321f369e7f3")
	{
		return false;
	}
	return true;
}

/*
	Name: function_db35e94f
	Namespace: item_world_util
	Checksum: 0xBAD85DF8
	Offset: 0x3520
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_db35e94f(id)
{
	return id >= level.var_b52c46a6 && id <= level.var_c1fb34bd;
}

/*
	Name: function_41f06d9d
	Namespace: item_world_util
	Checksum: 0x15C6ACDC
	Offset: 0x3560
	Size: 0x66
	Parameters: 1
	Flags: Linked
*/
function function_41f06d9d(var_a6762160)
{
	if(!isdefined(var_a6762160) || !isdefined(var_a6762160.name))
	{
		return 0;
	}
	return var_a6762160.name == #"resource_item_paint" || var_a6762160.name == #"resource_item_paint_stack_10";
}

/*
	Name: function_a57773a4
	Namespace: item_world_util
	Checksum: 0xBCE64362
	Offset: 0x35D0
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_a57773a4(var_a6762160)
{
	if(!isdefined(var_a6762160) || !isdefined(var_a6762160.itemtype))
	{
		return false;
	}
	foreach(itemtype in array(#"hash_63c2e59c903465e6", #"hash_63c2e49c90346433", #"hash_63c2e39c90346280"))
	{
		if(var_a6762160.itemtype == itemtype)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_74e1e547
	Namespace: item_world_util
	Checksum: 0xF33ED955
	Offset: 0x36C8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_74e1e547(point)
{
	return function_3238d10d(point);
}

/*
	Name: function_83c20f83
	Namespace: item_world_util
	Checksum: 0x3FB24B9A
	Offset: 0x36F8
	Size: 0x40
	Parameters: 1
	Flags: Linked
*/
function function_83c20f83(item)
{
	/#
		assert(isdefined(item));
	#/
	if(!isdefined(item))
	{
		return 0;
	}
	return item.hidetime === -1;
}

/*
	Name: function_2c7fc531
	Namespace: item_world_util
	Checksum: 0x7E0553AB
	Offset: 0x3740
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_2c7fc531(id)
{
	return id >= level.var_6e47811c && id <= level.var_b7364e19;
}

/*
	Name: function_d9648161
	Namespace: item_world_util
	Checksum: 0xB9B0D840
	Offset: 0x3780
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_d9648161(id)
{
	return id >= level.var_6e47811c && id <= 32767;
}

/*
	Name: function_35e06774
	Namespace: item_world_util
	Checksum: 0xD65D1D8
	Offset: 0x37B8
	Size: 0x2DE
	Parameters: 2
	Flags: Linked
*/
function function_35e06774(var_a6762160, var_48cfb6ca)
{
	if(!isdefined(var_48cfb6ca))
	{
		var_48cfb6ca = 0;
	}
	if(isdefined(var_a6762160) && isdefined(var_a6762160.weapon) && (isarray(var_a6762160.attachments) || var_48cfb6ca))
	{
		attachments = [];
		if(isarray(var_a6762160.attachments))
		{
			foreach(attachment in var_a6762160.attachments)
			{
				attachments[attachments.size] = attachment.var_6be1bec7;
			}
			if(var_48cfb6ca)
			{
				foreach(attachment in var_a6762160.attachments)
				{
					var_fe35755b = getscriptbundle(attachment.var_6be1bec7);
					if(!isdefined(var_fe35755b) || var_fe35755b.type != #"hash_10587321f369e7f3" || !isarray(var_fe35755b.attachments))
					{
						continue;
					}
					foreach(var_a4559ed2 in var_fe35755b.attachments)
					{
						attachments[attachments.size] = var_a4559ed2.var_6be1bec7;
					}
				}
			}
		}
		weapon = getweapon(var_a6762160.weapon.name, attachments);
		return function_1242e467(weapon);
	}
	if(isdefined(var_a6762160))
	{
		return var_a6762160.weapon;
	}
	return undefined;
}

/*
	Name: function_f4a8d375
	Namespace: item_world_util
	Checksum: 0x91F55857
	Offset: 0x3AA0
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_f4a8d375(itemid)
{
	/#
		assert(function_2c7fc531(itemid));
	#/
	point = function_b1702735(itemid);
	if(isdefined(point))
	{
		var_a6762160 = point.var_a6762160;
		return function_35e06774(var_a6762160);
	}
	return undefined;
}

