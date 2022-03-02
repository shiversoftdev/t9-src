#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_df106b1 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_df106b1
		Checksum: 0xAB22E647
		Offset: 0x758
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_df106b1
		Checksum: 0x9F6D7FF9
		Offset: 0xE30
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_df106b1
		Checksum: 0xC763A25D
		Offset: 0x9A8
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
		Name: function_1a98dac6
		Namespace: namespace_df106b1
		Checksum: 0xFC2CA79B
		Offset: 0xD90
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_1a98dac6(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "textpayload", value);
	}

	/*
		Name: function_1bd2bb26
		Namespace: namespace_df106b1
		Checksum: 0xE92F88D3
		Offset: 0xCF0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_1bd2bb26(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "horizontal_alignment", value);
	}

	/*
		Name: function_2208b8db
		Namespace: namespace_df106b1
		Checksum: 0xF1F13967
		Offset: 0xC00
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_2208b8db(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "green", value);
	}

	/*
		Name: function_237ff433
		Namespace: namespace_df106b1
		Checksum: 0x70E4B1F2
		Offset: 0xB10
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_237ff433(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fadeOverTime", value);
	}

	/*
		Name: close
		Namespace: namespace_df106b1
		Checksum: 0x734747FF
		Offset: 0x9F0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_5dbd7024
		Namespace: namespace_df106b1
		Checksum: 0x3F535E55
		Offset: 0xAC0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_5dbd7024(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "height", value);
	}

	/*
		Name: function_7420df0a
		Namespace: namespace_df106b1
		Checksum: 0x36CD8910
		Offset: 0xC50
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_7420df0a(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_df106b1
		Checksum: 0x73E8792C
		Offset: 0x778
		Size: 0x224
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("DOA_TextElement");
		namespace_6aaccc24::function_da693cbe("x", 1, 7, "int");
		namespace_6aaccc24::function_da693cbe("y", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("height", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("fadeOverTime", 1, 5, "int");
		namespace_6aaccc24::function_da693cbe("alpha", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("red", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("green", 1, 4, "float");
		namespace_6aaccc24::function_da693cbe("blue", 1, 4, "float");
		namespace_6aaccc24::function_dcb34c80("string", "text", 1);
		namespace_6aaccc24::function_da693cbe("horizontal_alignment", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("intpayload", 1, 32, "int");
		namespace_6aaccc24::function_dcb34c80("string", "textpayload", 1);
		namespace_6aaccc24::function_da693cbe("scale", 1, 5, "float");
	}

	/*
		Name: set_y
		Namespace: namespace_df106b1
		Checksum: 0xB576FEA1
		Offset: 0xA70
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_y(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "y", value);
	}

	/*
		Name: function_9e089af4
		Namespace: namespace_df106b1
		Checksum: 0x83D001A8
		Offset: 0xD40
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_9e089af4(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "intpayload", value);
	}

	/*
		Name: function_aa5c711d
		Namespace: namespace_df106b1
		Checksum: 0x46329D7E
		Offset: 0xB60
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_aa5c711d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "alpha", value);
	}

	/*
		Name: function_bede6f52
		Namespace: namespace_df106b1
		Checksum: 0x4B14E63F
		Offset: 0xDE0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_bede6f52(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "scale", value);
	}

	/*
		Name: set_x
		Namespace: namespace_df106b1
		Checksum: 0xEB69AE3F
		Offset: 0xA20
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_x(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "x", value);
	}

	/*
		Name: function_d5ea17f0
		Namespace: namespace_df106b1
		Checksum: 0x850E74D7
		Offset: 0xCA0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_d5ea17f0(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

	/*
		Name: function_eccc151d
		Namespace: namespace_df106b1
		Checksum: 0xAFB8C1B8
		Offset: 0xBB0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_eccc151d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

}

#namespace doa_textelement;

/*
	Name: function_494ce81c
	Namespace: doa_textelement
	Checksum: 0x810D65EA
	Offset: 0x158
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_494ce81c()
{
	level notify(1677527143);
}

/*
	Name: set_color
	Namespace: doa_textelement
	Checksum: 0x9DFC1713
	Offset: 0x178
	Size: 0x6C
	Parameters: 4
	Flags: None
*/
function set_color(player, red, green, blue)
{
	self function_eccc151d(player, red);
	self function_2208b8db(player, green);
	self function_7420df0a(player, blue);
}

/*
	Name: fade
	Namespace: doa_textelement
	Checksum: 0x95414E81
	Offset: 0x1F0
	Size: 0x7C
	Parameters: 3
	Flags: None
*/
function fade(player, var_1a92607f, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self function_aa5c711d(player, var_1a92607f);
	self function_237ff433(player, int(duration * 10));
}

/*
	Name: show
	Namespace: doa_textelement
	Checksum: 0x1108D3BF
	Offset: 0x278
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function show(player, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(player, 1, duration);
}

/*
	Name: hide
	Namespace: doa_textelement
	Checksum: 0xDA640813
	Offset: 0x2C8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function hide(player, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(player, 0, duration);
}

/*
	Name: function_e5898fd7
	Namespace: doa_textelement
	Checksum: 0xAC65AA8C
	Offset: 0x310
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_e5898fd7(player, var_c6572d9b)
{
	self set_x(player, int(var_c6572d9b / 15));
}

/*
	Name: function_58a135d3
	Namespace: doa_textelement
	Checksum: 0x9DD69501
	Offset: 0x368
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_58a135d3(player, var_d390c80e)
{
	self set_y(player, int(var_d390c80e / 15));
}

/*
	Name: function_f97e9049
	Namespace: doa_textelement
	Checksum: 0xE781A76
	Offset: 0x3C0
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_f97e9049(player, var_c6572d9b, var_d390c80e)
{
	self function_e5898fd7(player, var_c6572d9b);
	self function_58a135d3(player, var_d390c80e);
}

/*
	Name: register
	Namespace: doa_textelement
	Checksum: 0xE0AC09DC
	Offset: 0x418
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_df106b1();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_textelement
	Checksum: 0x6D00D241
	Offset: 0x458
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
	Namespace: doa_textelement
	Checksum: 0x951256D4
	Offset: 0x498
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
	Namespace: doa_textelement
	Checksum: 0xAA43D4F0
	Offset: 0x4C0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_x
	Namespace: doa_textelement
	Checksum: 0xCFB92FB2
	Offset: 0x4E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_x(player, value)
{
	[[ self ]]->set_x(player, value);
}

/*
	Name: set_y
	Namespace: doa_textelement
	Checksum: 0x7C3BE44D
	Offset: 0x518
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(player, value)
{
	[[ self ]]->set_y(player, value);
}

/*
	Name: function_5dbd7024
	Namespace: doa_textelement
	Checksum: 0xFB8F8737
	Offset: 0x548
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_5dbd7024(player, value)
{
	[[ self ]]->function_5dbd7024(player, value);
}

/*
	Name: function_237ff433
	Namespace: doa_textelement
	Checksum: 0xD7CDFF1B
	Offset: 0x578
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_237ff433(player, value)
{
	[[ self ]]->function_237ff433(player, value);
}

/*
	Name: function_aa5c711d
	Namespace: doa_textelement
	Checksum: 0x178229F5
	Offset: 0x5A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_aa5c711d(player, value)
{
	[[ self ]]->function_aa5c711d(player, value);
}

/*
	Name: function_eccc151d
	Namespace: doa_textelement
	Checksum: 0x4725D72A
	Offset: 0x5D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_eccc151d(player, value)
{
	[[ self ]]->function_eccc151d(player, value);
}

/*
	Name: function_2208b8db
	Namespace: doa_textelement
	Checksum: 0xE91C026F
	Offset: 0x608
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2208b8db(player, value)
{
	[[ self ]]->function_2208b8db(player, value);
}

/*
	Name: function_7420df0a
	Namespace: doa_textelement
	Checksum: 0x96CD9F50
	Offset: 0x638
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7420df0a(player, value)
{
	[[ self ]]->function_7420df0a(player, value);
}

/*
	Name: function_d5ea17f0
	Namespace: doa_textelement
	Checksum: 0x321CC429
	Offset: 0x668
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_d5ea17f0(player, value)
{
	[[ self ]]->function_d5ea17f0(player, value);
}

/*
	Name: function_1bd2bb26
	Namespace: doa_textelement
	Checksum: 0xF4F377C3
	Offset: 0x698
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1bd2bb26(player, value)
{
	[[ self ]]->function_1bd2bb26(player, value);
}

/*
	Name: function_9e089af4
	Namespace: doa_textelement
	Checksum: 0xCF0E0EF6
	Offset: 0x6C8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_9e089af4(player, value)
{
	[[ self ]]->function_9e089af4(player, value);
}

/*
	Name: function_1a98dac6
	Namespace: doa_textelement
	Checksum: 0x5B6C2DA0
	Offset: 0x6F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1a98dac6(player, value)
{
	[[ self ]]->function_1a98dac6(player, value);
}

/*
	Name: function_bede6f52
	Namespace: doa_textelement
	Checksum: 0x340EC536
	Offset: 0x728
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_bede6f52(player, value)
{
	[[ self ]]->function_bede6f52(player, value);
}

