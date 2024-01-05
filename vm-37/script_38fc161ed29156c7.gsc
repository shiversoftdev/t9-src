#using scripts\core_common\lui_shared.csc;

class csuccess_screen : cluielem
{

	/*
		Name: constructor
		Namespace: csuccess_screen
		Checksum: 0x467B1168
		Offset: 0x2D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csuccess_screen
		Checksum: 0x143F04C3
		Offset: 0x3A8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: csuccess_screen
		Checksum: 0x120E04A5
		Offset: 0x378
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: csuccess_screen
		Checksum: 0x3F426332
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("success_screen");
	}

	/*
		Name: setup_clientfields
		Namespace: csuccess_screen
		Checksum: 0xB43775F5
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("success_screen");
	}

	/*
		Name: function_fa582112
		Namespace: csuccess_screen
		Checksum: 0xB96C3F2B
		Offset: 0x348
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace success_screen;

/*
	Name: register
	Namespace: success_screen
	Checksum: 0x25B931DD
	Offset: 0xA8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new csuccess_screen();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"success_screen"]))
	{
		level.var_ae746e8f[#"success_screen"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"success_screen"]))
	{
		level.var_ae746e8f[#"success_screen"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"success_screen"]))
	{
		level.var_ae746e8f[#"success_screen"] = array(level.var_ae746e8f[#"success_screen"]);
	}
	level.var_ae746e8f[#"success_screen"][level.var_ae746e8f[#"success_screen"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: success_screen
	Checksum: 0x57A6E348
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new csuccess_screen();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: success_screen
	Checksum: 0xFA87EE0E
	Offset: 0x260
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
	Namespace: success_screen
	Checksum: 0x7C6BAA87
	Offset: 0x288
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
	Namespace: success_screen
	Checksum: 0xF5E5C0E0
	Offset: 0x2B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

