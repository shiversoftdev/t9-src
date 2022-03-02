#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_70ee35b1 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_70ee35b1
		Checksum: 0xF481D593
		Offset: 0x288
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_70ee35b1
		Checksum: 0x26CD9CF6
		Offset: 0x528
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_87bb24
		Namespace: namespace_70ee35b1
		Checksum: 0x9CFED939
		Offset: 0x3E8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_87bb24(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieName", value);
	}

	/*
		Name: open
		Namespace: namespace_70ee35b1
		Checksum: 0xCE4263
		Offset: 0x370
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
		Name: function_493305af
		Namespace: namespace_70ee35b1
		Checksum: 0x82C8A66C
		Offset: 0x4D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_493305af(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "additive", value);
	}

	/*
		Name: close
		Namespace: namespace_70ee35b1
		Checksum: 0x1B9DE64C
		Offset: 0x3B8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5caa21cb
		Namespace: namespace_70ee35b1
		Checksum: 0xC770306E
		Offset: 0x488
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_5caa21cb(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "looping", value);
	}

	/*
		Name: function_8f7a8b9c
		Namespace: namespace_70ee35b1
		Checksum: 0x3D19809E
		Offset: 0x438
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_8f7a8b9c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_70ee35b1
		Checksum: 0xD1C74C3D
		Offset: 0x2A8
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("pip_menu");
		namespace_6aaccc24::function_dcb34c80("moviefile", "movieName", 1);
		namespace_6aaccc24::function_da693cbe("showBlackScreen", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("looping", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("additive", 1, 1, "int");
	}

}

#namespace pip_menu;

/*
	Name: register
	Namespace: pip_menu
	Checksum: 0xF392A1B4
	Offset: 0xF8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_70ee35b1();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: pip_menu
	Checksum: 0xA54E9789
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
	Namespace: pip_menu
	Checksum: 0x86736221
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
	Namespace: pip_menu
	Checksum: 0x7D032A4E
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
	Name: function_87bb24
	Namespace: pip_menu
	Checksum: 0x10442B63
	Offset: 0x1C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_87bb24(player, value)
{
	[[ self ]]->function_87bb24(player, value);
}

/*
	Name: function_8f7a8b9c
	Namespace: pip_menu
	Checksum: 0xBE2B6F54
	Offset: 0x1F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_8f7a8b9c(player, value)
{
	[[ self ]]->function_8f7a8b9c(player, value);
}

/*
	Name: function_5caa21cb
	Namespace: pip_menu
	Checksum: 0xC0047BC8
	Offset: 0x228
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5caa21cb(player, value)
{
	[[ self ]]->function_5caa21cb(player, value);
}

/*
	Name: function_493305af
	Namespace: pip_menu
	Checksum: 0x94A18612
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_493305af(player, value)
{
	[[ self ]]->function_493305af(player, value);
}

