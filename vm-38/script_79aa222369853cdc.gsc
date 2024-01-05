#using scripts\core_common\lui_shared.gsc;

class clui_plane_mortar : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: clui_plane_mortar
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
		Namespace: clui_plane_mortar
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
		Namespace: clui_plane_mortar
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: close
		Namespace: clui_plane_mortar
		Checksum: 0x2D13FB52
		Offset: 0x290
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
		Checksum: 0x6E06E9B8
		Offset: 0x2C0
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
		Checksum: 0xE493BBCF
		Offset: 0x220
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
		Checksum: 0x5FA88031
		Offset: 0x320
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
	elem = new clui_plane_mortar();
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
	Name: set_selectorindex
	Namespace: lui_plane_mortar
	Checksum: 0x624E7E69
	Offset: 0x1A0
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
	Checksum: 0xAD5DB9E6
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_selectorsavailable(player, value)
{
	[[ self ]]->set_selectorsavailable(player, value);
}

