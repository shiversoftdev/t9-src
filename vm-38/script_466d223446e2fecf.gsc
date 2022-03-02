#using scripts\core_common\lui_shared.gsc;

class class_42946372 : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_42946372
		Checksum: 0x40656A35
		Offset: 0x298
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
		Checksum: 0xA0880696
		Offset: 0x510
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
		Checksum: 0x8BDF7BBF
		Offset: 0x2E0
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
		Checksum: 0x24C9B690
		Offset: 0x3B0
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
		Checksum: 0x9FA97277
		Offset: 0x460
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
		Checksum: 0x9DA40D88
		Offset: 0x328
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
		Checksum: 0x5880D9AD
		Offset: 0x408
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
		Checksum: 0xB786A31A
		Offset: 0x4B8
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
		Checksum: 0xE44E3368
		Offset: 0x2B8
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
		Checksum: 0xE9FB5CAE
		Offset: 0x358
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
	Name: function_7fac1609
	Namespace: doa_textbubble_playername
	Checksum: 0x1CE321EF
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7fac1609()
{
	level notify(2068402319);
}

/*
	Name: register
	Namespace: doa_textbubble_playername
	Checksum: 0x650AD9B2
	Offset: 0xD8
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
	Checksum: 0xA4DF70D2
	Offset: 0x118
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
	Checksum: 0x2FDF789
	Offset: 0x158
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
	Checksum: 0xE6010A6A
	Offset: 0x180
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
	Checksum: 0xCF0D832
	Offset: 0x1A8
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
	Checksum: 0x8F7D2906
	Offset: 0x1D8
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
	Checksum: 0x82B20567
	Offset: 0x208
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
	Checksum: 0xFF07444
	Offset: 0x238
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
	Checksum: 0xCD1E2F14
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7ddfdfef(player, value)
{
	[[ self ]]->function_7ddfdfef(player, value);
}

