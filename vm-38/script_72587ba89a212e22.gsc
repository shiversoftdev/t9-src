#using scripts\core_common\lui_shared.csc;

class cdirtybomb_usebar : cluielem
{

	/*
		Name: constructor
		Namespace: cdirtybomb_usebar
		Checksum: 0x7E1E6212
		Offset: 0x3D8
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
		Checksum: 0x53253F22
		Offset: 0x798
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
		Checksum: 0x35CAFBAD
		Offset: 0x560
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_activatorcount
		Namespace: cdirtybomb_usebar
		Checksum: 0xF5429E2B
		Offset: 0x760
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_activatorcount(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "activatorCount", value);
	}

	/*
		Name: register_clientside
		Namespace: cdirtybomb_usebar
		Checksum: 0x3FE4322E
		Offset: 0x4A8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DirtyBomb_UseBar");
	}

	/*
		Name: setup_clientfields
		Namespace: cdirtybomb_usebar
		Checksum: 0xEEF57C4C
		Offset: 0x3F8
		Size: 0xA4
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_ec85b709, var_193163f7)
	{
		cluielem::setup_clientfields("DirtyBomb_UseBar");
		cluielem::add_clientfield("_state", 1, 3, "int");
		cluielem::add_clientfield("progressFrac", 1, 10, "float", var_ec85b709);
		cluielem::add_clientfield("activatorCount", 1, 3, "int", var_193163f7);
	}

	/*
		Name: set_state
		Namespace: cdirtybomb_usebar
		Checksum: 0x742D79
		Offset: 0x590
		Size: 0x18C
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
			if(#"detonating" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_1a2812055c330ee0" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
				}
				else
				{
					if(#"hash_59e0e869fbae7705" == state_name)
					{
						[[ self ]]->set_data(localclientnum, "_state", 3);
					}
					else
					{
						if(#"hash_b86ebfb5a93f57f" == state_name)
						{
							[[ self ]]->set_data(localclientnum, "_state", 4);
						}
						else
						{
							if(#"hash_4ff55a42344e567e" == state_name)
							{
								[[ self ]]->set_data(localclientnum, "_state", 5);
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
		Checksum: 0x3DAD6888
		Offset: 0x728
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progressfrac(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progressFrac", value);
	}

	/*
		Name: function_fa582112
		Namespace: cdirtybomb_usebar
		Checksum: 0x7D29E272
		Offset: 0x4D0
		Size: 0x84
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "progressFrac", 0);
		[[ self ]]->set_data(localclientnum, "activatorCount", 0);
	}

}

#namespace dirtybomb_usebar;

/*
	Name: function_273cdf25
	Namespace: dirtybomb_usebar
	Checksum: 0x283F71CA
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_273cdf25()
{
	level notify(209167547);
}

/*
	Name: register
	Namespace: dirtybomb_usebar
	Checksum: 0x78FC433F
	Offset: 0x108
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_ec85b709, var_193163f7)
{
	elem = new cdirtybomb_usebar();
	[[ elem ]]->setup_clientfields(var_ec85b709, var_193163f7);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"dirtybomb_usebar"]))
	{
		level.var_ae746e8f[#"dirtybomb_usebar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"dirtybomb_usebar"]))
	{
		level.var_ae746e8f[#"dirtybomb_usebar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"dirtybomb_usebar"]))
	{
		level.var_ae746e8f[#"dirtybomb_usebar"] = array(level.var_ae746e8f[#"dirtybomb_usebar"]);
	}
	level.var_ae746e8f[#"dirtybomb_usebar"][level.var_ae746e8f[#"dirtybomb_usebar"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: dirtybomb_usebar
	Checksum: 0x87435D75
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cdirtybomb_usebar();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: dirtybomb_usebar
	Checksum: 0x30C153CC
	Offset: 0x2D0
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
	Namespace: dirtybomb_usebar
	Checksum: 0x5DBF26A
	Offset: 0x2F8
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
	Checksum: 0xF8480F91
	Offset: 0x320
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
	Namespace: dirtybomb_usebar
	Checksum: 0x2642104F
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_progressfrac
	Namespace: dirtybomb_usebar
	Checksum: 0xF52CB605
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progressfrac(localclientnum, value)
{
	[[ self ]]->set_progressfrac(localclientnum, value);
}

/*
	Name: set_activatorcount
	Namespace: dirtybomb_usebar
	Checksum: 0x84693EC7
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_activatorcount(localclientnum, value)
{
	[[ self ]]->set_activatorcount(localclientnum, value);
}

