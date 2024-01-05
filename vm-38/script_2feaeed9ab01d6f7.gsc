#using scripts\core_common\lui_shared.csc;

class cfull_screen_black : cluielem
{

	/*
		Name: constructor
		Namespace: cfull_screen_black
		Checksum: 0x6087E2FF
		Offset: 0x4F0
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
		Checksum: 0xC13C2E7B
		Offset: 0x980
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
		Checksum: 0x5233AF94
		Offset: 0x910
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
		Checksum: 0x1E40A403
		Offset: 0x7C8
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
		Checksum: 0x5AFE5DB5
		Offset: 0x830
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
		Checksum: 0x8C0150E4
		Offset: 0x8A0
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
		Checksum: 0x947C154E
		Offset: 0x688
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
		Checksum: 0x67CFE0DE
		Offset: 0x868
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
		Checksum: 0xF169FCB6
		Offset: 0x510
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
		Checksum: 0x9862E18D
		Offset: 0x8D8
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
		Checksum: 0x2CFBE81C
		Offset: 0x948
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
		Checksum: 0x6165FBDF
		Offset: 0x7F8
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
		Checksum: 0xA0B46827
		Offset: 0x6B0
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
	Name: function_67a01b4b
	Namespace: full_screen_black
	Checksum: 0xB40B7DDF
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_67a01b4b()
{
	level notify(526038684);
}

/*
	Name: register
	Namespace: full_screen_black
	Checksum: 0x44EEAE77
	Offset: 0x128
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
	Checksum: 0x9D65E6BC
	Offset: 0x2E8
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
	Checksum: 0xD3A3A02F
	Offset: 0x328
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
	Checksum: 0xC2853311
	Offset: 0x350
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
	Checksum: 0xB8810DB7
	Offset: 0x378
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
	Checksum: 0x7C92FCC5
	Offset: 0x3A0
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
	Checksum: 0x2B68F8A6
	Offset: 0x3D0
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
	Checksum: 0xC96BCD26
	Offset: 0x400
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
	Checksum: 0x113464FF
	Offset: 0x430
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
	Checksum: 0x4EF9E405
	Offset: 0x460
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
	Checksum: 0xB5285A65
	Offset: 0x490
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
	Checksum: 0xD61B3E86
	Offset: 0x4C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_drawhud(localclientnum, value)
{
	[[ self ]]->set_drawhud(localclientnum, value);
}

