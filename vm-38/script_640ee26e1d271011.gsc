#using scripts\core_common\lui_shared.csc;

class class_73eecff9 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_73eecff9
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
		Namespace: namespace_73eecff9
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
		Namespace: namespace_73eecff9
		Checksum: 0xA5577F7B
		Offset: 0x3A0
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
		Namespace: namespace_73eecff9
		Checksum: 0x3FFCC4F1
		Offset: 0x348
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("mp_prop_controls");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_73eecff9
		Checksum: 0xCEA40F97
		Offset: 0x320
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_prop_controls");
	}

	/*
		Name: function_fa582112
		Namespace: namespace_73eecff9
		Checksum: 0x48A86AA5
		Offset: 0x370
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
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
	level notify(795455546);
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
	elem = new class_73eecff9();
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
	Name: function_5c1bb138
	Namespace: mp_prop_controls
	Checksum: 0x469AAE33
	Offset: 0x248
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_73eecff9();
	[[ elem ]]->function_5c1bb138();
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

