#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_f57714e4 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_f57714e4
		Checksum: 0x70E332FF
		Offset: 0x6C8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_f57714e4
		Checksum: 0xBBE20067
		Offset: 0x11D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_ec7b95
		Namespace: namespace_f57714e4
		Checksum: 0xBBD6DC1F
		Offset: 0xFF0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_ec7b95(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "body_killed_by_mod", value);
	}

	/*
		Name: function_c060174
		Namespace: namespace_f57714e4
		Checksum: 0xE4C180D8
		Offset: 0xCD0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c060174(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "alive_player_count", value);
	}

	/*
		Name: open
		Namespace: namespace_f57714e4
		Checksum: 0x1A148DFA
		Offset: 0xA08
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_2b10da38
		Namespace: namespace_f57714e4
		Checksum: 0x340F059C
		Offset: 0xD20
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_2b10da38(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "missing_player_count", value);
	}

	/*
		Name: function_341ec963
		Namespace: namespace_f57714e4
		Checksum: 0xA12D9309
		Offset: 0xE10
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_341ec963(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "double_agent_player_count", value);
	}

	/*
		Name: close
		Namespace: namespace_f57714e4
		Checksum: 0xCEFD6875
		Offset: 0xA50
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5c8d427c
		Namespace: namespace_f57714e4
		Checksum: 0xB012D64C
		Offset: 0x1040
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_5c8d427c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "add_objective_id", value);
	}

	/*
		Name: function_5d23ae16
		Namespace: namespace_f57714e4
		Checksum: 0x3D094178
		Offset: 0xC30
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_5d23ae16(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "player_role", value);
	}

	/*
		Name: function_61bb8b04
		Namespace: namespace_f57714e4
		Checksum: 0x220A440E
		Offset: 0xF50
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_61bb8b04(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "display_autopsy", value);
	}

	/*
		Name: function_65a4dc3c
		Namespace: namespace_f57714e4
		Checksum: 0xE83FFBD
		Offset: 0x1130
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_65a4dc3c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "aux_notification_param", value);
	}

	/*
		Name: function_6d5882c8
		Namespace: namespace_f57714e4
		Checksum: 0x42858AB4
		Offset: 0xD70
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_6d5882c8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "operative_player_count", value);
	}

	/*
		Name: function_7350f1fd
		Namespace: namespace_f57714e4
		Checksum: 0x266684A5
		Offset: 0xC80
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_7350f1fd(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "player_id_number", value);
	}

	/*
		Name: function_82bcc7df
		Namespace: namespace_f57714e4
		Checksum: 0x46310C4C
		Offset: 0xF00
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_82bcc7df(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "body_identity", value);
	}

	/*
		Name: function_8b74df97
		Namespace: namespace_f57714e4
		Checksum: 0xCE58B179
		Offset: 0xE60
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_8b74df97(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "body_player_clientnum", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_f57714e4
		Checksum: 0x8A88139A
		Offset: 0x6E8
		Size: 0x314
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("HUD_Spy");
		namespace_6aaccc24::function_da693cbe("_state", 1, 3, "int");
		namespace_6aaccc24::function_da693cbe("player_role", 20000, 2, "int");
		namespace_6aaccc24::function_da693cbe("player_id_number", 20000, 5, "int");
		namespace_6aaccc24::function_da693cbe("alive_player_count", 20000, 4, "int");
		namespace_6aaccc24::function_da693cbe("missing_player_count", 20000, 4, "int");
		namespace_6aaccc24::function_da693cbe("operative_player_count", 20000, 4, "int");
		namespace_6aaccc24::function_da693cbe("investigator_player_count", 20000, 2, "int");
		namespace_6aaccc24::function_da693cbe("double_agent_player_count", 20000, 3, "int");
		namespace_6aaccc24::function_da693cbe("body_player_clientnum", 20000, 7, "int");
		namespace_6aaccc24::function_da693cbe("body_agent_id", 20000, 4, "int");
		namespace_6aaccc24::function_da693cbe("body_identity", 20000, 2, "int");
		namespace_6aaccc24::function_da693cbe("display_autopsy", 20000, 1, "int");
		namespace_6aaccc24::function_da693cbe("timeSinceDeath", 20000, 16, "int");
		namespace_6aaccc24::function_da693cbe("body_killed_by_mod", 20000, 5, "int");
		namespace_6aaccc24::function_da693cbe("add_objective_id", 20000, 4, "int");
		namespace_6aaccc24::function_da693cbe("current_objective_count", 20000, 4, "int");
		namespace_6aaccc24::function_da693cbe("notification_id", 20000, 4, "int");
		namespace_6aaccc24::function_da693cbe("aux_notification_param", 20000, 5, "int");
		namespace_6aaccc24::function_da693cbe("dirty_bomb_id", 20000, 2, "int");
	}

	/*
		Name: function_91a8637f
		Namespace: namespace_f57714e4
		Checksum: 0xAC04E5C2
		Offset: 0x10E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_91a8637f(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "notification_id", value);
	}

	/*
		Name: function_a6f0b853
		Namespace: namespace_f57714e4
		Checksum: 0xF14874AF
		Offset: 0x1090
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_a6f0b853(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "current_objective_count", value);
	}

	/*
		Name: function_b58e0471
		Namespace: namespace_f57714e4
		Checksum: 0x54C37C8D
		Offset: 0xFA0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_b58e0471(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "timeSinceDeath", value);
	}

	/*
		Name: function_ceb51392
		Namespace: namespace_f57714e4
		Checksum: 0x16D26FA9
		Offset: 0x1180
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_ceb51392(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "dirty_bomb_id", value);
	}

	/*
		Name: function_cf7a3ce6
		Namespace: namespace_f57714e4
		Checksum: 0xEABCAE61
		Offset: 0xEB0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_cf7a3ce6(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "body_agent_id", value);
	}

	/*
		Name: set_state
		Namespace: namespace_f57714e4
		Checksum: 0x7D43B4F5
		Offset: 0xA80
		Size: 0x1A4
		Parameters: 2
		Flags: None
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"hash_7d11e1c1b565495" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"hash_1d55d285e24b7d1a" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					if(#"hash_6724d4bba3d5bf31" == state_name)
					{
						player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 3);
					}
					else
					{
						if(#"hideall" == state_name)
						{
							player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 4);
						}
						else
						{
							/#
								assertmsg("");
							#/
							/#
							#/
						}
					}
				}
			}
		}
	}

	/*
		Name: function_de4daba8
		Namespace: namespace_f57714e4
		Checksum: 0x1BCD4F07
		Offset: 0xDC0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_de4daba8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "investigator_player_count", value);
	}

}

#namespace namespace_bfc09150;

/*
	Name: function_ee7cadce
	Namespace: namespace_bfc09150
	Checksum: 0xD1D51C83
	Offset: 0x248
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ee7cadce()
{
	level notify(149504195);
}

/*
	Name: register
	Namespace: namespace_bfc09150
	Checksum: 0x670B8273
	Offset: 0x268
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_f57714e4();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_bfc09150
	Checksum: 0x22B7D0A0
	Offset: 0x2A8
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: namespace_bfc09150
	Checksum: 0xBEEC1AC2
	Offset: 0x2E8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: namespace_bfc09150
	Checksum: 0xD0CA6291
	Offset: 0x310
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: namespace_bfc09150
	Checksum: 0x5A13EE4C
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: function_5d23ae16
	Namespace: namespace_bfc09150
	Checksum: 0xF27FFF31
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5d23ae16(player, value)
{
	[[ self ]]->function_5d23ae16(player, value);
}

/*
	Name: function_7350f1fd
	Namespace: namespace_bfc09150
	Checksum: 0xA324B36B
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7350f1fd(player, value)
{
	[[ self ]]->function_7350f1fd(player, value);
}

/*
	Name: function_c060174
	Namespace: namespace_bfc09150
	Checksum: 0x39D35374
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c060174(player, value)
{
	[[ self ]]->function_c060174(player, value);
}

/*
	Name: function_2b10da38
	Namespace: namespace_bfc09150
	Checksum: 0xFF9EA6F2
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2b10da38(player, value)
{
	[[ self ]]->function_2b10da38(player, value);
}

/*
	Name: function_6d5882c8
	Namespace: namespace_bfc09150
	Checksum: 0xBDECE827
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6d5882c8(player, value)
{
	[[ self ]]->function_6d5882c8(player, value);
}

/*
	Name: function_de4daba8
	Namespace: namespace_bfc09150
	Checksum: 0xBBD3455F
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_de4daba8(player, value)
{
	[[ self ]]->function_de4daba8(player, value);
}

/*
	Name: function_341ec963
	Namespace: namespace_bfc09150
	Checksum: 0x69DD792F
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_341ec963(player, value)
{
	[[ self ]]->function_341ec963(player, value);
}

/*
	Name: function_8b74df97
	Namespace: namespace_bfc09150
	Checksum: 0xA478E415
	Offset: 0x4B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8b74df97(player, value)
{
	[[ self ]]->function_8b74df97(player, value);
}

/*
	Name: function_cf7a3ce6
	Namespace: namespace_bfc09150
	Checksum: 0xBFDFDFBC
	Offset: 0x4E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_cf7a3ce6(player, value)
{
	[[ self ]]->function_cf7a3ce6(player, value);
}

/*
	Name: function_82bcc7df
	Namespace: namespace_bfc09150
	Checksum: 0x63703EA0
	Offset: 0x518
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_82bcc7df(player, value)
{
	[[ self ]]->function_82bcc7df(player, value);
}

/*
	Name: function_61bb8b04
	Namespace: namespace_bfc09150
	Checksum: 0x33CFF03F
	Offset: 0x548
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_61bb8b04(player, value)
{
	[[ self ]]->function_61bb8b04(player, value);
}

/*
	Name: function_b58e0471
	Namespace: namespace_bfc09150
	Checksum: 0x330ECB00
	Offset: 0x578
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b58e0471(player, value)
{
	[[ self ]]->function_b58e0471(player, value);
}

/*
	Name: function_ec7b95
	Namespace: namespace_bfc09150
	Checksum: 0x59D93ED1
	Offset: 0x5A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ec7b95(player, value)
{
	[[ self ]]->function_ec7b95(player, value);
}

/*
	Name: function_5c8d427c
	Namespace: namespace_bfc09150
	Checksum: 0x4EBF6EF1
	Offset: 0x5D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5c8d427c(player, value)
{
	[[ self ]]->function_5c8d427c(player, value);
}

/*
	Name: function_a6f0b853
	Namespace: namespace_bfc09150
	Checksum: 0xC1A848F2
	Offset: 0x608
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a6f0b853(player, value)
{
	[[ self ]]->function_a6f0b853(player, value);
}

/*
	Name: function_91a8637f
	Namespace: namespace_bfc09150
	Checksum: 0xC1765598
	Offset: 0x638
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_91a8637f(player, value)
{
	[[ self ]]->function_91a8637f(player, value);
}

/*
	Name: function_65a4dc3c
	Namespace: namespace_bfc09150
	Checksum: 0x56A05E00
	Offset: 0x668
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_65a4dc3c(player, value)
{
	[[ self ]]->function_65a4dc3c(player, value);
}

/*
	Name: function_ceb51392
	Namespace: namespace_bfc09150
	Checksum: 0x71FD5C9C
	Offset: 0x698
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ceb51392(player, value)
{
	[[ self ]]->function_ceb51392(player, value);
}

