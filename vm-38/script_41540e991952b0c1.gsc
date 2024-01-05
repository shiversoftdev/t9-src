#using scripts\core_common\lui_shared.csc;

class class_1bec696c : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_1bec696c
		Checksum: 0x92A38ACD
		Offset: 0x8A8
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_1bec696c
		Checksum: 0x1C3A9DD0
		Offset: 0xF58
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_1bec696c
		Checksum: 0xC4B3847B
		Offset: 0xCC0
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
		Namespace: namespace_1bec696c
		Checksum: 0xF3E41105
		Offset: 0xEE8
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
		Namespace: namespace_1bec696c
		Checksum: 0xAF8E6741
		Offset: 0xE40
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
		Namespace: namespace_1bec696c
		Checksum: 0xA1ACE05E
		Offset: 0xD98
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
		Namespace: namespace_1bec696c
		Checksum: 0x7E784550
		Offset: 0xB00
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("DOA_BannerElement");
	}

	/*
		Name: set_height
		Namespace: namespace_1bec696c
		Checksum: 0xBD29C85F
		Offset: 0xD60
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
		Namespace: namespace_1bec696c
		Checksum: 0xC5DDD315
		Offset: 0xE78
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
		Namespace: namespace_1bec696c
		Checksum: 0xA7FE1ED2
		Offset: 0x8C8
		Size: 0x22C
		Parameters: 11
		Flags: None
	*/
	function setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_766e2bbb)
	{
		cluielem::setup_clientfields("DOA_BannerElement");
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
		cluielem::add_clientfield("scale", 1, 6, "float", var_766e2bbb);
	}

	/*
		Name: set_y
		Namespace: namespace_1bec696c
		Checksum: 0xB408AE44
		Offset: 0xD28
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
		Namespace: namespace_1bec696c
		Checksum: 0xFFD5411A
		Offset: 0xDD0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_alpha(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "alpha", value);
	}

	/*
		Name: set_scale
		Namespace: namespace_1bec696c
		Checksum: 0xF5330A6
		Offset: 0xF20
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_scale(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "scale", value);
	}

	/*
		Name: set_x
		Namespace: namespace_1bec696c
		Checksum: 0xC686EF89
		Offset: 0xCF0
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
		Namespace: namespace_1bec696c
		Checksum: 0xD9030D66
		Offset: 0xEB0
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
		Namespace: namespace_1bec696c
		Checksum: 0xC9A0DF10
		Offset: 0xE08
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
		Namespace: namespace_1bec696c
		Checksum: 0xDD213272
		Offset: 0xB28
		Size: 0x18C
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
		[[ self ]]->set_data(localclientnum, "scale", 0);
	}

}

#namespace doa_bannerelement;

/*
	Name: function_78bcc330
	Namespace: doa_bannerelement
	Checksum: 0xCC4F6F09
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_78bcc330()
{
	level notify(416944008);
}

/*
	Name: set_color
	Namespace: doa_bannerelement
	Checksum: 0x7C4BF32D
	Offset: 0x158
	Size: 0x6C
	Parameters: 4
	Flags: None
*/
function set_color(localclientnum, red, green, blue)
{
	self set_red(localclientnum, red);
	self set_green(localclientnum, green);
	self set_blue(localclientnum, blue);
}

/*
	Name: fade
	Namespace: doa_bannerelement
	Checksum: 0x845E28E2
	Offset: 0x1D0
	Size: 0x7C
	Parameters: 3
	Flags: None
*/
function fade(localclientnum, var_1a92607f, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self set_alpha(localclientnum, var_1a92607f);
	self set_fadeovertime(localclientnum, int(duration * 10));
}

/*
	Name: show
	Namespace: doa_bannerelement
	Checksum: 0xD2D67AE
	Offset: 0x258
	Size: 0x44
	Parameters: 2
	Flags: None
*/
function show(localclientnum, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(localclientnum, 1, duration);
}

/*
	Name: hide
	Namespace: doa_bannerelement
	Checksum: 0xC4CE9BA5
	Offset: 0x2A8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function hide(localclientnum, duration)
{
	if(!isdefined(duration))
	{
		duration = 0;
	}
	self fade(localclientnum, 0, duration);
}

/*
	Name: function_e5898fd7
	Namespace: doa_bannerelement
	Checksum: 0x8DF686DF
	Offset: 0x2F0
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_e5898fd7(localclientnum, var_c6572d9b)
{
	self set_x(localclientnum, int(var_c6572d9b / 15));
}

/*
	Name: function_58a135d3
	Namespace: doa_bannerelement
	Checksum: 0x57A18456
	Offset: 0x348
	Size: 0x4C
	Parameters: 2
	Flags: None
*/
function function_58a135d3(localclientnum, var_d390c80e)
{
	self set_y(localclientnum, int(var_d390c80e / 15));
}

/*
	Name: function_f97e9049
	Namespace: doa_bannerelement
	Checksum: 0x36C72911
	Offset: 0x3A0
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_f97e9049(localclientnum, var_c6572d9b, var_d390c80e)
{
	self function_e5898fd7(localclientnum, var_c6572d9b);
	self function_58a135d3(localclientnum, var_d390c80e);
}

/*
	Name: register
	Namespace: doa_bannerelement
	Checksum: 0x2BCEAB7B
	Offset: 0x3F8
	Size: 0x1DE
	Parameters: 11
	Flags: None
*/
function register(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_766e2bbb)
{
	elem = new class_1bec696c();
	[[ elem ]]->setup_clientfields(xcallback, ycallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, var_f5852d69, horizontal_alignmentcallback, var_766e2bbb);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"doa_bannerelement"]))
	{
		level.var_ae746e8f[#"doa_bannerelement"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"doa_bannerelement"]))
	{
		level.var_ae746e8f[#"doa_bannerelement"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"doa_bannerelement"]))
	{
		level.var_ae746e8f[#"doa_bannerelement"] = array(level.var_ae746e8f[#"doa_bannerelement"]);
	}
	level.var_ae746e8f[#"doa_bannerelement"][level.var_ae746e8f[#"doa_bannerelement"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: doa_bannerelement
	Checksum: 0x16F3CD3B
	Offset: 0x5E0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_1bec696c();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: doa_bannerelement
	Checksum: 0x560D6933
	Offset: 0x620
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
	Namespace: doa_bannerelement
	Checksum: 0xF84431B4
	Offset: 0x648
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
	Namespace: doa_bannerelement
	Checksum: 0xB4B6BCE2
	Offset: 0x670
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
	Namespace: doa_bannerelement
	Checksum: 0xC95F6BA8
	Offset: 0x698
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
	Namespace: doa_bannerelement
	Checksum: 0xDB7A72FB
	Offset: 0x6C8
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
	Namespace: doa_bannerelement
	Checksum: 0xD235511E
	Offset: 0x6F8
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
	Namespace: doa_bannerelement
	Checksum: 0xEC9DFB92
	Offset: 0x728
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
	Namespace: doa_bannerelement
	Checksum: 0x1C14A7BD
	Offset: 0x758
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
	Namespace: doa_bannerelement
	Checksum: 0x845E920
	Offset: 0x788
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
	Namespace: doa_bannerelement
	Checksum: 0x56265ADD
	Offset: 0x7B8
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
	Namespace: doa_bannerelement
	Checksum: 0xE850FB34
	Offset: 0x7E8
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
	Namespace: doa_bannerelement
	Checksum: 0xC8A5FC9B
	Offset: 0x818
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
	Namespace: doa_bannerelement
	Checksum: 0x3B02F576
	Offset: 0x848
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_horizontal_alignment(localclientnum, value)
{
	[[ self ]]->set_horizontal_alignment(localclientnum, value);
}

/*
	Name: set_scale
	Namespace: doa_bannerelement
	Checksum: 0x7C8170EF
	Offset: 0x878
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_scale(localclientnum, value)
{
	[[ self ]]->set_scale(localclientnum, value);
}

