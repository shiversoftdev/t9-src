#using script_612bbf55ca35e077;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_78f31cd9;

/*
	Name: function_d80b0b6d
	Namespace: namespace_78f31cd9
	Checksum: 0x322D4D57
	Offset: 0x6F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d80b0b6d()
{
	level notify(-437302941);
}

#namespace namespace_1e38a8f6;

/*
	Name: init
	Namespace: namespace_1e38a8f6
	Checksum: 0xAF5E2ADA
	Offset: 0x710
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("toplayer", "RGB_keyboard_manager", 1, 3, "int", &function_f5866497, 0, 0);
	if(function_8b1a219a() && getdvarint(#"hash_cca6902a7ce5273", 0) == 1)
	{
		callback::on_localclient_connect(&localclient_connect);
		callback::on_gameplay_started(&function_9b08184);
	}
}

/*
	Name: function_9b08184
	Namespace: namespace_1e38a8f6
	Checksum: 0xF959F1F2
	Offset: 0x7E8
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_9b08184(localclientnum)
{
	player = function_5c10bd79(localclientnum);
	player thread function_9ac87769(localclientnum);
	level.var_4e740db2 = 1;
	callback::on_spawned(&function_9ac87769);
	callback::remove_callback(#"on_gameplay_started", &function_9b08184);
}

/*
	Name: localclient_connect
	Namespace: namespace_1e38a8f6
	Checksum: 0xB0187BA4
	Offset: 0x898
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function localclient_connect(localclientnum)
{
	function_13861db4(12);
	function_4d990c6a();
	function_d9a960f2(4, 12, 255, 2500, 750, 750, 0);
	if(!util::is_frontend_map())
	{
		thread function_ba24f324(localclientnum);
		thread function_1d13e2db(localclientnum);
	}
	if(sessionmodeiswarzonegame())
	{
		thread function_1d13e2db(localclientnum);
	}
}

/*
	Name: function_9ac87769
	Namespace: namespace_1e38a8f6
	Checksum: 0xDE81220
	Offset: 0x970
	Size: 0x22C
	Parameters: 1
	Flags: Linked
*/
function function_9ac87769(localclientnum)
{
	self endon(#"round_ended");
	player = function_5c10bd79(localclientnum);
	if(!isdefined(player) || self != player || function_1cbf351b(localclientnum) || function_65b9eb0f(localclientnum))
	{
		return;
	}
	function_4d990c6a();
	player thread function_43a84577();
	player thread function_cfd06f57(localclientnum);
	player thread function_1edfdbc1(localclientnum);
	player thread function_161106e1(localclientnum);
	player thread function_a78bbf22(localclientnum);
	player thread function_1183b860(localclientnum);
	if(!sessionmodeiswarzonegame() && !sessionmodeiszombiesgame())
	{
		player thread function_af712255(localclientnum);
	}
	if(is_true(level.playerinsertion))
	{
		if(!isdefined(level.var_51e99b46) || level.var_51e99b46 != 2)
		{
			player thread function_9d6500b(localclientnum);
		}
	}
	player waittill(#"death");
	function_13861db4(12);
	function_4d990c6a();
	function_d9a960f2(1, 12, 255);
}

/*
	Name: function_43a84577
	Namespace: namespace_1e38a8f6
	Checksum: 0x7DF5EF0F
	Offset: 0xBA8
	Size: 0x218
	Parameters: 0
	Flags: Linked
*/
function function_43a84577()
{
	level endon(#"game_ended");
	var_48c05b87 = array("+forward", "+moveleft", "+moveright", "+back");
	foreach(key in var_48c05b87)
	{
		function_b4c6383f(self function_c2a5ba97(key), 1, 15066083);
	}
	function_b4c6383f(self function_c2a5ba97("chatmodelast"), 1, 15327545);
	if(is_true(level.playerinsertion))
	{
		var_81fa6e00 = array("togglemap", "+map", "+inventory", "toggleinventory");
		foreach(key in var_81fa6e00)
		{
			function_b4c6383f(self function_c2a5ba97(key), 1, 65535);
		}
	}
}

/*
	Name: function_1183b860
	Namespace: namespace_1e38a8f6
	Checksum: 0x4A545077
	Offset: 0xDC8
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function function_1183b860(localclientnum)
{
	self endon(#"death");
	level endon(#"game_ended");
	player = function_5c10bd79(localclientnum);
	while(!is_true(level.gameended))
	{
		player waittill(#"weapon_fired");
		cooldowntime = 66;
		if(isdefined(player.weapon.firetime))
		{
			cooldowntime = int(player.weapon.firetime * 1000);
		}
		function_d9a960f2(2, 1, 65535, 255, cooldowntime);
	}
}

/*
	Name: function_cfd06f57
	Namespace: namespace_1e38a8f6
	Checksum: 0xCC2DC416
	Offset: 0xED0
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function function_cfd06f57(localclientnum)
{
	self endon(#"death");
	while(!is_true(level.gameended))
	{
		if(isdefined(level.var_d081e853) && level.var_d081e853)
		{
			function_d9a960f2(4, 12, 12562539, 300, 200, 200, 0);
		}
		else
		{
			if(isswimming(localclientnum))
			{
				function_d9a960f2(4, 12, 16711680, 300, 200, 200, 0);
			}
			else
			{
				function_d9a960f2(1, 12, 255);
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_1edfdbc1
	Namespace: namespace_1e38a8f6
	Checksum: 0xC9C1DDEF
	Offset: 0xFD8
	Size: 0x248
	Parameters: 1
	Flags: Linked
*/
function function_1edfdbc1(localclientnum)
{
	self endon(#"death");
	self endon(#"disconnect");
	var_7beb3a32 = array("key_f1", "key_f2", "key_f3", "key_f4");
	while(!is_true(level.gameended))
	{
		var_38d92d79 = function_5c10bd79(localclientnum);
		if(!isdefined(var_38d92d79))
		{
			break;
		}
		current_health = renderhealthoverlayhealth(localclientnum);
		basehealth = var_38d92d79 getplayerspawnhealth();
		n_health = current_health * basehealth;
		if(n_health > 125)
		{
			namespace_1b041925::function_815076cb(var_7beb3a32, 65280);
		}
		else
		{
			if(n_health > 100)
			{
				namespace_1b041925::function_815076cb(var_7beb3a32, 65535);
			}
			else
			{
				if(n_health > 75)
				{
					namespace_1b041925::function_815076cb(var_7beb3a32, 1328480);
				}
				else
				{
					if(n_health > 50)
					{
						namespace_1b041925::function_815076cb(var_7beb3a32, 255);
					}
					else
					{
						if(n_health > 25)
						{
							namespace_1b041925::function_119b3b6b(var_7beb3a32, 255, 300, 200, 200, 0);
						}
						else
						{
							if(n_health > 0)
							{
								namespace_1b041925::function_119b3b6b(var_7beb3a32, 255, 200, 50, 50, 0);
							}
							else
							{
								namespace_1b041925::function_815076cb(var_7beb3a32, 1711648);
							}
						}
					}
				}
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_161106e1
	Namespace: namespace_1e38a8f6
	Checksum: 0xF4E872A2
	Offset: 0x1228
	Size: 0x180
	Parameters: 1
	Flags: Linked
*/
function function_161106e1(localclientnum)
{
	self endon(#"death");
	var_834a617c = array("key_f8", "key_f7", "key_f6", "key_f5");
	while(!is_true(level.gameended))
	{
		w_currentweapon = getcurrentweapon(localclientnum);
		var_4c47f204 = getweaponammoclip(localclientnum, w_currentweapon);
		n_clipsize = w_currentweapon.clipsize;
		if(n_clipsize > 0)
		{
			var_102d6996 = var_4c47f204 / n_clipsize;
		}
		else
		{
			var_102d6996 = 0;
		}
		for(var_ef80e13b = 0; var_ef80e13b < var_834a617c.size; var_ef80e13b++)
		{
			if(var_102d6996 > var_ef80e13b / var_834a617c.size)
			{
				function_b4c6383f(var_834a617c[var_ef80e13b], 1, 842827);
				continue;
			}
			function_b4c6383f(var_834a617c[var_ef80e13b], 1, 1711648);
		}
		wait(0.5);
	}
}

/*
	Name: function_a78bbf22
	Namespace: namespace_1e38a8f6
	Checksum: 0xCB56E02B
	Offset: 0x13B0
	Size: 0x3A8
	Parameters: 1
	Flags: Linked
*/
function function_a78bbf22(localclientnum)
{
	self endon(#"death");
	level endon(#"keybind_change");
	if(is_true(level.playerinsertion))
	{
		a_keys = array(self function_c2a5ba97("+frag"), self function_c2a5ba97("+smoke"));
		self.var_9623f1d5 = array(0, 0);
	}
	else
	{
		if(sessionmodeiszombiesgame())
		{
			a_keys = array(self function_c2a5ba97("+smoke"), self function_c2a5ba97("+frag"), self function_c2a5ba97("+weapoffhandspecial"));
			self.var_9623f1d5 = array(0, 0, 0);
		}
		else
		{
			a_keys = array(self function_c2a5ba97("+frag"), self function_c2a5ba97("+smoke"), self function_c2a5ba97("+weapoffhandspecial"));
			self.var_9623f1d5 = array(0, 0, 0);
		}
	}
	namespace_1b041925::function_815076cb(a_keys, 1711648);
	if(sessionmodeiszombiesgame())
	{
		function_5e0ffde3(self function_c2a5ba97("+smoke"));
	}
	while(!is_true(level.gameended))
	{
		for(ga = 0; ga < a_keys.size; ga++)
		{
			gadgetpower = getgadgetpower(localclientnum, ga);
			if(sessionmodeiszombiesgame())
			{
				if(ga == 0)
				{
					continue;
				}
				else if(ga == 1)
				{
					gadgetpower = gadgetisready(localclientnum, ga);
				}
			}
			if(isdefined(gadgetpower) && gadgetpower == 1 && is_false(self.var_9623f1d5[ga]))
			{
				self.var_9623f1d5[ga] = 1;
				self thread function_c6bcf243(a_keys[ga], ga, localclientnum);
				continue;
			}
			if(isdefined(gadgetpower) && gadgetpower != 1)
			{
				function_b4c6383f(a_keys[ga], 1, 1711648);
				self.var_9623f1d5[ga] = 0;
			}
		}
		wait(0.5);
	}
}

/*
	Name: function_c6bcf243
	Namespace: namespace_1e38a8f6
	Checksum: 0x9E0BBE1
	Offset: 0x1760
	Size: 0x124
	Parameters: 3
	Flags: Linked
*/
function function_c6bcf243(var_35a126c, var_b742c891, localclientnum)
{
	self endon(#"death");
	level endon(#"game_ended", #"keybind_change");
	function_b4c6383f(var_35a126c, 3, 63487, 855309, 275, 0);
	for(i = 0; i < 160; i++)
	{
		if(is_true(getgadgetpower(localclientnum, var_b742c891)))
		{
			waitframe(1);
			continue;
		}
		function_b4c6383f(var_35a126c, 1, 8698);
		self.var_9623f1d5[var_b742c891] = 0;
		return;
	}
	function_b4c6383f(var_35a126c, 1, 63487);
}

/*
	Name: function_ba24f324
	Namespace: namespace_1e38a8f6
	Checksum: 0x64FFFE6C
	Offset: 0x1890
	Size: 0x150
	Parameters: 1
	Flags: Linked
*/
function function_ba24f324(localclientnum)
{
	level endon(#"game_ended");
	while(!is_true(level.gameended))
	{
		self waittill(#"keybind_change");
		function_4d990c6a();
		player = function_27673a7(localclientnum);
		player function_43a84577();
		player thread function_a78bbf22(localclientnum);
		if(!sessionmodeiswarzonegame() && !sessionmodeiszombiesgame())
		{
			player thread function_af712255(localclientnum);
		}
		if(is_true(level.playerinsertion))
		{
			if(!isdefined(level.var_51e99b46) || level.var_51e99b46 != 2)
			{
				player thread function_9d6500b();
			}
		}
	}
}

/*
	Name: function_218c905c
	Namespace: namespace_1e38a8f6
	Checksum: 0xF619D52A
	Offset: 0x19E8
	Size: 0x1E0
	Parameters: 2
	Flags: Linked
*/
function function_218c905c(localclientnum, winningteam)
{
	self endon(#"death");
	player = function_5c10bd79(localclientnum);
	var_a4b49a65 = array("key_f9", "key_f10", "key_f11", "key_f12");
	color = undefined;
	if(!isalive(player) && !isdefined(player) || self != player || function_1cbf351b(localclientnum) || function_65b9eb0f(localclientnum))
	{
		return;
	}
	if(winningteam == "tie")
	{
		color = 3354927;
	}
	else
	{
		if(winningteam == player.team)
		{
			color = 16390144;
		}
		else if(winningteam != player.team)
		{
			color = 2219760;
		}
	}
	if(isdefined(color))
	{
		foreach(key in var_a4b49a65)
		{
			function_b4c6383f(key, 1, color);
		}
	}
}

/*
	Name: function_1d13e2db
	Namespace: namespace_1e38a8f6
	Checksum: 0xB5ADFBCC
	Offset: 0x1BD0
	Size: 0x69C
	Parameters: 1
	Flags: Linked
*/
function function_1d13e2db(localclientnum)
{
	level endon(#"game_ended");
	var_1953ea4a = array("key_escape", "key_f1", "key_f2", "key_f3", "key_f4", "key_f5", "key_f6", "key_f7", "key_f8", "key_f9", "key_f10", "key_f11", "key_f12", "key_sysrq", "key_scroll", "key_pause");
	var_d3aa0bca = array("key_grave", "key_numlock", "key_multiply", "key_divide", "key_subtract", "key_1", "key_2", "key_3", "key_4", "key_5", "key_6", "key_7", "key_8", "key_9", "key_0", "key_minus", "key_equals", "key_back", "key_insert", "key_home", "key_prior");
	var_58bfadf9 = array("key_numpad9", "key_numpad8", "key_numpad7", "key_add", "key_tab", "key_q", "key_w", "key_e", "key_r", "key_t", "key_y", "key_u", "key_i", "key_o", "key_p", "key_lbracket", "key_rbracket", "key_backslash", "key_delete", "key_end", "key_next");
	var_cae37ef = array("key_numpad6", "key_numpad5", "key_numpad4", "key_capital", "key_a", "key_s", "key_d", "key_f", "key_g", "key_h", "key_j", "key_k", "key_l", "key_semicolon", "key_apostrophe", "key_return");
	var_d3f32152 = array("key_numpad3", "key_numpad2", "key_numpad1", "key_lshift", "key_z", "key_x", "key_c", "key_v", "key_b", "key_n", "key_m", "key_comma", "key_period", "key_slash", "key_rshift", "key_numpadenter", "key_up");
	var_1a5105a9 = array("key_numpad0", "key_decimal", "key_left", "key_down", "key_right", "key_lcontrol", "key_rcontrol", "key_lwin", "key_lmenu", "key_rmenu", "key_apps", "key_fn");
	var_7f1c5ce2 = getuimodel(function_5f72e972(#"hash_410fe12a68d6e801"), "gameStartSecondsRemaining");
	previoustime = 0;
	while(!is_true(level.gameended))
	{
		var_20ef87f3 = getuimodelvalue(var_7f1c5ce2);
		if(isdefined(var_20ef87f3))
		{
			if(var_20ef87f3 > 0 && var_20ef87f3 != previoustime)
			{
				if(!sessionmodeiswarzonegame())
				{
					function_d9a960f2(1, 12, 255);
					namespace_1b041925::function_815076cb(var_1953ea4a, 1711648);
				}
				if(var_20ef87f3 == 5)
				{
					if(sessionmodeiswarzonegame())
					{
						function_d9a960f2(1, 12, 255);
						namespace_1b041925::function_815076cb(var_1953ea4a, 1711648);
					}
					namespace_1b041925::function_ed8d6d5e(var_d3aa0bca, 255, 1711648, 750);
				}
				else
				{
					if(var_20ef87f3 == 4)
					{
						namespace_1b041925::function_ed8d6d5e(var_58bfadf9, 255, 1711648, 750);
					}
					else
					{
						if(var_20ef87f3 == 3)
						{
							namespace_1b041925::function_ed8d6d5e(var_cae37ef, 255, 1711648, 750);
						}
						else
						{
							if(var_20ef87f3 == 2)
							{
								namespace_1b041925::function_ed8d6d5e(var_d3f32152, 255, 1711648, 750);
							}
							else if(var_20ef87f3 == 1)
							{
								function_d9a960f2(2, 12, 255, 1711648, 750);
							}
						}
					}
				}
				previoustime = var_20ef87f3;
			}
			else if(var_20ef87f3 == 0)
			{
				previoustime = 0;
				function_13861db4(12);
				break;
			}
		}
		wait(0.3);
	}
}

/*
	Name: function_af712255
	Namespace: namespace_1e38a8f6
	Checksum: 0xCEEB496D
	Offset: 0x2278
	Size: 0x300
	Parameters: 1
	Flags: Linked
*/
function function_af712255(localclientnum)
{
	self endon(#"death");
	level endon(#"game_ended", #"keybind_change");
	parentmodel = function_1df4c3b0(localclientnum, #"hash_38b7a28901866ae4");
	var_f15e30b1 = getuimodel(parentmodel, "momentumPercentage");
	var_2163222 = getuimodel(parentmodel, "killstreak0");
	var_e6eb8fc9 = getuimodel(parentmodel, "killstreak1");
	var_7bb0cd4 = getuimodel(parentmodel, "killstreak2");
	var_57e596e3 = getuimodel(parentmodel, "killstreak3");
	var_a74def26 = array(var_2163222, var_e6eb8fc9, var_7bb0cd4, var_57e596e3);
	var_80324f69 = array(self function_c2a5ba97("scorestreak1"), self function_c2a5ba97("scorestreak2"), self function_c2a5ba97("scorestreak3"), self function_c2a5ba97("scorestreak4"));
	while(!is_true(level.gameended))
	{
		var_e1c5622e = getuimodelvalue(var_f15e30b1);
		for(i = 0; i < var_a74def26.size; i++)
		{
			var_c36aee76 = getuimodel(var_a74def26[i], "rewardAmmo");
			var_40e153d9 = getuimodelvalue(var_c36aee76);
			if(isdefined(var_40e153d9) && var_40e153d9 > 0)
			{
				function_b4c6383f(var_80324f69[i], 3, 65535, 1711648, 275, 0);
				continue;
			}
			function_b4c6383f(var_80324f69[i], 1, 1711648);
		}
		wait(0.5);
	}
}

/*
	Name: function_9d6500b
	Namespace: namespace_1e38a8f6
	Checksum: 0xE2B921DD
	Offset: 0x2580
	Size: 0x154
	Parameters: 1
	Flags: Linked
*/
function function_9d6500b(localclientnum)
{
	self endon(#"death", #"freefallend");
	level endon(#"keybind_change");
	if(isdefined(level.var_51e99b46) && level.var_51e99b46 == 2)
	{
		return;
	}
	if(!isdefined(level.var_51e99b46))
	{
		level.var_51e99b46 = 0;
	}
	if(level.var_51e99b46 == 0)
	{
		level waittill(#"hash_5975d5f569535c41");
		level.var_51e99b46 = 1;
	}
	var_da854aa8 = self function_c2a5ba97("+activate");
	function_b4c6383f(var_da854aa8, 3, 63487, 855309, 275, 0);
	level waittill(#"hash_413d64e47311dcf8");
	function_5e0ffde3(var_da854aa8);
	level.var_51e99b46 = 2;
}

/*
	Name: function_f5866497
	Namespace: namespace_1e38a8f6
	Checksum: 0x8F473906
	Offset: 0x26E0
	Size: 0x17A
	Parameters: 7
	Flags: Linked
*/
function function_f5866497(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	player = function_5c10bd79(fieldname);
	if(!isdefined(level) && !isdefined(level.var_4e740db2) && level.var_4e740db2 == 0)
	{
		return;
	}
	switch(bwastimejump)
	{
		case 1:
		{
			function_218c905c(fieldname, "tie");
			break;
		}
		case 2:
		{
			function_218c905c(fieldname, "allies");
			break;
		}
		case 3:
		{
			function_218c905c(fieldname, "axis");
			break;
		}
		case 4:
		{
			level notify(#"hash_7d7ad8f95ddcdcbd");
			break;
		}
		default:
		{
			break;
		}
	}
}

