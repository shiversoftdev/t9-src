#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cremote_missile_targets : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cremote_missile_targets
		Checksum: 0x53D202E8
		Offset: 0x2C0
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
		Checksum: 0xA198971C
		Offset: 0x560
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
		Checksum: 0xC30EB4F2
		Offset: 0x3A8
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
		Checksum: 0x2995C3D
		Offset: 0x420
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
		Checksum: 0xDF3034C5
		Offset: 0x3F0
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
		Checksum: 0x47A254B6
		Offset: 0x4C0
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
		Checksum: 0xA55D6883
		Offset: 0x2E0
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
		Checksum: 0x4CE7EA6B
		Offset: 0x470
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
		Checksum: 0xDE6665E7
		Offset: 0x510
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
	Name: function_70d167c
	Namespace: remote_missile_targets
	Checksum: 0xAE8B64AA
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_70d167c()
{
	level notify(-1364903930);
}

/*
	Name: register
	Namespace: remote_missile_targets
	Checksum: 0x826FF7F
	Offset: 0x130
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
	Checksum: 0xF79EBB64
	Offset: 0x170
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
	Checksum: 0x8223FA61
	Offset: 0x1B0
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
	Checksum: 0xC4970C2C
	Offset: 0x1D8
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
	Checksum: 0xA8843C7E
	Offset: 0x200
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
	Checksum: 0xDFA4FE0B
	Offset: 0x230
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
	Checksum: 0xA5A999BB
	Offset: 0x260
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
	Checksum: 0x8A9A4365
	Offset: 0x290
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_extra_target_3(player, value)
{
	[[ self ]]->set_extra_target_3(player, value);
}

