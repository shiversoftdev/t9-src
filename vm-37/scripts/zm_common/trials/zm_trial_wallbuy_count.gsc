#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_wallbuy_count;

/*
	Name: __init__system__
	Namespace: zm_trial_wallbuy_count
	Checksum: 0xF055BA87
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_wallbuy_count", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_wallbuy_count
	Checksum: 0xE631A323
	Offset: 0xD8
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"wallbuy_count", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_wallbuy_count
	Checksum: 0x351B001D
	Offset: 0x140
	Size: 0x124
	Parameters: 1
	Flags: Private
*/
function private on_begin(var_b3d469ae)
{
	level.var_21c2f32a = zm_trial::function_5769f26a(var_b3d469ae);
	level.var_943b6e2b = array();
	foreach(player in getplayers())
	{
		player zm_trial_util::function_c2cd0cba(level.var_21c2f32a);
		player zm_trial_util::function_2190356a(0);
		level.var_943b6e2b[player.clientid] = array();
	}
	level thread wallbuy_watcher();
}

/*
	Name: on_end
	Namespace: zm_trial_wallbuy_count
	Checksum: 0x90A27D7A
	Offset: 0x270
	Size: 0x238
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
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
		player zm_trial_util::function_f3aacffb();
	}
}

/*
	Name: is_active
	Namespace: zm_trial_wallbuy_count
	Checksum: 0x2FAA07DF
	Offset: 0x4B0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"wallbuy_count");
	return isdefined(challenge);
}

/*
	Name: wallbuy_watcher
	Namespace: zm_trial_wallbuy_count
	Checksum: 0x9E67BE41
	Offset: 0x4F0
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
			e_player zm_trial_util::function_2190356a(level.var_943b6e2b[e_player.clientid].size);
		}
	}
}

