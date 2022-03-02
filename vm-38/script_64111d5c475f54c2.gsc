#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_5813c56a : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_5813c56a
		Checksum: 0xB6920732
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
		Namespace: namespace_5813c56a
		Checksum: 0x529E41AF
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
		Namespace: namespace_5813c56a
		Checksum: 0xD2759495
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
		Name: function_39ee9107
		Namespace: namespace_5813c56a
		Checksum: 0x79F1778C
		Offset: 0x388
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_39ee9107(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showPhoto", value);
	}

	/*
		Name: close
		Namespace: namespace_5813c56a
		Checksum: 0x187D1183
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
		Name: setup_clientfields
		Namespace: namespace_5813c56a
		Checksum: 0xC04B82C5
		Offset: 0x248
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("zm_silver_hud");
		namespace_6aaccc24::function_da693cbe("aetherscopeStatus", 1, 2, "int", 0);
		namespace_6aaccc24::function_da693cbe("showPhoto", 1, 1, "int");
	}

	/*
		Name: function_9efecfd1
		Namespace: namespace_5813c56a
		Checksum: 0x82C3E1B5
		Offset: 0x338
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_9efecfd1(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "aetherscopeStatus", value);
	}

}

#namespace zm_silver_hud;

/*
	Name: function_41fb1aac
	Namespace: zm_silver_hud
	Checksum: 0x25907E41
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_41fb1aac()
{
	level notify(1330783200);
}

/*
	Name: register
	Namespace: zm_silver_hud
	Checksum: 0x3CB5189A
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_5813c56a();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_silver_hud
	Checksum: 0x40D59CB0
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
	Namespace: zm_silver_hud
	Checksum: 0x6221B1B7
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
	Namespace: zm_silver_hud
	Checksum: 0xD7920DB2
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
	Name: function_9efecfd1
	Namespace: zm_silver_hud
	Checksum: 0xCDB8B147
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9efecfd1(player, value)
{
	[[ self ]]->function_9efecfd1(player, value);
}

/*
	Name: function_39ee9107
	Namespace: zm_silver_hud
	Checksum: 0xEF7B07C2
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_39ee9107(player, value)
{
	[[ self ]]->function_39ee9107(player, value);
}

