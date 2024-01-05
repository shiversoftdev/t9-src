#using scripts\core_common\lui_shared.csc;

class cluielemimage : cluielem
{

	/*
		Name: constructor
		Namespace: cluielemimage
		Checksum: 0xE584B148
		Offset: 0x5A0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielemimage
		Checksum: 0x4BCEB41C
		Offset: 0xBC8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cluielemimage
		Checksum: 0x38DC5A7A
		Offset: 0x968
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_green
		Namespace: cluielemimage
		Checksum: 0x6E7DFEDA
		Offset: 0xB20
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_green(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "green", value);
	}

	/*
		Name: set_fadeovertime
		Namespace: cluielemimage
		Checksum: 0xB4854575
		Offset: 0xA78
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_fadeovertime(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "fadeOverTime", value);
	}

	/*
		Name: register_clientside
		Namespace: cluielemimage
		Checksum: 0xADB2BEE4
		Offset: 0x7C8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("LUIelemImage");
	}

	/*
		Name: set_height
		Namespace: cluielemimage
		Checksum: 0x4C1520A5
		Offset: 0xA40
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_height(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "height", value);
	}

	/*
		Name: set_material
		Namespace: cluielemimage
		Checksum: 0x4F485175
		Offset: 0xB90
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_material(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "material", value);
	}

	/*
		Name: set_blue
		Namespace: cluielemimage
		Checksum: 0x364D6F57
		Offset: 0xB58
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_blue(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "blue", value);
	}

	/*
		Name: set_width
		Namespace: cluielemimage
		Checksum: 0x4255DEFF
		Offset: 0xA08
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_width(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "width", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cluielemimage
		Checksum: 0x9125D2EA
		Offset: 0x5C0
		Size: 0x1FC
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_e6b6b84b)
	{
		cluielem::setup_clientfields("LUIelemImage");
		cluielem::add_clientfield("x", 1, 7, "int", ycallback);
		cluielem::add_clientfield("y", 1, 6, "int", widthcallback);
		cluielem::add_clientfield("width", 1, 6, "int", heightcallback);
		cluielem::add_clientfield("height", 1, 6, "int", fadeovertimecallback);
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int", alphacallback);
		cluielem::add_clientfield("alpha", 1, 4, "float", redcallback);
		cluielem::add_clientfield("red", 1, 4, "float", greencallback);
		cluielem::add_clientfield("green", 1, 4, "float", bluecallback);
		cluielem::add_clientfield("blue", 1, 4, "float", var_e6b6b84b);
		cluielem::function_dcb34c80("material", "material", 1);
	}

	/*
		Name: set_y
		Namespace: cluielemimage
		Checksum: 0x49EFC37F
		Offset: 0x9D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_y(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "y", value);
	}

	/*
		Name: set_alpha
		Namespace: cluielemimage
		Checksum: 0xFAB89AF
		Offset: 0xAB0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_alpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "alpha", value);
	}

	/*
		Name: set_x
		Namespace: cluielemimage
		Checksum: 0x769C5B64
		Offset: 0x998
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "x", value);
	}

	/*
		Name: set_red
		Namespace: cluielemimage
		Checksum: 0xABF13E53
		Offset: 0xAE8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_red(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "red", value);
	}

	/*
		Name: function_fa582112
		Namespace: cluielemimage
		Checksum: 0x37C59C31
		Offset: 0x7F0
		Size: 0x16C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "x", 0);
		[[ self ]]->set_data(localclientnum, "y", 0);
		[[ self ]]->set_data(localclientnum, "width", 0);
		[[ self ]]->set_data(localclientnum, "height", 0);
		[[ self ]]->set_data(localclientnum, "fadeOverTime", 0);
		[[ self ]]->set_data(localclientnum, "alpha", 0);
		[[ self ]]->set_data(localclientnum, "red", 0);
		[[ self ]]->set_data(localclientnum, "green", 0);
		[[ self ]]->set_data(localclientnum, "blue", 0);
		[[ self ]]->set_data(localclientnum, "material", #"");
	}

}

#namespace luielemimage;

/*
	Name: function_17117bd2
	Namespace: luielemimage
	Checksum: 0xF60A63D3
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_17117bd2()
{
	level notify(1283685884);
}

/*
	Name: register
	Namespace: luielemimage
	Checksum: 0x5B81AD06
	Offset: 0x130
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_e6b6b84b)
{
	elem = new cluielemimage();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_e6b6b84b);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielemimage"]))
	{
		level.var_ae746e8f[#"luielemimage"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielemimage"]))
	{
		level.var_ae746e8f[#"luielemimage"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielemimage"]))
	{
		level.var_ae746e8f[#"luielemimage"] = array(level.var_ae746e8f[#"luielemimage"]);
	}
	level.var_ae746e8f[#"luielemimage"][level.var_ae746e8f[#"luielemimage"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: luielemimage
	Checksum: 0xB5A703A3
	Offset: 0x308
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cluielemimage();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: luielemimage
	Checksum: 0x4281783D
	Offset: 0x348
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
	Namespace: luielemimage
	Checksum: 0xD3BDF75D
	Offset: 0x370
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
	Namespace: luielemimage
	Checksum: 0xC950B86E
	Offset: 0x398
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_x
	Namespace: luielemimage
	Checksum: 0xA6D3B518
	Offset: 0x3C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_x(localclientnum, value)
{
	[[ self ]]->set_x(localclientnum, value);
}

/*
	Name: set_y
	Namespace: luielemimage
	Checksum: 0x29D46422
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(localclientnum, value)
{
	[[ self ]]->set_y(localclientnum, value);
}

/*
	Name: set_width
	Namespace: luielemimage
	Checksum: 0xDD11AD48
	Offset: 0x420
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_width(localclientnum, value)
{
	[[ self ]]->set_width(localclientnum, value);
}

/*
	Name: set_height
	Namespace: luielemimage
	Checksum: 0xE6BA06B7
	Offset: 0x450
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_height(localclientnum, value)
{
	[[ self ]]->set_height(localclientnum, value);
}

/*
	Name: set_fadeovertime
	Namespace: luielemimage
	Checksum: 0xA66DFAA9
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_fadeovertime(localclientnum, value)
{
	[[ self ]]->set_fadeovertime(localclientnum, value);
}

/*
	Name: set_alpha
	Namespace: luielemimage
	Checksum: 0xDDD1E13C
	Offset: 0x4B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_alpha(localclientnum, value)
{
	[[ self ]]->set_alpha(localclientnum, value);
}

/*
	Name: set_red
	Namespace: luielemimage
	Checksum: 0x1938C932
	Offset: 0x4E0
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
	Namespace: luielemimage
	Checksum: 0x505BBF9
	Offset: 0x510
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
	Namespace: luielemimage
	Checksum: 0x8AACFA5E
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_material
	Namespace: luielemimage
	Checksum: 0xAB463992
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_material(localclientnum, value)
{
	[[ self ]]->set_material(localclientnum, value);
}

