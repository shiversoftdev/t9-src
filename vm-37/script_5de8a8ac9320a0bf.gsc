#using scripts\core_common\lui_shared.csc;

class class_e9d01e1c : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e9d01e1c
		Checksum: 0xA83899BA
		Offset: 0x2E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e9d01e1c
		Checksum: 0xC0641752
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e9d01e1c
		Checksum: 0x15ED68C2
		Offset: 0x380
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
		Namespace: namespace_e9d01e1c
		Checksum: 0x165224CC
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("debug_center_screen");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_e9d01e1c
		Checksum: 0x9D92F2B
		Offset: 0x300
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("debug_center_screen");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_e9d01e1c
		Checksum: 0x69693B4F
		Offset: 0x350
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace debug_center_screen;

/*
	Name: register
	Namespace: debug_center_screen
	Checksum: 0xDE55AC61
	Offset: 0xB0
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_e9d01e1c();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"debug_center_screen"]))
	{
		level.var_ae746e8f[#"debug_center_screen"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"debug_center_screen"]))
	{
		level.var_ae746e8f[#"debug_center_screen"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"debug_center_screen"]))
	{
		level.var_ae746e8f[#"debug_center_screen"] = array(level.var_ae746e8f[#"debug_center_screen"]);
	}
	level.var_ae746e8f[#"debug_center_screen"][level.var_ae746e8f[#"debug_center_screen"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: debug_center_screen
	Checksum: 0x70BBDE12
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_e9d01e1c();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: debug_center_screen
	Checksum: 0xF295DDC0
	Offset: 0x268
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
	Namespace: debug_center_screen
	Checksum: 0x1DD6536F
	Offset: 0x290
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
	Namespace: debug_center_screen
	Checksum: 0x271FD363
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

