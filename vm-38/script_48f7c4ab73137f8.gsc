#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_laststand_client : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_laststand_client
		Checksum: 0x254D8A8C
		Offset: 0x280
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: czm_laststand_client
		Checksum: 0x857B5FE4
		Offset: 0x4A8
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: czm_laststand_client
		Checksum: 0xC9EE4F46
		Offset: 0x340
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
		Namespace: czm_laststand_client
		Checksum: 0x3FF70F9B
		Offset: 0x388
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_num_downs
		Namespace: czm_laststand_client
		Checksum: 0xB4673573
		Offset: 0x458
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_num_downs(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "num_downs", value);
	}

	/*
		Name: set_bleedout_progress
		Namespace: czm_laststand_client
		Checksum: 0x46131FF2
		Offset: 0x3B8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_bleedout_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: czm_laststand_client
		Checksum: 0x3809594F
		Offset: 0x2A0
		Size: 0x94
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_laststand_client");
		cluielem::add_clientfield("bleedout_progress", 1, 8, "float");
		cluielem::add_clientfield("revive_progress", 1, 8, "float");
		cluielem::add_clientfield("num_downs", 1, 8, "int");
	}

	/*
		Name: set_revive_progress
		Namespace: czm_laststand_client
		Checksum: 0xD0591381
		Offset: 0x408
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_revive_progress(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "revive_progress", value);
	}

}

#namespace zm_laststand_client;

/*
	Name: function_2078a265
	Namespace: zm_laststand_client
	Checksum: 0x4C8385E1
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_2078a265()
{
	level notify(-845858926);
}

/*
	Name: register
	Namespace: zm_laststand_client
	Checksum: 0x511D09CE
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register()
{
	elem = new czm_laststand_client();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_laststand_client
	Checksum: 0x22B7D0A0
	Offset: 0x160
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Namespace: zm_laststand_client
	Checksum: 0xBEEC1AC2
	Offset: 0x1A0
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_laststand_client
	Checksum: 0xD0CA6291
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_bleedout_progress
	Namespace: zm_laststand_client
	Checksum: 0x672C06A3
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_bleedout_progress(player, value)
{
	[[ self ]]->set_bleedout_progress(player, value);
}

/*
	Name: set_revive_progress
	Namespace: zm_laststand_client
	Checksum: 0xF84C0D7F
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_revive_progress(player, value)
{
	[[ self ]]->set_revive_progress(player, value);
}

/*
	Name: set_num_downs
	Namespace: zm_laststand_client
	Checksum: 0x49DDF8F5
	Offset: 0x250
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_num_downs(player, value)
{
	[[ self ]]->set_num_downs(player, value);
}

