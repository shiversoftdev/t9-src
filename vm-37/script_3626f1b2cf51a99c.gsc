#using script_52da18c20f45c56a;
#using script_5399f402045d7abd;
#using script_7d0013bbc05623b9;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace actions;

/*
	Name: function_89f2df9
	Namespace: actions
	Checksum: 0xB9227FB1
	Offset: 0x270
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"actions", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: actions
	Checksum: 0xE3863703
	Offset: 0x2B8
	Size: 0x12C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		function_5ac4dc99("", 0);
	#/
	level.var_f467e5b0 = spawnstruct();
	level.var_f467e5b0.actions = [];
	animation::add_global_notetrack_handler("release", &function_303a7a74, 0);
	animation::add_global_notetrack_handler("chain", &function_3af7d065, 0);
	animation::add_global_notetrack_handler("event", &function_ebc59735, 0);
	animation::add_global_notetrack_handler("become_corpse", &namespace_594b67e::become_corpse, 0);
	function_9ddfe2d("root");
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: actions
	Checksum: 0x4C04ABEC
	Offset: 0x3F0
	Size: 0xD0
	Parameters: 0
	Flags: None
*/
function on_player_spawned()
{
	self.var_f467e5b0 = spawnstruct();
	self.var_f467e5b0.enabled = [];
	self.var_f467e5b0.var_13a66c62 = [];
	foreach(action_name, action in level.var_f467e5b0.actions)
	{
		self function_b0868791(action_name, 1);
	}
}

/*
	Name: function_9ddfe2d
	Namespace: actions
	Checksum: 0x114170AF
	Offset: 0x4C8
	Size: 0x310
	Parameters: 5
	Flags: None
*/
function function_9ddfe2d(action_name, var_7eba8145, var_e3a917a5, var_9386e7ce, anim_name)
{
	if(!isdefined(var_e3a917a5) && action_name != "root")
	{
		var_e3a917a5 = "root";
	}
	if(!isdefined(var_9386e7ce))
	{
		var_9386e7ce = "a";
	}
	if(!isdefined(anim_name))
	{
		anim_name = action_name;
	}
	/#
		if(isdefined(level.var_f467e5b0.actions[action_name]) && level.var_f467e5b0.actions[action_name].var_7eba8145 != var_7eba8145)
		{
			/#
				assertmsg("");
			#/
			return;
		}
	#/
	action = spawnstruct();
	action.name = tolower(action_name);
	action.var_9386e7ce = tolower(var_9386e7ce);
	action.anim_name = tolower(anim_name);
	action.ender = "action_end_" + action.name;
	action.children = [];
	action.var_7eba8145 = var_7eba8145;
	level.var_f467e5b0.actions[action_name] = action;
	if(isdefined(var_e3a917a5))
	{
		if(!isarray(var_e3a917a5))
		{
			var_e3a917a5 = [0:var_e3a917a5];
		}
		foreach(parent in var_e3a917a5)
		{
			thread function_ff81e3cc(parent, action_name);
		}
	}
	level notify(#"hash_2fd6623a6dbe43e9", {#action:action_name});
	foreach(player in getplayers())
	{
		player function_b0868791(action_name, 1);
	}
}

/*
	Name: function_1028d928
	Namespace: actions
	Checksum: 0x987ACC82
	Offset: 0x7E0
	Size: 0xEC
	Parameters: 2
	Flags: None
*/
function function_1028d928(action_name, var_9386e7ce)
{
	if(!isdefined(level.var_f467e5b0.actions[action_name]))
	{
		return false;
	}
	var_9386e7ce = tolower(var_9386e7ce);
	foreach(child in level.var_f467e5b0.actions[action_name].children)
	{
		if(child.var_9386e7ce == var_9386e7ce)
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_2ecf3fa7
	Namespace: actions
	Checksum: 0x1FBCF348
	Offset: 0x8D8
	Size: 0x128
	Parameters: 4
	Flags: None
*/
function function_2ecf3fa7(var_5103505d, anim_name, scene_root, phase)
{
	if(!isarray(var_5103505d))
	{
		var_5103505d = [0:var_5103505d];
	}
	foreach(action_name in var_5103505d)
	{
		key = function_4e61a046(action_name, phase);
		if(isdefined(anim_name))
		{
			self.var_9d46265b[key] = [1:scene_root, 0:anim_name];
			continue;
		}
		self.var_9d46265b[key] = undefined;
	}
}

/*
	Name: function_bf28d531
	Namespace: actions
	Checksum: 0x8A9DA674
	Offset: 0xA08
	Size: 0xE
	Parameters: 0
	Flags: None
*/
function function_bf28d531()
{
	self.var_9d46265b = undefined;
}

/*
	Name: function_b1543a9d
	Namespace: actions
	Checksum: 0xFD1BBBCA
	Offset: 0xA20
	Size: 0x31E
	Parameters: 2
	Flags: None
*/
function function_b1543a9d(anim_name, animset)
{
	var_4f3681cc = getscriptbundle(animset);
	if(!isdefined(var_4f3681cc))
	{
		/#
			assertmsg(("" + animset) + "");
		#/
		return;
	}
	/#
		assert(var_4f3681cc.type == "");
	#/
	/#
		assert(isdefined(level.var_f467e5b0));
	#/
	foreach(group in var_4f3681cc.animset)
	{
		foreach(index, animentry in group.anims)
		{
			var_37d9fb07 = (anim_name + "_") + group.name;
			if(group.anims.size > 1)
			{
				var_37d9fb07 = (var_37d9fb07 + "_") + (index + 1);
			}
			level.var_f467e5b0.anims[group.animname][var_37d9fb07] = animentry.xanim;
			if(group.blend !== 0.2)
			{
				level.var_f467e5b0.blend[group.animname][var_37d9fb07] = (isdefined(group.blend) ? group.blend : 0);
			}
			if(group.animname == "generic" && !isdefined(level.var_f467e5b0.anims[#"player"][var_37d9fb07]))
			{
				level.var_f467e5b0.anims[#"player"][var_37d9fb07] = animentry.xanim;
				level.var_f467e5b0.blend[#"player"][var_37d9fb07] = group.blend;
			}
		}
	}
}

/*
	Name: function_df6077
	Namespace: actions
	Checksum: 0x5573A7D2
	Offset: 0xD48
	Size: 0xC0
	Parameters: 2
	Flags: None
*/
function function_df6077(action_name, enabled)
{
	/#
		assert(isactor(self));
	#/
	if(enabled && !is_true(self.var_f467e5b0.enabled[action_name]))
	{
		self.var_f467e5b0.enabled[action_name] = undefined;
	}
	else if(!enabled)
	{
		if(!isdefined(self.var_f467e5b0))
		{
			self.var_f467e5b0 = {};
		}
		self.var_f467e5b0.enabled[action_name] = 0;
	}
}

/*
	Name: function_b0868791
	Namespace: actions
	Checksum: 0x31B78645
	Offset: 0xE10
	Size: 0x16C
	Parameters: 2
	Flags: None
*/
function function_b0868791(action_name, enabled)
{
	/#
		assert(isplayer(self));
	#/
	if(enabled && !is_true(self.var_f467e5b0.enabled[action_name]))
	{
		self.var_f467e5b0.enabled[action_name] = 1;
	}
	else if(!enabled && is_true(self.var_f467e5b0.enabled[action_name]))
	{
		self notify(level.var_f467e5b0.actions[action_name].ender);
		self.var_f467e5b0.enabled[action_name] = undefined;
	}
	self function_3af7d065(1);
	self function_3af7d065(1, level.var_f467e5b0.actions[action_name].var_9386e7ce);
	self thread function_942d9213();
}

/*
	Name: function_202ab848
	Namespace: actions
	Checksum: 0xB18863FD
	Offset: 0xF88
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_202ab848(enabled)
{
	/#
		assert(isplayer(self));
	#/
	self.var_f467e5b0.disabled = (enabled ? 1 : undefined);
	self thread function_942d9213();
}

/*
	Name: function_6c59e78f
	Namespace: actions
	Checksum: 0x211FF2F0
	Offset: 0x1000
	Size: 0x56
	Parameters: 1
	Flags: None
*/
function function_6c59e78f(enabled)
{
	/#
		assert(isplayer(self));
	#/
	self.var_f467e5b0.var_36a4a92c = (enabled ? 1 : undefined);
}

/*
	Name: function_8488e359
	Namespace: actions
	Checksum: 0xF0AD9B5
	Offset: 0x1060
	Size: 0x8C
	Parameters: 2
	Flags: None
*/
function function_8488e359(var_ecfa567f, var_c7a00bcb)
{
	self.var_f467e5b0.var_c4e66a91 = undefined;
	if(isdefined(var_ecfa567f))
	{
		self.var_f467e5b0.var_c4e66a91[var_ecfa567f] = 1;
		self notify("_plr_cmd_clk_" + var_ecfa567f);
	}
	if(isdefined(var_c7a00bcb))
	{
		self.var_f467e5b0.var_c4e66a91[var_c7a00bcb] = 1;
		self notify("_plr_cmd_clk_" + var_c7a00bcb);
	}
}

/*
	Name: function_1c027741
	Namespace: actions
	Checksum: 0xC2C4AF3C
	Offset: 0x10F8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_1c027741(action_name)
{
	/#
		assert(isplayer(self));
	#/
	self thread function_e3401e0e(action_name);
}

/*
	Name: function_d0cba98
	Namespace: actions
	Checksum: 0x697F0948
	Offset: 0x1150
	Size: 0x50
	Parameters: 2
	Flags: None
*/
function function_d0cba98(action_name, override)
{
	if(!isdefined(self.var_f467e5b0.overrides))
	{
		self.var_f467e5b0.overrides = [];
	}
	self.var_f467e5b0.overrides[action_name] = override;
}

/*
	Name: function_abaa32c
	Namespace: actions
	Checksum: 0x184C600
	Offset: 0x11A8
	Size: 0x48
	Parameters: 1
	Flags: None
*/
function function_abaa32c(action_name)
{
	if(!isdefined(self.var_f467e5b0.overrides))
	{
		self.var_f467e5b0.overrides = [];
	}
	return self.var_f467e5b0.overrides[action_name];
}

/*
	Name: function_3af7d065
	Namespace: actions
	Checksum: 0x379A0678
	Offset: 0x11F8
	Size: 0x94
	Parameters: 2
	Flags: None
*/
function function_3af7d065(enabled, var_9386e7ce)
{
	/#
		assert(isplayer(self));
	#/
	if(!isalive(self))
	{
		return;
	}
	flagname = function_f3f7e971(var_9386e7ce);
	self flag::set_val(flagname, enabled);
}

/*
	Name: function_c004e236
	Namespace: actions
	Checksum: 0xEBA6EB6A
	Offset: 0x1298
	Size: 0xCC
	Parameters: 2
	Flags: None
*/
function function_c004e236(prompt, var_9386e7ce)
{
	self endon(#"death", #"disconnect");
	/#
		assert(isplayer(self));
	#/
	if(!isalive(self))
	{
		return;
	}
	flagname = function_f3f7e971(var_9386e7ce);
	self flag::wait_till(flagname);
	self flag::wait_till_clear(flagname);
}

/*
	Name: function_83bde308
	Namespace: actions
	Checksum: 0xE54AE13A
	Offset: 0x1370
	Size: 0x130
	Parameters: 3
	Flags: None
*/
function function_83bde308(action, var_d61bdbea, var_1ad5f3d8)
{
	self endon(#"death", #"disconnect");
	/#
		assert(isplayer(self));
	#/
	/#
		assert(isstruct(action));
	#/
	if(!isalive(self))
	{
		return false;
	}
	if(isdefined(var_d61bdbea))
	{
		self thread function_fb6a1439(action, var_d61bdbea, var_1ad5f3d8);
	}
	self flag::wait_till(function_f3f7e971(action));
	if(isdefined(var_d61bdbea))
	{
		self flag::wait_till(function_3e2aeb63(var_d61bdbea));
	}
	return true;
}

/*
	Name: function_1927d2a8
	Namespace: actions
	Checksum: 0x981D62F7
	Offset: 0x14A8
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_1927d2a8(immediate)
{
	/#
		assert(isplayer(self));
	#/
	if(isdefined(self.var_2cb06cc6) && self.var_2cb06cc6 !== "root")
	{
		self.var_2cb06cc6.var_43769020 = immediate;
		self notify(self.var_2cb06cc6.ender);
		waitframe(1);
	}
}

/*
	Name: function_942d9213
	Namespace: actions
	Checksum: 0xD916658C
	Offset: 0x1538
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function function_942d9213()
{
	self thread function_676e0128();
}

/*
	Name: function_c11b51e1
	Namespace: actions
	Checksum: 0xCD991C0C
	Offset: 0x1560
	Size: 0x36
	Parameters: 0
	Flags: None
*/
function function_c11b51e1()
{
	return !isdefined(self.var_2cb06cc6.name) || self.var_2cb06cc6.name === "root";
}

/*
	Name: function_ff81e3cc
	Namespace: actions
	Checksum: 0x995A79A8
	Offset: 0x15A0
	Size: 0x1D8
	Parameters: 2
	Flags: None
*/
function function_ff81e3cc(var_e3a917a5, action_name)
{
	/#
		if(!isdefined(var_e3a917a5) || !isdefined(action_name))
		{
			/#
				assertmsg("");
			#/
			return;
		}
		if(tolower(var_e3a917a5) == tolower(action_name))
		{
			/#
				assertmsg(("" + action_name) + "");
			#/
			return;
		}
		if(!isdefined(level.var_f467e5b0.actions[action_name]))
		{
			/#
				assertmsg(("" + action_name) + "");
			#/
			return;
		}
	#/
	if(!isdefined(level.var_f467e5b0.actions[var_e3a917a5]))
	{
		level waittillmatch({#action:var_e3a917a5}, #"hash_2fd6623a6dbe43e9");
		if(!isdefined(level.var_f467e5b0.actions[var_e3a917a5]))
		{
			/#
				assertmsg(((("" + action_name) + "") + var_e3a917a5) + "");
			#/
			return;
		}
	}
	parent = level.var_f467e5b0.actions[var_e3a917a5];
	parent.children[action_name] = level.var_f467e5b0.actions[action_name];
}

/*
	Name: function_ebc59735
	Namespace: actions
	Checksum: 0xFB64DFDF
	Offset: 0x1780
	Size: 0x108
	Parameters: 2
	Flags: None
*/
function function_ebc59735(event_name, radius)
{
	if(!isdefined(radius))
	{
		radius = 800;
	}
	ai = function_e45cbe76(self.origin, radius, self.team);
	foreach(guy in ai)
	{
		if(guy == self)
		{
			continue;
		}
		guy function_a3fcf9e0(event_name, getplayers()[0], self.origin);
	}
}

/*
	Name: function_f3f7e971
	Namespace: actions
	Checksum: 0xB253DF0B
	Offset: 0x1890
	Size: 0x90
	Parameters: 1
	Flags: None
*/
function function_f3f7e971(var_a50a7fa0)
{
	if(isstruct(var_a50a7fa0))
	{
		action = var_a50a7fa0;
		return "action_chain_enabled_" + action.var_9386e7ce;
	}
	if(isdefined(var_a50a7fa0))
	{
		var_9386e7ce = var_a50a7fa0;
		return "action_chain_enabled_" + tolower(var_9386e7ce);
	}
	return "action_chain_enabled_" + "a";
}

/*
	Name: function_303a7a74
	Namespace: actions
	Checksum: 0x6248D1E4
	Offset: 0x1928
	Size: 0xF8
	Parameters: 0
	Flags: Private
*/
function private function_303a7a74()
{
	player = getplayers()[0];
	player thread namespace_594b67e::function_76e2ec80();
	player namespace_594b67e::function_2795d678(0);
	player namespace_594b67e::allow_weapon(1, 1);
	player enableweapons();
	player val::reset_all(#"action");
	var_13a66c62 = player.var_f467e5b0.var_13a66c62[player.var_2cb06cc6.name];
	if(isdefined(var_13a66c62))
	{
		player [[var_13a66c62]](player.var_2cb06cc6);
	}
}

/*
	Name: function_fc288808
	Namespace: actions
	Checksum: 0xC17402F5
	Offset: 0x1A28
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_fc288808(quick)
{
	if(isplayer(self))
	{
		self namespace_594b67e::allow_weapon(1, 1);
	}
}

/*
	Name: function_e972f9a5
	Namespace: actions
	Checksum: 0x11A4EF8D
	Offset: 0x1A78
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_e972f9a5(quick)
{
	if(isplayer(self))
	{
		self namespace_594b67e::allow_weapon(0, 1);
	}
}

/*
	Name: function_4e61a046
	Namespace: actions
	Checksum: 0xF30DCBBC
	Offset: 0x1AC8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_4e61a046(action_name, phase)
{
	if(isdefined(action_name) && isdefined(phase))
	{
		action_name = (action_name + ":") + phase;
	}
	return action_name;
}

/*
	Name: function_3e2aeb63
	Namespace: actions
	Checksum: 0x9383DC38
	Offset: 0x1B18
	Size: 0x18
	Parameters: 1
	Flags: None
*/
function function_3e2aeb63(var_d61bdbea)
{
	return "action_command_" + var_d61bdbea;
}

/*
	Name: function_fb6a1439
	Namespace: actions
	Checksum: 0xDF5BD12D
	Offset: 0x1B38
	Size: 0xDC
	Parameters: 3
	Flags: None
*/
function function_fb6a1439(action, var_d61bdbea, var_1ad5f3d8)
{
	self endon(action.ender);
	self endon(#"death", #"disconnect");
	flag = function_3e2aeb63(var_d61bdbea);
	self flag::clear(flag);
	var_414729dc = strtok(var_d61bdbea, "_");
	self function_2f22cd0b(action, var_414729dc[0], var_414729dc[1], flag);
}

/*
	Name: function_2f22cd0b
	Namespace: actions
	Checksum: 0xBC117D38
	Offset: 0x1C20
	Size: 0xD4
	Parameters: 4
	Flags: None
*/
function function_2f22cd0b(action, command, type, flag)
{
	if(!isdefined(type))
	{
		type = "click";
	}
	if(type == "hold")
	{
		while(function_ae44e21b(action, command))
		{
			self flag::set(flag);
			waitframe(1);
		}
		self flag::clear(flag);
	}
	else
	{
		self function_9cb5ca63(action, command);
		self flag::set(flag);
	}
}

/*
	Name: function_ae44e21b
	Namespace: actions
	Checksum: 0x3F7D366A
	Offset: 0x1D00
	Size: 0x164
	Parameters: 2
	Flags: None
*/
function function_ae44e21b(action, command)
{
	if(isdefined(self.var_f467e5b0.var_c4e66a91))
	{
		return isdefined(self.var_f467e5b0.var_c4e66a91[command]);
	}
	switch(command)
	{
		case "melee":
		{
			return self meleebuttonpressed();
		}
		case "ads":
		{
			return self adsbuttonpressed();
		}
		case "use":
		{
			return self usebuttonpressed();
		}
		case "frag":
		{
			return self fragbuttonpressed();
		}
		case "smoke":
		{
			return self secondaryoffhandbuttonpressed();
		}
		case "stance":
		{
			return self stancebuttonpressed() || self buttonbitstate("BUTTON_BIT_ANY_DOWN");
		}
	}
	return 0;
}

/*
	Name: function_9cb5ca63
	Namespace: actions
	Checksum: 0x5647976B
	Offset: 0x1E70
	Size: 0x32A
	Parameters: 2
	Flags: None
*/
function function_9cb5ca63(action, command)
{
	self endon(action.ender);
	self endon(#"death", #"disconnect");
	triggername = "_plr_cmd_clk_" + command;
	if(isdefined(self.var_f467e5b0.var_c4e66a91))
	{
		waitframe(1);
		if(isdefined(self.var_f467e5b0.var_c4e66a91[command]))
		{
			return true;
		}
		self waittill(#"never");
	}
	switch(command)
	{
		case "melee":
		{
			self notifyonplayercommand(triggername, "+melee");
			self notifyonplayercommand(triggername, "+melee_breath");
			self notifyonplayercommand(triggername, "+melee_zoom");
			self thread function_7ca47b7c(action, triggername);
			break;
		}
		case "ads":
		{
			self notifyonplayercommand(triggername, "+ads_akimbo_accessible");
			break;
		}
		case "use":
		{
			self notifyonplayercommand(triggername, "+usereload");
			break;
		}
		case "frag":
		{
			self notifyonplayercommand(triggername, "+frag");
			self notifyonplayercommand(triggername, "+equip_toggle_throw");
			break;
		}
		case "smoke":
		{
			self notifyonplayercommand(triggername, "+smoke");
			self notifyonplayercommand(triggername, "+equip_toggle_throw");
			break;
		}
		case "stance":
		{
			self notifyonplayercommand(triggername, "+stance");
			self notifyonplayercommand(triggername, "+movedown");
			self notifyonplayercommand(triggername, "+lowerstance");
			self notifyonplayercommand(triggername, "+prone");
			break;
		}
		default:
		{
			return false;
		}
	}
	self waittill(triggername);
	return true;
}

/*
	Name: function_7ca47b7c
	Namespace: actions
	Checksum: 0x3C736E49
	Offset: 0x21A8
	Size: 0xF2
	Parameters: 2
	Flags: None
*/
function function_7ca47b7c(action, event)
{
	self endon(action.ender);
	self endon(#"death", #"disconnect");
	self notifyonplayercommand("player_cmd_melee_atk", "+attack");
	self notifyonplayercommand("player_cmd_melee_atk", "+attack_akimbo_accessible");
	while(true)
	{
		self waittill(#"player_cmd_melee_atk");
		weapon = self getcurrentweapon();
		if(weapons::isknife(weapon))
		{
			self notify(event);
		}
	}
}

/*
	Name: function_676e0128
	Namespace: actions
	Checksum: 0xE2AFFF3
	Offset: 0x22A8
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function function_676e0128()
{
	/#
		assert(isplayer(self));
	#/
	self notify(#"hash_177677e1af36d866");
	self endon(#"death", #"disconnect", #"hash_177677e1af36d866");
	waitframe(1);
	self prompts::function_ee7adae5(#"actions");
	function_42a5d542(self.var_2cb06cc6);
	self namespace_594b67e::function_3fbe0931();
	if(self.var_f467e5b0.enabled.size > 0)
	{
		self util::delay(0.01, undefined, &function_1c027741, "root");
	}
}

/*
	Name: function_42a5d542
	Namespace: actions
	Checksum: 0x923632FE
	Offset: 0x23D0
	Size: 0xDA
	Parameters: 2
	Flags: None
*/
function function_42a5d542(action, var_994af9bf)
{
	if(isdefined(action) && action.name != "root")
	{
		if(isdefined(action.var_1eb98b2a))
		{
			foreach(child in action.var_1eb98b2a)
			{
				if(!isdefined(var_994af9bf) || child != var_994af9bf)
				{
					self notify(child.ender);
				}
			}
		}
	}
}

/*
	Name: function_e3401e0e
	Namespace: actions
	Checksum: 0xA806A9BD
	Offset: 0x24B8
	Size: 0x3AC
	Parameters: 1
	Flags: None
*/
function function_e3401e0e(name)
{
	/#
		assert(isplayer(self));
	#/
	if(!isalive(self))
	{
		return;
	}
	self notify(#"hash_2f508e0571f37e47");
	self endon(#"death", #"disconnect", #"hash_2f508e0571f37e47");
	action = level.var_f467e5b0.actions[name];
	self thread function_1927d2a8();
	self.var_2cb06cc6 = action;
	self.var_2cb06cc6.var_43769020 = undefined;
	foreach(child in action.children)
	{
		self thread function_2fc00159(name, child);
	}
	action.var_1eb98b2a = arraycopy(action.children);
	if(!isdefined(action.var_1eb98b2a))
	{
		action.var_1eb98b2a = [];
	}
	else if(!isarray(action.var_1eb98b2a))
	{
		action.var_1eb98b2a = array(action.var_1eb98b2a);
	}
	while(action.var_1eb98b2a.size > 0)
	{
		var_9c42c399 = self function_abc34a6c();
		foreach(result in var_9c42c399)
		{
			var_2b8c0efb = result[0];
			var_994b10ae = result[1];
			/#
				assert(isdefined(var_2b8c0efb), "");
			#/
			if(is_true(var_994b10ae))
			{
				function_42a5d542(action, var_2b8c0efb);
				self thread function_e3401e0e(var_2b8c0efb.name);
				return;
			}
			if(var_2b8c0efb.ender != action.ender)
			{
				self notify(var_2b8c0efb.ender);
			}
			if(action.name == "root")
			{
				self thread function_2fc00159(name, var_2b8c0efb);
				continue;
			}
			arrayremovevalue(action.var_1eb98b2a, var_2b8c0efb);
		}
	}
}

/*
	Name: function_2fc00159
	Namespace: actions
	Checksum: 0xF2137F34
	Offset: 0x2870
	Size: 0x154
	Parameters: 2
	Flags: None
*/
function function_2fc00159(var_498c5966, action)
{
	self endon(#"hash_670dd8182b8b941");
	if(var_498c5966 == "root")
	{
		self flag::set(function_f3f7e971(action));
	}
	else
	{
		self flag::clear(function_f3f7e971(action));
	}
	waittillframeend();
	if(action.name != "root" && is_true(self.var_f467e5b0.disabled))
	{
		return;
	}
	if(!is_true(self.var_f467e5b0.enabled[action.name]))
	{
		self function_43ad32c1(action);
		return;
	}
	if(isdefined(action.var_7eba8145))
	{
		result = [[action.var_7eba8145]](action);
		self function_43ad32c1(action, result);
	}
}

/*
	Name: function_abc34a6c
	Namespace: actions
	Checksum: 0x923625A5
	Offset: 0x29D0
	Size: 0x4A
	Parameters: 0
	Flags: Private
*/
function private function_abc34a6c()
{
	self notify("656ef551329bbd5b");
	self endon("656ef551329bbd5b");
	self.var_a7c7b958 = [];
	self waittill(#"hash_41a2ad64c03a0ec3");
	return self.var_a7c7b958;
}

/*
	Name: function_43ad32c1
	Namespace: actions
	Checksum: 0xD39A689B
	Offset: 0x2A28
	Size: 0x7E
	Parameters: 2
	Flags: Private
*/
function private function_43ad32c1(action, result)
{
	if(isdefined(self) && !function_3132f113(self))
	{
		self.var_a7c7b958[self.var_a7c7b958.size] = [1:result, 0:action];
		self notify(#"hash_41a2ad64c03a0ec3");
	}
}

/*
	Name: function_d661f822
	Namespace: actions
	Checksum: 0x568703D1
	Offset: 0x2AB0
	Size: 0x420
	Parameters: 0
	Flags: None
*/
function function_d661f822()
{
	/#
		self notify(#"hash_2eaf8be0116c39a9");
		self endoncallback(&function_67860a50, #"hash_2eaf8be0116c39a9");
		var_5283788 = 8;
		self.var_56116d92 = [];
		for(i = 0; i < var_5283788; i++)
		{
			self.var_56116d92[i] = newdebughudelem();
			self.var_56116d92[i].x = 50;
			self.var_56116d92[i].y = 100 + (i * 13);
			self.var_56116d92[i].alignx = "";
			self.var_56116d92[i].aligny = "";
			self.var_56116d92[i].horzalign = "";
			self.var_56116d92[i].vertalign = "";
			self.var_56116d92[i].fontscale = 1;
		}
		while(true)
		{
			waitframe(1);
			for(i = 0; i < var_5283788; i++)
			{
				text = "";
				switch(i)
				{
					case 0:
					{
						if(isdefined(self.var_2cb06cc6))
						{
							text = text + (self.var_2cb06cc6.name + "");
							foreach(child in self.var_2cb06cc6.var_1eb98b2a)
							{
								text = text + (child.name + "");
							}
							text = text + "";
						}
						break;
					}
					case 1:
					{
						text = "";
						if(isdefined(self.takedown.body))
						{
							text = "" + self.takedown.body getentitynumber();
						}
						break;
					}
					case 2:
					{
						text = "";
						if(isdefined(self.var_6639d45b))
						{
							text = "" + self.var_6639d45b getentitynumber();
						}
						break;
					}
					case 3:
					{
						var_e817484d = (isdefined(self.takedown.var_70354814) ? self.takedown.var_70354814 : "");
						if(var_e817484d != "")
						{
							if(isdefined(getscriptbundle(var_e817484d)))
							{
								text = "" + var_e817484d;
							}
							else
							{
								text = ("" + var_e817484d) + "";
							}
						}
					}
				}
				self.var_56116d92[i] settext(text);
			}
		}
	#/
}

/*
	Name: function_67860a50
	Namespace: actions
	Checksum: 0xA70DCCFF
	Offset: 0x2ED8
	Size: 0xAA
	Parameters: 1
	Flags: Private
*/
function private function_67860a50(params)
{
	/#
		if(isdefined(self.var_56116d92))
		{
			foreach(elem in self.var_56116d92)
			{
				elem destroy();
			}
		}
		self.var_56116d92 = undefined;
	#/
}

