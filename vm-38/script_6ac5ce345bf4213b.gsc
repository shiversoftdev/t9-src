#using scripts\core_common\lui_shared.csc;

class cdoa_textbubble_playername : cluielem
{

	/*
		Name: constructor
		Namespace: cdoa_textbubble_playername
		Checksum: 0x28E5B85
		Offset: 0x4D8
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
		Checksum: 0xAB36CB97
		Offset: 0x770
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
		Checksum: 0x4870B950
		Offset: 0x628
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_clientnum
		Namespace: cdoa_textbubble_playername
		Checksum: 0x97290F15
		Offset: 0x690
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_clientnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clientnum", value);
	}

	/*
		Name: set_offset_y
		Namespace: cdoa_textbubble_playername
		Checksum: 0x7B5396B0
		Offset: 0x700
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_y(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_y", value);
	}

	/*
		Name: register_clientside
		Namespace: cdoa_textbubble_playername
		Checksum: 0xE0FF866E
		Offset: 0x548
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_TextBubble_PlayerName");
	}

	/*
		Name: set_offset_x
		Namespace: cdoa_textbubble_playername
		Checksum: 0xFE901489
		Offset: 0x6C8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_x(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_x", value);
	}

	/*
		Name: set_offset_z
		Namespace: cdoa_textbubble_playername
		Checksum: 0x6B68FC44
		Offset: 0x738
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_z(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cdoa_textbubble_playername
		Checksum: 0xE3F395DC
		Offset: 0x4F8
		Size: 0x44
		Parameters: 5
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_c05c67e2, var_5957697a, var_90efc226, var_b77f41ee)
	{
		cluielem::setup_clientfields("DOA_TextBubble_PlayerName");
	}

	/*
		Name: set_entnum
		Namespace: cdoa_textbubble_playername
		Checksum: 0x17471F4A
		Offset: 0x658
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entnum", value);
	}

	/*
		Name: function_fa582112
		Namespace: cdoa_textbubble_playername
		Checksum: 0xDD6AAF51
		Offset: 0x570
		Size: 0xB0
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "entnum", 0);
		[[ self ]]->set_data(localclientnum, "clientnum", 0);
		[[ self ]]->set_data(localclientnum, "offset_x", 0);
		[[ self ]]->set_data(localclientnum, "offset_y", 0);
		[[ self ]]->set_data(localclientnum, "offset_z", 0);
	}

}

#namespace doa_textbubble_playername;

/*
	Name: function_d9e52f8e
	Namespace: doa_textbubble_playername
	Checksum: 0x4BAC3C7C
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d9e52f8e()
{
	level notify(1868199021);
}

/*
	Name: function_b4023f5a
	Namespace: doa_textbubble_playername
	Checksum: 0x239E14A2
	Offset: 0x110
	Size: 0x6C
	Parameters: 4
	Flags: None
*/
function function_b4023f5a(localclientnum, offsetx, offsety, offsetz)
{
	self set_offset_x(localclientnum, offsetx);
	self set_offset_y(localclientnum, offsety);
	self set_offset_z(localclientnum, offsetz);
}

/*
	Name: register
	Namespace: doa_textbubble_playername
	Checksum: 0xC7C4596D
	Offset: 0x188
	Size: 0x19E
	Parameters: 5
	Flags: None
*/
function register(var_5a7b4b38, var_c05c67e2, var_5957697a, var_90efc226, var_b77f41ee)
{
	elem = new cdoa_textbubble_playername();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_c05c67e2, var_5957697a, var_90efc226, var_b77f41ee);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textbubble_playername"]))
	{
		level.var_ae746e8f[#"doa_textbubble_playername"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_textbubble_playername"]))
	{
		level.var_ae746e8f[#"doa_textbubble_playername"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_textbubble_playername"]))
	{
		level.var_ae746e8f[#"doa_textbubble_playername"] = array(level.var_ae746e8f[#"doa_textbubble_playername"]);
	}
	level.var_ae746e8f[#"doa_textbubble_playername"][level.var_ae746e8f[#"doa_textbubble_playername"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: doa_textbubble_playername
	Checksum: 0x26A400ED
	Offset: 0x330
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cdoa_textbubble_playername();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: doa_textbubble_playername
	Checksum: 0xB10BB85E
	Offset: 0x370
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function open(player)
{
	[[ self ]]->open(player);
}

/*
	Name: close
	Namespace: doa_textbubble_playername
	Checksum: 0xA33CCC6D
	Offset: 0x398
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
	Checksum: 0x691CFFCE
	Offset: 0x3C0
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_entnum
	Namespace: doa_textbubble_playername
	Checksum: 0x9D595A14
	Offset: 0x3E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_clientnum
	Namespace: doa_textbubble_playername
	Checksum: 0x84340B2B
	Offset: 0x418
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clientnum(localclientnum, value)
{
	[[ self ]]->set_clientnum(localclientnum, value);
}

/*
	Name: set_offset_x
	Namespace: doa_textbubble_playername
	Checksum: 0x1E7D916C
	Offset: 0x448
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_x(localclientnum, value)
{
	[[ self ]]->set_offset_x(localclientnum, value);
}

/*
	Name: set_offset_y
	Namespace: doa_textbubble_playername
	Checksum: 0xF98EF9A6
	Offset: 0x478
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_y(localclientnum, value)
{
	[[ self ]]->set_offset_y(localclientnum, value);
}

/*
	Name: set_offset_z
	Namespace: doa_textbubble_playername
	Checksum: 0xDE75BD79
	Offset: 0x4A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(localclientnum, value)
{
	[[ self ]]->set_offset_z(localclientnum, value);
}

