#using scripts\core_common\lui_shared.gsc;

class class_b5586f52 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_b5586f52
		Checksum: 0xFB3B6A6B
		Offset: 0x1A0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_b5586f52
		Checksum: 0x41E0C06D
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_b5586f52
		Checksum: 0xAE0F72A2
		Offset: 0x1E8
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
		Name: close
		Namespace: namespace_b5586f52
		Checksum: 0xB3CE6D90
		Offset: 0x230
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_b5586f52
		Checksum: 0x7681AA50
		Offset: 0x1C0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("sr_objective_timer");
	}

}

#namespace sr_objective_timer;

/*
	Name: function_37032f84
	Namespace: sr_objective_timer
	Checksum: 0xDFFB4C04
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_37032f84()
{
	level notify(1154143656);
}

/*
	Name: register
	Namespace: sr_objective_timer
	Checksum: 0xD9CBB74C
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_b5586f52();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_objective_timer
	Checksum: 0xAA4B8EB3
	Offset: 0x110
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
	Namespace: sr_objective_timer
	Checksum: 0xF8A9CA82
	Offset: 0x150
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
	Namespace: sr_objective_timer
	Checksum: 0xA2C3BD60
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

