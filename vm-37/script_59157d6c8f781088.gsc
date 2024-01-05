#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cmp_laststand_client : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cmp_laststand_client
		Checksum: 0xDFE8B952
		Offset: 0x218
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
		Checksum: 0xDA6BD3DB
		Offset: 0x3C8
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
		Checksum: 0x2EBE4882
		Offset: 0x2B0
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
		Checksum: 0xFD4D17AF
		Offset: 0x2F8
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
		Checksum: 0x342C555E
		Offset: 0x328
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
		Checksum: 0xEB4C4440
		Offset: 0x238
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
		Checksum: 0xD509DB19
		Offset: 0x378
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
	Name: register
	Namespace: mp_laststand_client
	Checksum: 0xDD0B5D7A
	Offset: 0xE8
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
	Checksum: 0x52224920
	Offset: 0x128
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
	Checksum: 0x753C763F
	Offset: 0x168
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
	Checksum: 0xEFF97288
	Offset: 0x190
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
	Checksum: 0xCBDFB61D
	Offset: 0x1B8
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
	Checksum: 0xAAD60BF9
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_revive_progress(player, value)
{
	[[ self ]]->set_revive_progress(player, value);
}

