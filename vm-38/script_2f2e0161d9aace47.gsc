#using scripts\core_common\lui_shared.csc;

class class_eaf2482a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_eaf2482a
		Checksum: 0xDC4084E4
		Offset: 0x308
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_eaf2482a
		Checksum: 0xCB392D6D
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_eaf2482a
		Checksum: 0x6BBE1073
		Offset: 0x3A8
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
		Namespace: namespace_eaf2482a
		Checksum: 0x1C8CEAA7
		Offset: 0x350
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_gold_align_satellite_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_eaf2482a
		Checksum: 0xD6F94C2A
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_gold_align_satellite_hud");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_eaf2482a
		Checksum: 0x1D2B076A
		Offset: 0x378
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace namespace_2d060063;

/*
	Name: function_11404e50
	Namespace: namespace_2d060063
	Checksum: 0xAA6382CA
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_11404e50()
{
	level notify(1650278560);
}

/*
	Name: register
	Namespace: namespace_2d060063
	Checksum: 0xB4981A7E
	Offset: 0xD8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_eaf2482a();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_5bc5fa54cf66129d"]))
	{
		level.var_ae746e8f[#"hash_5bc5fa54cf66129d"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_5bc5fa54cf66129d"]))
	{
		level.var_ae746e8f[#"hash_5bc5fa54cf66129d"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_5bc5fa54cf66129d"]))
	{
		level.var_ae746e8f[#"hash_5bc5fa54cf66129d"] = array(level.var_ae746e8f[#"hash_5bc5fa54cf66129d"]);
	}
	level.var_ae746e8f[#"hash_5bc5fa54cf66129d"][level.var_ae746e8f[#"hash_5bc5fa54cf66129d"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_2d060063
	Checksum: 0x97CE3BCE
	Offset: 0x250
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_eaf2482a();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_2d060063
	Checksum: 0xDC8037A3
	Offset: 0x290
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
	Namespace: namespace_2d060063
	Checksum: 0x9A28CCE
	Offset: 0x2B8
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
	Namespace: namespace_2d060063
	Checksum: 0x9AC1CC48
	Offset: 0x2E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

