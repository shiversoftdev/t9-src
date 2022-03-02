#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_32689523 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_32689523
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
		Namespace: namespace_32689523
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
		Namespace: namespace_32689523
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: close
		Namespace: namespace_32689523
		Checksum: 0xFD4D17AF
		Offset: 0x2F8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_67bdfe40
		Namespace: namespace_32689523
		Checksum: 0x342C555E
		Offset: 0x328
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_67bdfe40(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bleedout_progress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_32689523
		Checksum: 0xEB4C4440
		Offset: 0x238
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_laststand_client");
		namespace_6aaccc24::function_da693cbe("bleedout_progress", 1, 6, "float");
		namespace_6aaccc24::function_da693cbe("revive_progress", 1, 5, "float");
	}

	/*
		Name: function_d50fdde9
		Namespace: namespace_32689523
		Checksum: 0xD509DB19
		Offset: 0x378
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_d50fdde9(player, value)
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
	elem = new class_32689523();
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
	Name: function_67bdfe40
	Namespace: mp_laststand_client
	Checksum: 0xCBDFB61D
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_67bdfe40(player, value)
{
	[[ self ]]->function_67bdfe40(player, value);
}

/*
	Name: function_d50fdde9
	Namespace: mp_laststand_client
	Checksum: 0xAAD60BF9
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d50fdde9(player, value)
{
	[[ self ]]->function_d50fdde9(player, value);
}

