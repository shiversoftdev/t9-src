#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_3cdd43e2 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_3cdd43e2
		Checksum: 0xF8A4071C
		Offset: 0x250
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
		Checksum: 0x72BE4F6F
		Offset: 0x478
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
		Checksum: 0xBA6F5B9D
		Offset: 0x310
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
		Checksum: 0x19F5D6C0
		Offset: 0x388
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
		Checksum: 0xEEB0877C
		Offset: 0x428
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
		Checksum: 0xEA462724
		Offset: 0x358
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
		Checksum: 0xB78E8ED5
		Offset: 0x270
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
		Checksum: 0xD96480A0
		Offset: 0x3D8
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
	Name: register
	Namespace: mp_revive_prompt
	Checksum: 0x7CAFF88
	Offset: 0xF0
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
	Checksum: 0xA54E9789
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
	Namespace: mp_revive_prompt
	Checksum: 0x86736221
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
	Namespace: mp_revive_prompt
	Checksum: 0x7D032A4E
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
	Name: function_3b7b386a
	Namespace: mp_revive_prompt
	Checksum: 0x210C5B26
	Offset: 0x1C0
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
	Checksum: 0x6AEA3316
	Offset: 0x1F0
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
	Checksum: 0x7E01236
	Offset: 0x220
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4b3fb8b8(player, value)
{
	[[ self ]]->function_4b3fb8b8(player, value);
}

