#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_ab111f2c : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_ab111f2c
		Checksum: 0x63147E5B
		Offset: 0x278
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ab111f2c
		Checksum: 0x28539DC3
		Offset: 0x500
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ab111f2c
		Checksum: 0x279AED2D
		Offset: 0x360
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
		Name: function_1c78fe1e
		Namespace: namespace_ab111f2c
		Checksum: 0x29E60672
		Offset: 0x470
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_1c78fe1e(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "fadeout");
	}

	/*
		Name: close
		Namespace: namespace_ab111f2c
		Checksum: 0x806CE840
		Offset: 0x3A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_64d95cad
		Namespace: namespace_ab111f2c
		Checksum: 0x120FD920
		Offset: 0x428
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_64d95cad(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "display_blink");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ab111f2c
		Checksum: 0x9A23D0D2
		Offset: 0x298
		Size: 0xBC
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("cp_hint_text");
		namespace_6aaccc24::function_dcb34c80("string", "hint_text", 1);
		namespace_6aaccc24::function_da693cbe("display_blink", 1, 1, "counter");
		namespace_6aaccc24::function_da693cbe("fadeout", 1, 1, "counter");
		namespace_6aaccc24::function_da693cbe("display_noblink", 1, 1, "counter");
	}

	/*
		Name: function_a16f86c1
		Namespace: namespace_ab111f2c
		Checksum: 0x4D39131D
		Offset: 0x3D8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_a16f86c1(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "hint_text", value);
	}

	/*
		Name: function_a981d6b6
		Namespace: namespace_ab111f2c
		Checksum: 0xDAF9517D
		Offset: 0x4B8
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function function_a981d6b6(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "display_noblink");
	}

}

#namespace cp_hint_text;

/*
	Name: register
	Namespace: cp_hint_text
	Checksum: 0xE271848C
	Offset: 0x100
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_ab111f2c();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: cp_hint_text
	Checksum: 0x555E5116
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
	Namespace: cp_hint_text
	Checksum: 0x2780A85B
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
	Namespace: cp_hint_text
	Checksum: 0x5FE370E6
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
	Name: function_a16f86c1
	Namespace: cp_hint_text
	Checksum: 0x80E3CC01
	Offset: 0x1D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a16f86c1(player, value)
{
	[[ self ]]->function_a16f86c1(player, value);
}

/*
	Name: function_64d95cad
	Namespace: cp_hint_text
	Checksum: 0x60D02B53
	Offset: 0x200
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_64d95cad(player)
{
	[[ self ]]->function_64d95cad(player);
}

/*
	Name: function_1c78fe1e
	Namespace: cp_hint_text
	Checksum: 0x1B29BDCF
	Offset: 0x228
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_1c78fe1e(player)
{
	[[ self ]]->function_1c78fe1e(player);
}

/*
	Name: function_a981d6b6
	Namespace: cp_hint_text
	Checksum: 0xE251F4E8
	Offset: 0x250
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_a981d6b6(player)
{
	[[ self ]]->function_a981d6b6(player);
}

