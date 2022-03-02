#using scripts\core_common\lui_shared.csc;

class class_bc79c0e8 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_bc79c0e8
		Checksum: 0xF58476EA
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_bc79c0e8
		Checksum: 0x9604EE4A
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_bc79c0e8
		Checksum: 0xE9672F07
		Offset: 0x3A0
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
		Namespace: namespace_bc79c0e8
		Checksum: 0x343720C7
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("prototype_self_revive");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_bc79c0e8
		Checksum: 0xA460A7EA
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("prototype_self_revive");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_bc79c0e8
		Checksum: 0xBB37DD6E
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
	}

}

#namespace prototype_self_revive;

/*
	Name: function_78008ddb
	Namespace: prototype_self_revive
	Checksum: 0xB415FAE8
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_78008ddb()
{
	level notify(1693686057);
}

/*
	Name: register
	Namespace: prototype_self_revive
	Checksum: 0xAB61B76B
	Offset: 0xD0
	Size: 0x16E
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_bc79c0e8();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"prototype_self_revive"]))
	{
		level.var_ae746e8f[#"prototype_self_revive"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"prototype_self_revive"]))
	{
		level.var_ae746e8f[#"prototype_self_revive"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"prototype_self_revive"]))
	{
		level.var_ae746e8f[#"prototype_self_revive"] = array(level.var_ae746e8f[#"prototype_self_revive"]);
	}
	level.var_ae746e8f[#"prototype_self_revive"][level.var_ae746e8f[#"prototype_self_revive"].size] = elem;
}

/*
	Name: function_5c1bb138
	Namespace: prototype_self_revive
	Checksum: 0xF32A2E57
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_bc79c0e8();
	[[ elem ]]->function_5c1bb138();
	return elem;
}

/*
	Name: open
	Namespace: prototype_self_revive
	Checksum: 0xB035C16B
	Offset: 0x288
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
	Namespace: prototype_self_revive
	Checksum: 0x8A5D773E
	Offset: 0x2B0
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
	Namespace: prototype_self_revive
	Checksum: 0xEAA27B4E
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

