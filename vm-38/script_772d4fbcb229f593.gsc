#using script_221cb3c0b91a347a;
#using script_5bb072c3abf4652c;
#using script_b9d273dc917ee1f;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_9771a88f;

/*
	Name: function_4a58c0e9
	Namespace: namespace_9771a88f
	Checksum: 0x24861816
	Offset: 0xC00
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4a58c0e9()
{
	level notify(1608350592);
}

/*
	Name: init
	Namespace: namespace_9771a88f
	Checksum: 0x26F6C03F
	Offset: 0xC20
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.var_f9d84559 = #"hash_30060ec2da14e93d";
	level thread function_9469a0c4();
	level thread function_a2a8d090();
	level thread function_b65c4342();
	level thread function_5df7275b();
	callback::on_ai_killed(&function_ed634081);
	/#
		level thread function_cd7a3de4();
	#/
}

/*
	Name: function_9469a0c4
	Namespace: namespace_9771a88f
	Checksum: 0x94C4EF02
	Offset: 0xCE0
	Size: 0x184
	Parameters: 0
	Flags: Linked
*/
function function_9469a0c4()
{
	level flag::wait_till("initial_blackscreen_passed");
	level.var_114b6e35 = array::random([2:"grey", 1:"carver", 0:"strauss"]);
	wait(3.5);
	level function_d137d6a0(#"hash_1b7c7a29a85242f0", #"hash_1b7c6a29a85227c0", #"hash_1b7c6e29a8522e8c");
	level flag::wait_till(#"intro_scene_done");
	wait(1);
	level zm_vo::function_7622cb70(array::random([3:#"hash_6de3a2c3b8452ea", 2:#"hash_6de352c3b844a6b", 1:#"hash_6de342c3b8448b8", 0:#"hash_6de372c3b844dd1"]));
	level flag::set(#"hash_4ae6b839df55ee2a");
}

/*
	Name: function_b922d5d7
	Namespace: namespace_9771a88f
	Checksum: 0x387383BB
	Offset: 0xE70
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function function_b922d5d7()
{
	level endon(#"end_game", #"hash_3b763d6426336ce0");
	while(true)
	{
		level waittill(#"start_of_round");
		if(level.round_number > 1)
		{
			function_752b5c36(#"hash_4a14d6908e12483c", 0);
		}
	}
}

/*
	Name: function_b65c4342
	Namespace: namespace_9771a88f
	Checksum: 0xBA0C8F9D
	Offset: 0xF00
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_b65c4342()
{
	level endon(#"end_game");
	level flag::wait_till(#"intro_scene_done");
	level thread namespace_4abf1500::function_d0e6ff7a("zmintel_tungsten_maxis_audiolog_2", undefined, 250);
}

/*
	Name: function_a2a8d090
	Namespace: namespace_9771a88f
	Checksum: 0x3734AFFD
	Offset: 0xF68
	Size: 0x934
	Parameters: 0
	Flags: Linked
*/
function function_a2a8d090()
{
	function_6a56c294(1, [3:"vox_zamr_env_gj1_gorv_3", 2:"vox_zamr_env_gj1_jagr_2", 1:"vox_zamr_env_gj1_gorv_1", 0:"vox_zamr_env_gj1_jagr_0"]);
	function_6a56c294(1, [3:"vox_zamr_env_gj2_jagr_3", 2:"vox_zamr_env_gj2_gorv_2", 1:"vox_zamr_env_gj2_jagr_1", 0:"vox_zamr_env_gj2_gorv_0"]);
	function_6a56c294(1, [3:"vox_zamr_env_gj3_jagr_3", 2:"vox_zamr_env_gj3_gorv_2", 1:"vox_zamr_env_gj3_jagr_1", 0:"vox_zamr_env_gj3_gorv_0"]);
	function_6a56c294(1, [3:"vox_zamr_env_gj4_gorv_3", 2:"vox_zamr_env_gj4_jagr_2", 1:"vox_zamr_env_gj4_gorv_1", 0:"vox_zamr_env_gj4_jagr_0"]);
	function_6a56c294(1, [3:"vox_zamr_env_gj5_jagr_3", 2:"vox_zamr_env_gj5_krav_2", 1:"vox_zamr_env_gj5_gorv_1", 0:"vox_zamr_env_gj5_jagr_0"]);
	function_6a56c294(1, [6:"vox_zamr_env_gj6_jagr_6", 5:"vox_zamr_env_gj6_jagr_5", 4:"vox_zamr_env_gj6_gorv_4", 3:"vox_zamr_env_gj6_jagr_3", 2:"vox_zamr_env_gj6_krav_2", 1:"vox_zamr_env_gj6_jagr_1", 0:"vox_zamr_env_gj6_gorv_0"]);
	function_6a56c294(2, [4:"vox_zamr_env_kp1_krav_4", 3:"vox_zamr_env_kp1_peck_3", 2:"vox_zamr_env_kp1_krav_2", 1:"vox_zamr_env_kp1_peck_1", 0:"vox_zamr_env_kp1_krav_0"]);
	function_6a56c294(2, [5:"vox_zamr_env_kp2_peck_5", 4:"vox_zamr_env_kp2_krav_4", 3:"vox_zamr_env_kp2_krav_3", 2:"vox_zamr_env_kp2_krav_2", 1:"vox_zamr_env_kp2_peck_1", 0:"vox_zamr_env_kp2_krav_0"]);
	function_6a56c294(2, [4:"vox_zamr_env_kp3_krav_4", 3:"vox_zamr_env_kp3_peck_3", 2:"vox_zamr_env_kp3_krav_2", 1:"vox_zamr_env_kp3_peck_1", 0:"vox_zamr_env_kp3_krav_0"]);
	function_6a56c294(2, [3:"vox_zamr_env_kp4_krav_3", 2:"vox_zamr_env_kp4_peck_2", 1:"vox_zamr_env_kp4_peck_1", 0:"vox_zamr_env_kp4_krav_0"]);
	function_6a56c294(2, [5:"vox_zamr_env_kp5_krav_5", 4:"vox_zamr_env_kp5_peck_4", 3:"vox_zamr_env_kp5_krav_3", 2:"vox_zamr_env_kp5_peck_2", 1:"vox_zamr_env_kp5_krav_1", 0:"vox_zamr_env_kp5_krav_0"]);
	function_6a56c294(2, [6:"vox_zamr_env_kp6_peck_6", 5:"vox_zamr_env_kp6_krav_5", 4:"vox_zamr_env_kp6_peck_4", 3:"vox_zamr_env_kp6_peck_3", 2:"vox_zamr_env_kp6_krav_2", 1:"vox_zamr_env_kp6_peck_1", 0:"vox_zamr_env_kp6_krav_0"]);
	function_6a56c294(3, [2:"vox_zamr_env_f1_fskn_2", 1:"vox_zamr_env_f1_fskn_1", 0:"vox_zamr_env_f1_fskn_0"]);
	function_6a56c294(3, [1:"vox_zamr_env_f2_fskn_1", 0:"vox_zamr_env_f2_fskn_0"]);
	function_6a56c294(3, [2:"vox_zamr_env_f3_fskn_2", 1:"vox_zamr_env_f3_fskn_1", 0:"vox_zamr_env_f3_fskn_0"]);
	function_6a56c294(3, [1:"vox_zamr_env_f4_fskn_1", 0:"vox_zamr_env_f4_fskn_0"]);
	function_6a56c294(3, [2:"vox_zamr_env_f5_fskn_2", 1:"vox_zamr_env_f5_fskn_1", 0:"vox_zamr_env_f5_fskn_0"]);
	function_6a56c294(3, [2:"vox_zamr_env_f6_fskn_2", 1:"vox_zamr_env_f6_fskn_1", 0:"vox_zamr_env_f6_fskn_0"]);
	function_6a56c294(3, [6:"vox_zamr_env_f7_fskn_6", 5:"vox_zamr_env_f7_fskn_5", 4:"vox_zamr_env_f7_fskn_4", 3:"vox_zamr_env_f7_fskn_3", 2:"vox_zamr_env_f7_fskn_2", 1:"vox_zamr_env_f7_fskn_1", 0:"vox_zamr_env_f7_fskn_0"]);
	function_6a56c294(0, [1:"vox_zamr_env_r1_rvnv_1", 0:"vox_zamr_env_r1_rvnv_0"]);
	function_6a56c294(0, [1:"vox_zamr_env_r2_rvnv_1", 0:"vox_zamr_env_r2_rvnv_0"]);
	function_6a56c294(0, [1:"vox_zamr_env_r3_rvnv_1", 0:"vox_zamr_env_r3_rvnv_0"]);
	function_6a56c294(0, [1:"vox_zamr_env_r4_rvnv_1", 0:"vox_zamr_env_r4_rvnv_0"]);
	function_6a56c294(0, [2:"vox_zamr_env_r5_rvnv_2", 1:"vox_zamr_env_r5_rvnv_1", 0:"vox_zamr_env_r5_rvnv_0"]);
	function_6a56c294(0, [2:"vox_zamr_env_r6_rvnv_2", 1:"vox_zamr_env_r6_rvnv_1", 0:"vox_zamr_env_r6_rvnv_0"]);
	function_325524a5(0, undefined, #"hash_264e763f3fa44810", 3, 5, 0);
	function_325524a5(1, undefined, #"hash_264e763f3fa44810", 3, 5, 1);
	function_325524a5(2, undefined, #"hash_264e763f3fa44810", 3, 5, 2);
	function_325524a5(3, #"hash_264e763f3fa44810", undefined, undefined, 6, 3);
}

/*
	Name: function_6a56c294
	Namespace: namespace_9771a88f
	Checksum: 0xB2A08F5F
	Offset: 0x18A8
	Size: 0x122
	Parameters: 2
	Flags: Linked
*/
function function_6a56c294(var_68325b4b, var_c2d1b468)
{
	var_ee4b588 = function_70e3ac08(var_68325b4b);
	if(!isarray(level.var_f1ac6029[var_ee4b588]))
	{
		if(!isdefined(level.var_f1ac6029[var_ee4b588]))
		{
			level.var_f1ac6029[var_ee4b588] = [];
		}
	}
	if(isdefined(var_c2d1b468))
	{
		if(!isdefined(level.var_f1ac6029[var_ee4b588]))
		{
			level.var_f1ac6029[var_ee4b588] = [];
		}
		else if(!isarray(level.var_f1ac6029[var_ee4b588]))
		{
			level.var_f1ac6029[var_ee4b588] = array(level.var_f1ac6029[var_ee4b588]);
		}
		level.var_f1ac6029[var_ee4b588][level.var_f1ac6029[var_ee4b588].size] = var_c2d1b468;
	}
}

/*
	Name: function_325524a5
	Namespace: namespace_9771a88f
	Checksum: 0x84D0FC1C
	Offset: 0x19D8
	Size: 0x1E2
	Parameters: 6
	Flags: Linked
*/
function function_325524a5(n_index, var_3e2f8a8e, var_d1c178a, var_2b65c496, var_4c2e6c3e, var_68325b4b)
{
	level endon(#"end_game");
	if(isdefined(n_index))
	{
		var_88b09f83 = getentarray("environmental_vo_radio", "targetname");
		var_b57b8b27 = namespace_dbaeabbd::function_80fdd2aa(var_88b09f83, n_index);
		if(n_index == 3)
		{
			var_b57b8b27 hide();
		}
	}
	else
	{
		var_88b09f83 = getentarray("environmental_vo_radio", "targetname");
		var_b57b8b27 = var_88b09f83[0];
	}
	var_b57b8b27.var_3e2f8a8e = var_3e2f8a8e;
	var_b57b8b27.var_d1c178a = var_d1c178a;
	var_b57b8b27.var_2b65c496 = var_2b65c496;
	var_b57b8b27.var_4c2e6c3e = var_4c2e6c3e;
	var_b57b8b27.var_df272b25 = 0;
	var_b57b8b27.var_c2d1b468 = function_70e3ac08(var_68325b4b);
	var_b57b8b27.var_ed73ac32 = 0;
	if(isdefined(var_3e2f8a8e))
	{
		level flag::wait_till(var_3e2f8a8e);
	}
	if(n_index === 3)
	{
		var_b57b8b27 show();
	}
	var_c826e70 = var_b57b8b27 zm_unitrigger::create(&function_81e4abd, 64, &function_d8cb1a45);
	var_c826e70.var_b57b8b27 = var_b57b8b27;
}

/*
	Name: function_70e3ac08
	Namespace: namespace_9771a88f
	Checksum: 0x21F15716
	Offset: 0x1BC8
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_70e3ac08(index)
{
	switch(index)
	{
		case 0:
		{
			return "zamr_env_nar_r";
			break;
		}
		case 1:
		{
			return "zamr_env_nar_j_g";
			break;
		}
		case 2:
		{
			return "zamr_env_nar_k_p";
			break;
		}
		case 3:
		{
			return "zamr_env_nar_f";
			break;
		}
		default:
		{
			break;
		}
	}
}

/*
	Name: function_81e4abd
	Namespace: namespace_9771a88f
	Checksum: 0x5DC52C40
	Offset: 0x1C78
	Size: 0x1B4
	Parameters: 1
	Flags: Linked
*/
function function_81e4abd(player)
{
	if(isplayer(player))
	{
		if(is_true(self.stub.var_b57b8b27.var_ed73ac32))
		{
			return false;
		}
		if(isdefined(self.stub.var_b57b8b27.var_d1c178a))
		{
			if(level flag::get(self.stub.var_b57b8b27.var_d1c178a))
			{
				self sethintstring(#"hash_7438d0d92b1eb60");
				return true;
			}
			if(isdefined(self.stub.var_b57b8b27.var_2b65c496) && self.stub.var_b57b8b27.var_df272b25 < self.stub.var_b57b8b27.var_2b65c496)
			{
				self sethintstring(#"hash_7438d0d92b1eb60");
				return true;
			}
			return false;
		}
		if(self.stub.var_b57b8b27.var_df272b25 <= self.stub.var_b57b8b27.var_4c2e6c3e)
		{
			self sethintstring(#"hash_7438d0d92b1eb60");
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_d8cb1a45
	Namespace: namespace_9771a88f
	Checksum: 0xEA068ECE
	Offset: 0x1E38
	Size: 0x2F0
	Parameters: 0
	Flags: Linked
*/
function function_d8cb1a45()
{
	level endon(#"end_game");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"trigger");
		if(isplayer(waitresult.activator))
		{
			if(!is_true(self.stub.var_b57b8b27.var_ed73ac32))
			{
				if(isdefined(self.stub.var_b57b8b27.var_d1c178a))
				{
					if(level flag::get(self.stub.var_b57b8b27.var_d1c178a))
					{
						if(isdefined(self.stub.var_b57b8b27.var_2b65c496) && self.stub.var_b57b8b27.var_df272b25 < self.stub.var_b57b8b27.var_2b65c496)
						{
							self.stub.var_b57b8b27.var_df272b25 = self.stub.var_b57b8b27.var_2b65c496;
						}
						level thread function_17b8d833(self.stub.var_b57b8b27, self.stub.var_b57b8b27.var_df272b25);
					}
					else if(isdefined(self.stub.var_b57b8b27.var_2b65c496) && self.stub.var_b57b8b27.var_df272b25 < self.stub.var_b57b8b27.var_2b65c496)
					{
						level thread function_17b8d833(self.stub.var_b57b8b27, self.stub.var_b57b8b27.var_df272b25);
					}
				}
				else if(self.stub.var_b57b8b27.var_df272b25 <= self.stub.var_b57b8b27.var_4c2e6c3e)
				{
					level thread function_17b8d833(self.stub.var_b57b8b27, self.stub.var_b57b8b27.var_df272b25);
				}
				if(self.stub.var_b57b8b27.var_df272b25 >= self.stub.var_b57b8b27.var_4c2e6c3e)
				{
					waitframe(5);
					zm_unitrigger::unregister_unitrigger(self.stub);
				}
			}
		}
	}
}

/*
	Name: function_17b8d833
	Namespace: namespace_9771a88f
	Checksum: 0xD9CE1EAF
	Offset: 0x2130
	Size: 0x130
	Parameters: 2
	Flags: Linked
*/
function function_17b8d833(entity, index)
{
	level endon(#"end_game");
	entity.var_ed73ac32 = 1;
	if(isdefined(level.var_f1ac6029[entity.var_c2d1b468][index]))
	{
		for(i = 0; i < level.var_f1ac6029[entity.var_c2d1b468][index].size; i++)
		{
			str_vo = level.var_f1ac6029[entity.var_c2d1b468][index][i];
			if(isdefined(entity))
			{
				entity zm_vo::function_d6f8bbd9(level.var_f1ac6029[entity.var_c2d1b468][index][i]);
				wait(0.5);
				if(!isdefined(entity))
				{
					break;
				}
			}
		}
	}
	level waittill(#"end_of_round");
	if(isdefined(entity))
	{
		entity.var_ed73ac32 = 0;
		entity.var_df272b25++;
	}
}

/*
	Name: function_1402bc5a
	Namespace: namespace_9771a88f
	Checksum: 0x6207B6C6
	Offset: 0x2268
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_1402bc5a()
{
	level endon(#"end_game");
	function_752b5c36(#"hash_303746a439521b44", undefined);
	var_e0c6386f = array::random([2:#"hash_2703b65b8783e855", 1:#"hash_2703b55b8783e6a2", 0:#"hash_2703b45b8783e4ef"]);
	var_40feefce = array::random([2:#"hash_33bb465bd7d20305", 1:#"hash_33bb455bd7d20152", 0:#"hash_33bb445bd7d1ff9f"]);
	var_c4ad7aa9 = array::random([2:#"hash_545c625be9bab099", 1:#"hash_545c615be9baaee6", 0:#"hash_545c605be9baad33"]);
	function_d137d6a0(var_e0c6386f, var_40feefce, var_c4ad7aa9);
	level waittill(#"hash_18e0d0074c789872");
	level thread function_752b5c36(#"hash_55b6f2f810169225", undefined);
}

/*
	Name: function_dc17412a
	Namespace: namespace_9771a88f
	Checksum: 0xCBAAE7A6
	Offset: 0x2430
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function function_dc17412a()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	self function_b5b0518b(#"hash_6f657fca3d525107", undefined);
	str_vo = array::random([3:#"hash_17e5c13193f48e69", 2:#"hash_17e5c23193f4901c", 1:#"hash_17e5c33193f491cf", 0:#"hash_17e5c43193f49382"]);
	self zm_vo::function_7622cb70(str_vo);
}

/*
	Name: function_23e9435d
	Namespace: namespace_9771a88f
	Checksum: 0xFBA9E89D
	Offset: 0x2530
	Size: 0x16C
	Parameters: 0
	Flags: Linked
*/
function function_23e9435d()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	var_88e4eea = array::random([3:#"hash_690f512043db01eb", 2:#"hash_690f562043db0a6a", 1:#"hash_690f572043db0c1d", 0:#"hash_690f542043db0704"]);
	self zm_vo::function_7622cb70(var_88e4eea);
	wait(1);
	var_426a22ac = array::random([3:#"hash_7a39a7204d889d4d", 2:#"hash_7a39a0204d889168", 1:#"hash_7a39a1204d88931b", 0:#"hash_7a39a2204d8894ce"]);
	self zm_vo::function_7622cb70(var_426a22ac);
}

/*
	Name: function_e3e7a6eb
	Namespace: namespace_9771a88f
	Checksum: 0x965895E6
	Offset: 0x26A8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_e3e7a6eb(var_bb037e88)
{
	if(var_bb037e88)
	{
		level thread function_d137d6a0(#"hash_2346ba48c20accb", #"hash_2347ba48c20c7fb", #"hash_2347fa48c20cec7");
	}
	else
	{
		level thread function_d137d6a0(#"hash_4a9bc8ffbcca71d1", #"hash_4a9bd8ffbcca8d01", #"hash_4a9bdcffbcca93cd");
	}
}

/*
	Name: function_e1798a8e
	Namespace: namespace_9771a88f
	Checksum: 0xB328005C
	Offset: 0x2750
	Size: 0xFA
	Parameters: 1
	Flags: Linked
*/
function function_e1798a8e(n_count)
{
	switch(n_count)
	{
		case 1:
		{
			level zm_vo::function_7622cb70(#"hash_398078d3d385a2ca");
			break;
		}
		case 2:
		{
			level zm_vo::function_7622cb70(#"hash_398077d3d385a117");
			break;
		}
		case 3:
		{
			level zm_vo::function_7622cb70(#"hash_398076d3d3859f64");
			break;
		}
		default:
		{
			level zm_vo::function_7622cb70(#"hash_398075d3d3859db1");
			break;
		}
	}
}

/*
	Name: function_160a5a82
	Namespace: namespace_9771a88f
	Checksum: 0xDCA5DF4E
	Offset: 0x2858
	Size: 0x7C
	Parameters: 0
	Flags: Linked
*/
function function_160a5a82()
{
	level endon(#"end_game");
	level zm_vo::function_7622cb70(#"hash_10ff92b09d05a770");
	level flag::wait_till(#"hash_820c83920af16b7");
	function_752b5c36(#"hash_3c58f67cfae1113e", undefined);
}

/*
	Name: function_65ed4fb1
	Namespace: namespace_9771a88f
	Checksum: 0x8259DD51
	Offset: 0x28E0
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_65ed4fb1()
{
	level endon(#"end_game");
	wait(1.5);
	level thread zm_vo::function_7622cb70(#"hash_18238483d15c8f09");
}

/*
	Name: function_28594421
	Namespace: namespace_9771a88f
	Checksum: 0x11647048
	Offset: 0x2930
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function function_28594421()
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	self thread function_b5b0518b(#"hash_45539d72acb45b7a", undefined);
	if(isdefined(level.var_d58a6548) && isdefined(level.var_73f7a821))
	{
		wait(level.var_d58a6548);
		if(self istouching(level.var_73f7a821))
		{
			self thread function_b5b0518b(#"hash_45539d72acb45b7a", undefined);
		}
	}
}

/*
	Name: function_ed634081
	Namespace: namespace_9771a88f
	Checksum: 0x1A30A1F6
	Offset: 0x2A10
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_ed634081(params)
{
	if(isplayer(params.eattacker) && self.archetype === #"hash_7c09b683edfb0e96")
	{
		if(isdefined(level.var_307ccdbc) && self == level.var_307ccdbc)
		{
			return;
		}
		level thread function_d137d6a0(#"hash_6ea068bbb63a3b64", #"hash_6ea078bbb63a5694", #"hash_6ea074bbb63a4fc8");
		callback::remove_on_ai_killed(&function_ed634081);
	}
}

/*
	Name: function_d137d6a0
	Namespace: namespace_9771a88f
	Checksum: 0xD404F287
	Offset: 0x2AE0
	Size: 0xCA
	Parameters: 3
	Flags: Linked
*/
function function_d137d6a0(var_e0c6386f, var_40feefce, var_c4ad7aa9)
{
	level endon(#"end_game");
	switch(level.var_114b6e35)
	{
		case "hash_583a7c6fc0d127b0":
		{
			self zm_vo::function_7622cb70(var_e0c6386f);
			break;
		}
		case "carver":
		{
			self zm_vo::function_7622cb70(var_40feefce);
			break;
		}
		case "grey":
		{
			self zm_vo::function_7622cb70(var_c4ad7aa9);
			break;
		}
	}
}

/*
	Name: function_752b5c36
	Namespace: namespace_9771a88f
	Checksum: 0x38D7FB25
	Offset: 0x2BB8
	Size: 0x10A
	Parameters: 2
	Flags: Linked
*/
function function_752b5c36(str_vo, b_wait_if_busy)
{
	level endon(#"end_game");
	foreach(player in function_a1ef346b())
	{
		if(is_true(player.var_16735873))
		{
			continue;
		}
		player thread zm_vo::function_c4303dda(str_vo, 0, b_wait_if_busy);
	}
	var_88546af8 = zm_vo::function_f577c17d(str_vo);
	wait(var_88546af8 + 1);
}

/*
	Name: function_b5b0518b
	Namespace: namespace_9771a88f
	Checksum: 0x587CE653
	Offset: 0x2CD0
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function function_b5b0518b(str_vo, b_wait_if_busy)
{
	level endon(#"end_game");
	self endon(#"death", #"disconnect");
	if(is_true(self.var_16735873))
	{
		return;
	}
	self thread zm_vo::function_c4303dda(str_vo, 0, b_wait_if_busy);
	var_88546af8 = zm_vo::function_f577c17d(str_vo);
	wait(var_88546af8 + 1);
}

/*
	Name: function_5df7275b
	Namespace: namespace_9771a88f
	Checksum: 0xEA632FAC
	Offset: 0x2D98
	Size: 0x174
	Parameters: 0
	Flags: Linked
*/
function function_5df7275b()
{
	level endon(#"end_game");
	var_9e8aa2bc = struct::get("s_maxis_audiolog_3");
	var_a4318688 = struct::get(var_9e8aa2bc.target);
	var_9e87f151 = util::spawn_model(var_9e8aa2bc.model, var_9e8aa2bc.origin, var_9e8aa2bc.angles);
	level flag::wait_till(#"hash_65cb00631d191193");
	wait(1.5);
	var_9e87f151 notsolid();
	n_power = length(var_9e8aa2bc.origin - var_a4318688.origin);
	n_wait = var_9e87f151 zm_utility::fake_physicslaunch(var_a4318688.origin, n_power);
	wait(n_wait);
	namespace_4abf1500::function_23255935("ww_quest_audiolog");
	if(isdefined(var_9e87f151))
	{
		var_9e87f151 delete();
	}
}

/*
	Name: function_cd7a3de4
	Namespace: namespace_9771a88f
	Checksum: 0x949DCAB6
	Offset: 0x2F18
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function function_cd7a3de4()
{
	/#
		util::function_345e5b9a("");
		zm_devgui::add_custom_devgui_callback(&cmd);
	#/
}

/*
	Name: cmd
	Namespace: namespace_9771a88f
	Checksum: 0xDD5CDA17
	Offset: 0x2F68
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function cmd(cmd)
{
	/#
		switch(cmd)
		{
			case "hash_50a665b85beac5a5":
			{
				level thread zm_vo::function_7622cb70("");
				break;
			}
			default:
			{
				break;
			}
		}
	#/
}

