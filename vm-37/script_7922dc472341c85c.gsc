#using scripts\core_common\lui_shared.csc;

class clui_napalm_strike : cluielem
{

	/*
		Name: constructor
		Namespace: clui_napalm_strike
		Checksum: 0x8F484C8F
		Offset: 0x2E0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: clui_napalm_strike
		Checksum: 0xE7533F02
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: clui_napalm_strike
		Checksum: 0x1D617D67
		Offset: 0x380
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
		Namespace: clui_napalm_strike
		Checksum: 0x433FD195
		Offset: 0x328
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("lui_napalm_strike");
	}

	/*
		Name: setup_clientfields
		Namespace: clui_napalm_strike
		Checksum: 0xD12FCC37
		Offset: 0x300
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("lui_napalm_strike");
	}

	/*
		Name: function_fa582112
		Namespace: clui_napalm_strike
		Checksum: 0xB312F0C5
		Offset: 0x350
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
	}

}

#namespace lui_napalm_strike;

/*
	Name: register
	Namespace: lui_napalm_strike
	Checksum: 0x9D84E2DC
	Offset: 0xB0
	Size: 0x16E
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new clui_napalm_strike();
	[[ elem ]]->setup_clientfields();
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"lui_napalm_strike"]))
	{
		level.var_ae746e8f[#"lui_napalm_strike"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"lui_napalm_strike"]))
	{
		level.var_ae746e8f[#"lui_napalm_strike"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"lui_napalm_strike"]))
	{
		level.var_ae746e8f[#"lui_napalm_strike"] = array(level.var_ae746e8f[#"lui_napalm_strike"]);
	}
	level.var_ae746e8f[#"lui_napalm_strike"][level.var_ae746e8f[#"lui_napalm_strike"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: lui_napalm_strike
	Checksum: 0x68F8656D
	Offset: 0x228
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new clui_napalm_strike();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: lui_napalm_strike
	Checksum: 0x99CDFA59
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
	Namespace: lui_napalm_strike
	Checksum: 0x2E72F17D
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
	Namespace: lui_napalm_strike
	Checksum: 0x9D91652E
	Offset: 0x2B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

