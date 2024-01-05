#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cmp_prop_timer : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cmp_prop_timer
		Checksum: 0x85AC975A
		Offset: 0x200
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmp_prop_timer
		Checksum: 0x7E0A9D05
		Offset: 0x3B0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmp_prop_timer
		Checksum: 0x71B2854A
		Offset: 0x298
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
		Name: set_isprop
		Namespace: cmp_prop_timer
		Checksum: 0xA9CF08F8
		Offset: 0x360
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_isprop(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "isProp", value);
	}

	/*
		Name: close
		Namespace: cmp_prop_timer
		Checksum: 0xDFE69737
		Offset: 0x2E0
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
		Namespace: cmp_prop_timer
		Checksum: 0x8CB9EE62
		Offset: 0x220
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_prop_timer");
		cluielem::add_clientfield("timeRemaining", 1, 5, "int", 0);
		cluielem::add_clientfield("isProp", 1, 1, "int");
	}

	/*
		Name: set_timeremaining
		Namespace: cmp_prop_timer
		Checksum: 0xFA2C9DCD
		Offset: 0x310
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_timeremaining(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "timeRemaining", value);
	}

}

#namespace mp_prop_timer;

/*
	Name: register
	Namespace: mp_prop_timer
	Checksum: 0x38EF9D76
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cmp_prop_timer();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_prop_timer
	Checksum: 0x66AF6895
	Offset: 0x110
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
	Namespace: mp_prop_timer
	Checksum: 0xCF4D1283
	Offset: 0x150
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
	Namespace: mp_prop_timer
	Checksum: 0xD7BC2ED4
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_timeremaining
	Namespace: mp_prop_timer
	Checksum: 0x29DB65DA
	Offset: 0x1A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_timeremaining(player, value)
{
	[[ self ]]->set_timeremaining(player, value);
}

/*
	Name: set_isprop
	Namespace: mp_prop_timer
	Checksum: 0x6D13EB1D
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isprop(player, value)
{
	[[ self ]]->set_isprop(player, value);
}

