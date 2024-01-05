#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class czm_laststand_client : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: czm_laststand_client
		Checksum: 0x98BF4F32
		Offset: 0x260
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
		Checksum: 0x3D86C092
		Offset: 0x488
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
		Checksum: 0x89C5FE32
		Offset: 0x320
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
		Checksum: 0x67790807
		Offset: 0x368
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
		Checksum: 0x41E1855A
		Offset: 0x438
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
		Checksum: 0x7B70989E
		Offset: 0x398
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
		Checksum: 0x10E19162
		Offset: 0x280
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
		Checksum: 0x26DE24C
		Offset: 0x3E8
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
	Name: register
	Namespace: zm_laststand_client
	Checksum: 0x50DAB47E
	Offset: 0x100
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
	Checksum: 0xB2724536
	Offset: 0x140
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
	Checksum: 0xA6D7C1EF
	Offset: 0x180
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
	Checksum: 0x3D187C10
	Offset: 0x1A8
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
	Checksum: 0xECC3992
	Offset: 0x1D0
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
	Checksum: 0x8D93BA6D
	Offset: 0x200
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
	Checksum: 0x9D7ADB3
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_num_downs(player, value)
{
	[[ self ]]->set_num_downs(player, value);
}

