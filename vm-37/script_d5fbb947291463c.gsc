#using scripts\core_common\lui_shared.csc;

class class_a0be59de : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_a0be59de
		Checksum: 0xD4B47952
		Offset: 0x618
		Size: 0x14
		Parameters: 0
		Flags: 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a0be59de
		Checksum: 0x6A7FC0A0
		Offset: 0xDB0
		Size: 0x14
		Parameters: 0
		Flags: 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_binlocation
		Namespace: namespace_a0be59de
		Checksum: 0x8E5534E4
		Offset: 0xBB0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_binlocation(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bInLocation", value);
	}

	/*
		Name: open
		Namespace: namespace_a0be59de
		Checksum: 0x59A78D42
		Offset: 0xA20
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: set_challengetext
		Namespace: namespace_a0be59de
		Checksum: 0xB8D609C0
		Offset: 0xB40
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_challengetext(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeText", value);
	}

	/*
		Name: set_bottomtext
		Namespace: namespace_a0be59de
		Checksum: 0xD66D3708
		Offset: 0xB78
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_bottomtext(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bottomText", value);
	}

	/*
		Name: set_rewardhidden
		Namespace: namespace_a0be59de
		Checksum: 0x30C58D4D
		Offset: 0xC98
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_rewardhidden(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "rewardHidden", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_a0be59de
		Checksum: 0xBBC1EA9
		Offset: 0x868
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_dac_challenges_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a0be59de
		Checksum: 0xAF4FE41D
		Offset: 0x638
		Size: 0x224
		Parameters: 10
		Flags: None
	*/
	function setup_clientfields(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d)
	{
		cluielem::setup_clientfields("zm_dac_challenges_hud");
		cluielem::add_clientfield("_state", 1, 2, "int");
		cluielem::function_dcb34c80("string", "challengeText", 1);
		cluielem::function_dcb34c80("string", "bottomText", 1);
		cluielem::add_clientfield("bInLocation", 1, 1, "int", var_afaddf7a);
		cluielem::add_clientfield("progress", 1, 1, "counter", var_5d7491df);
		cluielem::add_clientfield("tributeAvailable", 1, 3, "int", var_26df3d64);
		cluielem::add_clientfield("rewardHidden", 1, 1, "int", var_90359ec7);
		cluielem::add_clientfield("challengeFailing", 1, 1, "int", var_2404f6c6);
		cluielem::function_dcb34c80("string", "rewardText", 1);
		cluielem::add_clientfield("challengeTypeText", 1, 1, "int", var_74cf4193);
		cluielem::add_clientfield("showIntelRewardText", 1, 1, "int", var_e89bb89d);
	}

	/*
		Name: increment_progress
		Namespace: namespace_a0be59de
		Checksum: 0x8F9FCD54
		Offset: 0xBE8
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function increment_progress(localclientnum)
	{
		current_val = [[ self ]]->get_data(localclientnum, "progress");
		new_val = (current_val + 1) % 2;
		[[ self ]]->set_data(localclientnum, "progress", new_val);
	}

	/*
		Name: set_tributeavailable
		Namespace: namespace_a0be59de
		Checksum: 0xDFDAC918
		Offset: 0xC60
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_tributeavailable(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "tributeAvailable", value);
	}

	/*
		Name: function_c079b98b
		Namespace: namespace_a0be59de
		Checksum: 0x386F8A80
		Offset: 0xD40
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c079b98b(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeTypeText", value);
	}

	/*
		Name: function_c21d733d
		Namespace: namespace_a0be59de
		Checksum: 0x2C7271CF
		Offset: 0xD78
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c21d733d(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showIntelRewardText", value);
	}

	/*
		Name: set_challengefailing
		Namespace: namespace_a0be59de
		Checksum: 0xEE75AF3B
		Offset: 0xCD0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function set_challengefailing(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeFailing", value);
	}

	/*
		Name: set_state
		Namespace: namespace_a0be59de
		Checksum: 0x80735C2D
		Offset: 0xA50
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
			if(#"hash_6038b42ab4ce959d" == state_name)
			{
				[[ self ]]->set_data(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_3045a78750b13a96" == state_name)
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
		Name: function_f63ec96b
		Namespace: namespace_a0be59de
		Checksum: 0x8ED8AB5
		Offset: 0xD08
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_f63ec96b(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "rewardText", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a0be59de
		Checksum: 0x45BBFBF
		Offset: 0x890
		Size: 0x184
		Parameters: 1
		Flags: None
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->set_data(localclientnum, "challengeText", #"");
		[[ self ]]->set_data(localclientnum, "bottomText", #"");
		[[ self ]]->set_data(localclientnum, "bInLocation", 0);
		[[ self ]]->set_data(localclientnum, "progress", 0);
		[[ self ]]->set_data(localclientnum, "tributeAvailable", 0);
		[[ self ]]->set_data(localclientnum, "rewardHidden", 0);
		[[ self ]]->set_data(localclientnum, "challengeFailing", 0);
		[[ self ]]->set_data(localclientnum, "rewardText", #"");
		[[ self ]]->set_data(localclientnum, "challengeTypeText", 0);
		[[ self ]]->set_data(localclientnum, "showIntelRewardText", 0);
	}

}

#namespace zm_dac_challenges_hud;

/*
	Name: register
	Namespace: zm_dac_challenges_hud
	Checksum: 0xB3038717
	Offset: 0x180
	Size: 0x1CE
	Parameters: 10
	Flags: None
*/
function register(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d)
{
	elem = new class_a0be59de();
	[[ elem ]]->setup_clientfields(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d);
	if(!isdefined(level.var_ae746e8f))
	{
		level.var_ae746e8f = associativearray();
	}
	if(!isdefined(level.var_ae746e8f[#"zm_dac_challenges_hud"]))
	{
		level.var_ae746e8f[#"zm_dac_challenges_hud"] = [];
	}
	if(!isdefined(level.var_ae746e8f[#"zm_dac_challenges_hud"]))
	{
		level.var_ae746e8f[#"zm_dac_challenges_hud"] = [];
	}
	else if(!isarray(level.var_ae746e8f[#"zm_dac_challenges_hud"]))
	{
		level.var_ae746e8f[#"zm_dac_challenges_hud"] = array(level.var_ae746e8f[#"zm_dac_challenges_hud"]);
	}
	level.var_ae746e8f[#"zm_dac_challenges_hud"][level.var_ae746e8f[#"zm_dac_challenges_hud"].size] = elem;
}

/*
	Name: register_clientside
	Namespace: zm_dac_challenges_hud
	Checksum: 0x43694CEB
	Offset: 0x358
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register_clientside()
{
	elem = new class_a0be59de();
	[[ elem ]]->register_clientside();
	return elem;
}

/*
	Name: open
	Namespace: zm_dac_challenges_hud
	Checksum: 0x5D4E59B1
	Offset: 0x398
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
	Namespace: zm_dac_challenges_hud
	Checksum: 0xFF8E026A
	Offset: 0x3C0
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
	Namespace: zm_dac_challenges_hud
	Checksum: 0x3622AE8C
	Offset: 0x3E8
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
	Namespace: zm_dac_challenges_hud
	Checksum: 0x72CA302
	Offset: 0x410
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(localclientnum, state_name)
{
	[[ self ]]->set_state(localclientnum, state_name);
}

/*
	Name: set_challengetext
	Namespace: zm_dac_challenges_hud
	Checksum: 0x9EC00B07
	Offset: 0x440
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_challengetext(localclientnum, value)
{
	[[ self ]]->set_challengetext(localclientnum, value);
}

/*
	Name: set_bottomtext
	Namespace: zm_dac_challenges_hud
	Checksum: 0x8E7288B9
	Offset: 0x470
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bottomtext(localclientnum, value)
{
	[[ self ]]->set_bottomtext(localclientnum, value);
}

/*
	Name: set_binlocation
	Namespace: zm_dac_challenges_hud
	Checksum: 0xEEF73E4
	Offset: 0x4A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_binlocation(localclientnum, value)
{
	[[ self ]]->set_binlocation(localclientnum, value);
}

/*
	Name: increment_progress
	Namespace: zm_dac_challenges_hud
	Checksum: 0xA3EA23D
	Offset: 0x4D0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function increment_progress(localclientnum)
{
	[[ self ]]->increment_progress(localclientnum);
}

/*
	Name: set_tributeavailable
	Namespace: zm_dac_challenges_hud
	Checksum: 0x6A6898A
	Offset: 0x4F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_tributeavailable(localclientnum, value)
{
	[[ self ]]->set_tributeavailable(localclientnum, value);
}

/*
	Name: set_rewardhidden
	Namespace: zm_dac_challenges_hud
	Checksum: 0x2F26F526
	Offset: 0x528
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rewardhidden(localclientnum, value)
{
	[[ self ]]->set_rewardhidden(localclientnum, value);
}

/*
	Name: set_challengefailing
	Namespace: zm_dac_challenges_hud
	Checksum: 0xFEBD2480
	Offset: 0x558
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_challengefailing(localclientnum, value)
{
	[[ self ]]->set_challengefailing(localclientnum, value);
}

/*
	Name: function_f63ec96b
	Namespace: zm_dac_challenges_hud
	Checksum: 0x65BF0A3
	Offset: 0x588
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f63ec96b(localclientnum, value)
{
	[[ self ]]->function_f63ec96b(localclientnum, value);
}

/*
	Name: function_c079b98b
	Namespace: zm_dac_challenges_hud
	Checksum: 0xDA694CCF
	Offset: 0x5B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c079b98b(localclientnum, value)
{
	[[ self ]]->function_c079b98b(localclientnum, value);
}

/*
	Name: function_c21d733d
	Namespace: zm_dac_challenges_hud
	Checksum: 0x4D8B25BA
	Offset: 0x5E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c21d733d(localclientnum, value)
{
	[[ self ]]->function_c21d733d(localclientnum, value);
}

