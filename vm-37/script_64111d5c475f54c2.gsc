#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_5813c56a : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_5813c56a
		Checksum: 0xCB4D3D30
		Offset: 0x208
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
		Checksum: 0xF76C4DB3
		Offset: 0x3B8
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
		Checksum: 0x1AF4A248
		Offset: 0x2A0
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
		Name: set_showphoto
		Namespace: namespace_5813c56a
		Checksum: 0x79A31CF6
		Offset: 0x368
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_showphoto(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showPhoto", value);
	}

	/*
		Name: close
		Namespace: namespace_5813c56a
		Checksum: 0x65BAB0D9
		Offset: 0x2E8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_5813c56a
		Checksum: 0x414F06A3
		Offset: 0x228
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_silver_hud");
		cluielem::add_clientfield("aetherscopeStatus", 1, 2, "int", 0);
		cluielem::add_clientfield("showPhoto", 1, 1, "int");
	}

	/*
		Name: set_aetherscopestatus
		Namespace: namespace_5813c56a
		Checksum: 0x5D2D05D6
		Offset: 0x318
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_aetherscopestatus(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "aetherscopeStatus", value);
	}

}

#namespace zm_silver_hud;

/*
	Name: register
	Namespace: zm_silver_hud
	Checksum: 0xCB1C51F3
	Offset: 0xD8
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
	Checksum: 0x34E39DA0
	Offset: 0x118
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
	Checksum: 0x74CB4E3A
	Offset: 0x158
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
	Checksum: 0xA9AD379B
	Offset: 0x180
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_aetherscopestatus
	Namespace: zm_silver_hud
	Checksum: 0x930FB61F
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_aetherscopestatus(player, value)
{
	[[ self ]]->set_aetherscopestatus(player, value);
}

/*
	Name: set_showphoto
	Namespace: zm_silver_hud
	Checksum: 0x107FB542
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_showphoto(player, value)
{
	[[ self ]]->set_showphoto(player, value);
}

