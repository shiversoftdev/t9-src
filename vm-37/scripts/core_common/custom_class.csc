#using scripts\core_common\player\player_stats.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using script_53cd49b939f89fd7;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using script_474309807eb94f34;
#using scripts\core_common\activecamo_shared.csc;

#namespace customclass;

/*
	Name: localclientconnect
	Namespace: customclass
	Checksum: 0x30D0BCE4
	Offset: 0x708
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function localclientconnect(localclientnum)
{
	level thread custom_class_init(localclientnum);
}

/*
	Name: init
	Namespace: customclass
	Checksum: 0x96C15D23
	Offset: 0x738
	Size: 0x61C
	Parameters: 0
	Flags: None
*/
function init()
{
	level.var_636c2236 = 0;
	level.weapon_script_model = [];
	level.preload_weapon_model = [];
	level.last_weapon_name = [];
	level.var_8ad413c = [];
	level.current_weapon = [];
	level.attachment_names = [];
	level.paintshophiddenposition = [];
	level.camo_index = [];
	level.reticle_index = [];
	level.var_dd70be5b = [];
	level.var_aa10d0b4 = [];
	level.weapon_clientscript_cac_model = [];
	level.var_6f87d12e = [];
	level.weaponnone = getweapon(#"none");
	level.weapon_position[#"primary"] = struct::get("cac_weapon_position_primary");
	level.weapon_position[#"secondary"] = struct::get("cac_weapon_position_secondary");
	level.weapon_position[#"hash_5f2a18f0e771a387"] = struct::get("cac_weapon_position_secondary_oversized");
	level.weapon_position[#"secondarygrenade"] = struct::get("cac_weapon_position_tactical_grenade");
	level.weapon_position[#"hash_777a08527f2da4e1"] = struct::get("cac_weapon_position_tactical_grenade_2");
	level.weapon_position[#"primarygrenade"] = struct::get("cac_weapon_position_lethal_grenade");
	level.weapon_position[#"hash_6148898d5ac59179"] = struct::get("cac_weapon_position_lethal_grenade_2");
	level.weapon_position[#"specialgrenade"] = struct::get("cac_weapon_position_field_upgrade");
	level.weapon_position[#"hash_6e4546b3c7592af2"] = struct::get(#"hash_28277161c7260b8b");
	level.weapon_position[#"perks_zm"] = struct::get("zm_cac_weapon_position_perk_a_cola");
	level.weapon_position[#"ammo_zm"] = struct::get(#"hash_73f00d5929f25ae6");
	level.weapon_position[#"canister_zm"] = struct::get(#"hash_46bb0b2a02811f0f");
	level.weapon_position[#"weapon_categories_zm"] = struct::get(#"hash_30a7e0dd147270f1");
	level.weapon_position[#"perk1"] = struct::get("cac_weapon_position_perk_1");
	level.weapon_position[#"hash_75a53afe5fb30f2c"] = struct::get("cac_weapon_position_perk_1_2nd");
	level.weapon_position[#"hash_1e3b6d1c50127b6d"] = struct::get("cac_weapon_position_perk_1_3rd");
	level.weapon_position[#"hash_4b0730847097498b"] = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
	level.weapon_position[#"perk2"] = struct::get("cac_weapon_position_perk_2");
	level.weapon_position[#"hash_27460ccf4582b502"] = struct::get("cac_weapon_position_perk_2_2nd");
	level.weapon_position[#"hash_551e597e4fcfe0e4"] = struct::get("cac_weapon_position_perk_2_3rd");
	level.weapon_position[#"hash_4b072f84709747d8"] = level.weapon_position[#"hash_27460ccf4582b502"];
	level.weapon_position[#"perk3"] = struct::get("cac_weapon_position_perk_3");
	level.weapon_position[#"hash_344ad3ebce2569"] = struct::get("cac_weapon_position_perk_3_2nd");
	level.weapon_position[#"hash_3c0f3d3aa7135e86"] = struct::get("cac_weapon_position_perk_3_3rd");
	level.weapon_position[#"hash_4b07328470974cf1"] = level.weapon_position[#"hash_344ad3ebce2569"];
	level.weapon_position[#"hash_6791932344785551"] = struct::get("cac_weapon_position_wildcard");
	level.weapon_position[#"gunsmith"] = struct::get("gunsmith_weapon_position");
	/#
		level thread function_531d4c52();
	#/
}

/*
	Name: function_531d4c52
	Namespace: customclass
	Checksum: 0x3A601ECD
	Offset: 0xD60
	Size: 0x382
	Parameters: 0
	Flags: Private
*/
function private function_531d4c52()
{
	/#
		var_eb8df6e7 = array(#"primary", #"secondary", #"hash_5f2a18f0e771a387", #"primarygrenade", #"hash_6148898d5ac59179", #"secondarygrenade", #"hash_777a08527f2da4e1", #"specialgrenade", #"perk1", #"hash_75a53afe5fb30f2c", #"hash_1e3b6d1c50127b6d", #"hash_4b0730847097498b", #"perk2", #"hash_27460ccf4582b502", #"hash_551e597e4fcfe0e4", #"hash_4b072f84709747d8", #"perk3", #"hash_344ad3ebce2569", #"hash_3c0f3d3aa7135e86", #"hash_4b07328470974cf1", #"hash_6791932344785551", #"gunsmith");
		var_ce681ff1 = array(#"primary", #"hash_6e4546b3c7592af2", #"perks_zm", #"ammo_zm", #"canister_zm", #"weapon_categories_zm");
		while(getdvarint(#"hash_690dc40b39cafbfc", 0))
		{
			foreach(var_5eb04963 in level.weapon_position)
			{
				if(sessionmodeiszombiesgame() && isinarray(var_ce681ff1, var_e925bc18) || (!sessionmodeiszombiesgame() && isinarray(var_eb8df6e7, var_e925bc18)))
				{
					circle(var_5eb04963.origin, 0.5, (1, 0, 0));
					print3d(var_5eb04963.origin, (function_9e72a96(var_e925bc18) + "") + var_5eb04963.origin, (1, 1, 1), undefined, 0.015625);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_bf9f3492
	Namespace: customclass
	Checksum: 0xDB4CDD51
	Offset: 0x10F0
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_bf9f3492(var_d4c489c0)
{
	switch(var_d4c489c0)
	{
		case "primarygrenade":
		{
			return #"hash_6148898d5ac59179";
		}
		case "secondarygrenade":
		{
			return #"hash_777a08527f2da4e1";
		}
	}
	return undefined;
}

/*
	Name: function_1cd1374d
	Namespace: customclass
	Checksum: 0x24674575
	Offset: 0x1158
	Size: 0x62C
	Parameters: 5
	Flags: None
*/
function function_1cd1374d(var_1d35315f, var_d4c489c0, var_e81ceea, localclientnum, var_85d87aca)
{
	if(!isdefined(var_d4c489c0))
	{
		var_d4c489c0 = #"primary";
	}
	if(!isdefined(var_e81ceea))
	{
		var_e81ceea = "";
	}
	if(isdefined(var_1d35315f) && (isstring(var_1d35315f) || ishash(var_1d35315f)))
	{
		var_1d35315f = getweapon(var_1d35315f);
	}
	if(var_d4c489c0 == #"gunsmith")
	{
		s_info = function_5f70d1c8(var_1d35315f, var_e81ceea);
	}
	else
	{
		if(var_d4c489c0 == #"hash_2fda3f64c5caa89e")
		{
			s_info = function_fa001ebb(var_1d35315f, var_e81ceea);
		}
		else
		{
			s_info = function_3bff05ba(var_1d35315f, var_d4c489c0, localclientnum);
		}
	}
	var_d3c21d73 = s_info.origin;
	v_ang_offset = s_info.angles;
	switch(var_d4c489c0)
	{
		case "primary":
		default:
		{
			if(is_true(var_1d35315f.islauncher))
			{
				if(function_4dcbc16b(localclientnum, var_d4c489c0, var_1d35315f))
				{
					s_location = level.weapon_position[#"primary"];
				}
				else
				{
					s_location = level.weapon_position[#"hash_5f2a18f0e771a387"];
				}
			}
			else
			{
				s_location = level.weapon_position[#"primary"];
			}
			break;
		}
		case "secondary":
		{
			if(is_true(var_1d35315f.islauncher))
			{
				s_location = level.weapon_position[#"hash_5f2a18f0e771a387"];
			}
			else
			{
				s_location = level.weapon_position[#"secondary"];
			}
			break;
		}
		case "primarygrenade":
		{
			s_location = level.weapon_position[#"primarygrenade"];
			break;
		}
		case "hash_6148898d5ac59179":
		{
			s_location = level.weapon_position[#"hash_6148898d5ac59179"];
			break;
		}
		case "secondarygrenade":
		{
			s_location = level.weapon_position[#"secondarygrenade"];
			break;
		}
		case "hash_777a08527f2da4e1":
		{
			s_location = level.weapon_position[#"hash_777a08527f2da4e1"];
			break;
		}
		case "specialgrenade":
		{
			if(sessionmodeiszombiesgame())
			{
				s_location = level.weapon_position[#"hash_6e4546b3c7592af2"];
			}
			else
			{
				s_location = level.weapon_position[#"specialgrenade"];
			}
			break;
		}
		case "talent":
		{
			s_location = level.weapon_position[#"perks_zm"];
			break;
		}
		case "hash_6535e34e6169957e":
		{
			s_location = level.weapon_position[#"canister_zm"];
			break;
		}
		case "specialty":
		{
			s_location = level.weapon_position[#"ammo_zm"];
			break;
		}
		case "weaponcategories":
		{
			s_location = level.weapon_position[#"weapon_categories_zm"];
			break;
		}
		case "talent3":
		case "talent2":
		case "talent1":
		case "hash_e88faf1dc4ab927":
		case "talent5":
		case "talent4":
		case "talents":
		case "perk1":
		case "perk3":
		case "perk2":
		{
			s_location = function_3ca8f346(var_85d87aca, var_d4c489c0, localclientnum);
			break;
		}
		case "hash_6791932344785551":
		{
			s_location = level.weapon_position[#"hash_6791932344785551"];
			break;
		}
		case "gunsmith":
		case "charm":
		case "hash_2fda3f64c5caa89e":
		{
			s_location = level.weapon_position[#"gunsmith"];
			break;
		}
	}
	function_3de4843(localclientnum, var_d4c489c0, s_info.var_697bf2ff, var_1d35315f, s_info);
	var_cb7a50a5 = {#angles:s_location.angles + v_ang_offset, #origin:s_location.origin + var_d3c21d73};
	return var_cb7a50a5;
}

/*
	Name: function_3de4843
	Namespace: customclass
	Checksum: 0x9661E71
	Offset: 0x1790
	Size: 0x8F2
	Parameters: 5
	Flags: None
*/
function function_3de4843(localclientnum, var_8a4ba442, b_show, weapon, s_info)
{
	if(!isdefined(b_show))
	{
		b_show = 0;
	}
	switch(var_8a4ba442)
	{
		case "primary":
		{
			var_35be18f5 = getentarray(localclientnum, "hooks_primary_weapon", "script_noteworthy");
			foreach(var_bc94f6f in var_35be18f5)
			{
				if(!isdefined(var_bc94f6f.var_a4fadd7e))
				{
					var_bc94f6f.var_a4fadd7e = var_bc94f6f.origin;
				}
				if(isdefined(var_bc94f6f.targetname))
				{
					switch(var_bc94f6f.targetname)
					{
						case "hash_2149c57449808531":
						{
							var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + s_info.var_a5946026;
							break;
						}
						case "hash_474c2ac2e709ea92":
						{
							var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + s_info.var_36859b17;
							break;
						}
						case "hooks_primary_weapon_middle":
						{
							var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + s_info.var_a7adf514;
							break;
						}
						case "hash_d2eed7f7c5c4e34":
						{
							var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + (0, s_info.var_a5946026[1], s_info.var_a5946026[2]);
							break;
						}
						case "hash_5e91b75cefba3041":
						{
							var_bc94f6f.origin = var_bc94f6f.var_a4fadd7e + (0, s_info.var_36859b17[1], s_info.var_36859b17[2]);
							break;
						}
					}
				}
				if(b_show)
				{
					if(weapon.weapclass === "pistol")
					{
						if(var_bc94f6f.targetname === "hooks_primary_weapon_middle")
						{
							var_bc94f6f show();
						}
						else
						{
							var_bc94f6f hide();
						}
					}
					else
					{
						if(var_bc94f6f.targetname === "hooks_primary_weapon_middle")
						{
							var_bc94f6f hide();
						}
						else
						{
							var_bc94f6f show();
						}
					}
					continue;
				}
				var_bc94f6f hide();
			}
			break;
		}
		case "secondary":
		{
			function_3a0a9f01(localclientnum, s_info, b_show, weapon, var_8a4ba442);
			break;
		}
		case "primarygrenade":
		{
			var_f33b540a = getentarray(localclientnum, "shelves_primary_grenade", "script_noteworthy");
			foreach(var_6f552f36 in var_f33b540a)
			{
				if(!isdefined(var_6f552f36.var_a4fadd7e))
				{
					var_6f552f36.var_a4fadd7e = var_6f552f36.origin;
				}
				if(isdefined(var_6f552f36.targetname))
				{
					switch(var_6f552f36.targetname)
					{
						case "hash_56b20cc76429691":
						{
							var_6f552f36.origin = var_6f552f36.var_a4fadd7e + s_info.var_a5946026;
							break;
						}
						case "hash_2aa60196f1eab472":
						{
							var_6f552f36.origin = var_6f552f36.var_a4fadd7e + s_info.var_36859b17;
							break;
						}
						case "shelf_primary_grenade_middle":
						{
							var_6f552f36.origin = var_6f552f36.var_a4fadd7e + s_info.var_a7adf514;
							break;
						}
						case "hash_240bddaaee1ddf14":
						{
							var_6f552f36.origin = var_6f552f36.var_a4fadd7e + (0, s_info.var_a5946026[1], s_info.var_a5946026[2]);
							break;
						}
						case "hash_5013f12a53a51ea1":
						{
							var_6f552f36.origin = var_6f552f36.var_a4fadd7e + (0, s_info.var_36859b17[1], s_info.var_36859b17[2]);
							break;
						}
					}
				}
				if(b_show)
				{
					if(is_true(s_info.var_c492a06c))
					{
						if(var_6f552f36.targetname === "shelf_primary_grenade_middle")
						{
							var_6f552f36 hide();
						}
						else
						{
							var_6f552f36 show();
						}
					}
					else
					{
						if(var_6f552f36.targetname === "shelf_primary_grenade_middle")
						{
							var_6f552f36 show();
						}
						else
						{
							var_6f552f36 hide();
						}
					}
					continue;
				}
				var_6f552f36 hide();
			}
			break;
		}
		case "secondarygrenade":
		{
			var_b74cf891 = getentarray(localclientnum, "shelves_secondary_grenade", "script_noteworthy");
			foreach(var_3878ec49 in var_b74cf891)
			{
				if(!isdefined(var_3878ec49.var_a4fadd7e))
				{
					var_3878ec49.var_a4fadd7e = var_3878ec49.origin;
				}
				if(var_3878ec49.targetname === "shelf_secondary_grenade_middle")
				{
					var_3878ec49.origin = var_3878ec49.var_a4fadd7e + s_info.var_a7adf514;
				}
				if(b_show)
				{
					var_3878ec49 show();
					continue;
				}
				var_3878ec49 hide();
			}
			break;
		}
		case "hash_6148898d5ac59179":
		{
			break;
		}
		case "hash_777a08527f2da4e1":
		{
			break;
		}
		case "specialgrenade":
		{
			if(sessionmodeiszombiesgame())
			{
				function_3a0a9f01(localclientnum, s_info, b_show, weapon, var_8a4ba442);
			}
			break;
		}
		case "talent3":
		case "talent2":
		case "talent1":
		case "hash_e88faf1dc4ab927":
		case "talent5":
		case "talent4":
		case "talents":
		case "hash_4b072f84709747d8":
		case "hash_4b0730847097498b":
		case "hash_4b07328470974cf1":
		case "perk1":
		case "perk3":
		case "perk2":
		{
			break;
		}
		case "hash_6791932344785551":
		{
			break;
		}
		case "gunsmith":
		case "hash_2fda3f64c5caa89e":
		{
			break;
		}
	}
}

/*
	Name: function_3a0a9f01
	Namespace: customclass
	Checksum: 0xACBAA468
	Offset: 0x2090
	Size: 0x338
	Parameters: 5
	Flags: None
*/
function function_3a0a9f01(localclientnum, s_info, b_show, weapon, var_8a4ba442)
{
	if(!isdefined(b_show))
	{
		b_show = 0;
	}
	var_d74b0620 = getentarray(localclientnum, "hooks_secondary_weapon", "script_noteworthy");
	foreach(var_72ff5fa4 in var_d74b0620)
	{
		if(!isdefined(var_72ff5fa4.var_a4fadd7e))
		{
			var_72ff5fa4.var_a4fadd7e = var_72ff5fa4.origin;
		}
		if(isdefined(var_72ff5fa4.targetname))
		{
			switch(var_72ff5fa4.targetname)
			{
				case "hash_78128169d6711a6d":
				{
					var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + s_info.var_a5946026;
					break;
				}
				case "hooks_secondary_weapon_middle":
				{
					var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + s_info.var_a7adf514;
					break;
				}
				case "hash_3ed2a809048aa0e6":
				{
					var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + s_info.var_36859b17;
					break;
				}
				case "hash_1790f06c8159a70":
				{
					var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + (0, s_info.var_a5946026[1], s_info.var_a5946026[2]);
					break;
				}
				case "hash_2bb904253c893cc5":
				{
					var_72ff5fa4.origin = var_72ff5fa4.var_a4fadd7e + (0, s_info.var_36859b17[1], s_info.var_36859b17[2]);
					break;
				}
			}
		}
		if(b_show)
		{
			if(weapon.weapclass === "pistol" || (sessionmodeiszombiesgame() && var_8a4ba442 === #"specialgrenade"))
			{
				if(var_72ff5fa4.targetname === "hooks_secondary_weapon_middle")
				{
					var_72ff5fa4 show();
				}
				else
				{
					var_72ff5fa4 hide();
				}
			}
			else
			{
				if(var_72ff5fa4.targetname === "hooks_secondary_weapon_middle")
				{
					var_72ff5fa4 hide();
				}
				else
				{
					var_72ff5fa4 show();
				}
			}
			continue;
		}
		var_72ff5fa4 hide();
	}
}

/*
	Name: custom_class_init
	Namespace: customclass
	Checksum: 0xAFF964CA
	Offset: 0x23D0
	Size: 0xC4
	Parameters: 1
	Flags: None
*/
function custom_class_init(localclientnum)
{
	level.last_weapon_name[localclientnum] = "";
	level.var_8ad413c[localclientnum] = "";
	level.current_weapon[localclientnum] = undefined;
	level.var_6f87d12e[localclientnum] = [];
	level.var_7089b606 = getent(localclientnum, "watch_holder_mp", "targetname");
	if(isdefined(level.var_7089b606))
	{
		level.var_7089b606 hide();
	}
	level thread custom_class_start_threads(localclientnum);
}

/*
	Name: custom_class_start_threads
	Namespace: customclass
	Checksum: 0xB4C89022
	Offset: 0x24A0
	Size: 0xAC
	Parameters: 1
	Flags: None
*/
function custom_class_start_threads(localclientnum)
{
	level endon(#"disconnect");
	level thread function_13c748a(localclientnum);
	while(true)
	{
		level thread custom_class_update(localclientnum);
		level thread custom_class_closed(localclientnum);
		s_waitresult = undefined;
		s_waitresult = level waittill("CustomClass_update" + localclientnum, "CustomClass_closed" + localclientnum);
	}
}

/*
	Name: function_b4e01020
	Namespace: customclass
	Checksum: 0xD86AB4F
	Offset: 0x2558
	Size: 0xCE
	Parameters: 1
	Flags: None
*/
function function_b4e01020(weapon)
{
	result = undefined;
	foreach(attachment in weapon.attachments)
	{
		if(isdefined(result))
		{
			result = result + (("+") + attachment);
			continue;
		}
		result = attachment;
	}
	return (isdefined(result) ? result : "");
}

/*
	Name: function_13c748a
	Namespace: customclass
	Checksum: 0x73F45AB7
	Offset: 0x2630
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function function_13c748a(localclientnum)
{
	level endon(#"disconnect");
	while(true)
	{
		var_7f729179 = undefined;
		var_7f729179 = level waittill(#"hash_6e24a55f8db9dad9");
		function_bfa844a3(localclientnum, var_7f729179.classindex);
	}
}

/*
	Name: function_4aa0a8f6
	Namespace: customclass
	Checksum: 0xBC2DE786
	Offset: 0x26A8
	Size: 0x14E
	Parameters: 1
	Flags: None
*/
function function_4aa0a8f6(var_ccf52c44)
{
	switch(var_ccf52c44)
	{
		case "primary":
		case "specialgrenade":
		case "secondary":
		case "primarygrenade":
		case "secondarygrenade":
		{
			stat_offset = 1;
			break;
		}
		case "talent3":
		case "talent2":
		case "talent1":
		case "hash_e88faf1dc4ab927":
		case "talent5":
		case "talent4":
		case "talent":
		{
			stat_offset = 5;
			break;
		}
		case "hash_6791932344785551":
		{
			stat_offset = 6;
			break;
		}
		case "specialty":
		{
			stat_offset = 3;
		}
		stat_offset = 0;
		break;
	}
	return stat_offset;
}

/*
	Name: function_de681e67
	Namespace: customclass
	Checksum: 0xC024D429
	Offset: 0x2800
	Size: 0x11C
	Parameters: 3
	Flags: None
*/
function function_de681e67(localclientnum, var_73cd9b6e, var_1eee7d73)
{
	if(getdvarint(#"hash_1695a04291fbeb8b") == 1 && currentsessionmode() == 4)
	{
		return 0;
	}
	var_163c9914 = (isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9);
	if(!isdefined(var_163c9914))
	{
		var_163c9914 = 0;
		level.var_41c1f7b9 = 0;
	}
	itemindex = getloadoutitem(localclientnum, var_163c9914, #"hash_6791932344785551");
	var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(#"hash_6791932344785551"));
	return var_82e23366.namehash === var_1eee7d73;
}

/*
	Name: function_902cfbde
	Namespace: customclass
	Checksum: 0x6E6ABE9
	Offset: 0x2928
	Size: 0x160
	Parameters: 2
	Flags: None
*/
function function_902cfbde(var_85d87aca, var_8a4ba442)
{
	if(var_8a4ba442 !== #"talent1" && var_8a4ba442 !== #"talent2" && var_8a4ba442 !== #"talent3" && var_8a4ba442 !== #"talent4" && var_8a4ba442 !== #"talent5" && var_8a4ba442 !== #"hash_e88faf1dc4ab927")
	{
		return true;
	}
	switch(var_8a4ba442)
	{
		case "talent4":
		{
			var_8a4ba442 = #"talent1";
			break;
		}
		case "talent5":
		{
			var_8a4ba442 = #"talent2";
			break;
		}
		case "hash_e88faf1dc4ab927":
		{
			var_8a4ba442 = #"talent3";
			break;
		}
	}
	var_2a06d510 = function_60663bf8(var_85d87aca);
	if(var_8a4ba442 === var_2a06d510)
	{
		return true;
	}
	return false;
}

/*
	Name: function_60663bf8
	Namespace: customclass
	Checksum: 0xC5AE9877
	Offset: 0x2A90
	Size: 0x1D4
	Parameters: 1
	Flags: None
*/
function function_60663bf8(var_85d87aca)
{
	if(isinarray(array(#"p9_talent_resistance", #"p9_talent_flakjacket", #"p9_talent_engineer", #"p9_talent_threatperception", #"p9_talent_fwdintel"), hash(var_85d87aca)))
	{
		return #"talent1";
	}
	if(isinarray(array(#"p9_talent_scavenger", #"p9_talent_quartermaster", #"p9_talent_highvaluetarget", #"p9_talent_logistics", #"p9_talent_tracker"), hash(var_85d87aca)))
	{
		return #"talent2";
	}
	if(isinarray(array(#"p9_talent_coldblooded", #"p9_talent_gungho", #"p9_talent_ghost", #"p9_talent_deadsilence", #"p9_talent_spycraft"), hash(var_85d87aca)))
	{
		return #"talent3";
	}
}

/*
	Name: function_3ca8f346
	Namespace: customclass
	Checksum: 0x907D0CF3
	Offset: 0x2C70
	Size: 0x94E
	Parameters: 3
	Flags: None
*/
function function_3ca8f346(var_85d87aca, var_c7d83c08, localclientnum)
{
	if(var_c7d83c08 === #"talents" || function_902cfbde(var_85d87aca, var_c7d83c08))
	{
		switch(var_c7d83c08)
		{
			case "talent1":
			case "talents":
			case "perk1":
			{
				s_location = level.weapon_position[#"perk1"];
				break;
			}
			case "talent4":
			{
				s_location = level.weapon_position[#"hash_4b0730847097498b"];
				break;
			}
			case "talent2":
			case "perk2":
			{
				s_location = level.weapon_position[#"perk2"];
				break;
			}
			case "talent5":
			{
				s_location = level.weapon_position[#"hash_4b072f84709747d8"];
				break;
			}
			case "talent3":
			case "perk3":
			{
				s_location = level.weapon_position[#"perk3"];
				break;
			}
			case "hash_e88faf1dc4ab927":
			{
				s_location = level.weapon_position[#"hash_4b07328470974cf1"];
				break;
			}
		}
	}
	else
	{
		var_6ff86e8e = function_60663bf8(var_85d87aca);
		if(var_6ff86e8e === #"talent1")
		{
			var_eafbab22 = function_9b2f2702(localclientnum, #"talent1");
			switch(var_eafbab22)
			{
				case 0:
				case 1:
				{
					s_location = level.weapon_position[#"perk1"];
					break;
				}
				case 2:
				{
					if(is_true(level.var_4ef05eea))
					{
						if(var_c7d83c08 === #"talent2")
						{
							if(function_2d8c38e7(localclientnum, #"talent1"))
							{
								s_location = level.weapon_position[#"perk1"];
							}
							else
							{
								s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
							}
						}
						else
						{
							s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
						}
					}
					else
					{
						s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
					}
					break;
				}
				case 3:
				{
					if(var_c7d83c08 === #"talent2")
					{
						s_location = level.weapon_position[#"hash_1e3b6d1c50127b6d"];
					}
					else if(var_c7d83c08 === #"talent3")
					{
						s_location = level.weapon_position[#"hash_75a53afe5fb30f2c"];
					}
					break;
				}
			}
		}
		else
		{
			if(var_6ff86e8e === #"talent2")
			{
				var_d850ddbd = function_9b2f2702(localclientnum, #"talent2");
				switch(var_d850ddbd)
				{
					case 0:
					case 1:
					{
						s_location = level.weapon_position[#"perk2"];
						break;
					}
					case 2:
					{
						if(is_true(level.var_4ef05eea))
						{
							if(var_c7d83c08 === #"talent1")
							{
								if(function_2d8c38e7(localclientnum, #"talent2"))
								{
									s_location = level.weapon_position[#"perk2"];
								}
								else
								{
									s_location = level.weapon_position[#"hash_27460ccf4582b502"];
								}
							}
							else
							{
								s_location = level.weapon_position[#"hash_551e597e4fcfe0e4"];
							}
						}
						else
						{
							s_location = level.weapon_position[#"hash_27460ccf4582b502"];
						}
						break;
					}
					case 3:
					{
						if(var_c7d83c08 === #"talent1")
						{
							s_location = level.weapon_position[#"hash_27460ccf4582b502"];
						}
						else if(var_c7d83c08 === #"talent3")
						{
							s_location = level.weapon_position[#"hash_551e597e4fcfe0e4"];
						}
						break;
					}
				}
			}
			else if(var_6ff86e8e === #"talent3")
			{
				var_ae24783c = function_9b2f2702(localclientnum, #"talent3");
				switch(var_ae24783c)
				{
					case 0:
					case 1:
					{
						s_location = level.weapon_position[#"perk3"];
						break;
					}
					case 2:
					{
						if(is_true(level.var_4ef05eea))
						{
							if(var_c7d83c08 === #"talent1")
							{
								if(function_2d8c38e7(localclientnum, #"talent3"))
								{
									s_location = level.weapon_position[#"perk3"];
								}
								else
								{
									s_location = level.weapon_position[#"hash_344ad3ebce2569"];
								}
							}
							else
							{
								s_location = level.weapon_position[#"hash_3c0f3d3aa7135e86"];
							}
						}
						else
						{
							s_location = level.weapon_position[#"hash_344ad3ebce2569"];
						}
						break;
					}
					case 3:
					{
						if(var_c7d83c08 === #"talent1")
						{
							s_location = level.weapon_position[#"hash_344ad3ebce2569"];
						}
						else if(var_c7d83c08 === #"talent2")
						{
							s_location = level.weapon_position[#"hash_3c0f3d3aa7135e86"];
						}
						break;
					}
				}
			}
		}
	}
	if(!isdefined(s_location))
	{
		switch(var_c7d83c08)
		{
			case "talent1":
			case "talents":
			case "perk1":
			{
				s_location = level.weapon_position[#"perk1"];
				break;
			}
			case "talent4":
			{
				s_location = level.weapon_position[#"hash_4b0730847097498b"];
				break;
			}
			case "talent2":
			case "perk2":
			{
				s_location = level.weapon_position[#"perk2"];
				break;
			}
			case "talent5":
			{
				s_location = level.weapon_position[#"hash_4b072f84709747d8"];
				break;
			}
			case "talent3":
			case "perk3":
			{
				s_location = level.weapon_position[#"perk3"];
				break;
			}
			case "hash_e88faf1dc4ab927":
			{
				s_location = level.weapon_position[#"hash_4b07328470974cf1"];
				break;
			}
		}
	}
	return s_location;
}

/*
	Name: function_b8990106
	Namespace: customclass
	Checksum: 0xCFB4C2C
	Offset: 0x35C8
	Size: 0x1C8
	Parameters: 3
	Flags: None
*/
function function_b8990106(localclientnum, var_8a4ba442, var_b078b50b)
{
	if(var_8a4ba442 === #"primary" || var_8a4ba442 === #"secondary")
	{
		if(isweapon(var_b078b50b))
		{
			weapon = var_b078b50b;
		}
		else
		{
			weapon = getweapon(var_b078b50b);
		}
		if(weapon.weapclass === #"pistol" || weapon.weapclass === #"spread" || weapon.weapclass === #"melee" || is_true(weapon.islauncher) && var_8a4ba442 === #"secondary")
		{
			return true;
		}
		if(weapon.weapclass !== #"pistol" && weapon.weapclass !== #"spread" && weapon.weapclass !== #"melee" && !is_true(weapon.islauncher) && var_8a4ba442 === #"primary")
		{
			return true;
		}
		return false;
	}
	return true;
}

/*
	Name: function_bfa844a3
	Namespace: customclass
	Checksum: 0x19850547
	Offset: 0x3798
	Size: 0x86C
	Parameters: 2
	Flags: None
*/
function function_bfa844a3(localclientnum, var_73cd9b6e)
{
	level.var_41c1f7b9 = var_73cd9b6e;
	var_9d78be26 = function_e2ae0e9(localclientnum, var_73cd9b6e);
	function_295788f(localclientnum, var_73cd9b6e);
	function_3459b4ec(localclientnum, var_73cd9b6e);
	var_674329bc = array(#"primary", #"secondary", #"primarygrenade", #"secondarygrenade", #"specialgrenade", #"talent1", #"talent2", #"talent3", #"talent4", #"talent5", #"hash_e88faf1dc4ab927", #"hash_6791932344785551", #"talent", #"hash_6535e34e6169957e", #"specialty", #"weaponcategories");
	foreach(var_8a4ba442 in var_674329bc)
	{
		if(isdefined(level.weapon_script_model[localclientnum][var_8a4ba442]))
		{
			level.weapon_script_model[localclientnum][var_8a4ba442] delete();
		}
		if(isdefined(level.preload_weapon_model[localclientnum][var_8a4ba442]))
		{
			level.preload_weapon_model[localclientnum][var_8a4ba442] delete();
		}
		if(var_8a4ba442 == #"primary" || var_8a4ba442 == #"secondary")
		{
			var_a268e5c4 = function_56ee17d3(localclientnum, var_73cd9b6e, var_8a4ba442);
			var_415dfdfa = function_9b2b16f3(localclientnum, var_73cd9b6e, var_8a4ba442);
			weapon = var_a268e5c4.weapon;
			function_cd5b2d74(localclientnum, var_8a4ba442, var_a268e5c4.var_2a456654);
			function_9d6867fc(localclientnum, var_8a4ba442, var_a268e5c4.var_7bdeac73);
			function_93e332c2(localclientnum, var_8a4ba442, var_a268e5c4.var_fd90b0bb);
			if(var_8a4ba442 == #"primary")
			{
				camo_index = getloadoutitem(localclientnum, var_73cd9b6e, #"primarycamo");
				var_571f2574 = getloadoutitem(localclientnum, var_73cd9b6e, #"hash_4aa83700e8c59904");
			}
			else
			{
				camo_index = getloadoutitem(localclientnum, var_73cd9b6e, #"secondarycamo");
				var_571f2574 = getloadoutitem(localclientnum, var_73cd9b6e, #"hash_26dddb406884302c");
			}
			function_3a1dd26(localclientnum, var_8a4ba442, camo_index);
			function_162e1121(localclientnum, var_8a4ba442, var_571f2574);
			function_15cbf06e(localclientnum, var_8a4ba442, var_415dfdfa);
		}
		else
		{
			itemindex = getloadoutitem(localclientnum, var_73cd9b6e, var_8a4ba442);
			var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(var_8a4ba442));
			if(isdefined(var_82e23366.namehash) && (var_8a4ba442 == #"primarygrenade" || var_8a4ba442 == #"secondarygrenade" || (sessionmodeiszombiesgame() && var_8a4ba442 === #"specialgrenade")))
			{
				weapon = getweapon(var_82e23366.namehash);
			}
			else
			{
				var_438da649 = function_b143666d(itemindex, function_4aa0a8f6(var_8a4ba442));
				model_name = (isdefined(var_438da649.var_cb48fc16) ? var_438da649.var_cb48fc16 : #"");
				var_95970e62 = (isdefined(var_438da649.var_e10f6e71) ? var_438da649.var_e10f6e71 : 1);
				weapon = level.weaponnone;
				if(sessionmodeiszombiesgame() && isinarray(array(#"talent", #"hash_6535e34e6169957e", #"specialty", #"weaponcategories"), var_8a4ba442))
				{
					var_63c40edf = function_eeb5c6a3(localclientnum, var_73cd9b6e, var_8a4ba442);
					model_name = var_63c40edf.model_name;
					var_95970e62 = var_63c40edf.var_95970e62;
					weapon = var_63c40edf.weapon;
				}
				if(var_8a4ba442 === #"wrist_accessory")
				{
					model_name = "tag_origin";
					var_95970e62 = 1;
					weapon = level.weaponnone;
				}
			}
		}
		s_position = function_1cd1374d(weapon, var_8a4ba442, undefined, localclientnum, model_name);
		level.weapon_script_model[localclientnum][var_8a4ba442] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
		level.preload_weapon_model[localclientnum][var_8a4ba442] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
		level.preload_weapon_model[localclientnum][var_8a4ba442] hide();
		toggle_locked_weapon_shader(localclientnum, 1, var_8a4ba442);
		update_weapon_script_model(localclientnum, weapon.name, function_b4e01020(weapon), undefined, 1, var_95970e62, model_name, var_8a4ba442);
		level.weapon_script_model[localclientnum][var_8a4ba442].origin = s_position.origin;
		level.weapon_script_model[localclientnum][var_8a4ba442].angles = s_position.angles;
		function_89f7e68e(localclientnum, var_73cd9b6e, var_8a4ba442, weapon, var_9d78be26);
	}
	function_a4cbc5a8(localclientnum);
}

/*
	Name: function_eeb5c6a3
	Namespace: customclass
	Checksum: 0xAE6A2838
	Offset: 0x4010
	Size: 0x24C
	Parameters: 3
	Flags: Private
*/
function private function_eeb5c6a3(localclientnum, var_73cd9b6e, var_8a4ba442)
{
	switch(var_8a4ba442)
	{
		case "talent":
		{
			model_name = #"wpn_t9_zm_perk_can_juggernog_world";
			var_95970e62 = 0.65;
			weapon = level.weaponnone;
			break;
		}
		case "hash_6535e34e6169957e":
		{
			itemindex = getloadoutitem(localclientnum, var_73cd9b6e, #"specialgrenade");
			var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(#"specialgrenade"));
			if(isdefined(var_82e23366.namehash))
			{
				weapon = getweapon(var_82e23366.namehash);
			}
			else
			{
				weapon = level.weaponnone;
			}
			model_name = #"";
			var_95970e62 = 0.9;
			break;
		}
		case "specialty":
		{
			model_name = #"attach_t9_ammo_mod_napalm_burst_view";
			var_95970e62 = 1.8;
			weapon = level.weaponnone;
			break;
		}
		case "weaponcategories":
		{
			model_name = #"hash_3935e5f9f62638a9";
			var_95970e62 = 1;
			weapon = level.weaponnone;
			break;
		}
		default:
		{
			model_name = #"";
			var_95970e62 = 1;
			weapon = level.weaponnone;
		}
	}
	return {#weapon:(isdefined(weapon) ? weapon : level.weaponnone), #hash_95970e62:var_95970e62, #model_name:model_name};
}

/*
	Name: function_357de40e
	Namespace: customclass
	Checksum: 0xEA2B4EB5
	Offset: 0x4268
	Size: 0x1A0
	Parameters: 1
	Flags: Private
*/
function private function_357de40e(localclientnum)
{
	var_c925fa13 = stats::get_stat(localclientnum, #"hash_65febbdf3f1ab4d7", #"rare") - stats::function_7f413ae3(localclientnum, 0, #"hash_51b649399e73640c", #"rare");
	var_61dafadc = stats::get_stat(localclientnum, #"hash_65febbdf3f1ab4d7", #"epic") - stats::function_7f413ae3(localclientnum, 0, #"hash_51b649399e73640c", #"epic");
	var_46057e01 = stats::get_stat(localclientnum, #"hash_65febbdf3f1ab4d7", #"legendary") - stats::function_7f413ae3(localclientnum, 0, #"hash_51b649399e73640c", #"legendary");
	if(var_c925fa13 > 0 || var_61dafadc > 0 || var_46057e01 > 0)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a4cbc5a8
	Namespace: customclass
	Checksum: 0x128C8D44
	Offset: 0x4410
	Size: 0x19C
	Parameters: 1
	Flags: None
*/
function function_a4cbc5a8(localclientnum)
{
	if(sessionmodeiszombiesgame())
	{
		var_82b5fd58 = function_357de40e(localclientnum);
		if(var_82b5fd58)
		{
			if(!isdefined(level.var_c4fcdf9f))
			{
				s_crystal = struct::get(#"hash_29294237edbdc76");
				level.var_c4fcdf9f = util::spawn_model(localclientnum, s_crystal.model, s_crystal.origin, s_crystal.angles);
				forcestreamxmodel(level.var_c4fcdf9f.model);
			}
			level.var_c4fcdf9f sethighdetail(level.var_636c2236, level.var_636c2236);
		}
		else if(isdefined(level.var_c4fcdf9f))
		{
			stopforcestreamingxmodel(level.var_c4fcdf9f.model);
			level.var_c4fcdf9f delete();
		}
	}
	else if(isdefined(level.var_c4fcdf9f))
	{
		stopforcestreamingxmodel(level.var_c4fcdf9f.model);
		level.var_c4fcdf9f delete();
	}
}

/*
	Name: function_e2ae0e9
	Namespace: customclass
	Checksum: 0x4DBEBC7A
	Offset: 0x45B8
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_e2ae0e9(localclientnum, var_73cd9b6e)
{
	var_33257025 = 0;
	var_4cda8464 = function_de681e67(localclientnum, (isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9), #"hash_4a12859000892dda");
	if(var_4cda8464 !== level.var_256be2c9)
	{
		var_33257025 = 1;
	}
	level.var_256be2c9 = var_4cda8464;
	return var_33257025;
}

/*
	Name: function_89f7e68e
	Namespace: customclass
	Checksum: 0xA987F98B
	Offset: 0x4658
	Size: 0x520
	Parameters: 5
	Flags: None
*/
function function_89f7e68e(localclientnum, var_c70fb4f3, var_8a4ba442, weapon, var_5405cbdb)
{
	if(!isdefined(var_5405cbdb))
	{
		var_5405cbdb = 0;
	}
	if(var_8a4ba442 === #"primarygrenade" || var_8a4ba442 === #"secondarygrenade")
	{
		var_674329bc = array(var_8a4ba442);
	}
	else
	{
		if(var_8a4ba442 === #"hash_6791932344785551" && var_5405cbdb)
		{
			var_674329bc = array(#"primarygrenade", #"secondarygrenade");
		}
		else
		{
			return;
		}
	}
	foreach(var_8a4ba442 in var_674329bc)
	{
		if(ishash(weapon) || isstring(weapon) && weapon != "")
		{
			weapon = getweapon(weapon);
		}
		else if(!isdefined(weapon) || weapon === level.weaponnone || weapon === "")
		{
			itemindex = getloadoutitem(localclientnum, (isdefined(var_c70fb4f3) ? var_c70fb4f3 : level.var_41c1f7b9), var_8a4ba442);
			var_82e23366 = getunlockableiteminfofromindex(itemindex, function_4aa0a8f6(var_8a4ba442));
			if(isdefined(var_82e23366) && isdefined(var_82e23366.namehash) && (var_8a4ba442 == #"primarygrenade" || var_8a4ba442 == #"secondarygrenade"))
			{
				weapon = getweapon(var_82e23366.namehash);
			}
			else
			{
				weapon = level.weaponnone;
			}
		}
		var_4342bc54 = function_bf9f3492(var_8a4ba442);
		if(isdefined(var_4342bc54))
		{
			if(isdefined(level.weapon_script_model[localclientnum][var_4342bc54]))
			{
				level.weapon_script_model[localclientnum][var_4342bc54] delete();
			}
			if(isdefined(level.preload_weapon_model[localclientnum][var_4342bc54]))
			{
				level.preload_weapon_model[localclientnum][var_4342bc54] delete();
			}
			settings = function_34668e22(weapon);
			var_d5a66a55 = level.weaponnone;
			if(!is_true(settings.var_d1e947c6) && level.var_256be2c9)
			{
				var_d5a66a55 = weapon;
			}
			s_position = function_1cd1374d(var_d5a66a55, var_4342bc54, undefined, localclientnum);
			level.weapon_script_model[localclientnum][var_4342bc54] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
			level.preload_weapon_model[localclientnum][var_4342bc54] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
			level.preload_weapon_model[localclientnum][var_4342bc54] hide();
			toggle_locked_weapon_shader(localclientnum, 1, var_4342bc54);
			update_weapon_script_model(localclientnum, var_d5a66a55.name, function_b4e01020(var_d5a66a55), undefined, 1, undefined, undefined, var_4342bc54);
			level.weapon_script_model[localclientnum][var_4342bc54].origin = s_position.origin;
			level.weapon_script_model[localclientnum][var_4342bc54].angles = s_position.angles;
			weapon = undefined;
		}
	}
}

/*
	Name: function_831397a7
	Namespace: customclass
	Checksum: 0x218B3942
	Offset: 0x4B80
	Size: 0x78
	Parameters: 1
	Flags: None
*/
function function_831397a7(localclientnum)
{
	level.var_636c2236 = 1;
	var_14bec5d2 = 0;
	function_bfa844a3(localclientnum, (isdefined(level.var_41c1f7b9) ? level.var_41c1f7b9 : var_14bec5d2));
	[[ level.var_1c43dd3e ]]->function_39a68bf2();
}

/*
	Name: function_415febc4
	Namespace: customclass
	Checksum: 0x970F70E0
	Offset: 0x4C00
	Size: 0x1AC
	Parameters: 1
	Flags: None
*/
function function_415febc4(localclientnum)
{
	level.var_636c2236 = 0;
	level.var_64ee434 = undefined;
	level.var_908d7e4d = undefined;
	if(isdefined(level.weapon_script_model[localclientnum]) && !function_df656039(localclientnum))
	{
		foreach(model in level.weapon_script_model[localclientnum])
		{
			if(isdefined(model))
			{
				model hide();
			}
		}
	}
	if(isdefined(level.preload_weapon_model[localclientnum]) && !function_df656039(localclientnum))
	{
		foreach(model in level.preload_weapon_model[localclientnum])
		{
			if(isdefined(model))
			{
				model hide();
			}
		}
	}
	function_a4cbc5a8(localclientnum);
}

/*
	Name: function_df656039
	Namespace: customclass
	Checksum: 0x9F860E91
	Offset: 0x4DB8
	Size: 0x68
	Parameters: 1
	Flags: None
*/
function function_df656039(localclientnum)
{
	if(namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"scorestreaks") || namespace_d5a9ff55::is_current_menu(localclientnum, "PressStart", #"hash_7da890f2771b41af"))
	{
		return true;
	}
	return false;
}

/*
	Name: custom_class_update
	Namespace: customclass
	Checksum: 0xB6BA1EB
	Offset: 0x4E28
	Size: 0x7DC
	Parameters: 1
	Flags: None
*/
function custom_class_update(localclientnum)
{
	level endon(#"disconnect", "CustomClass_closed" + localclientnum);
	waitresult = undefined;
	waitresult = level waittill("CustomClass_update" + localclientnum);
	base_weapon_slot = waitresult.base_weapon_slot;
	var_f0bf9259 = waitresult.weapon;
	attachments = waitresult.attachments;
	var_77da4058 = waitresult.var_77da4058;
	weapon_options_param = waitresult.options;
	is_item_unlocked = waitresult.is_item_unlocked;
	var_8a6eef52 = waitresult.var_8a6eef52;
	var_8ba4443d = waitresult.var_8ba4443d;
	var_cc6c0ec0 = waitresult.var_8d4568cf;
	var_f2af4049 = waitresult.var_820bb448;
	if(base_weapon_slot === #"gunsmith")
	{
		var_e81ceea = waitresult.attachment_group;
	}
	if(!isdefined(is_item_unlocked))
	{
		is_item_unlocked = 1;
	}
	if(!isdefined(var_8ba4443d))
	{
		var_8ba4443d = 1;
	}
	if(!isdefined(var_8a6eef52))
	{
		var_8a6eef52 = #"";
	}
	if(!isdefined(attachments))
	{
		attachments = "";
	}
	var_6870002c = "";
	if(isdefined(var_77da4058))
	{
		attachmentinfo = strtok(var_77da4058, ",");
		if(attachmentinfo.size > 0)
		{
			attachments = attachmentinfo[0];
			var_6870002c = attachmentinfo[1];
		}
	}
	if(base_weapon_slot !== #"gunsmith" && isdefined(level.weapon_script_model[localclientnum][#"gunsmith"]))
	{
		level.weapon_script_model[localclientnum][#"gunsmith"] forcedelete();
		arrayremovevalue(level.weapon_script_model[localclientnum], undefined, 1);
	}
	if(base_weapon_slot !== #"hash_2fda3f64c5caa89e" && isdefined(level.weapon_script_model[localclientnum][#"hash_2fda3f64c5caa89e"]))
	{
		function_2dab3077(localclientnum);
		level.weapon_script_model[localclientnum][#"hash_2fda3f64c5caa89e"] forcedelete();
		arrayremovevalue(level.weapon_script_model[localclientnum], undefined, 1);
	}
	if(base_weapon_slot !== #"charm" && isdefined(level.weapon_script_model[localclientnum][#"charm"]))
	{
		function_2dab3077(localclientnum);
		level.weapon_script_model[localclientnum][#"charm"] forcedelete();
		arrayremovevalue(level.weapon_script_model[localclientnum], undefined, 1);
	}
	if(isdefined(var_f0bf9259))
	{
		if(isdefined(weapon_options_param) && weapon_options_param != "none")
		{
			function_998e2be7(localclientnum, base_weapon_slot, weapon_options_param, var_6870002c);
		}
		var_88cd6325 = getweapon(var_f0bf9259, strtok(attachments, "+"));
		s_position = function_1cd1374d(var_88cd6325, base_weapon_slot, var_e81ceea, localclientnum, var_8a6eef52);
		if(!isdefined(level.weapon_script_model[localclientnum][base_weapon_slot]))
		{
			level.weapon_script_model[localclientnum][base_weapon_slot] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
			level.preload_weapon_model[localclientnum][base_weapon_slot] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
			level.preload_weapon_model[localclientnum][base_weapon_slot] hide();
		}
		toggle_locked_weapon_shader(localclientnum, is_item_unlocked, base_weapon_slot);
		update_weapon_script_model(localclientnum, var_f0bf9259, attachments, undefined, is_item_unlocked, var_8ba4443d, var_8a6eef52, base_weapon_slot, var_e81ceea);
		level.weapon_script_model[localclientnum][base_weapon_slot].origin = s_position.origin;
		level.weapon_script_model[localclientnum][base_weapon_slot].angles = s_position.angles;
		var_9d78be26 = function_e2ae0e9(localclientnum);
		function_89f7e68e(localclientnum, undefined, base_weapon_slot, var_f0bf9259, var_9d78be26);
		if(base_weapon_slot === #"gunsmith")
		{
			function_f87ec9a8(var_e81ceea, var_f0bf9259, var_f2af4049);
		}
		else
		{
			if(base_weapon_slot === #"hash_2fda3f64c5caa89e" || base_weapon_slot === #"charm")
			{
				function_f87ec9a8(var_e81ceea, var_f0bf9259, 0, 1);
				var_ef88e3c8 = function_fa001ebb(level.current_weapon[localclientnum]);
				function_ad3c0759(localclientnum, level.weapon_script_model[localclientnum][base_weapon_slot], var_ef88e3c8.var_12e53312, 0, 0);
				level.weapon_script_model[localclientnum][base_weapon_slot] show();
			}
			else
			{
				function_d39cd2b5(base_weapon_slot, var_f0bf9259, var_cc6c0ec0, var_f2af4049, localclientnum);
			}
		}
		if(getdvarint(#"hash_1695a04291fbeb8b") == 0 || currentsessionmode() != 4)
		{
			function_2a14a545(localclientnum, base_weapon_slot);
		}
		function_36b453c7(localclientnum, base_weapon_slot, var_f0bf9259);
		function_a4cbc5a8(localclientnum);
		setallowxcamrightstickrotation(localclientnum, !namespace_d5a9ff55::is_current_menu(localclientnum, "Paintshop"));
	}
	else
	{
		function_d39cd2b5(undefined, undefined, var_cc6c0ec0, var_f2af4049, localclientnum);
	}
}

/*
	Name: function_3459b4ec
	Namespace: customclass
	Checksum: 0x6434BE
	Offset: 0x5610
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_3459b4ec(localclientnum, var_73cd9b6e)
{
	var_56538315 = 0;
	var_a268b2c7 = function_de681e67(localclientnum, (isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9), #"hash_639ebbcda56447e7");
	if(var_a268b2c7 !== level.var_311aa2a1)
	{
		var_56538315 = 1;
	}
	level.var_311aa2a1 = var_a268b2c7;
	return var_56538315;
}

/*
	Name: function_295788f
	Namespace: customclass
	Checksum: 0xF3E08C7B
	Offset: 0x56B0
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_295788f(localclientnum, var_73cd9b6e)
{
	var_b8898be5 = 0;
	var_f4a53b60 = function_de681e67(localclientnum, (isdefined(var_73cd9b6e) ? var_73cd9b6e : level.var_41c1f7b9), #"bonuscard_perk_1_greed");
	if(var_f4a53b60 !== level.var_24d6a6a6)
	{
		var_b8898be5 = 1;
	}
	level.var_24d6a6a6 = var_f4a53b60;
	return var_b8898be5;
}

/*
	Name: function_9b2f2702
	Namespace: customclass
	Checksum: 0xF3186201
	Offset: 0x5750
	Size: 0x1EC
	Parameters: 2
	Flags: None
*/
function function_9b2f2702(localclientnum, var_f353d605)
{
	n_count = 0;
	var_93cfce18 = array(#"talent1", #"talent2", #"talent3", #"talent4", #"talent5", #"hash_e88faf1dc4ab927");
	foreach(var_d4c489c0 in var_93cfce18)
	{
		itemindex = getloadoutitem(localclientnum, (isdefined(level.var_41c1f7b9) ? level.var_41c1f7b9 : 0), var_d4c489c0);
		var_82e23366 = getunlockableiteminfofromindex(itemindex, 5);
		var_438da649 = function_b143666d(itemindex, 5);
		str_model_name = (isdefined(var_438da649.var_cb48fc16) ? var_438da649.var_cb48fc16 : #"");
		if(var_82e23366.loadoutslotname === var_f353d605)
		{
			n_count++;
		}
	}
	return n_count;
}

/*
	Name: function_2d8c38e7
	Namespace: customclass
	Checksum: 0xFDEA4578
	Offset: 0x5948
	Size: 0x1E4
	Parameters: 2
	Flags: None
*/
function function_2d8c38e7(localclientnum, var_6ff86e8e)
{
	var_3b263c75 = 0;
	var_93cfce18 = array(#"talent1", #"talent2", #"talent3");
	foreach(var_ccf52c44 in var_93cfce18)
	{
		itemindex = getloadoutitem(localclientnum, (isdefined(level.var_41c1f7b9) ? level.var_41c1f7b9 : 0), var_ccf52c44);
		var_82e23366 = getunlockableiteminfofromindex(itemindex, 5);
		var_438da649 = function_b143666d(itemindex, 5);
		var_85d87aca = (isdefined(var_438da649.var_cb48fc16) ? var_438da649.var_cb48fc16 : #"");
		if(var_82e23366.loadoutslotname === var_6ff86e8e && var_82e23366.loadoutslotname !== var_ccf52c44)
		{
			var_3b263c75++;
		}
	}
	if(var_3b263c75 == 2)
	{
		return true;
	}
	return false;
}

/*
	Name: function_2a14a545
	Namespace: customclass
	Checksum: 0x5881C0F2
	Offset: 0x5B38
	Size: 0x114
	Parameters: 2
	Flags: None
*/
function function_2a14a545(localclientnum, var_2463e2c7)
{
	var_201d8bfd = function_295788f(localclientnum);
	var_a33543de = function_3459b4ec(localclientnum);
	var_b0f8ce54 = array(#"talents", #"hash_6791932344785551", #"talent1", #"talent2", #"talent3");
	if(isinarray(var_b0f8ce54, hash(var_2463e2c7)) || var_201d8bfd || var_a33543de)
	{
		function_eac2ccd9(localclientnum, var_2463e2c7);
	}
}

/*
	Name: function_eac2ccd9
	Namespace: customclass
	Checksum: 0x3763382C
	Offset: 0x5C58
	Size: 0x14E
	Parameters: 2
	Flags: None
*/
function function_eac2ccd9(localclientnum, var_2463e2c7)
{
	if(var_2463e2c7 === #"talents" || var_2463e2c7 === #"hash_6791932344785551")
	{
		level.var_4ef05eea = 1;
	}
	function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent1", var_2463e2c7);
	function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent2", var_2463e2c7);
	function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent3", var_2463e2c7);
	function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent4");
	function_9aba5d9(localclientnum, level.var_41c1f7b9, #"talent5");
	function_9aba5d9(localclientnum, level.var_41c1f7b9, #"hash_e88faf1dc4ab927");
	level.var_4ef05eea = undefined;
}

/*
	Name: function_9aba5d9
	Namespace: customclass
	Checksum: 0x2840B59F
	Offset: 0x5DB0
	Size: 0x8BC
	Parameters: 4
	Flags: None
*/
function function_9aba5d9(localclientnum, var_c70fb4f3, var_297c7602, var_2463e2c7)
{
	var_93cfce18 = array(#"talent1", #"talent2", #"talent3", #"talent4", #"talent5", #"hash_e88faf1dc4ab927");
	if(!isdefined(var_297c7602) || !isinarray(var_93cfce18, hash(var_297c7602)))
	{
		return;
	}
	if(var_297c7602 === var_2463e2c7)
	{
		switch(var_2463e2c7)
		{
			case "talent1":
			{
				var_db816009 = level.weapon_script_model[localclientnum][#"talent2"];
				if(isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent1") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk1"])
				{
					var_db816009 hide();
				}
				var_db816009 = level.weapon_script_model[localclientnum][#"talent3"];
				if(isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent1") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk1"])
				{
					var_db816009 hide();
				}
				break;
			}
			case "talent2":
			{
				var_db816009 = level.weapon_script_model[localclientnum][#"talent1"];
				if(isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent2") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk2"])
				{
					var_db816009 hide();
				}
				var_db816009 = level.weapon_script_model[localclientnum][#"talent3"];
				if(isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent2") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk2"])
				{
					var_db816009 hide();
				}
				break;
			}
			case "talent3":
			{
				var_db816009 = level.weapon_script_model[localclientnum][#"talent1"];
				if(isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent3") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk3"])
				{
					var_db816009 hide();
				}
				var_db816009 = level.weapon_script_model[localclientnum][#"talent2"];
				if(isdefined(var_db816009) && function_9b2f2702(localclientnum, #"talent3") <= 1 && function_3ca8f346(var_db816009.model, var_297c7602, localclientnum) === level.weapon_position[#"perk3"])
				{
					var_db816009 hide();
				}
				break;
			}
		}
		return;
	}
	if(isdefined(level.weapon_script_model[localclientnum][var_297c7602]))
	{
		level.weapon_script_model[localclientnum][var_297c7602] delete();
	}
	if(isdefined(level.preload_weapon_model[localclientnum][var_297c7602]))
	{
		level.preload_weapon_model[localclientnum][var_297c7602] delete();
	}
	itemindex = getloadoutitem(localclientnum, var_c70fb4f3, var_297c7602);
	var_438da649 = function_b143666d(itemindex, 5);
	if(isdefined(var_438da649))
	{
		var_85d87aca = (isdefined(var_438da649.var_cb48fc16) ? var_438da649.var_cb48fc16 : #"");
		var_95970e62 = (isdefined(var_438da649.var_e10f6e71) ? var_438da649.var_e10f6e71 : 1);
	}
	else
	{
		return;
	}
	s_position = function_1cd1374d(level.weaponnone, var_297c7602, undefined, localclientnum, var_85d87aca);
	level.weapon_script_model[localclientnum][var_297c7602] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
	level.preload_weapon_model[localclientnum][var_297c7602] = spawn_weapon_model(localclientnum, s_position.origin, s_position.angles);
	level.preload_weapon_model[localclientnum][var_297c7602] hide();
	toggle_locked_weapon_shader(localclientnum, 1, var_297c7602);
	update_weapon_script_model(localclientnum, level.weaponnone.name, function_b4e01020(level.weaponnone), undefined, 1, var_95970e62, var_85d87aca, var_297c7602);
	level.weapon_script_model[localclientnum][var_297c7602].origin = s_position.origin;
	level.weapon_script_model[localclientnum][var_297c7602].angles = s_position.angles;
	var_db816009 = level.weapon_script_model[localclientnum][var_297c7602];
	if(var_2463e2c7 !== #"hash_6791932344785551" && var_2463e2c7 !== #"talents" && function_9b2f2702(localclientnum, var_2463e2c7) == 1 && !function_902cfbde(var_85d87aca, var_297c7602) && var_2463e2c7 === function_60663bf8(var_85d87aca))
	{
		var_db816009 hide();
	}
	if(var_2463e2c7 === #"talents" || var_2463e2c7 === #"hash_6791932344785551")
	{
		var_db816009 show();
	}
}

/*
	Name: function_d39cd2b5
	Namespace: customclass
	Checksum: 0x6D4044E9
	Offset: 0x6678
	Size: 0x7E4
	Parameters: 5
	Flags: None
*/
function function_d39cd2b5(var_8a4ba442, str_weapon, var_cc6c0ec0, var_f2af4049, localclientnum)
{
	if(!isdefined(var_8a4ba442))
	{
		var_8a4ba442 = "";
	}
	if(!isdefined(var_cc6c0ec0))
	{
		var_cc6c0ec0 = 0;
	}
	if(!isdefined(var_f2af4049))
	{
		var_f2af4049 = 0;
	}
	if(var_cc6c0ec0)
	{
		var_c6abe208 = #"scene_frontend_t9_cac_select";
	}
	else
	{
		var_c6abe208 = #"scene_frontend_t9_cac_overview";
	}
	if(var_f2af4049 && scene::function_9730988a(var_c6abe208, "overview"))
	{
		var_23f6420e = "overview";
	}
	else
	{
		if(isdefined(str_weapon))
		{
			weapon = getweapon(str_weapon);
		}
		switch(var_8a4ba442)
		{
			case "primary":
			{
				if(is_true(weapon.islauncher))
				{
					if(function_4dcbc16b(localclientnum, var_8a4ba442, weapon))
					{
						var_23f6420e = "primary";
					}
					else
					{
						var_23f6420e = "secondary_alt";
					}
				}
				else
				{
					var_23f6420e = "primary";
				}
				break;
			}
			case "secondary":
			{
				if(is_true(weapon.islauncher))
				{
					var_23f6420e = "secondary_alt";
				}
				else
				{
					var_23f6420e = "secondary";
				}
				break;
			}
			case "primarygrenade":
			{
				var_23f6420e = "lethal";
				break;
			}
			case "secondarygrenade":
			{
				var_23f6420e = "tactical";
				break;
			}
			case "tacticalgear":
			{
				var_23f6420e = "tactical";
				break;
			}
			case "specialgrenade":
			{
				if(sessionmodeiszombiesgame())
				{
					var_23f6420e = "fieldupgrade_zm";
				}
				else
				{
					var_23f6420e = "fieldupgrade";
				}
				break;
			}
			case "talent":
			{
				var_23f6420e = "perks_zm";
				break;
			}
			case "hash_6535e34e6169957e":
			{
				var_23f6420e = "canister_zm";
				break;
			}
			case "specialty":
			{
				var_23f6420e = "ammo_zm";
				break;
			}
			case "weaponcategories":
			{
				var_23f6420e = "weapon_categories_zm";
				break;
			}
			case "talents":
			{
				var_23f6420e = "perks";
				break;
			}
			case "talent1":
			case "talent4":
			{
				if(is_true(level.var_311aa2a1))
				{
					var_e79e336c = function_9b2f2702(localclientnum, var_8a4ba442);
					switch(var_e79e336c)
					{
						case 0:
						case 1:
						default:
						{
							var_23f6420e = "perk1";
							break;
						}
						case 2:
						{
							var_23f6420e = "perk1_greed";
							break;
						}
						case 3:
						{
							var_23f6420e = "perk1_lawbreaker";
							break;
						}
					}
				}
				else
				{
					if(is_true(level.var_24d6a6a6))
					{
						var_23f6420e = "perk1_greed";
					}
					else
					{
						var_23f6420e = "perk1";
					}
				}
				break;
			}
			case "talent2":
			case "talent5":
			{
				if(is_true(level.var_311aa2a1))
				{
					var_e79e336c = function_9b2f2702(localclientnum, var_8a4ba442);
					switch(var_e79e336c)
					{
						case 0:
						case 1:
						default:
						{
							var_23f6420e = "perk2";
							break;
						}
						case 2:
						{
							var_23f6420e = "perk2_greed";
							break;
						}
						case 3:
						{
							var_23f6420e = "perk2_lawbreaker";
							break;
						}
					}
				}
				else
				{
					if(is_true(level.var_24d6a6a6))
					{
						var_23f6420e = "perk2_greed";
					}
					else
					{
						var_23f6420e = "perk2";
					}
				}
				break;
			}
			case "talent3":
			case "hash_e88faf1dc4ab927":
			{
				if(is_true(level.var_311aa2a1))
				{
					var_e79e336c = function_9b2f2702(localclientnum, var_8a4ba442);
					switch(var_e79e336c)
					{
						case 0:
						case 1:
						default:
						{
							var_23f6420e = "perk3";
							break;
						}
						case 2:
						{
							var_23f6420e = "perk3_greed";
							break;
						}
						case 3:
						{
							var_23f6420e = "perk3_lawbreaker";
							break;
						}
					}
				}
				else
				{
					if(is_true(level.var_24d6a6a6))
					{
						var_23f6420e = "perk3_greed";
					}
					else
					{
						var_23f6420e = "perk3";
					}
				}
				break;
			}
			case "hash_6791932344785551":
			{
				var_23f6420e = "wildcard";
				break;
			}
			default:
			{
				/#
					assertmsg((("" + function_9e72a96(var_c6abe208)) + "") + var_8a4ba442);
				#/
				/#
				#/
			}
		}
	}
	if(var_c6abe208 !== level.var_64ee434 || var_23f6420e !== level.var_908d7e4d)
	{
		if(isdefined(level.var_64ee434))
		{
			level scene::stop(level.var_64ee434);
		}
		else
		{
			var_b1e821c5 = {#hash_dcfaf6c7:0};
		}
		level thread scene::play(var_c6abe208, var_23f6420e, undefined, undefined, undefined, undefined, var_b1e821c5);
	}
	level.var_64ee434 = var_c6abe208;
	level.var_908d7e4d = var_23f6420e;
}

/*
	Name: function_f87ec9a8
	Namespace: customclass
	Checksum: 0x377EC0D7
	Offset: 0x6E68
	Size: 0x2CC
	Parameters: 4
	Flags: None
*/
function function_f87ec9a8(var_e81ceea, str_weapon, var_f2af4049, var_51c8fd48)
{
	if(!isdefined(var_e81ceea))
	{
		var_e81ceea = "";
	}
	if(!isdefined(var_f2af4049))
	{
		var_f2af4049 = 0;
	}
	if(!isdefined(var_51c8fd48))
	{
		var_51c8fd48 = 0;
	}
	if(!isdefined(level.var_f0a17a7b))
	{
		level.var_f0a17a7b = #"scene_frontend_t9_gunsmith";
	}
	if(isdefined(level.var_64ee434))
	{
		var_b1e821c5 = {#hash_dcfaf6c7:0};
		level.var_64ee434 = undefined;
	}
	level scene::stop(level.var_f0a17a7b);
	if(var_f2af4049 && scene::function_9730988a(level.var_f0a17a7b, "overview"))
	{
		var_7dae7df8 = "overview";
	}
	else
	{
		if(var_51c8fd48 && scene::function_9730988a(level.var_f0a17a7b, "inspect"))
		{
			var_7dae7df8 = "inspect";
		}
		else
		{
			if(isdefined(str_weapon))
			{
				weapon = getweapon(str_weapon);
			}
			switch(var_e81ceea)
			{
				case "optic":
				{
					var_7dae7df8 = "optic";
					break;
				}
				case "muzzle":
				{
					var_7dae7df8 = "muzzle";
					break;
				}
				case "barrel":
				{
					var_7dae7df8 = "barrel";
					break;
				}
				case "underbarrel":
				{
					var_7dae7df8 = "underbarrel";
					break;
				}
				case "body":
				{
					var_7dae7df8 = "body";
					break;
				}
				case "stock":
				{
					var_7dae7df8 = "stock";
					break;
				}
				case "magazine":
				{
					var_7dae7df8 = "magazine";
					break;
				}
				case "handle":
				{
					var_7dae7df8 = "handle";
					break;
				}
				default:
				{
					var_7dae7df8 = "overview";
					break;
				}
			}
		}
	}
	level thread scene::play(level.var_f0a17a7b, var_7dae7df8, undefined, undefined, undefined, undefined, var_b1e821c5);
}

/*
	Name: toggle_locked_weapon_shader
	Namespace: customclass
	Checksum: 0x49B634EE
	Offset: 0x7140
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function toggle_locked_weapon_shader(localclientnum, is_item_unlocked, var_8a4ba442)
{
	if(!isdefined(is_item_unlocked))
	{
		is_item_unlocked = 1;
	}
	if(!isdefined(var_8a4ba442))
	{
		var_8a4ba442 = #"primary";
	}
	if(!isdefined(level.weapon_script_model[localclientnum][var_8a4ba442]))
	{
		return;
	}
	if(is_item_unlocked != 1)
	{
		enablefrontendlockedweaponoverlay(localclientnum, 1);
	}
	else
	{
		enablefrontendlockedweaponoverlay(localclientnum, 0);
	}
}

/*
	Name: custom_class_closed
	Namespace: customclass
	Checksum: 0xBF71B9C0
	Offset: 0x71F0
	Size: 0xBC
	Parameters: 1
	Flags: None
*/
function custom_class_closed(localclientnum)
{
	level endon(#"disconnect", "CustomClass_update" + localclientnum);
	params = undefined;
	params = level waittill(#"customclass_closed");
	if(params.param1 == localclientnum)
	{
		enablefrontendlockedweaponoverlay(localclientnum, 0);
		enablefrontendtokenlockedweaponoverlay(localclientnum, 0);
		level.last_weapon_name[localclientnum] = "";
		level.var_8ad413c[localclientnum] = "";
	}
}

/*
	Name: spawn_weapon_model
	Namespace: customclass
	Checksum: 0xC929F6E1
	Offset: 0x72B8
	Size: 0x86
	Parameters: 3
	Flags: None
*/
function spawn_weapon_model(localclientnum, origin, angles)
{
	weapon_model = spawn(localclientnum, origin, "script_model");
	weapon_model sethighdetail(level.var_636c2236, level.var_636c2236);
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	return weapon_model;
}

/*
	Name: function_f70cc07c
	Namespace: customclass
	Checksum: 0xC3723DB7
	Offset: 0x7348
	Size: 0xCC
	Parameters: 1
	Flags: None
*/
function function_f70cc07c(array)
{
	foreach(i, item in array)
	{
		if(isstring(item) && !isint(item))
		{
			array[i] = int(item);
		}
	}
	return array;
}

/*
	Name: function_d896247b
	Namespace: customclass
	Checksum: 0xC7CE8814
	Offset: 0x7420
	Size: 0x7E
	Parameters: 1
	Flags: None
*/
function function_d896247b(var_ccf52c44)
{
	return var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"hash_2fda3f64c5caa89e" || var_ccf52c44 == #"charm";
}

/*
	Name: function_3a1dd26
	Namespace: customclass
	Checksum: 0xF4D7B511
	Offset: 0x74A8
	Size: 0x82
	Parameters: 3
	Flags: None
*/
function function_3a1dd26(localclientnum, var_ccf52c44, camo_index)
{
	if(!isdefined(level.camo_index[localclientnum]))
	{
		level.camo_index[localclientnum] = [];
	}
	if(!isdefined(level.camo_index[localclientnum][var_ccf52c44]))
	{
		level.camo_index[localclientnum][var_ccf52c44] = 0;
	}
	level.camo_index[localclientnum][var_ccf52c44] = camo_index;
}

/*
	Name: get_camo_index
	Namespace: customclass
	Checksum: 0x34267651
	Offset: 0x7538
	Size: 0x76
	Parameters: 2
	Flags: None
*/
function get_camo_index(localclientnum, var_ccf52c44)
{
	if(!isdefined(level.camo_index[localclientnum]))
	{
		level.camo_index[localclientnum] = [];
	}
	if(!isdefined(level.camo_index[localclientnum][var_ccf52c44]))
	{
		level.camo_index[localclientnum][var_ccf52c44] = 0;
	}
	return level.camo_index[localclientnum][var_ccf52c44];
}

/*
	Name: get_reticle_index
	Namespace: customclass
	Checksum: 0xB84A3CA4
	Offset: 0x75B8
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function get_reticle_index(localclientnum)
{
	if(!isdefined(level.reticle_index[localclientnum]))
	{
		level.reticle_index[localclientnum] = 0;
	}
	return level.reticle_index[localclientnum];
}

/*
	Name: function_cd5b2d74
	Namespace: customclass
	Checksum: 0x6511F29C
	Offset: 0x7608
	Size: 0xBA
	Parameters: 3
	Flags: None
*/
function function_cd5b2d74(localclientnum, var_ccf52c44, var_21a477b9)
{
	if(!function_d896247b(var_ccf52c44))
	{
		return;
	}
	if(!isdefined(level.var_21a477b9))
	{
		level.var_21a477b9 = [];
	}
	if(!isdefined(level.var_21a477b9[localclientnum]))
	{
		level.var_21a477b9[localclientnum] = [];
	}
	if(!isdefined(level.var_21a477b9[localclientnum][var_ccf52c44]))
	{
		level.var_21a477b9[localclientnum][var_ccf52c44] = 0;
	}
	level.var_21a477b9[localclientnum][var_ccf52c44] = var_21a477b9;
}

/*
	Name: function_426673ac
	Namespace: customclass
	Checksum: 0x71E770BA
	Offset: 0x76D0
	Size: 0xAE
	Parameters: 2
	Flags: None
*/
function function_426673ac(localclientnum, var_ccf52c44)
{
	if(!function_d896247b(var_ccf52c44))
	{
		return 0;
	}
	if(!isdefined(level.var_21a477b9))
	{
		level.var_21a477b9 = [];
	}
	if(!isdefined(level.var_21a477b9[localclientnum]))
	{
		level.var_21a477b9[localclientnum] = [];
	}
	if(!isdefined(level.var_21a477b9[localclientnum][var_ccf52c44]))
	{
		level.var_21a477b9[localclientnum][var_ccf52c44] = 0;
	}
	return level.var_21a477b9[localclientnum][var_ccf52c44];
}

/*
	Name: function_9d6867fc
	Namespace: customclass
	Checksum: 0x1426CB3
	Offset: 0x7788
	Size: 0x112
	Parameters: 3
	Flags: None
*/
function function_9d6867fc(localclientnum, var_ccf52c44, var_6870002c)
{
	if(!function_d896247b(var_ccf52c44))
	{
		return;
	}
	if(!isdefined(level.var_6870002c))
	{
		level.var_6870002c = [];
	}
	if(!isdefined(level.var_6870002c[localclientnum]))
	{
		level.var_6870002c[localclientnum] = [];
	}
	if(!isdefined(level.var_6870002c[localclientnum][var_ccf52c44]))
	{
		level.var_6870002c[localclientnum][var_ccf52c44] = {};
	}
	if(isarray(var_6870002c))
	{
		level.var_6870002c[localclientnum][var_ccf52c44] = var_6870002c;
	}
	else
	{
		level.var_6870002c[localclientnum][var_ccf52c44] = function_f70cc07c(strtok(var_6870002c, "+"));
	}
}

/*
	Name: function_da4e64d6
	Namespace: customclass
	Checksum: 0x3D43C8F5
	Offset: 0x78A8
	Size: 0xAE
	Parameters: 2
	Flags: None
*/
function function_da4e64d6(localclientnum, var_ccf52c44)
{
	if(!function_d896247b(var_ccf52c44))
	{
		return {};
	}
	if(!isdefined(level.var_6870002c))
	{
		level.var_6870002c = [];
	}
	if(!isdefined(level.var_6870002c[localclientnum]))
	{
		level.var_6870002c[localclientnum] = [];
	}
	if(!isdefined(level.var_6870002c[localclientnum][var_ccf52c44]))
	{
		level.var_6870002c[localclientnum][var_ccf52c44] = {};
	}
	return level.var_6870002c[localclientnum][var_ccf52c44];
}

/*
	Name: function_93e332c2
	Namespace: customclass
	Checksum: 0xFA39E22A
	Offset: 0x7960
	Size: 0xBA
	Parameters: 3
	Flags: None
*/
function function_93e332c2(localclientnum, var_ccf52c44, var_f1c6301d)
{
	if(!function_d896247b(var_ccf52c44))
	{
		return;
	}
	if(!isdefined(level.var_f1c6301d))
	{
		level.var_f1c6301d = [];
	}
	if(!isdefined(level.var_f1c6301d[localclientnum]))
	{
		level.var_f1c6301d[localclientnum] = [];
	}
	if(!isdefined(level.var_f1c6301d[localclientnum][var_ccf52c44]))
	{
		level.var_f1c6301d[localclientnum][var_ccf52c44] = 0;
	}
	level.var_f1c6301d[localclientnum][var_ccf52c44] = var_f1c6301d;
}

/*
	Name: function_1d61dcf3
	Namespace: customclass
	Checksum: 0xC88A6895
	Offset: 0x7A28
	Size: 0xAE
	Parameters: 2
	Flags: None
*/
function function_1d61dcf3(localclientnum, var_ccf52c44)
{
	if(!function_d896247b(var_ccf52c44))
	{
		return 0;
	}
	if(!isdefined(level.var_f1c6301d))
	{
		level.var_f1c6301d = [];
	}
	if(!isdefined(level.var_f1c6301d[localclientnum]))
	{
		level.var_f1c6301d[localclientnum] = [];
	}
	if(!isdefined(level.var_f1c6301d[localclientnum][var_ccf52c44]))
	{
		level.var_f1c6301d[localclientnum][var_ccf52c44] = 0;
	}
	return level.var_f1c6301d[localclientnum][var_ccf52c44];
}

/*
	Name: get_show_paintshop
	Namespace: customclass
	Checksum: 0x6C4A4B6C
	Offset: 0x7AE0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function get_show_paintshop(localclientnum)
{
	if(!isdefined(level.show_paintshop[localclientnum]))
	{
		level.show_paintshop[localclientnum] = 0;
	}
	return level.show_paintshop[localclientnum];
}

/*
	Name: function_68d4a012
	Namespace: customclass
	Checksum: 0x33D619DE
	Offset: 0x7B30
	Size: 0x132
	Parameters: 2
	Flags: None
*/
function function_68d4a012(localclientnum, var_ccf52c44)
{
	if(var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"hash_2fda3f64c5caa89e")
	{
		if(!isdefined(level.var_6f87d12e[localclientnum][var_ccf52c44]))
		{
			level.var_6f87d12e[localclientnum][var_ccf52c44] = function_8e799963([3:-1, 2:-1, 1:-1, 0:-1]);
		}
		return level.var_6f87d12e[localclientnum][var_ccf52c44];
	}
	return function_8e799963([3:-1, 2:-1, 1:-1, 0:-1]);
}

/*
	Name: function_15cbf06e
	Namespace: customclass
	Checksum: 0x287716EE
	Offset: 0x7C70
	Size: 0x76
	Parameters: 3
	Flags: None
*/
function function_15cbf06e(localclientnum, var_ccf52c44, var_415dfdfa)
{
	if(!isdefined(level.var_6f87d12e))
	{
		level.var_6f87d12e = [];
	}
	if(!isdefined(level.var_6f87d12e[localclientnum]))
	{
		level.var_6f87d12e[localclientnum] = [];
	}
	level.var_6f87d12e[localclientnum][var_ccf52c44] = var_415dfdfa;
}

/*
	Name: function_162e1121
	Namespace: customclass
	Checksum: 0xB831AA3F
	Offset: 0x7CF0
	Size: 0x116
	Parameters: 3
	Flags: None
*/
function function_162e1121(localclientnum, var_ccf52c44, var_571f2574)
{
	if(!(var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"charm" || var_ccf52c44 == #"hash_2fda3f64c5caa89e"))
	{
		return;
	}
	if(!isdefined(level.var_571f2574))
	{
		level.var_571f2574 = [];
	}
	if(!isdefined(level.var_571f2574[localclientnum]))
	{
		level.var_571f2574[localclientnum] = [];
	}
	if(!isdefined(level.var_571f2574[localclientnum][var_ccf52c44]))
	{
		level.var_571f2574[localclientnum][var_ccf52c44] = 0;
	}
	level.var_571f2574[localclientnum][var_ccf52c44] = var_571f2574;
}

/*
	Name: function_52145a0d
	Namespace: customclass
	Checksum: 0x2706627B
	Offset: 0x7E10
	Size: 0x10A
	Parameters: 2
	Flags: None
*/
function function_52145a0d(localclientnum, var_ccf52c44)
{
	if(!(var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith" || var_ccf52c44 == #"charm" || var_ccf52c44 == #"hash_2fda3f64c5caa89e"))
	{
		return 0;
	}
	if(!isdefined(level.var_571f2574))
	{
		level.var_571f2574 = [];
	}
	if(!isdefined(level.var_571f2574[localclientnum]))
	{
		level.var_571f2574[localclientnum] = [];
	}
	if(!isdefined(level.var_571f2574[localclientnum][var_ccf52c44]))
	{
		level.var_571f2574[localclientnum][var_ccf52c44] = 0;
	}
	return level.var_571f2574[localclientnum][var_ccf52c44];
}

/*
	Name: function_998e2be7
	Namespace: customclass
	Checksum: 0x6C9EC2A8
	Offset: 0x7F28
	Size: 0x2D4
	Parameters: 4
	Flags: None
*/
function function_998e2be7(localclientnum, var_ccf52c44, weapon_options_param, var_6870002c)
{
	weapon_options = strtok(weapon_options_param, ",");
	function_3a1dd26(localclientnum, var_ccf52c44, int(weapon_options[0]));
	level.reticle_index[localclientnum] = int(weapon_options[1]);
	level.show_paintshop[localclientnum] = int(weapon_options[2]);
	if(isdefined(weapon_options[3]))
	{
		function_cd5b2d74(localclientnum, var_ccf52c44, int(weapon_options[3]));
	}
	if(isdefined(var_6870002c))
	{
		function_9d6867fc(localclientnum, var_ccf52c44, var_6870002c);
	}
	if(isdefined(weapon_options[5]))
	{
		level.var_dd70be5b[localclientnum] = int(weapon_options[5]);
	}
	else
	{
		level.var_dd70be5b[localclientnum] = -1;
	}
	if(isdefined(weapon_options[6]))
	{
		function_162e1121(localclientnum, var_ccf52c44, int(weapon_options[6]));
	}
	else
	{
		function_162e1121(localclientnum, var_ccf52c44, 0);
	}
	loc_00008118:
	loc_00008152:
	loc_0000818A:
	function_15cbf06e(localclientnum, var_ccf52c44, function_8e799963([3:int((isdefined(weapon_options[10]) ? weapon_options[10] : -1)), 2:int((isdefined(weapon_options[9]) ? weapon_options[9] : -1)), 1:int((isdefined(weapon_options[8]) ? weapon_options[8] : -1)), 0:int((isdefined(weapon_options[7]) ? weapon_options[7] : -1))]));
}

/*
	Name: get_weapon_options
	Namespace: customclass
	Checksum: 0x8644F19A
	Offset: 0x8208
	Size: 0xEE
	Parameters: 2
	Flags: None
*/
function get_weapon_options(localclientnum, var_ccf52c44)
{
	if(var_ccf52c44 == #"primary" || var_ccf52c44 == #"secondary" || var_ccf52c44 == #"gunsmith")
	{
		camo_index = get_camo_index(localclientnum, var_ccf52c44);
		reticle_index = get_reticle_index(localclientnum);
		paintshop = get_show_paintshop(localclientnum);
		renderoptions = function_6eff28b5(localclientnum, camo_index, reticle_index, paintshop);
		return renderoptions;
	}
	return 0;
}

/*
	Name: preload_weapon_model
	Namespace: customclass
	Checksum: 0x155A6CFD
	Offset: 0x8300
	Size: 0x154
	Parameters: 4
	Flags: None
*/
function preload_weapon_model(localclientnum, newweaponstring, var_f020955, var_8a4ba442)
{
	if(!isdefined(var_8a4ba442))
	{
		var_8a4ba442 = #"primary";
	}
	level notify("preload_weapon_changing_" + localclientnum);
	current_weapon = getweapon(newweaponstring, strtok(var_f020955, "+"));
	if(current_weapon == level.weaponnone)
	{
		return;
	}
	level.preload_weapon_model[localclientnum][var_8a4ba442] useweaponmodel(current_weapon, undefined, get_weapon_options(localclientnum, var_8a4ba442), function_426673ac(localclientnum, var_8a4ba442), function_68d4a012(localclientnum, var_8a4ba442));
	while(true)
	{
		if(level.preload_weapon_model[localclientnum][var_8a4ba442] isstreamed())
		{
			return;
		}
		wait(0.1);
	}
}

/*
	Name: function_8bf05e82
	Namespace: customclass
	Checksum: 0x6AEEAD4D
	Offset: 0x8460
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_8bf05e82(localclientnum)
{
	var_cc22b19 = createuimodel(function_1df4c3b0(localclientnum, #"hash_4979ef8c6b71470b"), "entNum");
	var_b65f6ce3 = self getentitynumber();
	setuimodelvalue(var_cc22b19, var_b65f6ce3);
}

/*
	Name: function_70be20f4
	Namespace: customclass
	Checksum: 0x213FC380
	Offset: 0x84F0
	Size: 0xDA
	Parameters: 3
	Flags: Private
*/
function private function_70be20f4(localclientnum, var_ccf52c44, weaponmodel)
{
	if(!isdefined(level.var_dd70be5b[localclientnum]) || level.var_dd70be5b[localclientnum] <= -1)
	{
		return 0;
	}
	activecamoinfo = activecamo::function_13e12ab1(get_camo_index(localclientnum, var_ccf52c44));
	if(!isdefined(activecamoinfo))
	{
		return 0;
	}
	var_3594168e = activecamoinfo.stages[level.var_dd70be5b[localclientnum]];
	return activecamo::function_6c9e0e1a(localclientnum, weaponmodel, var_3594168e, level.var_aa10d0b4);
}

/*
	Name: update_weapon_script_model
	Namespace: customclass
	Checksum: 0x1EF97BD5
	Offset: 0x85D8
	Size: 0x844
	Parameters: 9
	Flags: None
*/
function update_weapon_script_model(localclientnum, newweaponstring, var_f020955, should_update_weapon_options, is_item_unlocked, var_8ba4443d, var_8a6eef52, var_8a4ba442, var_e81ceea)
{
	if(!isdefined(is_item_unlocked))
	{
		is_item_unlocked = 1;
	}
	if(!isdefined(var_8ba4443d))
	{
		var_8ba4443d = 1;
	}
	if(!isdefined(var_8a6eef52))
	{
		var_8a6eef52 = #"";
	}
	if(!isdefined(var_8a4ba442))
	{
		var_8a4ba442 = #"primary";
	}
	/#
		/#
			assert(isdefined(var_f020955), "");
		#/
		/#
			assert(isdefined(should_update_weapon_options), "");
		#/
	#/
	level.last_weapon_name[newweaponstring] = (isdefined(var_f020955) ? var_f020955 : #"ar_accurate_t9");
	level.var_8ad413c[newweaponstring] = (isdefined(should_update_weapon_options) ? should_update_weapon_options : "");
	var_571f2574 = function_52145a0d(newweaponstring, var_8a4ba442);
	attachment_array = strtok(level.var_8ad413c[newweaponstring], "+");
	var_b2e08916 = function_426673ac(newweaponstring, var_8a4ba442);
	var_6870002c = function_da4e64d6(newweaponstring, var_8a4ba442);
	if(function_d896247b(var_8a4ba442) && attachment_array.size === var_6870002c.size)
	{
		var_a268e5c4 = function_5f08e596(level.last_weapon_name[newweaponstring], attachment_array, var_b2e08916, var_6870002c);
		function_93e332c2(newweaponstring, var_8a4ba442, var_a268e5c4.var_fd90b0bb);
		level.current_weapon[newweaponstring] = var_a268e5c4.weapon;
	}
	else
	{
		level.current_weapon[newweaponstring] = getweapon(level.last_weapon_name[newweaponstring], strtok(level.var_8ad413c[newweaponstring], "+"));
	}
	if(level.current_weapon[newweaponstring] == level.weaponnone || var_8a6eef52 !== #"")
	{
		if(sessionmodeiszombiesgame() && var_8a4ba442 === "specialty")
		{
			level.weapon_script_model[newweaponstring][var_8a4ba442] function_f7bc8c66(newweaponstring);
		}
		level.weapon_script_model[newweaponstring][var_8a4ba442] delete();
		s_position = function_1cd1374d(level.last_weapon_name[newweaponstring], var_8a4ba442, var_e81ceea, newweaponstring, var_8a6eef52);
		level.weapon_script_model[newweaponstring][var_8a4ba442] = spawn_weapon_model(newweaponstring, s_position.origin, s_position.angles);
		toggle_locked_weapon_shader(newweaponstring, is_item_unlocked, var_8a4ba442);
		if(var_8a6eef52 !== #"")
		{
			level.weapon_script_model[newweaponstring][var_8a4ba442] setmodel(var_8a6eef52);
		}
		else
		{
			if(level.last_weapon_name[newweaponstring] === #"none" || level.last_weapon_name[newweaponstring] === #"weapon_null")
			{
				level.weapon_script_model[newweaponstring][var_8a4ba442] setmodel(#"tag_origin");
			}
			else
			{
				level.weapon_script_model[newweaponstring][var_8a4ba442] setmodel(level.last_weapon_name[newweaponstring]);
			}
		}
		level.weapon_script_model[newweaponstring][var_8a4ba442] setscale(var_8ba4443d);
		if(sessionmodeiszombiesgame() && var_8a4ba442 === #"specialty")
		{
			level.weapon_script_model[newweaponstring][var_8a4ba442] function_7164981d(newweaponstring);
		}
		return;
	}
	function_975f521b(var_571f2574);
	if(var_8a4ba442 !== #"hash_6535e34e6169957e")
	{
		level.weapon_script_model[newweaponstring][var_8a4ba442] useweaponmodel(level.current_weapon[newweaponstring], undefined, get_weapon_options(newweaponstring, var_8a4ba442), function_1d61dcf3(newweaponstring, var_8a4ba442), function_68d4a012(newweaponstring, var_8a4ba442));
	}
	weaponmodel = level.weapon_script_model[newweaponstring][var_8a4ba442];
	if(!function_70be20f4(newweaponstring, var_8a4ba442, weaponmodel))
	{
		if(isdefined(level.var_aa10d0b4[newweaponstring]))
		{
			weaponmodel stoprenderoverridebundle(level.var_aa10d0b4[newweaponstring]);
			level.var_aa10d0b4[newweaponstring] = undefined;
		}
	}
	if(var_8a4ba442 == #"gunsmith" || var_8a4ba442 == #"hash_2fda3f64c5caa89e" || var_8a4ba442 == #"charm")
	{
		s_info = function_5f70d1c8(level.current_weapon[newweaponstring], var_e81ceea);
	}
	else
	{
		if(var_8a4ba442 == #"hash_2fda3f64c5caa89e")
		{
			s_info = function_fa001ebb(level.current_weapon[newweaponstring], var_e81ceea);
		}
		else
		{
			s_info = function_3bff05ba(level.current_weapon[newweaponstring], var_8a4ba442, newweaponstring);
		}
	}
	if(var_8a4ba442 !== #"hash_6535e34e6169957e")
	{
		level.weapon_script_model[newweaponstring][var_8a4ba442] setscale(s_info.scale);
	}
	level.weapon_script_model[newweaponstring][var_8a4ba442] function_8bf05e82(newweaponstring);
	if(isdefined(s_info.var_402cbe2d) && var_8a4ba442 !== #"hash_6535e34e6169957e")
	{
		level.weapon_script_model[newweaponstring][var_8a4ba442] setmodel(s_info.var_402cbe2d);
	}
	if(var_8a4ba442 === #"hash_6535e34e6169957e")
	{
		level.weapon_script_model[newweaponstring][var_8a4ba442] thread function_75af31e2(newweaponstring, var_f020955);
	}
}

/*
	Name: function_7164981d
	Namespace: customclass
	Checksum: 0x936F9D92
	Offset: 0x8E28
	Size: 0x182
	Parameters: 1
	Flags: None
*/
function function_7164981d(localclientnum)
{
	self function_f7bc8c66(localclientnum);
	self.var_5f9b027b = function_7a6db01f(localclientnum, self.model);
	self playrenderoverridebundle(self.var_5f9b027b);
	switch(self.model)
	{
		case "attach_t9_ammo_mod_brain_rot_view":
		{
			self.var_635b9513 = util::playfxontag(localclientnum, #"hash_6503886d9ce9b3c3", self, "tag_fx1");
			break;
		}
		case "attach_t9_ammo_mod_cryo_freeze_view":
		{
			self.var_635b9513 = util::playfxontag(localclientnum, #"hash_2a75b9442177bdb5", self, "tag_fx1");
			break;
		}
		case "attach_t9_ammo_mod_dead_wire_view":
		{
			self.var_635b9513 = util::playfxontag(localclientnum, #"hash_67f713a84c242ff3", self, "tag_fx1");
			break;
		}
		case "attach_t9_ammo_mod_napalm_burst_view":
		{
			self.var_635b9513 = util::playfxontag(localclientnum, #"hash_4a932c53210cf7b6", self, "tag_fx1");
			break;
		}
	}
}

/*
	Name: function_f7bc8c66
	Namespace: customclass
	Checksum: 0x51A7E79D
	Offset: 0x8FB8
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function function_f7bc8c66(localclientnum)
{
	if(isdefined(self.var_5f9b027b))
	{
		self function_f6e99a8d(self.var_5f9b027b);
		self.var_5f9b027b = undefined;
	}
	if(isdefined(self.var_635b9513))
	{
		killfx(localclientnum, self.var_635b9513);
		self.var_635b9513 = undefined;
	}
}

/*
	Name: function_7a6db01f
	Namespace: customclass
	Checksum: 0x1D6B26D7
	Offset: 0x9038
	Size: 0x27A
	Parameters: 2
	Flags: None
*/
function function_7a6db01f(localclientnum, var_353b5fbf)
{
	n_tier = 0;
	switch(var_353b5fbf)
	{
		case "attach_t9_ammo_mod_brain_rot_view":
		{
			n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_54782d04f50f4fb0");
			break;
		}
		case "attach_t9_ammo_mod_cryo_freeze_view":
		{
			n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_63114aea3939d941");
			break;
		}
		case "attach_t9_ammo_mod_dead_wire_view":
		{
			n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_69a99172dc42f08a");
			break;
		}
		case "attach_t9_ammo_mod_napalm_burst_view":
		{
			n_tier = stats::get_stat(localclientnum, #"cacloadouts", #"hash_1b24e5b336f5ae8d", #"hash_5769f8ea57e496b4");
			break;
		}
		default:
		{
			n_tier = 1;
		}
	}
	switch(n_tier)
	{
		case 0:
		case 1:
		default:
		{
			return #"rob_ammo_mod_level_1";
		}
		case 2:
		{
			return #"rob_ammo_mod_level_2";
		}
		case 3:
		{
			return #"rob_ammo_mod_level_3";
		}
		case 4:
		{
			return #"rob_ammo_mod_level_4";
		}
		case 5:
		{
			return #"rob_ammo_mod_level_5";
		}
	}
}

/*
	Name: function_75af31e2
	Namespace: customclass
	Checksum: 0x9D6D1266
	Offset: 0x92C0
	Size: 0x4F4
	Parameters: 2
	Flags: None
*/
function function_75af31e2(localclientnum, var_addf3c2f)
{
	self notify("1b53e8513a9f82ae");
	self endon("1b53e8513a9f82ae");
	self endon(#"death");
	if(isdefined(self.var_125d962d))
	{
		killfx(localclientnum, self.var_125d962d);
		self.var_125d962d = undefined;
	}
	if(level.var_e287b16f[localclientnum] !== var_addf3c2f)
	{
		self hide();
	}
	self setscale(0.9);
	switch(var_addf3c2f)
	{
		case "hash_164c43cbd0ee958":
		case "hash_164c63cbd0eecbe":
		case "hash_164c73cbd0eee71":
		case "hash_164c83cbd0ef024":
		case "hash_164c93cbd0ef1d7":
		case "aether_shroud":
		{
			self setmodel(#"hash_31c57957830a468b");
			self.var_125d962d = util::playfxontag(localclientnum, #"hash_63a413ea4517d35e", self, "tag_origin");
			break;
		}
		case "energy_mine":
		case "energy_mine_4":
		case "hash_4ac3fea4add2a2c9":
		case "energy_mine_2":
		case "energy_mine_3":
		case "energy_mine_1":
		{
			self setmodel(#"wpn_t9_zm_wand_cannister_energy_mine_view");
			self.var_125d962d = util::playfxontag(localclientnum, #"hash_4c6295e27b772b3f", self, "tag_origin");
			break;
		}
		case "hash_85edf3a63bb488c":
		case "frost_blast_1":
		case "frost_blast_3":
		case "frost_blast_2":
		case "frost_blast_5":
		case "frost_blast_4":
		{
			self setmodel(#"wpn_t9_zm_wand_cannister_frost_blast_view");
			self.var_125d962d = util::playfxontag(localclientnum, #"hash_367649ac4b1edb9e", self, "tag_origin");
			break;
		}
		case "hash_379869d5b6da974b":
		case "hash_37986ad5b6da98fe":
		case "hash_37986bd5b6da9ab1":
		case "hash_37986cd5b6da9c64":
		case "hash_37986dd5b6da9e17":
		case "heal_aoe":
		{
			self setmodel(#"wpn_t9_zm_wand_cannister_healing_aura_view");
			self.var_125d962d = util::playfxontag(localclientnum, #"hash_4d31e7e4f8d118ff", self, "tag_origin");
			break;
		}
		case "hash_6319e23758cd25e":
		case "hash_6319f23758cd411":
		case "hash_631a023758cd5c4":
		case "hash_631a123758cd777":
		case "hash_631a223758cd92a":
		case "ring_of_fire":
		{
			self setmodel(#"wpn_t9_zm_wand_cannister_ring_fire_view");
			self.var_125d962d = util::playfxontag(localclientnum, #"hash_49b58dc6c3e5fea0", self, "tag_origin");
			break;
		}
		case "hash_43e322396554dac0":
		case "hash_43e323396554dc73":
		case "hash_43e326396554e18c":
		case "hash_43e328396554e4f2":
		case "hash_43e329396554e6a5":
		case "hash_55569355da0f0f68":
		{
			self setmodel(#"wpn_t9_zm_wand_cannister_frenzied_guard_view");
			break;
		}
	}
	waitframe(1);
	self show();
	level.var_e287b16f[localclientnum] = var_addf3c2f;
}

/*
	Name: function_4dcbc16b
	Namespace: customclass
	Checksum: 0xBF7B2FDD
	Offset: 0x97C0
	Size: 0x228
	Parameters: 3
	Flags: None
*/
function function_4dcbc16b(localclientnum, var_3f5552f9, weapon_current)
{
	if(var_3f5552f9 === #"primary" || var_3f5552f9 === #"secondary")
	{
		weapon_primary = getloadoutweapon(localclientnum, level.var_41c1f7b9, #"primary");
		weapon_secondary = getloadoutweapon(localclientnum, level.var_41c1f7b9, #"secondary");
		if(is_true(weapon_primary.islauncher) && is_true(weapon_secondary.islauncher) || (is_true(weapon_current.islauncher) && var_3f5552f9 === #"primary" && is_true(weapon_secondary.islauncher)) || (is_true(weapon_current.islauncher) && var_3f5552f9 === #"secondary" && is_true(weapon_primary.islauncher)) || (isdefined(level.var_fe51f5a8) && var_3f5552f9 === #"primary" && level.var_fe51f5a8 === weapon_primary) || (isdefined(level.var_fe51f5a8) && var_3f5552f9 === #"secondary" && level.var_fe51f5a8 === weapon_secondary))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_36b453c7
	Namespace: customclass
	Checksum: 0xE1FB4F41
	Offset: 0x99F0
	Size: 0x28E
	Parameters: 3
	Flags: None
*/
function function_36b453c7(localclientnum, var_8a4ba442, weapon)
{
	if(ishash(weapon) || isstring(weapon))
	{
		weapon = getweapon(weapon);
	}
	if(var_8a4ba442 === #"primary" || var_8a4ba442 === #"secondary")
	{
		if(var_8a4ba442 === #"primary")
		{
			var_3ce5447 = #"secondary";
		}
		else
		{
			var_3ce5447 = #"primary";
		}
		if(function_4dcbc16b(localclientnum, var_8a4ba442, weapon))
		{
			level.var_fe51f5a8 = getloadoutweapon(localclientnum, level.var_41c1f7b9, var_3ce5447);
			weapon = level.var_fe51f5a8;
		}
		else
		{
			weapon = getloadoutweapon(localclientnum, level.var_41c1f7b9, var_3ce5447);
		}
		if(is_true(weapon.islauncher) && isdefined(level.weapon_script_model[localclientnum][var_3ce5447]) && isdefined(level.preload_weapon_model[localclientnum][var_3ce5447]))
		{
			s_position = function_1cd1374d(weapon, var_3ce5447, undefined, localclientnum);
			toggle_locked_weapon_shader(localclientnum, 1, var_3ce5447);
			update_weapon_script_model(localclientnum, weapon.name, function_b4e01020(weapon), undefined, 1, undefined, undefined, var_3ce5447);
			level.weapon_script_model[localclientnum][var_3ce5447].origin = s_position.origin;
			level.weapon_script_model[localclientnum][var_3ce5447].angles = s_position.angles;
			level.weapon_script_model[localclientnum][var_3ce5447] show();
		}
		level.var_fe51f5a8 = undefined;
	}
}

/*
	Name: function_ccfcedeb
	Namespace: customclass
	Checksum: 0x4DB8339E
	Offset: 0x9C88
	Size: 0x3E
	Parameters: 1
	Flags: None
*/
function function_ccfcedeb(localclientnum)
{
	if(isdefined(self.var_a8f1ca4e))
	{
		stopfx(localclientnum, self.var_a8f1ca4e);
		self.var_a8f1ca4e = undefined;
	}
}

/*
	Name: change_weapon
	Namespace: customclass
	Checksum: 0xFED22FD7
	Offset: 0x9CD0
	Size: 0xBC
	Parameters: 5
	Flags: None
*/
function change_weapon(localclientnum, var_8a4ba442, newweaponstring, var_f020955, should_update_weapon_options)
{
	if(!isdefined(should_update_weapon_options))
	{
		should_update_weapon_options = 0;
	}
	self notify("2aa06f0100e5d813");
	self endon("2aa06f0100e5d813");
	self endon(#"death");
	level endon(#"cam_customization_closed");
	if(isdefined(newweaponstring))
	{
		preload_weapon_model(localclientnum, newweaponstring, var_f020955, var_8a4ba442);
		update_weapon_script_model(localclientnum, newweaponstring, var_f020955, should_update_weapon_options, undefined, undefined, undefined, var_8a4ba442);
	}
}

/*
	Name: get_attachments_intersection
	Namespace: customclass
	Checksum: 0x4B6AFB77
	Offset: 0x9D98
	Size: 0x10C
	Parameters: 3
	Flags: None
*/
function get_attachments_intersection(oldweapon, oldattachments, newattachments)
{
	if(!isdefined(oldweapon))
	{
		return newattachments;
	}
	var_3f8fbddf = strtok(oldattachments, "+");
	var_95e90a5e = strtok(newattachments, "+");
	if(!isdefined(var_3f8fbddf[0]) || var_3f8fbddf[0] != var_95e90a5e[0])
	{
		return newattachments;
	}
	var_a014270e = var_95e90a5e[0];
	for(i = 1; i < var_95e90a5e.size; i++)
	{
		if(isinarray(var_3f8fbddf, var_95e90a5e[i]))
		{
			var_a014270e = var_a014270e + (("+") + var_95e90a5e[i]);
		}
	}
	return var_a014270e;
}

/*
	Name: function_34668e22
	Namespace: customclass
	Checksum: 0x2F29B0C3
	Offset: 0x9EB0
	Size: 0x7C
	Parameters: 1
	Flags: None
*/
function function_34668e22(weapon)
{
	if(isweapon(weapon))
	{
		var_fda44b34 = function_5f7c1515(weapon);
		if(isdefined(var_fda44b34.var_640479c3))
		{
			settings = getscriptbundle(var_fda44b34.var_640479c3);
			return settings;
		}
	}
}

/*
	Name: function_5f70d1c8
	Namespace: customclass
	Checksum: 0x220B5A69
	Offset: 0x9F38
	Size: 0x10D2
	Parameters: 2
	Flags: None
*/
function function_5f70d1c8(weapon, var_e81ceea)
{
	if(!isdefined(var_e81ceea))
	{
		var_e81ceea = "";
	}
	settings = function_34668e22(weapon);
	loc_0000A024:
	var_5ac895fb = struct::spawn(((isdefined(settings.var_2a929786) ? settings.var_2a929786 : 0), (isdefined(settings.var_57d6720d) ? settings.var_57d6720d : 0), (isdefined(settings.var_4e105e81) ? settings.var_4e105e81 : 0)), ((isdefined(settings.var_107b50df) ? settings.var_107b50df : 0), (isdefined(settings.var_d9546292) ? settings.var_d9546292 : 0), (isdefined(settings.var_eb1f0627) ? settings.var_eb1f0627 : 0)));
	if(var_e81ceea == "")
	{
		var_f3d83915 = (0, 0, 0);
		var_dd6869e3 = (0, 0, 0);
		if(function_cd84dead(weapon, "barrel") && function_cd84dead(weapon, "muzzle"))
		{
			var_f3d83915 = ((isdefined(settings.var_c451d2fd) ? settings.var_c451d2fd : 0), (isdefined(settings.var_79913d89) ? settings.var_79913d89 : 0), (isdefined(settings.var_8dd96619) ? settings.var_8dd96619 : 0));
			var_dd6869e3 = ((isdefined(settings.var_7010317b) ? settings.var_7010317b : 0), (isdefined(settings.var_4c5eea19) ? settings.var_4c5eea19 : 0), (isdefined(settings.var_3ead4eb6) ? settings.var_3ead4eb6 : 0));
			var_d098ea88 = (isdefined(settings.var_38287270) ? settings.var_38287270 : 0);
		}
		else
		{
			if(function_cd84dead(weapon, "muzzle"))
			{
				var_f3d83915 = ((isdefined(settings.var_4a27453e) ? settings.var_4a27453e : 0), (isdefined(settings.var_5861e1b3) ? settings.var_5861e1b3 : 0), (isdefined(settings.var_74941a17) ? settings.var_74941a17 : 0));
				var_dd6869e3 = ((isdefined(settings.var_8f5ed804) ? settings.var_8f5ed804 : 0), (isdefined(settings.var_81b53cb1) ? settings.var_81b53cb1 : 0), (isdefined(settings.var_23e08109) ? settings.var_23e08109 : 0));
				var_d098ea88 = (isdefined(settings.var_72dfbab8) ? settings.var_72dfbab8 : 0);
			}
			else
			{
				if(function_cd84dead(weapon, "barrel"))
				{
					var_f3d83915 = ((isdefined(settings.com_pallet_2) ? settings.com_pallet_2 : 0), (isdefined(settings.var_a84b0b5e) ? settings.var_a84b0b5e : 0), (isdefined(settings.var_d50064c8) ? settings.var_d50064c8 : 0));
					var_dd6869e3 = ((isdefined(settings.var_a903d0e5) ? settings.var_a903d0e5 : 0), (isdefined(settings.var_bb36754a) ? settings.var_bb36754a : 0), (isdefined(settings.var_cd7899ce) ? settings.var_cd7899ce : 0));
					var_d098ea88 = (isdefined(settings.var_12bacd52) ? settings.var_12bacd52 : 0);
				}
				else if(function_cd84dead(weapon, "stock"))
				{
					var_f3d83915 = ((isdefined(settings.var_504e1d0c) ? settings.var_504e1d0c : 0), (isdefined(settings.var_7a9c71a8) ? settings.var_7a9c71a8 : 0), (isdefined(settings.var_6ce3d637) ? settings.var_6ce3d637 : 0));
					var_dd6869e3 = ((isdefined(settings.var_ddba9446) ? settings.var_ddba9446 : 0), (isdefined(settings.var_ebfd30cb) ? settings.var_ebfd30cb : 0), (isdefined(settings.var_350942ea) ? settings.var_350942ea : 0));
					var_d098ea88 = (isdefined(settings.var_da2aed5a) ? settings.var_da2aed5a : 0);
				}
			}
		}
		var_5ac895fb.origin = var_5ac895fb.origin + var_f3d83915;
		var_5ac895fb.angles = var_5ac895fb.angles + var_dd6869e3;
		var_5ac895fb.scale = (isdefined(settings.var_9c241dd8) ? settings.var_9c241dd8 : 1);
		if(isdefined(var_d098ea88))
		{
			var_5ac895fb.scale = var_5ac895fb.scale + var_d098ea88;
		}
	}
	else
	{
		var_639f35c4 = (0, 0, 0);
		var_31d7e562 = (0, 0, 0);
		switch(var_e81ceea)
		{
			case "optic":
			{
				var_639f35c4 = ((isdefined(settings.var_679ca3b5) ? settings.var_679ca3b5 : 0), (isdefined(settings.var_bc194cb1) ? settings.var_bc194cb1 : 0), (isdefined(settings.var_67a5a3cb) ? settings.var_67a5a3cb : 0));
				var_31d7e562 = ((isdefined(settings.var_80cb53e7) ? settings.var_80cb53e7 : 0), (isdefined(settings.var_9294f77a) ? settings.var_9294f77a : 0), (isdefined(settings.var_5d408cd2) ? settings.var_5d408cd2 : 0));
				var_3245d5de = (isdefined(settings.var_2685ca21) ? settings.var_2685ca21 : 0);
				break;
			}
			case "muzzle":
			{
				var_639f35c4 = ((isdefined(settings.var_89849ace) ? settings.var_89849ace : 0), (isdefined(settings.var_f73a7638) ? settings.var_f73a7638 : 0), (isdefined(settings.var_77edf7a1) ? settings.var_77edf7a1 : 0));
				var_31d7e562 = ((isdefined(settings.var_390d2d1) ? settings.var_390d2d1 : 0), (isdefined(settings.var_19bdff2b) ? settings.var_19bdff2b : 0), (isdefined(settings.var_e7ef1b8e) ? settings.var_e7ef1b8e : 0));
				var_3245d5de = (isdefined(settings.var_b3516d45) ? settings.var_b3516d45 : 0);
				break;
			}
			case "barrel":
			{
				var_639f35c4 = ((isdefined(settings.var_7c3d339b) ? settings.var_7c3d339b : 0), (isdefined(settings.var_6e029726) ? settings.var_6e029726 : 0), (isdefined(settings.var_a0bffca0) ? settings.var_a0bffca0 : 0));
				var_31d7e562 = ((isdefined(settings.var_8ca3e332) ? settings.var_8ca3e332 : 0), (isdefined(settings.var_7ee247af) ? settings.var_7ee247af : 0), (isdefined(settings.var_47f3d9d3) ? settings.var_47f3d9d3 : 0));
				var_3245d5de = (isdefined(settings.var_ad8114a5) ? settings.var_ad8114a5 : 0);
				break;
			}
			case "underbarrel":
			{
				var_639f35c4 = ((isdefined(settings.var_98adab76) ? settings.var_98adab76 : 0), (isdefined(settings.var_74056226) ? settings.var_74056226 : 0), (isdefined(settings.var_66bec799) ? settings.var_66bec799 : 0));
				var_31d7e562 = ((isdefined(settings.var_d03599ea) ? settings.var_d03599ea : 0), (isdefined(settings.var_9258bc1) ? settings.var_9258bc1 : 0), (isdefined(settings.var_2e65d641) ? settings.var_2e65d641 : 0));
				var_3245d5de = (isdefined(settings.var_c8287774) ? settings.var_c8287774 : 0);
				break;
			}
			case "body":
			{
				var_639f35c4 = ((isdefined(settings.var_d0af4d25) ? settings.var_d0af4d25 : 0), (isdefined(settings.var_e2ea719b) ? settings.var_e2ea719b : 0), (isdefined(settings.var_b75b1a7d) ? settings.var_b75b1a7d : 0));
				var_31d7e562 = ((isdefined(settings.var_807fd135) ? settings.var_807fd135 : 0), (isdefined(settings.var_66581c7a) ? settings.var_66581c7a : 0), (isdefined(settings.var_5beb080c) ? settings.var_5beb080c : 0));
				var_3245d5de = (isdefined(settings.var_ca6cd5d0) ? settings.var_ca6cd5d0 : 0);
				break;
			}
			case "stock":
			{
				var_639f35c4 = ((isdefined(settings.var_933f2ee0) ? settings.var_933f2ee0 : 0), (isdefined(settings.var_7d95038c) ? settings.var_7d95038c : 0), (isdefined(settings.var_210b4a7a) ? settings.var_210b4a7a : 0));
				var_31d7e562 = ((isdefined(settings.var_14141efc) ? settings.var_14141efc : 0), (isdefined(settings.var_3a32eb39) ? settings.var_3a32eb39 : 0), (isdefined(settings.var_2858c785) ? settings.var_2858c785 : 0));
				var_3245d5de = (isdefined(settings.var_72fa56e9) ? settings.var_72fa56e9 : 0);
				break;
			}
			case "magazine":
			{
				var_639f35c4 = ((isdefined(settings.var_c1b38db7) ? settings.var_c1b38db7 : 0), (isdefined(settings.var_f5f1f633) ? settings.var_f5f1f633 : 0), (isdefined(settings.var_e42f52ae) ? settings.var_e42f52ae : 0));
				var_31d7e562 = ((isdefined(settings.var_91fc7515) ? settings.var_91fc7515 : 0), (isdefined(settings.var_80a5d268) ? settings.var_80a5d268 : 0), (isdefined(settings.var_5ed38ec4) ? settings.var_5ed38ec4 : 0));
				var_3245d5de = (isdefined(settings.var_b41f3012) ? settings.var_b41f3012 : 0);
				break;
			}
			case "handle":
			{
				var_639f35c4 = ((isdefined(settings.var_41ebb7d) ? settings.var_41ebb7d : 0), (isdefined(settings.var_ab648ac) ? settings.var_ab648ac : 0), (isdefined(settings.var_18806440) ? settings.var_18806440 : 0));
				var_31d7e562 = ((isdefined(settings.var_59c4fda9) ? settings.var_59c4fda9 : 0), (isdefined(settings.var_ebd421b9) ? settings.var_ebd421b9 : 0), (isdefined(settings.var_5983fd1b) ? settings.var_5983fd1b : 0));
				var_3245d5de = (isdefined(settings.var_52846704) ? settings.var_52846704 : 0);
				break;
			}
		}
		var_5ac895fb.origin = var_5ac895fb.origin + var_639f35c4;
		var_5ac895fb.angles = var_5ac895fb.angles + var_31d7e562;
		var_5ac895fb.scale = (isdefined(settings.var_9c241dd8) ? settings.var_9c241dd8 : 1);
		if(isdefined(var_3245d5de))
		{
			var_5ac895fb.scale = var_5ac895fb.scale + var_3245d5de;
		}
	}
	var_5ac895fb.var_402cbe2d = settings.var_6b6e0c5a;
	return var_5ac895fb;
}

/*
	Name: function_3bff05ba
	Namespace: customclass
	Checksum: 0xA2C91F7E
	Offset: 0xB018
	Size: 0xD5A
	Parameters: 3
	Flags: None
*/
function function_3bff05ba(weapon, var_8a4ba442, localclientnum)
{
	if(!isdefined(localclientnum))
	{
		localclientnum = 0;
	}
	settings = function_34668e22(weapon);
	var_f3d83915 = (0, 0, 0);
	var_dd6869e3 = (0, 0, 0);
	if(function_cd84dead(weapon, "barrel") && function_cd84dead(weapon, "muzzle"))
	{
		var_f3d83915 = ((isdefined(settings.var_d58892) ? settings.var_d58892 : 0), (isdefined(settings.var_80c00869) ? settings.var_80c00869 : 0), (isdefined(settings.var_ee9ae41d) ? settings.var_ee9ae41d : 0));
		var_dd6869e3 = ((isdefined(settings.var_acdc6bf0) ? settings.var_acdc6bf0 : 0), (isdefined(settings.var_9e8acf4d) ? settings.var_9e8acf4d : 0), (isdefined(settings.var_fa188663) ? settings.var_fa188663 : 0));
		var_d098ea88 = (isdefined(settings.var_7bba1c55) ? settings.var_7bba1c55 : 0);
	}
	else
	{
		if(function_cd84dead(weapon, "muzzle"))
		{
			var_f3d83915 = ((isdefined(settings.var_b633cdaf) ? settings.var_b633cdaf : 0), (isdefined(settings.var_dad616fb) ? settings.var_dad616fb : 0), (isdefined(settings.var_e88bb266) ? settings.var_e88bb266 : 0));
			var_dd6869e3 = ((isdefined(settings.var_6a09650) ? settings.var_6a09650 : 0), (isdefined(settings.var_18e1bad2) ? settings.var_18e1bad2 : 0), (isdefined(settings.var_50dbaae9) ? settings.var_50dbaae9 : 0));
			var_d098ea88 = (isdefined(settings.var_ab56153b) ? settings.var_ab56153b : 0);
		}
		else
		{
			if(function_cd84dead(weapon, "barrel"))
			{
				var_f3d83915 = ((isdefined(settings.var_50e7f41f) ? settings.var_50e7f41f : 0), (isdefined(settings.var_3fa15192) ? settings.var_3fa15192 : 0), (isdefined(settings.var_7590bd70) ? settings.var_7590bd70 : 0));
				var_dd6869e3 = ((isdefined(settings.var_892173b6) ? settings.var_892173b6 : 0), (isdefined(settings.var_7adad729) ? settings.var_7adad729 : 0), (isdefined(settings.var_548b8a8b) ? settings.var_548b8a8b : 0));
				var_d098ea88 = (isdefined(settings.var_a8f47ab) ? settings.var_a8f47ab : 0);
			}
			else if(function_cd84dead(weapon, "stock"))
			{
				var_f3d83915 = ((isdefined(settings.var_ec765089) ? settings.var_ec765089 : 0), (isdefined(settings.var_3ba0eee1) ? settings.var_3ba0eee1 : 0), (isdefined(settings.var_ca0b8bb4) ? settings.var_ca0b8bb4 : 0));
				var_dd6869e3 = ((isdefined(settings.var_8290a87e) ? settings.var_8290a87e : 0), (isdefined(settings.var_a8c7f4ec) ? settings.var_a8c7f4ec : 0), (isdefined(settings.var_5fa9e2b1) ? settings.var_5fa9e2b1 : 0));
				var_d098ea88 = (isdefined(settings.var_f5a9d911) ? settings.var_f5a9d911 : 0);
			}
		}
	}
	loc_0000B5F4:
	var_2cbf4808 = struct::spawn(((isdefined(settings.var_6ee0b1d8) ? settings.var_6ee0b1d8 : 0), (isdefined(settings.var_5cae8d74) ? settings.var_5cae8d74 : 0), (isdefined(settings.var_8934e680) ? settings.var_8934e680 : 0)), ((isdefined(settings.var_cf03cb96) ? settings.var_cf03cb96 : 0), (isdefined(settings.var_4f264bd9) ? settings.var_4f264bd9 : 0), (isdefined(settings.var_84f7b77f) ? settings.var_84f7b77f : 0)));
	var_2cbf4808.origin = var_2cbf4808.origin + var_f3d83915;
	var_2cbf4808.angles = var_2cbf4808.angles + var_dd6869e3;
	var_2cbf4808.scale = (isdefined(settings.var_a31af46c) ? settings.var_a31af46c : 1);
	if(isdefined(var_d098ea88))
	{
		var_2cbf4808.scale = var_2cbf4808.scale + var_d098ea88;
	}
	var_2cbf4808.var_697bf2ff = settings.var_a20b23a4;
	var_2cbf4808.var_402cbe2d = settings.var_6b6e0c5a;
	var_2cbf4808.var_c492a06c = settings.var_8119af8f;
	if(is_true(weapon.islauncher) && (var_8a4ba442 === #"secondary" || (var_8a4ba442 === #"primary" && !function_4dcbc16b(localclientnum, var_8a4ba442, weapon))))
	{
		var_2cbf4808.var_697bf2ff = undefined;
	}
	if(var_8a4ba442 === #"primary" || var_8a4ba442 == #"secondary")
	{
		var_7975e84f = var_2cbf4808.origin;
		if(!function_b8990106(localclientnum, var_8a4ba442, weapon))
		{
			var_f617db00 = 1;
		}
	}
	else
	{
		var_7975e84f = (0, 0, 0);
	}
	if(is_true(var_f617db00))
	{
		var_2cbf4808.var_a5946026 = var_7975e84f + ((isdefined(settings.var_a29aa4a) ? settings.var_a29aa4a : 0), (isdefined(settings.var_fc750ee1) ? settings.var_fc750ee1 : 0), (isdefined(settings.var_2ec07377) ? settings.var_2ec07377 : 0));
		var_2cbf4808.var_a7adf514 = var_7975e84f + ((isdefined(settings.var_9326937c) ? settings.var_9326937c : 0), (isdefined(settings.var_b154cfd8) ? settings.var_b154cfd8 : 0), (isdefined(settings.var_db89243c) ? settings.var_db89243c : 0));
		var_2cbf4808.var_36859b17 = var_7975e84f + ((isdefined(settings.var_91d3fe8f) ? settings.var_91d3fe8f : 0), (isdefined(settings.var_7f0d5902) ? settings.var_7f0d5902 : 0), (isdefined(settings.var_2d4fb580) ? settings.var_2d4fb580 : 0));
		if(is_true(weapon.islauncher))
		{
			if(var_8a4ba442 === #"primary" && function_4dcbc16b(localclientnum, var_8a4ba442, weapon))
			{
				var_2cbf4808.origin = var_2cbf4808.origin + ((isdefined(settings.var_ac657f76) ? settings.var_ac657f76 : 0), (isdefined(settings.var_e130690b) ? settings.var_e130690b : 0), (isdefined(settings.var_87eeb689) ? settings.var_87eeb689 : 0));
				var_2cbf4808.angles = var_2cbf4808.angles + ((isdefined(settings.var_6d848856) ? settings.var_6d848856 : 0), (isdefined(settings.var_a13b6fc3) ? settings.var_a13b6fc3 : 0), (isdefined(settings.var_8b0e4369) ? settings.var_8b0e4369 : 0));
			}
		}
		else
		{
			var_2cbf4808.origin = var_2cbf4808.origin + ((isdefined(settings.var_ac657f76) ? settings.var_ac657f76 : 0), (isdefined(settings.var_e130690b) ? settings.var_e130690b : 0), (isdefined(settings.var_87eeb689) ? settings.var_87eeb689 : 0));
			var_2cbf4808.angles = var_2cbf4808.angles + ((isdefined(settings.var_6d848856) ? settings.var_6d848856 : 0), (isdefined(settings.var_a13b6fc3) ? settings.var_a13b6fc3 : 0), (isdefined(settings.var_8b0e4369) ? settings.var_8b0e4369 : 0));
		}
	}
	else
	{
		var_2cbf4808.var_a5946026 = var_7975e84f + ((isdefined(settings.var_b058b27b) ? settings.var_b058b27b : 0), (isdefined(settings.var_13c87959) ? settings.var_13c87959 : 0), (isdefined(settings.var_229096ed) ? settings.var_229096ed : 0));
		var_2cbf4808.var_a7adf514 = var_7975e84f + ((isdefined(settings.var_c287975b) ? settings.var_c287975b : 0), (isdefined(settings.var_f0b173ae) ? settings.var_f0b173ae : 0), (isdefined(settings.var_9e06ce56) ? settings.var_9e06ce56 : 0));
		var_2cbf4808.var_36859b17 = var_7975e84f + ((isdefined(settings.var_d0a96d99) ? settings.var_d0a96d99 : 0), (isdefined(settings.var_bd3046a3) ? settings.var_bd3046a3 : 0), (isdefined(settings.var_d0766d2f) ? settings.var_d0766d2f : 0));
	}
	return var_2cbf4808;
}

/*
	Name: function_fa001ebb
	Namespace: customclass
	Checksum: 0x407C9D41
	Offset: 0xBD80
	Size: 0x23E
	Parameters: 2
	Flags: None
*/
function function_fa001ebb(weapon, var_e81ceea)
{
	settings = function_34668e22(var_e81ceea);
	loc_0000BE44:
	var_9913fe4a = struct::spawn(((isdefined(settings.var_7fe4cc7f) ? settings.var_7fe4cc7f : 0), (isdefined(settings.var_c8ffdeb4) ? settings.var_c8ffdeb4 : 0), (isdefined(settings.var_d342f33a) ? settings.var_d342f33a : 0)), ((isdefined(settings.var_2bc74d91) ? settings.var_2bc74d91 : 0), (isdefined(settings.var_d6dfa3c3) ? settings.var_d6dfa3c3 : 0), (isdefined(settings.var_c82d065e) ? settings.var_c82d065e : 0)));
	var_f3d83915 = (0, 0, 0);
	var_dd6869e3 = (0, 0, 0);
	var_9913fe4a.origin = var_9913fe4a.origin + var_f3d83915;
	var_9913fe4a.angles = var_9913fe4a.angles + var_dd6869e3;
	var_7a54b7d9 = ((isdefined(settings.var_3ff74cc1) ? settings.var_3ff74cc1 : 0), (isdefined(settings.var_9c560581) ? settings.var_9c560581 : 0), (isdefined(settings.var_9f2225e6) ? settings.var_9f2225e6 : 0));
	var_9913fe4a.var_12e53312 = var_7a54b7d9;
	var_9913fe4a.scale = (isdefined(settings.var_6332d1f5) ? settings.var_6332d1f5 : 1);
	return var_9913fe4a;
}

