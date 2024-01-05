#using scripts\zm\perk\zm_perk_death_perception.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_trial.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_trial_disable_hud;

/*
	Name: __init__system__
	Namespace: zm_trial_disable_hud
	Checksum: 0xE2E63F4D
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_disable_hud", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_disable_hud
	Checksum: 0x9E96F7F8
	Offset: 0xC8
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
	zm_trial::register_challenge(#"disable_hud", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_disable_hud
	Checksum: 0x3DC4F60D
	Offset: 0x130
	Size: 0x2C
	Parameters: 2
	Flags: Private
*/
function private on_begin(local_client_num, params)
{
	level thread function_40349f7c();
}

/*
	Name: function_40349f7c
	Namespace: zm_trial_disable_hud
	Checksum: 0xAC163EE0
	Offset: 0x168
	Size: 0x1B0
	Parameters: 1
	Flags: None
*/
function function_40349f7c(localclientnum)
{
	level endon(#"hash_38932f8deb28b470", #"end_game");
	wait(12);
	level.var_dc60105c = 1;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player zm_perk_death_perception::function_25410869(localclientnum);
			}
		}
	}
}

/*
	Name: on_end
	Namespace: zm_trial_disable_hud
	Checksum: 0xACA89213
	Offset: 0x320
	Size: 0x198
	Parameters: 1
	Flags: Private
*/
function private on_end(local_client_num)
{
	level notify(#"hash_38932f8deb28b470");
	level.var_dc60105c = undefined;
	maxclients = getmaxlocalclients();
	for(localclientnum = 0; localclientnum < maxclients; localclientnum++)
	{
		if(isdefined(function_5c10bd79(localclientnum)))
		{
			foreach(player in getplayers(localclientnum))
			{
				player zm::function_92f0c63(localclientnum);
			}
			foreach(player in getplayers(localclientnum))
			{
				player zm_perk_death_perception::function_25410869(localclientnum);
			}
		}
	}
}

