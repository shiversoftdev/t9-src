#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_game_over : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_game_over
		Checksum: 0x85AC975A
		Offset: 0x1F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_game_over
		Checksum: 0x67840A0
		Offset: 0x478
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_game_over
		Checksum: 0x64C04680
		Offset: 0x290
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: czm_game_over
		Checksum: 0x5AFD7F6A
		Offset: 0x2D8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_game_over
		Checksum: 0x4D0D4044
		Offset: 0x218
		Size: 0x6C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_game_over");
		cluielem::add_clientfield("_state", 1, 2, "int");
		cluielem::add_clientfield("rounds", 1, 8, "int");
	}

	/*
		Name: set_rounds
		Namespace: czm_game_over
		Checksum: 0xC7467A3C
		Offset: 0x428
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
		Namespace: czm_game_over
		Checksum: 0x6ECB13D1
		Offset: 0x308
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
	Name: register
	Namespace: zm_game_over
	Checksum: 0x7EBE1438
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new czm_game_over();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_game_over
	Checksum: 0x66AF6895
	Offset: 0x108
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
	Checksum: 0xCF4D1283
	Offset: 0x148
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
	Checksum: 0xD7BC2ED4
	Offset: 0x170
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
	Checksum: 0x263269A1
	Offset: 0x198
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
	Checksum: 0xA157F0E9
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_rounds(player, value)
{
	[[ self ]]->set_rounds(player, value);
}

