#using scripts\core_common\lui_shared.csc;

class class_135e8f9a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_135e8f9a
		Checksum: 0xE4B0DD50
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_135e8f9a
		Checksum: 0x96368AB0
		Offset: 0x640
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_135e8f9a
		Checksum: 0x5EDB62AD
		Offset: 0x568
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_28ebf0f1
		Namespace: namespace_135e8f9a
		Checksum: 0x53958265
		Offset: 0x608
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_28ebf0f1(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeTime", value);
	}

	/*
		Name: function_3b7b386a
		Namespace: namespace_135e8f9a
		Checksum: 0x746A578D
		Offset: 0x5D0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_3b7b386a(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "clientNum", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_135e8f9a
		Checksum: 0x1237B87A
		Offset: 0x4B0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("revive_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_135e8f9a
		Checksum: 0x52FD5F42
		Offset: 0x3F8
		Size: 0xAC
		Parameters: 3
		Flags: Linked
	*/
	function setup_clientfields(var_f5852d69, var_c05c67e2, var_415094af)
	{
		namespace_6aaccc24::setup_clientfields("revive_hud");
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
		namespace_6aaccc24::function_da693cbe("clientNum", 1, 7, "int", var_c05c67e2);
		namespace_6aaccc24::function_da693cbe("fadeTime", 1, 5, "int", var_415094af);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_135e8f9a
		Checksum: 0x7C76AA5B
		Offset: 0x598
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
		Namespace: namespace_135e8f9a
		Checksum: 0xFC8B69C6
		Offset: 0x4D8
		Size: 0x84
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "text", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "clientNum", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "fadeTime", 0);
	}

}

#namespace revive_hud;

/*
	Name: function_2d8eb05
	Namespace: revive_hud
	Checksum: 0x1AE01011
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2d8eb05()
{
	level notify(692296382);
}

/*
	Name: register
	Namespace: revive_hud
	Checksum: 0x55FB38B
	Offset: 0xF8
	Size: 0x18E
	Parameters: 3
	Flags: Linked
*/
function register(var_f5852d69, var_c05c67e2, var_415094af)
{
	elem = new class_135e8f9a();
	[[ elem ]]->setup_clientfields(var_f5852d69, var_c05c67e2, var_415094af);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"revive_hud"]))
	{
		level.var_ae746e8f[#"revive_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"revive_hud"]))
	{
		level.var_ae746e8f[#"revive_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"revive_hud"]))
	{
		level.var_ae746e8f[#"revive_hud"] = array(level.var_ae746e8f[#"revive_hud"]);
	}
	level.var_ae746e8f[#"revive_hud"][level.var_ae746e8f[#"revive_hud"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: revive_hud
	Checksum: 0x68FF1A7F
	Offset: 0x290
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_135e8f9a();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: revive_hud
	Checksum: 0x37A0E45A
	Offset: 0x2D0
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
	Namespace: revive_hud
	Checksum: 0xC21D77EA
	Offset: 0x2F8
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
	Namespace: revive_hud
	Checksum: 0x10CA3097
	Offset: 0x320
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
	Namespace: revive_hud
	Checksum: 0x21E5D488
	Offset: 0x348
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(localclientnum, value)
{
	[[ self ]]->function_d5ea17f0(localclientnum, value);
}

/*
	Name: function_3b7b386a
	Namespace: revive_hud
	Checksum: 0xDC8A0C4
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3b7b386a(localclientnum, value)
{
	[[ self ]]->function_3b7b386a(localclientnum, value);
}

/*
	Name: function_28ebf0f1
	Namespace: revive_hud
	Checksum: 0xA07F8B7E
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_28ebf0f1(localclientnum, value)
{
	[[ self ]]->function_28ebf0f1(localclientnum, value);
}

