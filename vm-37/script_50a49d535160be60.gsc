#using scripts\core_common\lui_shared.csc;

class class_cd621025 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_cd621025
		Checksum: 0x820DCA04
		Offset: 0x360
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_cd621025
		Checksum: 0x384A73C2
		Offset: 0x5C0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_cd621025
		Checksum: 0xB0C05FD4
		Offset: 0x4A0
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
		Namespace: namespace_cd621025
		Checksum: 0x4AA88B32
		Offset: 0x400
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_hint_text");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_cd621025
		Checksum: 0x4DD8FB4B
		Offset: 0x380
		Size: 0x74
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_f5852d69)
	{
		namespace_6aaccc24::setup_clientfields("zm_hint_text");
		namespace_6aaccc24::function_da693cbe("_state", 1, 1, "int");
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_cd621025
		Checksum: 0xC68E5A40
		Offset: 0x588
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_d5ea17f0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: set_state
		Namespace: namespace_cd621025
		Checksum: 0xAB7456F1
		Offset: 0x4D0
		Size: 0xAC
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
			if(#"visible" == state_name)
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
		Name: function_fa582112
		Namespace: namespace_cd621025
		Checksum: 0x9B29E36D
		Offset: 0x428
		Size: 0x6C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "text", #"");
	}

}

#namespace zm_hint_text;

/*
	Name: register
	Namespace: zm_hint_text
	Checksum: 0xAF74F27A
	Offset: 0xC8
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_f5852d69)
{
	elem = new class_cd621025();
	[[ elem ]]->setup_clientfields(var_f5852d69);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_hint_text"]))
	{
		level.var_ae746e8f[#"zm_hint_text"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_hint_text"]))
	{
		level.var_ae746e8f[#"zm_hint_text"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_hint_text"]))
	{
		level.var_ae746e8f[#"zm_hint_text"] = array(level.var_ae746e8f[#"zm_hint_text"]);
	}
	level.var_ae746e8f[#"zm_hint_text"][level.var_ae746e8f[#"zm_hint_text"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_hint_text
	Checksum: 0xDBCCC6F0
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_cd621025();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_hint_text
	Checksum: 0xA8E7306E
	Offset: 0x288
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
	Namespace: zm_hint_text
	Checksum: 0x4FEA3E8B
	Offset: 0x2B0
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
	Namespace: zm_hint_text
	Checksum: 0xE1ACBCAD
	Offset: 0x2D8
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
	Namespace: zm_hint_text
	Checksum: 0x22EE9EEC
	Offset: 0x300
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: function_d5ea17f0
	Namespace: zm_hint_text
	Checksum: 0xC1B100DA
	Offset: 0x330
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

