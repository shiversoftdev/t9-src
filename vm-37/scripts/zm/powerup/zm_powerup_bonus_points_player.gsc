#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;

#namespace zm_powerup_bonus_points_player;

/*
	Name: __init__system__
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x152C833C
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_bonus_points_player", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x7452FEB5
	Offset: 0x1A0
	Size: 0xF4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("bonus_points_player", &grab_bonus_points_player);
	zm_powerups::register_powerup("bonus_points_player_shared", &function_ec014d54);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("bonus_points_player", "zombie_z_money_icon", #"hash_5162c283a9d6ee16", &zm_powerups::func_should_never_drop, 1, 0, 0);
		zm_powerups::add_zombie_powerup("bonus_points_player_shared", "zombie_z_money_icon", #"hash_5162c283a9d6ee16", &zm_powerups::func_should_never_drop, 1, 0, 0);
	}
}

/*
	Name: grab_bonus_points_player
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x227519F4
	Offset: 0x2A0
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function grab_bonus_points_player(player)
{
	level thread bonus_points_player_powerup(self, player);
	player thread zm_powerups::powerup_vo("bonus");
	if(zm_utility::is_standard())
	{
		player contracts::increment_zm_contract(#"hash_722a0179c583fff8");
	}
}

/*
	Name: function_ec014d54
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0xD8436395
	Offset: 0x320
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_ec014d54(player)
{
	level thread function_56784293(self, player);
	if(player !== self.var_2b5ec373)
	{
		player thread zm_powerups::powerup_vo("bonus");
		if(isdefined(self.var_2b5ec373) && !is_true(self.var_2b5ec373.var_a50db39d))
		{
			self.var_2b5ec373.var_a50db39d = 1;
			self.var_2b5ec373 zm_stats::increment_challenge_stat(#"hash_733e96c5baacb1da");
		}
	}
}

/*
	Name: bonus_points_player_powerup
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x11D99E51
	Offset: 0x3F0
	Size: 0x20C
	Parameters: 2
	Flags: Linked
*/
function bonus_points_player_powerup(item, player)
{
	if(is_true(item.var_258c5fbc))
	{
		points = item.var_258c5fbc;
		if(points == 100)
		{
			item.var_df23dc7d = "essence_pickup_small";
		}
		else if(points == 250)
		{
			item.var_df23dc7d = "essence_pickup_medium";
		}
	}
	else
	{
		if(is_true(level.var_a4c782b9))
		{
			points = randomintrange(1, 25) * 100;
		}
		else
		{
			points = 500;
		}
	}
	if(isdefined(level.bonus_points_powerup_override))
	{
		points = item [[level.bonus_points_powerup_override]](player);
	}
	if(isdefined(item.bonus_points_powerup_override))
	{
		points = item [[item.bonus_points_powerup_override]](player);
	}
	if(isdefined(player) && isplayer(player) && isdefined(item.hint))
	{
		player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", item.hint);
	}
	player notify(#"bonus_points_player_grabbed", {#e_powerup:item});
	level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:(isdefined(item.var_df23dc7d) ? item.var_df23dc7d : "bonus_points_powerup_zm"), #attacker:player});
}

/*
	Name: function_56784293
	Namespace: zm_powerup_bonus_points_player
	Checksum: 0x9F8E3B5E
	Offset: 0x608
	Size: 0x10C
	Parameters: 2
	Flags: Linked
*/
function function_56784293(item, player)
{
	if(isdefined(player) && isplayer(player) && isdefined(item.hint))
	{
		player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", item.hint);
	}
	player notify(#"bonus_points_player_grabbed", {#e_powerup:item});
	level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:(isdefined(item.var_df23dc7d) ? item.var_df23dc7d : "bonus_points_powerup_zm"), #attacker:player});
}

