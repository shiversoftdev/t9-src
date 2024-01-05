#using scripts\zm_common\zm_weapons.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_wallbuy;

/*
	Name: __init__system__
	Namespace: zm_wallbuy
	Checksum: 0x6D4C8F89
	Offset: 0x258
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_wallbuy", &function_70a657d8, &function_8ac3bea9, undefined, #"zm");
}

/*
	Name: function_70a657d8
	Namespace: zm_wallbuy
	Checksum: 0x7D8C6753
	Offset: 0x2B8
	Size: 0x15C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!getgametypesetting(#"zmwallbuysenabled"))
	{
		return;
	}
	level flag::init("weapon_wallbuys_created");
	if(zm_utility::get_story() != 1)
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
	Checksum: 0x3C2B718
	Offset: 0x420
	Size: 0x28
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!getgametypesetting(#"zmwallbuysenabled"))
	{
		return;
	}
}

/*
	Name: init
	Namespace: zm_wallbuy
	Checksum: 0xE361983B
	Offset: 0x450
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
		if(weapon_group == #"weapon_pistol" && !getgametypesetting(#"zmweaponspistol") || (weapon_group == #"weapon_cqb" && !getgametypesetting(#"zmweaponsshotgun")) || (weapon_group == #"weapon_smg" && !getgametypesetting(#"zmweaponssmg")) || (weapon_group == #"weapon_assault" && !getgametypesetting(#"zmweaponsar")) || (weapon_group == #"weapon_tactical" && !getgametypesetting(#"zmweaponstr")) || (weapon_group == #"weapon_lmg" && !getgametypesetting(#"zmweaponslmg")) || (weapon_group == #"weapon_sniper" && !getgametypesetting(#"zmweaponssniper")) || (weapon_group == #"weapon_knife" && !getgametypesetting(#"zmweaponsknife")))
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
	Checksum: 0xAA993651
	Offset: 0xC50
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
	Checksum: 0xCAEEC299
	Offset: 0xD58
	Size: 0x2A0
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
		wallbuy function_8f12abec(localclientnum);
	}
}

/*
	Name: function_8f12abec
	Namespace: zm_wallbuy
	Checksum: 0xAE78346D
	Offset: 0x1000
	Size: 0x6EA
	Parameters: 1
	Flags: Linked
*/
function function_8f12abec(localclientnum)
{
	var_254469d1 = undefined;
	var_9ac76ba3 = 1;
	var_ddaf9f97 = undefined;
	switch((isdefined(self.script_noteworthy) ? self.script_noteworthy : 0))
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
		case "ar_slowfire_t9":
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
		case "tr_fullauto_t9":
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
	Checksum: 0xC6073F8A
	Offset: 0x16F8
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
	Checksum: 0xDB2D55CB
	Offset: 0x1B30
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
	Checksum: 0xEBAE2DF0
	Offset: 0x1F68
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
	Checksum: 0x8926CE8
	Offset: 0x2100
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

