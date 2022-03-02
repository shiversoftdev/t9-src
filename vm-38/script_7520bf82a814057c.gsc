#using scripts\core_common\lui_shared.csc;

class class_d1b6325c : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_d1b6325c
		Checksum: 0x71617B1E
		Offset: 0x378
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
		Checksum: 0x3BCD4D13
		Offset: 0x600
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
		Checksum: 0x7BEE4324
		Offset: 0x4A8
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
		Checksum: 0x6E723FEB
		Offset: 0x418
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
		Checksum: 0x681A143C
		Offset: 0x398
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
		Checksum: 0x87C1A0C1
		Offset: 0x5C8
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
		Checksum: 0x74C849D2
		Offset: 0x4D8
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
		Checksum: 0x56167DB5
		Offset: 0x440
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
	Name: function_66a128e6
	Namespace: zm_game_over
	Checksum: 0x81DB3A25
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_66a128e6()
{
	level notify(1481286545);
}

/*
	Name: register
	Namespace: zm_game_over
	Checksum: 0x541E6720
	Offset: 0xE0
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
	Checksum: 0x26E3BF58
	Offset: 0x260
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
	Checksum: 0x50C9B987
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
	Namespace: zm_game_over
	Checksum: 0x1F42E9D6
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
	Namespace: zm_game_over
	Checksum: 0x715ED0C4
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
	Namespace: zm_game_over
	Checksum: 0x1BF8E9FF
	Offset: 0x318
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
	Checksum: 0xC14E42BE
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rounds(localclientnum, value)
{
	[[ self ]]->set_rounds(localclientnum, value);
}

