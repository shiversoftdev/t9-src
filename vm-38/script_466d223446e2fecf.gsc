#using scripts\core_common\lui_shared.gsc;

class cdoa_textbubble_playername : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cdoa_textbubble_playername
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
		Namespace: cdoa_textbubble_playername
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
		Namespace: cdoa_textbubble_playername
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_clientnum
		Namespace: cdoa_textbubble_playername
		Checksum: 0x24C9B690
		Offset: 0x3B0
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, value, 0);
	}

	/*
		Name: set_offset_y
		Namespace: cdoa_textbubble_playername
		Checksum: 0x9FA97277
		Offset: 0x460
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_offset_y(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 4, value, 0);
	}

	/*
		Name: close
		Namespace: cdoa_textbubble_playername
		Checksum: 0x9DA40D88
		Offset: 0x328
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_offset_x
		Namespace: cdoa_textbubble_playername
		Checksum: 0x5880D9AD
		Offset: 0x408
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_offset_x(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 3, value, 0);
	}

	/*
		Name: set_offset_z
		Namespace: cdoa_textbubble_playername
		Checksum: 0xB786A31A
		Offset: 0x4B8
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_offset_z(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 5, value, 0);
	}

	/*
		Name: setup_clientfields
		Namespace: cdoa_textbubble_playername
		Checksum: 0xE44E3368
		Offset: 0x2B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("DOA_TextBubble_PlayerName");
	}

	/*
		Name: set_entnum
		Namespace: cdoa_textbubble_playername
		Checksum: 0xE9FB5CAE
		Offset: 0x358
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_entnum(player, value)
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
	elem = new cdoa_textbubble_playername();
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
	Name: set_entnum
	Namespace: doa_textbubble_playername
	Checksum: 0xCF0D832
	Offset: 0x1A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(player, value)
{
	[[ self ]]->set_entnum(player, value);
}

/*
	Name: set_clientnum
	Namespace: doa_textbubble_playername
	Checksum: 0x8F7D2906
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(player, value)
{
	[[ self ]]->set_clientnum(player, value);
}

/*
	Name: set_offset_x
	Namespace: doa_textbubble_playername
	Checksum: 0x82B20567
	Offset: 0x208
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_x(player, value)
{
	[[ self ]]->set_offset_x(player, value);
}

/*
	Name: set_offset_y
	Namespace: doa_textbubble_playername
	Checksum: 0xFF07444
	Offset: 0x238
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_y(player, value)
{
	[[ self ]]->set_offset_y(player, value);
}

/*
	Name: set_offset_z
	Namespace: doa_textbubble_playername
	Checksum: 0xCD1E2F14
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(player, value)
{
	[[ self ]]->set_offset_z(player, value);
}

