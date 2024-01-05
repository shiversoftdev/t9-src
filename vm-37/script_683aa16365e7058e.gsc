#using scripts\core_common\lui_shared.csc;

class class_1beae0 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_1beae0
		Checksum: 0x858E9BF1
		Offset: 0x580
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1beae0
		Checksum: 0x20608B37
		Offset: 0xA08
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1beae0
		Checksum: 0x701DB611
		Offset: 0x7A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_horizontal_alignment
		Namespace: namespace_1beae0
		Checksum: 0x8DD45A6
		Offset: 0x9D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_horizontal_alignment(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "horizontal_alignment", value);
	}

	/*
		Name: set_green
		Namespace: namespace_1beae0
		Checksum: 0x88159AD3
		Offset: 0x928
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
		Namespace: namespace_1beae0
		Checksum: 0x3FED28CF
		Offset: 0x880
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
		Namespace: namespace_1beae0
		Checksum: 0x99DC98AD
		Offset: 0x618
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("LUIelemCounter");
	}

	/*
		Name: set_number
		Namespace: namespace_1beae0
		Checksum: 0x90EB26D4
		Offset: 0x998
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_number(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "number", value);
	}

	/*
		Name: set_height
		Namespace: namespace_1beae0
		Checksum: 0x5553DE79
		Offset: 0x848
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
		Namespace: namespace_1beae0
		Checksum: 0x4E1EE4A0
		Offset: 0x960
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_blue(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "blue", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_1beae0
		Checksum: 0x6212330C
		Offset: 0x5A0
		Size: 0x6C
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_4cf01ed6, horizontal_alignmentcallback)
	{
		cluielem::setup_clientfields("LUIelemCounter");
	}

	/*
		Name: set_y
		Namespace: namespace_1beae0
		Checksum: 0xA62A3772
		Offset: 0x810
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
		Namespace: namespace_1beae0
		Checksum: 0xCF9E5BCE
		Offset: 0x8B8
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
		Namespace: namespace_1beae0
		Checksum: 0xC5EB8983
		Offset: 0x7D8
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
		Namespace: namespace_1beae0
		Checksum: 0x4994F238
		Offset: 0x8F0
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
		Namespace: namespace_1beae0
		Checksum: 0x9720E424
		Offset: 0x640
		Size: 0x15C
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "x", 0);
		[[ self ]]->set_data(localclientnum, "y", 0);
		[[ self ]]->set_data(localclientnum, "height", 0);
		[[ self ]]->set_data(localclientnum, "fadeOverTime", 0);
		[[ self ]]->set_data(localclientnum, "alpha", 0);
		[[ self ]]->set_data(localclientnum, "red", 0);
		[[ self ]]->set_data(localclientnum, "green", 0);
		[[ self ]]->set_data(localclientnum, "blue", 0);
		[[ self ]]->set_data(localclientnum, "number", 0);
		[[ self ]]->set_data(localclientnum, "horizontal_alignment", 0);
	}

}

#namespace luielemcounter;

/*
	Name: register
	Namespace: luielemcounter
	Checksum: 0x3DB8DAF3
	Offset: 0x110
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_4cf01ed6, horizontal_alignmentcallback)
{
	elem = new class_1beae0();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_4cf01ed6, horizontal_alignmentcallback);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielemcounter"]))
	{
		level.var_ae746e8f[#"luielemcounter"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielemcounter"]))
	{
		level.var_ae746e8f[#"luielemcounter"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielemcounter"]))
	{
		level.var_ae746e8f[#"luielemcounter"] = array(level.var_ae746e8f[#"luielemcounter"]);
	}
	level.var_ae746e8f[#"luielemcounter"][level.var_ae746e8f[#"luielemcounter"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: luielemcounter
	Checksum: 0x7BFB40A
	Offset: 0x2E8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_1beae0();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: luielemcounter
	Checksum: 0xCF869179
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
	Namespace: luielemcounter
	Checksum: 0xCD24B25A
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
	Namespace: luielemcounter
	Checksum: 0x41A98A5A
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
	Name: set_x
	Namespace: luielemcounter
	Checksum: 0x39D4BBEB
	Offset: 0x3A0
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
	Namespace: luielemcounter
	Checksum: 0x45AB1F2D
	Offset: 0x3D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_y(localclientnum, value)
{
	[[ self ]]->set_y(localclientnum, value);
}

/*
	Name: set_height
	Namespace: luielemcounter
	Checksum: 0xE0130F1E
	Offset: 0x400
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
	Namespace: luielemcounter
	Checksum: 0x55E32BBC
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
	Name: set_alpha
	Namespace: luielemcounter
	Checksum: 0x4A1D2E49
	Offset: 0x460
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
	Namespace: luielemcounter
	Checksum: 0x80ADF1E1
	Offset: 0x490
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
	Namespace: luielemcounter
	Checksum: 0xA01504D5
	Offset: 0x4C0
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
	Namespace: luielemcounter
	Checksum: 0xEDEC4D2B
	Offset: 0x4F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_number
	Namespace: luielemcounter
	Checksum: 0x1A2B4618
	Offset: 0x520
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_number(localclientnum, value)
{
	[[ self ]]->set_number(localclientnum, value);
}

/*
	Name: set_horizontal_alignment
	Namespace: luielemcounter
	Checksum: 0xDB362F34
	Offset: 0x550
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(localclientnum, value)
{
	[[ self ]]->set_horizontal_alignment(localclientnum, value);
}

