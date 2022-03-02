#using scripts\core_common\lui_shared.csc;

class class_37d61ee3 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_37d61ee3
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
		Namespace: namespace_37d61ee3
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
		Namespace: namespace_37d61ee3
		Checksum: 0xD93A7117
		Offset: 0x478
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
		Checksum: 0xE58C6A23
		Offset: 0x3E8
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
		Checksum: 0x23BDD50D
		Offset: 0x4A8
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
		Checksum: 0xC0B27C64
		Offset: 0x3B0
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
		Checksum: 0xEA2A0881
		Offset: 0x4E0
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
		Checksum: 0x56F21B89
		Offset: 0x410
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
	Checksum: 0x18128A15
	Offset: 0x278
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
	Name: function_6c69ff4b
	Namespace: lui_plane_mortar
	Checksum: 0x99AECBC7
	Offset: 0x330
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
	Checksum: 0xF5662DD0
	Offset: 0x360
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b172c58e(localclientnum, value)
{
	[[ self ]]->function_b172c58e(localclientnum, value);
}

