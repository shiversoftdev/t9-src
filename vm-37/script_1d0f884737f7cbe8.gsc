#using scripts\core_common\lui_shared.gsc;

class class_1762fc34 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_1762fc34
		Checksum: 0x6869F5BA
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
		Namespace: namespace_1762fc34
		Checksum: 0x815E98
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
		Namespace: namespace_1762fc34
		Checksum: 0x6059A159
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_1762fc34
		Checksum: 0x58E3A5F4
		Offset: 0x210
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
		Namespace: namespace_1762fc34
		Checksum: 0xA6417AD8
		Offset: 0x1A0
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("lui_napalm_strike");
	}

}

#namespace lui_napalm_strike;

/*
	Name: register
	Namespace: lui_napalm_strike
	Checksum: 0x65C7A897
	Offset: 0xB0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_1762fc34();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: lui_napalm_strike
	Checksum: 0x9E0FBA10
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
	Namespace: lui_napalm_strike
	Checksum: 0x43870681
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
	Namespace: lui_napalm_strike
	Checksum: 0xB2A10D20
	Offset: 0x158
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

