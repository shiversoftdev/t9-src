#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_game_timer : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_game_timer
		Checksum: 0x250A77E9
		Offset: 0x258
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_game_timer
		Checksum: 0xB85DD4ED
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
		Namespace: czm_game_timer
		Checksum: 0x820B6CDE
		Offset: 0x318
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
		Name: set_minutes
		Namespace: czm_game_timer
		Checksum: 0xD177F5AA
		Offset: 0x3E0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_minutes(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "minutes", value);
	}

	/*
		Name: close
		Namespace: czm_game_timer
		Checksum: 0xF144FF53
		Offset: 0x360
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_showzero
		Namespace: czm_game_timer
		Checksum: 0x2E858FBF
		Offset: 0x430
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_showzero(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showzero", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_game_timer
		Checksum: 0x954214A3
		Offset: 0x278
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_game_timer");
		cluielem::add_clientfield("seconds", 1, 6, "int");
		cluielem::add_clientfield("minutes", 1, 9, "int");
		cluielem::add_clientfield("showzero", 1, 1, "int");
	}

	/*
		Name: set_seconds
		Namespace: czm_game_timer
		Checksum: 0x8867289A
		Offset: 0x390
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_seconds(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "seconds", value);
	}

}

#namespace zm_game_timer;

/*
	Name: function_2a68d84d
	Namespace: zm_game_timer
	Checksum: 0x3DA77880
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2a68d84d()
{
	level notify(917012407);
}

/*
	Name: register
	Namespace: zm_game_timer
	Checksum: 0xE67BBFC
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new czm_game_timer();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_game_timer
	Checksum: 0x40D59CB0
	Offset: 0x138
	Size: 0x38
	Parameters: 2
	Flags: None
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
	Namespace: zm_game_timer
	Checksum: 0x6221B1B7
	Offset: 0x178
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
	Namespace: zm_game_timer
	Checksum: 0xD7920DB2
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_seconds
	Namespace: zm_game_timer
	Checksum: 0xB9272781
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_seconds(player, value)
{
	[[ self ]]->set_seconds(player, value);
}

/*
	Name: set_minutes
	Namespace: zm_game_timer
	Checksum: 0xD9C0B78C
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_minutes(player, value)
{
	[[ self ]]->set_minutes(player, value);
}

/*
	Name: set_showzero
	Namespace: zm_game_timer
	Checksum: 0x7C666FC5
	Offset: 0x228
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showzero(player, value)
{
	[[ self ]]->set_showzero(player, value);
}

