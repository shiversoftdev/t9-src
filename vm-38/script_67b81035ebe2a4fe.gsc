#using scripts\core_common\lui_shared.csc;

class cmp_prop_timer : cluielem
{

	/*
		Name: constructor
		Namespace: cmp_prop_timer
		Checksum: 0x3716BC0
		Offset: 0x388
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
		Checksum: 0xFEE4FBA4
		Offset: 0x560
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
		Checksum: 0x6A366237
		Offset: 0x4C0
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
		Checksum: 0xA6495219
		Offset: 0x528
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
		Checksum: 0xC6DA8D11
		Offset: 0x430
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
		Checksum: 0x9D17B094
		Offset: 0x3A8
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
		Checksum: 0x5412563A
		Offset: 0x4F0
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
		Checksum: 0x7C55E9CF
		Offset: 0x458
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
	Name: function_aadc447a
	Namespace: mp_prop_timer
	Checksum: 0x3729BD09
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_aadc447a()
{
	level notify(-1280171846);
}

/*
	Name: register
	Namespace: mp_prop_timer
	Checksum: 0x3A8175CB
	Offset: 0xE8
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
	Checksum: 0xC23C298F
	Offset: 0x270
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
	Checksum: 0x6B8F324B
	Offset: 0x2B0
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
	Checksum: 0xB381FE23
	Offset: 0x2D8
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
	Checksum: 0xA3FFB018
	Offset: 0x300
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
	Checksum: 0xAE1A5799
	Offset: 0x328
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
	Checksum: 0xD7A938F6
	Offset: 0x358
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isprop(localclientnum, value)
{
	[[ self ]]->set_isprop(localclientnum, value);
}

