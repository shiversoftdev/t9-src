#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cmp_prop_timer : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cmp_prop_timer
		Checksum: 0x1FFDEF9E
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
		Namespace: cmp_prop_timer
		Checksum: 0x3C76D3DF
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
		Namespace: cmp_prop_timer
		Checksum: 0xC3BA9771
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
		Name: set_isprop
		Namespace: cmp_prop_timer
		Checksum: 0x384D6B8
		Offset: 0x380
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
		Checksum: 0x3F6BA199
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
		Namespace: cmp_prop_timer
		Checksum: 0xD562F828
		Offset: 0x240
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
		Checksum: 0xE47B2640
		Offset: 0x330
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
	Name: function_7cc2e877
	Namespace: mp_prop_timer
	Checksum: 0xEFE0C803
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7cc2e877()
{
	level notify(-509219477);
}

/*
	Name: register
	Namespace: mp_prop_timer
	Checksum: 0xA29BD987
	Offset: 0xF0
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
	Checksum: 0x584B4B43
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
	Namespace: mp_prop_timer
	Checksum: 0x5189623B
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
	Namespace: mp_prop_timer
	Checksum: 0xC3D6EA8D
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
	Name: set_timeremaining
	Namespace: mp_prop_timer
	Checksum: 0x9B913B37
	Offset: 0x1C0
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
	Checksum: 0x6524F8B4
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_isprop(player, value)
{
	[[ self ]]->set_isprop(player, value);
}

