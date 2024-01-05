#using scripts\core_common\lui_shared.csc;

class class_c982469d : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_c982469d
		Checksum: 0xEA43070E
		Offset: 0x3E0
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_c982469d
		Checksum: 0x72F03CDC
		Offset: 0x648
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: namespace_c982469d
		Checksum: 0x44299ABF
		Offset: 0x570
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: register_clientside
		Namespace: namespace_c982469d
		Checksum: 0x4EEB1B5D
		Offset: 0x4B8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_corrupted_health_bar");
	}

	/*
		Name: set_armor_vis
		Namespace: namespace_c982469d
		Checksum: 0xA8CD27EA
		Offset: 0x610
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_armor_vis(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "armor_vis", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_c982469d
		Checksum: 0x7270B8EC
		Offset: 0x400
		Size: 0xAC
		Parameters: 3
		Flags: None
	*/
	function setup_clientfields(healthcallback, var_4ec2b207, var_ed81ff07)
	{
		cluielem::setup_clientfields("zm_corrupted_health_bar");
		cluielem::add_clientfield("health", 4000, 7, "float", healthcallback);
		cluielem::add_clientfield("armor", 4000, 7, "float", var_4ec2b207);
		cluielem::add_clientfield("armor_vis", 4000, 1, "int", var_ed81ff07);
	}

	/*
		Name: set_armor
		Namespace: namespace_c982469d
		Checksum: 0xB569F4A0
		Offset: 0x5D8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_armor(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "armor", value);
	}

	/*
		Name: set_health
		Namespace: namespace_c982469d
		Checksum: 0x52782D7F
		Offset: 0x5A0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_health(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "health", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_c982469d
		Checksum: 0x13ABE95B
		Offset: 0x4E0
		Size: 0x88
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_data(localclientnum, "health", 0);
		[[ self ]]->set_data(localclientnum, "armor", 0);
		[[ self ]]->set_data(localclientnum, "armor_vis", 0);
	}

}

#namespace zm_corrupted_health_bar;

/*
	Name: function_e9b6493a
	Namespace: zm_corrupted_health_bar
	Checksum: 0x8492187C
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e9b6493a()
{
	level notify(-420585340);
}

/*
	Name: register
	Namespace: zm_corrupted_health_bar
	Checksum: 0xA0D5B6F8
	Offset: 0x100
	Size: 0x18E
	Parameters: 3
	Flags: None
*/
function register(healthcallback, var_4ec2b207, var_ed81ff07)
{
	elem = new class_c982469d();
	[[ elem ]]->setup_clientfields(healthcallback, var_4ec2b207, var_ed81ff07);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_corrupted_health_bar"]))
	{
		level.var_ae746e8f[#"zm_corrupted_health_bar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_corrupted_health_bar"]))
	{
		level.var_ae746e8f[#"zm_corrupted_health_bar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_corrupted_health_bar"]))
	{
		level.var_ae746e8f[#"zm_corrupted_health_bar"] = array(level.var_ae746e8f[#"zm_corrupted_health_bar"]);
	}
	level.var_ae746e8f[#"zm_corrupted_health_bar"][level.var_ae746e8f[#"zm_corrupted_health_bar"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_corrupted_health_bar
	Checksum: 0x6FE368B5
	Offset: 0x298
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_c982469d();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_corrupted_health_bar
	Checksum: 0x81FAE813
	Offset: 0x2D8
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
	Namespace: zm_corrupted_health_bar
	Checksum: 0x7382A142
	Offset: 0x300
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
	Namespace: zm_corrupted_health_bar
	Checksum: 0xF859143F
	Offset: 0x328
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_health
	Namespace: zm_corrupted_health_bar
	Checksum: 0x4A40A87E
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_health(localclientnum, value)
{
	[[ self ]]->set_health(localclientnum, value);
}

/*
	Name: set_armor
	Namespace: zm_corrupted_health_bar
	Checksum: 0x13351E94
	Offset: 0x380
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_armor(localclientnum, value)
{
	[[ self ]]->set_armor(localclientnum, value);
}

/*
	Name: set_armor_vis
	Namespace: zm_corrupted_health_bar
	Checksum: 0xF04C075D
	Offset: 0x3B0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_armor_vis(localclientnum, value)
{
	[[ self ]]->set_armor_vis(localclientnum, value);
}

