#using scripts\core_common\lui_shared.csc;

class cmp_prop_controls : cluielem
{

	/*
		Name: constructor
		Namespace: cmp_prop_controls
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
		Namespace: cmp_prop_controls
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
		Namespace: cmp_prop_controls
		Checksum: 0x9CDBE9B5
		Offset: 0x380
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
		Checksum: 0x61E5533F
		Offset: 0x328
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
		Checksum: 0x1B0F3375
		Offset: 0x300
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
		Checksum: 0xEE1E16D5
		Offset: 0x350
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
	Checksum: 0x10E90773
	Offset: 0x228
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

