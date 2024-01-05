#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cmp_laststand_client : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cmp_laststand_client
		Checksum: 0x110E35C0
		Offset: 0x238
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cmp_laststand_client
		Checksum: 0xEB1C11EE
		Offset: 0x3E8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cmp_laststand_client
		Checksum: 0x6441D80C
		Offset: 0x2D0
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
		Namespace: cmp_laststand_client
		Checksum: 0x62042216
		Offset: 0x318
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_bleedout_progress
		Namespace: cmp_laststand_client
		Checksum: 0xAE72FF58
		Offset: 0x348
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_bleedout_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cmp_laststand_client
		Checksum: 0xA690C167
		Offset: 0x258
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("mp_laststand_client");
		cluielem::add_clientfield("bleedout_progress", 1, 6, "float");
		cluielem::add_clientfield("revive_progress", 1, 5, "float");
	}

	/*
		Name: set_revive_progress
		Namespace: cmp_laststand_client
		Checksum: 0xA0A21628
		Offset: 0x398
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_revive_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "revive_progress", value);
	}

}

#namespace mp_laststand_client;

/*
	Name: function_ddd937f8
	Namespace: mp_laststand_client
	Checksum: 0xE8F2B3CB
	Offset: 0xE8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ddd937f8()
{
	level notify(-283588314);
}

/*
	Name: register
	Namespace: mp_laststand_client
	Checksum: 0xA5AEB76C
	Offset: 0x108
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cmp_laststand_client();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_laststand_client
	Checksum: 0x3A6790E3
	Offset: 0x148
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
	Namespace: mp_laststand_client
	Checksum: 0x2AD0B106
	Offset: 0x188
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
	Namespace: mp_laststand_client
	Checksum: 0x1E0592EA
	Offset: 0x1B0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_bleedout_progress
	Namespace: mp_laststand_client
	Checksum: 0xF72E5AD3
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bleedout_progress(player, value)
{
	[[ self ]]->set_bleedout_progress(player, value);
}

/*
	Name: set_revive_progress
	Namespace: mp_laststand_client
	Checksum: 0x9145E374
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_revive_progress(player, value)
{
	[[ self ]]->set_revive_progress(player, value);
}

