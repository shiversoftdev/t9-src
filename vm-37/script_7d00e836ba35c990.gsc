#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_c24030b9 : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_c24030b9
		Checksum: 0x426C10E3
		Offset: 0x220
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_c24030b9
		Checksum: 0x32840E42
		Offset: 0x3D0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_c24030b9
		Checksum: 0x302277AC
		Offset: 0x2B8
		Size: 0x3C
		Parameters: 2
		Flags: None
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
		Name: set_objpoints
		Namespace: namespace_c24030b9
		Checksum: 0x39CCA7FE
		Offset: 0x380
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_objpoints(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objpoints", value);
	}

	/*
		Name: close
		Namespace: namespace_c24030b9
		Checksum: 0xF9563021
		Offset: 0x300
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_c24030b9
		Checksum: 0x952BA552
		Offset: 0x240
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_gamemode_onslaught_msg");
		cluielem::function_dcb34c80("string", "objectiveText", 1);
		cluielem::add_clientfield("objpoints", 1, 11, "int");
	}

	/*
		Name: set_objectivetext
		Namespace: namespace_c24030b9
		Checksum: 0x8A2499E0
		Offset: 0x330
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_objectivetext(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "objectiveText", value);
	}

}

#namespace mp_gamemode_onslaught_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xF5537B2B
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_c24030b9();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xB2724536
	Offset: 0x130
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
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xA6D7C1EF
	Offset: 0x170
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
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0x3D187C10
	Offset: 0x198
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_objectivetext
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0xF38C0467
	Offset: 0x1C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objectivetext(player, value)
{
	[[ self ]]->set_objectivetext(player, value);
}

/*
	Name: set_objpoints
	Namespace: mp_gamemode_onslaught_msg
	Checksum: 0x2D87BFEC
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_objpoints(player, value)
{
	[[ self ]]->set_objpoints(player, value);
}

