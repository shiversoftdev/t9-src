#using scripts\core_common\lui_shared.csc;

class class_a5d10b03 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_a5d10b03
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
		Namespace: namespace_a5d10b03
		Checksum: 0xE2EA79A
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
		Namespace: namespace_a5d10b03
		Checksum: 0x5D87F1D3
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
		Namespace: namespace_a5d10b03
		Checksum: 0x1F7F2F89
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("cp_killcam");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a5d10b03
		Checksum: 0x1F15312E
		Offset: 0x2F8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("cp_killcam");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a5d10b03
		Checksum: 0x51D984A3
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

#namespace cp_killcam;

/*
	Name: register
	Namespace: cp_killcam
	Checksum: 0xA6FBC661
	Offset: 0xA8
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_a5d10b03();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"cp_killcam"]))
	{
		level.var_ae746e8f[#"cp_killcam"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"cp_killcam"]))
	{
		level.var_ae746e8f[#"cp_killcam"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"cp_killcam"]))
	{
		level.var_ae746e8f[#"cp_killcam"] = array(level.var_ae746e8f[#"cp_killcam"]);
	}
	level.var_ae746e8f[#"cp_killcam"][level.var_ae746e8f[#"cp_killcam"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: cp_killcam
	Checksum: 0x6896821B
	Offset: 0x220
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_a5d10b03();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: cp_killcam
	Checksum: 0x2D274664
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
	Namespace: cp_killcam
	Checksum: 0x16FB416A
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
	Namespace: cp_killcam
	Checksum: 0x1D24A8D6
	Offset: 0x2B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

