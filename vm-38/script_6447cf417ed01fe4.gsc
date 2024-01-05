#using scripts\core_common\lui_shared.csc;

class csr_objective_reward_menu : cluielem
{

	/*
		Name: constructor
		Namespace: csr_objective_reward_menu
		Checksum: 0xABA64E4C
		Offset: 0x4B0
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: csr_objective_reward_menu
		Checksum: 0x1BE81C92
		Offset: 0x988
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: open
		Namespace: csr_objective_reward_menu
		Checksum: 0xF7DD9DC8
		Offset: 0x718
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_gunindex2
		Namespace: csr_objective_reward_menu
		Checksum: 0xD7220277
		Offset: 0x8E0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_gunindex2(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "gunindex2", value);
	}

	/*
		Name: set_gunindex1
		Namespace: csr_objective_reward_menu
		Checksum: 0xAD50E81A
		Offset: 0x8A8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_gunindex1(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "gunIndex1", value);
	}

	/*
		Name: register_clientside
		Namespace: csr_objective_reward_menu
		Checksum: 0xE4BAFBA
		Offset: 0x610
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("sr_objective_reward_menu");
	}

	/*
		Name: setup_clientfields
		Namespace: csr_objective_reward_menu
		Checksum: 0x8419E25F
		Offset: 0x4D0
		Size: 0x134
		Parameters: 5
		Flags: Linked
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
		Checksum: 0xD7EEA3A5
		Offset: 0x950
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_color(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "color", value);
	}

	/*
		Name: set_gunindex3
		Namespace: csr_objective_reward_menu
		Checksum: 0x89512FFB
		Offset: 0x918
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_gunindex3(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "gunindex3", value);
	}

	/*
		Name: set_promptprogress
		Namespace: csr_objective_reward_menu
		Checksum: 0x19A0D88
		Offset: 0x870
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_promptprogress(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "promptProgress", value);
	}

	/*
		Name: set_state
		Namespace: csr_objective_reward_menu
		Checksum: 0x59B8F7FD
		Offset: 0x748
		Size: 0x11C
		Parameters: 2
		Flags: Linked
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
		Checksum: 0x5739AC69
		Offset: 0x638
		Size: 0xD8
		Parameters: 1
		Flags: Linked
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
	Name: function_58964a5c
	Namespace: sr_objective_reward_menu
	Checksum: 0x2571F192
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_58964a5c()
{
	level notify(2029836098);
}

/*
	Name: register
	Namespace: sr_objective_reward_menu
	Checksum: 0x7AE663E1
	Offset: 0x130
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
	Checksum: 0x8F6014AE
	Offset: 0x2D8
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
	Checksum: 0x7C02EA4C
	Offset: 0x318
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
	Checksum: 0x2BD94604
	Offset: 0x340
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
	Checksum: 0x5B9FFE9A
	Offset: 0x368
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
	Checksum: 0x4A56F7AC
	Offset: 0x390
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
	Checksum: 0x3320EF14
	Offset: 0x3C0
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
	Checksum: 0xE5CEBB09
	Offset: 0x3F0
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
	Checksum: 0xC417D66E
	Offset: 0x420
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
	Checksum: 0xF50057A0
	Offset: 0x450
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
	Checksum: 0x47DFA079
	Offset: 0x480
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_color(localclientnum, value)
{
	[[ self ]]->set_color(localclientnum, value);
}

