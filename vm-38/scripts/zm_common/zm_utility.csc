#using scripts\zm_common\zm_wallbuy.csc;
#using scripts\zm_common\zm_customgame.csc;
#using scripts\zm_common\zm_maptable.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\activecamo_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_utility;

/*
	Name: function_ec66576b
	Namespace: zm_utility
	Checksum: 0x9BFA0F9
	Offset: 0x278
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ec66576b()
{
	level notify(1258756667);
}

/*
	Name: __init__system__
	Namespace: zm_utility
	Checksum: 0x64F2A5A9
	Offset: 0x298
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_utility", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_utility
	Checksum: 0x76C15218
	Offset: 0x2F0
	Size: 0x4A4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._effect[#"zm_zone_edge_marker"] = #"hash_3002526b7ff53cbf";
	clientfield::register_clientuimodel("hudItems.armorType", #"hud_items", #"hash_789d8c10ac21687c", 1, 2, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.armorPercent", #"hud_items", #"armorpercent", 1, 7, "float", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.scrap", #"hud_items", #"scrap", 1, 16, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("hudItems.rareScrap", #"hud_items", #"hash_d6fdfc12ead24ba", 1, 16, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("pap_current", #"zm_hud", #"hash_64f2ff2ddddbe9c7", 1, 2, "int", undefined, 0, 0);
	clientfield::register("toplayer", "zm_zone_out_of_bounds", 1, 1, "int", &zm_zone_out_of_bounds, 0, 0);
	clientfield::register("actor", "flame_corpse_fx", 1, 1, "int", &flame_corpse_fx, 0, 0);
	clientfield::register("scriptmover", "model_rarity_rob", 1, 3, "int", &model_rarity_rob, 0, 0);
	clientfield::register("scriptmover", "set_compass_icon", 1, 1, "int", &set_compass_icon, 0, 0);
	clientfield::register("scriptmover", "force_stream", 1, 1, "int", &force_stream_changed, 0, 0);
	callback::on_localclient_connect(&on_localclient_connect);
	for(i = 0; i < 5; i++)
	{
		clientfield::function_5b7d846d(("PlayerList.client" + i) + ".playerIsDowned", #"hash_97df1852304b867", [1:#"hash_dd3a25488c5d4a5", 0:hash((isdefined(i) ? "" + i : ""))], 1, 1, "int", undefined, 0, 0);
		clientfield::function_5b7d846d(("PlayerList.client" + i) + ".self_revives", #"hash_97df1852304b867", [1:#"self_revives", 0:hash((isdefined(i) ? "" + i : ""))], 1, 8, "int", undefined, 0, 0);
	}
}

/*
	Name: on_localclient_connect
	Namespace: zm_utility
	Checksum: 0x734E882D
	Offset: 0x7A0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	level thread function_725e99fb(localclientnum);
}

/*
	Name: function_8ac3bea9
	Namespace: zm_utility
	Checksum: 0x80F724D1
	Offset: 0x7D0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
}

/*
	Name: ignore_triggers
	Namespace: zm_utility
	Checksum: 0x5BA34810
	Offset: 0x7E0
	Size: 0x5A
	Parameters: 1
	Flags: None
*/
function ignore_triggers(timer)
{
	if(!isdefined(self))
	{
		return;
	}
	self endon(#"death");
	self.ignoretriggers = 1;
	if(isdefined(timer))
	{
		wait(timer);
	}
	else
	{
		wait(0.5);
	}
	self.ignoretriggers = 0;
}

/*
	Name: is_encounter
	Namespace: zm_utility
	Checksum: 0x38402A50
	Offset: 0x848
	Size: 0x6
	Parameters: 0
	Flags: None
*/
function is_encounter()
{
	return false;
}

/*
	Name: round_up_to_ten
	Namespace: zm_utility
	Checksum: 0x447CDEAD
	Offset: 0x858
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function round_up_to_ten(score)
{
	new_score = score - (score % 10);
	if(new_score < score)
	{
		new_score = new_score + 10;
	}
	return new_score;
}

/*
	Name: round_up_score
	Namespace: zm_utility
	Checksum: 0xE76D368B
	Offset: 0x8A0
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function round_up_score(score, value)
{
	score = int(score);
	new_score = score - (score % value);
	if(new_score < score)
	{
		new_score = new_score + value;
	}
	return new_score;
}

/*
	Name: halve_score
	Namespace: zm_utility
	Checksum: 0x76D8DFE0
	Offset: 0x908
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function halve_score(n_score)
{
	n_score = n_score / 2;
	n_score = round_up_score(n_score, 10);
	return n_score;
}

/*
	Name: spawn_weapon_model
	Namespace: zm_utility
	Checksum: 0x9DC63562
	Offset: 0x950
	Size: 0xE0
	Parameters: 7
	Flags: None
*/
function spawn_weapon_model(localclientnum, weapon, model, origin, angles, var_57fe74e5, var_fd90b0bb)
{
	if(!isdefined(model))
	{
		model = weapon.worldmodel;
	}
	weapon_model = spawn(localclientnum, origin, "script_model");
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	if(isdefined(var_57fe74e5) || isdefined(var_fd90b0bb))
	{
		weapon_model useweaponmodel(weapon, model, var_57fe74e5, var_fd90b0bb);
	}
	else
	{
		weapon_model useweaponmodel(weapon, model);
	}
	return weapon_model;
}

/*
	Name: spawn_buildkit_weapon_model
	Namespace: zm_utility
	Checksum: 0x92EA5363
	Offset: 0xA38
	Size: 0xA0
	Parameters: 5
	Flags: Linked
*/
function spawn_buildkit_weapon_model(localclientnum, weapon, camo, origin, angles)
{
	weapon_model = spawn(localclientnum, origin, "script_model");
	if(isdefined(angles))
	{
		weapon_model.angles = angles;
	}
	weapon_model usebuildkitweaponmodel(localclientnum, weapon, camo);
	weapon_model activecamo::function_e40c785a(localclientnum);
	return weapon_model;
}

/*
	Name: is_classic
	Namespace: zm_utility
	Checksum: 0x17D65F86
	Offset: 0xAE0
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_classic()
{
	str_gametype = util::get_game_type();
	if(str_gametype == #"zclassic")
	{
		return true;
	}
	return false;
}

/*
	Name: is_survival
	Namespace: zm_utility
	Checksum: 0xACB8C1E1
	Offset: 0xB28
	Size: 0x40
	Parameters: 0
	Flags: Linked
*/
function is_survival()
{
	str_gametype = util::get_game_type();
	if(str_gametype == #"zsurvival")
	{
		return true;
	}
	return false;
}

/*
	Name: is_standard
	Namespace: zm_utility
	Checksum: 0xFA4167A6
	Offset: 0xB70
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_standard()
{
	str_gametype = util::get_game_type();
	if(str_gametype == #"zstandard")
	{
		return true;
	}
	return false;
}

/*
	Name: is_trials
	Namespace: zm_utility
	Checksum: 0xC09FD250
	Offset: 0xBB8
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function is_trials()
{
	str_gametype = util::get_game_type();
	if(str_gametype == #"ztrials" || level flag::exists(#"ztrial"))
	{
		return true;
	}
	return false;
}

/*
	Name: is_tutorial
	Namespace: zm_utility
	Checksum: 0xF78AC7F5
	Offset: 0xC28
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_tutorial()
{
	str_gametype = util::get_game_type();
	if(str_gametype == #"ztutorial")
	{
		return true;
	}
	return false;
}

/*
	Name: is_grief
	Namespace: zm_utility
	Checksum: 0x9BF463A6
	Offset: 0xC70
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_grief()
{
	str_gametype = util::get_game_type();
	if(str_gametype == #"zgrief")
	{
		return true;
	}
	return false;
}

/*
	Name: is_gametype_active
	Namespace: zm_utility
	Checksum: 0xC3AFFF16
	Offset: 0xCB8
	Size: 0x92
	Parameters: 1
	Flags: None
*/
function is_gametype_active(a_gametypes)
{
	b_is_gametype_active = 0;
	if(!isarray(a_gametypes))
	{
		a_gametypes = array(a_gametypes);
	}
	for(i = 0; i < a_gametypes.size; i++)
	{
		if(util::get_game_type() == a_gametypes[i])
		{
			b_is_gametype_active = 1;
		}
	}
	return b_is_gametype_active;
}

/*
	Name: is_ee_enabled
	Namespace: zm_utility
	Checksum: 0xF4C6B8F0
	Offset: 0xD58
	Size: 0x6A
	Parameters: 0
	Flags: Linked
*/
function is_ee_enabled()
{
	if(!getdvarint(#"zm_ee_enabled", 0))
	{
		return false;
	}
	if(!zm_custom::function_901b751c(#"hash_3c5363541b97ca3e"))
	{
		return false;
	}
	if(level.gamedifficulty == 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_36e7b4a2
	Namespace: zm_utility
	Checksum: 0x8EF78C2D
	Offset: 0xDD0
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function function_36e7b4a2()
{
	if(is_true(getgametypesetting(#"hash_5d6471cd7038852e")))
	{
		return true;
	}
	return false;
}

/*
	Name: setinventoryuimodels
	Namespace: zm_utility
	Checksum: 0xDC26AE0D
	Offset: 0xE18
	Size: 0xA4
	Parameters: 7
	Flags: None
*/
function setinventoryuimodels(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(function_65b9eb0f(binitialsnap))
	{
		return;
	}
	setuimodelvalue(createuimodel(function_1df4c3b0(binitialsnap, #"zm_inventory"), bwastimejump), fieldname);
}

/*
	Name: setsharedinventoryuimodels
	Namespace: zm_utility
	Checksum: 0xAEC67BB6
	Offset: 0xEC8
	Size: 0x84
	Parameters: 7
	Flags: None
*/
function setsharedinventoryuimodels(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	setuimodelvalue(createuimodel(function_1df4c3b0(binitialsnap, #"zm_inventory"), bwastimejump), fieldname);
}

/*
	Name: zm_ui_infotext
	Namespace: zm_utility
	Checksum: 0xB19B7799
	Offset: 0xF58
	Size: 0xEC
	Parameters: 7
	Flags: None
*/
function zm_ui_infotext(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(fieldname)
	{
		setuimodelvalue(createuimodel(function_1df4c3b0(binitialsnap, #"zm_inventory"), "infoText"), bwastimejump);
	}
	else
	{
		setuimodelvalue(createuimodel(function_1df4c3b0(binitialsnap, #"zm_inventory"), "infoText"), "");
	}
}

/*
	Name: drawcylinder
	Namespace: zm_utility
	Checksum: 0x843003D5
	Offset: 0x1050
	Size: 0x274
	Parameters: 4
	Flags: None
*/
function drawcylinder(pos, rad, height, color)
{
	/#
		currad = rad;
		curheight = height;
		debugstar(pos, 1, color);
		for(r = 0; r < 20; r++)
		{
			theta = (r / 20) * 360;
			theta2 = ((r + 1) / 20) * 360;
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0), color, 1, 1, 100);
			line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight), color, 1, 1, 100);
			line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight), color, 1, 1, 100);
		}
	#/
}

/*
	Name: function_f8796df3
	Namespace: zm_utility
	Checksum: 0x862BC30
	Offset: 0x12D0
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function function_f8796df3(localclientnum)
{
	b_first = 0;
	if(isplayer(self) && self function_21c0fa55() && !isdemoplaying())
	{
		var_27cd9fcb = self getlocalclientnumber();
		if(!isdefined(var_27cd9fcb) || localclientnum == var_27cd9fcb && !isthirdperson(localclientnum))
		{
			b_first = 1;
		}
	}
	return b_first;
}

/*
	Name: function_467efa7b
	Namespace: zm_utility
	Checksum: 0x15FF6E94
	Offset: 0x1398
	Size: 0x14E
	Parameters: 1
	Flags: None
*/
function function_467efa7b(var_9f3fb329)
{
	if(!isdefined(var_9f3fb329))
	{
		var_9f3fb329 = 0;
	}
	if(!isdefined(self.archetype))
	{
		return "tag_origin";
	}
	switch(self.archetype)
	{
		case "stoker":
		case "catalyst":
		case "gladiator":
		case "nova_crawler":
		case "zombie":
		case "ghost":
		case "brutus":
		{
			if(var_9f3fb329)
			{
				str_tag = "j_spine4";
			}
			else
			{
				str_tag = "j_spineupper";
			}
			break;
		}
		case "blight_father":
		case "tiger":
		case "elephant":
		{
			str_tag = "j_head";
			break;
		}
		default:
		{
			str_tag = "tag_origin";
			break;
		}
	}
	return str_tag;
}

/*
	Name: function_bb54a31f
	Namespace: zm_utility
	Checksum: 0xB60F6470
	Offset: 0x14F0
	Size: 0x108
	Parameters: 3
	Flags: None
*/
function function_bb54a31f(localclientnum, var_20804e3b, var_3ab46b9)
{
	self endon(var_3ab46b9);
	s_result = undefined;
	s_result = level waittill(#"respawn");
	a_e_players = getlocalplayers();
	foreach(e_player in a_e_players)
	{
		if(e_player postfx::function_556665f2(var_20804e3b))
		{
			e_player postfx::exitpostfxbundle(var_20804e3b);
		}
	}
}

/*
	Name: function_ae3780f1
	Namespace: zm_utility
	Checksum: 0x6B9E6A98
	Offset: 0x1600
	Size: 0xFE
	Parameters: 3
	Flags: Linked
*/
function function_ae3780f1(localclientnum, n_fx_id, var_3ab46b9)
{
	self endon(var_3ab46b9);
	s_result = undefined;
	s_result = level waittill(#"respawn");
	a_e_players = getlocalplayers();
	foreach(e_player in a_e_players)
	{
		if(isdefined(n_fx_id))
		{
			deletefx(localclientnum, n_fx_id);
			n_fx_id = undefined;
		}
	}
}

/*
	Name: get_cast
	Namespace: zm_utility
	Checksum: 0xAF5709E8
	Offset: 0x1708
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function get_cast()
{
	return zm_maptable::get_cast();
}

/*
	Name: get_story
	Namespace: zm_utility
	Checksum: 0xF714A75B
	Offset: 0x1728
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function get_story()
{
	return zm_maptable::get_story();
}

/*
	Name: zm_zone_out_of_bounds
	Namespace: zm_utility
	Checksum: 0xF64FA783
	Offset: 0x1748
	Size: 0x14C
	Parameters: 7
	Flags: Linked
*/
function zm_zone_out_of_bounds(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_20861007))
	{
		level.var_20861007 = [];
	}
	if(!isdefined(level.var_20861007[fieldname]))
	{
		level.var_20861007[fieldname] = util::spawn_model(fieldname, "tag_origin");
	}
	if(bwastimejump)
	{
		level.var_20861007[fieldname] playloopsound(#"hash_6da7ae12f538ef5e", 0.5);
		self postfx::playpostfxbundle(#"hash_798237aa1bad3d7d");
	}
	else
	{
		level.var_20861007[fieldname] stopallloopsounds(0.5);
		self postfx::exitpostfxbundle(#"hash_798237aa1bad3d7d");
	}
}

/*
	Name: flame_corpse_fx
	Namespace: zm_utility
	Checksum: 0x8618F46
	Offset: 0x18A0
	Size: 0x14E
	Parameters: 7
	Flags: Linked
*/
function flame_corpse_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		if(isdefined(self.var_71a7fc1c))
		{
			stopfx(fieldname, self.var_71a7fc1c);
		}
		str_tag = "j_spineupper";
		if(!isdefined(self gettagorigin(str_tag)))
		{
			str_tag = "tag_origin";
		}
		if(isdefined(level._effect) && isdefined(level._effect[#"character_fire_death_torso"]))
		{
			self.var_71a7fc1c = util::playfxontag(fieldname, level._effect[#"character_fire_death_torso"], self, str_tag);
		}
	}
	else if(isdefined(self.var_71a7fc1c))
	{
		stopfx(fieldname, self.var_71a7fc1c);
		self.var_71a7fc1c = undefined;
	}
}

/*
	Name: model_rarity_rob
	Namespace: zm_utility
	Checksum: 0xD8B34EC7
	Offset: 0x19F8
	Size: 0x1EC
	Parameters: 7
	Flags: Linked
*/
function model_rarity_rob(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	switch(bwasdemojump)
	{
		case 1:
		{
			self.var_d9e5ccb2 = #"hash_6f1ab68ac78ac2ea";
			break;
		}
		case 2:
		{
			self.var_d9e5ccb2 = #"hash_312ceb838675b80";
			break;
		}
		case 3:
		{
			self.var_d9e5ccb2 = #"hash_70c807782a37573e";
			break;
		}
		case 4:
		{
			self.var_d9e5ccb2 = #"hash_5b08235c0b55a003";
			break;
		}
		case 5:
		{
			self.var_d9e5ccb2 = #"hash_646d58f646eba5ed";
			break;
		}
		case 6:
		{
			self.var_d9e5ccb2 = #"hash_64261dabb4df88cd";
			break;
		}
		case 7:
		{
			self.var_d9e5ccb2 = #"rob_sr_item_gold";
			break;
		}
		case 0:
		default:
		{
			if(isdefined(self.var_d9e5ccb2))
			{
				self stoprenderoverridebundle(self.var_d9e5ccb2);
				self.var_d9e5ccb2 = undefined;
			}
		}
	}
	if(isdefined(self.var_d9e5ccb2))
	{
		self playrenderoverridebundle(self.var_d9e5ccb2);
	}
}

/*
	Name: set_compass_icon
	Namespace: zm_utility
	Checksum: 0xE0D27C94
	Offset: 0x1BF0
	Size: 0x1EE
	Parameters: 7
	Flags: Linked
*/
function set_compass_icon(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		switch(self.model)
		{
			case "hash_94b3a8b935248d0":
			{
				str_objective = #"hash_669c000075d7222";
				break;
			}
			case "hash_49efe3c0dddfa33":
			{
				str_objective = #"hash_1da886c89c2e4073";
				break;
			}
			case "hash_1fc19d4cd59c0246":
			{
				str_objective = #"hash_73705646f7ccc79c";
				break;
			}
			case "hash_3d3aeedc296addd":
			{
				str_objective = #"hash_5ae3492cc261d9c9";
				break;
			}
			case "p9_zm_gold_teleporter_b":
			{
				str_objective = #"hash_48c296f58e75bbc7";
				break;
			}
			case "hash_fc01471c7c27bc9":
			{
				str_objective = #"hash_7ccf11b4a680682a";
				break;
			}
			case "p9_zm_gold_jumppads_machine_sub":
			{
				str_objective = #"hash_7f5d2d61a6f36e5d";
				break;
			}
			default:
			{
				str_objective = #"hash_7ec87a35af8f03b0";
				self zm_wallbuy::function_8f12abec(fieldname);
				break;
			}
		}
		self thread function_a1290dca(fieldname, str_objective);
	}
	else
	{
		self notify(#"hash_1c25e0d8228a5516");
	}
}

/*
	Name: function_a1290dca
	Namespace: zm_utility
	Checksum: 0xBA89A4B2
	Offset: 0x1DE8
	Size: 0x284
	Parameters: 3
	Flags: Linked
*/
function function_a1290dca(localclientnum, str_objective, n_range)
{
	if(!isdefined(n_range))
	{
		n_range = 1500;
	}
	self notify("2e297c20d663935c");
	self endon("2e297c20d663935c");
	self endoncallback(&function_2b04855, #"death", #"hash_1c25e0d8228a5516");
	if(!isdefined(level.var_cef2e607[#"hash_2aeea3ff25adc082"]))
	{
		level.var_cef2e607[#"hash_2aeea3ff25adc082"] = -1;
	}
	level.var_cef2e607[#"hash_2aeea3ff25adc082"]++;
	wait(0.016 * ((level.var_cef2e607[#"hash_2aeea3ff25adc082"] % (int(0.5 / 0.016))) + 1));
	while(true)
	{
		b_player_nearby = 0;
		player = function_5c10bd79(localclientnum);
		if(isdefined(player) && function_9023da2d(player, self, n_range))
		{
			b_player_nearby = 1;
		}
		if(b_player_nearby && !isdefined(self.n_obj_id))
		{
			self.n_obj_id = util::getnextobjid(localclientnum);
			objective_add(localclientnum, self.n_obj_id, "active", str_objective, self.origin);
			objective_onentity(localclientnum, self.n_obj_id, self, 0, 1, 0);
		}
		else if(!b_player_nearby && isdefined(self.n_obj_id))
		{
			util::releaseobjid(localclientnum, self.n_obj_id);
			objective_delete(localclientnum, self.n_obj_id);
			self.n_obj_id = undefined;
		}
		wait(0.5);
	}
}

/*
	Name: function_2b04855
	Namespace: zm_utility
	Checksum: 0x27B8E1C1
	Offset: 0x2078
	Size: 0xDA
	Parameters: 1
	Flags: Linked
*/
function function_2b04855(str_notify)
{
	if(isdefined(self.n_obj_id))
	{
		foreach(localclientnum in function_41bfa501())
		{
			util::releaseobjid(localclientnum, self.n_obj_id);
			objective_delete(localclientnum, self.n_obj_id);
		}
		self.n_obj_id = undefined;
	}
}

/*
	Name: function_9023da2d
	Namespace: zm_utility
	Checksum: 0x882573CC
	Offset: 0x2160
	Size: 0xD2
	Parameters: 3
	Flags: Linked
*/
function function_9023da2d(player, entity, n_range)
{
	if(is_survival())
	{
		n_range = 3000;
	}
	if(distance(player.origin, entity.origin) > n_range)
	{
		return false;
	}
	if(is_survival())
	{
		return true;
	}
	var_27e54ab2 = 160;
	if(abs(player.origin[2] - entity.origin[2]) > var_27e54ab2)
	{
		return false;
	}
	return true;
}

/*
	Name: force_stream_changed
	Namespace: zm_utility
	Checksum: 0x6E002CE9
	Offset: 0x2240
	Size: 0x394
	Parameters: 7
	Flags: Linked
*/
function force_stream_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(level.var_c427e93b))
		{
			level.var_c427e93b = [];
		}
		else if(!isarray(level.var_c427e93b))
		{
			level.var_c427e93b = array(level.var_c427e93b);
		}
		if(!isinarray(level.var_c427e93b, self))
		{
			level.var_c427e93b[level.var_c427e93b.size] = self;
		}
		if(self.model == #"p9_fxanim_zm_gp_dac_xmodel")
		{
			self.var_35f71e38 = array(#"hash_1a9f65484a9fb8de", #"hash_1a9f64484a9fb72b");
		}
		else if(self.model == #"p9_zm_ndu_trial_terminal_01")
		{
			player = function_5c10bd79(fieldname);
			n_ent_num = player getentitynumber();
			switch(n_ent_num)
			{
				case 0:
				default:
				{
					self.var_35f71e38 = array(#"hash_2650753cfce243b4", #"hash_43292371d31fedb3");
					break;
				}
				case 1:
				{
					self.var_35f71e38 = array(#"hash_365ca0e0327ab1e0", #"hash_50312a908be08ab7");
					break;
				}
				case 2:
				{
					self.var_35f71e38 = array(#"hash_1759c27356868ed1", #"hash_2a42c45bfee6fa40");
					break;
				}
				case 3:
				{
					self.var_35f71e38 = array(#"hash_63e150d3e5e0d45e", #"hash_7200223e9e420ef1");
					break;
				}
			}
		}
		self callback::add_entity_callback(#"on_entity_shutdown", &function_1b43e8f6);
	}
	else
	{
		arrayremovevalue(level.var_c427e93b, self);
		if(isdefined(self.model) && self.model != "")
		{
			util::unlock_model(self.model);
			self callback::function_52ac9652(#"on_entity_shutdown", &function_1b43e8f6);
		}
	}
}

/*
	Name: function_1b43e8f6
	Namespace: zm_utility
	Checksum: 0x60A30639
	Offset: 0x25E0
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_1b43e8f6(params)
{
	if(self.model != "")
	{
		util::unlock_model(self.model);
		self callback::function_52ac9652(#"on_entity_shutdown", &function_1b43e8f6);
	}
}

/*
	Name: function_ca960904
	Namespace: zm_utility
	Checksum: 0xB9641C16
	Offset: 0x2658
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_ca960904(machine)
{
	if(!isdefined(level.var_c427e93b))
	{
		level.var_c427e93b = [];
	}
	else if(!isarray(level.var_c427e93b))
	{
		level.var_c427e93b = array(level.var_c427e93b);
	}
	if(!isinarray(level.var_c427e93b, machine))
	{
		level.var_c427e93b[level.var_c427e93b.size] = machine;
	}
}

/*
	Name: function_725e99fb
	Namespace: zm_utility
	Checksum: 0xE1A76FB
	Offset: 0x2708
	Size: 0x4FC
	Parameters: 1
	Flags: Linked
*/
function function_725e99fb(localclientnum)
{
	self notify("72b455cf53461154");
	self endon("72b455cf53461154");
	level endon(#"end_game");
	if(!isdefined(level.var_c427e93b))
	{
		level.var_c427e93b = [];
	}
	/#
		util::init_dvar(#"hash_416069220b5b56e3", 0, &function_3a919d3f);
	#/
	while(true)
	{
		arrayremovevalue(level.var_c427e93b, undefined);
		/#
			if(!getdvarint(#"hash_2769a6109d9d7b4d", 1))
			{
				foreach(machine in level.var_c427e93b)
				{
					if(is_true(machine.var_c02c4d66))
					{
						util::unlock_model(machine.model);
						machine.var_c02c4d66 = undefined;
						if(isarray(machine.var_35f71e38))
						{
							foreach(var_61794186 in machine.var_35f71e38)
							{
								util::unlock_model(var_61794186);
							}
						}
					}
				}
				wait(1);
				continue;
			}
		#/
		foreach(machine in level.var_c427e93b)
		{
			if(!isdefined(machine))
			{
				continue;
			}
			b_player_nearby = 0;
			player = function_5c10bd79(localclientnum);
			if(isdefined(player) && function_7757350c(player, machine))
			{
				b_player_nearby = 1;
			}
			if(isdefined(machine))
			{
				if(b_player_nearby && !is_true(machine.var_c02c4d66))
				{
					util::lock_model(machine.model);
					machine.var_c02c4d66 = 1;
					if(isarray(machine.var_35f71e38))
					{
						foreach(var_61794186 in machine.var_35f71e38)
						{
							util::lock_model(var_61794186);
						}
					}
				}
				else if(!b_player_nearby && is_true(machine.var_c02c4d66))
				{
					util::unlock_model(machine.model);
					machine.var_c02c4d66 = undefined;
					if(isarray(machine.var_35f71e38))
					{
						foreach(var_61794186 in machine.var_35f71e38)
						{
							util::unlock_model(var_61794186);
						}
					}
				}
			}
			waitframe(1);
		}
		waitframe(10);
	}
}

/*
	Name: function_7757350c
	Namespace: zm_utility
	Checksum: 0x9B083792
	Offset: 0x2C10
	Size: 0x118
	Parameters: 2
	Flags: Linked
*/
function function_7757350c(player, machine)
{
	v_midpoint = machine function_2cfe56d8();
	v_eye = player geteye();
	n_height_diff = abs(v_eye[2] - v_midpoint[2]);
	if(n_height_diff < 140 && distance2dsquared(v_eye, v_midpoint) < 360000)
	{
		return true;
	}
	if(util::within_fov(v_eye, player.angles, v_midpoint, 0.75) && bullettracepassed(v_eye, v_midpoint, 0, machine, player))
	{
		return true;
	}
	return false;
}

/*
	Name: function_2cfe56d8
	Namespace: zm_utility
	Checksum: 0x91B6231F
	Offset: 0x2D30
	Size: 0x4A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_2cfe56d8()
{
	v_midpoint = (self.origin + vectorscale((0, 0, 1), 24)) + (anglestoforward(self.angles) * 24);
	return v_midpoint;
}

/*
	Name: function_3a919d3f
	Namespace: zm_utility
	Checksum: 0x11325939
	Offset: 0x2D88
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function function_3a919d3f(params)
{
	/#
		if(int(params.value))
		{
			level thread function_538799c4();
		}
		else
		{
			level notify(#"hash_a8ed1dd0750e229");
		}
	#/
}

/*
	Name: function_538799c4
	Namespace: zm_utility
	Checksum: 0x3028230A
	Offset: 0x2DF0
	Size: 0x26A
	Parameters: 0
	Flags: Private
*/
function private function_538799c4()
{
	/#
		level notify(#"hash_a8ed1dd0750e229");
		level endon(#"hash_a8ed1dd0750e229");
		while(true)
		{
			if(getdvarint(#"hash_416069220b5b56e3", 0))
			{
				i = 0;
				debug2dtext((325, 200, 0) + (vectorscale((0, 1, 0), 20) * (i + 1)), "", (0, 1, 0));
				foreach(e_machine in level.var_c427e93b)
				{
					if(isdefined(e_machine))
					{
						v_midpoint = e_machine function_2cfe56d8();
						i++;
						if(is_true(e_machine.var_c02c4d66))
						{
							debug2dtext((325, 200, 0) + (vectorscale((0, 1, 0), 20) * (i + 1)), function_9e72a96(e_machine.model), (0, 1, 0));
							circle(v_midpoint, 64, (0, 1, 0));
							continue;
						}
						debug2dtext((325, 200, 0) + (vectorscale((0, 1, 0), 20) * (i + 1)), function_9e72a96(e_machine.model), (1, 0, 0));
						circle(v_midpoint, 64, (1, 0, 0));
					}
				}
			}
			waitframe(1);
		}
	#/
}

