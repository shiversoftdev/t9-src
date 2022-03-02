#using scripts\core_common\lui_shared.gsc;

class class_f2a6c231 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_f2a6c231
		Checksum: 0xAFEE8F66
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
		Namespace: namespace_f2a6c231
		Checksum: 0x40932EAC
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
		Namespace: namespace_f2a6c231
		Checksum: 0xAB8EF3FC
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
		Namespace: namespace_f2a6c231
		Checksum: 0xAA33E4C8
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
		Namespace: namespace_f2a6c231
		Checksum: 0x4034D6BE
		Offset: 0x198
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("fail_screen");
	}

}

#namespace fail_screen;

/*
	Name: register
	Namespace: fail_screen
	Checksum: 0xA6CD5C39
	Offset: 0xA8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_f2a6c231();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: fail_screen
	Checksum: 0xA54E9789
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
	Namespace: fail_screen
	Checksum: 0x86736221
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
	Namespace: fail_screen
	Checksum: 0x7D032A4E
	Offset: 0x150
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

