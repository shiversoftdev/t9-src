#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_placeable_mine.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using script_1caf36ff04a85ff6;
#using scripts\core_common\item_inventory.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_full_ammo;

/*
	Name: __init__system__
	Namespace: zm_powerup_full_ammo
	Checksum: 0xAB940863
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_full_ammo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_full_ammo
	Checksum: 0x1DB25E4F
	Offset: 0x148
	Size: 0x8C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("full_ammo", &grab_full_ammo);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("full_ammo", #"p7_zm_power_up_max_ammo", #"zombie/powerup_max_ammo", &zm_powerups::func_should_always_drop, 0, 0, 0);
	}
}

/*
	Name: grab_full_ammo
	Namespace: zm_powerup_full_ammo
	Checksum: 0xC63F9AA2
	Offset: 0x1E0
	Size: 0x8C
	Parameters: 1
	Flags: Linked
*/
function grab_full_ammo(player)
{
	if(zm_powerups::function_cfd04802(#"full_ammo"))
	{
		level thread function_dae1df4d(self, player);
	}
	else
	{
		level thread full_ammo_powerup(self, player);
	}
	player thread zm_powerups::powerup_vo("full_ammo");
}

/*
	Name: function_dae1df4d
	Namespace: zm_powerup_full_ammo
	Checksum: 0x51A775E1
	Offset: 0x278
	Size: 0x13C
	Parameters: 2
	Flags: Linked
*/
function function_dae1df4d(e_powerup, player)
{
	if(isdefined(level.check_player_is_ready_for_ammo))
	{
		if([[level.check_player_is_ready_for_ammo]](player) == 0)
		{
			return;
		}
	}
	if(isdefined(player) && isplayer(player) && isdefined(e_powerup.hint))
	{
		player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", e_powerup.hint);
	}
	player.var_655c0753 = undefined;
	player notify(#"zmb_max_ammo");
	player zm_placeable_mine::disable_all_prompts_for_player();
	player zm_weapons::function_51aa5813(17 + 1);
	player zm_weapons::function_51aa5813(((17 + 1) + 8) + 1);
	player playsoundtoplayer(#"zmb_full_ammo", player);
}

/*
	Name: full_ammo_powerup
	Namespace: zm_powerup_full_ammo
	Checksum: 0xFD882538
	Offset: 0x3C0
	Size: 0x21C
	Parameters: 2
	Flags: Linked
*/
function full_ammo_powerup(drop_item, player)
{
	players = getplayers(player.team);
	if(isdefined(level._get_game_module_players))
	{
		players = [[level._get_game_module_players]](player);
	}
	level notify(#"zmb_max_ammo_level");
	foreach(player in players)
	{
		if(isdefined(level.check_player_is_ready_for_ammo))
		{
			if([[level.check_player_is_ready_for_ammo]](player) == 0)
			{
				continue;
			}
		}
		if(player util::is_spectating())
		{
			continue;
		}
		if(isdefined(player) && isplayer(player) && isdefined(drop_item.hint))
		{
			player zm_utility::function_846eb7dd(#"hash_1d757d99eb407952", drop_item.hint);
		}
		player.var_655c0753 = undefined;
		player notify(#"zmb_max_ammo");
		player zm_placeable_mine::disable_all_prompts_for_player();
		player zm_weapons::function_51aa5813(17 + 1);
		player zm_weapons::function_51aa5813(((17 + 1) + 8) + 1);
	}
	level thread full_ammo_on_hud(drop_item, player.team);
}

/*
	Name: function_3ecbd9d
	Namespace: zm_powerup_full_ammo
	Checksum: 0x5D1DFE17
	Offset: 0x5E8
	Size: 0x10C
	Parameters: 1
	Flags: None
*/
function function_3ecbd9d(w_weapon)
{
	self endon(#"disconnect");
	n_slot = self gadgetgetslot(w_weapon);
	if(w_weapon == getweapon(#"tomahawk_t8") || w_weapon == getweapon(#"tomahawk_t8_upgraded"))
	{
		while(self function_36dfc05f(n_slot))
		{
			waitframe(1);
		}
		self notify(#"hash_3d73720d4588203c");
		self gadgetpowerset(n_slot, 100);
	}
	else
	{
		self gadgetpowerset(n_slot, 100);
	}
}

/*
	Name: full_ammo_on_hud
	Namespace: zm_powerup_full_ammo
	Checksum: 0xFB175390
	Offset: 0x700
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function full_ammo_on_hud(drop_item, player_team)
{
	players = getplayers(player_team);
	players[0] playsoundtoteam("zmb_full_ammo", player_team);
}

/*
	Name: function_b695b971
	Namespace: zm_powerup_full_ammo
	Checksum: 0xC84438AF
	Offset: 0x768
	Size: 0x12
	Parameters: 0
	Flags: None
*/
function function_b695b971()
{
	return level.zm_genesis_robot_pay_towardsreactswordstart == 0;
}

