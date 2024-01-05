#using scripts\core_common\lui_shared.csc;

class cluielembar_ct : cluielem
{

	/*
		Name: constructor
		Namespace: cluielembar_ct
		Checksum: 0xA2B9B3A1
		Offset: 0x588
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
		Checksum: 0xDDABEB8B
		Offset: 0xBA8
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
		Checksum: 0xE1990972
		Offset: 0x948
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
		Checksum: 0x90B2A911
		Offset: 0xB00
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
		Checksum: 0x3FFD4E68
		Offset: 0xA58
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
		Checksum: 0xE376E4BF
		Offset: 0x7B0
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
		Checksum: 0x2E335C0D
		Offset: 0xA20
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
		Checksum: 0x1CE1756A
		Offset: 0xB38
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
		Checksum: 0x8E3ADE38
		Offset: 0x9E8
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
		Checksum: 0xBEB0952A
		Offset: 0x5A8
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
		Checksum: 0xE9BC68AD
		Offset: 0x9B0
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
		Checksum: 0xD177737D
		Offset: 0xA90
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
		Checksum: 0xA61A28C5
		Offset: 0x978
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
		Checksum: 0x7FD0B237
		Offset: 0xAC8
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
		Checksum: 0xCE95CBAA
		Offset: 0x7D8
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
		Checksum: 0xEA1AD274
		Offset: 0xB70
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
	Name: register
	Namespace: luielembar_ct
	Checksum: 0x203E7B25
	Offset: 0x118
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
	Checksum: 0xCB4E440
	Offset: 0x2F0
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
	Checksum: 0xCDA40AB7
	Offset: 0x330
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
	Checksum: 0x1DDC9A54
	Offset: 0x358
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
	Checksum: 0xA12C0C24
	Offset: 0x380
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
	Checksum: 0x9F6DDA82
	Offset: 0x3A8
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
	Checksum: 0x66652937
	Offset: 0x3D8
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
	Checksum: 0xFE67FA08
	Offset: 0x408
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
	Checksum: 0x1D454E91
	Offset: 0x438
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
	Checksum: 0xE86EFC89
	Offset: 0x468
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
	Checksum: 0xDEB4E37B
	Offset: 0x498
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
	Checksum: 0xA022129
	Offset: 0x4C8
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
	Checksum: 0x3E655BC7
	Offset: 0x4F8
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
	Checksum: 0x421F6CFA
	Offset: 0x528
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
	Checksum: 0xEC53D4C8
	Offset: 0x558
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bar_percent(localclientnum, value)
{
	[[ self ]]->set_bar_percent(localclientnum, value);
}

