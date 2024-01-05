#using scripts\core_common\lui_shared.csc;

class cremote_missile_targets : cluielem
{

	/*
		Name: constructor
		Namespace: cremote_missile_targets
		Checksum: 0xCFEB7292
		Offset: 0x420
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
		Checksum: 0xE390816E
		Offset: 0x700
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
		Checksum: 0x2F5F7F5D
		Offset: 0x5F0
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
		Checksum: 0xA92E0B86
		Offset: 0x620
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
		Checksum: 0xCDCFF202
		Offset: 0x528
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
		Checksum: 0xBE3861D1
		Offset: 0x690
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
		Checksum: 0xB7A83FAB
		Offset: 0x440
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
		Checksum: 0xDE90946F
		Offset: 0x658
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
		Checksum: 0xF4988883
		Offset: 0x6C8
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
		Checksum: 0x963EA72B
		Offset: 0x550
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
	Name: register
	Namespace: remote_missile_targets
	Checksum: 0x258770FE
	Offset: 0x108
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
	Checksum: 0xF7FB098D
	Offset: 0x2A8
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
	Checksum: 0xAE58960E
	Offset: 0x2E8
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
	Checksum: 0xDFE520B6
	Offset: 0x310
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
	Checksum: 0x850E16A8
	Offset: 0x338
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
	Checksum: 0xDC0742BC
	Offset: 0x360
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
	Checksum: 0x33667506
	Offset: 0x390
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
	Checksum: 0x150BA87
	Offset: 0x3C0
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
	Checksum: 0xC4AE300D
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_extra_target_3(localclientnum, value)
{
	[[ self ]]->set_extra_target_3(localclientnum, value);
}

