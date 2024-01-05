#using scripts\core_common\lui_shared.csc;

class cdeath_zone : cluielem
{

	/*
		Name: constructor
		Namespace: cdeath_zone
		Checksum: 0x5E50A76D
		Offset: 0x348
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cdeath_zone
		Checksum: 0x339DE60F
		Offset: 0x498
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cdeath_zone
		Checksum: 0x417F4CCE
		Offset: 0x430
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_shutdown_sec
		Namespace: cdeath_zone
		Checksum: 0x4BCA4DDA
		Offset: 0x460
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_shutdown_sec(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "shutdown_sec", value);
	}

	/*
		Name: register_clientside
		Namespace: cdeath_zone
		Checksum: 0x148641E6
		Offset: 0x3C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("death_zone");
	}

	/*
		Name: setup_clientfields
		Namespace: cdeath_zone
		Checksum: 0xEAB0BE04
		Offset: 0x368
		Size: 0x4C
		Parameters: 1
		Flags: None
	*/
	function setup_clientfields(var_fd61f748)
	{
		cluielem::setup_clientfields("death_zone");
		cluielem::add_clientfield("shutdown_sec", 1, 9, "int", var_fd61f748);
	}

	/*
		Name: function_fa582112
		Namespace: cdeath_zone
		Checksum: 0xBB5E9DC8
		Offset: 0x3E8
		Size: 0x40
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "shutdown_sec", 0);
	}

}

#namespace death_zone;

/*
	Name: function_6a99f7f6
	Namespace: death_zone
	Checksum: 0x711C6B67
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6a99f7f6()
{
	level notify(1264457861);
}

/*
	Name: register
	Namespace: death_zone
	Checksum: 0x7B146D5E
	Offset: 0xE0
	Size: 0x176
	Parameters: 1
	Flags: None
*/
function register(var_fd61f748)
{
	elem = new cdeath_zone();
	[[ elem ]]->setup_clientfields(var_fd61f748);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"death_zone"]))
	{
		level.var_ae746e8f[#"death_zone"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"death_zone"]))
	{
		level.var_ae746e8f[#"death_zone"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"death_zone"]))
	{
		level.var_ae746e8f[#"death_zone"] = array(level.var_ae746e8f[#"death_zone"]);
	}
	level.var_ae746e8f[#"death_zone"][level.var_ae746e8f[#"death_zone"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: death_zone
	Checksum: 0xB9D6C895
	Offset: 0x260
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cdeath_zone();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: death_zone
	Checksum: 0x4DA297E1
	Offset: 0x2A0
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
	Namespace: death_zone
	Checksum: 0xC510C8A8
	Offset: 0x2C8
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
	Namespace: death_zone
	Checksum: 0xE65CAC88
	Offset: 0x2F0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_shutdown_sec
	Namespace: death_zone
	Checksum: 0x9494490A
	Offset: 0x318
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_shutdown_sec(localclientnum, value)
{
	[[ self ]]->set_shutdown_sec(localclientnum, value);
}

