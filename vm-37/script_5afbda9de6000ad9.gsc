#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cremote_missile_targets : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cremote_missile_targets
		Checksum: 0xF481D593
		Offset: 0x2A0
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
		Checksum: 0x43E0F611
		Offset: 0x540
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
		Checksum: 0xA02F4CCE
		Offset: 0x388
		Size: 0x3C
		Parameters: 2
		Flags: Linked
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_player_target_active
		Namespace: cremote_missile_targets
		Checksum: 0xBAA7E8FD
		Offset: 0x400
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_player_target_active(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "player_target_active", value);
	}

	/*
		Name: close
		Namespace: cremote_missile_targets
		Checksum: 0xFE268E48
		Offset: 0x3D0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_extra_target_2
		Namespace: cremote_missile_targets
		Checksum: 0xFF632FF5
		Offset: 0x4A0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_extra_target_2(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "extra_target_2", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cremote_missile_targets
		Checksum: 0x77A243
		Offset: 0x2C0
		Size: 0xBC
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("remote_missile_targets");
		cluielem::add_clientfield("player_target_active", 1, 16, "int");
		cluielem::add_clientfield("extra_target_1", 1, 10, "int");
		cluielem::add_clientfield("extra_target_2", 1, 10, "int");
		cluielem::add_clientfield("extra_target_3", 1, 10, "int");
	}

	/*
		Name: set_extra_target_1
		Namespace: cremote_missile_targets
		Checksum: 0xDE94A27C
		Offset: 0x450
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_extra_target_1(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "extra_target_1", value);
	}

	/*
		Name: set_extra_target_3
		Namespace: cremote_missile_targets
		Checksum: 0x7F61E00
		Offset: 0x4F0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_extra_target_3(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "extra_target_3", value);
	}

}

#namespace remote_missile_targets;

/*
	Name: register
	Namespace: remote_missile_targets
	Checksum: 0xFBA6E37E
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new cremote_missile_targets();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: remote_missile_targets
	Checksum: 0xA54E9789
	Offset: 0x150
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: remote_missile_targets
	Checksum: 0x86736221
	Offset: 0x190
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: remote_missile_targets
	Checksum: 0x7D032A4E
	Offset: 0x1B8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_player_target_active
	Namespace: remote_missile_targets
	Checksum: 0x44D588F7
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_player_target_active(player, value)
{
	[[ self ]]->set_player_target_active(player, value);
}

/*
	Name: set_extra_target_1
	Namespace: remote_missile_targets
	Checksum: 0x4C48355F
	Offset: 0x210
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_extra_target_1(player, value)
{
	[[ self ]]->set_extra_target_1(player, value);
}

/*
	Name: set_extra_target_2
	Namespace: remote_missile_targets
	Checksum: 0xCAE9CFCD
	Offset: 0x240
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_extra_target_2(player, value)
{
	[[ self ]]->set_extra_target_2(player, value);
}

/*
	Name: set_extra_target_3
	Namespace: remote_missile_targets
	Checksum: 0x69272AD2
	Offset: 0x270
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_extra_target_3(player, value)
{
	[[ self ]]->set_extra_target_3(player, value);
}

