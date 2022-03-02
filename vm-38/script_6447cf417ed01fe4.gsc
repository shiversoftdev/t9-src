#using scripts\core_common\lui_shared.csc;

class class_51a06b68 : class_6aaccc24
{

	/*
		Name: constructor
		Namespace: namespace_51a06b68
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
		Namespace: namespace_51a06b68
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
		Namespace: namespace_51a06b68
		Checksum: 0xF7DD9DC8
		Offset: 0x718
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_2d7f3298
		Namespace: namespace_51a06b68
		Checksum: 0xD7220277
		Offset: 0x8E0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_2d7f3298(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "gunindex2", value);
	}

	/*
		Name: function_43ba5f0e
		Namespace: namespace_51a06b68
		Checksum: 0xAD50E81A
		Offset: 0x8A8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_43ba5f0e(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "gunIndex1", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_51a06b68
		Checksum: 0xE4BAFBA
		Offset: 0x610
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("sr_objective_reward_menu");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_51a06b68
		Checksum: 0x8419E25F
		Offset: 0x4D0
		Size: 0x134
		Parameters: 5
		Flags: Linked
	*/
	function setup_clientfields(var_e4dedc0e, var_c8914fcf, var_2f1b82f5, var_bf555938, var_18d66c99)
	{
		namespace_6aaccc24::setup_clientfields("sr_objective_reward_menu");
		namespace_6aaccc24::function_da693cbe("_state", 1, 2, "int");
		namespace_6aaccc24::function_da693cbe("promptProgress", 1, 7, "float", var_e4dedc0e);
		namespace_6aaccc24::function_da693cbe("gunIndex1", 1, 4, "int", var_c8914fcf);
		namespace_6aaccc24::function_da693cbe("gunindex2", 1, 4, "int", var_2f1b82f5);
		namespace_6aaccc24::function_da693cbe("gunindex3", 1, 4, "int", var_bf555938);
		namespace_6aaccc24::function_da693cbe("color", 1, 2, "int", var_18d66c99);
	}

	/*
		Name: set_color
		Namespace: namespace_51a06b68
		Checksum: 0xD7EEA3A5
		Offset: 0x950
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_color(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "color", value);
	}

	/*
		Name: function_ada8b2f1
		Namespace: namespace_51a06b68
		Checksum: 0x89512FFB
		Offset: 0x918
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_ada8b2f1(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "gunindex3", value);
	}

	/*
		Name: function_b94196b8
		Namespace: namespace_51a06b68
		Checksum: 0x19A0D88
		Offset: 0x870
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_b94196b8(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "promptProgress", value);
	}

	/*
		Name: set_state
		Namespace: namespace_51a06b68
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
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hash_aae094fcdbbfdf5" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_6e088fcf60bf0124" == state_name)
				{
					[[ self ]]->function_d7d2fcce(localclientnum, "_state", 2);
				}
				else
				{
					if(#"hash_7ca278cf4669f74b" == state_name)
					{
						[[ self ]]->function_d7d2fcce(localclientnum, "_state", 3);
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
		Namespace: namespace_51a06b68
		Checksum: 0x5739AC69
		Offset: 0x638
		Size: 0xD8
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "promptProgress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "gunIndex1", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "gunindex2", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "gunindex3", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "color", 0);
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
	elem = new class_51a06b68();
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
	Name: function_5c1bb138
	Namespace: sr_objective_reward_menu
	Checksum: 0x8F6014AE
	Offset: 0x2D8
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_51a06b68();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_b94196b8
	Namespace: sr_objective_reward_menu
	Checksum: 0x3320EF14
	Offset: 0x3C0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_b94196b8(localclientnum, value)
{
	[[ self ]]->function_b94196b8(localclientnum, value);
}

/*
	Name: function_43ba5f0e
	Namespace: sr_objective_reward_menu
	Checksum: 0xE5CEBB09
	Offset: 0x3F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_43ba5f0e(localclientnum, value)
{
	[[ self ]]->function_43ba5f0e(localclientnum, value);
}

/*
	Name: function_2d7f3298
	Namespace: sr_objective_reward_menu
	Checksum: 0xC417D66E
	Offset: 0x420
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2d7f3298(localclientnum, value)
{
	[[ self ]]->function_2d7f3298(localclientnum, value);
}

/*
	Name: function_ada8b2f1
	Namespace: sr_objective_reward_menu
	Checksum: 0xF50057A0
	Offset: 0x450
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ada8b2f1(localclientnum, value)
{
	[[ self ]]->function_ada8b2f1(localclientnum, value);
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

