#using scripts\core_common\lui_shared.csc;

class class_616a42d0 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_616a42d0
		Checksum: 0x8B23F4C
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
		Namespace: namespace_616a42d0
		Checksum: 0x49611D1C
		Offset: 0x480
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_616a42d0
		Checksum: 0x3FE91E57
		Offset: 0x418
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
		Namespace: namespace_616a42d0
		Checksum: 0x300ABFB0
		Offset: 0x3A0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_build_progress");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_616a42d0
		Checksum: 0x8D118F9
		Offset: 0x348
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_afaddf7a)
	{
		namespace_6aaccc24::setup_clientfields("zm_build_progress");
		namespace_6aaccc24::function_da693cbe("progress", 1, 6, "float", var_afaddf7a);
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_616a42d0
		Checksum: 0x84384610
		Offset: 0x448
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_affe8f61(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_616a42d0
		Checksum: 0xD859B516
		Offset: 0x3C8
		Size: 0x48
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", 0);
	}

}

#namespace zm_build_progress;

/*
	Name: register
	Namespace: zm_build_progress
	Checksum: 0x265A7B34
	Offset: 0xC0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_afaddf7a)
{
	elem = new class_616a42d0();
	[[ elem ]]->setup_clientfields(var_afaddf7a);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = array(level.var_ae746e8f[#"zm_build_progress"]);
	}
	level.var_ae746e8f[#"zm_build_progress"][level.var_ae746e8f[#"zm_build_progress"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: zm_build_progress
	Checksum: 0x128E3D66
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_616a42d0();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: zm_build_progress
	Checksum: 0xA013B51C
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
	Namespace: zm_build_progress
	Checksum: 0x26818F9B
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
	Namespace: zm_build_progress
	Checksum: 0x4631A662
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
	Name: function_affe8f61
	Namespace: zm_build_progress
	Checksum: 0x37B046F1
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_affe8f61(localclientnum, value)
{
	[[ self ]]->function_affe8f61(localclientnum, value);
}

