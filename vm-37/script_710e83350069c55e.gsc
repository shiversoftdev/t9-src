#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class cluielem_entity_bar : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: cluielem_entity_bar
		Checksum: 0xB71E9A2
		Offset: 0x380
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
		Checksum: 0x1DB20027
		Offset: 0x960
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
		Checksum: 0xFCFE03E
		Offset: 0x508
		Size: 0x3C
		Parameters: 2
		Flags: None
	*/
	function open(player, flags)
	{
		if(!isdefined(flags))
		{
			flags = 0;
		}
		cluielem::open_luielem(player, flags);
	}

	/*
		Name: set_offset_y
		Namespace: cluielem_entity_bar
		Checksum: 0x6D632FAC
		Offset: 0x820
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_offset_y(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_y", value);
	}

	/*
		Name: close
		Namespace: cluielem_entity_bar
		Checksum: 0x62C9239B
		Offset: 0x550
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: set_offset_x
		Namespace: cluielem_entity_bar
		Checksum: 0xC74D9AC0
		Offset: 0x7D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_offset_x(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_x", value);
	}

	/*
		Name: set_offset_z
		Namespace: cluielem_entity_bar
		Checksum: 0x830174F7
		Offset: 0x870
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_offset_z(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: cluielem_entity_bar
		Checksum: 0x2A1E2333
		Offset: 0x3A0
		Size: 0x15C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("LUIelem_entity_bar");
		cluielem::add_clientfield("_state", 1, 3, "int");
		cluielem::add_clientfield("progress_percent", 1, 7, "float");
		cluielem::add_clientfield("entnum", 1, 7, "int");
		cluielem::add_clientfield("offset_x", 1, 6, "int");
		cluielem::add_clientfield("offset_y", 1, 6, "int");
		cluielem::add_clientfield("offset_z", 1, 6, "int");
		cluielem::add_clientfield("entityClamp", 1, 1, "int");
		cluielem::add_clientfield("entityScale", 1, 1, "int");
	}

	/*
		Name: set_entityscale
		Namespace: cluielem_entity_bar
		Checksum: 0xB3C446B0
		Offset: 0x910
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entityscale(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entityScale", value);
	}

	/*
		Name: set_entnum
		Namespace: cluielem_entity_bar
		Checksum: 0xD7A0BEC0
		Offset: 0x780
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entnum(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entnum", value);
	}

	/*
		Name: set_state
		Namespace: cluielem_entity_bar
		Checksum: 0x27EC2CEC
		Offset: 0x580
		Size: 0x1A4
		Parameters: 2
		Flags: None
	*/
	function set_state(player, state_name)
	{
		if(#"defaultstate" == state_name)
		{
			player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 0);
		}
		else
		{
			if(#"friendlyblue" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"green" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
				}
				else
				{
					if(#"yellow" == state_name)
					{
						player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 3);
					}
					else
					{
						if(#"red" == state_name)
						{
							player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 4);
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
		Checksum: 0x1CE6928D
		Offset: 0x8C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_entityclamp(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entityClamp", value);
	}

	/*
		Name: set_progress_percent
		Namespace: cluielem_entity_bar
		Checksum: 0xE44BD23D
		Offset: 0x730
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_progress_percent(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "progress_percent", value);
	}

}

#namespace luielem_entity_bar;

/*
	Name: register
	Namespace: luielem_entity_bar
	Checksum: 0x3D973737
	Offset: 0x130
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new cluielem_entity_bar();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: luielem_entity_bar
	Checksum: 0x52224920
	Offset: 0x170
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function open(player, flags)
{
	if(!isdefined(flags))
	{
		flags = 0;
	}
	[[ self ]]->open(player, flags);
}

/*
	Name: close
	Namespace: luielem_entity_bar
	Checksum: 0x753C763F
	Offset: 0x1B0
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
	Checksum: 0xEFF97288
	Offset: 0x1D8
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_state
	Namespace: luielem_entity_bar
	Checksum: 0xF6E05EF2
	Offset: 0x200
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_progress_percent
	Namespace: luielem_entity_bar
	Checksum: 0xA94C1787
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_progress_percent(player, value)
{
	[[ self ]]->set_progress_percent(player, value);
}

/*
	Name: set_entnum
	Namespace: luielem_entity_bar
	Checksum: 0x417EF9D8
	Offset: 0x260
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entnum(player, value)
{
	[[ self ]]->set_entnum(player, value);
}

/*
	Name: set_offset_x
	Namespace: luielem_entity_bar
	Checksum: 0xDA9C630
	Offset: 0x290
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_x(player, value)
{
	[[ self ]]->set_offset_x(player, value);
}

/*
	Name: set_offset_y
	Namespace: luielem_entity_bar
	Checksum: 0x568A41F6
	Offset: 0x2C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_y(player, value)
{
	[[ self ]]->set_offset_y(player, value);
}

/*
	Name: set_offset_z
	Namespace: luielem_entity_bar
	Checksum: 0x38E0E6F8
	Offset: 0x2F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_offset_z(player, value)
{
	[[ self ]]->set_offset_z(player, value);
}

/*
	Name: set_entityclamp
	Namespace: luielem_entity_bar
	Checksum: 0x5420A669
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entityclamp(player, value)
{
	[[ self ]]->set_entityclamp(player, value);
}

/*
	Name: set_entityscale
	Namespace: luielem_entity_bar
	Checksum: 0xABF6131E
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_entityscale(player, value)
{
	[[ self ]]->set_entityscale(player, value);
}

