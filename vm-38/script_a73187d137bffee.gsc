#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_b8821044;

/*
	Name: function_ebc06903
	Namespace: namespace_b8821044
	Checksum: 0x91FE61EA
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ebc06903()
{
	level notify(89998068);
}

/*
	Name: function_89f2df9
	Namespace: namespace_b8821044
	Checksum: 0x5F7A1DF3
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5487d35db80fc14", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b8821044
	Checksum: 0x3BFBCD46
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
	zm_trial::register_challenge(#"hash_29065f0efd8d6ff3", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_b8821044
	Checksum: 0xD071CF1C
	Offset: 0x160
	Size: 0x124
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(var_b3d469ae)
{
	level.var_21c2f32a = zm_trial::function_5769f26a(var_b3d469ae);
	level.var_943b6e2b = array();
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_c2cd0cba(level.var_21c2f32a);
		player namespace_b22c99a5::function_2190356a(0);
		level.var_943b6e2b[player.clientid] = array();
	}
	level thread wallbuy_watcher();
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_b8821044
	Checksum: 0xB023F4A9
	Offset: 0x290
	Size: 0x238
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(!round_reset)
	{
		var_696c3b4 = array();
		foreach(player in getplayers())
		{
			if(level.var_943b6e2b[player.clientid].size < level.var_21c2f32a)
			{
				if(!isdefined(var_696c3b4))
				{
					var_696c3b4 = [];
				}
				else if(!isarray(var_696c3b4))
				{
					var_696c3b4 = array(var_696c3b4);
				}
				var_696c3b4[var_696c3b4.size] = player;
			}
		}
		if(var_696c3b4.size == 1)
		{
			zm_trial::fail(#"hash_75977ef6e92a8fb9", var_696c3b4);
		}
		else if(var_696c3b4.size > 1)
		{
			zm_trial::fail(#"hash_b877496afcd42c8", var_696c3b4);
		}
	}
	level.var_21c2f32a = undefined;
	level.var_943b6e2b = undefined;
	level notify(#"hash_31c14df051f6c165");
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_f3aacffb();
	}
}

/*
	Name: is_active
	Namespace: namespace_b8821044
	Checksum: 0x3FA64BAA
	Offset: 0x4D0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_29065f0efd8d6ff3");
	return isdefined(challenge);
}

/*
	Name: wallbuy_watcher
	Namespace: namespace_b8821044
	Checksum: 0x46E4DC29
	Offset: 0x510
	Size: 0x1B0
	Parameters: 0
	Flags: Private
*/
function private wallbuy_watcher()
{
	level endon(#"hash_31c14df051f6c165", #"game_ended");
	while(true)
	{
		s_notify = undefined;
		s_notify = level waittill(#"weapon_bought");
		e_player = s_notify.player;
		if(!isinarray(level.var_943b6e2b[e_player.clientid], s_notify.weapon))
		{
			if(!isdefined(level.var_943b6e2b[e_player.clientid]))
			{
				level.var_943b6e2b[e_player.clientid] = [];
			}
			else if(!isarray(level.var_943b6e2b[e_player.clientid]))
			{
				level.var_943b6e2b[e_player.clientid] = array(level.var_943b6e2b[e_player.clientid]);
			}
			level.var_943b6e2b[e_player.clientid][level.var_943b6e2b[e_player.clientid].size] = s_notify.weapon;
		}
		if(level.var_943b6e2b[e_player.clientid].size <= level.var_21c2f32a)
		{
			e_player namespace_b22c99a5::function_2190356a(level.var_943b6e2b[e_player.clientid].size);
		}
	}
}

