#using scripts\core_common\lui_shared.csc;

class class_37d61ee3 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_37d61ee3
		Checksum: 0xFAF9CDEF
		Offset: 0x370
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_37d61ee3
		Checksum: 0xADB262B3
		Offset: 0x4F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_37d61ee3
		Checksum: 0x32E1F896
		Offset: 0x458
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
		Namespace: namespace_37d61ee3
		Checksum: 0xD75BFE90
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("lui_plane_mortar");
	}

	/*
		Name: function_6c69ff4b
		Namespace: namespace_37d61ee3
		Checksum: 0x9B2167B7
		Offset: 0x488
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_6c69ff4b(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "selectorIndex", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_37d61ee3
		Checksum: 0x49DE7560
		Offset: 0x390
		Size: 0x2C
		Parameters: 2
		Flags: Linked
	*/
	function setup_clientfields(var_828e1f01, var_a9fceeac)
	{
		namespace_6aaccc24::setup_clientfields("lui_plane_mortar");
	}

	/*
		Name: function_b172c58e
		Namespace: namespace_37d61ee3
		Checksum: 0x7FF62112
		Offset: 0x4C0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_b172c58e(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "selectorsAvailable", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_37d61ee3
		Checksum: 0x5920D032
		Offset: 0x3F0
		Size: 0x5C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->function_d7d2fcce(localclientnum, "selectorIndex", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "selectorsAvailable", 0);
	}

}

#namespace lui_plane_mortar;

/*
	Name: register
	Namespace: lui_plane_mortar
	Checksum: 0xA57EE071
	Offset: 0xD0
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_828e1f01, var_a9fceeac)
{
	elem = new class_37d61ee3();
	[[ elem ]]->setup_clientfields(var_828e1f01, var_a9fceeac);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"lui_plane_mortar"]))
	{
		level.var_ae746e8f[#"lui_plane_mortar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"lui_plane_mortar"]))
	{
		level.var_ae746e8f[#"lui_plane_mortar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"lui_plane_mortar"]))
	{
		level.var_ae746e8f[#"lui_plane_mortar"] = array(level.var_ae746e8f[#"lui_plane_mortar"]);
	}
	level.var_ae746e8f[#"lui_plane_mortar"][level.var_ae746e8f[#"lui_plane_mortar"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: lui_plane_mortar
	Checksum: 0xA09F7430
	Offset: 0x258
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_37d61ee3();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: lui_plane_mortar
	Checksum: 0x1E5B7410
	Offset: 0x298
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
	Namespace: lui_plane_mortar
	Checksum: 0x88C9133E
	Offset: 0x2C0
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
	Namespace: lui_plane_mortar
	Checksum: 0x67646AD4
	Offset: 0x2E8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: function_6c69ff4b
	Namespace: lui_plane_mortar
	Checksum: 0x4D3642FA
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6c69ff4b(localclientnum, value)
{
	[[ self ]]->function_6c69ff4b(localclientnum, value);
}

/*
	Name: function_b172c58e
	Namespace: lui_plane_mortar
	Checksum: 0xD74AF91A
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b172c58e(localclientnum, value)
{
	[[ self ]]->function_b172c58e(localclientnum, value);
}

