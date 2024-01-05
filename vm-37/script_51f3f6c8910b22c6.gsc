#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_df106b1 : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_df106b1
		Checksum: 0x90F956E1
		Offset: 0x738
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
		Checksum: 0xACD04FD4
		Offset: 0xE10
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
		Checksum: 0xD9FB122B
		Offset: 0x988
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
		Name: set_textpayload
		Namespace: namespace_df106b1
		Checksum: 0x7391AAAE
		Offset: 0xD70
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_textpayload(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "textpayload", value);
	}

	/*
		Name: set_horizontal_alignment
		Namespace: namespace_df106b1
		Checksum: 0xF1A8F668
		Offset: 0xCD0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_horizontal_alignment(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "horizontal_alignment", value);
	}

	/*
		Name: set_green
		Namespace: namespace_df106b1
		Checksum: 0xE7C6A890
		Offset: 0xBE0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_green(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "green", value);
	}

	/*
		Name: set_fadeovertime
		Namespace: namespace_df106b1
		Checksum: 0x8EB4F859
		Offset: 0xAF0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_fadeovertime(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "fadeOverTime", value);
	}

	/*
		Name: close
		Namespace: namespace_df106b1
		Checksum: 0x55E355C
		Offset: 0x9D0
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_height
		Namespace: namespace_df106b1
		Checksum: 0xD372462A
		Offset: 0xAA0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_height(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "height", value);
	}

	/*
		Name: set_blue
		Namespace: namespace_df106b1
		Checksum: 0x49EE7308
		Offset: 0xC30
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_blue(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_df106b1
		Checksum: 0xE5D70D8D
		Offset: 0x758
		Size: 0x224
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("DOA_TextElement");
		cluielem::add_clientfield("x", 1, 7, "int");
		cluielem::add_clientfield("y", 1, 6, "int");
		cluielem::add_clientfield("height", 1, 2, "int");
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int");
		cluielem::add_clientfield("alpha", 1, 4, "float");
		cluielem::add_clientfield("red", 1, 4, "float");
		cluielem::add_clientfield("green", 1, 4, "float");
		cluielem::add_clientfield("blue", 1, 4, "float");
		cluielem::function_dcb34c80("string", "text", 1);
		cluielem::add_clientfield("horizontal_alignment", 1, 2, "int");
		cluielem::add_clientfield("intpayload", 1, 32, "int");
		cluielem::function_dcb34c80("string", "textpayload", 1);
		cluielem::add_clientfield("scale", 1, 5, "float");
	}

	/*
		Name: set_y
		Namespace: namespace_df106b1
		Checksum: 0xC9EA950C
		Offset: 0xA50
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_y(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "y", value);
	}

	/*
		Name: set_intpayload
		Namespace: namespace_df106b1
		Checksum: 0x9093E6D1
		Offset: 0xD20
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_intpayload(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "intpayload", value);
	}

	/*
		Name: set_alpha
		Namespace: namespace_df106b1
		Checksum: 0xBD363C6B
		Offset: 0xB40
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_alpha(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "alpha", value);
	}

	/*
		Name: set_scale
		Namespace: namespace_df106b1
		Checksum: 0xEF78F5F0
		Offset: 0xDC0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_scale(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "scale", value);
	}

	/*
		Name: set_x
		Namespace: namespace_df106b1
		Checksum: 0xA4BE07B3
		Offset: 0xA00
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_x(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "x", value);
	}

	/*
		Name: set_text
		Namespace: namespace_df106b1
		Checksum: 0x52022539
		Offset: 0xC80
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_text(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "text", value);
	}

	/*
		Name: set_red
		Namespace: namespace_df106b1
		Checksum: 0x4F1A30E6
		Offset: 0xB90
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_red(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "red", value);
	}

}

#namespace doa_textelement;

/*
	Name: set_color
	Namespace: doa_textelement
	Checksum: 0x12104E6A
	Offset: 0x158
	Size: 0x6C
	Parameters: 4
	Flags: None
*/
function set_color(player, red, green, blue)
{
	self set_red(player, red);
	self set_green(player, green);
	self set_blue(player, blue);
}

/*
	Name: fade
	Namespace: doa_textelement
	Checksum: 0xF7EA1DBD
	Offset: 0x1D0
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
	self set_alpha(player, var_1a92607f);
	self set_fadeovertime(player, int(duration * 10));
}

/*
	Name: show
	Namespace: doa_textelement
	Checksum: 0x5EF2B26F
	Offset: 0x258
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
	Checksum: 0x73C698FE
	Offset: 0x2A8
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
	Checksum: 0xD74CA4AA
	Offset: 0x2F0
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
	Checksum: 0x9C37BC90
	Offset: 0x348
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
	Checksum: 0xF051C17D
	Offset: 0x3A0
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
	Checksum: 0xE44C4092
	Offset: 0x3F8
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
	Checksum: 0x860AC60F
	Offset: 0x438
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
	Checksum: 0x824A494F
	Offset: 0x478
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
	Checksum: 0x9E8DB48B
	Offset: 0x4A0
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
	Checksum: 0x65A91E02
	Offset: 0x4C8
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
	Checksum: 0xBBA9E34C
	Offset: 0x4F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(player, value)
{
	[[ self ]]->set_y(player, value);
}

/*
	Name: set_height
	Namespace: doa_textelement
	Checksum: 0x458CDA7E
	Offset: 0x528
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_height(player, value)
{
	[[ self ]]->set_height(player, value);
}

/*
	Name: set_fadeovertime
	Namespace: doa_textelement
	Checksum: 0x89F02900
	Offset: 0x558
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeovertime(player, value)
{
	[[ self ]]->set_fadeovertime(player, value);
}

/*
	Name: set_alpha
	Namespace: doa_textelement
	Checksum: 0xE4B60C30
	Offset: 0x588
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alpha(player, value)
{
	[[ self ]]->set_alpha(player, value);
}

/*
	Name: set_red
	Namespace: doa_textelement
	Checksum: 0x48CB7205
	Offset: 0x5B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_red(player, value)
{
	[[ self ]]->set_red(player, value);
}

/*
	Name: set_green
	Namespace: doa_textelement
	Checksum: 0x47F5593F
	Offset: 0x5E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_green(player, value)
{
	[[ self ]]->set_green(player, value);
}

/*
	Name: set_blue
	Namespace: doa_textelement
	Checksum: 0x139C4539
	Offset: 0x618
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(player, value)
{
	[[ self ]]->set_blue(player, value);
}

/*
	Name: set_text
	Namespace: doa_textelement
	Checksum: 0x6712CDDC
	Offset: 0x648
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(player, value)
{
	[[ self ]]->set_text(player, value);
}

/*
	Name: set_horizontal_alignment
	Namespace: doa_textelement
	Checksum: 0x400B86F7
	Offset: 0x678
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(player, value)
{
	[[ self ]]->set_horizontal_alignment(player, value);
}

/*
	Name: set_intpayload
	Namespace: doa_textelement
	Checksum: 0xD9C2F6E
	Offset: 0x6A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_intpayload(player, value)
{
	[[ self ]]->set_intpayload(player, value);
}

/*
	Name: set_textpayload
	Namespace: doa_textelement
	Checksum: 0x9BCFEE5B
	Offset: 0x6D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_textpayload(player, value)
{
	[[ self ]]->set_textpayload(player, value);
}

/*
	Name: set_scale
	Namespace: doa_textelement
	Checksum: 0x1DF311D2
	Offset: 0x708
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_scale(player, value)
{
	[[ self ]]->set_scale(player, value);
}

