#using scripts\core_common\lui_shared.gsc;

class class_42946372 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_42946372
		Checksum: 0x582453A7
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
		Namespace: namespace_42946372
		Checksum: 0x97867C0E
		Offset: 0x4F0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_42946372
		Checksum: 0x40A1032C
		Offset: 0x2C0
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
		Namespace: namespace_42946372
		Checksum: 0xFD52C439
		Offset: 0x390
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_3b7b386a(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, value, 0);
	}

	/*
		Name: function_4f6e830d
		Namespace: namespace_42946372
		Checksum: 0x699770A1
		Offset: 0x440
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_4f6e830d(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

	/*
		Name: close
		Namespace: namespace_42946372
		Checksum: 0x86AE5CDD
		Offset: 0x308
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_61312692
		Namespace: namespace_42946372
		Checksum: 0xDD7E27E5
		Offset: 0x3E8
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_61312692(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: function_7ddfdfef
		Namespace: namespace_42946372
		Checksum: 0x3D46286B
		Offset: 0x498
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_7ddfdfef(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, value, 0);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_42946372
		Checksum: 0xC3701D76
		Offset: 0x298
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("DOA_TextBubble_PlayerName");
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_42946372
		Checksum: 0x5A6EF704
		Offset: 0x338
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 0);
	}

}

#namespace doa_textbubble_playername;

/*
	Name: register
	Namespace: doa_textbubble_playername
	Checksum: 0x5C564DC7
	Offset: 0xB8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_42946372();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_textbubble_playername
	Checksum: 0x9E0FBA10
	Offset: 0xF8
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
	Namespace: doa_textbubble_playername
	Checksum: 0x43870681
	Offset: 0x138
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
	Namespace: doa_textbubble_playername
	Checksum: 0xB2A10D20
	Offset: 0x160
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
	Namespace: doa_textbubble_playername
	Checksum: 0x2EE7BEB4
	Offset: 0x188
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(player, value)
{
	[[ self ]]->function_c8350e33(player, value);
}

/*
	Name: function_3b7b386a
	Namespace: doa_textbubble_playername
	Checksum: 0xAD092606
	Offset: 0x1B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3b7b386a(player, value)
{
	[[ self ]]->function_3b7b386a(player, value);
}

/*
	Name: function_61312692
	Namespace: doa_textbubble_playername
	Checksum: 0xED553875
	Offset: 0x1E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_61312692(player, value)
{
	[[ self ]]->function_61312692(player, value);
}

/*
	Name: function_4f6e830d
	Namespace: doa_textbubble_playername
	Checksum: 0xB4A14D2B
	Offset: 0x218
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4f6e830d(player, value)
{
	[[ self ]]->function_4f6e830d(player, value);
}

/*
	Name: function_7ddfdfef
	Namespace: doa_textbubble_playername
	Checksum: 0x9492813
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7ddfdfef(player, value)
{
	[[ self ]]->function_7ddfdfef(player, value);
}

