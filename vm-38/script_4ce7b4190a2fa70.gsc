#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_51a06b68 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_51a06b68
		Checksum: 0xB32238A4
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_51a06b68
		Checksum: 0x2DF6EA90
		Offset: 0x7D0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_51a06b68
		Checksum: 0x1FD4A3C2
		Offset: 0x460
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Name: function_2d7f3298
		Namespace: namespace_51a06b68
		Checksum: 0xD0056079
		Offset: 0x6E0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_2d7f3298(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "gunindex2", value);
	}

	/*
		Name: function_43ba5f0e
		Namespace: namespace_51a06b68
		Checksum: 0x4127AC74
		Offset: 0x690
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_43ba5f0e(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "gunIndex1", value);
	}

	/*
		Name: close
		Namespace: namespace_51a06b68
		Checksum: 0x51D810AE
		Offset: 0x4A8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_51a06b68
		Checksum: 0x8E07F8E8
		Offset: 0x348
		Size: 0x10C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_objective_reward_menu");
		namespace_6aaccc24::function_da693cbe("_state", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("promptProgress", 1, 7, "float");
		namespace_6aaccc24::function_da693cbe("gunIndex1", 1, 4, "int");
		namespace_6aaccc24::function_da693cbe("gunindex2", 1, 4, "int");
		namespace_6aaccc24::function_da693cbe("gunindex3", 1, 4, "int");
		namespace_6aaccc24::function_da693cbe("color", 1, 2, "int");
	}

	/*
		Name: set_color
		Namespace: namespace_51a06b68
		Checksum: 0x15A3303F
		Offset: 0x780
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_color(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "color", value);
	}

	/*
		Name: function_ada8b2f1
		Namespace: namespace_51a06b68
		Checksum: 0xB6E5963F
		Offset: 0x730
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_ada8b2f1(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "gunindex3", value);
	}

	/*
		Name: function_b94196b8
		Namespace: namespace_51a06b68
		Checksum: 0xDEB07104
		Offset: 0x640
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_b94196b8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "promptProgress", value);
	}

	/*
		Name: set_state
		Namespace: namespace_51a06b68
		Checksum: 0x1C8577B6
		Offset: 0x4D8
		Size: 0x15C
		Parameters: 2
		Flags: Linked
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"hash_aae094fcdbbfdf5" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"hash_6e088fcf60bf0124" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					if(#"hash_7ca278cf4669f74b" == state_name)
					{
						player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 3);
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

#namespace sr_objective_reward_menu;

/*
	Name: function_a7ba6c42
	Namespace: sr_objective_reward_menu
	Checksum: 0x6C0BEBF3
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a7ba6c42()
{
	level notify(1345731848);
}

/*
	Name: register
	Namespace: sr_objective_reward_menu
	Checksum: 0x4526992F
	Offset: 0x138
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_51a06b68();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_objective_reward_menu
	Checksum: 0x3A6790E3
	Offset: 0x178
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: sr_objective_reward_menu
	Checksum: 0x2AD0B106
	Offset: 0x1B8
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: sr_objective_reward_menu
	Checksum: 0x1E0592EA
	Offset: 0x1E0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: sr_objective_reward_menu
	Checksum: 0xCA11B23C
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: function_b94196b8
	Namespace: sr_objective_reward_menu
	Checksum: 0x2755C0FF
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_b94196b8(player, value)
{
	[[ self ]]->function_b94196b8(player, value);
}

/*
	Name: function_43ba5f0e
	Namespace: sr_objective_reward_menu
	Checksum: 0xDDEA3D97
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_43ba5f0e(player, value)
{
	[[ self ]]->function_43ba5f0e(player, value);
}

/*
	Name: function_2d7f3298
	Namespace: sr_objective_reward_menu
	Checksum: 0x6A852AE4
	Offset: 0x298
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_2d7f3298(player, value)
{
	[[ self ]]->function_2d7f3298(player, value);
}

/*
	Name: function_ada8b2f1
	Namespace: sr_objective_reward_menu
	Checksum: 0xE0109913
	Offset: 0x2C8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_ada8b2f1(player, value)
{
	[[ self ]]->function_ada8b2f1(player, value);
}

/*
	Name: set_color
	Namespace: sr_objective_reward_menu
	Checksum: 0x995DBCA2
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_color(player, value)
{
	[[ self ]]->set_color(player, value);
}

