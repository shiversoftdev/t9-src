#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_fd95a9c : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_fd95a9c
		Checksum: 0xA2707E35
		Offset: 0x228
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_fd95a9c
		Checksum: 0x8AA1EC29
		Offset: 0x3D8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_fd95a9c
		Checksum: 0x106B989
		Offset: 0x2C0
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
		Name: function_3ae8b40f
		Namespace: namespace_fd95a9c
		Checksum: 0xB4524F31
		Offset: 0x388
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_3ae8b40f(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "confirmBtn", value);
	}

	/*
		Name: close
		Namespace: namespace_fd95a9c
		Checksum: 0xF76CCCA6
		Offset: 0x308
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_8a6595db
		Namespace: namespace_fd95a9c
		Checksum: 0x4AD3123B
		Offset: 0x338
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_8a6595db(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "textBoxHint", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_fd95a9c
		Checksum: 0xFB32A0AA
		Offset: 0x248
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("DOA_KeyTrade");
		namespace_6aaccc24::function_dcb34c80("string", "textBoxHint", 1);
		namespace_6aaccc24::function_dcb34c80("string", "confirmBtn", 1);
	}

}

#namespace doa_keytrade;

/*
	Name: function_4d2dc93
	Namespace: doa_keytrade
	Checksum: 0x2D887F04
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4d2dc93()
{
	level notify(2128830538);
}

/*
	Name: register
	Namespace: doa_keytrade
	Checksum: 0xBB17D687
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_fd95a9c();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_keytrade
	Checksum: 0xF79EBB64
	Offset: 0x138
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
	Namespace: doa_keytrade
	Checksum: 0x8223FA61
	Offset: 0x178
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
	Namespace: doa_keytrade
	Checksum: 0xC4970C2C
	Offset: 0x1A0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_8a6595db
	Namespace: doa_keytrade
	Checksum: 0xE506C977
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8a6595db(player, value)
{
	[[ self ]]->function_8a6595db(player, value);
}

/*
	Name: function_3ae8b40f
	Namespace: doa_keytrade
	Checksum: 0x5A6AF285
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3ae8b40f(player, value)
{
	[[ self ]]->function_3ae8b40f(player, value);
}

