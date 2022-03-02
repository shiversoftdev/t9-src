#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_983e5028;

/*
	Name: function_89f2df9
	Namespace: namespace_983e5028
	Checksum: 0x684F9CE9
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1633972af838a447", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_983e5028
	Checksum: 0x5309BD2A
	Offset: 0xE8
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
	zm_trial::register_challenge(#"hash_2fc73bc20035fe8", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_983e5028
	Checksum: 0x58B6A529
	Offset: 0x150
	Size: 0xD8
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(var_d34d02af)
{
	level.var_d34d02af = zm_trial::function_5769f26a(var_d34d02af);
	callback::function_78ccee50(&function_78ccee50);
	foreach(player in getplayers())
	{
		player thread function_a5a431f6();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_983e5028
	Checksum: 0x7FED28C8
	Offset: 0x230
	Size: 0x36
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	callback::function_deba137d(&function_78ccee50);
	level.var_d34d02af = undefined;
}

/*
	Name: function_78ccee50
	Namespace: namespace_983e5028
	Checksum: 0xD622FABD
	Offset: 0x270
	Size: 0x7C
	Parameters: 1
	Flags: Private
*/
function private function_78ccee50(params)
{
	if(zm_weapons::function_e17d0760(params.weapon))
	{
		self zm_score::player_reduce_points("take_specified", level.var_d34d02af * 2);
	}
	else
	{
		self zm_score::player_reduce_points("take_specified", level.var_d34d02af);
	}
}

/*
	Name: function_a5a431f6
	Namespace: namespace_983e5028
	Checksum: 0x9DED69E
	Offset: 0x2F8
	Size: 0x90
	Parameters: 0
	Flags: Private
*/
function private function_a5a431f6()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		var_be17187b = undefined;
		var_be17187b = self waittill(#"hash_7d855302d88c6701", #"lightning_ball_created");
		self zm_score::player_reduce_points("take_specified", level.var_d34d02af);
	}
}

