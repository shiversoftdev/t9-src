#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_5c7b7dcc : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0x16266B8D
		Offset: 0x1D8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_5c7b7dcc
		Checksum: 0x52F08A10
		Offset: 0x310
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_5c7b7dcc
		Checksum: 0x13012479
		Offset: 0x248
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
		Name: close
		Namespace: namespace_5c7b7dcc
		Checksum: 0x7DBF06F7
		Offset: 0x290
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_infectiontimeremaining
		Namespace: namespace_5c7b7dcc
		Checksum: 0x81329FAC
		Offset: 0x2C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_infectiontimeremaining(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "infectionTimeRemaining", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5c7b7dcc
		Checksum: 0x2FA3A2AF
		Offset: 0x1F8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_infect_timer");
		cluielem::add_clientfield("infectionTimeRemaining", 1, 4, "int", 0);
	}

}

#namespace mp_infect_timer;

/*
	Name: register
	Namespace: mp_infect_timer
	Checksum: 0x31AEC7B
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_5c7b7dcc();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_infect_timer
	Checksum: 0xB2724536
	Offset: 0x118
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
	Namespace: mp_infect_timer
	Checksum: 0xA6D7C1EF
	Offset: 0x158
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
	Namespace: mp_infect_timer
	Checksum: 0x3D187C10
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_infectiontimeremaining
	Namespace: mp_infect_timer
	Checksum: 0x1489A615
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_infectiontimeremaining(player, value)
{
	[[ self ]]->set_infectiontimeremaining(player, value);
}

