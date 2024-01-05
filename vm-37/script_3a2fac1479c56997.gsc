#using scripts\core_common\lui_shared.csc;

class czm_build_progress : cluielem
{

	/*
		Name: constructor
		Namespace: czm_build_progress
		Checksum: 0x8B23F4C
		Offset: 0x328
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_build_progress
		Checksum: 0x49611D1C
		Offset: 0x480
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_build_progress
		Checksum: 0x3FE91E57
		Offset: 0x418
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
		Namespace: czm_build_progress
		Checksum: 0x300ABFB0
		Offset: 0x3A0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_build_progress");
	}

	/*
		Name: setup_clientfields
		Namespace: czm_build_progress
		Checksum: 0x8D118F9
		Offset: 0x348
		Size: 0x4C
		Parameters: 1
		Flags: Linked
	*/
	function setup_clientfields(var_afaddf7a)
	{
		cluielem::setup_clientfields("zm_build_progress");
		cluielem::add_clientfield("progress", 1, 6, "float", var_afaddf7a);
	}

	/*
		Name: set_progress
		Namespace: czm_build_progress
		Checksum: 0x84384610
		Offset: 0x448
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: czm_build_progress
		Checksum: 0xD859B516
		Offset: 0x3C8
		Size: 0x48
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "progress", 0);
	}

}

#namespace zm_build_progress;

/*
	Name: register
	Namespace: zm_build_progress
	Checksum: 0x265A7B34
	Offset: 0xC0
	Size: 0x176
	Parameters: 1
	Flags: Linked
*/
function register(var_afaddf7a)
{
	elem = new czm_build_progress();
	[[ elem ]]->setup_clientfields(var_afaddf7a);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_build_progress"]))
	{
		level.var_ae746e8f[#"zm_build_progress"] = array(level.var_ae746e8f[#"zm_build_progress"]);
	}
	level.var_ae746e8f[#"zm_build_progress"][level.var_ae746e8f[#"zm_build_progress"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_build_progress
	Checksum: 0x128E3D66
	Offset: 0x240
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new czm_build_progress();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_build_progress
	Checksum: 0xA013B51C
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
	Namespace: zm_build_progress
	Checksum: 0x26818F9B
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
	Namespace: zm_build_progress
	Checksum: 0x4631A662
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
	Name: set_progress
	Namespace: zm_build_progress
	Checksum: 0x37B046F1
	Offset: 0x2F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress(localclientnum, value)
{
	[[ self ]]->set_progress(localclientnum, value);
}

