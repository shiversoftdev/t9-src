#using scripts\core_common\lui_shared.csc;

class cinteractive_shot : cluielem
{

	/*
		Name: constructor
		Namespace: cinteractive_shot
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
		Namespace: cinteractive_shot
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
		Namespace: cinteractive_shot
		Checksum: 0xEA139EF0
		Offset: 0x420
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cinteractive_shot
		Checksum: 0xB016AA07
		Offset: 0x3A0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("interactive_shot");
	}

	/*
		Name: setup_clientfields
		Namespace: cinteractive_shot
		Checksum: 0x4CB99B03
		Offset: 0x348
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_f5852d69)
	{
		cluielem::setup_clientfields("interactive_shot");
		cluielem::function_dcb34c80("string", "text", 1);
	}

	/*
		Name: set_text
		Namespace: cinteractive_shot
		Checksum: 0xA8FF5B4E
		Offset: 0x450
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "text", value);
	}

	/*
		Name: function_fa582112
		Namespace: cinteractive_shot
		Checksum: 0xBD8FC5F6
		Offset: 0x3C8
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "text", #"");
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
	elem = new cinteractive_shot();
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
	Name: register_clientside
	Namespace: interactive_shot
	Checksum: 0x956060CB
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cinteractive_shot();
	[[ elem ]]->register_clientside();
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
	Name: set_text
	Namespace: interactive_shot
	Checksum: 0x4D44F4AC
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

