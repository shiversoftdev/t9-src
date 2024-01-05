#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_trial_weapon_locked : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_trial_weapon_locked
		Checksum: 0x94814011
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
		Namespace: czm_trial_weapon_locked
		Checksum: 0x1836622E
		Offset: 0x2F8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: function_1e74977
		Namespace: czm_trial_weapon_locked
		Checksum: 0xEB2D055A
		Offset: 0x2B0
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_1e74977(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "show_icon");
	}

	/*
		Name: open
		Namespace: czm_trial_weapon_locked
		Checksum: 0xCA06F982
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
		Namespace: czm_trial_weapon_locked
		Checksum: 0x73F046BC
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
		Namespace: czm_trial_weapon_locked
		Checksum: 0x7E591A3F
		Offset: 0x1E8
		Size: 0x44
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_trial_weapon_locked");
		cluielem::add_clientfield("show_icon", 1, 1, "counter");
	}

}

#namespace zm_trial_weapon_locked;

/*
	Name: register
	Namespace: zm_trial_weapon_locked
	Checksum: 0x625759F5
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new czm_trial_weapon_locked();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_trial_weapon_locked
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
	Namespace: zm_trial_weapon_locked
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
	Namespace: zm_trial_weapon_locked
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
	Name: function_1e74977
	Namespace: zm_trial_weapon_locked
	Checksum: 0x6A404E69
	Offset: 0x1A0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_1e74977(player)
{
	[[ self ]]->function_1e74977(player);
}

