#using scripts\core_common\lui_shared.gsc;

class class_6dd74b12 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_6dd74b12
		Checksum: 0x928FF90A
		Offset: 0x178
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_6dd74b12
		Checksum: 0x1463279F
		Offset: 0x238
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_6dd74b12
		Checksum: 0x2CCA2BF4
		Offset: 0x1C0
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_6dd74b12
		Checksum: 0x4FDBFC39
		Offset: 0x208
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_6dd74b12
		Checksum: 0x18BACB35
		Offset: 0x198
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("success_screen");
	}

}

#namespace success_screen;

/*
	Name: register
	Namespace: success_screen
	Checksum: 0x34DED10C
	Offset: 0xA8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_6dd74b12();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: success_screen
	Checksum: 0x34E39DA0
	Offset: 0xE8
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
	Namespace: success_screen
	Checksum: 0x74CB4E3A
	Offset: 0x128
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
	Namespace: success_screen
	Checksum: 0xA9AD379B
	Offset: 0x150
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

