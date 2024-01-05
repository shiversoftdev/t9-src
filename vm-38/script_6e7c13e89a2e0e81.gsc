#using scripts\core_common\lui_shared.csc;

class class_f57714e4 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_f57714e4
		Checksum: 0x1B499355
		Offset: 0x8D0
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
		Checksum: 0xC75F60E2
		Offset: 0x1490
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
		Checksum: 0xEB94531A
		Offset: 0x1340
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_body_killed_by_mod(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "body_killed_by_mod", value);
	}

	/*
		Name: set_alive_player_count
		Namespace: namespace_f57714e4
		Checksum: 0xD9B1F79D
		Offset: 0x1110
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_alive_player_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "alive_player_count", value);
	}

	/*
		Name: open
		Namespace: namespace_f57714e4
		Checksum: 0x4EEE22C9
		Offset: 0xF10
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_missing_player_count
		Namespace: namespace_f57714e4
		Checksum: 0xE15D7275
		Offset: 0x1148
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_missing_player_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "missing_player_count", value);
	}

	/*
		Name: set_double_agent_player_count
		Namespace: namespace_f57714e4
		Checksum: 0x85CD47F9
		Offset: 0x11F0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_double_agent_player_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "double_agent_player_count", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_f57714e4
		Checksum: 0x1BF3714
		Offset: 0xCA0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("HUD_Spy");
	}

	/*
		Name: set_add_objective_id
		Namespace: namespace_f57714e4
		Checksum: 0x91BA3606
		Offset: 0x1378
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_add_objective_id(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "add_objective_id", value);
	}

	/*
		Name: set_player_role
		Namespace: namespace_f57714e4
		Checksum: 0x7C51220
		Offset: 0x10A0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_player_role(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "player_role", value);
	}

	/*
		Name: set_display_autopsy
		Namespace: namespace_f57714e4
		Checksum: 0xDA10A9E7
		Offset: 0x12D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_display_autopsy(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "display_autopsy", value);
	}

	/*
		Name: set_aux_notification_param
		Namespace: namespace_f57714e4
		Checksum: 0x52E19268
		Offset: 0x1420
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_aux_notification_param(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "aux_notification_param", value);
	}

	/*
		Name: set_operative_player_count
		Namespace: namespace_f57714e4
		Checksum: 0x97C4272D
		Offset: 0x1180
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_operative_player_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "operative_player_count", value);
	}

	/*
		Name: set_player_id_number
		Namespace: namespace_f57714e4
		Checksum: 0x9D6384BB
		Offset: 0x10D8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_player_id_number(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "player_id_number", value);
	}

	/*
		Name: set_body_identity
		Namespace: namespace_f57714e4
		Checksum: 0xACF0D06E
		Offset: 0x1298
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_body_identity(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "body_identity", value);
	}

	/*
		Name: set_body_player_clientnum
		Namespace: namespace_f57714e4
		Checksum: 0x62DDCD4C
		Offset: 0x1228
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_body_player_clientnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "body_player_clientnum", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_f57714e4
		Checksum: 0xE073F5AD
		Offset: 0x8F0
		Size: 0x3A4
		Parameters: 18
		Flags: None
	*/
	function setup_clientfields(var_9ec210c6, var_7674739c, var_202f443b, var_b8c3f033, var_ddd27460, var_9c8627ae, var_adf454f9, var_6fcb31c, var_227aceab, var_bc8fbd96, var_922c1cb1, var_22fdd4f2, var_12555826, var_441d6209, var_561d472e, var_ba985308, var_440ee553, var_357cb5f7)
	{
		cluielem::setup_clientfields("HUD_Spy");
		cluielem::add_clientfield("_state", 1, 3, "int");
		cluielem::add_clientfield("player_role", 20000, 2, "int", var_9ec210c6);
		cluielem::add_clientfield("player_id_number", 20000, 5, "int", var_7674739c);
		cluielem::add_clientfield("alive_player_count", 20000, 4, "int", var_202f443b);
		cluielem::add_clientfield("missing_player_count", 20000, 4, "int", var_b8c3f033);
		cluielem::add_clientfield("operative_player_count", 20000, 4, "int", var_ddd27460);
		cluielem::add_clientfield("investigator_player_count", 20000, 2, "int", var_9c8627ae);
		cluielem::add_clientfield("double_agent_player_count", 20000, 3, "int", var_adf454f9);
		cluielem::add_clientfield("body_player_clientnum", 20000, 7, "int", var_6fcb31c);
		cluielem::add_clientfield("body_agent_id", 20000, 4, "int", var_227aceab);
		cluielem::add_clientfield("body_identity", 20000, 2, "int", var_bc8fbd96);
		cluielem::add_clientfield("display_autopsy", 20000, 1, "int", var_922c1cb1);
		cluielem::add_clientfield("timeSinceDeath", 20000, 16, "int", var_22fdd4f2);
		cluielem::add_clientfield("body_killed_by_mod", 20000, 5, "int", var_12555826);
		cluielem::add_clientfield("add_objective_id", 20000, 4, "int", var_441d6209);
		cluielem::add_clientfield("current_objective_count", 20000, 4, "int", var_561d472e);
		cluielem::add_clientfield("notification_id", 20000, 4, "int", var_ba985308);
		cluielem::add_clientfield("aux_notification_param", 20000, 5, "int", var_440ee553);
		cluielem::add_clientfield("dirty_bomb_id", 20000, 2, "int", var_357cb5f7);
	}

	/*
		Name: set_notification_id
		Namespace: namespace_f57714e4
		Checksum: 0xC9EE7E35
		Offset: 0x13E8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_notification_id(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "notification_id", value);
	}

	/*
		Name: set_current_objective_count
		Namespace: namespace_f57714e4
		Checksum: 0xFA29D084
		Offset: 0x13B0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_current_objective_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "current_objective_count", value);
	}

	/*
		Name: set_timesincedeath
		Namespace: namespace_f57714e4
		Checksum: 0xEF6D3A2D
		Offset: 0x1308
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_timesincedeath(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "timeSinceDeath", value);
	}

	/*
		Name: set_dirty_bomb_id
		Namespace: namespace_f57714e4
		Checksum: 0x4B56909A
		Offset: 0x1458
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_dirty_bomb_id(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "dirty_bomb_id", value);
	}

	/*
		Name: set_body_agent_id
		Namespace: namespace_f57714e4
		Checksum: 0x778DEA0B
		Offset: 0x1260
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_body_agent_id(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "body_agent_id", value);
	}

	/*
		Name: set_state
		Namespace: namespace_f57714e4
		Checksum: 0xB1BB2E88
		Offset: 0xF40
		Size: 0x154
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->set_data(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hash_7d11e1c1b565495" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_1d55d285e24b7d1a" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
				}
				else
				{
					if(#"hash_6724d4bba3d5bf31" == state_name)
					{
						[[ self ]]->set_data(localclientnum, "_state", 3);
					}
					else
					{
						if(#"hideall" == state_name)
						{
							[[ self ]]->set_data(localclientnum, "_state", 4);
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
		Checksum: 0xA9B05C04
		Offset: 0x11B8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_investigator_player_count(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "investigator_player_count", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_f57714e4
		Checksum: 0x7CCCB1FC
		Offset: 0xCC8
		Size: 0x23C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "player_role", 0);
		[[ self ]]->set_data(localclientnum, "player_id_number", 0);
		[[ self ]]->set_data(localclientnum, "alive_player_count", 0);
		[[ self ]]->set_data(localclientnum, "missing_player_count", 0);
		[[ self ]]->set_data(localclientnum, "operative_player_count", 0);
		[[ self ]]->set_data(localclientnum, "investigator_player_count", 0);
		[[ self ]]->set_data(localclientnum, "double_agent_player_count", 0);
		[[ self ]]->set_data(localclientnum, "body_player_clientnum", 0);
		[[ self ]]->set_data(localclientnum, "body_agent_id", 0);
		[[ self ]]->set_data(localclientnum, "body_identity", 0);
		[[ self ]]->set_data(localclientnum, "display_autopsy", 0);
		[[ self ]]->set_data(localclientnum, "timeSinceDeath", 0);
		[[ self ]]->set_data(localclientnum, "body_killed_by_mod", 0);
		[[ self ]]->set_data(localclientnum, "add_objective_id", 0);
		[[ self ]]->set_data(localclientnum, "current_objective_count", 0);
		[[ self ]]->set_data(localclientnum, "notification_id", 0);
		[[ self ]]->set_data(localclientnum, "aux_notification_param", 0);
		[[ self ]]->set_data(localclientnum, "dirty_bomb_id", 0);
	}

}

#namespace namespace_bfc09150;

/*
	Name: function_59df56ac
	Namespace: namespace_bfc09150
	Checksum: 0xDA85E789
	Offset: 0x240
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_59df56ac()
{
	level notify(1148819172);
}

/*
	Name: register
	Namespace: namespace_bfc09150
	Checksum: 0xA2B31C31
	Offset: 0x260
	Size: 0x21E
	Parameters: 18
	Flags: None
*/
function register(var_9ec210c6, var_7674739c, var_202f443b, var_b8c3f033, var_ddd27460, var_9c8627ae, var_adf454f9, var_6fcb31c, var_227aceab, var_bc8fbd96, var_922c1cb1, var_22fdd4f2, var_12555826, var_441d6209, var_561d472e, var_ba985308, var_440ee553, var_357cb5f7)
{
	elem = new class_f57714e4();
	[[ elem ]]->setup_clientfields(var_9ec210c6, var_7674739c, var_202f443b, var_b8c3f033, var_ddd27460, var_9c8627ae, var_adf454f9, var_6fcb31c, var_227aceab, var_bc8fbd96, var_922c1cb1, var_22fdd4f2, var_12555826, var_441d6209, var_561d472e, var_ba985308, var_440ee553, var_357cb5f7);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_569121b342a4dcf3"]))
	{
		level.var_ae746e8f[#"hash_569121b342a4dcf3"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_569121b342a4dcf3"]))
	{
		level.var_ae746e8f[#"hash_569121b342a4dcf3"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_569121b342a4dcf3"]))
	{
		level.var_ae746e8f[#"hash_569121b342a4dcf3"] = array(level.var_ae746e8f[#"hash_569121b342a4dcf3"]);
	}
	level.var_ae746e8f[#"hash_569121b342a4dcf3"][level.var_ae746e8f[#"hash_569121b342a4dcf3"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: namespace_bfc09150
	Checksum: 0xB2C2B3D1
	Offset: 0x488
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_f57714e4();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: namespace_bfc09150
	Checksum: 0xD2E91EB2
	Offset: 0x4C8
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: namespace_bfc09150
	Checksum: 0x66AA3A49
	Offset: 0x4F0
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
	Checksum: 0x88CDD17
	Offset: 0x518
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: namespace_bfc09150
	Checksum: 0xDAF8C30
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_player_role
	Namespace: namespace_bfc09150
	Checksum: 0xA90ACEF8
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_player_role(localclientnum, value)
{
	[[ self ]]->set_player_role(localclientnum, value);
}

/*
	Name: set_player_id_number
	Namespace: namespace_bfc09150
	Checksum: 0x788F3EED
	Offset: 0x5A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_player_id_number(localclientnum, value)
{
	[[ self ]]->set_player_id_number(localclientnum, value);
}

/*
	Name: set_alive_player_count
	Namespace: namespace_bfc09150
	Checksum: 0xC7017F77
	Offset: 0x5D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alive_player_count(localclientnum, value)
{
	[[ self ]]->set_alive_player_count(localclientnum, value);
}

/*
	Name: set_missing_player_count
	Namespace: namespace_bfc09150
	Checksum: 0x2C6F0DF6
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_missing_player_count(localclientnum, value)
{
	[[ self ]]->set_missing_player_count(localclientnum, value);
}

/*
	Name: set_operative_player_count
	Namespace: namespace_bfc09150
	Checksum: 0x713FE130
	Offset: 0x630
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_operative_player_count(localclientnum, value)
{
	[[ self ]]->set_operative_player_count(localclientnum, value);
}

/*
	Name: set_investigator_player_count
	Namespace: namespace_bfc09150
	Checksum: 0xB03CF24B
	Offset: 0x660
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_investigator_player_count(localclientnum, value)
{
	[[ self ]]->set_investigator_player_count(localclientnum, value);
}

/*
	Name: set_double_agent_player_count
	Namespace: namespace_bfc09150
	Checksum: 0x246A90FA
	Offset: 0x690
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_double_agent_player_count(localclientnum, value)
{
	[[ self ]]->set_double_agent_player_count(localclientnum, value);
}

/*
	Name: set_body_player_clientnum
	Namespace: namespace_bfc09150
	Checksum: 0x70A7ED12
	Offset: 0x6C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_player_clientnum(localclientnum, value)
{
	[[ self ]]->set_body_player_clientnum(localclientnum, value);
}

/*
	Name: set_body_agent_id
	Namespace: namespace_bfc09150
	Checksum: 0x5F08DDFC
	Offset: 0x6F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_agent_id(localclientnum, value)
{
	[[ self ]]->set_body_agent_id(localclientnum, value);
}

/*
	Name: set_body_identity
	Namespace: namespace_bfc09150
	Checksum: 0xEE77C4F5
	Offset: 0x720
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_identity(localclientnum, value)
{
	[[ self ]]->set_body_identity(localclientnum, value);
}

/*
	Name: set_display_autopsy
	Namespace: namespace_bfc09150
	Checksum: 0xC65D4C6E
	Offset: 0x750
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_display_autopsy(localclientnum, value)
{
	[[ self ]]->set_display_autopsy(localclientnum, value);
}

/*
	Name: set_timesincedeath
	Namespace: namespace_bfc09150
	Checksum: 0x53FB5FE6
	Offset: 0x780
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_timesincedeath(localclientnum, value)
{
	[[ self ]]->set_timesincedeath(localclientnum, value);
}

/*
	Name: set_body_killed_by_mod
	Namespace: namespace_bfc09150
	Checksum: 0xB2849E23
	Offset: 0x7B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_body_killed_by_mod(localclientnum, value)
{
	[[ self ]]->set_body_killed_by_mod(localclientnum, value);
}

/*
	Name: set_add_objective_id
	Namespace: namespace_bfc09150
	Checksum: 0xAB0C4CAD
	Offset: 0x7E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_add_objective_id(localclientnum, value)
{
	[[ self ]]->set_add_objective_id(localclientnum, value);
}

/*
	Name: set_current_objective_count
	Namespace: namespace_bfc09150
	Checksum: 0x5D1DE54
	Offset: 0x810
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_current_objective_count(localclientnum, value)
{
	[[ self ]]->set_current_objective_count(localclientnum, value);
}

/*
	Name: set_notification_id
	Namespace: namespace_bfc09150
	Checksum: 0x60333318
	Offset: 0x840
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_notification_id(localclientnum, value)
{
	[[ self ]]->set_notification_id(localclientnum, value);
}

/*
	Name: set_aux_notification_param
	Namespace: namespace_bfc09150
	Checksum: 0x768F507C
	Offset: 0x870
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_aux_notification_param(localclientnum, value)
{
	[[ self ]]->set_aux_notification_param(localclientnum, value);
}

/*
	Name: set_dirty_bomb_id
	Namespace: namespace_bfc09150
	Checksum: 0xCD538BA4
	Offset: 0x8A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_dirty_bomb_id(localclientnum, value)
{
	[[ self ]]->set_dirty_bomb_id(localclientnum, value);
}

