#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_a0be59de : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_a0be59de
		Checksum: 0x257523FC
		Offset: 0x460
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
		Checksum: 0xC7FC32F
		Offset: 0xB10
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
		Checksum: 0x8E879F82
		Offset: 0x898
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_binlocation(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bInLocation", value);
	}

	/*
		Name: open
		Namespace: namespace_a0be59de
		Checksum: 0x7501A2DC
		Offset: 0x660
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
		Name: set_challengetext
		Namespace: namespace_a0be59de
		Checksum: 0xA811D523
		Offset: 0x7F8
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_challengetext(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "challengeText", value);
	}

	/*
		Name: set_bottomtext
		Namespace: namespace_a0be59de
		Checksum: 0xB14ED65C
		Offset: 0x848
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_bottomtext(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bottomText", value);
	}

	/*
		Name: set_rewardhidden
		Namespace: namespace_a0be59de
		Checksum: 0x7457E123
		Offset: 0x980
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_rewardhidden(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "rewardHidden", value);
	}

	/*
		Name: close
		Namespace: namespace_a0be59de
		Checksum: 0xFDCEA49D
		Offset: 0x6A8
		Size: 0x24
		Parameters: 1
		Flags: None
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a0be59de
		Checksum: 0x6F192DCE
		Offset: 0x480
		Size: 0x1D4
		Parameters: 0
		Flags: None
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_dac_challenges_hud");
		cluielem::add_clientfield("_state", 1, 2, "int");
		cluielem::function_dcb34c80("string", "challengeText", 1);
		cluielem::function_dcb34c80("string", "bottomText", 1);
		cluielem::add_clientfield("bInLocation", 1, 1, "int");
		cluielem::add_clientfield("progress", 1, 1, "counter");
		cluielem::add_clientfield("tributeAvailable", 1, 3, "int");
		cluielem::add_clientfield("rewardHidden", 1, 1, "int");
		cluielem::add_clientfield("challengeFailing", 1, 1, "int");
		cluielem::function_dcb34c80("string", "rewardText", 1);
		cluielem::add_clientfield("challengeTypeText", 1, 1, "int");
		cluielem::add_clientfield("showIntelRewardText", 1, 1, "int");
	}

	/*
		Name: increment_progress
		Namespace: namespace_a0be59de
		Checksum: 0x7E1D7789
		Offset: 0x8E8
		Size: 0x3C
		Parameters: 1
		Flags: None
	*/
	function increment_progress(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "progress");
	}

	/*
		Name: set_tributeavailable
		Namespace: namespace_a0be59de
		Checksum: 0x7A9E1117
		Offset: 0x930
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_tributeavailable(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "tributeAvailable", value);
	}

	/*
		Name: function_c079b98b
		Namespace: namespace_a0be59de
		Checksum: 0x9237B946
		Offset: 0xA70
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c079b98b(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "challengeTypeText", value);
	}

	/*
		Name: function_c21d733d
		Namespace: namespace_a0be59de
		Checksum: 0x5CF09C37
		Offset: 0xAC0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_c21d733d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showIntelRewardText", value);
	}

	/*
		Name: set_challengefailing
		Namespace: namespace_a0be59de
		Checksum: 0x323199EB
		Offset: 0x9D0
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function set_challengefailing(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "challengeFailing", value);
	}

	/*
		Name: set_state
		Namespace: namespace_a0be59de
		Checksum: 0x9B8D765A
		Offset: 0x6D8
		Size: 0x114
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
			if(#"hash_6038b42ab4ce959d" == state_name)
			{
				player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 1);
			}
			else
			{
				if(#"hash_3045a78750b13a96" == state_name)
				{
					player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "_state", 2);
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
		Checksum: 0x7BA0DF4B
		Offset: 0xA20
		Size: 0x44
		Parameters: 2
		Flags: None
	*/
	function function_f63ec96b(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "rewardText", value);
	}

}

#namespace zm_dac_challenges_hud;

/*
	Name: register
	Namespace: zm_dac_challenges_hud
	Checksum: 0x9018E5FC
	Offset: 0x188
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function register()
{
	elem = new class_a0be59de();
	[[ elem ]]->setup_clientfields();
	return elem;
}

/*
	Name: open
	Namespace: zm_dac_challenges_hud
	Checksum: 0x66AF6895
	Offset: 0x1C8
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
	Namespace: zm_dac_challenges_hud
	Checksum: 0xCF4D1283
	Offset: 0x208
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
	Checksum: 0xD7BC2ED4
	Offset: 0x230
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
	Namespace: zm_dac_challenges_hud
	Checksum: 0x263269A1
	Offset: 0x258
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_state(player, state_name)
{
	[[ self ]]->set_state(player, state_name);
}

/*
	Name: set_challengetext
	Namespace: zm_dac_challenges_hud
	Checksum: 0x7A42EED2
	Offset: 0x288
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_challengetext(player, value)
{
	[[ self ]]->set_challengetext(player, value);
}

/*
	Name: set_bottomtext
	Namespace: zm_dac_challenges_hud
	Checksum: 0x4DAC656C
	Offset: 0x2B8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_bottomtext(player, value)
{
	[[ self ]]->set_bottomtext(player, value);
}

/*
	Name: set_binlocation
	Namespace: zm_dac_challenges_hud
	Checksum: 0xB7945470
	Offset: 0x2E8
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_binlocation(player, value)
{
	[[ self ]]->set_binlocation(player, value);
}

/*
	Name: increment_progress
	Namespace: zm_dac_challenges_hud
	Checksum: 0xF70FA1E1
	Offset: 0x318
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function increment_progress(player)
{
	[[ self ]]->increment_progress(player);
}

/*
	Name: set_tributeavailable
	Namespace: zm_dac_challenges_hud
	Checksum: 0x824A971F
	Offset: 0x340
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_tributeavailable(player, value)
{
	[[ self ]]->set_tributeavailable(player, value);
}

/*
	Name: set_rewardhidden
	Namespace: zm_dac_challenges_hud
	Checksum: 0x15F9945
	Offset: 0x370
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_rewardhidden(player, value)
{
	[[ self ]]->set_rewardhidden(player, value);
}

/*
	Name: set_challengefailing
	Namespace: zm_dac_challenges_hud
	Checksum: 0x408C4C71
	Offset: 0x3A0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function set_challengefailing(player, value)
{
	[[ self ]]->set_challengefailing(player, value);
}

/*
	Name: function_f63ec96b
	Namespace: zm_dac_challenges_hud
	Checksum: 0xEFAB1BC7
	Offset: 0x3D0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_f63ec96b(player, value)
{
	[[ self ]]->function_f63ec96b(player, value);
}

/*
	Name: function_c079b98b
	Namespace: zm_dac_challenges_hud
	Checksum: 0x7281FFDB
	Offset: 0x400
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c079b98b(player, value)
{
	[[ self ]]->function_c079b98b(player, value);
}

/*
	Name: function_c21d733d
	Namespace: zm_dac_challenges_hud
	Checksum: 0x160DDACC
	Offset: 0x430
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c21d733d(player, value)
{
	[[ self ]]->function_c21d733d(player, value);
}

