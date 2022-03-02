#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_d1b6325c : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_d1b6325c
		Checksum: 0x1FFDEF9E
		Offset: 0x218
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d1b6325c
		Checksum: 0xC57ADBD4
		Offset: 0x498
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_d1b6325c
		Checksum: 0x59173F80
		Offset: 0x2B0
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
		Name: close
		Namespace: namespace_d1b6325c
		Checksum: 0xEFF2F2BA
		Offset: 0x2F8
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
		Namespace: namespace_d1b6325c
		Checksum: 0x8FEA55D2
		Offset: 0x238
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_game_over");
		namespace_6aaccc24::function_da693cbe("_state", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("rounds", 1, 8, "int");
	}

	/*
		Name: set_rounds
		Namespace: namespace_d1b6325c
		Checksum: 0x3EE86ED2
		Offset: 0x448
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_rounds(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "rounds", value);
	}

	/*
		Name: set_state
		Namespace: namespace_d1b6325c
		Checksum: 0xC44D7DB2
		Offset: 0x328
		Size: 0x114
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
			if(#"hash_4677c7e6d02d1a65" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"hash_5f1b73095bbb3a7a" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
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

#namespace zm_game_over;

/*
	Name: function_eac61074
	Namespace: zm_game_over
	Checksum: 0xDFF22B00
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eac61074()
{
	level notify(354625097);
}

/*
	Name: register
	Namespace: zm_game_over
	Checksum: 0xE4CA50C9
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_d1b6325c();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_game_over
	Checksum: 0x584B4B43
	Offset: 0x128
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
	Namespace: zm_game_over
	Checksum: 0x5189623B
	Offset: 0x168
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
	Namespace: zm_game_over
	Checksum: 0xC3D6EA8D
	Offset: 0x190
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
	Namespace: zm_game_over
	Checksum: 0x9478374C
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_rounds
	Namespace: zm_game_over
	Checksum: 0xA960E340
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_rounds(player, value)
{
	[[ self ]]->set_rounds(player, value);
}

