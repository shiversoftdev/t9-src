#using scripts\core_common\lui_shared.csc;

class class_1beae0 : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_1beae0
		Checksum: 0x7F79F5D6
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
		Namespace: namespace_1beae0
		Checksum: 0x60A7062F
		Offset: 0xA28
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
		Checksum: 0x6291D5A3
		Offset: 0x7C8
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
		Checksum: 0x9BDCCFB6
		Offset: 0x9F0
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
		Checksum: 0xE01984A8
		Offset: 0x948
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
		Checksum: 0xE8CC512A
		Offset: 0x8A0
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
		Checksum: 0xF8951407
		Offset: 0x638
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
		Checksum: 0xBD64ABF6
		Offset: 0x9B8
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
		Checksum: 0x48183A5A
		Offset: 0x868
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
		Checksum: 0x5E2BABCB
		Offset: 0x980
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
		Checksum: 0xC1B1E97C
		Offset: 0x5C0
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
		Checksum: 0xD6378358
		Offset: 0x830
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
		Checksum: 0x2E4B5EBB
		Offset: 0x8D8
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
		Checksum: 0x93948C35
		Offset: 0x7F8
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
		Checksum: 0x277778E8
		Offset: 0x910
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
		Checksum: 0x8807207D
		Offset: 0x660
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
	Name: function_3350ccaf
	Namespace: luielemcounter
	Checksum: 0xB102D54E
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3350ccaf()
{
	level notify(124192582);
}

/*
	Name: register
	Namespace: luielemcounter
	Checksum: 0xA4E1D047
	Offset: 0x130
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
	Checksum: 0x8F29499D
	Offset: 0x308
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
	Checksum: 0x6E172AB4
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
	Namespace: luielemcounter
	Checksum: 0xDCAD857B
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
	Namespace: luielemcounter
	Checksum: 0x76583747
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
	Namespace: luielemcounter
	Checksum: 0x4F34982F
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
	Namespace: luielemcounter
	Checksum: 0xAB529143
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
	Name: set_height
	Namespace: luielemcounter
	Checksum: 0xC1C42419
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
	Namespace: luielemcounter
	Checksum: 0xE4A5D775
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
	Namespace: luielemcounter
	Checksum: 0xC66C4E3B
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
	Namespace: luielemcounter
	Checksum: 0xDCDD2031
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
	Namespace: luielemcounter
	Checksum: 0x6722FC30
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
	Namespace: luielemcounter
	Checksum: 0xAEC423D0
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
	Name: set_number
	Namespace: luielemcounter
	Checksum: 0x14041458
	Offset: 0x540
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
	Checksum: 0xC98C75AD
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(localclientnum, value)
{
	[[ self ]]->set_horizontal_alignment(localclientnum, value);
}

