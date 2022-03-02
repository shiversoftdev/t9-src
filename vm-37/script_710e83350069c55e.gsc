#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\lui_shared.gsc;

class class_276088fe : class_6aaccc24
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_276088fe
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
		Namespace: namespace_276088fe
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
		Namespace: namespace_276088fe
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
		namespace_6aaccc24::function_8b8089ba(player, flags);
	}

	/*
		Name: function_4f6e830d
		Namespace: namespace_276088fe
		Checksum: 0x6D632FAC
		Offset: 0x820
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_4f6e830d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_y", value);
	}

	/*
		Name: close
		Namespace: namespace_276088fe
		Checksum: 0x62C9239B
		Offset: 0x550
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		namespace_6aaccc24::function_a68f6e20(player);
	}

	/*
		Name: function_61312692
		Namespace: namespace_276088fe
		Checksum: 0xC74D9AC0
		Offset: 0x7D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_61312692(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_x", value);
	}

	/*
		Name: function_7ddfdfef
		Namespace: namespace_276088fe
		Checksum: 0x830174F7
		Offset: 0x870
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_7ddfdfef(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "offset_z", value);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_276088fe
		Checksum: 0x2A1E2333
		Offset: 0x3A0
		Size: 0x15C
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		namespace_6aaccc24::setup_clientfields("LUIelem_entity_bar");
		namespace_6aaccc24::function_da693cbe("_state", 1, 3, "int");
		namespace_6aaccc24::function_da693cbe("progress_percent", 1, 7, "float");
		namespace_6aaccc24::function_da693cbe("entnum", 1, 7, "int");
		namespace_6aaccc24::function_da693cbe("offset_x", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("offset_y", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("offset_z", 1, 6, "int");
		namespace_6aaccc24::function_da693cbe("entityClamp", 1, 1, "int");
		namespace_6aaccc24::function_da693cbe("entityScale", 1, 1, "int");
	}

	/*
		Name: function_a9793a65
		Namespace: namespace_276088fe
		Checksum: 0xB3C446B0
		Offset: 0x910
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_a9793a65(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entityScale", value);
	}

	/*
		Name: function_c8350e33
		Namespace: namespace_276088fe
		Checksum: 0xD7A0BEC0
		Offset: 0x780
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c8350e33(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entnum", value);
	}

	/*
		Name: set_state
		Namespace: namespace_276088fe
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
		Name: function_dfed4b05
		Namespace: namespace_276088fe
		Checksum: 0x1CE6928D
		Offset: 0x8C0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_dfed4b05(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "entityClamp", value);
	}

	/*
		Name: function_ecacbaa5
		Namespace: namespace_276088fe
		Checksum: 0xE44BD23D
		Offset: 0x730
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_ecacbaa5(player, value)
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
	elem = new class_276088fe();
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
	Name: function_ecacbaa5
	Namespace: luielem_entity_bar
	Checksum: 0xA94C1787
	Offset: 0x230
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ecacbaa5(player, value)
{
	[[ self ]]->function_ecacbaa5(player, value);
}

/*
	Name: function_c8350e33
	Namespace: luielem_entity_bar
	Checksum: 0x417EF9D8
	Offset: 0x260
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c8350e33(player, value)
{
	[[ self ]]->function_c8350e33(player, value);
}

/*
	Name: function_61312692
	Namespace: luielem_entity_bar
	Checksum: 0xDA9C630
	Offset: 0x290
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_61312692(player, value)
{
	[[ self ]]->function_61312692(player, value);
}

/*
	Name: function_4f6e830d
	Namespace: luielem_entity_bar
	Checksum: 0x568A41F6
	Offset: 0x2C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_4f6e830d(player, value)
{
	[[ self ]]->function_4f6e830d(player, value);
}

/*
	Name: function_7ddfdfef
	Namespace: luielem_entity_bar
	Checksum: 0x38E0E6F8
	Offset: 0x2F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_7ddfdfef(player, value)
{
	[[ self ]]->function_7ddfdfef(player, value);
}

/*
	Name: function_dfed4b05
	Namespace: luielem_entity_bar
	Checksum: 0x5420A669
	Offset: 0x320
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_dfed4b05(player, value)
{
	[[ self ]]->function_dfed4b05(player, value);
}

/*
	Name: function_a9793a65
	Namespace: luielem_entity_bar
	Checksum: 0xABF6131E
	Offset: 0x350
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_a9793a65(player, value)
{
	[[ self ]]->function_a9793a65(player, value);
}

