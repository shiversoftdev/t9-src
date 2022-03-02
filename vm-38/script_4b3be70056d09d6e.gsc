#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace zm_powerup_bonus_points_team;

/*
	Name: function_b515b14b
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0x2EC56B74
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b515b14b()
{
	level notify(941599182);
}

/*
	Name: function_89f2df9
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0x1FFD0E8A
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_powerup_bonus_points_team", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0x25DA5DF0
	Offset: 0x158
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("bonus_points_team", &grab_bonus_points_team);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("bonus_points_team", "zombie_z_money_icon", #"hash_5162c283a9d6ee16", &zm_powerups::func_should_always_drop, 0, 0, 0);
	}
}

/*
	Name: grab_bonus_points_team
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0xE362815A
	Offset: 0x1E8
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function grab_bonus_points_team(player)
{
	level thread bonus_points_team_powerup(self, player);
	player thread zm_powerups::powerup_vo("bonus");
}

/*
	Name: bonus_points_team_powerup
	Namespace: zm_powerup_bonus_points_team
	Checksum: 0x2D0906EC
	Offset: 0x238
	Size: 0x1A0
	Parameters: 2
	Flags: Linked
*/
function bonus_points_team_powerup(item, player)
{
	if(is_true(level.var_a4c782b9))
	{
		points = randomintrange(2, 11) * 100;
	}
	else
	{
		points = 500;
	}
	if(isdefined(level.bonus_points_powerup_override))
	{
		points = item [[level.bonus_points_powerup_override]](player);
	}
	foreach(e_player in level.players)
	{
		if(isdefined(e_player) && isplayer(e_player) && isdefined(item.hint))
		{
			e_player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", item.hint);
		}
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"bonus_points_powerup_zm", #attacker:e_player});
	}
}

