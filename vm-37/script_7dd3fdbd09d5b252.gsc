#using scripts\core_common\lui_shared.csc;

class cdeath_zone : cluielem
{

	/*
		Name: constructor
		Namespace: cdeath_zone
		Checksum: 0xC1C69FCE
		Offset: 0x328
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
		Checksum: 0x297A5532
		Offset: 0x478
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
		Checksum: 0xF7BE7806
		Offset: 0x410
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
		Checksum: 0xE52AD075
		Offset: 0x440
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
		Checksum: 0x7AEED724
		Offset: 0x3A0
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
		Checksum: 0x44519E2A
		Offset: 0x348
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
		Checksum: 0x6EC16D14
		Offset: 0x3C8
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
	Name: register
	Namespace: death_zone
	Checksum: 0xD0DFCF7
	Offset: 0xC0
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
	Checksum: 0xAA6E8A67
	Offset: 0x240
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
	Checksum: 0xC359A14B
	Offset: 0x280
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
	Checksum: 0x7498D461
	Offset: 0x2A8
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
	Checksum: 0x2E4503AC
	Offset: 0x2D0
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
	Checksum: 0xABD6A230
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_shutdown_sec(localclientnum, value)
{
	[[ self ]]->set_shutdown_sec(localclientnum, value);
}

