#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_51a06b68 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_51a06b68
		Checksum: 0x9C597585
		Offset: 0x308
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_51a06b68
		Checksum: 0xFDFB5473
		Offset: 0x7B0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_51a06b68
		Checksum: 0xEBACFADD
		Offset: 0x440
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
		Name: function_2d7f3298
		Namespace: namespace_51a06b68
		Checksum: 0x9EB84DC1
		Offset: 0x6C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_2d7f3298(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "gunindex2", value);
	}

	/*
		Name: function_43ba5f0e
		Namespace: namespace_51a06b68
		Checksum: 0x46B0FF95
		Offset: 0x670
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_43ba5f0e(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "gunIndex1", value);
	}

	/*
		Name: close
		Namespace: namespace_51a06b68
		Checksum: 0xA051AE73
		Offset: 0x488
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_51a06b68
		Checksum: 0x68B146D7
		Offset: 0x328
		Size: 0x10C
		Parameters: 0
		Flags: None
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
		Checksum: 0x372E767A
		Offset: 0x760
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_color(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "color", value);
	}

	/*
		Name: function_ada8b2f1
		Namespace: namespace_51a06b68
		Checksum: 0xA8F9A191
		Offset: 0x710
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_ada8b2f1(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "gunindex3", value);
	}

	/*
		Name: function_b94196b8
		Namespace: namespace_51a06b68
		Checksum: 0xEF0ABF68
		Offset: 0x620
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_b94196b8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "promptProgress", value);
	}

	/*
		Name: set_state
		Namespace: namespace_51a06b68
		Checksum: 0x53144FBC
		Offset: 0x4B8
		Size: 0x15C
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
	Name: register
	Namespace: sr_objective_reward_menu
	Checksum: 0x3D837339
	Offset: 0x118
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
	Checksum: 0x52224920
	Offset: 0x158
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
	Namespace: sr_objective_reward_menu
	Checksum: 0x753C763F
	Offset: 0x198
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
	Namespace: sr_objective_reward_menu
	Checksum: 0xEFF97288
	Offset: 0x1C0
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
	Namespace: sr_objective_reward_menu
	Checksum: 0xF6E05EF2
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: function_b94196b8
	Namespace: sr_objective_reward_menu
	Checksum: 0x1CC62872
	Offset: 0x218
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b94196b8(player, value)
{
	[[ self ]]->function_b94196b8(player, value);
}

/*
	Name: function_43ba5f0e
	Namespace: sr_objective_reward_menu
	Checksum: 0xF3C47AF9
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_43ba5f0e(player, value)
{
	[[ self ]]->function_43ba5f0e(player, value);
}

/*
	Name: function_2d7f3298
	Namespace: sr_objective_reward_menu
	Checksum: 0xA7A9BC71
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2d7f3298(player, value)
{
	[[ self ]]->function_2d7f3298(player, value);
}

/*
	Name: function_ada8b2f1
	Namespace: sr_objective_reward_menu
	Checksum: 0x65FF8703
	Offset: 0x2A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ada8b2f1(player, value)
{
	[[ self ]]->function_ada8b2f1(player, value);
}

/*
	Name: set_color
	Namespace: sr_objective_reward_menu
	Checksum: 0x49975A4
	Offset: 0x2D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_color(player, value)
{
	[[ self ]]->set_color(player, value);
}

