#using scripts\core_common\lui_shared.csc;

class cstealth_meter_display : cluielem
{

	/*
		Name: constructor
		Namespace: cstealth_meter_display
		Checksum: 0x31AD1AB6
		Offset: 0x498
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cstealth_meter_display
		Checksum: 0xD71372DA
		Offset: 0x940
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cstealth_meter_display
		Checksum: 0x9CE1B286
		Offset: 0x708
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_direction
		Namespace: cstealth_meter_display
		Checksum: 0xFA039DDC
		Offset: 0x8D0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_direction(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "direction", value);
	}

	/*
		Name: set_awarenessstate
		Namespace: cstealth_meter_display
		Checksum: 0xC6F4A6B8
		Offset: 0x860
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_awarenessstate(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "awarenessState", value);
	}

	/*
		Name: register_clientside
		Namespace: cstealth_meter_display
		Checksum: 0xF9690C2C
		Offset: 0x5F8
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("stealth_meter_display");
	}

	/*
		Name: set_awarenessprogress
		Namespace: cstealth_meter_display
		Checksum: 0xA8465DC2
		Offset: 0x898
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_awarenessprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "awarenessProgress", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cstealth_meter_display
		Checksum: 0xD8A05801
		Offset: 0x4B8
		Size: 0x134
		Parameters: 5
		Flags: None
	*/
	function setup_clientfields(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84)
	{
		cluielem::setup_clientfields("stealth_meter_display");
		cluielem::add_clientfield("_state", 1, 2, "int");
		cluielem::add_clientfield("entNum", 1, 10, "int", var_5a7b4b38);
		cluielem::add_clientfield("awarenessState", 1, 4, "int", var_579b061b);
		cluielem::add_clientfield("awarenessProgress", 1, 4, "float", var_f10a04a3);
		cluielem::add_clientfield("direction", 1, 4, "float", var_f228b5fa);
		cluielem::add_clientfield("clamped", 1, 1, "int", var_bda3bf84);
	}

	/*
		Name: set_entnum
		Namespace: cstealth_meter_display
		Checksum: 0xF78D303E
		Offset: 0x828
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entNum", value);
	}

	/*
		Name: set_state
		Namespace: cstealth_meter_display
		Checksum: 0x963745A0
		Offset: 0x738
		Size: 0xE4
		Parameters: 2
		Flags: None
	*/
	function set_state(localclientnum, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			[[ self ]]->set_data(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hide" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"show" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
				}
				else
				{
					/#
						assertmsg("");
					#/
					/#
					#/
				}
			}
		}
	}

	/*
		Name: function_fa582112
		Namespace: cstealth_meter_display
		Checksum: 0x3F74A185
		Offset: 0x620
		Size: 0xE0
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "entNum", 0);
		[[ self ]]->set_data(localclientnum, "awarenessState", 0);
		[[ self ]]->set_data(localclientnum, "awarenessProgress", 0);
		[[ self ]]->set_data(localclientnum, "direction", 0);
		[[ self ]]->set_data(localclientnum, "clamped", 0);
	}

	/*
		Name: set_clamped
		Namespace: cstealth_meter_display
		Checksum: 0x822EE077
		Offset: 0x908
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_clamped(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "clamped", value);
	}

}

#namespace stealth_meter_display;

/*
	Name: register
	Namespace: stealth_meter_display
	Checksum: 0x4D9D4818
	Offset: 0x118
	Size: 0x19E
	Parameters: 5
	Flags: None
*/
function register(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84)
{
	elem = new cstealth_meter_display();
	[[ elem ]]->setup_clientfields(var_5a7b4b38, var_579b061b, var_f10a04a3, var_f228b5fa, var_bda3bf84);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"stealth_meter_display"]))
	{
		level.var_ae746e8f[#"stealth_meter_display"] = array(level.var_ae746e8f[#"stealth_meter_display"]);
	}
	level.var_ae746e8f[#"stealth_meter_display"][level.var_ae746e8f[#"stealth_meter_display"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: stealth_meter_display
	Checksum: 0xDA7B3454
	Offset: 0x2C0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cstealth_meter_display();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: stealth_meter_display
	Checksum: 0x337CA919
	Offset: 0x300
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
	Namespace: stealth_meter_display
	Checksum: 0x2E2F522
	Offset: 0x328
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
	Namespace: stealth_meter_display
	Checksum: 0xD2B50B4B
	Offset: 0x350
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_state
	Namespace: stealth_meter_display
	Checksum: 0x5AB6286B
	Offset: 0x378
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_entnum
	Namespace: stealth_meter_display
	Checksum: 0xD0D6B715
	Offset: 0x3A8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_awarenessstate
	Namespace: stealth_meter_display
	Checksum: 0xC8447366
	Offset: 0x3D8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_awarenessstate(localclientnum, value)
{
	[[ self ]]->set_awarenessstate(localclientnum, value);
}

/*
	Name: set_awarenessprogress
	Namespace: stealth_meter_display
	Checksum: 0x52FFFF1D
	Offset: 0x408
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_awarenessprogress(localclientnum, value)
{
	[[ self ]]->set_awarenessprogress(localclientnum, value);
}

/*
	Name: set_direction
	Namespace: stealth_meter_display
	Checksum: 0xE92AA21B
	Offset: 0x438
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_direction(localclientnum, value)
{
	[[ self ]]->set_direction(localclientnum, value);
}

/*
	Name: set_clamped
	Namespace: stealth_meter_display
	Checksum: 0xE17D5220
	Offset: 0x468
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_clamped(localclientnum, value)
{
	[[ self ]]->set_clamped(localclientnum, value);
}

