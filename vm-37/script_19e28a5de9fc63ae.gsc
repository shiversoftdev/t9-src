#using scripts\core_common\lui_shared.csc;

class class_f2a6c231 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_f2a6c231
		Checksum: 0xA83899BA
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
		Namespace: namespace_f2a6c231
		Checksum: 0xC0641752
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
		Namespace: namespace_f2a6c231
		Checksum: 0x15ED68C2
		Offset: 0x378
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
		Namespace: namespace_f2a6c231
		Checksum: 0x165224CC
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("fail_screen");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_f2a6c231
		Checksum: 0x9D92F2B
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("fail_screen");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_f2a6c231
		Checksum: 0x69693B4F
		Offset: 0x348
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace fail_screen;

/*
	Name: register
	Namespace: fail_screen
	Checksum: 0x7BCB664D
	Offset: 0xA8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_f2a6c231();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"fail_screen"]))
	{
		level.var_ae746e8f[#"fail_screen"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"fail_screen"]))
	{
		level.var_ae746e8f[#"fail_screen"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"fail_screen"]))
	{
		level.var_ae746e8f[#"fail_screen"] = array(level.var_ae746e8f[#"fail_screen"]);
	}
	level.var_ae746e8f[#"fail_screen"][level.var_ae746e8f[#"fail_screen"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: fail_screen
	Checksum: 0xC54187F5
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_f2a6c231();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: fail_screen
	Checksum: 0xF295DDC0
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
	Namespace: fail_screen
	Checksum: 0x1DD6536F
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
	Namespace: fail_screen
	Checksum: 0x271FD363
	Offset: 0x2B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

