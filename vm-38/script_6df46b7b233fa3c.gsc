#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_70ee35b1 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_70ee35b1
		Checksum: 0x53D202E8
		Offset: 0x2A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_70ee35b1
		Checksum: 0xF4979702
		Offset: 0x548
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_87bb24
		Namespace: namespace_70ee35b1
		Checksum: 0x16440DFE
		Offset: 0x408
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_87bb24(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "movieName", value);
	}

	/*
		Name: open
		Namespace: namespace_70ee35b1
		Checksum: 0xA0D0D6B6
		Offset: 0x390
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
		Name: function_493305af
		Namespace: namespace_70ee35b1
		Checksum: 0xCD2D4D53
		Offset: 0x4F8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_493305af(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "additive", value);
	}

	/*
		Name: close
		Namespace: namespace_70ee35b1
		Checksum: 0xEEA0D326
		Offset: 0x3D8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5caa21cb
		Namespace: namespace_70ee35b1
		Checksum: 0xBDE610BC
		Offset: 0x4A8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_5caa21cb(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "looping", value);
	}

	/*
		Name: function_8f7a8b9c
		Namespace: namespace_70ee35b1
		Checksum: 0xD4705E89
		Offset: 0x458
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_8f7a8b9c(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showBlackScreen", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_70ee35b1
		Checksum: 0x6263552E
		Offset: 0x2C8
		Size: 0xBC
		Parameters: 0
		Flags: Linked
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
	Name: function_7626f1a4
	Namespace: pip_menu
	Checksum: 0x9133A7A3
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7626f1a4()
{
	level notify(556647788);
}

/*
	Name: register
	Namespace: pip_menu
	Checksum: 0x12BDB5
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Linked
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
	Checksum: 0xF79EBB64
	Offset: 0x158
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
	Checksum: 0x8223FA61
	Offset: 0x198
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
	Checksum: 0xC4970C2C
	Offset: 0x1C0
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
	Checksum: 0xFC159FEA
	Offset: 0x1E8
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
	Checksum: 0x2DC7A400
	Offset: 0x218
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
	Checksum: 0xAF442DBE
	Offset: 0x248
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
	Checksum: 0x771CEFA5
	Offset: 0x278
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_493305af(player, value)
{
	[[ self ]]->function_493305af(player, value);
}

