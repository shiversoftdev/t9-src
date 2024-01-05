#using scripts\core_common\lui_shared.csc;

class class_a0be59de : cluielem
{

	/*
		Name: constructor
		Namespace: namespace_a0be59de
		Checksum: 0x3AAA5013
		Offset: 0x650
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
		Checksum: 0x8614C338
		Offset: 0xD30
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
		Checksum: 0x224122F1
		Offset: 0xAF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_binlocation(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bInLocation", value);
	}

	/*
		Name: open
		Namespace: namespace_a0be59de
		Checksum: 0xE6D63E83
		Offset: 0xA58
		Size: 0x24
		Parameters: 1
		Flags: Linked
	*/
	function open(localclientnum)
	{
		cluielem::open(localclientnum);
	}

	/*
		Name: function_1097decc
		Namespace: namespace_a0be59de
		Checksum: 0xEEEE84F6
		Offset: 0xCF8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_1097decc(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showChallenge", value);
	}

	/*
		Name: set_challengetext
		Namespace: namespace_a0be59de
		Checksum: 0xEE0AAD98
		Offset: 0xA88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_challengetext(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeText", value);
	}

	/*
		Name: set_bottomtext
		Namespace: namespace_a0be59de
		Checksum: 0x4480CD71
		Offset: 0xAC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_bottomtext(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "bottomText", value);
	}

	/*
		Name: set_rewardhidden
		Namespace: namespace_a0be59de
		Checksum: 0xC55702D6
		Offset: 0xBE0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_rewardhidden(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "rewardHidden", value);
	}

	/*
		Name: register_clientside
		Namespace: namespace_a0be59de
		Checksum: 0x7F1B2EF
		Offset: 0x8A8
		Size: 0x1C
		Parameters: 0
		Flags: Linked
	*/
	function register_clientside()
	{
		cluielem::register_clientside("zm_dac_challenges_hud");
	}

	/*
		Name: setup_clientfields
		Namespace: namespace_a0be59de
		Checksum: 0xB936EF80
		Offset: 0x670
		Size: 0x22C
		Parameters: 11
		Flags: Linked
	*/
	function setup_clientfields(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d, var_2c511278)
	{
		cluielem::setup_clientfields("zm_dac_challenges_hud");
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
		cluielem::add_clientfield("showChallenge", 8000, 1, "int", var_2c511278);
	}

	/*
		Name: increment_progress
		Namespace: namespace_a0be59de
		Checksum: 0x6E342B61
		Offset: 0xB30
		Size: 0x6C
		Parameters: 1
		Flags: Linked
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
		Checksum: 0xF5B9AD06
		Offset: 0xBA8
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_tributeavailable(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "tributeAvailable", value);
	}

	/*
		Name: function_c079b98b
		Namespace: namespace_a0be59de
		Checksum: 0x721F54EB
		Offset: 0xC88
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_c079b98b(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeTypeText", value);
	}

	/*
		Name: function_c21d733d
		Namespace: namespace_a0be59de
		Checksum: 0x75119E12
		Offset: 0xCC0
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_c21d733d(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "showIntelRewardText", value);
	}

	/*
		Name: set_challengefailing
		Namespace: namespace_a0be59de
		Checksum: 0x480B95ED
		Offset: 0xC18
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function set_challengefailing(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "challengeFailing", value);
	}

	/*
		Name: function_f63ec96b
		Namespace: namespace_a0be59de
		Checksum: 0x9CD84BDB
		Offset: 0xC50
		Size: 0x30
		Parameters: 2
		Flags: Linked
	*/
	function function_f63ec96b(localclientnum, value)
	{
		[[ self ]]->set_data(localclientnum, "rewardText", value);
	}

	/*
		Name: function_fa582112
		Namespace: namespace_a0be59de
		Checksum: 0xF50B0409
		Offset: 0x8D0
		Size: 0x180
		Parameters: 1
		Flags: Linked
	*/
	function function_fa582112(localclientnum)
	{
		cluielem::function_fa582112(localclientnum);
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
		[[ self ]]->set_data(localclientnum, "showChallenge", 0);
	}

}

#namespace zm_dac_challenges_hud;

/*
	Name: function_34cfc716
	Namespace: zm_dac_challenges_hud
	Checksum: 0x57358833
	Offset: 0x188
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_34cfc716()
{
	level notify(-1161059368);
}

/*
	Name: register
	Namespace: zm_dac_challenges_hud
	Checksum: 0x8BF26842
	Offset: 0x1A8
	Size: 0x1DE
	Parameters: 11
	Flags: Linked
*/
function register(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d, var_2c511278)
{
	elem = new class_a0be59de();
	[[ elem ]]->setup_clientfields(var_be2ad4d, var_a7896263, var_4866daed, var_afaddf7a, var_5d7491df, var_26df3d64, var_90359ec7, var_2404f6c6, var_74cf4193, var_e89bb89d, var_2c511278);
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
	Checksum: 0x51B30347
	Offset: 0x390
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
	Checksum: 0x52B6703D
	Offset: 0x3D0
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
	Checksum: 0xBFEBFC34
	Offset: 0x3F8
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
	Checksum: 0xD50A8D5D
	Offset: 0x420
	Size: 0x1A
	Parameters: 1
	Flags: None
*/
function is_open(localclientnum)
{
	return [[ self ]]->is_open(localclientnum);
}

/*
	Name: set_challengetext
	Namespace: zm_dac_challenges_hud
	Checksum: 0x759A3E22
	Offset: 0x448
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
	Checksum: 0xAA074C66
	Offset: 0x478
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
	Checksum: 0x7599EBB7
	Offset: 0x4A8
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
	Checksum: 0xBACAFB27
	Offset: 0x4D8
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
	Checksum: 0x54782583
	Offset: 0x500
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
	Checksum: 0x875C39A9
	Offset: 0x530
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
	Checksum: 0x9670181B
	Offset: 0x560
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
	Checksum: 0x6A6C0D69
	Offset: 0x590
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
	Checksum: 0x3D26004A
	Offset: 0x5C0
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
	Checksum: 0xF11B2163
	Offset: 0x5F0
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_c21d733d(localclientnum, value)
{
	[[ self ]]->function_c21d733d(localclientnum, value);
}

/*
	Name: function_1097decc
	Namespace: zm_dac_challenges_hud
	Checksum: 0x22BBF5B3
	Offset: 0x620
	Size: 0x28
	Parameters: 2
	Flags: None
*/
function function_1097decc(localclientnum, value)
{
	[[ self ]]->function_1097decc(localclientnum, value);
}

