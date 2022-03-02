#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_weapons.csc;

#namespace zm_wallbuy;

/*
	Name: function_8cfa4962
	Namespace: zm_wallbuy
	Checksum: 0x236E5AAD
	Offset: 0x498
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8cfa4962()
{
	level notify(443094756);
}

/*
	Name: function_89f2df9
	Namespace: zm_wallbuy
	Checksum: 0x57959BCE
	Offset: 0x4B8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_wallbuy", &function_70a657d8, &function_8ac3bea9, undefined, #"zm");
}

/*
	Name: function_70a657d8
	Namespace: zm_wallbuy
	Checksum: 0x42C02C39
	Offset: 0x518
	Size: 0x174
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!getgametypesetting(#"hash_51a2cf319e12d9ae"))
	{
		return;
	}
	level flag::init("weapon_wallbuys_created");
	if(zm_utility::function_166646a6() != 1 && !zm_utility::is_survival())
	{
		level._effect[#"wallbuy_ambient_fx"] = "zombie/fx8_wallbuy_amb";
		level._effect[#"hash_6928ec90dff78e0c"] = "zombie/fx8_wallbuy_amb_reverse";
		level._effect[#"wallbuy_reveal_fx"] = "zombie/fx8_wallbuy_reveal";
		clientfield::register("scriptmover", "wallbuy_ambient_fx", 1, 3, "int", &function_51f5fb94, 0, 0);
		clientfield::register("scriptmover", "wallbuy_reveal_fx", 1, 1, "int", &function_5ed44212, 0, 0);
	}
	init();
}

/*
	Name: function_8ac3bea9
	Namespace: zm_wallbuy
	Checksum: 0xE67E45D7
	Offset: 0x698
	Size: 0x28
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!getgametypesetting(#"hash_51a2cf319e12d9ae"))
	{
		return;
	}
}

/*
	Name: init
	Namespace: zm_wallbuy
	Checksum: 0x26593C8
	Offset: 0x6C8
	Size: 0x7F4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	spawn_list = [];
	spawnable_weapon_spawns = struct::get_array("weapon_upgrade", "targetname");
	spawnable_weapon_spawns = arraycombine(spawnable_weapon_spawns, struct::get_array("bowie_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = arraycombine(spawnable_weapon_spawns, struct::get_array("sickle_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = arraycombine(spawnable_weapon_spawns, struct::get_array("tazer_upgrade", "targetname"), 1, 0);
	spawnable_weapon_spawns = arraycombine(spawnable_weapon_spawns, struct::get_array("buildable_wallbuy", "targetname"), 1, 0);
	if(is_true(level.use_autofill_wallbuy))
	{
		spawnable_weapon_spawns = arraycombine(spawnable_weapon_spawns, level.active_autofill_wallbuys, 1, 0);
	}
	if(!is_true(level.headshots_only))
	{
		spawnable_weapon_spawns = arraycombine(spawnable_weapon_spawns, struct::get_array("claymore_purchase", "targetname"), 1, 0);
	}
	location = level.scr_zm_map_start_location;
	if(location == "default" || location == "" && isdefined(level.default_start_location))
	{
		location = level.default_start_location;
	}
	match_string = level.scr_zm_ui_gametype;
	if("" != location)
	{
		match_string = (match_string + "_") + location;
	}
	match_string_plus_space = " " + match_string;
	for(i = 0; i < spawnable_weapon_spawns.size; i++)
	{
		spawnable_weapon = spawnable_weapon_spawns[i];
		spawnable_weapon.weapon = getweapon(spawnable_weapon.zombie_weapon_upgrade);
		weapon_group = function_e2703c27(spawnable_weapon.weapon);
		if(weapon_group == #"weapon_pistol" && !getgametypesetting(#"hash_6f1440098d849316") || (weapon_group == #"weapon_cqb" && !getgametypesetting(#"hash_edfb07f798aaab5")) || (weapon_group == #"weapon_smg" && !getgametypesetting(#"hash_1f6665b5581f6b6e")) || (weapon_group == #"weapon_assault" && !getgametypesetting(#"hash_1d5c8e6f0e20201a")) || (weapon_group == #"weapon_tactical" && !getgametypesetting(#"hash_1d88786f0e4535a3")) || (weapon_group == #"weapon_lmg" && !getgametypesetting(#"hash_2f6740b518dbeb8f")) || (weapon_group == #"weapon_sniper" && !getgametypesetting(#"hash_5bfd047c58816496")) || (weapon_group == #"weapon_knife" && !getgametypesetting(#"hash_26f3528e8457207a")))
		{
			continue;
		}
		if(isdefined(spawnable_weapon.zombie_weapon_upgrade) && spawnable_weapon.weapon.isgrenadeweapon && is_true(level.headshots_only))
		{
			continue;
		}
		if(!isdefined(spawnable_weapon.script_noteworthy) || spawnable_weapon.script_noteworthy == "")
		{
			spawn_list[spawn_list.size] = spawnable_weapon;
			continue;
		}
		matches = strtok(spawnable_weapon.script_noteworthy, ",");
		for(j = 0; j < matches.size; j++)
		{
			if(matches[j] == match_string || matches[j] == match_string_plus_space)
			{
				spawn_list[spawn_list.size] = spawnable_weapon;
			}
		}
	}
	level._active_wallbuys = [];
	for(i = 0; i < spawn_list.size; i++)
	{
		spawn_list[i].script_label = (spawn_list[i].zombie_weapon_upgrade + "_") + spawn_list[i].origin;
		level._active_wallbuys[spawn_list[i].script_label] = spawn_list[i];
		numbits = 2;
		if(isdefined(level._wallbuy_override_num_bits))
		{
			numbits = level._wallbuy_override_num_bits;
		}
		clientfield::register("world", spawn_list[i].script_label, 1, numbits, "int", &wallbuy_callback, 0, 1);
		target_struct = struct::get(spawn_list[i].target, "targetname");
		if(spawn_list[i].targetname == "buildable_wallbuy")
		{
			bits = 4;
			if(isdefined(level.buildable_wallbuy_weapons))
			{
				bits = getminbitcountfornum(level.buildable_wallbuy_weapons.size + 1);
			}
			clientfield::register("world", spawn_list[i].script_label + "_idx", 1, bits, "int", &wallbuy_callback_idx, 0, 1);
		}
	}
	level flag::set("weapon_wallbuys_created");
	callback::on_localclient_connect(&wallbuy_player_connect);
}

/*
	Name: is_wallbuy
	Namespace: zm_wallbuy
	Checksum: 0x636A2B91
	Offset: 0xEC8
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function is_wallbuy(w_to_check)
{
	w_base = w_to_check.rootweapon;
	if(!isdefined(level._active_wallbuys))
	{
		level._active_wallbuys = [];
	}
	foreach(s_wallbuy in level._active_wallbuys)
	{
		if(s_wallbuy.weapon == w_base)
		{
			return true;
		}
	}
	if(isdefined(level._additional_wallbuy_weapons))
	{
		if(isinarray(level._additional_wallbuy_weapons, w_base))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: wallbuy_player_connect
	Namespace: zm_wallbuy
	Checksum: 0xE09BCD1F
	Offset: 0xFD0
	Size: 0x2B8
	Parameters: 1
	Flags: Linked
*/
function wallbuy_player_connect(localclientnum)
{
	keys = getarraykeys(level._active_wallbuys);
	/#
		println("" + localclientnum);
	#/
	for(i = 0; i < keys.size; i++)
	{
		wallbuy = level._active_wallbuys[keys[i]];
		if(wallbuy.weapon == level.weaponnone)
		{
			/#
				/#
					assertmsg("" + wallbuy.zombie_weapon_upgrade);
				#/
			#/
			continue;
		}
		fx = level._effect[#"870mcs_zm_fx"];
		if(isdefined(level._effect[wallbuy.zombie_weapon_upgrade + "_fx"]))
		{
			fx = level._effect[wallbuy.zombie_weapon_upgrade + "_fx"];
		}
		target_struct = struct::get(wallbuy.target, "targetname");
		target_model = zm_utility::spawn_buildkit_weapon_model(localclientnum, wallbuy.weapon, undefined, target_struct.origin, target_struct.angles);
		target_model hide();
		target_model.parent_struct = target_struct;
		wallbuy.models[localclientnum] = target_model;
		wallbuy function_8f12abec(localclientnum);
	}
	var_63734e5 = struct::get_array("wallbuy_chalk", "content_key");
	foreach(wallbuy in var_63734e5)
	{
		if(wallbuy.script_noteworthy !== "random")
		{
			wallbuy function_8f12abec(localclientnum);
		}
	}
}

/*
	Name: function_86b59fcc
	Namespace: zm_wallbuy
	Checksum: 0xA22060C7
	Offset: 0x1290
	Size: 0xB4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_86b59fcc(chalk_model)
{
	switch(chalk_model)
	{
		case "hash_ac25ab880b31bd8":
		case "hash_20f0bd11d1c7311a":
		case "hash_2c44506b5a4adcdb":
		case "hash_4114b6ac9879d85b":
		case "hash_52461e82e039d255":
		{
			type = "ar_accurate_t9";
			break;
		}
		case "hash_3854be6051783bab":
		case "hash_41f20c122d07164a":
		case "hash_48854064d83b3348":
		case "hash_56474820a3611dc5":
		case "hash_6ecb9dec9aef326b":
		{
			type = "ar_fastfire_t9";
			break;
		}
		case "hash_32a4abc11934bd99":
		case "hash_36d10ddd9198e50e":
		case "hash_4cf1309f1a8b905c":
		case "hash_6d1c3bb6284644ee":
		case "hash_6d3be6f227583969":
		{
			type = "ar_mobility_t9";
			break;
		}
		case "hash_17c2f15ed726cf51":
		case "hash_39ef3cf83725e046":
		case "hash_577607a64a513426":
		case "hash_762f5a04b0bb0454":
		case "hash_769c146354e1d671":
		{
			type = "ar_slowfire_t9";
			break;
		}
		case "hash_ba8c7ceeda6ed4d":
		case "hash_43ae9259432dc19a":
		case "hash_71426057e03b3e72":
		case "hash_790da02037dd644d":
		case "hash_7fe6418bb07f4ae0":
		{
			type = "ar_standard_t9";
			break;
		}
		case "hash_d397711f1c62cbe":
		case "hash_1568f0b938324e29":
		case "hash_2dd4a593ef2e247e":
		case "hash_3ff49c8e71e9dc0c":
		case "hash_745733ece2111ab9":
		{
			type = "ar_damage_t9";
			break;
		}
		case "hash_848977a03c3b1ef":
		case "hash_27cd288e1e9117c7":
		case "hash_2dcb24fbfe46d3bc":
		case "hash_3ca55cea67d20afe":
		case "hash_443ceef9e10fd8e9":
		{
			type = "pistol_burst_t9";
			break;
		}
		case "hash_d66744391171107":
		case "hash_2b53bc14567b5374":
		case "hash_379b00da2dadc632":
		case "hash_4be59669e7ac1a58":
		case "hash_6e28fb91e31fd0a3":
		{
			type = "pistol_revolver_t9";
			break;
		}
		case "hash_e9d49629e62c0d2":
		case "hash_1695732d671ca57a":
		case "hash_1d2a087e061b932d":
		case "hash_35066567b4a46dad":
		case "hash_68c106d81829db40":
		{
			type = "pistol_standard_t9";
			break;
		}
		case "hash_4150e9fbfece9b4d":
		case "hash_48298b67777081e0":
		case "hash_5e918a77b6b5324d":
		case "hash_676f8c57163f6572":
		case "hash_7f3c12cc4f0e369a":
		{
			type = "shotgun_pump_t9";
			break;
		}
		case "hash_175fc1b8b08f272a":
		case "hash_2ca5a7d539cc1405":
		case "hash_362cb24c65bb2b52":
		case "hash_3b5ddb29aabb0e78":
		case "hash_456cfac992bded95":
		{
			type = "shotgun_fullauto_t9";
			break;
		}
		case "hash_10473a5bc109d0f4":
		case "hash_25c9b080e3630b81":
		case "hash_50c7b64345817326":
		case "hash_51743a61c66a83df":
		case "hash_5c2430d86756e447":
		{
			type = "shotgun_semiauto_t9";
			break;
		}
		case "hash_5faafb95e1aa195":
		case "hash_392ea9010ac3d050":
		case "hash_58d6dda2cd160f0d":
		case "hash_76106fbb17a9333b":
		case "hash_76fdbf97a01d50e2":
		{
			type = "smg_burst_t9";
			break;
		}
		case "hash_1c2f17746576ef2":
		case "hash_79657cde0c5653d":
		case "hash_24e100271d4db100":
		case "hash_324d4ff006f88243":
		case "hash_4cd0c4d654c097e3":
		{
			type = "smg_capacity_t9";
			break;
		}
		case "hash_12ed545197b5448f":
		case "hash_1960105d71e18dd6":
		case "hash_3a76fbbcc894a8e9":
		case "hash_53bfdd08b50db789":
		case "hash_6e8c9c400f472104":
		{
			type = "smg_fastfire_t9";
			break;
		}
		case "hash_962248c2202b4bb":
		case "hash_2d22e43805a1636f":
		case "hash_3c9529d3ceaa44da":
		case "hash_48e083bcbb4008bc":
		case "hash_6e02b1b03c4851e0":
		{
			type = "smg_standard_t9";
			break;
		}
		case "hash_17bd60f2817f7749":
		case "hash_1b777c76c52a9e6e":
		case "hash_3db4d21d6db349f9":
		case "hash_420c2f2feccf74ce":
		case "hash_740daa9f71d1583c":
		{
			type = "smg_heavy_t9";
			break;
		}
		case "hash_15a4232fce4cf254":
		case "hash_1d6aff75b26ac79f":
		case "hash_55859adb0b38eaa8":
		case "hash_59113c87fb2bc9d3":
		case "hash_7871bd04f77b77be":
		{
			type = "smg_handling_t9";
			break;
		}
		case "hash_19fee21ebde27a07":
		case "hash_3553d63623f693a3":
		case "hash_453fb708b7848d58":
		case "hash_6fe8412e8368ac74":
		case "hash_7ec5db7e6e848932":
		{
			type = "sniper_powersemi_t9";
			break;
		}
		case "hash_9fe66529bbb2c82":
		case "hash_43eb62442d7e07e5":
		case "hash_6a21a738e317037a":
		case "hash_784963b4918e79e8":
		case "hash_79145df8314cb715":
		{
			type = "sniper_quickscope_t9";
			break;
		}
		case "hash_20b93a829617614a":
		case "hash_3ebb88a3709c25a5":
		case "hash_3f7044646cc08d98":
		case "hash_4980640454c51fb5":
		case "hash_4b1b697f32ccfdf2":
		{
			type = "sniper_standard_t9";
			break;
		}
		case "hash_2157c9674c67731d":
		case "hash_4f5bc8b1a89e9455":
		case "hash_53ade1a7dfcaebc8":
		case "hash_7da4f0a80749e9ea":
		case "hash_7eae261b0bb2f4a3":
		{
			type = "tr_damagesemi_t9";
			break;
		}
		case "hash_10bce3d2d9d05caa":
		case "hash_17de1ca19c00cbd2":
		case "hash_1b4cd5d0ff99abf8":
		case "hash_255bf570e79c8b15":
		case "hash_271c1a495399fc85":
		{
			type = "tr_fullauto_t9";
			break;
		}
		case "hash_6c3b4712eee1576":
		case "hash_3b9d5ca8c3de8781":
		case "hash_41289888933ab576":
		case "hash_54876b09baf22c04":
		case "hash_61f8215c2cb9e5a1":
		{
			type = "tr_longburst_t9";
			break;
		}
		case "hash_1842fd1c34d169c2":
		case "hash_25b46f6ea69a62d3":
		case "hash_368ae18211759410":
		case "hash_567ce855ee06da0d":
		case "hash_6a7f20be318755f3":
		{
			type = "tr_powerburst_t9";
			break;
		}
		case "hash_27c596b133ab8f6":
		case "hash_5c6dc71c4b620f8f":
		case "hash_6600b1d26d7e6591":
		case "hash_79507506b126feb7":
		case "hash_7aac84dfbabbc8c4":
		{
			type = "tr_precisionsemi_t9";
			break;
		}
		case "hash_459809dbd6bd924":
		case "hash_105d1ea51841aaaf":
		case "hash_2dc6bb27c0b0e4ae":
		case "hash_3d4630c27b329c23":
		case "hash_79b96a652941ad58":
		{
			type = "lmg_accurate_t9";
			break;
		}
		case "hash_4df2c6370523e91c":
		case "hash_55484f922fe3ceba":
		case "hash_5df2a83d1fc4c6c0":
		case "hash_716ec2b58854dacf":
		case "hash_789a4a459b3d939b":
		{
			type = "lmg_light_t9";
			break;
		}
		case "hash_6aa7ab77fdbf3b5":
		case "hash_76deb48b5a725fd":
		case "hash_cd1d3edd0162e83":
		case "hash_389b434e6c79984a":
		case "hash_39c50389490c51a8":
		{
			type = "lmg_slowfire_t9";
			break;
		}
		default:
		{
			/#
				println("" + chalk_model);
			#/
			type = 0;
			break;
		}
	}
	return type;
}

/*
	Name: function_8f12abec
	Namespace: zm_wallbuy
	Checksum: 0xCA0C1930
	Offset: 0x1DE8
	Size: 0x7C2
	Parameters: 1
	Flags: Linked
*/
function function_8f12abec(localclientnum)
{
	if(isdefined(self.var_4972e475))
	{
		return;
	}
	var_254469d1 = undefined;
	var_9ac76ba3 = 1;
	var_ddaf9f97 = undefined;
	weapon_type = (isdefined(self.script_noteworthy) ? self.script_noteworthy : 0);
	if(weapon_type === "random" || weapon_type === 0)
	{
		weapon_type = function_86b59fcc(self.model);
		if(weapon_type === 0)
		{
			return;
		}
	}
	switch(weapon_type)
	{
		case "ar_damage_t9":
		{
			var_254469d1 = #"hash_60d3a1f7d422e966";
			var_8aa9ab80 = #"hash_4d8398888735db8";
			break;
		}
		case "ar_fastfire_t9":
		{
			var_254469d1 = #"hash_9e1422a498a153";
			var_8aa9ab80 = #"hash_717baccca4cf03d1";
			break;
		}
		case "ar_mobility_t9":
		{
			var_254469d1 = #"hash_13c954f44eee4616";
			var_8aa9ab80 = #"hash_7bd4f5716e446b78";
			break;
		}
		case "hash_578fab7f7b2db478":
		{
			var_254469d1 = #"hash_43891455ac15b7be";
			var_8aa9ab80 = #"hash_63e8969bae8c6414";
			break;
		}
		case "ar_standard_t9":
		{
			var_254469d1 = #"hash_51976978ad5a7a0a";
			var_8aa9ab80 = #"hash_67e1bb4dbdf802d8";
			break;
		}
		case "ar_accurate_t9":
		{
			var_254469d1 = #"hash_5465e97890027a63";
			var_8aa9ab80 = #"hash_4ea07dc5c94ab7f9";
			break;
		}
		case "pistol_burst_t9":
		{
			var_254469d1 = #"hash_380cbbb95bef9a97";
			var_8aa9ab80 = #"hash_703b41f88b42f343";
			break;
		}
		case "pistol_revolver_t9":
		{
			var_254469d1 = #"hash_1551c0e06f65b6e8";
			var_8aa9ab80 = #"hash_5091c4707ec6b942";
			break;
		}
		case "pistol_semiauto_t9":
		{
			var_254469d1 = #"hash_1d6b5a3162315d2a";
			var_8aa9ab80 = #"hash_2439a2ff4beb86b0";
			break;
		}
		case "shotgun_fullauto_t9":
		{
			var_254469d1 = #"hash_543883d02a25c8f2";
			var_8aa9ab80 = #"hash_6df0ff702b2613be";
			break;
		}
		case "shotgun_semiauto_t9":
		{
			var_254469d1 = #"hash_5fb436cc685858bf";
			var_8aa9ab80 = #"hash_6dcf0445e7c7257b";
			break;
		}
		case "shotgun_pump_t9":
		{
			var_254469d1 = #"hash_2142923f8242e70a";
			var_8aa9ab80 = #"hash_1631ac670b00dbfa";
			break;
		}
		case "smg_burst_t9":
		{
			var_254469d1 = #"hash_3de7cc85209151f9";
			var_8aa9ab80 = #"hash_2c75287d04644bcb";
			break;
		}
		case "smg_capacity_t9":
		{
			var_254469d1 = #"hash_269644599df154db";
			var_8aa9ab80 = #"hash_423632bb711a406b";
			break;
		}
		case "smg_fastfire_t9":
		{
			var_254469d1 = #"hash_4ea0b0f3291897dd";
			var_8aa9ab80 = #"hash_6def002686374645";
			break;
		}
		case "smg_handling_t9":
		{
			var_254469d1 = #"hash_552da77f6dd268f4";
			var_8aa9ab80 = #"hash_410c31e1c403b298";
			break;
		}
		case "smg_heavy_t9":
		{
			var_254469d1 = #"hash_3de4a3ba0c0c6176";
			var_8aa9ab80 = #"hash_42c7bf7c8a2eaad8";
			break;
		}
		case "smg_standard_t9":
		{
			var_254469d1 = #"hash_1be663d24baec560";
			var_8aa9ab80 = #"hash_1895010b5180880c";
			break;
		}
		case "sniper_powersemi_t9":
		{
			var_254469d1 = #"hash_23fca34f81467e8";
			var_8aa9ab80 = #"hash_1fed797b830c9f74";
			break;
		}
		case "sniper_quickscope_t9":
		{
			var_254469d1 = #"hash_5afdcf904fe36502";
			var_8aa9ab80 = #"hash_4cf07e30456d6a24";
			break;
		}
		case "sniper_standard_t9":
		{
			var_254469d1 = #"hash_2dc0ad079e877d92";
			var_8aa9ab80 = #"hash_755d23459c2344cc";
			break;
		}
		case "tr_damagesemi_t9":
		{
			var_254469d1 = #"hash_4412650e08944071";
			var_8aa9ab80 = #"hash_14e7b988f9459207";
			break;
		}
		case "hash_48bedf3a6bea3720":
		{
			var_254469d1 = #"hash_759d98b15bc6f572";
			break;
		}
		case "tr_longburst_t9":
		{
			var_254469d1 = #"hash_26d132a48416630e";
			var_8aa9ab80 = #"hash_696d8b6b3a595612";
			break;
		}
		case "tr_powerburst_t9":
		{
			var_254469d1 = #"hash_6bae63c0650c5b6b";
			var_8aa9ab80 = #"hash_7e1fb00fccc464b5";
			break;
		}
		case "tr_precisionsemi_t9":
		{
			var_254469d1 = #"hash_7f13eff55abcf1ec";
			var_8aa9ab80 = #"hash_1a652a02b8f8208";
			break;
		}
		case "lmg_slowfire_t9":
		{
			var_254469d1 = #"hash_13c6573ab08b92d1";
			var_8aa9ab80 = #"hash_5eca49abef9d89ed";
			break;
		}
		case "lmg_light_t9":
		{
			var_254469d1 = #"hash_373cf28c1cd363c0";
			var_8aa9ab80 = #"hash_115345b891f63176";
			break;
		}
		case "lmg_accurate_t9":
		{
			var_254469d1 = #"hash_7c2e5b18f3e46c4";
			var_8aa9ab80 = #"hash_7eb1b81fdce9b908";
			break;
		}
		default:
		{
			var_254469d1 = #"hash_51976978ad5a7a0a";
			var_8aa9ab80 = #"hash_151d1b68c65d9d05";
			var_9ac76ba3 = 0;
			break;
		}
	}
	var_4972e475 = util::spawn_model(localclientnum, var_254469d1, self.origin, self.angles);
	var_4972e475.var_fc558e74 = "wallbuy";
	if(var_9ac76ba3)
	{
		var_4972e475.var_ed875153 = var_8aa9ab80;
	}
	var_4972e475 function_619a5c20();
	self.var_4972e475 = var_4972e475;
}

/*
	Name: wallbuy_callback
	Namespace: zm_wallbuy
	Checksum: 0x146A2873
	Offset: 0x25B8
	Size: 0x42A
	Parameters: 7
	Flags: Linked
*/
function wallbuy_callback(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname)
	{
		while(!isdefined(level._active_wallbuys) || !isdefined(level._active_wallbuys[bwastimejump]))
		{
			waitframe(1);
		}
	}
	struct = level._active_wallbuys[bwastimejump];
	/#
		println("" + bnewent);
	#/
	if(!isdefined(struct) || !isdefined(struct.models[bnewent]) || !isdefined(struct.models[bnewent].parent_struct))
	{
		/#
			/#
				assertmsg("" + bwastimejump);
			#/
		#/
		return;
	}
	switch(binitialsnap)
	{
		case 0:
		{
			struct.models[bnewent].origin = struct.models[bnewent].parent_struct.origin;
			struct.models[bnewent].angles = struct.models[bnewent].parent_struct.angles;
			struct.models[bnewent] hide();
			break;
		}
		case 1:
		{
			if(fieldname)
			{
				if(!isdefined(struct.models))
				{
					while(!isdefined(struct.models))
					{
						waitframe(1);
					}
					while(!isdefined(struct.models[bnewent]))
					{
						waitframe(1);
					}
				}
				struct.models[bnewent] show();
				struct.models[bnewent].origin = struct.models[bnewent].parent_struct.origin;
			}
			else
			{
				waitframe(1);
				if(bnewent == 0)
				{
					playsound(0, #"zmb_weap_wall", struct.origin);
				}
				vec_offset = (0, 0, 0);
				if(isdefined(struct.models[bnewent].parent_struct.script_vector))
				{
					vec_offset = struct.models[bnewent].parent_struct.script_vector;
				}
				struct.models[bnewent].origin = struct.models[bnewent].parent_struct.origin + ((anglestoright(struct.models[bnewent].angles + vec_offset)) * 8);
				struct.models[bnewent] show();
				struct.models[bnewent] moveto(struct.models[bnewent].parent_struct.origin, 1);
			}
			break;
		}
		case 2:
		{
			if(isdefined(level.wallbuy_callback_hack_override))
			{
				struct.models[bnewent] [[level.wallbuy_callback_hack_override]]();
			}
			break;
		}
	}
}

/*
	Name: wallbuy_callback_idx
	Namespace: zm_wallbuy
	Checksum: 0x2D0DEB24
	Offset: 0x29F0
	Size: 0x430
	Parameters: 7
	Flags: Linked
*/
function wallbuy_callback_idx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	basefield = getsubstr(bwastimejump, 0, bwastimejump.size - 4);
	struct = level._active_wallbuys[basefield];
	if(fieldname == 0)
	{
		if(isdefined(struct.models[binitialsnap]))
		{
			struct.models[binitialsnap] hide();
		}
	}
	else if(fieldname > 0)
	{
		weaponname = level.buildable_wallbuy_weapons[fieldname - 1];
		weapon = getweapon(weaponname);
		if(!isdefined(struct.models))
		{
			struct.models = [];
		}
		if(!isdefined(struct.models[binitialsnap]))
		{
			target_struct = struct::get(struct.target, "targetname");
			model = undefined;
			if(isdefined(level.buildable_wallbuy_weapon_models[weaponname]))
			{
				model = level.buildable_wallbuy_weapon_models[weaponname];
			}
			angles = target_struct.angles;
			if(isdefined(level.buildable_wallbuy_weapon_angles[weaponname]))
			{
				switch(level.buildable_wallbuy_weapon_angles[weaponname])
				{
					case 90:
					{
						angles = vectortoangles(anglestoright(angles));
						break;
					}
					case 180:
					{
						angles = vectortoangles(anglestoforward(angles) * -1);
						break;
					}
					case 270:
					{
						angles = vectortoangles(anglestoright(angles) * -1);
						break;
					}
				}
			}
			target_model = zm_utility::spawn_buildkit_weapon_model(binitialsnap, weapon, undefined, target_struct.origin, angles);
			target_model hide();
			target_model.parent_struct = target_struct;
			struct.models[binitialsnap] = target_model;
			if(isdefined(struct.fx[binitialsnap]))
			{
				stopfx(binitialsnap, struct.fx[binitialsnap]);
				struct.fx[binitialsnap] = undefined;
			}
			fx = level._effect[#"870mcs_zm_fx"];
			if(isdefined(level._effect[weaponname + "_fx"]))
			{
				fx = level._effect[weaponname + "_fx"];
			}
			struct.fx[binitialsnap] = playfx(binitialsnap, fx, struct.origin, anglestoforward(struct.angles), anglestoup(struct.angles), 0.1);
			level notify(#"wallbuy_updated");
		}
	}
}

/*
	Name: function_51f5fb94
	Namespace: zm_wallbuy
	Checksum: 0x2178033E
	Offset: 0x2E28
	Size: 0x18A
	Parameters: 7
	Flags: Linked
*/
function function_51f5fb94(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_11154944))
	{
		stopfx(fieldname, self.var_11154944);
		self.var_11154944 = undefined;
	}
	if(bwastimejump)
	{
		switch(bwastimejump)
		{
			case 3:
			{
				fx_to_play = #"hash_7df7fa64b947f085";
				break;
			}
			case 4:
			{
				fx_to_play = #"hash_1c2f33d581b291d2";
				break;
			}
			case 5:
			{
				fx_to_play = #"hash_19ef730d1f1a0f98";
				break;
			}
			case 6:
			{
				fx_to_play = #"hash_4c7d47bec47dda6c";
				break;
			}
			case 7:
			{
				fx_to_play = #"hash_2126649becba5c72";
				break;
			}
		}
		if(isdefined(fx_to_play))
		{
			self.var_11154944 = util::playfxontag(fieldname, fx_to_play, self, "tag_origin");
		}
	}
}

/*
	Name: function_5ed44212
	Namespace: zm_wallbuy
	Checksum: 0x68578CC2
	Offset: 0x2FC0
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_5ed44212(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		util::playfxontag(fieldname, level._effect[#"wallbuy_reveal_fx"], self, "tag_fx_wall_buy");
	}
}

