#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_4868ccea : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_4868ccea
		Checksum: 0xF8E3FA79
		Offset: 0x260
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_4868ccea
		Checksum: 0x7330CC82
		Offset: 0x488
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_4868ccea
		Checksum: 0xC2BC2A01
		Offset: 0x320
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
		Name: function_1ae2ab1b
		Namespace: namespace_4868ccea
		Checksum: 0x6B9183D8
		Offset: 0x398
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_1ae2ab1b(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "wavesText", value);
	}

	/*
		Name: function_32a88912
		Namespace: namespace_4868ccea
		Checksum: 0x4CA5B2D
		Offset: 0x438
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_32a88912(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "zkillsText", value);
	}

	/*
		Name: close
		Namespace: namespace_4868ccea
		Checksum: 0x8A504A41
		Offset: 0x368
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: function_5ef55261
		Namespace: namespace_4868ccea
		Checksum: 0xA1AB5FAA
		Offset: 0x3E8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_5ef55261(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "eliteKillsText", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_4868ccea
		Checksum: 0x1177D1BE
		Offset: 0x280
		Size: 0x94
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_gamemode_onslaught_endscore_msg");
		cluielem::function_dcb34c80("string", "wavesText", 1);
		cluielem::function_dcb34c80("string", "eliteKillsText", 1);
		cluielem::function_dcb34c80("string", "zkillsText", 1);
	}

}

#namespace mp_gamemode_onslaught_endscore_msg;

/*
	Name: register
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0xEB5A5488
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_4868ccea();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x9E0FBA10
	Offset: 0x140
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
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x43870681
	Offset: 0x180
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
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0xB2A10D20
	Offset: 0x1A8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_1ae2ab1b
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0xEDE93B30
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1ae2ab1b(player, value)
{
	[[ self ]]->function_1ae2ab1b(player, value);
}

/*
	Name: function_5ef55261
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0xAACDA46E
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5ef55261(player, value)
{
	[[ self ]]->function_5ef55261(player, value);
}

/*
	Name: function_32a88912
	Namespace: mp_gamemode_onslaught_endscore_msg
	Checksum: 0x4A57ECB8
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_32a88912(player, value)
{
	[[ self ]]->function_32a88912(player, value);
}

