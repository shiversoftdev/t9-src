#using scripts\core_common\lui_shared.gsc;

class class_bc79c0e8 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_bc79c0e8
		Checksum: 0x3BE011A6
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
		Namespace: namespace_bc79c0e8
		Checksum: 0xF3AA983C
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
		Namespace: namespace_bc79c0e8
		Checksum: 0x52F96EB8
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
		Namespace: namespace_bc79c0e8
		Checksum: 0xDC0C81B0
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
		Namespace: namespace_bc79c0e8
		Checksum: 0xEB2B9958
		Offset: 0x1A0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("prototype_self_revive");
	}

}

#namespace prototype_self_revive;

/*
	Name: register
	Namespace: prototype_self_revive
	Checksum: 0xE7EC24EF
	Offset: 0xB0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_bc79c0e8();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: prototype_self_revive
	Checksum: 0x555E5116
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
	Namespace: prototype_self_revive
	Checksum: 0x2780A85B
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
	Namespace: prototype_self_revive
	Checksum: 0x5FE370E6
	Offset: 0x158
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

