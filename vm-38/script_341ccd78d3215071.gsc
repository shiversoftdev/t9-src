#using scripts\core_common\lui_shared.csc;

class class_d1ed471a : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_d1ed471a
		Checksum: 0xDC4084E4
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
		Namespace: namespace_d1ed471a
		Checksum: 0xCB392D6D
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
		Namespace: namespace_d1ed471a
		Checksum: 0x6BBE1073
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
		Namespace: namespace_d1ed471a
		Checksum: 0x1C8CEAA7
		Offset: 0x340
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_gold_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_d1ed471a
		Checksum: 0xD6F94C2A
		Offset: 0x318
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_gold_hud");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_d1ed471a
		Checksum: 0x1D2B076A
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

#namespace namespace_82d7691b;

/*
	Name: function_8c06d5e9
	Namespace: namespace_82d7691b
	Checksum: 0xB9C6EA0D
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8c06d5e9()
{
	level notify(2040601392);
}

/*
	Name: register
	Namespace: namespace_82d7691b
	Checksum: 0xAD80BDAE
	Offset: 0xC8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_d1ed471a();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"hash_270f51c6d631dccd"]))
	{
		level.var_ae746e8f[#"hash_270f51c6d631dccd"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"hash_270f51c6d631dccd"]))
	{
		level.var_ae746e8f[#"hash_270f51c6d631dccd"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"hash_270f51c6d631dccd"]))
	{
		level.var_ae746e8f[#"hash_270f51c6d631dccd"] = array(level.var_ae746e8f[#"hash_270f51c6d631dccd"]);
	}
	level.var_ae746e8f[#"hash_270f51c6d631dccd"][level.var_ae746e8f[#"hash_270f51c6d631dccd"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: namespace_82d7691b
	Checksum: 0x4E8BD916
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_d1ed471a();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: namespace_82d7691b
	Checksum: 0xDC8037A3
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
	Namespace: namespace_82d7691b
	Checksum: 0x9A28CCE
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
	Namespace: namespace_82d7691b
	Checksum: 0x9AC1CC48
	Offset: 0x2D0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

