#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_2347be59 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_2347be59
		Checksum: 0x3F1F16BB
		Offset: 0x210
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_2347be59
		Checksum: 0x93B469FB
		Offset: 0x3C0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_2347be59
		Checksum: 0x9F1F3B30
		Offset: 0x2A8
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
		Namespace: namespace_2347be59
		Checksum: 0x312245E2
		Offset: 0x2F0
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
		Namespace: namespace_2347be59
		Checksum: 0xA9C37871
		Offset: 0x230
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("multi_stage_friendly_lockon");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 10, "int");
		namespace_6aaccc24::function_da693cbe("targetState", 1, 3, "int");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_2347be59
		Checksum: 0x117273CD
		Offset: 0x320
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entNum", value);
	}

	/*
		Name: function_f1e8a488
		Namespace: namespace_2347be59
		Checksum: 0x31C863B8
		Offset: 0x370
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_f1e8a488(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "targetState", value);
	}

}

#namespace multi_stage_friendly_lockon;

/*
	Name: register
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xD4B869D1
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_2347be59();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: multi_stage_friendly_lockon
	Checksum: 0xA54E9789
	Offset: 0x120
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x86736221
	Offset: 0x160
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
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x7D032A4E
	Offset: 0x188
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_c8350e33
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x9A106232
	Offset: 0x1B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(player, value)
{
	[[ self ]]->function_c8350e33(player, value);
}

/*
	Name: function_f1e8a488
	Namespace: multi_stage_friendly_lockon
	Checksum: 0x6963F016
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f1e8a488(player, value)
{
	[[ self ]]->function_f1e8a488(player, value);
}

