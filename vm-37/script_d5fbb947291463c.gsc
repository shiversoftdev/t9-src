#using scripts\core_common\lui_shared.csc;

class class_a0be59de : class_6aaccc24
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
		Name: function_ad9c4f0
		Namespace: namespace_a0be59de
		Checksum: 0x8E5534E4
		Offset: 0xBB0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_ad9c4f0(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bInLocation", value);
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
		namespace_6aaccc24::open(localclientnum);
	}

	/*
		Name: function_1c836e71
		Namespace: namespace_a0be59de
		Checksum: 0xB8D609C0
		Offset: 0xB40
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_1c836e71(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "challengeText", value);
	}

	/*
		Name: function_2dde4d6c
		Namespace: namespace_a0be59de
		Checksum: 0xD66D3708
		Offset: 0xB78
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_2dde4d6c(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "bottomText", value);
	}

	/*
		Name: function_3fdd9da7
		Namespace: namespace_a0be59de
		Checksum: 0x30C58D4D
		Offset: 0xC98
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_3fdd9da7(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "rewardHidden", value);
	}

	/*
		Name: function_5c1bb138
		Namespace: namespace_a0be59de
		Checksum: 0xBBC1EA9
		Offset: 0x868
		Size: 0x1C
		Parameters: 0
		Flags: None
	*/
	function function_5c1bb138()
	{
		namespace_6aaccc24::function_5c1bb138("zm_dac_challenges_hud");
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
		namespace_6aaccc24::setup_clientfields("zm_dac_challenges_hud");
		namespace_6aaccc24::function_da693cbe("_state", 1, 2, "int");
		namespace_6aaccc24::function_dcb34c80("string", "challengeText", 1);
		namespace_6aaccc24::function_dcb34c80("string", "bottomText", 1);
		namespace_6aaccc24::function_da693cbe("bInLocation", 1, 1, "int", var_afaddf7a);
		namespace_6aaccc24::function_da693cbe("progress", 1, 1, "counter", var_5d7491df);
		namespace_6aaccc24::function_da693cbe("tributeAvailable", 1, 3, "int", var_26df3d64);
		namespace_6aaccc24::function_da693cbe("rewardHidden", 1, 1, "int", var_90359ec7);
		namespace_6aaccc24::function_da693cbe("challengeFailing", 1, 1, "int", var_2404f6c6);
		namespace_6aaccc24::function_dcb34c80("string", "rewardText", 1);
		namespace_6aaccc24::function_da693cbe("challengeTypeText", 1, 1, "int", var_74cf4193);
		namespace_6aaccc24::function_da693cbe("showIntelRewardText", 1, 1, "int", var_e89bb89d);
	}

	/*
		Name: function_96972b9c
		Namespace: namespace_a0be59de
		Checksum: 0x8F9FCD54
		Offset: 0xBE8
		Size: 0x6C
		Parameters: 1
		Flags: None
	*/
	function function_96972b9c(localclientnum)
	{
		current_val = [[ self ]]->function_92ba69fa(localclientnum, "progress");
		new_val = (current_val + 1) % 2;
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", new_val);
	}

	/*
		Name: function_ac67ad85
		Namespace: namespace_a0be59de
		Checksum: 0xDFDAC918
		Offset: 0xC60
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_ac67ad85(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "tributeAvailable", value);
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
		[[ self ]]->function_d7d2fcce(localclientnum, "challengeTypeText", value);
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
		[[ self ]]->function_d7d2fcce(localclientnum, "showIntelRewardText", value);
	}

	/*
		Name: function_c6703876
		Namespace: namespace_a0be59de
		Checksum: 0xEE75AF3B
		Offset: 0xCD0
		Size: 0x30
		Parameters: 2
		Flags: None
	*/
	function function_c6703876(localclientnum, value)
	{
		[[ self ]]->function_d7d2fcce(localclientnum, "challengeFailing", value);
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
			[[ self ]]->function_d7d2fcce(localclientnum, "_state", 0);
		}
		else
		{
			if(#"hash_6038b42ab4ce959d" == state_name)
			{
				[[ self ]]->function_d7d2fcce(localclientnum, "_state", 1);
			}
			else
			{
				if(#"hash_3045a78750b13a96" == state_name)
				{
					[[ self ]]->function_d7d2fcce(localclientnum, "_state", 2);
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
		[[ self ]]->function_d7d2fcce(localclientnum, "rewardText", value);
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
		namespace_6aaccc24::function_fa582112(localclientnum);
		[[ self ]]->set_state(localclientnum, #"defaultstate");
		[[ self ]]->function_d7d2fcce(localclientnum, "challengeText", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "bottomText", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "bInLocation", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "progress", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "tributeAvailable", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "rewardHidden", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "challengeFailing", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "rewardText", #"");
		[[ self ]]->function_d7d2fcce(localclientnum, "challengeTypeText", 0);
		[[ self ]]->function_d7d2fcce(localclientnum, "showIntelRewardText", 0);
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
	Name: function_5c1bb138
	Namespace: zm_dac_challenges_hud
	Checksum: 0x43694CEB
	Offset: 0x358
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function function_5c1bb138()
{
	elem = new class_a0be59de();
	[[ elem ]]->function_5c1bb138();
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
	Name: function_1c836e71
	Namespace: zm_dac_challenges_hud
	Checksum: 0x9EC00B07
	Offset: 0x440
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1c836e71(localclientnum, value)
{
	[[ self ]]->function_1c836e71(localclientnum, value);
}

/*
	Name: function_2dde4d6c
	Namespace: zm_dac_challenges_hud
	Checksum: 0x8E7288B9
	Offset: 0x470
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_2dde4d6c(localclientnum, value)
{
	[[ self ]]->function_2dde4d6c(localclientnum, value);
}

/*
	Name: function_ad9c4f0
	Namespace: zm_dac_challenges_hud
	Checksum: 0xEEF73E4
	Offset: 0x4A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ad9c4f0(localclientnum, value)
{
	[[ self ]]->function_ad9c4f0(localclientnum, value);
}

/*
	Name: function_96972b9c
	Namespace: zm_dac_challenges_hud
	Checksum: 0xA3EA23D
	Offset: 0x4D0
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_96972b9c(localclientnum)
{
	[[ self ]]->function_96972b9c(localclientnum);
}

/*
	Name: function_ac67ad85
	Namespace: zm_dac_challenges_hud
	Checksum: 0x6A6898A
	Offset: 0x4F8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_ac67ad85(localclientnum, value)
{
	[[ self ]]->function_ac67ad85(localclientnum, value);
}

/*
	Name: function_3fdd9da7
	Namespace: zm_dac_challenges_hud
	Checksum: 0x2F26F526
	Offset: 0x528
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_3fdd9da7(localclientnum, value)
{
	[[ self ]]->function_3fdd9da7(localclientnum, value);
}

/*
	Name: function_c6703876
	Namespace: zm_dac_challenges_hud
	Checksum: 0xFEBD2480
	Offset: 0x558
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c6703876(localclientnum, value)
{
	[[ self ]]->function_c6703876(localclientnum, value);
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

