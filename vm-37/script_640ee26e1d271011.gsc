#using scripts\core_common\lui_shared.csc;

class class_73eecff9 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_73eecff9
		Checksum: 0x922002F9
		Offset: 0x2E0
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
		Checksum: 0xF4C8AB2A
		Offset: 0x3B0
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
		Checksum: 0x9CDBE9B5
		Offset: 0x380
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
		Checksum: 0x61E5533F
		Offset: 0x328
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
		Checksum: 0x1B0F3375
		Offset: 0x300
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
		Checksum: 0xEE1E16D5
		Offset: 0x350
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
	Name: register
	Namespace: mp_prop_controls
	Checksum: 0x280EB9BE
	Offset: 0xB0
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
	Checksum: 0x10E90773
	Offset: 0x228
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
	Checksum: 0x660C4A9F
	Offset: 0x268
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
	Checksum: 0x8B26CB5F
	Offset: 0x290
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
	Checksum: 0xA0D84D77
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

