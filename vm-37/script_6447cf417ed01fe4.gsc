#using scripts\core_common\lui_shared.csc;

class csr_objective_reward_menu : cluielem
{

	/*
		Name: constructor
		Namespace: csr_objective_reward_menu
		Checksum: 0x76817AC8
		Offset: 0x490
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csr_objective_reward_menu
		Checksum: 0x33029790
		Offset: 0x968
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: csr_objective_reward_menu
		Checksum: 0x6D7FC952
		Offset: 0x6F8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_gunindex2
		Namespace: csr_objective_reward_menu
		Checksum: 0x74358098
		Offset: 0x8C0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_gunindex2(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "gunindex2", value);
	}

	/*
		Name: set_gunindex1
		Namespace: csr_objective_reward_menu
		Checksum: 0x9C04D273
		Offset: 0x888
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_gunindex1(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "gunIndex1", value);
	}

	/*
		Name: register_clientside
		Namespace: csr_objective_reward_menu
		Checksum: 0xAE3DE00E
		Offset: 0x5F0
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_objective_reward_menu");
	}

	/*
		Name: setup_clientfields
		Namespace: csr_objective_reward_menu
		Checksum: 0x64DF75DB
		Offset: 0x4B0
		Size: 0x134
		Parameters: 5
		Flags: None
	*/
	function setup_clientfields(var_e4dedc0e, var_c8914fcf, var_2f1b82f5, var_bf555938, var_18d66c99)
	{
		cluielem::setup_clientfields("sr_objective_reward_menu");
		cluielem::add_clientfield("_state", 1, 2, "int");
		cluielem::add_clientfield("promptProgress", 1, 7, "float", var_e4dedc0e);
		cluielem::add_clientfield("gunIndex1", 1, 4, "int", var_c8914fcf);
		cluielem::add_clientfield("gunindex2", 1, 4, "int", var_2f1b82f5);
		cluielem::add_clientfield("gunindex3", 1, 4, "int", var_bf555938);
		cluielem::add_clientfield("color", 1, 2, "int", var_18d66c99);
	}

	/*
		Name: set_color
		Namespace: csr_objective_reward_menu
		Checksum: 0xC68C587E
		Offset: 0x930
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_color(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "color", value);
	}

	/*
		Name: set_gunindex3
		Namespace: csr_objective_reward_menu
		Checksum: 0xA8A0449F
		Offset: 0x8F8
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_gunindex3(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "gunindex3", value);
	}

	/*
		Name: set_promptprogress
		Namespace: csr_objective_reward_menu
		Checksum: 0xCC6517C0
		Offset: 0x850
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_promptprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "promptProgress", value);
	}

	/*
		Name: set_state
		Namespace: csr_objective_reward_menu
		Checksum: 0xCDB49CC5
		Offset: 0x728
		Size: 0x11C
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
			if(#"hash_aae094fcdbbfdf5" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_6e088fcf60bf0124" == state_name)
				{
					[[ self ]]->set_data(localclientnum, "_state", 2);
				}
				else
				{
					if(#"hash_7ca278cf4669f74b" == state_name)
					{
						[[ self ]]->set_data(localclientnum, "_state", 3);
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

	/*
		Name: function_fa582112
		Namespace: csr_objective_reward_menu
		Checksum: 0x7181119F
		Offset: 0x618
		Size: 0xD8
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "promptProgress", 0);
		[[ self ]]->set_data(localclientnum, "gunIndex1", 0);
		[[ self ]]->set_data(localclientnum, "gunindex2", 0);
		[[ self ]]->set_data(localclientnum, "gunindex3", 0);
		[[ self ]]->set_data(localclientnum, "color", 0);
	}

}

#namespace sr_objective_reward_menu;

/*
	Name: register
	Namespace: sr_objective_reward_menu
	Checksum: 0xA69EC20F
	Offset: 0x110
	Size: 0x19E
	Parameters: 5
	Flags: None
*/
function register(var_e4dedc0e, var_c8914fcf, var_2f1b82f5, var_bf555938, var_18d66c99)
{
	elem = new csr_objective_reward_menu();
	[[ elem ]]->setup_clientfields(var_e4dedc0e, var_c8914fcf, var_2f1b82f5, var_bf555938, var_18d66c99);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"sr_objective_reward_menu"]))
	{
		level.var_ae746e8f[#"sr_objective_reward_menu"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"sr_objective_reward_menu"]))
	{
		level.var_ae746e8f[#"sr_objective_reward_menu"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"sr_objective_reward_menu"]))
	{
		level.var_ae746e8f[#"sr_objective_reward_menu"] = array(level.var_ae746e8f[#"sr_objective_reward_menu"]);
	}
	level.var_ae746e8f[#"sr_objective_reward_menu"][level.var_ae746e8f[#"sr_objective_reward_menu"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: sr_objective_reward_menu
	Checksum: 0xAC6792F4
	Offset: 0x2B8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new csr_objective_reward_menu();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: sr_objective_reward_menu
	Checksum: 0x61895F0C
	Offset: 0x2F8
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
	Namespace: sr_objective_reward_menu
	Checksum: 0x1F6CC3B1
	Offset: 0x320
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
	Namespace: sr_objective_reward_menu
	Checksum: 0x6938F35C
	Offset: 0x348
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
	Namespace: sr_objective_reward_menu
	Checksum: 0x2BDF20C6
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_promptprogress
	Namespace: sr_objective_reward_menu
	Checksum: 0x43457B65
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_promptprogress(localclientnum, value)
{
	[[ self ]]->set_promptprogress(localclientnum, value);
}

/*
	Name: set_gunindex1
	Namespace: sr_objective_reward_menu
	Checksum: 0x8DB50734
	Offset: 0x3D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_gunindex1(localclientnum, value)
{
	[[ self ]]->set_gunindex1(localclientnum, value);
}

/*
	Name: set_gunindex2
	Namespace: sr_objective_reward_menu
	Checksum: 0x8A3C4529
	Offset: 0x400
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_gunindex2(localclientnum, value)
{
	[[ self ]]->set_gunindex2(localclientnum, value);
}

/*
	Name: set_gunindex3
	Namespace: sr_objective_reward_menu
	Checksum: 0x9C4C4029
	Offset: 0x430
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_gunindex3(localclientnum, value)
{
	[[ self ]]->set_gunindex3(localclientnum, value);
}

/*
	Name: set_color
	Namespace: sr_objective_reward_menu
	Checksum: 0xA1692FF9
	Offset: 0x460
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_color(localclientnum, value)
{
	[[ self ]]->set_color(localclientnum, value);
}

