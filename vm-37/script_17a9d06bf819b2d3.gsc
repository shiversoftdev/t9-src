#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_5b1144e;

/*
	Name: __init__system__
	Namespace: namespace_5b1144e
	Checksum: 0xA0BDBE08
	Offset: 0x318
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_1e8eafe505e52c51", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5b1144e
	Checksum: 0xB80491F9
	Offset: 0x360
	Size: 0xD34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_a0b1f787 = [];
	level.var_2d1b0ac = [];
	level.var_3cbb97 = [];
	level.var_d459a1cf = [];
	level.var_3fc6a555 = [];
	function_5ae4a10c(1, "door", #"hash_50ac7af2c5bc8257", #"hash_5f3108a8ed351288", #"hash_74b8c57369bfb24b");
	function_5ae4a10c(11, "door");
	function_5ae4a10c(2, "debris", #"hash_14b4234423a635c0", #"hash_5e2a1ca8dc76be67", #"hash_74b8c57369bfb24b");
	function_5ae4a10c(3, "double_door", #"hash_50ac7af2c5bc8257", #"hash_5f3108a8ed351288", #"hash_74b8c57369bfb24b");
	function_5ae4a10c(4, "electric_door", #"hash_59bd96ed40a5975e", undefined, #"hash_6e7ff1a0f66deab4");
	function_5ae4a10c(5, "intel", #"hash_1f02d183075803d9", #"hash_739c39c90683d021", undefined, 1);
	function_5ae4a10c(12, "barricade", #"hash_6bd049dac126e3d7", undefined, undefined, 1, 98);
	function_5ae4a10c(array(#"p9_usa_large_ammo_crate_01", #"hash_94b3a8b935248d0"), "ammocache", #"hash_6d999ac22537eeb7", #"hash_e98c059b131f86c", #"hash_1d81c3d4a23328ba");
	function_5ae4a10c(#"p9_fxanim_zm_gp_dac_xmodel", "pc_terminal", #"hash_393d988e963356ec", #"hash_2e657370192514b5", #"hash_5c22f831283cbe0d", 0, -20);
	function_5ae4a10c(#"p9_fxanim_zm_gp_wunderfizz_on_xmodel", "fizz_machine", #"hash_a8b446447be6cb5", #"hash_307d328d2ca73346", #"hash_27298efc7e453782");
	function_5ae4a10c(#"p9_fxanim_zm_gp_crafting_xmodel", "crafting_table", #"hash_1f2e7c3c336590fb", #"hash_4990f9c23cc9c32a", #"hash_4290c0ae929fe8c4");
	function_5ae4a10c(#"p9_fxanim_zm_gp_pap_xmodel", "pack_a_punch", #"hash_3ab78b7b50f10ced", #"hash_5e9f5daa234fe730", #"hash_154530b7f83b7426");
	function_5ae4a10c(#"p9_fxanim_zm_gp_armor_station_xmodel", "armor_station", #"hash_9c7074e60cba94e", #"hash_51d31303312306d", #"hash_44bb09aa82404023", 1, -20);
	function_5ae4a10c(array(#"p9_fxanim_zm_gp_chest_01_sml_xmodel", #"p9_fxanim_zm_gp_chest_01_med_xmodel", #"p9_fxanim_zm_gp_chest_01_lrg_xmodel", #"hash_6415e85d0ce5b815", #"p9_sur_crate_chest_world_01_med_green", #"hash_3d3812708715d6c8"), "explore_chest", #"hash_3f81ab1ac065154d", #"hash_69eda3d15a6035ab");
	function_5ae4a10c(array(#"p9_sur_crystal_medium_01", #"p9_sur_crystal_medium_02"), "loot_pod", #"hash_3f81ab1ac065154d", #"hash_2e354b187fdbfbbc");
	function_5ae4a10c(#"p9_sur_crystal_small_01", "dark_aether_crystal", #"hash_69364657a8e13bea", #"hash_4f054ee9602c2197", undefined, 0, 32);
	function_5ae4a10c(undefined, "magicbox", #"hash_3f01b77865c1572d", #"hash_4542da19e0c104c", #"hash_5135a0345a6ece48");
	function_5ae4a10c(undefined, "wallbuy", &function_d1852e75, #"hash_5fc866a41152b3c", #"hash_5507b821f566791f");
	function_5ae4a10c(#"p9_zm_radio_pack_01_surface", "exfil_radio", undefined, #"hash_4e2a478df2a81e8c");
	function_5ae4a10c(#"p9_sur_elemental_pop", "perk_elemental_pop", #"hash_6d71fbf718d4b5e1", #"hash_5605b2abdf38cd4", #"hash_4b7d190b8305f4f6", 1, -20);
	function_5ae4a10c(#"p9_sur_machine_juggernog", "perk_juggernog", #"hash_90f7c3bd3c217c4", #"hash_22f552b15fc207f8", #"hash_706e82a94fff677a", 1, -20);
	function_5ae4a10c(#"p9_sur_machine_quick_revive", "perk_quick_revive", #"hash_634c9bd3e54d280a", #"hash_1aadb875c07be53a", #"hash_33843a8a6d05a384", 1, -20);
	function_5ae4a10c(#"p9_sur_machine_speed_cola", "perk_speed_cola", #"hash_fcf3aa364c93996", #"hash_33fa52ed652faf8a", #"hash_43bd6375813c74c4", 1, -20);
	function_5ae4a10c(#"p9_sur_machine_staminup", "perk_staminup", #"hash_199b94b5cb963ae5", #"hash_35f32b2271ef6ed7", #"hash_796547ba07a86d41", 1, -20);
	function_5ae4a10c(#"p9_sur_vending_ads", "perk_deadshot", #"hash_7c5e12190fbe93c0", #"hash_462ae51bbab3172a", #"hash_44728ebc2543db8e", 1, -20);
	function_5ae4a10c(#"p7_zm_power_up_nuke", "powerup_nuke", #"hash_39772b1fab5ee98c", #"hash_db9d5c95dfea201", #"hash_79ebbb36553f5b21");
	function_5ae4a10c(#"p7_zm_power_up_insta_kill", "powerup_insta_kill", #"hash_1784640b956f2f85", #"hash_504ad9537b38881f", #"hash_79ac89cbcace5b3b");
	function_5ae4a10c(#"p7_zm_power_up_max_ammo", "powerup_max_ammo", #"zombie/powerup_max_ammo", #"hash_2a901c3db306ba24", #"hash_4612fc19f97f58ad");
	function_5ae4a10c(#"p7_zm_power_up_double_points", "powerup_double_points", #"hash_774207d74b355a8a", #"hash_25d360e4ab517722", #"hash_3f59065a3419e61d");
	function_5ae4a10c(#"p7_zm_power_up_carpenter", "powerup_carpenter", #"hash_7ee3cb05607f53f3", #"hash_23e7594539b63cb8", #"hash_bfa2b9c3bd06c40");
	function_5ae4a10c(#"p7_zm_power_up_firesale", "powerup_firesale", #"hash_2c7bc0fa0980f8f5", #"hash_365549a15c5bde23", #"hash_8ea2b7214fa0627");
	function_5ae4a10c(#"wpn_t9_zm_perk_can_powerup", "powerup_free_perk", #"hash_165c84a677f7a58c", #"hash_287f99f86f82e12e", #"hash_16e60be7e8413d5");
	function_5ae4a10c(#"p8_zm_power_up_bonfire_sale", "powerup_bonfire_sale", undefined);
	function_5ae4a10c(#"zombie_z_money_icon", "powerup_bonus_points", #"hash_5162c283a9d6ee16", #"hash_3321e0bf2e424c30", #"hash_241cbd09653f7bbf");
	function_5ae4a10c(#"p8_zm_powerup_full_power", "powerup_hero_power", #"hash_50af8943ead42bcc", #"hash_3580f779bbcaa04d", #"hash_6e55b93f6580badb");
	function_5ae4a10c(#"hash_218ac2126792ad24", "powerup_naughty_or_nice", #"hash_c63a666160e5343", #"hash_ebdfcb1ce94a2dc", #"hash_5efaeea6fa02135a");
	function_5ae4a10c(#"p9_zm_powerup_clock", "powerup_cranked_pause", #"hash_4beb7d0e9dfb41f4", #"hash_2565a35b56075980", #"hash_48bab6acea8382da");
	clientfield::register("scriptmover", "" + #"hash_dfecc4e02f58398", 1, 3, "int", &function_3ed2984b, 0, 0);
	clientfield::register("zbarrier", "" + #"hash_dfecc4e02f58398", 1, 2, "int", &function_1bcf5171, 0, 0);
}

/*
	Name: function_3ed2984b
	Namespace: namespace_5b1144e
	Checksum: 0x73B22F63
	Offset: 0x10A0
	Size: 0x56
	Parameters: 7
	Flags: Linked
*/
function function_3ed2984b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_fc558e74 = level.var_a0b1f787[bwastimejump];
}

/*
	Name: function_1bcf5171
	Namespace: namespace_5b1144e
	Checksum: 0x8873B674
	Offset: 0x1100
	Size: 0x5A
	Parameters: 7
	Flags: Linked
*/
function function_1bcf5171(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.var_fc558e74 = level.var_a0b1f787[10 + bwastimejump];
}

/*
	Name: function_5ae4a10c
	Namespace: namespace_5b1144e
	Checksum: 0xCF9BC21C
	Offset: 0x1168
	Size: 0x1CC
	Parameters: 7
	Flags: Linked
*/
function function_5ae4a10c(modelname, targetname, displayname, var_7382ea8b, icon, var_b5a47119, zoffset)
{
	if(!isdefined(var_b5a47119))
	{
		var_b5a47119 = 0;
	}
	if(!isdefined(zoffset))
	{
		zoffset = 0;
	}
	if(isarray(modelname))
	{
		foreach(item in modelname)
		{
			function_5ae4a10c(item, targetname, displayname, var_7382ea8b, icon);
		}
	}
	else
	{
		if(isdefined(modelname))
		{
			level.var_a0b1f787[modelname] = targetname;
		}
		/#
			if(isdefined(level.var_2d1b0ac[targetname]) && isdefined(displayname))
			{
				/#
					assert(level.var_2d1b0ac[targetname] == displayname, "");
				#/
			}
		#/
		if(isdefined(displayname))
		{
			level.var_2d1b0ac[targetname] = displayname;
		}
		if(isdefined(var_7382ea8b))
		{
			level.var_3cbb97[targetname] = var_7382ea8b;
		}
		if(isdefined(icon))
		{
			level.var_f8c1279b[targetname] = icon;
		}
		level.var_d459a1cf[targetname] = var_b5a47119;
		level.var_3fc6a555[targetname] = zoffset;
	}
}

/*
	Name: function_d1852e75
	Namespace: namespace_5b1144e
	Checksum: 0x81CE1BC3
	Offset: 0x1340
	Size: 0x46
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d1852e75(ent)
{
	/#
		/#
			assert(isdefined(ent.var_ed875153), "");
		#/
	#/
	return ent.var_ed875153;
}

