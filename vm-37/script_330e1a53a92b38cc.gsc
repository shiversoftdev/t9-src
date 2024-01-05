#using scripts\core_common\lui_shared.csc;

class cmp_revive_prompt : cluielem
{

	/*
		Name: constructor
		Namespace: cmp_revive_prompt
		Checksum: 0x8EFE1033
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmp_revive_prompt
		Checksum: 0x933C4692
		Offset: 0x640
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmp_revive_prompt
		Checksum: 0xADB675A4
		Offset: 0x568
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_clientnum
		Namespace: cmp_revive_prompt
		Checksum: 0xF1004827
		Offset: 0x598
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clientnum", value);
	}

	/*
		Name: set_reviveprogress
		Namespace: cmp_revive_prompt
		Checksum: 0x64471FB7
		Offset: 0x608
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_reviveprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "reviveProgress", value);
	}

	/*
		Name: register_clientside
		Namespace: cmp_revive_prompt
		Checksum: 0xA817B33F
		Offset: 0x4B0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("mp_revive_prompt");
	}

	/*
		Name: setup_clientfields
		Namespace: cmp_revive_prompt
		Checksum: 0x8CD096D1
		Offset: 0x3F0
		Size: 0xB4
		Parameters: 4
		Flags: None
	*/
	function setup_clientfields(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa)
	{
		cluielem::setup_clientfields("mp_revive_prompt");
		cluielem::add_clientfield("clientnum", 1, 7, "int", var_afaddf7a);
		cluielem::add_clientfield("progress", 1, 5, "float", var_d65e5a18);
		cluielem::add_clientfield("reviveProgress", 1, 5, "float", var_f228b5fa);
	}

	/*
		Name: set_progress
		Namespace: cmp_revive_prompt
		Checksum: 0x3BDF5CA0
		Offset: 0x5D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progress", value);
	}

	/*
		Name: function_fa582112
		Namespace: cmp_revive_prompt
		Checksum: 0x2A3C9D49
		Offset: 0x4D8
		Size: 0x88
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "clientnum", 0);
		[[ self ]]->set_data(localclientnum, "progress", 0);
		[[ self ]]->set_data(localclientnum, "reviveProgress", 0);
	}

}

#namespace mp_revive_prompt;

/*
	Name: register
	Namespace: mp_revive_prompt
	Checksum: 0x393FD10A
	Offset: 0xE8
	Size: 0x196
	Parameters: 4
	Flags: None
*/
function register(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa)
{
	elem = new cmp_revive_prompt();
	[[ elem ]]->setup_clientfields(var_c05c67e2, var_afaddf7a, var_d65e5a18, var_f228b5fa);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"mp_revive_prompt"]))
	{
		level.var_ae746e8f[#"mp_revive_prompt"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"mp_revive_prompt"]))
	{
		level.var_ae746e8f[#"mp_revive_prompt"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"mp_revive_prompt"]))
	{
		level.var_ae746e8f[#"mp_revive_prompt"] = array(level.var_ae746e8f[#"mp_revive_prompt"]);
	}
	level.var_ae746e8f[#"mp_revive_prompt"][level.var_ae746e8f[#"mp_revive_prompt"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: mp_revive_prompt
	Checksum: 0xB97157B
	Offset: 0x288
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cmp_revive_prompt();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: mp_revive_prompt
	Checksum: 0xAE58960E
	Offset: 0x2C8
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
	Namespace: mp_revive_prompt
	Checksum: 0xDFE520B6
	Offset: 0x2F0
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
	Namespace: mp_revive_prompt
	Checksum: 0x850E16A8
	Offset: 0x318
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_clientnum
	Namespace: mp_revive_prompt
	Checksum: 0xB9DE916D
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_progress
	Namespace: mp_revive_prompt
	Checksum: 0x15C4734F
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress(localclientnum, value)
{
	[[ self ]]->set_progress(localclientnum, value);
}

/*
	Name: set_reviveprogress
	Namespace: mp_revive_prompt
	Checksum: 0xCC59677C
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_reviveprogress(localclientnum, value)
{
	[[ self ]]->set_reviveprogress(localclientnum, value);
}

