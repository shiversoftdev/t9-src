#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_f57714e4 : cluielem
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
		Name: set_body_killed_by_mod
		Namespace: namespace_f57714e4
		Checksum: 0xBBD6DC1F
		Offset: 0xFF0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_body_killed_by_mod(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "body_killed_by_mod", value);
	}

	/*
		Name: set_alive_player_count
		Namespace: namespace_f57714e4
		Checksum: 0xE4C180D8
		Offset: 0xCD0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_alive_player_count(player, value)
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_missing_player_count
		Namespace: namespace_f57714e4
		Checksum: 0x340F059C
		Offset: 0xD20
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_missing_player_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "missing_player_count", value);
	}

	/*
		Name: set_double_agent_player_count
		Namespace: namespace_f57714e4
		Checksum: 0xA12D9309
		Offset: 0xE10
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_double_agent_player_count(player, value)
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
		cluielem::close_luielem(player);
	}

	/*
		Name: set_add_objective_id
		Namespace: namespace_f57714e4
		Checksum: 0xB012D64C
		Offset: 0x1040
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_add_objective_id(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "add_objective_id", value);
	}

	/*
		Name: set_player_role
		Namespace: namespace_f57714e4
		Checksum: 0x3D094178
		Offset: 0xC30
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_player_role(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "player_role", value);
	}

	/*
		Name: set_display_autopsy
		Namespace: namespace_f57714e4
		Checksum: 0x220A440E
		Offset: 0xF50
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_display_autopsy(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "display_autopsy", value);
	}

	/*
		Name: set_aux_notification_param
		Namespace: namespace_f57714e4
		Checksum: 0xE83FFBD
		Offset: 0x1130
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_aux_notification_param(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "aux_notification_param", value);
	}

	/*
		Name: set_operative_player_count
		Namespace: namespace_f57714e4
		Checksum: 0x42858AB4
		Offset: 0xD70
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_operative_player_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "operative_player_count", value);
	}

	/*
		Name: set_player_id_number
		Namespace: namespace_f57714e4
		Checksum: 0x266684A5
		Offset: 0xC80
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_player_id_number(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "player_id_number", value);
	}

	/*
		Name: set_body_identity
		Namespace: namespace_f57714e4
		Checksum: 0x46310C4C
		Offset: 0xF00
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_body_identity(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "body_identity", value);
	}

	/*
		Name: set_body_player_clientnum
		Namespace: namespace_f57714e4
		Checksum: 0xCE58B179
		Offset: 0xE60
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_body_player_clientnum(player, value)
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
		cluielem::setup_clientfields("HUD_Spy");
		cluielem::add_clientfield("_state", 1, 3, "int");
		cluielem::add_clientfield("player_role", 20000, 2, "int");
		cluielem::add_clientfield("player_id_number", 20000, 5, "int");
		cluielem::add_clientfield("alive_player_count", 20000, 4, "int");
		cluielem::add_clientfield("missing_player_count", 20000, 4, "int");
		cluielem::add_clientfield("operative_player_count", 20000, 4, "int");
		cluielem::add_clientfield("investigator_player_count", 20000, 2, "int");
		cluielem::add_clientfield("double_agent_player_count", 20000, 3, "int");
		cluielem::add_clientfield("body_player_clientnum", 20000, 7, "int");
		cluielem::add_clientfield("body_agent_id", 20000, 4, "int");
		cluielem::add_clientfield("body_identity", 20000, 2, "int");
		cluielem::add_clientfield("display_autopsy", 20000, 1, "int");
		cluielem::add_clientfield("timeSinceDeath", 20000, 16, "int");
		cluielem::add_clientfield("body_killed_by_mod", 20000, 5, "int");
		cluielem::add_clientfield("add_objective_id", 20000, 4, "int");
		cluielem::add_clientfield("current_objective_count", 20000, 4, "int");
		cluielem::add_clientfield("notification_id", 20000, 4, "int");
		cluielem::add_clientfield("aux_notification_param", 20000, 5, "int");
		cluielem::add_clientfield("dirty_bomb_id", 20000, 2, "int");
	}

	/*
		Name: set_notification_id
		Namespace: namespace_f57714e4
		Checksum: 0xAC04E5C2
		Offset: 0x10E0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_notification_id(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "notification_id", value);
	}

	/*
		Name: set_current_objective_count
		Namespace: namespace_f57714e4
		Checksum: 0xF14874AF
		Offset: 0x1090
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_current_objective_count(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "current_objective_count", value);
	}

	/*
		Name: set_timesincedeath
		Namespace: namespace_f57714e4
		Checksum: 0x54C37C8D
		Offset: 0xFA0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_timesincedeath(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "timeSinceDeath", value);
	}

	/*
		Name: set_dirty_bomb_id
		Namespace: namespace_f57714e4
		Checksum: 0x16D26FA9
		Offset: 0x1180
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_dirty_bomb_id(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "dirty_bomb_id", value);
	}

	/*
		Name: set_body_agent_id
		Namespace: namespace_f57714e4
		Checksum: 0xEABCAE61
		Offset: 0xEB0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_body_agent_id(player, value)
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
		Name: set_investigator_player_count
		Namespace: namespace_f57714e4
		Checksum: 0x1BCD4F07
		Offset: 0xDC0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_investigator_player_count(player, value)
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
	level notify(-149504195);
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
	Name: set_player_role
	Namespace: namespace_bfc09150
	Checksum: 0xF27FFF31
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_player_role(player, value)
{
	[[ self ]]->set_player_role(player, value);
}

/*
	Name: set_player_id_number
	Namespace: namespace_bfc09150
	Checksum: 0xA324B36B
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_player_id_number(player, value)
{
	[[ self ]]->set_player_id_number(player, value);
}

/*
	Name: set_alive_player_count
	Namespace: namespace_bfc09150
	Checksum: 0x39D35374
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alive_player_count(player, value)
{
	[[ self ]]->set_alive_player_count(player, value);
}

/*
	Name: set_missing_player_count
	Namespace: namespace_bfc09150
	Checksum: 0xFF9EA6F2
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_missing_player_count(player, value)
{
	[[ self ]]->set_missing_player_count(player, value);
}

/*
	Name: set_operative_player_count
	Namespace: namespace_bfc09150
	Checksum: 0xBDECE827
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_operative_player_count(player, value)
{
	[[ self ]]->set_operative_player_count(player, value);
}

/*
	Name: set_investigator_player_count
	Namespace: namespace_bfc09150
	Checksum: 0xBBD3455F
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_investigator_player_count(player, value)
{
	[[ self ]]->set_investigator_player_count(player, value);
}

/*
	Name: set_double_agent_player_count
	Namespace: namespace_bfc09150
	Checksum: 0x69DD792F
	Offset: 0x488
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_double_agent_player_count(player, value)
{
	[[ self ]]->set_double_agent_player_count(player, value);
}

/*
	Name: set_body_player_clientnum
	Namespace: namespace_bfc09150
	Checksum: 0xA478E415
	Offset: 0x4B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_player_clientnum(player, value)
{
	[[ self ]]->set_body_player_clientnum(player, value);
}

/*
	Name: set_body_agent_id
	Namespace: namespace_bfc09150
	Checksum: 0xBFDFDFBC
	Offset: 0x4E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_agent_id(player, value)
{
	[[ self ]]->set_body_agent_id(player, value);
}

/*
	Name: set_body_identity
	Namespace: namespace_bfc09150
	Checksum: 0x63703EA0
	Offset: 0x518
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_identity(player, value)
{
	[[ self ]]->set_body_identity(player, value);
}

/*
	Name: set_display_autopsy
	Namespace: namespace_bfc09150
	Checksum: 0x33CFF03F
	Offset: 0x548
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_display_autopsy(player, value)
{
	[[ self ]]->set_display_autopsy(player, value);
}

/*
	Name: set_timesincedeath
	Namespace: namespace_bfc09150
	Checksum: 0x330ECB00
	Offset: 0x578
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_timesincedeath(player, value)
{
	[[ self ]]->set_timesincedeath(player, value);
}

/*
	Name: set_body_killed_by_mod
	Namespace: namespace_bfc09150
	Checksum: 0x59D93ED1
	Offset: 0x5A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_killed_by_mod(player, value)
{
	[[ self ]]->set_body_killed_by_mod(player, value);
}

/*
	Name: set_add_objective_id
	Namespace: namespace_bfc09150
	Checksum: 0x4EBF6EF1
	Offset: 0x5D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_add_objective_id(player, value)
{
	[[ self ]]->set_add_objective_id(player, value);
}

/*
	Name: set_current_objective_count
	Namespace: namespace_bfc09150
	Checksum: 0xC1A848F2
	Offset: 0x608
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_current_objective_count(player, value)
{
	[[ self ]]->set_current_objective_count(player, value);
}

/*
	Name: set_notification_id
	Namespace: namespace_bfc09150
	Checksum: 0xC1765598
	Offset: 0x638
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_notification_id(player, value)
{
	[[ self ]]->set_notification_id(player, value);
}

/*
	Name: set_aux_notification_param
	Namespace: namespace_bfc09150
	Checksum: 0x56A05E00
	Offset: 0x668
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_aux_notification_param(player, value)
{
	[[ self ]]->set_aux_notification_param(player, value);
}

/*
	Name: set_dirty_bomb_id
	Namespace: namespace_bfc09150
	Checksum: 0x71FD5C9C
	Offset: 0x698
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_dirty_bomb_id(player, value)
{
	[[ self ]]->set_dirty_bomb_id(player, value);
}

