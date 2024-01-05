#using scripts\core_common\lui_shared.csc;

class cplayer_insertion_choice : cluielem
{

	/*
		Name: constructor
		Namespace: cplayer_insertion_choice
		Checksum: 0x84C849B3
		Offset: 0x348
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
		Checksum: 0xECB0395
		Offset: 0x588
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
		Checksum: 0x6B5DC6E2
		Offset: 0x430
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cplayer_insertion_choice
		Checksum: 0x7A6BF8EA
		Offset: 0x3B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("player_insertion_choice");
	}

	/*
		Name: setup_clientfields
		Namespace: cplayer_insertion_choice
		Checksum: 0x34A516C3
		Offset: 0x368
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
		Checksum: 0x9A9C8916
		Offset: 0x460
		Size: 0x11C
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
			if(#"groundvehicle" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"halojump" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
				}
				else
				{
					if(#"heli" == state_name)
					{
						[[ self ]]->set_data(localclientnum, "_state", 3);
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

	/*
		Name: function_fa582112
		Namespace: cplayer_insertion_choice
		Checksum: 0x42D54529
		Offset: 0x3E0
		Size: 0x44
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
	}

}

#namespace player_insertion_choice;

/*
	Name: function_d9d22fdc
	Namespace: player_insertion_choice
	Checksum: 0x5BE79A12
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d9d22fdc()
{
	level notify(-1509366934);
}

/*
	Name: register
	Namespace: player_insertion_choice
	Checksum: 0xB41DD504
	Offset: 0xE8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cplayer_insertion_choice();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"player_insertion_choice"]))
	{
		level.var_ae746e8f[#"player_insertion_choice"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"player_insertion_choice"]))
	{
		level.var_ae746e8f[#"player_insertion_choice"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"player_insertion_choice"]))
	{
		level.var_ae746e8f[#"player_insertion_choice"] = array(level.var_ae746e8f[#"player_insertion_choice"]);
	}
	level.var_ae746e8f[#"player_insertion_choice"][level.var_ae746e8f[#"player_insertion_choice"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: player_insertion_choice
	Checksum: 0xB1E35C96
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cplayer_insertion_choice();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: player_insertion_choice
	Checksum: 0x307868D4
	Offset: 0x2A0
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
	Namespace: player_insertion_choice
	Checksum: 0xC75BC85B
	Offset: 0x2C8
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
	Checksum: 0x2BCAF13C
	Offset: 0x2F0
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
	Namespace: player_insertion_choice
	Checksum: 0xC84A2FE4
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

