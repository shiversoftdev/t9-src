#using scripts\core_common\lui_shared.gsc;

class class_b5586f52 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_b5586f52
		Checksum: 0x4F5EDDEA
		Offset: 0x180
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
		Checksum: 0xF3AA983C
		Offset: 0x240
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
		Checksum: 0xB84F09F6
		Offset: 0x1C8
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
		Checksum: 0x8C1FE4A5
		Offset: 0x210
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
		Checksum: 0x846EBFB3
		Offset: 0x1A0
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
	Name: register
	Namespace: sr_objective_timer
	Checksum: 0xE9DEE3C1
	Offset: 0xB0
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
	Checksum: 0xAAD9FD56
	Offset: 0xF0
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
	Checksum: 0xD115B182
	Offset: 0x130
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
	Checksum: 0x853CA0D4
	Offset: 0x158
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

