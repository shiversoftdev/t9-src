#using scripts\core_common\lui_shared.gsc;

class clui_plane_mortar : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: clui_plane_mortar
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
		Namespace: clui_plane_mortar
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
		Namespace: clui_plane_mortar
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: clui_plane_mortar
		Checksum: 0xE8BC0FBE
		Offset: 0x270
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_selectorindex
		Namespace: clui_plane_mortar
		Checksum: 0x53F00C71
		Offset: 0x2A0
		Size: 0x54
		Parameters: 2
		Flags: Linked
	*/
	function set_selectorindex(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 1);
	}

	/*
		Name: setup_clientfields
		Namespace: clui_plane_mortar
		Checksum: 0x2F18DD0C
		Offset: 0x200
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("lui_plane_mortar");
	}

	/*
		Name: set_selectorsavailable
		Namespace: clui_plane_mortar
		Checksum: 0x99493EBA
		Offset: 0x300
		Size: 0x54
		Parameters: 2
		Flags: Linked
	*/
	function set_selectorsavailable(player, value)
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
	elem = new clui_plane_mortar();
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
	Name: set_selectorindex
	Namespace: lui_plane_mortar
	Checksum: 0xBAE4158
	Offset: 0x180
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectorindex(player, value)
{
	[[ self ]]->set_selectorindex(player, value);
}

/*
	Name: set_selectorsavailable
	Namespace: lui_plane_mortar
	Checksum: 0xD8820EF4
	Offset: 0x1B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectorsavailable(player, value)
{
	[[ self ]]->set_selectorsavailable(player, value);
}

