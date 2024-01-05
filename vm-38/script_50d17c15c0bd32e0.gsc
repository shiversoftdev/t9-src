#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cplayer_insertion_choice : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cplayer_insertion_choice
		Checksum: 0xA022DF69
		Offset: 0x1F0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cplayer_insertion_choice
		Checksum: 0xEA42BFB7
		Offset: 0x440
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cplayer_insertion_choice
		Checksum: 0x692ED424
		Offset: 0x260
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
		Name: close
		Namespace: cplayer_insertion_choice
		Checksum: 0x232E70C1
		Offset: 0x2A8
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
		Namespace: cplayer_insertion_choice
		Checksum: 0x27D1B8F0
		Offset: 0x210
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("player_insertion_choice");
		cluielem::add_clientfield("_state", 1, 2, "int");
	}

	/*
		Name: set_state
		Namespace: cplayer_insertion_choice
		Checksum: 0xFE1AC78F
		Offset: 0x2D8
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
			if(#"groundvehicle" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"halojump" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					if(#"heli" == state_name)
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

#namespace player_insertion_choice;

/*
	Name: function_e8aaca32
	Namespace: player_insertion_choice
	Checksum: 0x6CC2F663
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e8aaca32()
{
	level notify(898891659);
}

/*
	Name: register
	Namespace: player_insertion_choice
	Checksum: 0x2192EE9C
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cplayer_insertion_choice();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: player_insertion_choice
	Checksum: 0x22B7D0A0
	Offset: 0x130
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
	Namespace: player_insertion_choice
	Checksum: 0xBEEC1AC2
	Offset: 0x170
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
	Namespace: player_insertion_choice
	Checksum: 0xD0CA6291
	Offset: 0x198
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
	Namespace: player_insertion_choice
	Checksum: 0x5A13EE4C
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

