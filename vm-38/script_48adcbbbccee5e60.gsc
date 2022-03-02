#using scripts\core_common\lui_shared.csc;

class class_849c5d15 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_849c5d15
		Checksum: 0x44410434
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_849c5d15
		Checksum: 0x1A1DC7F3
		Offset: 0x4A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_849c5d15
		Checksum: 0x6583BA2B
		Offset: 0x440
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
		Namespace: namespace_849c5d15
		Checksum: 0xE378D10E
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("interactive_shot");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_849c5d15
		Checksum: 0x5AC555AF
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_f5852d69)
	{
		namespace_6aaccc24::setup_clientfields("interactive_shot");
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_849c5d15
		Checksum: 0x235E638C
		Offset: 0x470
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_d5ea17f0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "text", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_849c5d15
		Checksum: 0xFF48FB4A
		Offset: 0x3E8
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "text", #"");
	}

}

#namespace interactive_shot;

/*
	Name: function_536240f
	Namespace: interactive_shot
	Checksum: 0xC04ECFA6
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_536240f()
{
	level notify(1626297728);
}

/*
	Name: register
	Namespace: interactive_shot
	Checksum: 0xE6EA3D70
	Offset: 0xE0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_f5852d69)
{
	elem = new class_849c5d15();
	[[ elem ]]->setup_clientfields(var_f5852d69);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"interactive_shot"]))
	{
		level.var_ae746e8f[#"interactive_shot"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"interactive_shot"]))
	{
		level.var_ae746e8f[#"interactive_shot"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"interactive_shot"]))
	{
		level.var_ae746e8f[#"interactive_shot"] = array(level.var_ae746e8f[#"interactive_shot"]);
	}
	level.var_ae746e8f[#"interactive_shot"][level.var_ae746e8f[#"interactive_shot"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: interactive_shot
	Checksum: 0xED2E3827
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_849c5d15();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: interactive_shot
	Checksum: 0xC950A47
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
	Namespace: interactive_shot
	Checksum: 0x371BE82F
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
	Namespace: interactive_shot
	Checksum: 0x38B4598
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
	Name: function_d5ea17f0
	Namespace: interactive_shot
	Checksum: 0x8F440E09
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

