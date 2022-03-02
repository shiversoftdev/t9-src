#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_1233e6c8 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_1233e6c8
		Checksum: 0x768751FE
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
		Namespace: namespace_1233e6c8
		Checksum: 0xD4980985
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
		Namespace: namespace_1233e6c8
		Checksum: 0xA75DA1FC
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
		Namespace: namespace_1233e6c8
		Checksum: 0x7DB018E6
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
		Namespace: namespace_1233e6c8
		Checksum: 0x2AB4EFFE
		Offset: 0x230
		Size: 0x6C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("multi_stage_target_lockon");
		namespace_6aaccc24::function_da693cbe("entNum", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("targetState", 1, 3, "int");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_1233e6c8
		Checksum: 0xF0E0C544
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
		Namespace: namespace_1233e6c8
		Checksum: 0xB8735E25
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

#namespace multi_stage_target_lockon;

/*
	Name: register
	Namespace: multi_stage_target_lockon
	Checksum: 0x7C510AED
	Offset: 0xE0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_1233e6c8();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: multi_stage_target_lockon
	Checksum: 0x9E0FBA10
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
	Namespace: multi_stage_target_lockon
	Checksum: 0x43870681
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
	Namespace: multi_stage_target_lockon
	Checksum: 0xB2A10D20
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
	Namespace: multi_stage_target_lockon
	Checksum: 0x2EE7BEB4
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
	Namespace: multi_stage_target_lockon
	Checksum: 0x7CC38CC5
	Offset: 0x1E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f1e8a488(player, value)
{
	[[ self ]]->function_f1e8a488(player, value);
}

