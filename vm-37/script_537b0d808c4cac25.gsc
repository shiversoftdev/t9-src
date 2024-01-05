#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cself_revive_visuals_rush : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cself_revive_visuals_rush
		Checksum: 0xB09D89E
		Offset: 0x1D0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cself_revive_visuals_rush
		Checksum: 0x23E379AE
		Offset: 0x308
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cself_revive_visuals_rush
		Checksum: 0x4EC1E20B
		Offset: 0x240
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
		Namespace: cself_revive_visuals_rush
		Checksum: 0x10682DF4
		Offset: 0x288
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
		Namespace: cself_revive_visuals_rush
		Checksum: 0x5DBFE82E
		Offset: 0x1F0
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("self_revive_visuals_rush");
		cluielem::add_clientfield("revive_time", 1, 4, "int");
	}

	/*
		Name: set_revive_time
		Namespace: cself_revive_visuals_rush
		Checksum: 0xB97049B7
		Offset: 0x2B8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_revive_time(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "revive_time", value);
	}

}

#namespace self_revive_visuals_rush;

/*
	Name: register
	Namespace: self_revive_visuals_rush
	Checksum: 0x2CD01E7C
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cself_revive_visuals_rush();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: self_revive_visuals_rush
	Checksum: 0x34E39DA0
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
	Namespace: self_revive_visuals_rush
	Checksum: 0x74CB4E3A
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
	Namespace: self_revive_visuals_rush
	Checksum: 0xA9AD379B
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
	Name: set_revive_time
	Namespace: self_revive_visuals_rush
	Checksum: 0x8C7DCE97
	Offset: 0x1A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_revive_time(player, value)
{
	[[ self ]]->set_revive_time(player, value);
}

