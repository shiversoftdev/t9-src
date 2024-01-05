#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cdirtybomb_usebar : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cdirtybomb_usebar
		Checksum: 0x85A85551
		Offset: 0x270
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cdirtybomb_usebar
		Checksum: 0x35796A28
		Offset: 0x640
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cdirtybomb_usebar
		Checksum: 0x2751D726
		Offset: 0x330
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
		Name: set_activatorcount
		Namespace: cdirtybomb_usebar
		Checksum: 0x3145B58E
		Offset: 0x5F0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_activatorcount(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "activatorCount", value);
	}

	/*
		Name: close
		Namespace: cdirtybomb_usebar
		Checksum: 0x9EE8C34
		Offset: 0x378
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: cdirtybomb_usebar
		Checksum: 0x1B59586F
		Offset: 0x290
		Size: 0x94
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("DirtyBomb_UseBar");
		cluielem::add_clientfield("_state", 1, 3, "int");
		cluielem::add_clientfield("progressFrac", 1, 10, "float");
		cluielem::add_clientfield("activatorCount", 1, 3, "int", 0);
	}

	/*
		Name: set_state
		Namespace: cdirtybomb_usebar
		Checksum: 0xE9D3874B
		Offset: 0x3A8
		Size: 0x1EC
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
			if(#"detonating" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"hash_1a2812055c330ee0" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					if(#"hash_59e0e869fbae7705" == state_name)
					{
						player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 3);
					}
					else
					{
						if(#"hash_b86ebfb5a93f57f" == state_name)
						{
							player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 4);
						}
						else
						{
							if(#"hash_4ff55a42344e567e" == state_name)
							{
								player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 5);
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
	}

	/*
		Name: set_progressfrac
		Namespace: cdirtybomb_usebar
		Checksum: 0x27E19050
		Offset: 0x5A0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_progressfrac(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progressFrac", value);
	}

}

#namespace dirtybomb_usebar;

/*
	Name: function_1586dbd
	Namespace: dirtybomb_usebar
	Checksum: 0x41F22182
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1586dbd()
{
	level notify(246280413);
}

/*
	Name: register
	Namespace: dirtybomb_usebar
	Checksum: 0xA9FE919
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cdirtybomb_usebar();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: dirtybomb_usebar
	Checksum: 0x3A6790E3
	Offset: 0x150
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
	Namespace: dirtybomb_usebar
	Checksum: 0x2AD0B106
	Offset: 0x190
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
	Namespace: dirtybomb_usebar
	Checksum: 0x1E0592EA
	Offset: 0x1B8
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
	Namespace: dirtybomb_usebar
	Checksum: 0xCA11B23C
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_progressfrac
	Namespace: dirtybomb_usebar
	Checksum: 0x7886D3A4
	Offset: 0x210
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progressfrac(player, value)
{
	[[ self ]]->set_progressfrac(player, value);
}

/*
	Name: set_activatorcount
	Namespace: dirtybomb_usebar
	Checksum: 0x90EFE864
	Offset: 0x240
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_activatorcount(player, value)
{
	[[ self ]]->set_activatorcount(player, value);
}

