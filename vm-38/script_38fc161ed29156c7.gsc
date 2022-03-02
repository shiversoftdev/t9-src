#using scripts\core_common\lui_shared.csc;

class class_6dd74b12 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_6dd74b12
		Checksum: 0x6847223E
		Offset: 0x2F8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_6dd74b12
		Checksum: 0xD1288E34
		Offset: 0x3C8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_6dd74b12
		Checksum: 0x6F7D0D69
		Offset: 0x398
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
		Namespace: namespace_6dd74b12
		Checksum: 0xF9C8F613
		Offset: 0x340
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("success_screen");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_6dd74b12
		Checksum: 0x23DE0498
		Offset: 0x318
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("success_screen");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_6dd74b12
		Checksum: 0xBF81C59
		Offset: 0x368
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace success_screen;

/*
	Name: function_5d206f93
	Namespace: success_screen
	Checksum: 0x37B71873
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5d206f93()
{
	level notify(429609216);
}

/*
	Name: register
	Namespace: success_screen
	Checksum: 0x3ED13662
	Offset: 0xC8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_6dd74b12();
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
	Name: function_5c1bb138
	Namespace: success_screen
	Checksum: 0x67C2D770
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_6dd74b12();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: success_screen
	Checksum: 0x4C92B014
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
	Namespace: success_screen
	Checksum: 0x9DE286F
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
	Namespace: success_screen
	Checksum: 0xC32F1927
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

