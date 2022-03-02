#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_1233e6c8 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_1233e6c8
		Checksum: 0x9F56F53C
		Offset: 0x230
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
		Checksum: 0xF88785C6
		Offset: 0x3E0
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
		Checksum: 0x3121B8DE
		Offset: 0x2C8
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
		Checksum: 0xAFAD6A02
		Offset: 0x310
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
		Checksum: 0x37FCA4D0
		Offset: 0x250
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
		Checksum: 0x50EFABC8
		Offset: 0x340
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
		Checksum: 0xA6288339
		Offset: 0x390
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
	Name: function_d7b14ec6
	Namespace: multi_stage_target_lockon
	Checksum: 0xB5E8772C
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d7b14ec6()
{
	level notify(831458632);
}

/*
	Name: register
	Namespace: multi_stage_target_lockon
	Checksum: 0x450D9E98
	Offset: 0x100
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
	Checksum: 0xA4DF70D2
	Offset: 0x140
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
	Checksum: 0x2FDF789
	Offset: 0x180
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
	Checksum: 0xE6010A6A
	Offset: 0x1A8
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
	Checksum: 0xCF0D832
	Offset: 0x1D0
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
	Checksum: 0x5EB783C5
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f1e8a488(player, value)
{
	[[ self ]]->function_f1e8a488(player, value);
}

