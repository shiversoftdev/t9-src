#using scripts\core_common\lui_shared.gsc;

class class_37d61ee3 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_37d61ee3
		Checksum: 0x426C10E3
		Offset: 0x1E0
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
		Checksum: 0x156C1DDD
		Offset: 0x360
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
		Checksum: 0x4543F6F5
		Offset: 0x228
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
		Checksum: 0xE8BC0FBE
		Offset: 0x270
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
		Checksum: 0x53F00C71
		Offset: 0x2A0
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
		Checksum: 0x2F18DD0C
		Offset: 0x200
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
		Checksum: 0x99493EBA
		Offset: 0x300
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
	Name: register
	Namespace: lui_plane_mortar
	Checksum: 0xA675AC3B
	Offset: 0xB0
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
	Checksum: 0xB2724536
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
	Namespace: lui_plane_mortar
	Checksum: 0xA6D7C1EF
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
	Namespace: lui_plane_mortar
	Checksum: 0x3D187C10
	Offset: 0x158
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
	Checksum: 0xBAE4158
	Offset: 0x180
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
	Checksum: 0xD8820EF4
	Offset: 0x1B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b172c58e(player, value)
{
	[[ self ]]->function_b172c58e(player, value);
}

