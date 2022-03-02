#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_d1ed471a : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_d1ed471a
		Checksum: 0x186FC38E
		Offset: 0x210
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_d1ed471a
		Checksum: 0x14669E76
		Offset: 0x3C0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_d1ed471a
		Checksum: 0x2A408027
		Offset: 0x2A8
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
		Namespace: namespace_d1ed471a
		Checksum: 0x9DC493D2
		Offset: 0x2F0
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
		Namespace: namespace_d1ed471a
		Checksum: 0xCDA0C719
		Offset: 0x230
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_gold_hud");
		namespace_6aaccc24::function_da693cbe("showTerminal", 1000, 1, "int", 0);
		namespace_6aaccc24::function_dcb34c80("string", "satelliteInfo", 1000);
	}

	/*
		Name: function_9dc41635
		Namespace: namespace_d1ed471a
		Checksum: 0xA3DAF73A
		Offset: 0x320
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_9dc41635(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showTerminal", value);
	}

	/*
		Name: function_f308d6bb
		Namespace: namespace_d1ed471a
		Checksum: 0x83CB623D
		Offset: 0x370
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_f308d6bb(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "satelliteInfo", value);
	}

}

#namespace namespace_82d7691b;

/*
	Name: register
	Namespace: namespace_82d7691b
	Checksum: 0x99FBEC9A
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_d1ed471a();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: namespace_82d7691b
	Checksum: 0x555E5116
	Offset: 0x120
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
	Namespace: namespace_82d7691b
	Checksum: 0x2780A85B
	Offset: 0x160
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
	Namespace: namespace_82d7691b
	Checksum: 0x5FE370E6
	Offset: 0x188
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_9dc41635
	Namespace: namespace_82d7691b
	Checksum: 0x3001427
	Offset: 0x1B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9dc41635(player, value)
{
	[[ self ]]->function_9dc41635(player, value);
}

/*
	Name: function_f308d6bb
	Namespace: namespace_82d7691b
	Checksum: 0x6F74B9A8
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f308d6bb(player, value)
{
	[[ self ]]->function_f308d6bb(player, value);
}

