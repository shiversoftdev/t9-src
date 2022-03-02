#using scripts\core_common\lui_shared.csc;

class class_849c5d15 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_849c5d15
		Checksum: 0x52B1EC21
		Offset: 0x328
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
		Checksum: 0x6D8FBCF7
		Offset: 0x488
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
		Checksum: 0xEA139EF0
		Offset: 0x420
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
		Checksum: 0xB016AA07
		Offset: 0x3A0
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
		Checksum: 0x4CB99B03
		Offset: 0x348
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
		Checksum: 0xA8FF5B4E
		Offset: 0x450
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
		Checksum: 0xBD8FC5F6
		Offset: 0x3C8
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
	Name: register
	Namespace: interactive_shot
	Checksum: 0x4E84E42D
	Offset: 0xC0
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
	Checksum: 0x956060CB
	Offset: 0x240
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
	Checksum: 0x77B31D76
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
	Namespace: interactive_shot
	Checksum: 0x4C116476
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
	Namespace: interactive_shot
	Checksum: 0xAEF0CE54
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
	Name: function_d5ea17f0
	Namespace: interactive_shot
	Checksum: 0x4D44F4AC
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

