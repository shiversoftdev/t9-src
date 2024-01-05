#using scripts\core_common\lui_shared.csc;

class cremote_missile_targets : cluielem
{

	/*
		Name: constructor
		Namespace: cremote_missile_targets
		Checksum: 0x742D7204
		Offset: 0x440
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cremote_missile_targets
		Checksum: 0xDAB67A13
		Offset: 0x720
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cremote_missile_targets
		Checksum: 0x1960C79
		Offset: 0x610
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_player_target_active
		Namespace: cremote_missile_targets
		Checksum: 0x9687247D
		Offset: 0x640
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_player_target_active(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "player_target_active", value);
	}

	/*
		Name: register_clientside
		Namespace: cremote_missile_targets
		Checksum: 0x6FDE43E
		Offset: 0x548
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("remote_missile_targets");
	}

	/*
		Name: set_extra_target_2
		Namespace: cremote_missile_targets
		Checksum: 0x7516D72A
		Offset: 0x6B0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_extra_target_2(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "extra_target_2", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cremote_missile_targets
		Checksum: 0x4EC9301D
		Offset: 0x460
		Size: 0xDC
		Parameters: 4
		Flags: Linked
	*/
	function setup_clientfields(var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083)
	{
		cluielem::setup_clientfields("remote_missile_targets");
		cluielem::add_clientfield("player_target_active", 1, 16, "int", var_9318c80d);
		cluielem::add_clientfield("extra_target_1", 1, 10, "int", var_82a5247c);
		cluielem::add_clientfield("extra_target_2", 1, 10, "int", var_afbc846a);
		cluielem::add_clientfield("extra_target_3", 1, 10, "int", var_4c87c083);
	}

	/*
		Name: set_extra_target_1
		Namespace: cremote_missile_targets
		Checksum: 0xE2A4EFE6
		Offset: 0x678
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_extra_target_1(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "extra_target_1", value);
	}

	/*
		Name: set_extra_target_3
		Namespace: cremote_missile_targets
		Checksum: 0xCCE590D0
		Offset: 0x6E8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_extra_target_3(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "extra_target_3", value);
	}

	/*
		Name: function_fa582112
		Namespace: cremote_missile_targets
		Checksum: 0xC995359D
		Offset: 0x570
		Size: 0x94
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "player_target_active", 0);
		[[ self ]]->set_data(localclientnum, "extra_target_1", 0);
		[[ self ]]->set_data(localclientnum, "extra_target_2", 0);
		[[ self ]]->set_data(localclientnum, "extra_target_3", 0);
	}

}

#namespace remote_missile_targets;

/*
	Name: function_261d5245
	Namespace: remote_missile_targets
	Checksum: 0x783CD869
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_261d5245()
{
	level notify(2118167551);
}

/*
	Name: register
	Namespace: remote_missile_targets
	Checksum: 0x417452D7
	Offset: 0x128
	Size: 0x196
	Parameters: 4
	Flags: Linked
*/
function register(var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083)
{
	elem = new cremote_missile_targets();
	[[ elem ]]->setup_clientfields(var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"remote_missile_targets"]))
	{
		level.var_ae746e8f[#"remote_missile_targets"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"remote_missile_targets"]))
	{
		level.var_ae746e8f[#"remote_missile_targets"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"remote_missile_targets"]))
	{
		level.var_ae746e8f[#"remote_missile_targets"] = array(level.var_ae746e8f[#"remote_missile_targets"]);
	}
	level.var_ae746e8f[#"remote_missile_targets"][level.var_ae746e8f[#"remote_missile_targets"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: remote_missile_targets
	Checksum: 0x3E1E1DF9
	Offset: 0x2C8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cremote_missile_targets();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_targets
	Checksum: 0x2E334AF
	Offset: 0x308
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
	Namespace: remote_missile_targets
	Checksum: 0x571D34BF
	Offset: 0x330
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
	Namespace: remote_missile_targets
	Checksum: 0xD4D680BC
	Offset: 0x358
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_player_target_active
	Namespace: remote_missile_targets
	Checksum: 0xE1EF70A3
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_player_target_active(localclientnum, value)
{
	[[ self ]]->set_player_target_active(localclientnum, value);
}

/*
	Name: set_extra_target_1
	Namespace: remote_missile_targets
	Checksum: 0x6E2067C6
	Offset: 0x3B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_extra_target_1(localclientnum, value)
{
	[[ self ]]->set_extra_target_1(localclientnum, value);
}

/*
	Name: set_extra_target_2
	Namespace: remote_missile_targets
	Checksum: 0xDFFD0201
	Offset: 0x3E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_extra_target_2(localclientnum, value)
{
	[[ self ]]->set_extra_target_2(localclientnum, value);
}

/*
	Name: set_extra_target_3
	Namespace: remote_missile_targets
	Checksum: 0x8C2A2191
	Offset: 0x410
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_extra_target_3(localclientnum, value)
{
	[[ self ]]->set_extra_target_3(localclientnum, value);
}

