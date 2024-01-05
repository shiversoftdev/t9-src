#using scripts\core_common\lui_shared.gsc;

class cdoa_textbubble_playername : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cdoa_textbubble_playername
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
		Namespace: cdoa_textbubble_playername
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
		Namespace: cdoa_textbubble_playername
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
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_clientnum
		Namespace: cdoa_textbubble_playername
		Checksum: 0xFD52C439
		Offset: 0x390
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
		Checksum: 0x699770A1
		Offset: 0x440
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
		Checksum: 0x86AE5CDD
		Offset: 0x308
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
		Checksum: 0xDD7E27E5
		Offset: 0x3E8
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
		Checksum: 0x3D46286B
		Offset: 0x498
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
		Checksum: 0xC3701D76
		Offset: 0x298
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
		Checksum: 0x5A6EF704
		Offset: 0x338
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
	elem = new cdoa_textbubble_playername();
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
	Name: set_entnum
	Namespace: doa_textbubble_playername
	Checksum: 0x2EE7BEB4
	Offset: 0x188
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
	Checksum: 0xAD092606
	Offset: 0x1B8
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
	Checksum: 0xED553875
	Offset: 0x1E8
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
	Checksum: 0xB4A14D2B
	Offset: 0x218
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
	Checksum: 0x9492813
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(player, value)
{
	[[ self ]]->set_offset_z(player, value);
}

