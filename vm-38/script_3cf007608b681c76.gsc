#using scripts\core_common\lui_shared.gsc;

class cdoa_textbubble : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cdoa_textbubble
		Checksum: 0x53FEFE1D
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
		Namespace: cdoa_textbubble
		Checksum: 0xC93F394D
		Offset: 0x528
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cdoa_textbubble
		Checksum: 0xDF4E5F22
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
		Name: set_offset_y
		Namespace: cdoa_textbubble
		Checksum: 0x44E8EB2C
		Offset: 0x478
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
		Namespace: cdoa_textbubble
		Checksum: 0x25468508
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
		Namespace: cdoa_textbubble
		Checksum: 0xC62228AC
		Offset: 0x420
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
		Namespace: cdoa_textbubble
		Checksum: 0x6F50056
		Offset: 0x4D0
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
		Namespace: cdoa_textbubble
		Checksum: 0xDFCA18D2
		Offset: 0x2B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("DOA_TextBubble");
	}

	/*
		Name: set_entnum
		Namespace: cdoa_textbubble
		Checksum: 0x331A2767
		Offset: 0x358
		Size: 0x4C
		Parameters: 2
		Flags: None
	*/
	function set_entnum(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 1, value, 0);
	}

	/*
		Name: set_text
		Namespace: cdoa_textbubble
		Checksum: 0xC53329BB
		Offset: 0x3B0
		Size: 0x64
		Parameters: 2
		Flags: None
	*/
	function set_text(player, value)
	{
		player lui::function_bb6bcb89(hash(var_d5213cbb), var_bf9c8c95, 2, function_f2d511a6("string", value), 0);
	}

}

#namespace doa_textbubble;

/*
	Name: function_f35a204
	Namespace: doa_textbubble
	Checksum: 0xA350B1FF
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f35a204()
{
	level notify(-1894827777);
}

/*
	Name: register
	Namespace: doa_textbubble
	Checksum: 0x75A63B0E
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cdoa_textbubble();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: doa_textbubble
	Checksum: 0x22B7D0A0
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
	Namespace: doa_textbubble
	Checksum: 0xBEEC1AC2
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
	Namespace: doa_textbubble
	Checksum: 0xD0CA6291
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
	Namespace: doa_textbubble
	Checksum: 0x211934FB
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
	Name: set_text
	Namespace: doa_textbubble
	Checksum: 0xB55C6D8B
	Offset: 0x1D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(player, value)
{
	[[ self ]]->set_text(player, value);
}

/*
	Name: set_offset_x
	Namespace: doa_textbubble
	Checksum: 0x1D0324AA
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
	Namespace: doa_textbubble
	Checksum: 0x6EB18DBA
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
	Namespace: doa_textbubble
	Checksum: 0xF693605A
	Offset: 0x268
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(player, value)
{
	[[ self ]]->set_offset_z(player, value);
}

