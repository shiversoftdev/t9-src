#using scripts\core_common\lui_shared.csc;

class class_fbe341f : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_fbe341f
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
		Namespace: namespace_fbe341f
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
		Namespace: namespace_fbe341f
		Checksum: 0xAC1E801D
		Offset: 0x540
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_4aa46834
		Namespace: namespace_fbe341f
		Checksum: 0x4DC9E671
		Offset: 0x660
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_4aa46834(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "activatorCount", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_fbe341f
		Checksum: 0x7986894C
		Offset: 0x488
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("DirtyBomb_UseBar");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_fbe341f
		Checksum: 0xEF210A9
		Offset: 0x3D8
		Size: 0xA4
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_ec85b709, var_193163f7)
	{
		namespace_6aaccc24::setup_clientfields("DirtyBomb_UseBar");
		namespace_6aaccc24::function_da693cbe("_state", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("progressFrac", 1, 10, "float", var_ec85b709);
		namespace_6aaccc24::function_da693cbe("activatorCount", 1, 3, "int", var_193163f7);
	}

	/*
		Name: set_state
		Namespace: namespace_fbe341f
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
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"detonating" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
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
		Name: function_f0df5702
		Namespace: namespace_fbe341f
		Checksum: 0x55F00AD5
		Offset: 0x628
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_f0df5702(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progressFrac", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_fbe341f
		Checksum: 0xCC75FBC7
		Offset: 0x4B0
		Size: 0x84
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "progressFrac", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "activatorCount", 0);
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
	elem = new class_fbe341f();
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
	Name: function_5c1bb138
	Namespace: dirtybomb_usebar
	Checksum: 0x5434FCF0
	Offset: 0x270
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_fbe341f();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_f0df5702
	Namespace: dirtybomb_usebar
	Checksum: 0x765AD5E9
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f0df5702(localclientnum, value)
{
	[[ self ]]->function_f0df5702(localclientnum, value);
}

/*
	Name: function_4aa46834
	Namespace: dirtybomb_usebar
	Checksum: 0xC777A7A2
	Offset: 0x388
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4aa46834(localclientnum, value)
{
	[[ self ]]->function_4aa46834(localclientnum, value);
}

