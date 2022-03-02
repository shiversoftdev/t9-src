#using scripts\core_common\lui_shared.csc;

class class_d1b6325c : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_d1b6325c
		Checksum: 0x820DCA04
		Offset: 0x358
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
		Checksum: 0x53C3500D
		Offset: 0x5E0
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
		Checksum: 0xFE94CCA
		Offset: 0x488
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_d1b6325c
		Checksum: 0x34EF40D2
		Offset: 0x3F8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_game_over");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_d1b6325c
		Checksum: 0x2406FD89
		Offset: 0x378
		Size: 0x74
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_ddbc37b7)
	{
		namespace_6aaccc24::setup_clientfields("zm_game_over");
		namespace_6aaccc24::function_da693cbe("_state", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("rounds", 1, 8, "int", var_ddbc37b7);
	}

	/*
		Name: set_rounds
		Namespace: namespace_d1b6325c
		Checksum: 0xB370A67F
		Offset: 0x5A8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_rounds(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "rounds", value);
	}

	/*
		Name: set_state
		Namespace: namespace_d1b6325c
		Checksum: 0x36BAEF25
		Offset: 0x4B8
		Size: 0xE4
		Parameters: 2
		Flags: Linked
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hash_4677c7e6d02d1a65" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_5f1b73095bbb3a7a" == state_name)
				{
					[[ self ]]->function_d7d2fcce(localclientnum, "_state", 2);
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

	/*
		Name: function_fa582112
		Namespace: namespace_d1b6325c
		Checksum: 0x6AF44A2E
		Offset: 0x420
		Size: 0x60
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "rounds", 0);
	}

}

#namespace zm_game_over;

/*
	Name: register
	Namespace: zm_game_over
	Checksum: 0x23DEEE69
	Offset: 0xC0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_ddbc37b7)
{
	elem = new class_d1b6325c();
	[[ elem ]]->setup_clientfields(var_ddbc37b7);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_game_over"]))
	{
		level.var_ae746e8f[#"zm_game_over"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_game_over"]))
	{
		level.var_ae746e8f[#"zm_game_over"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_game_over"]))
	{
		level.var_ae746e8f[#"zm_game_over"] = array(level.var_ae746e8f[#"zm_game_over"]);
	}
	level.var_ae746e8f[#"zm_game_over"][level.var_ae746e8f[#"zm_game_over"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_game_over
	Checksum: 0x7FF17B8D
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_d1b6325c();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_game_over
	Checksum: 0xA8E7306E
	Offset: 0x280
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
	Namespace: zm_game_over
	Checksum: 0x4FEA3E8B
	Offset: 0x2A8
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
	Namespace: zm_game_over
	Checksum: 0xE1ACBCAD
	Offset: 0x2D0
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
	Namespace: zm_game_over
	Checksum: 0x22EE9EEC
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_rounds
	Namespace: zm_game_over
	Checksum: 0x373BDA65
	Offset: 0x328
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rounds(localclientnum, value)
{
	[[ self ]]->set_rounds(localclientnum, value);
}

