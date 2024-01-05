#using scripts\core_common\lui_shared.csc;

class clui_plane_mortar : cluielem
{

	/*
		Name: constructor
		Namespace: clui_plane_mortar
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
		Namespace: clui_plane_mortar
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
		Namespace: clui_plane_mortar
		Checksum: 0x32E1F896
		Offset: 0x458
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: clui_plane_mortar
		Checksum: 0xD75BFE90
		Offset: 0x3C8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("lui_plane_mortar");
	}

	/*
		Name: set_selectorindex
		Namespace: clui_plane_mortar
		Checksum: 0x9B2167B7
		Offset: 0x488
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_selectorindex(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "selectorIndex", value);
	}

	/*
		Name: setup_clientfields
		Namespace: clui_plane_mortar
		Checksum: 0x49DE7560
		Offset: 0x390
		Size: 0x2C
		Parameters: 2
		Flags: Linked
	*/
	function setup_clientfields(var_828e1f01, var_a9fceeac)
	{
		cluielem::setup_clientfields("lui_plane_mortar");
	}

	/*
		Name: set_selectorsavailable
		Namespace: clui_plane_mortar
		Checksum: 0x7FF62112
		Offset: 0x4C0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_selectorsavailable(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "selectorsAvailable", value);
	}

	/*
		Name: function_fa582112
		Namespace: clui_plane_mortar
		Checksum: 0x5920D032
		Offset: 0x3F0
		Size: 0x5C
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "selectorIndex", 0);
		[[ self ]]->set_data(localclientnum, "selectorsAvailable", 0);
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
	elem = new clui_plane_mortar();
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
	Name: register_clientside
	Namespace: lui_plane_mortar
	Checksum: 0xA09F7430
	Offset: 0x258
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new clui_plane_mortar();
	[[ elem ]]->register_clientside();
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
	Name: set_selectorindex
	Namespace: lui_plane_mortar
	Checksum: 0x4D3642FA
	Offset: 0x310
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectorindex(localclientnum, value)
{
	[[ self ]]->set_selectorindex(localclientnum, value);
}

/*
	Name: set_selectorsavailable
	Namespace: lui_plane_mortar
	Checksum: 0xD74AF91A
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectorsavailable(localclientnum, value)
{
	[[ self ]]->set_selectorsavailable(localclientnum, value);
}

