#using scripts\core_common\lui_shared.csc;

class cluielem_entity_bar : cluielem
{

	/*
		Name: constructor
		Namespace: cluielem_entity_bar
		Checksum: 0x27E5FB57
		Offset: 0x660
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: cluielem_entity_bar
		Checksum: 0x488D6986
		Offset: 0xC88
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: cluielem_entity_bar
		Checksum: 0x8B284B85
		Offset: 0x970
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_offset_y
		Namespace: cluielem_entity_bar
		Checksum: 0xE4560BED
		Offset: 0xBA8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_y(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_y", value);
	}

	/*
		Name: register_clientside
		Namespace: cluielem_entity_bar
		Checksum: 0x93116BAA
		Offset: 0x830
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("LUIelem_entity_bar");
	}

	/*
		Name: set_offset_x
		Namespace: cluielem_entity_bar
		Checksum: 0xA9BCE67C
		Offset: 0xB70
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_x(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_x", value);
	}

	/*
		Name: set_offset_z
		Namespace: cluielem_entity_bar
		Checksum: 0x5DED8A6A
		Offset: 0xBE0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_offset_z(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cluielem_entity_bar
		Checksum: 0xD36F64D8
		Offset: 0x680
		Size: 0x1A4
		Parameters: 9
		Flags: None
	*/
	function setup_clientfields(var_aabf01c7, var_5a7b4b38, var_bda3bf84, var_f228b5fa, var_5957697a, var_90efc226, var_b77f41ee, var_255edd98, var_2c8aa656)
	{
		cluielem::setup_clientfields("LUIelem_entity_bar");
		cluielem::add_clientfield("_state", 1, 3, "int");
		cluielem::add_clientfield("progress_percent", 1, 7, "float", var_bda3bf84);
		cluielem::add_clientfield("entnum", 1, 7, "int", var_f228b5fa);
		cluielem::add_clientfield("offset_x", 1, 6, "int", var_5957697a);
		cluielem::add_clientfield("offset_y", 1, 6, "int", var_90efc226);
		cluielem::add_clientfield("offset_z", 1, 6, "int", var_b77f41ee);
		cluielem::add_clientfield("entityClamp", 1, 1, "int", var_255edd98);
		cluielem::add_clientfield("entityScale", 1, 1, "int", var_2c8aa656);
	}

	/*
		Name: set_entityscale
		Namespace: cluielem_entity_bar
		Checksum: 0x30081A44
		Offset: 0xC50
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entityscale(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entityScale", value);
	}

	/*
		Name: set_entnum
		Namespace: cluielem_entity_bar
		Checksum: 0x57F89024
		Offset: 0xB38
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entnum(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entnum", value);
	}

	/*
		Name: set_state
		Namespace: cluielem_entity_bar
		Checksum: 0xE8310D8B
		Offset: 0x9A0
		Size: 0x154
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
			if(#"friendlyblue" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"green" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
				}
				else
				{
					if(#"yellow" == state_name)
					{
						[[ self ]]->set_data(localclientnum, "_state", 3);
					}
					else
					{
						if(#"red" == state_name)
						{
							[[ self ]]->set_data(localclientnum, "_state", 4);
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
		}
	}

	/*
		Name: set_entityclamp
		Namespace: cluielem_entity_bar
		Checksum: 0x2BE0DE5A
		Offset: 0xC18
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_entityclamp(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "entityClamp", value);
	}

	/*
		Name: set_progress_percent
		Namespace: cluielem_entity_bar
		Checksum: 0x2F38E616
		Offset: 0xB00
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_progress_percent(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "progress_percent", value);
	}

	/*
		Name: function_fa582112
		Namespace: cluielem_entity_bar
		Checksum: 0x7149C8EB
		Offset: 0x858
		Size: 0x110
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "progress_percent", 0);
		[[ self ]]->set_data(localclientnum, "entnum", 0);
		[[ self ]]->set_data(localclientnum, "offset_x", 0);
		[[ self ]]->set_data(localclientnum, "offset_y", 0);
		[[ self ]]->set_data(localclientnum, "offset_z", 0);
		[[ self ]]->set_data(localclientnum, "entityClamp", 0);
		[[ self ]]->set_data(localclientnum, "entityScale", 0);
	}

}

#namespace luielem_entity_bar;

/*
	Name: function_9c825288
	Namespace: luielem_entity_bar
	Checksum: 0x1D96669C
	Offset: 0x130
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9c825288()
{
	level notify(-1509723005);
}

/*
	Name: set_bonetag
	Namespace: luielem_entity_bar
	Checksum: 0xF3D30C21
	Offset: 0x150
	Size: 0x30
	Parameters: 2
	Flags: None
*/
function set_bonetag(localclientnum, value)
{
	[[ self ]]->set_data(localclientnum, "boneTag", value);
}

/*
	Name: function_919052d
	Namespace: luielem_entity_bar
	Checksum: 0xE2754E26
	Offset: 0x188
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function function_919052d(localclientnum, entnum, bonetag)
{
	self set_entnum(localclientnum, entnum);
	self set_bonetag(localclientnum, bonetag);
}

/*
	Name: function_b4023f5a
	Namespace: luielem_entity_bar
	Checksum: 0xCB657F0D
	Offset: 0x1E0
	Size: 0x6C
	Parameters: 4
	Flags: None
*/
function function_b4023f5a(localclientnum, offsetx, offsety, offsetz)
{
	self set_offset_x(localclientnum, offsetx);
	self set_offset_y(localclientnum, offsety);
	self set_offset_z(localclientnum, offsetz);
}

/*
	Name: register
	Namespace: luielem_entity_bar
	Checksum: 0x1AC8C1EC
	Offset: 0x258
	Size: 0x1C6
	Parameters: 9
	Flags: None
*/
function register(var_aabf01c7, var_5a7b4b38, var_bda3bf84, var_f228b5fa, var_5957697a, var_90efc226, var_b77f41ee, var_255edd98, var_2c8aa656)
{
	elem = new cluielem_entity_bar();
	[[ elem ]]->setup_clientfields(var_aabf01c7, var_5a7b4b38, var_bda3bf84, var_f228b5fa, var_5957697a, var_90efc226, var_b77f41ee, var_255edd98, var_2c8aa656);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"luielem_entity_bar"]))
	{
		level.var_ae746e8f[#"luielem_entity_bar"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"luielem_entity_bar"]))
	{
		level.var_ae746e8f[#"luielem_entity_bar"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"luielem_entity_bar"]))
	{
		level.var_ae746e8f[#"luielem_entity_bar"] = array(level.var_ae746e8f[#"luielem_entity_bar"]);
	}
	level.var_ae746e8f[#"luielem_entity_bar"][level.var_ae746e8f[#"luielem_entity_bar"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: luielem_entity_bar
	Checksum: 0xF2C0AF1
	Offset: 0x428
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new cluielem_entity_bar();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: luielem_entity_bar
	Checksum: 0x25137247
	Offset: 0x468
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
	Namespace: luielem_entity_bar
	Checksum: 0xAE297BC1
	Offset: 0x490
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
	Namespace: luielem_entity_bar
	Checksum: 0x4C3E868D
	Offset: 0x4B8
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
	Namespace: luielem_entity_bar
	Checksum: 0xAC866871
	Offset: 0x4E0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_progress_percent
	Namespace: luielem_entity_bar
	Checksum: 0xDAA5A282
	Offset: 0x510
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress_percent(localclientnum, value)
{
	[[ self ]]->set_progress_percent(localclientnum, value);
}

/*
	Name: set_entnum
	Namespace: luielem_entity_bar
	Checksum: 0xB1CDABCD
	Offset: 0x540
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(localclientnum, value)
{
	[[ self ]]->set_entnum(localclientnum, value);
}

/*
	Name: set_offset_x
	Namespace: luielem_entity_bar
	Checksum: 0xB8B3BCCB
	Offset: 0x570
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_x(localclientnum, value)
{
	[[ self ]]->set_offset_x(localclientnum, value);
}

/*
	Name: set_offset_y
	Namespace: luielem_entity_bar
	Checksum: 0xD85ADA7E
	Offset: 0x5A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_y(localclientnum, value)
{
	[[ self ]]->set_offset_y(localclientnum, value);
}

/*
	Name: set_offset_z
	Namespace: luielem_entity_bar
	Checksum: 0x9A3F3BD0
	Offset: 0x5D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(localclientnum, value)
{
	[[ self ]]->set_offset_z(localclientnum, value);
}

/*
	Name: set_entityclamp
	Namespace: luielem_entity_bar
	Checksum: 0x60647144
	Offset: 0x600
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entityclamp(localclientnum, value)
{
	[[ self ]]->set_entityclamp(localclientnum, value);
}

/*
	Name: set_entityscale
	Namespace: luielem_entity_bar
	Checksum: 0x20660126
	Offset: 0x630
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entityscale(localclientnum, value)
{
	[[ self ]]->set_entityscale(localclientnum, value);
}

