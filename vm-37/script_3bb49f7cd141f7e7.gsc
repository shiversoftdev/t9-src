#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_5c493a54;

/*
	Name: function_89f2df9
	Namespace: namespace_5c493a54
	Checksum: 0x62FCD423
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_23b914dca866a297", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5c493a54
	Checksum: 0x47E06245
	Offset: 0xE0
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
	zm_trial::register_challenge(#"hash_b7f913776f85df2", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_5c493a54
	Checksum: 0xCA542476
	Offset: 0x148
	Size: 0x118
	Parameters: 3
	Flags: Private
*/
function private function_d1de6a85(var_2e5ed433, var_1532dab3, var_94d24883)
{
	level.var_2e5ed433 = zm_trial::function_5769f26a(var_2e5ed433) * 1000;
	if(isdefined(var_1532dab3))
	{
		var_1532dab3 = zm_trial::function_5769f26a(var_1532dab3);
	}
	if(isdefined(var_94d24883))
	{
		var_94d24883 = zm_trial::function_5769f26a(var_94d24883);
	}
	foreach(player in getplayers())
	{
		player thread point_watcher(var_1532dab3, var_94d24883);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_5c493a54
	Checksum: 0xBCE96793
	Offset: 0x268
	Size: 0x28
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level.var_2e5ed433 = undefined;
	level notify(#"hash_2669c6e7b1eb2e4b");
}

/*
	Name: is_active
	Namespace: namespace_5c493a54
	Checksum: 0xB7C35AF9
	Offset: 0x298
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_b7f913776f85df2");
	return isdefined(challenge);
}

/*
	Name: point_watcher
	Namespace: namespace_5c493a54
	Checksum: 0x78796C74
	Offset: 0x2D8
	Size: 0x11C
	Parameters: 2
	Flags: Private
*/
function private point_watcher(var_1532dab3, var_94d24883)
{
	if(!isdefined(var_1532dab3))
	{
		var_1532dab3 = 1;
	}
	if(!isdefined(var_94d24883))
	{
		var_94d24883 = 0.9;
	}
	level endon(#"hash_2669c6e7b1eb2e4b", #"end_game", #"hash_7646638df88a3656");
	self endon(#"disconnect");
	wait(15);
	while(true)
	{
		if(isalive(self) && !self laststand::player_is_in_laststand() && isdefined(self.score) && self.score > level.var_2e5ed433)
		{
			self dodamage(var_1532dab3, self.origin);
			wait(var_94d24883);
		}
		waitframe(1);
	}
}

