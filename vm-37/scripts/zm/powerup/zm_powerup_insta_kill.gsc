#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_insta_kill;

/*
	Name: __init__system__
	Namespace: zm_powerup_insta_kill
	Checksum: 0xB5A04C27
	Offset: 0x150
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_insta_kill", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_insta_kill
	Checksum: 0x139549C6
	Offset: 0x198
	Size: 0x9C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("insta_kill", &grab_insta_kill);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("insta_kill", "p7_zm_power_up_insta_kill", #"hash_1784640b956f2f85", &zm_powerups::func_should_always_drop, 0, 0, 0, undefined, "powerup_instant_kill", "zombie_powerup_insta_kill_time", "zombie_powerup_insta_kill_on");
	}
}

/*
	Name: grab_insta_kill
	Namespace: zm_powerup_insta_kill
	Checksum: 0x3634A37E
	Offset: 0x240
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function grab_insta_kill(player)
{
	if(zm_powerups::function_cfd04802(#"insta_kill"))
	{
		level thread function_d7a1e6a8(self, player);
	}
	else
	{
		level thread insta_kill_powerup(self, player);
	}
	player thread zm_powerups::powerup_vo("insta_kill");
}

/*
	Name: function_d7a1e6a8
	Namespace: zm_powerup_insta_kill
	Checksum: 0x3A9E6BAE
	Offset: 0x2D8
	Size: 0x180
	Parameters: 2
	Flags: Linked
*/
function function_d7a1e6a8(e_powerup, player)
{
	player notify(#"powerup instakill");
	player endon(#"powerup instakill", #"disconnect");
	if(player bgb::is_enabled(#"zm_bgb_temporal_gift"))
	{
		n_wait_time = 60;
	}
	else
	{
		n_wait_time = 30;
	}
	player thread zm_powerups::function_5091b029("insta_kill");
	if(isdefined(player) && isplayer(player) && isdefined(e_powerup.hint))
	{
		player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", e_powerup.hint);
	}
	player zombie_utility::function_826f5e98(#"zombie_insta_kill", 1);
	level waittilltimeout(n_wait_time, #"end_game");
	player zombie_utility::function_826f5e98(#"zombie_insta_kill", 0);
	player notify(#"insta_kill_over");
}

/*
	Name: insta_kill_powerup
	Namespace: zm_powerup_insta_kill
	Checksum: 0xEC1B95E5
	Offset: 0x460
	Size: 0x28A
	Parameters: 2
	Flags: Linked
*/
function insta_kill_powerup(drop_item, player)
{
	level notify("powerup instakill_" + player.team);
	level endon("powerup instakill_" + player.team);
	if(isdefined(level.insta_kill_powerup_override))
	{
		level thread [[level.insta_kill_powerup_override]](drop_item, player);
		return;
	}
	team = player.team;
	level thread zm_powerups::show_on_hud(team, "insta_kill");
	players = getplayers();
	foreach(e_player in players)
	{
		if(isdefined(e_player) && isplayer(e_player) && isdefined(drop_item.hint))
		{
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", drop_item.hint);
		}
	}
	zombie_utility::function_c7ab6cbc(#"zombie_insta_kill", team, 1);
	n_wait_time = 30;
	if(bgb::is_team_enabled(#"zm_bgb_temporal_gift"))
	{
		n_wait_time = n_wait_time + 30;
	}
	wait(n_wait_time);
	zombie_utility::function_c7ab6cbc(#"zombie_insta_kill", team, 0);
	players = getplayers(team);
	for(i = 0; i < players.size; i++)
	{
		if(isdefined(players[i]))
		{
			players[i] notify(#"insta_kill_over");
		}
	}
}

