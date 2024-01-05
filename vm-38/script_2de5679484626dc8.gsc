#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

class class_a0be59de : cluielem
{
	var var_bf9c8c95;
	var var_d5213cbb;

	/*
		Name: constructor
		Namespace: namespace_a0be59de
		Checksum: 0xFD7F7951
		Offset: 0x488
		Size: 0x14
		Parameters: 0
		Flags: Linked, 8
	*/
	constructor()
	{
	}

	/*
		Name: destructor
		Namespace: namespace_a0be59de
		Checksum: 0xBE5D34AC
		Offset: 0xA68
		Size: 0x14
		Parameters: 0
		Flags: Linked, 16, 128
	*/
	destructor()
	{
	}

	/*
		Name: set_binlocation
		Namespace: namespace_a0be59de
		Checksum: 0xC496793F
		Offset: 0x7A0
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_binlocation(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bInLocation", value);
	}

	/*
		Name: open
		Namespace: namespace_a0be59de
		Checksum: 0xB0C56A01
		Offset: 0x688
		Size: 0x3C
		Parameters: 2
		Flags: Linked
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
		Name: function_1097decc
		Namespace: namespace_a0be59de
		Checksum: 0x90EDAA50
		Offset: 0xA18
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_1097decc(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showChallenge", value);
	}

	/*
		Name: set_challengetext
		Namespace: namespace_a0be59de
		Checksum: 0x7C5A857B
		Offset: 0x700
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_challengetext(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "challengeText", value);
	}

	/*
		Name: set_bottomtext
		Namespace: namespace_a0be59de
		Checksum: 0xDAB2A7C2
		Offset: 0x750
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_bottomtext(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "bottomText", value);
	}

	/*
		Name: set_rewardhidden
		Namespace: namespace_a0be59de
		Checksum: 0x384811DB
		Offset: 0x888
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_rewardhidden(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "rewardHidden", value);
	}

	/*
		Name: close
		Namespace: namespace_a0be59de
		Checksum: 0x5E8A5310
		Offset: 0x6D0
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function close(player)
	{
		cluielem::close_luielem(player);
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a0be59de
		Checksum: 0xEF99595E
		Offset: 0x4A8
		Size: 0x1D4
		Parameters: 0
		Flags: Linked
	*/
	function setup_clientfields()
	{
		cluielem::setup_clientfields("zm_dac_challenges_hud");
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
		cluielem::add_clientfield("showChallenge", 8000, 1, "int");
	}

	/*
		Name: increment_progress
		Namespace: namespace_a0be59de
		Checksum: 0x592530E8
		Offset: 0x7F0
		Size: 0x3C
		Parameters: 1
		Flags: Linked
	*/
	function increment_progress(player)
	{
		player clientfield::function_bb878fc3(var_d5213cbb, var_bf9c8c95, "progress");
	}

	/*
		Name: set_tributeavailable
		Namespace: namespace_a0be59de
		Checksum: 0xB01CE6ED
		Offset: 0x838
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_tributeavailable(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "tributeAvailable", value);
	}

	/*
		Name: function_c079b98b
		Namespace: namespace_a0be59de
		Checksum: 0x8F77A92C
		Offset: 0x978
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_c079b98b(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "challengeTypeText", value);
	}

	/*
		Name: function_c21d733d
		Namespace: namespace_a0be59de
		Checksum: 0x406C9474
		Offset: 0x9C8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_c21d733d(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "showIntelRewardText", value);
	}

	/*
		Name: set_challengefailing
		Namespace: namespace_a0be59de
		Checksum: 0xF5E47E21
		Offset: 0x8D8
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function set_challengefailing(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "challengeFailing", value);
	}

	/*
		Name: function_f63ec96b
		Namespace: namespace_a0be59de
		Checksum: 0x19AA1F94
		Offset: 0x928
		Size: 0x44
		Parameters: 2
		Flags: Linked
	*/
	function function_f63ec96b(player, value)
	{
		player clientfield::function_9bf78ef8(var_d5213cbb, var_bf9c8c95, "rewardText", value);
	}

}

#namespace zm_dac_challenges_hud;

/*
	Name: function_9ad5422e
	Namespace: zm_dac_challenges_hud
	Checksum: 0x7DE1387B
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9ad5422e()
{
	level notify(1340819254);
}

/*
	Name: register
	Namespace: zm_dac_challenges_hud
	Checksum: 0x9F83B616
	Offset: 0x1B0
	Size: 0x34
	Parameters: 0
	Flags: Linked
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
	Checksum: 0x40D59CB0
	Offset: 0x1F0
	Size: 0x38
	Parameters: 2
	Flags: Linked
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
	Checksum: 0x6221B1B7
	Offset: 0x230
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function close(player)
{
	[[ self ]]->close(player);
}

/*
	Name: is_open
	Namespace: zm_dac_challenges_hud
	Checksum: 0xD7920DB2
	Offset: 0x258
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function is_open(player)
{
	return [[ self ]]->function_7bfd10e6(player);
}

/*
	Name: set_challengetext
	Namespace: zm_dac_challenges_hud
	Checksum: 0xFAB373FC
	Offset: 0x280
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_challengetext(player, value)
{
	[[ self ]]->set_challengetext(player, value);
}

/*
	Name: set_bottomtext
	Namespace: zm_dac_challenges_hud
	Checksum: 0x9F83E4F1
	Offset: 0x2B0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_bottomtext(player, value)
{
	[[ self ]]->set_bottomtext(player, value);
}

/*
	Name: set_binlocation
	Namespace: zm_dac_challenges_hud
	Checksum: 0xE02FE9AA
	Offset: 0x2E0
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_binlocation(player, value)
{
	[[ self ]]->set_binlocation(player, value);
}

/*
	Name: increment_progress
	Namespace: zm_dac_challenges_hud
	Checksum: 0x8E5AA914
	Offset: 0x310
	Size: 0x1C
	Parameters: 1
	Flags: Linked
*/
function increment_progress(player)
{
	[[ self ]]->increment_progress(player);
}

/*
	Name: set_tributeavailable
	Namespace: zm_dac_challenges_hud
	Checksum: 0x4AEB2F1E
	Offset: 0x338
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_tributeavailable(player, value)
{
	[[ self ]]->set_tributeavailable(player, value);
}

/*
	Name: set_rewardhidden
	Namespace: zm_dac_challenges_hud
	Checksum: 0x6E581F97
	Offset: 0x368
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function set_rewardhidden(player, value)
{
	[[ self ]]->set_rewardhidden(player, value);
}

/*
	Name: set_challengefailing
	Namespace: zm_dac_challenges_hud
	Checksum: 0xCAE54952
	Offset: 0x398
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
	Checksum: 0xC6584A80
	Offset: 0x3C8
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
	Checksum: 0x7459EB1B
	Offset: 0x3F8
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_c079b98b(player, value)
{
	[[ self ]]->function_c079b98b(player, value);
}

/*
	Name: function_c21d733d
	Namespace: zm_dac_challenges_hud
	Checksum: 0xC7989957
	Offset: 0x428
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_c21d733d(player, value)
{
	[[ self ]]->function_c21d733d(player, value);
}

/*
	Name: function_1097decc
	Namespace: zm_dac_challenges_hud
	Checksum: 0xD3CB46EC
	Offset: 0x458
	Size: 0x28
	Parameters: 2
	Flags: Linked
*/
function function_1097decc(player, value)
{
	[[ self ]]->function_1097decc(player, value);
}

