#using scripts\core_common\lui_shared.gsc;

class class_37d61ee3 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_37d61ee3
		Checksum: 0x65B0F98C
		Offset: 0x200
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_37d61ee3
		Checksum: 0xBDBA8668
		Offset: 0x380
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_37d61ee3
		Checksum: 0x40042098
		Offset: 0x248
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
		Namespace: namespace_37d61ee3
		Checksum: 0x2D13FB52
		Offset: 0x290
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_6c69ff4b
		Namespace: namespace_37d61ee3
		Checksum: 0x6E06E9B8
		Offset: 0x2C0
		Size: 0x54
		Parameters: 2
		Flags: Linked
	*/
	function function_6c69ff4b(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 1);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_37d61ee3
		Checksum: 0xE493BBCF
		Offset: 0x220
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("lui_plane_mortar");
	}

	/*
		Name: function_b172c58e
		Namespace: namespace_37d61ee3
		Checksum: 0x5FA88031
		Offset: 0x320
		Size: 0x54
		Parameters: 2
		Flags: Linked
	*/
	function function_b172c58e(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, value, 1);
	}

}

#namespace lui_plane_mortar;

/*
	Name: function_36347b22
	Namespace: lui_plane_mortar
	Checksum: 0x47A7A2A8
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_36347b22()
{
	level notify(78227675);
}

/*
	Name: register
	Namespace: lui_plane_mortar
	Checksum: 0xA7B2118B
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_37d61ee3();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: lui_plane_mortar
	Checksum: 0x22B7D0A0
	Offset: 0x110
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
	Namespace: lui_plane_mortar
	Checksum: 0xBEEC1AC2
	Offset: 0x150
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
	Namespace: lui_plane_mortar
	Checksum: 0xD0CA6291
	Offset: 0x178
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_6c69ff4b
	Namespace: lui_plane_mortar
	Checksum: 0x624E7E69
	Offset: 0x1A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_6c69ff4b(player, value)
{
	[[ self ]]->function_6c69ff4b(player, value);
}

/*
	Name: function_b172c58e
	Namespace: lui_plane_mortar
	Checksum: 0xAD5DB9E6
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b172c58e(player, value)
{
	[[ self ]]->function_b172c58e(player, value);
}

