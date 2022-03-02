#using scripts\core_common\lui_shared.csc;

class class_8c34ca59 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_8c34ca59
		Checksum: 0x2EE5231B
		Offset: 0x378
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8c34ca59
		Checksum: 0xCE724089
		Offset: 0x558
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8c34ca59
		Checksum: 0x5C169F4B
		Offset: 0x4B8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_8c34ca59
		Checksum: 0x6AFF355C
		Offset: 0x420
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("seeker_mine_prompt");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8c34ca59
		Checksum: 0x7D4729D5
		Offset: 0x398
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_afaddf7a, var_ca3086f0)
	{
		namespace_6aaccc24::setup_clientfields("seeker_mine_prompt");
		namespace_6aaccc24::function_da693cbe("progress", 1, 5, "float", var_afaddf7a);
		namespace_6aaccc24::function_da693cbe("promptState", 1, 2, "int", var_ca3086f0);
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_8c34ca59
		Checksum: 0x5C87A9FD
		Offset: 0x4E8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_affe8f61(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", value);
	}

	/*
		Name: function_c719cfea
		Namespace: namespace_8c34ca59
		Checksum: 0xB609CF6B
		Offset: 0x520
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c719cfea(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "promptState", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_8c34ca59
		Checksum: 0x3BFAF4A9
		Offset: 0x448
		Size: 0x64
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "promptState", 0);
	}

}

#namespace seeker_mine_prompt;

/*
	Name: register
	Namespace: seeker_mine_prompt
	Checksum: 0x3073CDB4
	Offset: 0xD8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_afaddf7a, var_ca3086f0)
{
	elem = new class_8c34ca59();
	[[ elem ]]->setup_clientfields(var_afaddf7a, var_ca3086f0);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"seeker_mine_prompt"]))
	{
		level.var_ae746e8f[#"seeker_mine_prompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"seeker_mine_prompt"]))
	{
		level.var_ae746e8f[#"seeker_mine_prompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"seeker_mine_prompt"]))
	{
		level.var_ae746e8f[#"seeker_mine_prompt"] = array(level.var_ae746e8f[#"seeker_mine_prompt"]);
	}
	level.var_ae746e8f[#"seeker_mine_prompt"][level.var_ae746e8f[#"seeker_mine_prompt"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: seeker_mine_prompt
	Checksum: 0x66D94F10
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_8c34ca59();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: seeker_mine_prompt
	Checksum: 0x2452FC06
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
	Namespace: seeker_mine_prompt
	Checksum: 0xFE1506A9
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
	Namespace: seeker_mine_prompt
	Checksum: 0xC80CA57E
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
	Name: function_affe8f61
	Namespace: seeker_mine_prompt
	Checksum: 0xCD8F608
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_affe8f61(localclientnum, value)
{
	[[ self ]]->function_affe8f61(localclientnum, value);
}

/*
	Name: function_c719cfea
	Namespace: seeker_mine_prompt
	Checksum: 0x8FAABCDB
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c719cfea(localclientnum, value)
{
	[[ self ]]->function_c719cfea(localclientnum, value);
}

