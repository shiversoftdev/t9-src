#using scripts\core_common\lui_shared.gsc;

class class_e9d01e1c : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_e9d01e1c
		Checksum: 0xAFEE8F66
		Offset: 0x180
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_e9d01e1c
		Checksum: 0x40932EAC
		Offset: 0x240
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_e9d01e1c
		Checksum: 0xAB8EF3FC
		Offset: 0x1C8
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
		Namespace: namespace_e9d01e1c
		Checksum: 0xAA33E4C8
		Offset: 0x210
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
		Namespace: namespace_e9d01e1c
		Checksum: 0x4034D6BE
		Offset: 0x1A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("debug_center_screen");
	}

}

#namespace debug_center_screen;

/*
	Name: register
	Namespace: debug_center_screen
	Checksum: 0x133705DE
	Offset: 0xB0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_e9d01e1c();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: debug_center_screen
	Checksum: 0xA54E9789
	Offset: 0xF0
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
	Namespace: debug_center_screen
	Checksum: 0x86736221
	Offset: 0x130
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
	Namespace: debug_center_screen
	Checksum: 0x7D032A4E
	Offset: 0x158
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

