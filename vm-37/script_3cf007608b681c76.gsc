#using scripts\core_common\lui_shared.gsc;

class cdoa_textbubble : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cdoa_textbubble
		Checksum: 0xBADB7BB
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
		Namespace: cdoa_textbubble
		Checksum: 0xE390816E
		Offset: 0x508
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
		Checksum: 0xD880073D
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
		Name: set_offset_y
		Namespace: cdoa_textbubble
		Checksum: 0x59B90F81
		Offset: 0x458
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
		Checksum: 0x7487C055
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
		Namespace: cdoa_textbubble
		Checksum: 0xF4F45837
		Offset: 0x400
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
		Checksum: 0x8F133BA3
		Offset: 0x4B0
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
		Checksum: 0xC33EEFE0
		Offset: 0x298
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
		Checksum: 0x61BA0271
		Offset: 0x338
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
		Checksum: 0x75F84C9B
		Offset: 0x390
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
	Name: register
	Namespace: doa_textbubble
	Checksum: 0x746186BE
	Offset: 0xB8
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
	Checksum: 0xB2724536
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
	Namespace: doa_textbubble
	Checksum: 0xA6D7C1EF
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
	Namespace: doa_textbubble
	Checksum: 0x3D187C10
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
	Namespace: doa_textbubble
	Checksum: 0x48F90BCA
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
	Name: set_text
	Namespace: doa_textbubble
	Checksum: 0xC083DA99
	Offset: 0x1B8
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
	Checksum: 0x5D0971EC
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
	Namespace: doa_textbubble
	Checksum: 0xFE342B7C
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
	Namespace: doa_textbubble
	Checksum: 0xDCFD39CC
	Offset: 0x248
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(player, value)
{
	[[ self ]]->set_offset_z(player, value);
}

