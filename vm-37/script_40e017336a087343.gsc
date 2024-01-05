#using scripts\core_common\lui_shared.csc;

class cluielemtext : cluielem
{

	/*
		Name: constructor
		Namespace: cluielemtext
		Checksum: 0xA2B9B3A1
		Offset: 0x598
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielemtext
		Checksum: 0x10A5F210
		Offset: 0xBB8
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cluielemtext
		Checksum: 0x338F1705
		Offset: 0x958
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
		Namespace: cluielemtext
		Checksum: 0x50FB04A
		Offset: 0xB80
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
		Namespace: cluielemtext
		Checksum: 0x27B68992
		Offset: 0xAD8
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
		Namespace: cluielemtext
		Checksum: 0x771C9EB9
		Offset: 0xA30
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
		Namespace: cluielemtext
		Checksum: 0x473B868A
		Offset: 0x7C0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("LUIelemText");
	}

	/*
		Name: set_height
		Namespace: cluielemtext
		Checksum: 0xD4C9CF7F
		Offset: 0x9F8
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
		Namespace: cluielemtext
		Checksum: 0xF812D84
		Offset: 0xB10
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
		Namespace: cluielemtext
		Checksum: 0x90909E7E
		Offset: 0x5B8
		Size: 0x1FC
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback)
	{
		cluielem::setup_clientfields("LUIelemText");
		cluielem::add_clientfield("x", 1, 7, "int", ycallback);
		cluielem::add_clientfield("y", 1, 6, "int", heightcallback);
		cluielem::add_clientfield("height", 1, 2, "int", fadeovertimecallback);
		cluielem::add_clientfield("fadeOverTime", 1, 5, "int", alphacallback);
		cluielem::add_clientfield("alpha", 1, 4, "float", redcallback);
		cluielem::add_clientfield("red", 1, 4, "float", greencallback);
		cluielem::add_clientfield("green", 1, 4, "float", bluecallback);
		cluielem::add_clientfield("blue", 1, 4, "float", var_f5852d69);
		cluielem::function_dcb34c80("string", "text", 1);
		cluielem::add_clientfield("horizontal_alignment", 1, 2, "int", horizontal_alignmentcallback);
	}

	/*
		Name: set_y
		Namespace: cluielemtext
		Checksum: 0x9E8BDD23
		Offset: 0x9C0
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
		Namespace: cluielemtext
		Checksum: 0xC355902C
		Offset: 0xA68
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
		Namespace: cluielemtext
		Checksum: 0xDF9DBEBB
		Offset: 0x988
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_x(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "x", value);
	}

	/*
		Name: set_text
		Namespace: cluielemtext
		Checksum: 0x5977415C
		Offset: 0xB48
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_text(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "text", value);
	}

	/*
		Name: set_red
		Namespace: cluielemtext
		Checksum: 0xEC9252C5
		Offset: 0xAA0
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
		Namespace: cluielemtext
		Checksum: 0x9D088C61
		Offset: 0x7E8
		Size: 0x168
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
		[[ self ]]->set_data(localclientnum, "text", #"");
		[[ self ]]->set_data(localclientnum, "horizontal_alignment", 0);
	}

}

#namespace luielemtext;

/*
	Name: register
	Namespace: luielemtext
	Checksum: 0x3122E128
	Offset: 0x128
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback)
{
	elem = new cluielemtext();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielemtext"]))
	{
		level.var_ae746e8f[#"luielemtext"] = array(level.var_ae746e8f[#"luielemtext"]);
	}
	level.var_ae746e8f[#"luielemtext"][level.var_ae746e8f[#"luielemtext"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: luielemtext
	Checksum: 0x4B009C1B
	Offset: 0x300
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cluielemtext();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: luielemtext
	Checksum: 0xCDA40AB7
	Offset: 0x340
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
	Namespace: luielemtext
	Checksum: 0x1DDC9A54
	Offset: 0x368
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
	Namespace: luielemtext
	Checksum: 0xA12C0C24
	Offset: 0x390
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
	Namespace: luielemtext
	Checksum: 0x9F6DDA82
	Offset: 0x3B8
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
	Namespace: luielemtext
	Checksum: 0x66652937
	Offset: 0x3E8
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
	Namespace: luielemtext
	Checksum: 0x53EAA7B
	Offset: 0x418
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
	Namespace: luielemtext
	Checksum: 0xDA05953
	Offset: 0x448
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
	Namespace: luielemtext
	Checksum: 0xE372ECC3
	Offset: 0x478
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
	Namespace: luielemtext
	Checksum: 0x6B983027
	Offset: 0x4A8
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
	Namespace: luielemtext
	Checksum: 0x4CEBD72F
	Offset: 0x4D8
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
	Namespace: luielemtext
	Checksum: 0xE66FE21E
	Offset: 0x508
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_blue(localclientnum, value)
{
	[[ self ]]->set_blue(localclientnum, value);
}

/*
	Name: set_text
	Namespace: luielemtext
	Checksum: 0x2E723E60
	Offset: 0x538
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_text(localclientnum, value)
{
	[[ self ]]->set_text(localclientnum, value);
}

/*
	Name: set_horizontal_alignment
	Namespace: luielemtext
	Checksum: 0x941F71F4
	Offset: 0x568
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(localclientnum, value)
{
	[[ self ]]->set_horizontal_alignment(localclientnum, value);
}

