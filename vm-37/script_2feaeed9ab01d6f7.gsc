#using scripts\core_common\lui_shared.csc;

class cfull_screen_black : cluielem
{

	/*
		Name: constructor
		Namespace: cfull_screen_black
		Checksum: 0xC6857677
		Offset: 0x4D0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cfull_screen_black
		Checksum: 0x305683E8
		Offset: 0x960
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_endalpha
		Namespace: cfull_screen_black
		Checksum: 0xD083CDA4
		Offset: 0x8F0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_endalpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "endAlpha", value);
	}

	/*
		Name: open
		Namespace: cfull_screen_black
		Checksum: 0x895B095A
		Offset: 0x7A8
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_green
		Namespace: cfull_screen_black
		Checksum: 0x8F4C7240
		Offset: 0x810
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_green(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "green", value);
	}

	/*
		Name: set_fadeovertime
		Namespace: cfull_screen_black
		Checksum: 0xDFB0048E
		Offset: 0x880
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_fadeovertime(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: register_clientside
		Namespace: cfull_screen_black
		Checksum: 0xC90EE425
		Offset: 0x668
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("full_screen_black");
	}

	/*
		Name: set_blue
		Namespace: cfull_screen_black
		Checksum: 0xD48DDC23
		Offset: 0x848
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_blue(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cfull_screen_black
		Checksum: 0xE3BF798E
		Offset: 0x4F0
		Size: 0x16C
		Parameters: 7
		Flags: Linked
	*/
	function setup_clientfields(redcallback, greencallback, bluecallback, fadeovertimecallback, var_b046940, var_34291db, var_32445b2)
	{
		cluielem::setup_clientfields("full_screen_black");
		cluielem::add_clientfield("red", 1, 3, "float", redcallback);
		cluielem::add_clientfield("green", 1, 3, "float", greencallback);
		cluielem::add_clientfield("blue", 1, 3, "float", bluecallback);
		cluielem::add_clientfield("fadeOverTime", 1, 12, "int", fadeovertimecallback);
		cluielem::add_clientfield("startAlpha", 1, 5, "float", var_b046940);
		cluielem::add_clientfield("endAlpha", 1, 5, "float", var_34291db);
		cluielem::add_clientfield("drawHUD", 1, 1, "int", var_32445b2);
	}

	/*
		Name: set_startalpha
		Namespace: cfull_screen_black
		Checksum: 0x34EEE3B1
		Offset: 0x8B8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_startalpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "startAlpha", value);
	}

	/*
		Name: set_drawhud
		Namespace: cfull_screen_black
		Checksum: 0x53B1047D
		Offset: 0x928
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_drawhud(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "drawHUD", value);
	}

	/*
		Name: set_red
		Namespace: cfull_screen_black
		Checksum: 0xDDE86166
		Offset: 0x7D8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_red(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "red", value);
	}

	/*
		Name: function_fa582112
		Namespace: cfull_screen_black
		Checksum: 0x89F7A870
		Offset: 0x690
		Size: 0x110
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "red", 0);
		[[ self ]]->set_data(localclientnum, "green", 0);
		[[ self ]]->set_data(localclientnum, "blue", 0);
		[[ self ]]->set_data(localclientnum, "fadeOverTime", 0);
		[[ self ]]->set_data(localclientnum, "startAlpha", 0);
		[[ self ]]->set_data(localclientnum, "endAlpha", 0);
		[[ self ]]->set_data(localclientnum, "drawHUD", 0);
	}

}

#namespace full_screen_black;

/*
	Name: register
	Namespace: full_screen_black
	Checksum: 0xDAC37E06
	Offset: 0x108
	Size: 0x1B6
	Parameters: 7
	Flags: Linked
*/
function register(redcallback, greencallback, bluecallback, fadeovertimecallback, var_b046940, var_34291db, var_32445b2)
{
	elem = new cfull_screen_black();
	[[ elem ]]->setup_clientfields(redcallback, greencallback, bluecallback, fadeovertimecallback, var_b046940, var_34291db, var_32445b2);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"full_screen_black"]))
	{
		level.var_ae746e8f[#"full_screen_black"] = array(level.var_ae746e8f[#"full_screen_black"]);
	}
	level.var_ae746e8f[#"full_screen_black"][level.var_ae746e8f[#"full_screen_black"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: full_screen_black
	Checksum: 0x3FA53E4E
	Offset: 0x2C8
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function register_clientside()
{
	elem = new cfull_screen_black();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: full_screen_black
	Checksum: 0xE53FA86
	Offset: 0x308
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
	Namespace: full_screen_black
	Checksum: 0x90D7042
	Offset: 0x330
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
	Namespace: full_screen_black
	Checksum: 0x69C6FE68
	Offset: 0x358
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_red
	Namespace: full_screen_black
	Checksum: 0x9CBC301F
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_red(localclientnum, value)
{
	[[ self ]]->set_red(localclientnum, value);
}

/*
	Name: set_green
	Namespace: full_screen_black
	Checksum: 0x78C01BF8
	Offset: 0x3B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_green(localclientnum, value)
{
	[[ self ]]->set_green(localclientnum, value);
}

/*
	Name: set_blue
	Namespace: full_screen_black
	Checksum: 0x37E6DFC6
	Offset: 0x3E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_fadeovertime
	Namespace: full_screen_black
	Checksum: 0xFF10BF0D
	Offset: 0x410
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeovertime(localclientnum, value)
{
	[[ self ]]->set_fadeovertime(localclientnum, value);
}

/*
	Name: set_startalpha
	Namespace: full_screen_black
	Checksum: 0x70D97531
	Offset: 0x440
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_startalpha(localclientnum, value)
{
	[[ self ]]->set_startalpha(localclientnum, value);
}

/*
	Name: set_endalpha
	Namespace: full_screen_black
	Checksum: 0x102292C6
	Offset: 0x470
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_endalpha(localclientnum, value)
{
	[[ self ]]->set_endalpha(localclientnum, value);
}

/*
	Name: set_drawhud
	Namespace: full_screen_black
	Checksum: 0x6FFB8BD7
	Offset: 0x4A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_drawhud(localclientnum, value)
{
	[[ self ]]->set_drawhud(localclientnum, value);
}

