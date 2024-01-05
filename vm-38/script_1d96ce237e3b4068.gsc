#using scripts\core_common\lui_shared.csc;

class clui_plane_mortar : cluielem
{

	/*
		Name: constructor
		Namespace: clui_plane_mortar
		Checksum: 0x3716BC0
		Offset: 0x390
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
		Checksum: 0x22E037C6
		Offset: 0x518
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
		Checksum: 0xD93A7117
		Offset: 0x478
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
		Checksum: 0xE58C6A23
		Offset: 0x3E8
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
		Checksum: 0x23BDD50D
		Offset: 0x4A8
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
		Checksum: 0xC0B27C64
		Offset: 0x3B0
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
		Checksum: 0xEA2A0881
		Offset: 0x4E0
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
		Checksum: 0x56F21B89
		Offset: 0x410
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
	Name: function_375f2ad3
	Namespace: lui_plane_mortar
	Checksum: 0xFF8BC51E
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_375f2ad3()
{
	level notify(1114156953);
}

/*
	Name: register
	Namespace: lui_plane_mortar
	Checksum: 0x6715972F
	Offset: 0xF0
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
	Checksum: 0x18128A15
	Offset: 0x278
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
	Checksum: 0x6B8F324B
	Offset: 0x2B8
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
	Checksum: 0xB381FE23
	Offset: 0x2E0
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
	Checksum: 0xA3FFB018
	Offset: 0x308
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
	Checksum: 0x99AECBC7
	Offset: 0x330
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
	Checksum: 0xF5662DD0
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectorsavailable(localclientnum, value)
{
	[[ self ]]->set_selectorsavailable(localclientnum, value);
}

