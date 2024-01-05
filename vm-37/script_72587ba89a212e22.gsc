#using scripts\core_common\lui_shared.csc;

class cdirtybomb_usebar : cluielem
{

	/*
		Name: constructor
		Namespace: cdirtybomb_usebar
		Checksum: 0x227173FB
		Offset: 0x3B8
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
		Checksum: 0xD935AE5B
		Offset: 0x698
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
		Checksum: 0xAC1E801D
		Offset: 0x540
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
		Checksum: 0x4DC9E671
		Offset: 0x660
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
		Checksum: 0x7986894C
		Offset: 0x488
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
		Checksum: 0xEF210A9
		Offset: 0x3D8
		Size: 0xA4
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_ec85b709, var_193163f7)
	{
		cluielem::setup_clientfields("DirtyBomb_UseBar");
		cluielem::add_clientfield("_state", 1, 1, "int");
		cluielem::add_clientfield("progressFrac", 1, 10, "float", var_ec85b709);
		cluielem::add_clientfield("activatorCount", 1, 3, "int", var_193163f7);
	}

	/*
		Name: set_state
		Namespace: cdirtybomb_usebar
		Checksum: 0xEA8A85FB
		Offset: 0x570
		Size: 0xAC
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
				/#
					assertmsg("");
				#/
				/#
				#/
			}
		}
	}

	/*
		Name: set_progressfrac
		Namespace: cdirtybomb_usebar
		Checksum: 0x55F00AD5
		Offset: 0x628
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
		Checksum: 0xCC75FBC7
		Offset: 0x4B0
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
	Name: register
	Namespace: dirtybomb_usebar
	Checksum: 0xC37147D0
	Offset: 0xE8
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
	Checksum: 0x5434FCF0
	Offset: 0x270
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
	Checksum: 0xFBE067A2
	Offset: 0x2B0
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
	Checksum: 0xF53814AC
	Offset: 0x2D8
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
	Checksum: 0xF237DECB
	Offset: 0x300
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
	Checksum: 0x8C0B6A08
	Offset: 0x328
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
	Checksum: 0x765AD5E9
	Offset: 0x358
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
	Checksum: 0xC777A7A2
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_activatorcount(localclientnum, value)
{
	[[ self ]]->set_activatorcount(localclientnum, value);
}

