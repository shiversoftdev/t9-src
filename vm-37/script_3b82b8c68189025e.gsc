#using script_32399001bdb550da;
#using script_3dc93ca9902a9cda;
#using scripts\cp_common\bb.gsc;
#using script_4937c6974f43bb71;
#using scripts\cp_common\gametypes\globallogic_ui.gsc;
#using script_7d0013bbc05623b9;
#using script_35ae72be7b4fec10;
#using scripts\cp_common\objectives.gsc;
#using script_263b7f2982258785;
#using scripts\cp_common\util.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace dialog_tree;

/*
	Name: __init__system__
	Namespace: dialog_tree
	Checksum: 0x8D7D7549
	Offset: 0x468
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("dialog_tree", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: dialog_tree
	Checksum: 0xE5B34849
	Offset: 0x4A8
	Size: 0x164
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "dt_set_fov", 1, 3, "int");
	clientfield::register("toplayer", "dt_set_dof", 1, 3, "int");
	clientfield::register("toplayer", "dt_set_hide_reticle_dot", 1, 1, "int");
	level.var_fb0a6829 = [];
	level.var_fb0a6829[#"default"] = 1;
	level.var_fb0a6829[#"hash_2e64a3fb2ff83fc4"] = 2;
	level.var_fb0a6829[#"zoom"] = 3;
	level.var_fb0a6829[#"hash_1f696e4d7cf0d49a"] = 4;
	level.var_fb0a6829[#"hash_4955e2f107b32533"] = 5;
	level.var_22817c8a[#"none"] = 1;
	level.var_22817c8a[#"close"] = 2;
	level.var_22817c8a[#"medium"] = 3;
}

/*
	Name: function_82b16606
	Namespace: dialog_tree
	Checksum: 0xCAB00F5B
	Offset: 0x618
	Size: 0x1D2
	Parameters: 7
	Flags: None
*/
function function_82b16606(enter_func, exit_func, allow_movement, allow_weapon, script_bundle, var_4d84ed71, timeout)
{
	if(!isdefined(enter_func))
	{
		enter_func = undefined;
	}
	if(!isdefined(exit_func))
	{
		exit_func = undefined;
	}
	if(!isdefined(allow_movement))
	{
		allow_movement = 0;
	}
	if(!isdefined(allow_weapon))
	{
		allow_weapon = 0;
	}
	if(!isdefined(var_4d84ed71))
	{
		var_4d84ed71 = 1;
	}
	if(!isdefined(timeout))
	{
		timeout = 0;
	}
	if(!isdefined(level.var_d5314f55))
	{
		level.var_d5314f55 = [];
	}
	var_5bc64970 = spawnstruct();
	var_5bc64970.var_f5af9940 = 0;
	var_5bc64970.player_pos = [];
	var_5bc64970.enter_func = enter_func;
	var_5bc64970.exit_func = exit_func;
	var_5bc64970.allow_movement = allow_movement;
	var_5bc64970.allow_weapon = allow_weapon;
	var_5bc64970.var_4d84ed71 = var_4d84ed71;
	var_5bc64970.timeout = timeout;
	var_5bc64970.options = [];
	var_5bc64970.position = array(1224, 650);
	var_5bc64970.var_9c958fe3 = 0;
	var_5bc64970.var_6755136a = 0;
	var_5bc64970.var_6c2428f4 = #"hash_23c2f3c5f7013d69";
	var_5bc64970 function_f95fa448(script_bundle);
	var_ed170ba3 = level.var_d5314f55.size;
	level.var_d5314f55[var_ed170ba3] = var_5bc64970;
	var_5bc64970.var_ec3cbc15 = 0;
	return var_5bc64970;
}

/*
	Name: function_f95fa448
	Namespace: dialog_tree
	Checksum: 0xFD3CA4CA
	Offset: 0x7F8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_f95fa448(bundle)
{
	self.scriptbundle = bundle;
}

/*
	Name: function_58d27b23
	Namespace: dialog_tree
	Checksum: 0x9CF603C2
	Offset: 0x820
	Size: 0x112
	Parameters: 10
	Flags: None
*/
function function_58d27b23(option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_3fa65bba, var_d3d10c6d, skip_func)
{
	if(!isdefined(var_cfef5030))
	{
		var_cfef5030 = undefined;
	}
	if(!isdefined(ai_anim))
	{
		ai_anim = undefined;
	}
	if(!isdefined(var_a0ee58ce))
	{
		var_a0ee58ce = undefined;
	}
	if(!isdefined(var_6728c4b3))
	{
		var_6728c4b3 = 0;
	}
	if(!isdefined(set_flag))
	{
		set_flag = undefined;
	}
	if(!isdefined(var_a16c9b3f))
	{
		var_a16c9b3f = undefined;
	}
	if(!isdefined(var_3fa65bba))
	{
		var_3fa65bba = undefined;
	}
	if(!isdefined(skip_func))
	{
		skip_func = undefined;
	}
	option = function_98927b7b(undefined, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, undefined, var_3fa65bba, var_d3d10c6d, skip_func);
	return self function_d602cdd7(option);
}

/*
	Name: function_6bbbf87
	Namespace: dialog_tree
	Checksum: 0x6C735920
	Offset: 0x940
	Size: 0xB2
	Parameters: 11
	Flags: None
*/
function function_6bbbf87(var_9ddc06f5, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_3fa65bba, var_d3d10c6d, skip_func)
{
	if(!isdefined(skip_func))
	{
		skip_func = undefined;
	}
	option = function_98927b7b(undefined, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_9ddc06f5, var_3fa65bba, var_d3d10c6d, skip_func);
	return self function_d602cdd7(option);
}

/*
	Name: function_7fe78745
	Namespace: dialog_tree
	Checksum: 0x77D4B6F0
	Offset: 0xA00
	Size: 0xE2
	Parameters: 13
	Flags: None
*/
function function_7fe78745(var_84fa2307, var_c275310d, reset, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_3fa65bba, var_d3d10c6d, skip_func)
{
	if(!isdefined(reset))
	{
		reset = 1;
	}
	if(!isdefined(skip_func))
	{
		skip_func = undefined;
	}
	option = function_98927b7b(undefined, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, undefined, var_3fa65bba, var_d3d10c6d, skip_func, 0, var_84fa2307, var_c275310d, reset);
	return self function_d602cdd7(option);
}

/*
	Name: function_9e36808
	Namespace: dialog_tree
	Checksum: 0x8D3522C
	Offset: 0xAF0
	Size: 0xDA
	Parameters: 10
	Flags: None
*/
function function_9e36808(option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_3fa65bba, var_d3d10c6d, skip_func)
{
	if(!isdefined(skip_func))
	{
		skip_func = undefined;
	}
	var_1307f204 = self.options.size - 1;
	option = function_98927b7b(var_1307f204, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, undefined, var_3fa65bba, var_d3d10c6d, skip_func);
	option.active = 0;
	return self function_d602cdd7(option);
}

/*
	Name: function_ad98a815
	Namespace: dialog_tree
	Checksum: 0x41F8861B
	Offset: 0xBD8
	Size: 0xC2
	Parameters: 11
	Flags: None
*/
function function_ad98a815(var_1307f204, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_3fa65bba, var_d3d10c6d, skip_func)
{
	if(!isdefined(skip_func))
	{
		skip_func = undefined;
	}
	option = function_98927b7b(var_1307f204, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, undefined, var_3fa65bba, var_d3d10c6d, skip_func);
	option.active = 0;
	return self function_d602cdd7(option);
}

/*
	Name: function_f5d1891
	Namespace: dialog_tree
	Checksum: 0x2032BDE4
	Offset: 0xCA8
	Size: 0xE2
	Parameters: 11
	Flags: None
*/
function function_f5d1891(var_9ddc06f5, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_3fa65bba, var_d3d10c6d, skip_func)
{
	if(!isdefined(skip_func))
	{
		skip_func = undefined;
	}
	var_1307f204 = self.options.size - 1;
	option = function_98927b7b(var_1307f204, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_9ddc06f5, var_3fa65bba, var_d3d10c6d, skip_func);
	option.active = 0;
	return self function_d602cdd7(option);
}

/*
	Name: function_da884b08
	Namespace: dialog_tree
	Checksum: 0x6D19FBDE
	Offset: 0xD98
	Size: 0xCA
	Parameters: 12
	Flags: None
*/
function function_da884b08(var_1307f204, var_9ddc06f5, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_3fa65bba, var_d3d10c6d, skip_func)
{
	if(!isdefined(skip_func))
	{
		skip_func = undefined;
	}
	option = function_98927b7b(var_1307f204, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_9ddc06f5, var_3fa65bba, var_d3d10c6d, skip_func);
	option.active = 0;
	return self function_d602cdd7(option);
}

/*
	Name: function_6cbfa3d2
	Namespace: dialog_tree
	Checksum: 0xF4EAA73B
	Offset: 0xE70
	Size: 0x56
	Parameters: 2
	Flags: None
*/
function function_6cbfa3d2(var_e728c53, var_6728c4b3)
{
	if(!isdefined(var_6728c4b3))
	{
		var_6728c4b3 = 1;
	}
	if(!isdefined(var_e728c53))
	{
		var_e728c53 = self.options.size - 1;
	}
	self.options[var_e728c53].var_6728c4b3 = var_6728c4b3;
}

/*
	Name: function_6ebd37a4
	Namespace: dialog_tree
	Checksum: 0x5DE78606
	Offset: 0xED0
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_6ebd37a4(var_e728c53)
{
	if(!isdefined(var_e728c53))
	{
		var_e728c53 = self.options.size - 1;
	}
	self.options[var_e728c53].important = 1;
}

/*
	Name: function_bc7c03bf
	Namespace: dialog_tree
	Checksum: 0x2C0D9C98
	Offset: 0xF20
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function function_bc7c03bf(var_e728c53)
{
	if(!isdefined(var_e728c53))
	{
		var_e728c53 = self.options.size - 1;
	}
	self.options[var_e728c53].var_5741b81f = 1;
}

/*
	Name: function_46f25b65
	Namespace: dialog_tree
	Checksum: 0x2D966877
	Offset: 0xF70
	Size: 0x25E
	Parameters: 5
	Flags: None
*/
function function_46f25b65(var_e728c53, var_a5bdf9c0, var_cfd168ce, var_2f04fa05, anims)
{
	if(!isdefined(var_a5bdf9c0))
	{
		var_a5bdf9c0 = 0;
	}
	if(!isdefined(var_cfd168ce))
	{
		var_cfd168ce = "loop";
	}
	if(!isdefined(var_2f04fa05))
	{
		var_2f04fa05 = 1;
	}
	if(!isdefined(anims))
	{
		anims = 1;
	}
	if(!isdefined(var_e728c53))
	{
		var_e728c53 = self.options.size - 1;
	}
	self.options[var_e728c53].var_cfd168ce = var_cfd168ce;
	if(var_2f04fa05)
	{
		if(isdefined(self.options[var_e728c53].var_f8340c5b))
		{
			if(!isarray(self.options[var_e728c53].var_f8340c5b))
			{
				self.options[var_e728c53].var_f8340c5b = [0:self.options[var_e728c53].var_f8340c5b];
			}
			if(var_a5bdf9c0)
			{
				self.options[var_e728c53].var_529974ff = randomint(self.options[var_e728c53].var_f8340c5b.size);
			}
			else
			{
				self.options[var_e728c53].var_529974ff = 0;
			}
		}
	}
	if(anims)
	{
		if(isdefined(self.options[var_e728c53].var_25b61283))
		{
			if(!isarray(self.options[var_e728c53].var_25b61283))
			{
				self.options[var_e728c53].var_25b61283 = [0:self.options[var_e728c53].var_25b61283];
			}
			if(var_a5bdf9c0)
			{
				self.options[var_e728c53].cur_anim = randomint(self.options[var_e728c53].var_25b61283.size);
			}
			else
			{
				self.options[var_e728c53].cur_anim = 0;
			}
		}
	}
}

/*
	Name: function_a3a3ea7d
	Namespace: dialog_tree
	Checksum: 0xAB3079ED
	Offset: 0x11D8
	Size: 0x5E
	Parameters: 2
	Flags: None
*/
function function_a3a3ea7d(message, var_b5df2c8b)
{
	self.var_6755136a = 1;
	if(isdefined(message))
	{
		self.var_6c2428f4 = message;
	}
	if(isdefined(var_b5df2c8b))
	{
		level flag::wait_till(var_b5df2c8b);
		self.var_6755136a = 0;
	}
}

/*
	Name: function_b32b7f64
	Namespace: dialog_tree
	Checksum: 0x61C0891D
	Offset: 0x1240
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function function_b32b7f64()
{
	self.var_6755136a = 0;
}

/*
	Name: function_21780fc5
	Namespace: dialog_tree
	Checksum: 0xBE87AC01
	Offset: 0x1258
	Size: 0x9A
	Parameters: 2
	Flags: None
*/
function function_21780fc5(dialog_tree, var_a9b0cfdc)
{
	/#
		assert(isdefined(dialog_tree) && isarray(var_a9b0cfdc) && isint(var_a9b0cfdc[0]) && isint(var_a9b0cfdc[1]), "");
	#/
	dialog_tree.position = var_a9b0cfdc;
}

/*
	Name: function_6bb91351
	Namespace: dialog_tree
	Checksum: 0xE11EB88B
	Offset: 0x1300
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function function_6bb91351(var_9c958fe3)
{
	self.var_9c958fe3 = var_9c958fe3;
}

/*
	Name: function_b82713b8
	Namespace: dialog_tree
	Checksum: 0x5306FBE5
	Offset: 0x1328
	Size: 0x160
	Parameters: 10
	Flags: None
*/
function function_b82713b8(player_loc, var_f2aae3f7, var_dfe2a95d, var_60a7aecc, stance, fov, dof, lerptime, var_6549d3f9, var_aefbf05f)
{
	if(!isdefined(stance))
	{
		stance = "stand";
	}
	if(!isdefined(fov))
	{
		fov = "zoom";
	}
	if(!isdefined(dof))
	{
		dof = "medium";
	}
	if(!isdefined(lerptime))
	{
		lerptime = 2;
	}
	new_pos = spawnstruct();
	new_pos.player_loc = player_loc;
	new_pos.var_f2aae3f7 = var_f2aae3f7;
	new_pos.var_9d5a3b8f = var_dfe2a95d;
	new_pos.var_60a7aecc = var_60a7aecc;
	new_pos.stance = stance;
	new_pos.origin = player_loc.origin;
	new_pos.fov = fov;
	new_pos.dof = dof;
	new_pos.lerptime = lerptime;
	new_pos.var_6549d3f9 = var_6549d3f9;
	new_pos.var_aefbf05f = var_aefbf05f;
	self.player_pos[self.player_pos.size] = new_pos;
}

/*
	Name: function_decf2123
	Namespace: dialog_tree
	Checksum: 0xEE7FB5A2
	Offset: 0x1490
	Size: 0x17A
	Parameters: 3
	Flags: Private
*/
function private function_decf2123(var_8b3554e5, var_16f87bfa, var_66a25c9b)
{
	var_3e4ad1c8 = var_8b3554e5;
	var_8b3554e5++;
	if(var_8b3554e5 >= var_16f87bfa)
	{
		var_8b3554e5 = 0;
		switch(var_66a25c9b)
		{
			case "hash_c8920743575bcda":
			{
				var_8b3554e5 = 1;
				break;
			}
			case "hash_586e0a0830a2eaaf":
			{
				var_8b3554e5 = var_3e4ad1c8;
				break;
			}
			case "randomize":
			{
				var_8b3554e5 = randomint(var_16f87bfa);
				break;
			}
			case "randomize_skip_first":
			{
				var_8b3554e5 = (randomint(var_16f87bfa - 1)) + 1;
				break;
			}
		}
		if(var_66a25c9b == "randomize" || var_66a25c9b == "randomize_skip_first")
		{
			var_b1846b51 = 0;
			if(var_66a25c9b == "randomize_skip_first")
			{
				var_b1846b51 = 1;
			}
			if(var_8b3554e5 == var_3e4ad1c8)
			{
				var_8b3554e5++;
				if(var_8b3554e5 >= var_16f87bfa)
				{
					var_8b3554e5 = var_b1846b51;
				}
			}
		}
		var_8b3554e5 = math::clamp(var_8b3554e5, 0, var_16f87bfa - 1);
	}
	return var_8b3554e5;
}

/*
	Name: function_a92530c0
	Namespace: dialog_tree
	Checksum: 0xEB9073BB
	Offset: 0x1618
	Size: 0x624
	Parameters: 2
	Flags: Private
*/
function private function_a92530c0(ai_actor, anim_struct)
{
	player = self.activator;
	if(isdefined(self.player_pos) && self.player_pos.size > 0)
	{
		foreach(pos in self.player_pos)
		{
			/#
			#/
			if(!isdefined(pos.player_loc))
			{
				var_b0a7849f = struct::spawn();
				var_b0a7849f.origin = ai_actor.origin;
				var_b0a7849f.angles = ai_actor.angles;
				if(isdefined(pos.var_f2aae3f7))
				{
					var_7f0ec05a = function_b8031554(ai_actor, anim_struct, self.scriptbundle, pos.var_f2aae3f7);
					if(isdefined(var_7f0ec05a))
					{
						var_b0a7849f = var_7f0ec05a;
					}
				}
				pos.player_loc = struct::spawn((var_b0a7849f.origin + (anglestoforward(var_b0a7849f.angles) * 56)) + (anglestoright(var_b0a7849f.angles) * -10), var_b0a7849f.angles + vectorscale((0, 1, 0), 180));
				pos.origin = pos.player_loc.origin;
			}
		}
		var_bb76606c = arraygetclosest(player.origin, self.player_pos);
		self.var_c7af782 = var_bb76606c;
		/#
		#/
		if(isdefined(var_bb76606c.stance))
		{
			switch(var_bb76606c.stance)
			{
				case "stand":
				{
					self.activator val::set(#"dialog_tree", "allow_crouch", 0);
					self.activator val::set(#"dialog_tree", "allow_prone", 0);
					self.activator val::set(#"dialog_tree", "allow_stand", 1);
					break;
				}
				case "crouch":
				{
					self.activator val::set(#"dialog_tree", "allow_crouch", 1);
					self.activator val::set(#"dialog_tree", "allow_prone", 0);
					self.activator val::set(#"dialog_tree", "allow_stand", 0);
					break;
				}
				case "prone":
				{
					self.activator val::set(#"dialog_tree", "allow_crouch", 0);
					self.activator val::set(#"dialog_tree", "allow_prone", 1);
					self.activator val::set(#"dialog_tree", "allow_stand", 0);
					break;
				}
			}
			player setstance(var_bb76606c.stance);
		}
		self.var_bc205c58 = player util::spawn_model("tag_origin", var_bb76606c.player_loc.origin, var_bb76606c.player_loc.angles);
		self.var_bc205c58 dontinterpolate();
		if(isdefined(var_bb76606c.fov) && isdefined(level.var_fb0a6829[var_bb76606c.fov]))
		{
			player thread clientfield::set_to_player("dt_set_fov", level.var_fb0a6829[var_bb76606c.fov]);
		}
		if(isdefined(var_bb76606c.dof) && isdefined(level.var_22817c8a[var_bb76606c.dof]))
		{
			player thread clientfield::set_to_player("dt_set_dof", level.var_22817c8a[var_bb76606c.dof]);
		}
		if(isai(ai_actor))
		{
			ai_actor thread ai::look_at(player);
		}
		player playerlinktoblend(self.var_bc205c58, "tag_origin", 2, 0.4, 0.4);
		self thread function_edd56700(player);
		self function_2ae0f2f5(ai_actor, anim_struct, var_bb76606c);
	}
}

/*
	Name: function_edd56700
	Namespace: dialog_tree
	Checksum: 0x8B1E0795
	Offset: 0x1C48
	Size: 0x7E
	Parameters: 1
	Flags: Private
*/
function private function_edd56700(player)
{
	wait(2);
	if(!self.allow_movement)
	{
		player playerlinktodelta(self.var_bc205c58, "tag_origin", 1, 10, 10, 5, 5, 1, 1);
	}
	else
	{
		player unlink();
		self.var_bc205c58 = undefined;
	}
}

/*
	Name: function_b8031554
	Namespace: dialog_tree
	Checksum: 0x9402DBC8
	Offset: 0x1CD0
	Size: 0x1A8
	Parameters: 4
	Flags: None
*/
function function_b8031554(ai_actor, struct, scene, shot)
{
	if(isdefined(struct) && isdefined(scene) && isdefined(shot))
	{
		fakeai = util::spawn_anim_model(struct.model, struct.origin, struct.angles);
		fakeai.animname = struct.animname;
		fakeai.targetname = struct.targetname;
		fakeai makefakeai();
		fakeai hide();
		fakeai scene::play_from_time(scene, shot, [0:fakeai], 1, 1, 1);
		fakeai dontinterpolate();
		wait(0.05);
		var_5939f953 = struct::spawn();
		var_5939f953.origin = fakeai.origin;
		var_5939f953.angles = fakeai gettagangles("tag_origin");
		var_5939f953.var_38d4ed7 = fakeai gettagorigin("j_head");
		fakeai delete();
		return var_5939f953;
	}
	return undefined;
}

/*
	Name: function_2ae0f2f5
	Namespace: dialog_tree
	Checksum: 0xDD28EEFA
	Offset: 0x1E88
	Size: 0xEC
	Parameters: 3
	Flags: Private
*/
function private function_2ae0f2f5(ai_actor, struct, player_pos)
{
	bundle = self.scriptbundle;
	if(isdefined(player_pos.var_7318f7f0))
	{
		bundle = player_pos.var_7318f7f0;
	}
	if(isdefined(player_pos.var_aefbf05f))
	{
		struct = player_pos.var_aefbf05f;
	}
	if(isdefined(bundle))
	{
		if(isdefined(player_pos.var_f2aae3f7))
		{
			struct scene::play(bundle, player_pos.var_f2aae3f7, [0:ai_actor]);
		}
		if(isdefined(player_pos.var_9d5a3b8f))
		{
			struct thread scene::play(bundle, player_pos.var_9d5a3b8f, [0:ai_actor]);
		}
	}
}

/*
	Name: function_86a1bed2
	Namespace: dialog_tree
	Checksum: 0xE0105134
	Offset: 0x1F80
	Size: 0x16C
	Parameters: 3
	Flags: Private
*/
function private function_86a1bed2(ai_actor, struct, player_pos)
{
	if(isdefined(player_pos))
	{
		bundle = self.scriptbundle;
		if(isai(ai_actor))
		{
			ai_actor thread ai::look_at(undefined);
			ai_actor lookatentity();
		}
		if(isdefined(player_pos.fov))
		{
			self.activator thread clientfield::set_to_player("dt_set_fov", 1);
		}
		if(isdefined(player_pos.dof))
		{
			self.activator thread clientfield::set_to_player("dt_set_dof", 1);
		}
		if(isdefined(player_pos.var_7318f7f0))
		{
			bundle = player_pos.var_7318f7f0;
		}
		if(isdefined(player_pos.var_aefbf05f))
		{
			struct = player_pos.var_aefbf05f;
		}
		if(isdefined(bundle))
		{
			if(isdefined(player_pos.var_60a7aecc))
			{
				struct scene::play(bundle, player_pos.var_60a7aecc, [0:ai_actor]);
			}
		}
	}
}

/*
	Name: function_cfa96cee
	Namespace: dialog_tree
	Checksum: 0xC90D039B
	Offset: 0x20F8
	Size: 0x29C
	Parameters: 9
	Flags: None
*/
function function_cfa96cee(dialog_tree, anim_struct, timer, var_b98e33f, var_9897a186, var_a4b4cae2, var_7f8e2bfe, var_6c457e26, var_5bab29d8)
{
	if(!isdefined(var_b98e33f))
	{
		var_b98e33f = "dialog_wait_cancel";
	}
	if(!isdefined(var_9897a186))
	{
		var_9897a186 = 80;
	}
	if(!isdefined(var_a4b4cae2))
	{
		var_a4b4cae2 = 200;
	}
	if(!isdefined(var_7f8e2bfe))
	{
		var_7f8e2bfe = 0;
	}
	if(!isdefined(var_6c457e26))
	{
		var_6c457e26 = vectorscale((1, 0, 0), 6);
	}
	if(!isdefined(var_5bab29d8))
	{
		var_5bab29d8 = 0;
	}
	if(isdefined(self) && (isai(self) && !isalive(self)))
	{
		/#
			println(("" + self.name) + "");
		#/
		return;
	}
	self.radius = 2.5;
	if(self haspart("j_spine4"))
	{
		tagname = "j_spine4";
	}
	else
	{
		tagname = undefined;
	}
	var_c93a00f2 = #"hash_1e07715d6a5dfbe0";
	self util::create_cursor_hint(tagname, var_6c457e26, var_c93a00f2, var_9897a186, undefined, undefined, undefined, var_a4b4cae2, var_7f8e2bfe);
	self prompts::function_92127496(1);
	self prompts::function_1a5e1da6(#"use", 1);
	msg = undefined;
	msg = self waittill(#"trigger", #"death", #"hash_15ec42f1846ef9d0", #"deleted", var_b98e33f);
	if(msg._notify == "trigger")
	{
		return dialog_tree run(self, anim_struct, timer, msg.activator, var_5bab29d8);
	}
	self util::remove_cursor_hint();
}

/*
	Name: run
	Namespace: dialog_tree
	Checksum: 0xB3E9A33A
	Offset: 0x23A0
	Size: 0x1318
	Parameters: 7
	Flags: None
*/
function run(ai_actor, anim_struct, timer, activator, var_5bab29d8, var_cf6d95c9, var_5738c83e)
{
	if(!isdefined(var_5bab29d8))
	{
		var_5bab29d8 = 0;
	}
	if(!isdefined(var_cf6d95c9))
	{
		var_cf6d95c9 = 4;
	}
	if(!isdefined(var_5738c83e))
	{
		var_5738c83e = 0;
	}
	/#
		assert(isarray(self.options));
	#/
	if(!isdefined(ai_actor))
	{
		ai_actor = level;
	}
	self.ai_actor = ai_actor;
	if(isdefined(activator) && isplayer(activator))
	{
		self.activator = activator;
	}
	else
	{
		self.activator = getplayers()[0];
	}
	globallogic_ui::function_9ed5232e("ActorOverheadNames.0.hidden", 1);
	self.activator val::set(#"dialog_tree", "show_crosshair", 0);
	if(self.var_6755136a || !savegame::function_51c242e9(1) && !var_5bab29d8)
	{
		self.activator util::show_hint_text(self.var_6c2428f4);
		wait(3);
		return -1;
	}
	ai_actor notify(#"hash_4d2471e4c1a34c74");
	if(!isdefined(ai_actor.var_b905c47b))
	{
		ai_actor.var_b905c47b = 0;
	}
	ai_actor.var_b905c47b++;
	if(!isdefined(anim_struct))
	{
		anim_struct = ai_actor;
	}
	self thread function_27059a7f(ai_actor, anim_struct);
	if(ai_actor.var_b905c47b <= 1)
	{
		level flag::set("dialog_tree_active");
		level flag::set("prompts_disabled");
		namespace_61e6d095::function_28027c42(#"dialog_tree", [1:#"hint_tutorial", 0:#"dialog_tree"]);
		objectives::function_9dfb43fc();
		self.var_bc62b3ce = getdvarfloat(#"hash_6b57212fd4fcdd3a");
		setdvar(#"hash_6b57212fd4fcdd3a", 0);
		self.activator val::set(#"dialog_tree", "ignoreme", 1);
		self.activator val::set(#"dialog_tree", "takedamage", 0);
		if(isai(ai_actor))
		{
			if(!isdefined(ai_actor.animname))
			{
				ai_actor.animname = "generic";
			}
			ai_actor val::set(#"dialog_tree", "ignoreme", 1);
			ai_actor val::set(#"dialog_tree", "takedamage", 0);
		}
		self function_a92530c0(ai_actor, anim_struct);
		if(!isdefined(self.var_bc205c58) && !self.allow_movement)
		{
			self.var_bc205c58 = util::spawn_model("tag_origin", self.activator.origin, self.activator.angles);
			if(is_true(level.var_9c0a73b))
			{
				v = level.player getplayerangles();
				var_6cc1ad8d = -1 * (v[0] - 10);
				var_a9284389 = v[0] + 10;
				self.activator playerlinktodelta(self.var_bc205c58, "tag_origin", 0, 20, 20, var_6cc1ad8d, var_a9284389, 1);
			}
			else
			{
				self.activator playerlinktodelta(self.var_bc205c58, "tag_origin", 0, 20, 20, 10, 10, 1);
			}
			self.activator setstance("stand");
			self.activator val::set(#"dialog_tree", "allow_crouch", 0);
			self.activator val::set(#"dialog_tree", "allow_prone", 0);
		}
		if(!self.allow_weapon)
		{
			self.activator val::set(#"dialog_tree", "disable_weapons", 1);
			self.activator val::set(#"dialog_tree", "disable_offhand_weapons", 1);
		}
		self.var_f5af9940 = 0;
	}
	ai_actor function_a5440f84("_dialog_vo_playing");
	ai_actor function_a5440f84("_dialog_anim_playing");
	ai_actor function_a5440f84("_dialog_func_running");
	ai_actor function_a5440f84("_dialog_ui_animating");
	if(isdefined(self.enter_func))
	{
		ai_actor [[self.enter_func]]();
	}
	ai_actor flag::wait_till_clear("_dialog_ui_animating");
	while(ai_actor.var_b905c47b > 1)
	{
		wait(0.1);
	}
	wait(0.5);
	var_6728c4b3 = 0;
	var_f4848d2b = -1;
	if(self.var_4d84ed71)
	{
		namespace_82bfe441::fade(1, "FadeFast");
	}
	function_43bca3cb(self.position, self.var_9c958fe3);
	globallogic_ui::function_9ed5232e("hudItems.subtitles.noAutoHide", 1);
	if(isdefined(timer) && timer > 0)
	{
		self.timeout = timer;
	}
	while(!var_6728c4b3)
	{
		var_d9d52a9d = self function_4a2c9dcb(var_cf6d95c9);
		if(var_d9d52a9d.size < 1)
		{
			var_6728c4b3 = 1;
			continue;
		}
		ai_actor flag::set("_dialog_ui_animating");
		namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "kbmIndexSelected", -1, 1, undefined, undefined, 1);
		var_8989140b = function_8b61aa4c(var_d9d52a9d, ai_actor, var_cf6d95c9);
		if(var_8989140b == -1)
		{
			break;
		}
		self.var_f5af9940++;
		globallogic_ui::function_9ed5232e("hudItems.subtitles.noAutoHide", 0);
		waitframe(1);
		globallogic_ui::function_9ed5232e("hudItems.subtitles.noAutoHide", 1);
		ai_actor notify(#"hash_727216e12f8e4bc0");
		level notify(#"hash_727216e12f8e4bc0");
		ai_actor flag::wait_till_clear("dialog_wait_for_animation");
		var_b7751c0b = self.options[var_8989140b];
		bb::function_7977c093(self.scriptbundle, self.options[var_8989140b].hudstring, getplayers()[0]);
		if(isai(ai_actor))
		{
			ai_actor stopsounds();
		}
		if(isdefined(var_b7751c0b.set_flag))
		{
			foreach(flag in var_b7751c0b.set_flag)
			{
				level flag::set(flag);
			}
		}
		if(isdefined(var_b7751c0b.var_3fa65bba))
		{
			ai_actor flag::set("_dialog_func_running");
			ai_actor thread function_a7575efe(var_b7751c0b.var_3fa65bba, var_b7751c0b.var_d3d10c6d, var_b7751c0b.skip_func);
		}
		if(isdefined(var_b7751c0b.var_f8340c5b))
		{
			ai_actor flag::set("_dialog_vo_playing");
			if(var_b7751c0b.var_529974ff < 0)
			{
				self thread function_62d48ab(ai_actor, var_b7751c0b.var_f8340c5b);
			}
			else
			{
				self thread function_62d48ab(ai_actor, var_b7751c0b.var_f8340c5b[var_b7751c0b.var_529974ff]);
				var_b7751c0b.var_529974ff = function_decf2123(var_b7751c0b.var_529974ff, var_b7751c0b.var_f8340c5b.size, var_b7751c0b.var_cfd168ce);
			}
		}
		anim_struct notify(#"hash_302d410c6a09c48e");
		if(isdefined(var_b7751c0b.var_25b61283) || isdefined(var_b7751c0b.var_59ae859c))
		{
			ai_actor flag::set("_dialog_anim_playing");
			if(var_b7751c0b.cur_anim < 0)
			{
				self thread function_c331410b(ai_actor, var_b7751c0b.var_25b61283, var_b7751c0b.var_59ae859c, anim_struct, self.scriptbundle);
			}
			else
			{
				self thread function_c331410b(ai_actor, var_b7751c0b.var_25b61283[var_b7751c0b.cur_anim], var_b7751c0b.var_59ae859c, anim_struct, self.scriptbundle);
				var_b7751c0b.cur_anim = function_decf2123(var_b7751c0b.cur_anim, var_b7751c0b.var_25b61283.size, var_b7751c0b.var_cfd168ce);
			}
		}
		if(is_true(var_b7751c0b.var_6728c4b3) || self.timeout > 0)
		{
			var_6728c4b3 = 1;
			var_f4848d2b = var_8989140b;
		}
		ai_actor flag::wait_till_clear_all([2:"_dialog_anim_playing", 1:"_dialog_vo_playing", 0:"_dialog_func_running"]);
		if(!var_6728c4b3)
		{
			ai_actor flag::wait_till_clear("_dialog_ui_animating");
		}
		ai_actor notify(#"hash_3d888301ef5802aa");
		if(!isdefined(var_b7751c0b.var_a16c9b3f) || (var_b7751c0b.var_a16c9b3f != "forever" && level flag::get(var_b7751c0b.var_a16c9b3f)))
		{
			if(isdefined(self.options[var_8989140b]))
			{
				self.options[var_8989140b].active = 0;
			}
		}
		self function_59d38639(var_8989140b);
		waitframe(1);
		if(var_5738c83e)
		{
			self.var_ec3cbc15 = var_8989140b;
		}
		if(is_true(ai_actor.var_6728c4b3))
		{
			ai_actor.var_6728c4b3 = undefined;
			break;
		}
	}
	if(ai_actor.var_b905c47b <= 1)
	{
		if(self.var_4d84ed71)
		{
			namespace_82bfe441::fade(0, "FadeFast");
		}
		function_edd9020f(2);
		namespace_61e6d095::function_73c9a490(#"dialog_tree", 0);
		namespace_61e6d095::remove(#"dialog_tree");
		namespace_61e6d095::function_4279fd02(#"dialog_tree");
		objectives::function_4279fd02();
		globallogic_ui::function_9ed5232e("ActorOverheadNames.0.hidden", 0);
		self.activator val::reset(#"dialog_tree", "show_crosshair");
		self.activator clientfield::set_to_player("dt_set_hide_reticle_dot", 0);
		if(isdefined(self.var_c7af782))
		{
			self thread function_86a1bed2(ai_actor, anim_struct, self.var_c7af782);
			self.var_c7af782 = undefined;
		}
	}
	if(isdefined(self.exit_func))
	{
		ai_actor thread [[self.exit_func]]();
	}
	if(ai_actor.var_b905c47b <= 1)
	{
		if(isdefined(self.var_bc62b3ce))
		{
			setdvar(#"hash_6b57212fd4fcdd3a", self.var_bc62b3ce);
		}
		if(!self.allow_movement)
		{
			self.activator unlink();
			if(isdefined(self.var_bc205c58))
			{
				self.var_bc205c58 delete();
				self.var_bc205c58 = undefined;
			}
			self.activator val::reset(#"dialog_tree", "allow_crouch");
			self.activator val::reset(#"dialog_tree", "allow_prone");
			self.activator val::reset(#"dialog_tree", "allow_stand");
		}
		if(!self.allow_weapon)
		{
			self.activator val::reset(#"dialog_tree", "disable_weapons");
			self.activator val::reset(#"dialog_tree", "disable_offhand_weapons");
		}
		ai_actor flag::clear("_dialog_vo_playing");
		ai_actor flag::clear("_dialog_anim_playing");
		ai_actor flag::clear("_dialog_func_running");
		self.activator val::reset(#"dialog_tree", "ignoreme");
		self.activator val::reset(#"dialog_tree", "takedamage");
		waitframe(1);
		if(isai(ai_actor))
		{
			ai_actor val::reset(#"dialog_tree", "ignoreme");
			ai_actor val::reset(#"dialog_tree", "takedamage");
		}
		self notify(#"dialog_tree_end");
		ai_actor notify(#"dialog_tree_end");
		globallogic_ui::function_9ed5232e("hudItems.subtitles.noAutoHide", 0);
		level flag::clear("dialog_tree_active");
		level flag::clear("prompts_disabled");
	}
	ai_actor.var_b905c47b--;
	while(ai_actor.var_b905c47b > 0)
	{
		wait(0.1);
	}
	return var_f4848d2b;
}

/*
	Name: function_6a2674b8
	Namespace: dialog_tree
	Checksum: 0x64FC2907
	Offset: 0x36C0
	Size: 0x2C
	Parameters: 0
	Flags: None
*/
function function_6a2674b8()
{
	choices = self function_4a2c9dcb();
	return choices.size;
}

/*
	Name: function_a6a75a20
	Namespace: dialog_tree
	Checksum: 0xE2ACB519
	Offset: 0x36F8
	Size: 0x58
	Parameters: 0
	Flags: None
*/
function function_a6a75a20()
{
	self.ai_actor flag::wait_till("waiting_on_player_choice");
	waitframe(1);
	level notify(#"dialog_tree_option_selected", {#hash_70b35161:-1});
}

/*
	Name: function_27059a7f
	Namespace: dialog_tree
	Checksum: 0x906137D1
	Offset: 0x3758
	Size: 0x25C
	Parameters: 2
	Flags: Private
*/
function private function_27059a7f(ai_actor, anim_struct)
{
	self endon(#"dialog_tree_end");
	level notify(#"watch_dt_skips");
	level endon(#"watch_dt_skips");
	while(true)
	{
		self.activator namespace_61e6d095::function_b0bad5ff();
		bb::function_7977c093(self.scriptbundle, #"hash_3c27402259e4c18e", getplayers()[0]);
		if(ai_actor flag::get("_dialog_vo_playing"))
		{
			if(isdefined(ai_actor.var_e744d1aa))
			{
				if(isai(ai_actor))
				{
					ai_actor dialogue::function_47b06180();
				}
				else
				{
					snd::stop(ai_actor.var_e744d1aa);
				}
				ai_actor.var_e744d1aa = undefined;
				ai_actor notify(#"cancel speaking");
			}
		}
		if(ai_actor flag::get("_dialog_anim_playing") && isdefined(ai_actor._scene_object))
		{
			var_45c1f22c = self function_58881e72(self.scriptbundle, ai_actor._scene_object._str_shot, anim_struct);
			if(var_45c1f22c)
			{
				ai_actor notify(#"hash_71ceced1590e6571");
				anim_struct thread scene::play_from_time(self.scriptbundle, ai_actor._scene_object._str_shot, undefined, getanimlength(ai_actor._scene_object._str_current_anim) - 0.25, 0, 1);
			}
		}
		else
		{
			ai_actor notify(#"hash_71ceced1590e6571");
		}
		wait(0.2);
	}
}

/*
	Name: function_58881e72
	Namespace: dialog_tree
	Checksum: 0xFCCFB7A5
	Offset: 0x39C0
	Size: 0x564
	Parameters: 3
	Flags: Private
*/
function private function_58881e72(sb, str_shot, anim_struct)
{
	a_instances = scene::get_active_scenes(sb);
	if(!isarray(a_instances))
	{
		return false;
	}
	if(!isarray(a_instances[0].scene_ents))
	{
		return false;
	}
	scene_ents = a_instances[0].scene_ents;
	db = {#test_time:-1, #hash_30468601:1, #hash_4fc15872:2.4, #ent:undefined, #hash_426966c7:9999, #hash_dac7c195:sb, #vox:"none"};
	foreach(ent in scene_ents)
	{
		if(!isdefined(ent))
		{
			continue;
		}
		if(isdefined(ent._scene_object._str_current_anim))
		{
			if(isanimlooping(ent._scene_object._str_current_anim))
			{
				continue;
			}
			if(db.test_time < 0)
			{
				db.test_time = ent getanimtime(ent._scene_object._str_current_anim);
			}
			anim_len = getanimlength(ent._scene_object._str_current_anim);
			curr_time = ent getanimtime(ent._scene_object._str_current_anim);
			if(abs(curr_time - db.test_time) > 0.025)
			{
				/#
					iprintln("" + (abs(curr_time - db.test_time)));
				#/
				continue;
			}
			notetracks = getnotetracksindelta(ent._scene_object._str_current_anim, 0, 999);
			if(notetracks.size)
			{
				foreach(notetrack in notetracks)
				{
					if(notetrack[5] == #"vox")
					{
						ent.stop_sound = 1;
						if(notetrack[3] > curr_time && (notetrack[3] * anim_len) < db.var_426966c7)
						{
							check_time = (notetrack[3] * anim_len) - 0.1;
							if(check_time < curr_time * anim_len)
							{
								continue;
							}
							db.ent = ent;
							db.var_426966c7 = check_time;
							db.var_30468601 = check_time / anim_len;
							db.var_4fc15872 = notetrack[3] * anim_len;
							/#
								db.vox = function_9e72a96(notetrack[6]);
							#/
						}
					}
				}
			}
		}
	}
	foreach(ent in scene_ents)
	{
		if(is_true(ent.stop_sound))
		{
			ent stopsounds();
			ent.stop_sound = undefined;
		}
	}
	if(isdefined(db.ent))
	{
		anim_struct thread scene::play_from_time(sb, str_shot, undefined, db.var_30468601, 1, 1);
		return false;
	}
	return true;
}

/*
	Name: function_62d48ab
	Namespace: dialog_tree
	Checksum: 0x159DA49B
	Offset: 0x3F30
	Size: 0x1D4
	Parameters: 2
	Flags: Private
*/
function private function_62d48ab(ai_actor, var_2f04fa05)
{
	ai_actor endon(#"death");
	ai_actor endon(#"dialog_tree_end");
	if(!isarray(var_2f04fa05))
	{
		var_2f04fa05 = [0:var_2f04fa05];
	}
	for(i = 0; i < var_2f04fa05.size; i++)
	{
		vo_line = var_2f04fa05[i];
		if(soundexists(vo_line))
		{
			if(isai(ai_actor))
			{
				ai_actor dialogue::function_47b06180();
				ai_actor.var_e744d1aa = 1;
				ai_actor dialogue::queue(vo_line);
			}
			else
			{
				ai_actor.var_e744d1aa = snd::play(vo_line, [1:"j_head", 0:ai_actor]);
				snd::function_2fdc4fb(ai_actor.var_e744d1aa);
			}
			continue;
		}
		iprintlnbold(vo_line);
		self.activator waittilltimeout(1.5, #"hash_71ceced1590e6571");
	}
	ai_actor notify(#"hash_48ace2900075b6e8");
	ai_actor.var_e744d1aa = undefined;
	ai_actor flag::clear("_dialog_vo_playing");
}

/*
	Name: function_d602cdd7
	Namespace: dialog_tree
	Checksum: 0xC7DD93
	Offset: 0x4110
	Size: 0x64
	Parameters: 1
	Flags: Private
*/
function private function_d602cdd7(var_e2b4d51e)
{
	/#
		assert(isarray(self.options));
	#/
	var_e728c53 = self.options.size;
	self.options[var_e728c53] = var_e2b4d51e;
	return var_e728c53;
}

/*
	Name: function_98927b7b
	Namespace: dialog_tree
	Checksum: 0x61254ED4
	Offset: 0x4180
	Size: 0x1F6
	Parameters: 16
	Flags: Private
*/
function private function_98927b7b(parent_id, option_text, var_cfef5030, ai_anim, var_a0ee58ce, var_6728c4b3, set_flag, var_a16c9b3f, var_9ddc06f5, var_3fa65bba, var_d3d10c6d, skip_func, important, var_84fa2307, var_c275310d, var_50f9a62)
{
	if(!isdefined(var_6728c4b3))
	{
		var_6728c4b3 = 0;
	}
	if(!isdefined(important))
	{
		important = 0;
	}
	if(!isdefined(var_50f9a62))
	{
		var_50f9a62 = 1;
	}
	option = spawnstruct();
	option.active = 1;
	option.parent_id = parent_id;
	option.hudstring = option_text;
	option.var_f8340c5b = var_cfef5030;
	option.var_25b61283 = ai_anim;
	option.var_59ae859c = var_a0ee58ce;
	option.var_6728c4b3 = var_6728c4b3;
	if(isdefined(set_flag) && !isarray(set_flag))
	{
		set_flag = [0:set_flag];
	}
	option.set_flag = set_flag;
	option.var_a16c9b3f = var_a16c9b3f;
	option.var_9ddc06f5 = var_9ddc06f5;
	option.var_3fa65bba = var_3fa65bba;
	option.var_d3d10c6d = var_d3d10c6d;
	option.skip_func = skip_func;
	option.important = important;
	option.var_5741b81f = 0;
	option.var_529974ff = -1;
	option.cur_anim = -1;
	option.var_84fa2307 = var_84fa2307;
	option.var_c275310d = var_c275310d;
	option.var_50f9a62 = var_50f9a62;
	return option;
}

/*
	Name: function_b85d5a3a
	Namespace: dialog_tree
	Checksum: 0xACCC85B8
	Offset: 0x4380
	Size: 0x152
	Parameters: 2
	Flags: Private
*/
function private function_b85d5a3a(var_d9d52a9d, var_cf6d95c9)
{
	if(!isdefined(var_cf6d95c9))
	{
		var_cf6d95c9 = 4;
	}
	var_df0608f8 = [];
	for(i = 0; i < var_cf6d95c9; i++)
	{
		if(isdefined(var_d9d52a9d[i]))
		{
			option = self.options[var_d9d52a9d[i]];
			var_2ebd3f57 = isdefined(option.var_9ddc06f5) && option.var_5741b81f && !level flag::get(option.var_9ddc06f5);
			var_df0608f8[i] = {#locked:var_2ebd3f57, #string:option.hudstring, #important:option.important};
			continue;
		}
		var_df0608f8[i] = {#locked:0, #string:undefined, #important:0};
	}
	return var_df0608f8;
}

/*
	Name: function_a7575efe
	Namespace: dialog_tree
	Checksum: 0x479774A7
	Offset: 0x44E0
	Size: 0xA4
	Parameters: 3
	Flags: Private
*/
function private function_a7575efe(func, param, skip_func)
{
	self endon(#"dialog_tree_end");
	if(isdefined(skip_func))
	{
		self thread function_49048365(skip_func);
	}
	if(!isdefined(param))
	{
		self [[func]]();
	}
	else
	{
		self [[func]](param);
	}
	self notify(#"hash_4501fed1970295ab");
	self flag::clear("_dialog_func_running");
}

/*
	Name: function_49048365
	Namespace: dialog_tree
	Checksum: 0x467DB398
	Offset: 0x4590
	Size: 0x50
	Parameters: 1
	Flags: Private
*/
function private function_49048365(skip_func)
{
	self endon(#"dialog_tree_end");
	self endon(#"hash_4501fed1970295ab");
	self waittill(#"hash_71ceced1590e6571");
	self thread [[skip_func]]();
}

/*
	Name: function_c331410b
	Namespace: dialog_tree
	Checksum: 0xED68A097
	Offset: 0x45E8
	Size: 0x184
	Parameters: 5
	Flags: Private
*/
function private function_c331410b(ai_actor, anims, anim_loop, struct, scriptbundle)
{
	self endon(#"dialog_tree_end");
	ai_actor endon(#"hash_727216e12f8e4bc0");
	if(isdefined(scriptbundle) && isdefined(anims))
	{
		if(!isarray(anims))
		{
			anims = [0:anims];
		}
		self thread function_a5ba53f8(ai_actor);
		for(i = 0; i < anims.size; i++)
		{
			self thread function_c4ae7ee0(ai_actor, anims[i], struct, scriptbundle);
			self waittill(#"hash_222d1d96d3da9edb", #"hash_711653fb95598c66");
		}
	}
	ai_actor notify(#"hash_12324459eb2bc76d");
	self.var_ebacf97b = undefined;
	ai_actor flag::clear("_dialog_anim_playing");
	if(isdefined(scriptbundle) && isdefined(anim_loop))
	{
		struct thread scene::play(scriptbundle, anim_loop, [0:ai_actor]);
	}
}

/*
	Name: function_c4ae7ee0
	Namespace: dialog_tree
	Checksum: 0x5309F4F6
	Offset: 0x4778
	Size: 0x86
	Parameters: 4
	Flags: Private
*/
function private function_c4ae7ee0(ai_actor, shot_name, struct, scriptbundle)
{
	self endon(#"dialog_tree_end");
	self.var_ebacf97b = shot_name;
	struct scene::play(scriptbundle, shot_name, [0:ai_actor]);
	self notify(#"hash_222d1d96d3da9edb");
}

/*
	Name: function_a5ba53f8
	Namespace: dialog_tree
	Checksum: 0x203F8866
	Offset: 0x4808
	Size: 0x70
	Parameters: 1
	Flags: Private
*/
function private function_a5ba53f8(ai_actor)
{
	ai_actor endon(#"hash_12324459eb2bc76d");
	level waittill(#"hash_3d5358602caccf41");
	ai_actor flag::clear("_dialog_anim_playing");
	ai_actor notify(#"hash_12324459eb2bc76d");
}

/*
	Name: function_a5440f84
	Namespace: dialog_tree
	Checksum: 0x71B8367B
	Offset: 0x4880
	Size: 0x6C
	Parameters: 1
	Flags: Private
*/
function private function_a5440f84(flagname)
{
	if(!self flag::exists(flagname))
	{
		self flag::init(flagname);
		self flag::clear(flagname);
	}
	else
	{
		self flag::wait_till_clear(flagname);
	}
}

/*
	Name: function_4a2c9dcb
	Namespace: dialog_tree
	Checksum: 0xAFD0A521
	Offset: 0x48F8
	Size: 0x244
	Parameters: 1
	Flags: Private
*/
function private function_4a2c9dcb(var_d1cccc43)
{
	var_d9d52a9d = [];
	var_301712bf = 0;
	while(var_301712bf < self.options.size && (!isdefined(var_d1cccc43) || var_d9d52a9d.size < var_d1cccc43))
	{
		option = self.options[var_301712bf];
		if(isdefined(option.var_84fa2307) && option.var_84fa2307 > 0)
		{
			if(self.var_f5af9940 == 0 && is_true(option.var_50f9a62))
			{
				self.options[var_301712bf].active = 1;
				if(isdefined(option.var_c275310d))
				{
					level flag::clear(option.var_c275310d);
				}
			}
			if(self.var_f5af9940 >= option.var_84fa2307 && option.active)
			{
				self.options[var_301712bf].active = 0;
				if(isdefined(option.var_c275310d))
				{
					level flag::set(option.var_c275310d);
				}
			}
		}
		if(isdefined(option.var_a16c9b3f))
		{
			if(option.var_a16c9b3f != "forever" && level flag::get(option.var_a16c9b3f))
			{
				self.options[var_301712bf].active = 0;
			}
		}
		if(!option.active || (isdefined(option.var_9ddc06f5) && !level flag::get(option.var_9ddc06f5) && !option.var_5741b81f))
		{
			var_301712bf++;
			continue;
		}
		var_d9d52a9d[var_d9d52a9d.size] = var_301712bf;
		var_301712bf++;
	}
	return var_d9d52a9d;
}

/*
	Name: function_59d38639
	Namespace: dialog_tree
	Checksum: 0x12D2C8AA
	Offset: 0x4B48
	Size: 0xAA
	Parameters: 1
	Flags: Private
*/
function private function_59d38639(parent_id)
{
	foreach(option in self.options)
	{
		if(isdefined(option.parent_id) && option.parent_id == parent_id)
		{
			option.active = 1;
		}
	}
}

/*
	Name: function_985e8e32
	Namespace: dialog_tree
	Checksum: 0xCAE595A5
	Offset: 0x4C00
	Size: 0x48
	Parameters: 1
	Flags: Private
*/
function private function_985e8e32(index)
{
	var_4ef47508 = index + 1;
	var_51b90557 = (("^S ") + var_4ef47508) + (" ^E");
	return var_51b90557;
}

/*
	Name: function_8b61aa4c
	Namespace: dialog_tree
	Checksum: 0x85CAD0D
	Offset: 0x4C50
	Size: 0x41A
	Parameters: 3
	Flags: Private
*/
function private function_8b61aa4c(var_d9d52a9d, ai_actor, var_cf6d95c9)
{
	if(!isdefined(var_cf6d95c9))
	{
		var_cf6d95c9 = 4;
	}
	var_1c35d027 = function_b85d5a3a(var_d9d52a9d, var_cf6d95c9);
	index = 0;
	choices = [];
	foreach(choice in var_1c35d027)
	{
		if(isdefined(choice.string))
		{
			namespace_61e6d095::function_f2a9266(#"dialog_tree", index, "dialogString", choice.string);
			namespace_61e6d095::function_f2a9266(#"dialog_tree", index, "important", choice.important);
			namespace_61e6d095::function_f2a9266(#"dialog_tree", index, "unImportant", choice.locked);
			namespace_61e6d095::function_f2a9266(#"dialog_tree", index, "kbmShortcut", function_985e8e32(index));
			choices[index] = choice;
			index++;
		}
	}
	namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "optionSelected", 0, 1, undefined, undefined, 1);
	if(isdefined(self.timeout) && self.timeout > 0)
	{
		namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "timeOut", self.timeout);
	}
	player = self.activator;
	/#
		assert(isplayer(player));
	#/
	player thread namespace_61e6d095::function_e13a1a9c([1:1, 0:choices.size], &function_cde38026, undefined, undefined, choices, "dialog_tree_option_selected", "death", 0, [1:0, 0:self.var_ec3cbc15]);
	player thread function_9ca575ba(choices);
	ai_actor flag::set("waiting_on_player_choice");
	selected = undefined;
	selected = level waittill(#"dialog_tree_option_selected");
	function_edd9020f(1);
	ai_actor flag::clear("waiting_on_player_choice");
	if(selected.var_70b35161 < 0)
	{
		level thread function_310d2602(choices, ai_actor, 1);
		return selected.var_70b35161;
	}
	level thread function_310d2602(choices, ai_actor);
	return var_d9d52a9d[selected.var_70b35161];
}

/*
	Name: function_9ca575ba
	Namespace: dialog_tree
	Checksum: 0x21010BF7
	Offset: 0x5078
	Size: 0x2A2
	Parameters: 1
	Flags: Private
*/
function private function_9ca575ba(choices)
{
	self endon(#"death", #"dialog_tree_option_selected", #"disconnect");
	if(isdefined(choices) && isdefined(choices.size))
	{
		level.waitingforresponse = 1;
		var_cf6a20f2 = -1;
		while(level.waitingforresponse)
		{
			var_dae97dcc = undefined;
			var_dae97dcc = level waittill(#"dialog_tree_kbm_key_selected");
			if(choices.size > 0 && var_dae97dcc.var_70b35161 == 1)
			{
				var_cf6a20f2 = 0;
				level.waitingforresponse = 0;
			}
			else
			{
				if(choices.size > 1 && var_dae97dcc.var_70b35161 == 2)
				{
					var_cf6a20f2 = 1;
					level.waitingforresponse = 0;
				}
				else
				{
					if(choices.size > 2 && var_dae97dcc.var_70b35161 == 3)
					{
						var_cf6a20f2 = 2;
						level.waitingforresponse = 0;
					}
					else if(choices.size > 3 && var_dae97dcc.var_70b35161 == 4)
					{
						var_cf6a20f2 = 3;
						level.waitingforresponse = 0;
					}
				}
			}
			if(!level.waitingforresponse)
			{
				namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "index", var_cf6a20f2, 1, undefined, undefined, 1);
				waitframe(1);
				namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "kbmIndexSelected", var_cf6a20f2, 1, undefined, undefined, 1);
				waitframe(1);
				namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "validateListElement", var_cf6a20f2, 1, undefined, undefined, 1);
				waitframe(1);
				level notify(#"dialog_tree_option_selected", {#hash_70b35161:var_cf6a20f2});
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_cde38026
	Namespace: dialog_tree
	Checksum: 0xB194E082
	Offset: 0x5328
	Size: 0x11C
	Parameters: 3
	Flags: Private
*/
function private function_cde38026(var_d27bb493, var_44b06a67, choices)
{
	var_c8994f32 = var_d27bb493[0];
	var_d9161f36 = var_44b06a67[0];
	var_1e50dc81 = var_d9161f36;
	while(is_true(choices[var_1e50dc81].locked))
	{
		if(var_d9161f36 < var_c8994f32)
		{
			var_1e50dc81--;
		}
		else
		{
			var_1e50dc81++;
		}
		if(var_1e50dc81 < 0 || var_1e50dc81 >= choices.size)
		{
			var_1e50dc81 = var_c8994f32;
			break;
		}
	}
	if(var_1e50dc81 != var_c8994f32)
	{
		function_edd9020f(0);
		namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "index", var_1e50dc81, 1, undefined, undefined, 1);
	}
	return [1:0, 0:var_1e50dc81];
}

/*
	Name: function_310d2602
	Namespace: dialog_tree
	Checksum: 0x5B0C25BD
	Offset: 0x5450
	Size: 0xFC
	Parameters: 3
	Flags: Private
*/
function private function_310d2602(choices, ai_actor, var_e2ab6781)
{
	if(!isdefined(var_e2ab6781))
	{
		var_e2ab6781 = 0;
	}
	if(!var_e2ab6781)
	{
		namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "optionSelected", 1, 1);
		wait(1.5);
	}
	if(namespace_61e6d095::exists(#"dialog_tree"))
	{
		for(i = choices.size - 1; i >= 0; i--)
		{
			namespace_61e6d095::function_7239e030(#"dialog_tree", i);
		}
	}
	ai_actor flag::clear("_dialog_ui_animating");
}

/*
	Name: function_43bca3cb
	Namespace: dialog_tree
	Checksum: 0x4013552D
	Offset: 0x5558
	Size: 0x22C
	Parameters: 2
	Flags: Private
*/
function private function_43bca3cb(position, var_9c958fe3)
{
	namespace_61e6d095::create(#"dialog_tree", #"hash_5ee7619b9b614d34");
	namespace_61e6d095::set_x(#"dialog_tree", position[0]);
	namespace_61e6d095::set_y(#"dialog_tree", position[1]);
	namespace_61e6d095::function_330981ed(#"dialog_tree");
	namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "index", 0);
	namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "timeOut", 0);
	namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "stateIndex", var_9c958fe3);
	namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "optionSelected", 0);
	namespace_61e6d095::function_9ade1d9b(#"dialog_tree", "kbmIndexSelected", -1);
	namespace_61e6d095::function_73c9a490(#"dialog_tree", 1);
	namespace_61e6d095::function_24e5fa63(#"dialog_tree", [1:#"hash_3c27402259e4c18e", 0:#"ui_confirm"], 1);
	self.activator clientfield::set_to_player("dt_set_hide_reticle_dot", 1);
}

/*
	Name: function_edd9020f
	Namespace: dialog_tree
	Checksum: 0xAAEC822C
	Offset: 0x5790
	Size: 0x15C
	Parameters: 1
	Flags: Private
*/
function private function_edd9020f(var_6879e855)
{
	/#
		assert(isdefined(var_6879e855), "");
	#/
	player = getplayers()[0];
	var_ed170ba3 = level.var_d5314f55.size;
	dialog = level.var_d5314f55[var_ed170ba3 - 1];
	sfx = array([2:#"hash_2dbbeb1152f8bae4", 1:#"hash_dc31a804bbb227f", 0:#"hash_54e1e3d5b87314d5"], [2:#"hash_12318c85a48dd092", 1:#"hash_64f6788a8e5318d5", 0:#"hash_1961af6c63751c23"])[dialog.var_9c958fe3][var_6879e855];
	player playsound(sfx);
}

