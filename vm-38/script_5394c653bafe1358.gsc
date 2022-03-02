#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_3cdd43e2 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_3cdd43e2
		Checksum: 0x27AA2DC
		Offset: 0x270
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_3cdd43e2
		Checksum: 0x524A7957
		Offset: 0x498
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_3cdd43e2
		Checksum: 0x61E600A3
		Offset: 0x330
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
		Name: function_3b7b386a
		Namespace: namespace_3cdd43e2
		Checksum: 0x3CDF2F07
		Offset: 0x3A8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_3b7b386a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "clientnum", value);
	}

	/*
		Name: function_4b3fb8b8
		Namespace: namespace_3cdd43e2
		Checksum: 0xC7188580
		Offset: 0x448
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_4b3fb8b8(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "reviveProgress", value);
	}

	/*
		Name: close
		Namespace: namespace_3cdd43e2
		Checksum: 0x2C33E9C5
		Offset: 0x378
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_3cdd43e2
		Checksum: 0x96F7A8DE
		Offset: 0x290
		Size: 0x94
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("mp_revive_prompt");
		namespace_6aaccc24::function_da693cbe("clientnum", 1, 7, "int", 0);
		namespace_6aaccc24::function_da693cbe("progress", 1, 5, "float", 0);
		namespace_6aaccc24::function_da693cbe("reviveProgress", 1, 5, "float", 0);
	}

	/*
		Name: function_affe8f61
		Namespace: namespace_3cdd43e2
		Checksum: 0xB1020090
		Offset: 0x3F8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_affe8f61(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress", value);
	}

}

#namespace mp_revive_prompt;

/*
	Name: function_90b9a41d
	Namespace: mp_revive_prompt
	Checksum: 0x71E6AA82
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_90b9a41d()
{
	level notify(1365742599);
}

/*
	Name: register
	Namespace: mp_revive_prompt
	Checksum: 0xF44AE389
	Offset: 0x110
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_3cdd43e2();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: mp_revive_prompt
	Checksum: 0xF79EBB64
	Offset: 0x150
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
	Namespace: mp_revive_prompt
	Checksum: 0x8223FA61
	Offset: 0x190
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
	Namespace: mp_revive_prompt
	Checksum: 0xC4970C2C
	Offset: 0x1B8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_3b7b386a
	Namespace: mp_revive_prompt
	Checksum: 0xCD5DEFAF
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3b7b386a(player, value)
{
	[[ self ]]->function_3b7b386a(player, value);
}

/*
	Name: function_affe8f61
	Namespace: mp_revive_prompt
	Checksum: 0xF906F842
	Offset: 0x210
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_affe8f61(player, value)
{
	[[ self ]]->function_affe8f61(player, value);
}

/*
	Name: function_4b3fb8b8
	Namespace: mp_revive_prompt
	Checksum: 0x68A04440
	Offset: 0x240
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b3fb8b8(player, value)
{
	[[ self ]]->function_4b3fb8b8(player, value);
}

