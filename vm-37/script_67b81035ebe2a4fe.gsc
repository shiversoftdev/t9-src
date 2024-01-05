#using scripts\core_common\lui_shared.csc;

class cmp_prop_timer : cluielem
{

	/*
		Name: constructor
		Namespace: cmp_prop_timer
		Checksum: 0xFAF9CDEF
		Offset: 0x368
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmp_prop_timer
		Checksum: 0xB346BBB4
		Offset: 0x540
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmp_prop_timer
		Checksum: 0xEDBDCF02
		Offset: 0x4A0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_isprop
		Namespace: cmp_prop_timer
		Checksum: 0xECDF2CE3
		Offset: 0x508
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_isprop(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "isProp", value);
	}

	/*
		Name: register_clientside
		Namespace: cmp_prop_timer
		Checksum: 0x79269E3
		Offset: 0x410
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("mp_prop_timer");
	}

	/*
		Name: setup_clientfields
		Namespace: cmp_prop_timer
		Checksum: 0x5BC670A
		Offset: 0x388
		Size: 0x7C
		Parameters: 2
		Flags: None
	*/
	function setup_clientfields(var_43c7e6f7, var_6fb92716)
	{
		cluielem::setup_clientfields("mp_prop_timer");
		cluielem::add_clientfield("timeRemaining", 1, 5, "int", var_43c7e6f7);
		cluielem::add_clientfield("isProp", 1, 1, "int", var_6fb92716);
	}

	/*
		Name: set_timeremaining
		Namespace: cmp_prop_timer
		Checksum: 0xEAE6EB1E
		Offset: 0x4D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_timeremaining(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "timeRemaining", value);
	}

	/*
		Name: function_fa582112
		Namespace: cmp_prop_timer
		Checksum: 0x834657FF
		Offset: 0x438
		Size: 0x5C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "timeRemaining", 0);
		[[ self ]]->set_data(localclientnum, "isProp", 0);
	}

}

#namespace mp_prop_timer;

/*
	Name: register
	Namespace: mp_prop_timer
	Checksum: 0xF8EA0295
	Offset: 0xC8
	Size: 0x17E
	Parameters: 2
	Flags: None
*/
function register(var_43c7e6f7, var_6fb92716)
{
	elem = new cmp_prop_timer();
	[[ elem ]]->setup_clientfields(var_43c7e6f7, var_6fb92716);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_prop_timer"]))
	{
		level.var_ae746e8f[#"mp_prop_timer"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_prop_timer"]))
	{
		level.var_ae746e8f[#"mp_prop_timer"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_prop_timer"]))
	{
		level.var_ae746e8f[#"mp_prop_timer"] = array(level.var_ae746e8f[#"mp_prop_timer"]);
	}
	level.var_ae746e8f[#"mp_prop_timer"][level.var_ae746e8f[#"mp_prop_timer"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: mp_prop_timer
	Checksum: 0x7AB1D7AA
	Offset: 0x250
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cmp_prop_timer();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: mp_prop_timer
	Checksum: 0x1E5B7410
	Offset: 0x290
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
	Namespace: mp_prop_timer
	Checksum: 0x88C9133E
	Offset: 0x2B8
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
	Namespace: mp_prop_timer
	Checksum: 0x67646AD4
	Offset: 0x2E0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_timeremaining
	Namespace: mp_prop_timer
	Checksum: 0x7A82DEA4
	Offset: 0x308
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_timeremaining(localclientnum, value)
{
	[[ self ]]->set_timeremaining(localclientnum, value);
}

/*
	Name: set_isprop
	Namespace: mp_prop_timer
	Checksum: 0xF585EC3C
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isprop(localclientnum, value)
{
	[[ self ]]->set_isprop(localclientnum, value);
}

