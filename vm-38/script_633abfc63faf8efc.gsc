#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_ab111f2c : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_ab111f2c
		Checksum: 0x13757890
		Offset: 0x298
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_ab111f2c
		Checksum: 0x35FFACB5
		Offset: 0x520
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_ab111f2c
		Checksum: 0x31716144
		Offset: 0x380
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Checksum: 0xF8D275EF
		Offset: 0x490
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_1c78fe1e(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "fadeout");
	}

	/*
		Name: close
		Namespace: namespace_ab111f2c
		Checksum: 0x4161A525
		Offset: 0x3C8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_64d95cad
		Namespace: namespace_ab111f2c
		Checksum: 0xDDFCEF73
		Offset: 0x448
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_64d95cad(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "display_blink");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_ab111f2c
		Checksum: 0xA7E6E69E
		Offset: 0x2B8
		Size: 0xBC
		Parameters: 0
		Flags: Linked
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
		Checksum: 0xBCB3E4A1
		Offset: 0x3F8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_a16f86c1(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "hint_text", value);
	}

	/*
		Name: function_a981d6b6
		Namespace: namespace_ab111f2c
		Checksum: 0x41BAE714
		Offset: 0x4D8
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function function_a981d6b6(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "display_noblink");
	}

}

#namespace cp_hint_text;

/*
	Name: function_d1fa7a08
	Namespace: cp_hint_text
	Checksum: 0x3D9DC4EA
	Offset: 0x100
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d1fa7a08()
{
	level notify(1766136791);
}

/*
	Name: register
	Namespace: cp_hint_text
	Checksum: 0xDF3A3275
	Offset: 0x120
	Size: 0x34
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x83B95F3F
	Offset: 0x160
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Checksum: 0xDE74B2A0
	Offset: 0x1A0
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
	Checksum: 0x686D9D85
	Offset: 0x1C8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: function_a16f86c1
	Namespace: cp_hint_text
	Checksum: 0xB107BEF3
	Offset: 0x1F0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_a16f86c1(player, value)
{
	[[ self ]]->function_a16f86c1(player, value);
}

/*
	Name: function_64d95cad
	Namespace: cp_hint_text
	Checksum: 0x6BD6FFEE
	Offset: 0x220
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_64d95cad(player)
{
	[[ self ]]->function_64d95cad(player);
}

/*
	Name: function_1c78fe1e
	Namespace: cp_hint_text
	Checksum: 0x302C3D17
	Offset: 0x248
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
	Checksum: 0xA5A1FAB5
	Offset: 0x270
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function function_a981d6b6(player)
{
	[[ self ]]->function_a981d6b6(player);
}

