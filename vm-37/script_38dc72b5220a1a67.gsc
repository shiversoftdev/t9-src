#using scripts\core_common\lui_shared.csc;

class cluielembar : cluielem
{

	/*
		Name: constructor
		Namespace: cluielembar
		Checksum: 0x6CF30369
		Offset: 0x570
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielembar
		Checksum: 0xE7E7F1EB
		Offset: 0xA00
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cluielembar
		Checksum: 0x73E6A6BB
		Offset: 0x7A0
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
		Namespace: cluielembar
		Checksum: 0xB2BDF43F
		Offset: 0x958
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
		Namespace: cluielembar
		Checksum: 0xE1C9C00E
		Offset: 0x8B0
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
		Namespace: cluielembar
		Checksum: 0x1857F2CB
		Offset: 0x608
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("LUIelemBar");
	}

	/*
		Name: set_height
		Namespace: cluielembar
		Checksum: 0x5ACED11E
		Offset: 0x878
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
		Namespace: cluielembar
		Checksum: 0x13D35457
		Offset: 0x990
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
		Namespace: cluielembar
		Checksum: 0x8DBAA2FD
		Offset: 0x840
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
		Namespace: cluielembar
		Checksum: 0xC6555FA4
		Offset: 0x590
		Size: 0x6C
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5)
	{
		cluielem::setup_clientfields("LUIelemBar");
	}

	/*
		Name: set_y
		Namespace: cluielembar
		Checksum: 0x2E46BD7D
		Offset: 0x808
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
		Namespace: cluielembar
		Checksum: 0xFEC25C59
		Offset: 0x8E8
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
		Namespace: cluielembar
		Checksum: 0x29D98078
		Offset: 0x7D0
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
		Namespace: cluielembar
		Checksum: 0x6AADE64C
		Offset: 0x920
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
		Namespace: cluielembar
		Checksum: 0xE5B912AF
		Offset: 0x630
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
		Namespace: cluielembar
		Checksum: 0xC9EEA83B
		Offset: 0x9C8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_bar_percent(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bar_percent", value);
	}

}

#namespace luielembar;

/*
	Name: register
	Namespace: luielembar
	Checksum: 0x9AF4839C
	Offset: 0x100
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5)
{
	elem = new cluielembar();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_661989d5);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar"]))
	{
		level.var_ae746e8f[#"luielembar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielembar"]))
	{
		level.var_ae746e8f[#"luielembar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielembar"]))
	{
		level.var_ae746e8f[#"luielembar"] = array(level.var_ae746e8f[#"luielembar"]);
	}
	level.var_ae746e8f[#"luielembar"][level.var_ae746e8f[#"luielembar"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: luielembar
	Checksum: 0x4ED5276A
	Offset: 0x2D8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cluielembar();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: luielembar
	Checksum: 0x5D4E59B1
	Offset: 0x318
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
	Namespace: luielembar
	Checksum: 0xFF8E026A
	Offset: 0x340
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
	Namespace: luielembar
	Checksum: 0x3622AE8C
	Offset: 0x368
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
	Namespace: luielembar
	Checksum: 0x464E3DD
	Offset: 0x390
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
	Namespace: luielembar
	Checksum: 0x35678B8D
	Offset: 0x3C0
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
	Namespace: luielembar
	Checksum: 0x3155583B
	Offset: 0x3F0
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
	Namespace: luielembar
	Checksum: 0x41D43E26
	Offset: 0x420
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
	Namespace: luielembar
	Checksum: 0xDFED0A69
	Offset: 0x450
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
	Namespace: luielembar
	Checksum: 0xD5F56FBC
	Offset: 0x480
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
	Namespace: luielembar
	Checksum: 0x3FB2838D
	Offset: 0x4B0
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
	Namespace: luielembar
	Checksum: 0x3F82CC93
	Offset: 0x4E0
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
	Namespace: luielembar
	Checksum: 0xE09FD7AA
	Offset: 0x510
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
	Namespace: luielembar
	Checksum: 0x38D32DD
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(localclientnum, value)
{
	[[ self ]]->set_bar_percent(localclientnum, value);
}

