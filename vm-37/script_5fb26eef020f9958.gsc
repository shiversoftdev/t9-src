#using scripts\core_common\lui_shared.gsc;

class class_8ebbf51b : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_8ebbf51b
		Checksum: 0x3BE011A6
		Offset: 0x178
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_8ebbf51b
		Checksum: 0xF3AA983C
		Offset: 0x238
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_8ebbf51b
		Checksum: 0x52F96EB8
		Offset: 0x1C0
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_8ebbf51b
		Checksum: 0xDC0C81B0
		Offset: 0x208
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_8ebbf51b
		Checksum: 0xEB2B9958
		Offset: 0x198
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("sr_armor_menu");
	}

}

#namespace sr_armor_menu;

/*
	Name: register
	Namespace: sr_armor_menu
	Checksum: 0xF5A03E39
	Offset: 0xA8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new class_8ebbf51b();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: sr_armor_menu
	Checksum: 0x555E5116
	Offset: 0xE8
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
	Namespace: sr_armor_menu
	Checksum: 0x2780A85B
	Offset: 0x128
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
	Namespace: sr_armor_menu
	Checksum: 0x5FE370E6
	Offset: 0x150
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

