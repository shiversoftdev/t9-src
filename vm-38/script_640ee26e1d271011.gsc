#using scripts\core_common\lui_shared.csc;

class cmp_prop_controls : cluielem
{

	/*
		Name: constructor
		Namespace: cmp_prop_controls
		Checksum: 0xB2A81694
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmp_prop_controls
		Checksum: 0x98F73414
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmp_prop_controls
		Checksum: 0xA5577F7B
		Offset: 0x3A0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: cmp_prop_controls
		Checksum: 0x3FFCC4F1
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("mp_prop_controls");
	}

	/*
		Name: setup_clientfields
		Namespace: cmp_prop_controls
		Checksum: 0xCEA40F97
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_prop_controls");
	}

	/*
		Name: function_fa582112
		Namespace: cmp_prop_controls
		Checksum: 0x48A86AA5
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace mp_prop_controls;

/*
	Name: function_b9c88aca
	Namespace: mp_prop_controls
	Checksum: 0x81A74901
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b9c88aca()
{
	level notify(-795455546);
}

/*
	Name: register
	Namespace: mp_prop_controls
	Checksum: 0x9FA672F1
	Offset: 0xD0
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cmp_prop_controls();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_prop_controls"]))
	{
		level.var_ae746e8f[#"mp_prop_controls"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_prop_controls"]))
	{
		level.var_ae746e8f[#"mp_prop_controls"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_prop_controls"]))
	{
		level.var_ae746e8f[#"mp_prop_controls"] = array(level.var_ae746e8f[#"mp_prop_controls"]);
	}
	level.var_ae746e8f[#"mp_prop_controls"][level.var_ae746e8f[#"mp_prop_controls"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: mp_prop_controls
	Checksum: 0x469AAE33
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cmp_prop_controls();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: mp_prop_controls
	Checksum: 0x307868D4
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
	Namespace: mp_prop_controls
	Checksum: 0xC75BC85B
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
	Namespace: mp_prop_controls
	Checksum: 0x2BCAF13C
	Offset: 0x2D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

