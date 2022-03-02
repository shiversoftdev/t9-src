#using script_14f4a3c583c77d4b;
#using script_6021ce59143452c3;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_score.gsc;

#namespace namespace_473cb198;

/*
	Name: function_c57674d3
	Namespace: namespace_473cb198
	Checksum: 0x5240BDC5
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c57674d3()
{
	level notify(226547962);
}

/*
	Name: function_89f2df9
	Namespace: namespace_473cb198
	Checksum: 0x37970B4E
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_535840aa7a1edbf3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_473cb198
	Checksum: 0x7D6792D0
	Offset: 0xF8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_1cae21fec7ac065e", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_473cb198
	Checksum: 0x4967FD0
	Offset: 0x160
	Size: 0xD0
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(var_899c6d17)
{
	if(isdefined(var_899c6d17))
	{
		var_899c6d17 = zm_trial::function_5769f26a(var_899c6d17);
	}
	else
	{
		var_899c6d17 = 0;
	}
	wait(6);
	foreach(player in getplayers())
	{
		player thread function_25f2b64(var_899c6d17);
	}
}

/*
	Name: function_25f2b64
	Namespace: namespace_473cb198
	Checksum: 0x40941CEC
	Offset: 0x238
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private function_25f2b64(var_899c6d17)
{
	if(self bgb::is_enabled(#"zm_bgb_shopping_free"))
	{
		self bgb::do_one_shot_use();
		self playsoundtoplayer(#"zmb_bgb_shoppingfree_coinreturn", self);
		return;
	}
	self.score = var_899c6d17;
	self.pers[#"score"] = var_899c6d17;
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_473cb198
	Checksum: 0x14246399
	Offset: 0x2D0
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
}

