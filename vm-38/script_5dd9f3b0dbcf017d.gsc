#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_trial_weapon_locked : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_trial_weapon_locked
		Checksum: 0xA1028B2B
		Offset: 0x1E8
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
		Checksum: 0xEC5286EE
		Offset: 0x318
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
		Checksum: 0x313E08FB
		Offset: 0x2D0
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
		Checksum: 0x2DA7B9C0
		Offset: 0x258
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
		Checksum: 0x8D461974
		Offset: 0x2A0
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
		Checksum: 0x10A73FC7
		Offset: 0x208
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
	Name: function_2f297a49
	Namespace: zm_trial_weapon_locked
	Checksum: 0x14C4FF5B
	Offset: 0xD0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2f297a49()
{
	level notify(311501916);
}

/*
	Name: register
	Namespace: zm_trial_weapon_locked
	Checksum: 0x95FE109C
	Offset: 0xF0
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
	Checksum: 0x40D59CB0
	Offset: 0x130
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
	Checksum: 0x6221B1B7
	Offset: 0x170
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
	Checksum: 0xD7920DB2
	Offset: 0x198
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
	Checksum: 0x5F4DE20
	Offset: 0x1C0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_1e74977(player)
{
	[[ self ]]->function_1e74977(player);
}

