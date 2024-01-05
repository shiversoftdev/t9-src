#using scripts\core_common\lui_shared.csc;

class cluielemimage : cluielem
{

	/*
		Name: constructor
		Namespace: cluielemimage
		Checksum: 0xF8FD9DA9
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
		Namespace: cluielemimage
		Checksum: 0x4455FB23
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
		Namespace: cluielemimage
		Checksum: 0x238FC31
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
		Namespace: cluielemimage
		Checksum: 0x4688B5FD
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
		Namespace: cluielemimage
		Checksum: 0xB7F58C19
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
		Namespace: cluielemimage
		Checksum: 0xCFDC3E57
		Offset: 0x7A8
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
		Checksum: 0xDA0A2624
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
		Name: set_material
		Namespace: cluielemimage
		Checksum: 0x1490757F
		Offset: 0xB70
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
		Checksum: 0x2E317EE3
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
		Namespace: cluielemimage
		Checksum: 0x46707AD3
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
		Namespace: cluielemimage
		Checksum: 0x127307B1
		Offset: 0x5A0
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
		Checksum: 0xB686601D
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
		Namespace: cluielemimage
		Checksum: 0xEEC7D6AA
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
		Namespace: cluielemimage
		Checksum: 0x9E27D50E
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
		Namespace: cluielemimage
		Checksum: 0x1498F82B
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
		Namespace: cluielemimage
		Checksum: 0xD4408A8A
		Offset: 0x7D0
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
	Name: register
	Namespace: luielemimage
	Checksum: 0x206FEB6B
	Offset: 0x110
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
	Checksum: 0xCAD0FAF8
	Offset: 0x2E8
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
	Checksum: 0xFBE41D0
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
	Namespace: luielemimage
	Checksum: 0x356FF80F
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
	Namespace: luielemimage
	Checksum: 0xB1B73A57
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
	Namespace: luielemimage
	Checksum: 0xF55221F9
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
	Namespace: luielemimage
	Checksum: 0xB81A9868
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
	Name: set_width
	Namespace: luielemimage
	Checksum: 0x56DF7BA
	Offset: 0x400
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
	Checksum: 0x79EABADC
	Offset: 0x430
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
	Checksum: 0xE5EF2C9
	Offset: 0x460
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
	Checksum: 0x4BEDDD41
	Offset: 0x490
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
	Checksum: 0xD621DD14
	Offset: 0x4C0
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
	Checksum: 0xC3AC5426
	Offset: 0x4F0
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
	Checksum: 0xF4AC12DD
	Offset: 0x520
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
	Checksum: 0x6D80A617
	Offset: 0x550
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_material(localclientnum, value)
{
	[[ self ]]->set_material(localclientnum, value);
}

