#using scripts\core_common\lui_shared.csc;

class czm_laststand_client : cluielem
{

	/*
		Name: constructor
		Namespace: czm_laststand_client
		Checksum: 0x179B1BF4
		Offset: 0x3F8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_laststand_client
		Checksum: 0xA858F513
		Offset: 0x660
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_laststand_client
		Checksum: 0xF1DEB3EB
		Offset: 0x588
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
		Namespace: czm_laststand_client
		Checksum: 0x3FC5E3BB
		Offset: 0x4D0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_laststand_client");
	}

	/*
		Name: set_num_downs
		Namespace: czm_laststand_client
		Checksum: 0xFE2D9A2F
		Offset: 0x628
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_num_downs(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "num_downs", value);
	}

	/*
		Name: set_bleedout_progress
		Namespace: czm_laststand_client
		Checksum: 0x3567927F
		Offset: 0x5B8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_bleedout_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_laststand_client
		Checksum: 0x8EBEADF4
		Offset: 0x418
		Size: 0xAC
		Parameters: 3
		Flags: Linked
	*/
	function setup_clientfields(var_a9a4e140, var_e97e7153, var_5db69c99)
	{
		cluielem::setup_clientfields("zm_laststand_client");
		cluielem::add_clientfield("bleedout_progress", 1, 8, "float", var_a9a4e140);
		cluielem::add_clientfield("revive_progress", 1, 8, "float", var_e97e7153);
		cluielem::add_clientfield("num_downs", 1, 8, "int", var_5db69c99);
	}

	/*
		Name: set_revive_progress
		Namespace: czm_laststand_client
		Checksum: 0x3CE0F577
		Offset: 0x5F0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_revive_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "revive_progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: czm_laststand_client
		Checksum: 0x48ABD658
		Offset: 0x4F8
		Size: 0x88
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "bleedout_progress", 0);
		[[ self ]]->set_data(localclientnum, "revive_progress", 0);
		[[ self ]]->set_data(localclientnum, "num_downs", 0);
	}

}

#namespace zm_laststand_client;

/*
	Name: function_6960a41
	Namespace: zm_laststand_client
	Checksum: 0x329D0CC7
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6960a41()
{
	level notify(97566387);
}

/*
	Name: register
	Namespace: zm_laststand_client
	Checksum: 0x7BE090A3
	Offset: 0x118
	Size: 0x18E
	Parameters: 3
	Flags: Linked
*/
function register(var_a9a4e140, var_e97e7153, var_5db69c99)
{
	elem = new czm_laststand_client();
	[[ elem ]]->setup_clientfields(var_a9a4e140, var_e97e7153, var_5db69c99);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_laststand_client"]))
	{
		level.var_ae746e8f[#"zm_laststand_client"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_laststand_client"]))
	{
		level.var_ae746e8f[#"zm_laststand_client"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_laststand_client"]))
	{
		level.var_ae746e8f[#"zm_laststand_client"] = array(level.var_ae746e8f[#"zm_laststand_client"]);
	}
	level.var_ae746e8f[#"zm_laststand_client"][level.var_ae746e8f[#"zm_laststand_client"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_laststand_client
	Checksum: 0x10AF8A1C
	Offset: 0x2B0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new czm_laststand_client();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_laststand_client
	Checksum: 0x89763234
	Offset: 0x2F0
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
	Namespace: zm_laststand_client
	Checksum: 0x2BF653CF
	Offset: 0x318
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
	Namespace: zm_laststand_client
	Checksum: 0x9D779576
	Offset: 0x340
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_bleedout_progress
	Namespace: zm_laststand_client
	Checksum: 0xEA988A67
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bleedout_progress(localclientnum, value)
{
	[[ self ]]->set_bleedout_progress(localclientnum, value);
}

/*
	Name: set_revive_progress
	Namespace: zm_laststand_client
	Checksum: 0x68C99A48
	Offset: 0x398
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_revive_progress(localclientnum, value)
{
	[[ self ]]->set_revive_progress(localclientnum, value);
}

/*
	Name: set_num_downs
	Namespace: zm_laststand_client
	Checksum: 0x5B84B300
	Offset: 0x3C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_num_downs(localclientnum, value)
{
	[[ self ]]->set_num_downs(localclientnum, value);
}

