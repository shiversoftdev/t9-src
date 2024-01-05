#using scripts\core_common\lui_shared.csc;

class cluielembar_ct : cluielem
{

	/*
		Name: constructor
		Namespace: cluielembar_ct
		Checksum: 0xCB39AE69
		Offset: 0x5A8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielembar_ct
		Checksum: 0xD20CA314
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
		Namespace: cluielembar_ct
		Checksum: 0x3381D018
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
		Namespace: cluielembar_ct
		Checksum: 0x4FE2091A
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
		Namespace: cluielembar_ct
		Checksum: 0x47AA5CCD
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
		Namespace: cluielembar_ct
		Checksum: 0x816CE809
		Offset: 0x7D0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("LUIelemBar_ct");
	}

	/*
		Name: set_height
		Namespace: cluielembar_ct
		Checksum: 0xFE4EF5FE
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
		Name: set_blue
		Namespace: cluielembar_ct
		Checksum: 0xB8B92527
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
		Namespace: cluielembar_ct
		Checksum: 0xA101E984
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
		Namespace: cluielembar_ct
		Checksum: 0x1445A8C8
		Offset: 0x5C8
		Size: 0x1FC
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5)
	{
		cluielem::setup_clientfields("LUIelemBar_ct");
		cluielem::add_clientfield("x", 1, 7, "int", xcallback);
		cluielem::add_clientfield("y", 1, 6, "int", ycallback);
		cluielem::add_clientfield("width", 1, 6, "int", widthcallback);
		cluielem::add_clientfield("height", 1, 6, "int", heightcallback);
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int", fadeovertimecallback);
		cluielem::add_clientfield("alpha", 1, 4, "float", alphacallback);
		cluielem::add_clientfield("red", 1, 4, "float", redcallback);
		cluielem::add_clientfield("green", 1, 4, "float", greencallback);
		cluielem::add_clientfield("blue", 1, 4, "float", bluecallback);
		cluielem::add_clientfield("bar_percent", 1, 6, "float", var_661989d5);
	}

	/*
		Name: set_y
		Namespace: cluielembar_ct
		Checksum: 0xBC0DD6A2
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
		Namespace: cluielembar_ct
		Checksum: 0xFC9F2A2A
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
		Namespace: cluielembar_ct
		Checksum: 0x14679D66
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
		Namespace: cluielembar_ct
		Checksum: 0x827BD74F
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
		Namespace: cluielembar_ct
		Checksum: 0x2449DA85
		Offset: 0x7F8
		Size: 0x164
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
		[[ self ]]->set_data(localclientnum, "bar_percent", 0);
	}

	/*
		Name: set_bar_percent
		Namespace: cluielembar_ct
		Checksum: 0x22F519F2
		Offset: 0xB90
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_bar_percent(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bar_percent", value);
	}

}

#namespace luielembar_ct;

/*
	Name: function_9d2ffc
	Namespace: luielembar_ct
	Checksum: 0x364CD73B
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9d2ffc()
{
	level notify(1440592069);
}

/*
	Name: register
	Namespace: luielembar_ct
	Checksum: 0x679828B2
	Offset: 0x138
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5)
{
	elem = new cluielembar_ct();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar_ct"]))
	{
		level.var_ae746e8f[#"luielembar_ct"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar_ct"]))
	{
		level.var_ae746e8f[#"luielembar_ct"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielembar_ct"]))
	{
		level.var_ae746e8f[#"luielembar_ct"] = array(level.var_ae746e8f[#"luielembar_ct"]);
	}
	level.var_ae746e8f[#"luielembar_ct"][level.var_ae746e8f[#"luielembar_ct"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: luielembar_ct
	Checksum: 0x9D42473F
	Offset: 0x310
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cluielembar_ct();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: luielembar_ct
	Checksum: 0x19478C4E
	Offset: 0x350
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
	Namespace: luielembar_ct
	Checksum: 0x8A5D6F94
	Offset: 0x378
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
	Namespace: luielembar_ct
	Checksum: 0x7F38FA4B
	Offset: 0x3A0
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
	Namespace: luielembar_ct
	Checksum: 0x55093B1F
	Offset: 0x3C8
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
	Namespace: luielembar_ct
	Checksum: 0xA866CBCD
	Offset: 0x3F8
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
	Namespace: luielembar_ct
	Checksum: 0x925049B6
	Offset: 0x428
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
	Namespace: luielembar_ct
	Checksum: 0xDC3D2238
	Offset: 0x458
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
	Namespace: luielembar_ct
	Checksum: 0xBC4FE27C
	Offset: 0x488
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
	Namespace: luielembar_ct
	Checksum: 0x74A758BC
	Offset: 0x4B8
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
	Namespace: luielembar_ct
	Checksum: 0xA3C20647
	Offset: 0x4E8
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
	Namespace: luielembar_ct
	Checksum: 0x101EE8DC
	Offset: 0x518
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
	Namespace: luielembar_ct
	Checksum: 0xAD9B715B
	Offset: 0x548
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_bar_percent
	Namespace: luielembar_ct
	Checksum: 0x9977170C
	Offset: 0x578
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(localclientnum, value)
{
	[[ self ]]->set_bar_percent(localclientnum, value);
}

