#using script_12282e6b2cc91b42;
#using script_158d50d476435605;
#using script_18a9e529264a3d29;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_utility;

/*
	Name: function_89f2df9
	Namespace: zm_utility
	Checksum: 0xB5911E48
	Offset: 0x270
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_utility", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_utility
	Checksum: 0x5AAC2B40
	Offset: 0x2C8
	Size: 0x4A4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level._effect[#"hash_7dc0459342cedaa4"] = #"hash_3002526b7ff53cbf";
	clientfield::function_a8bbc967("hudItems.armorType", #"hud_items", #"hash_789d8c10ac21687c", 1, 2, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.armorPercent", #"hud_items", #"armorpercent", 1, 7, "float", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.scrap", #"hud_items", #"scrap", 1, 16, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("hudItems.rareScrap", #"hud_items", #"hash_d6fdfc12ead24ba", 1, 16, "int", undefined, 0, 0);
	clientfield::function_a8bbc967("pap_current", #"zm_hud", #"hash_64f2ff2ddddbe9c7", 1, 2, "int", undefined, 0, 0);
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
	Checksum: 0x40DDF1E9
	Offset: 0x778
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
	Offset: 0x7A8
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
	Checksum: 0x46C17708
	Offset: 0x7B8
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
	Checksum: 0x7AB57C15
	Offset: 0x820
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
	Checksum: 0x7458277D
	Offset: 0x830
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
	Checksum: 0x83B80405
	Offset: 0x878
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
	Checksum: 0xB7591FBE
	Offset: 0x8E0
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
	Checksum: 0x89656837
	Offset: 0x928
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
	Checksum: 0xC117BC16
	Offset: 0xA10
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
	Checksum: 0xE16ADC41
	Offset: 0xAB8
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_classic()
{
	str_gametype = util::function_5df4294();
	if(str_gametype == #"zclassic")
	{
		return true;
	}
	return false;
}

/*
	Name: is_survival
	Namespace: zm_utility
	Checksum: 0x46B009AA
	Offset: 0xB00
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_survival()
{
	str_gametype = util::function_5df4294();
	if(str_gametype == #"zsurvival")
	{
		return true;
	}
	return false;
}

/*
	Name: is_standard
	Namespace: zm_utility
	Checksum: 0xADC984AA
	Offset: 0xB48
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_standard()
{
	str_gametype = util::function_5df4294();
	if(str_gametype == #"zstandard")
	{
		return true;
	}
	return false;
}

/*
	Name: is_trials
	Namespace: zm_utility
	Checksum: 0x28198E9D
	Offset: 0xB90
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function is_trials()
{
	str_gametype = util::function_5df4294();
	if(str_gametype == #"ztrials" || level flag::exists(#"ztrial"))
	{
		return true;
	}
	return false;
}

/*
	Name: is_tutorial
	Namespace: zm_utility
	Checksum: 0x766F6C55
	Offset: 0xC00
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_tutorial()
{
	str_gametype = util::function_5df4294();
	if(str_gametype == #"ztutorial")
	{
		return true;
	}
	return false;
}

/*
	Name: is_grief
	Namespace: zm_utility
	Checksum: 0x635113D1
	Offset: 0xC48
	Size: 0x40
	Parameters: 0
	Flags: None
*/
function is_grief()
{
	str_gametype = util::function_5df4294();
	if(str_gametype == #"zgrief")
	{
		return true;
	}
	return false;
}

/*
	Name: is_gametype_active
	Namespace: zm_utility
	Checksum: 0xE854D362
	Offset: 0xC90
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
		if(util::function_5df4294() == a_gametypes[i])
		{
			b_is_gametype_active = 1;
		}
	}
	return b_is_gametype_active;
}

/*
	Name: function_e51dc2d8
	Namespace: zm_utility
	Checksum: 0xFC135808
	Offset: 0xD30
	Size: 0x6A
	Parameters: 0
	Flags: None
*/
function function_e51dc2d8()
{
	if(!getdvarint(#"hash_2992299f853b2039", 0))
	{
		return false;
	}
	if(!namespace_59ff1d6c::function_901b751c(#"hash_3c5363541b97ca3e"))
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
	Checksum: 0x899D1B44
	Offset: 0xDA8
	Size: 0x3E
	Parameters: 0
	Flags: None
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
	Checksum: 0xEEDEEEEE
	Offset: 0xDF0
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
	Checksum: 0xF7D50322
	Offset: 0xEA0
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
	Checksum: 0x108E2ADD
	Offset: 0xF30
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
	Checksum: 0x4735037F
	Offset: 0x1028
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
	Checksum: 0x4D7AAD23
	Offset: 0x12A8
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
	Checksum: 0x28D492A9
	Offset: 0x1370
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
	Checksum: 0x11204372
	Offset: 0x14C8
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
	Checksum: 0x6BC299C6
	Offset: 0x15D8
	Size: 0xFE
	Parameters: 3
	Flags: None
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
	Name: function_90500af5
	Namespace: zm_utility
	Checksum: 0xE5764FA9
	Offset: 0x16E0
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_90500af5()
{
	return namespace_cb7cafc3::function_90500af5();
}

/*
	Name: function_166646a6
	Namespace: zm_utility
	Checksum: 0xF988CD99
	Offset: 0x1700
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function function_166646a6()
{
	return namespace_cb7cafc3::function_166646a6();
}

/*
	Name: zm_zone_out_of_bounds
	Namespace: zm_utility
	Checksum: 0xC4DAC0DA
	Offset: 0x1720
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
	Checksum: 0x95CE9FC6
	Offset: 0x1878
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
	Checksum: 0x3056ABBF
	Offset: 0x19D0
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
			self.var_d9e5ccb2 = #"hash_7bed6d31a7d8d425";
			break;
		}
		case 0:
		default:
		{
			if(isdefined(self.var_d9e5ccb2))
			{
				self function_5d482e78(self.var_d9e5ccb2);
				self.var_d9e5ccb2 = undefined;
			}
		}
	}
	if(isdefined(self.var_d9e5ccb2))
	{
		self function_bf9d3071(self.var_d9e5ccb2);
	}
}

/*
	Name: set_compass_icon
	Namespace: zm_utility
	Checksum: 0xB339ACE5
	Offset: 0x1BC8
	Size: 0xE6
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
			default:
			{
				str_objective = #"hash_7ec87a35af8f03b0";
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
	Checksum: 0xD0240738
	Offset: 0x1CB8
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
	self notify("65a252058e73abde");
	self endon("65a252058e73abde");
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
	Checksum: 0x5053C154
	Offset: 0x1F48
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
	Checksum: 0x31F1FA4C
	Offset: 0x2030
	Size: 0x8A
	Parameters: 3
	Flags: Linked
*/
function function_9023da2d(player, entity, n_range)
{
	if(distance(player.origin, entity.origin) > n_range)
	{
		return false;
	}
	if(abs(player.origin[2] - entity.origin[2]) > 160)
	{
		return false;
	}
	return true;
}

/*
	Name: force_stream_changed
	Namespace: zm_utility
	Checksum: 0x8F48BAA8
	Offset: 0x20C8
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
	Checksum: 0x7E9D9BD2
	Offset: 0x2468
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
	Checksum: 0x80E146DA
	Offset: 0x24E0
	Size: 0xA8
	Parameters: 1
	Flags: None
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
	Checksum: 0x26696EC5
	Offset: 0x2590
	Size: 0x4FC
	Parameters: 1
	Flags: Linked
*/
function function_725e99fb(localclientnum)
{
	self notify("4c71c08a0179fb2f");
	self endon("4c71c08a0179fb2f");
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
	Checksum: 0xCA5606DB
	Offset: 0x2A98
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
	Checksum: 0x32EC54C6
	Offset: 0x2BB8
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
	Checksum: 0x7BA396E
	Offset: 0x2C10
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
	Checksum: 0x5E2AF75E
	Offset: 0x2C78
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
				foreach(var_b8055433 in level.var_c427e93b)
				{
					if(isdefined(var_b8055433))
					{
						v_midpoint = var_b8055433 function_2cfe56d8();
						i++;
						if(is_true(var_b8055433.var_c02c4d66))
						{
							debug2dtext((325, 200, 0) + (vectorscale((0, 1, 0), 20) * (i + 1)), function_9e72a96(var_b8055433.model), (0, 1, 0));
							circle(v_midpoint, 64, (0, 1, 0));
							continue;
						}
						debug2dtext((325, 200, 0) + (vectorscale((0, 1, 0), 20) * (i + 1)), function_9e72a96(var_b8055433.model), (1, 0, 0));
						circle(v_midpoint, 64, (1, 0, 0));
					}
				}
			}
			waitframe(1);
		}
	#/
}

