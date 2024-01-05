#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cself_respawn : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cself_respawn
		Checksum: 0x16266B8D
		Offset: 0x1C8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cself_respawn
		Checksum: 0xC42AC60D
		Offset: 0x300
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_percent
		Namespace: cself_respawn
		Checksum: 0x7FAB19E9
		Offset: 0x2B0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_percent(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "percent", value);
	}

	/*
		Name: open
		Namespace: cself_respawn
		Checksum: 0x899CE1FB
		Offset: 0x238
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
		Name: close
		Namespace: cself_respawn
		Checksum: 0xA11CA29D
		Offset: 0x280
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
		Namespace: cself_respawn
		Checksum: 0x3A51758C
		Offset: 0x1E8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("self_respawn");
		cluielem::add_clientfield("percent", 1, 6, "float");
	}

}

#namespace self_respawn;

/*
	Name: register
	Namespace: self_respawn
	Checksum: 0xADC06C3E
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cself_respawn();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: self_respawn
	Checksum: 0xB2724536
	Offset: 0x108
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
	Namespace: self_respawn
	Checksum: 0xA6D7C1EF
	Offset: 0x148
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
	Namespace: self_respawn
	Checksum: 0x3D187C10
	Offset: 0x170
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_percent
	Namespace: self_respawn
	Checksum: 0xA36A41BF
	Offset: 0x198
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_percent(player, value)
{
	[[ self ]]->set_percent(player, value);
}

