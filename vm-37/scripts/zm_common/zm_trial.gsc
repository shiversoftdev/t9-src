#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_game_module.gsc;
#using script_48f7c4ab73137f8;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\music_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial;

/*
	Name: __init__system__
	Namespace: zm_trial
	Checksum: 0x51B711B1
	Offset: 0x2F8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial
	Checksum: 0xA42746E6
	Offset: 0x340
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_trial_mode())
	{
		return;
	}
	if(!isdefined(level.var_c556bb2e))
	{
		level.var_c556bb2e = [];
	}
	if(!isdefined(level.var_75e93a54))
	{
		level.var_75e93a54 = [];
	}
	level.var_d77a6967 = undefined;
	level.var_3dd975d5 = undefined;
	level.var_ab84adee = 1;
	level.var_62fc4786 = &function_e80e07db;
	function_4dbf2663();
	level.var_495d3112 = &reset_round;
}

/*
	Name: function_e80e07db
	Namespace: zm_trial
	Checksum: 0x3E66AB2C
	Offset: 0x400
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function function_e80e07db(v_prev_origin)
{
	if(distancesquared(self.origin, v_prev_origin) > 576)
	{
		return false;
	}
	var_860fbf2a = self zm_utility::get_current_zone();
	if(isarray(level.active_zone_names) && isdefined(var_860fbf2a) && zm_utility::check_point_in_playable_area(self.origin))
	{
		foreach(str_zone in level.active_zone_names)
		{
			if(var_860fbf2a == str_zone)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: register_challenge
	Namespace: zm_trial
	Checksum: 0xE57976B8
	Offset: 0x528
	Size: 0xB8
	Parameters: 3
	Flags: Linked
*/
function register_challenge(name, var_3b7ba215, var_6993ecb4)
{
	if(!isdefined(level.var_75e93a54))
	{
		level.var_75e93a54 = [];
	}
	/#
		assert(!isdefined(level.var_75e93a54[name]));
	#/
	info = {#hash_6993ecb4:var_6993ecb4, #hash_3b7ba215:var_3b7ba215, #name:name};
	level.var_75e93a54[name] = info;
}

/*
	Name: function_a36e8c38
	Namespace: zm_trial
	Checksum: 0x800B90D6
	Offset: 0x5E8
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_a36e8c38(name)
{
	if(is_trial_mode() && isdefined(level.var_3dd975d5))
	{
		foreach(active_challenge in level.var_3dd975d5)
		{
			if(active_challenge.name == name)
			{
				return active_challenge;
			}
		}
	}
	return undefined;
}

/*
	Name: function_48736df9
	Namespace: zm_trial
	Checksum: 0x4B8C58C6
	Offset: 0x6A8
	Size: 0x16E
	Parameters: 1
	Flags: Linked
*/
function function_48736df9(var_38f795c7)
{
	if(isdefined(level.var_6d87ac05) && isdefined(level.var_6d87ac05.rounds))
	{
		foreach(var_33c64592 in level.var_6d87ac05.rounds)
		{
			if(isarray(var_33c64592.challenges))
			{
				foreach(s_challenge in var_33c64592.challenges)
				{
					if(s_challenge.name === var_38f795c7 && var_33c64592.round === level.round_number)
					{
						return true;
					}
				}
			}
		}
	}
	return false;
}

/*
	Name: function_a1a9bd5d
	Namespace: zm_trial
	Checksum: 0x8AD152D2
	Offset: 0x820
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_a1a9bd5d(name)
{
	if(!is_trial_mode())
	{
		return 0;
	}
	return level flag::get(name);
}

/*
	Name: is_trial_mode
	Namespace: zm_trial
	Checksum: 0x9CBA825B
	Offset: 0x868
	Size: 0x12
	Parameters: 0
	Flags: Linked
*/
function is_trial_mode()
{
	return zm_utility::is_trials();
}

/*
	Name: function_8e2a923
	Namespace: zm_trial
	Checksum: 0x5721FF34
	Offset: 0x888
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_8e2a923(var_cfb434d8)
{
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableGun", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: function_cd75b690
	Namespace: zm_trial
	Checksum: 0x5155CD3B
	Offset: 0x950
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_cd75b690(var_cfb434d8)
{
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableEquip", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: function_44200d07
	Namespace: zm_trial
	Checksum: 0xFD8FA8DE
	Offset: 0xA18
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_44200d07(var_cfb434d8)
{
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableSpecial", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: function_25ee130
	Namespace: zm_trial
	Checksum: 0x14F89FD8
	Offset: 0xAE0
	Size: 0xF0
	Parameters: 1
	Flags: Linked
*/
function function_25ee130(var_cfb434d8)
{
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableGun", var_cfb434d8);
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableEquip", var_cfb434d8);
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableSpecial", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: function_cdcce681
	Namespace: zm_trial
	Checksum: 0xE4B3889A
	Offset: 0xBD8
	Size: 0xD8
	Parameters: 1
	Flags: None
*/
function function_cdcce681(var_cfb434d8)
{
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableGun", var_cfb434d8);
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableEquip", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: function_2b3a3307
	Namespace: zm_trial
	Checksum: 0x6AAD44CD
	Offset: 0xCB8
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_2b3a3307(var_cfb434d8)
{
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disablePerks", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: function_19a1098f
	Namespace: zm_trial
	Checksum: 0xABDCC8B1
	Offset: 0xD80
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_19a1098f(var_cfb434d8)
{
	clientfield::set_world_uimodel("ZMHudGlobal.trials.disableAbilities", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: function_63bdc1da
	Namespace: zm_trial
	Checksum: 0xD7B7D8D
	Offset: 0xE48
	Size: 0x108
	Parameters: 1
	Flags: None
*/
function function_63bdc1da(var_cfb434d8)
{
	self clientfield::set_player_uimodel("ZMHudGlobal.trials.disableGun", var_cfb434d8);
	self clientfield::set_player_uimodel("ZMHudGlobal.trials.disableEquip", var_cfb434d8);
	self clientfield::set_player_uimodel("ZMHudGlobal.trials.disableSpecial", var_cfb434d8);
	if(!var_cfb434d8)
	{
		foreach(e_player in level.players)
		{
			e_player playsoundtoplayer(#"hash_7da8829d9fc1f7a4", e_player);
		}
	}
}

/*
	Name: fail
	Namespace: zm_trial
	Checksum: 0x6F879DB5
	Offset: 0xF58
	Size: 0x300
	Parameters: 2
	Flags: Linked
*/
function fail(reason, var_eeb30248)
{
	if(!isdefined(reason))
	{
		reason = undefined;
	}
	if(!isdefined(var_eeb30248))
	{
		var_eeb30248 = undefined;
	}
	if(level flag::get("round_reset") || level flag::get(#"trial_failed"))
	{
		return;
	}
	foreach(aplayer in getplayers())
	{
		aplayer val::set("round_reset", "takedamage", 0);
		aplayer val::set("round_reset", "freezecontrols", 1);
		aplayer notify(#"fake_death");
		aplayer function_e0c7d69(0);
		if(level.var_ff482f76 zm_laststand_client::is_open(aplayer))
		{
			level.var_ff482f76 zm_laststand_client::close(aplayer);
		}
	}
	if(!isdefined(reason))
	{
		reason = #"hash_3d9d6e119fdd76ae";
	}
	zm_trial_util::set_game_state(1);
	zm_trial_util::function_58292c4a(reason, var_eeb30248);
	if(level flag::get("special_round"))
	{
		level flag::clear("special_round");
	}
	b_game_ended = 0;
	function_fe2ecb6(function_ba9853db() + 1);
	if(function_ba9853db() < 3)
	{
		level flag::set("round_reset");
		playsoundatposition(#"hash_13781c956ed2b1ca", (0, 0, 0));
	}
	else
	{
		level thread function_18b797ec();
		b_game_ended = 1;
	}
	if(isdefined(level.var_43216bdf))
	{
		[[level.var_43216bdf]](b_game_ended);
	}
}

/*
	Name: function_361e2cb0
	Namespace: zm_trial
	Checksum: 0x94DA7F2D
	Offset: 0x1260
	Size: 0x220
	Parameters: 0
	Flags: None
*/
function function_361e2cb0()
{
	level notify(#"end_round_think");
	setmatchflag("disableIngameMenu", 1);
	foreach(player in getplayers())
	{
		player val::set("end_game", "takedamage", 0);
		player closeingamemenu();
		player closemenu("StartMenu_Main");
	}
	foreach(player in getplayers())
	{
		player val::set("end_game", "freezecontrols", 1);
	}
	playsoundatposition(#"hash_6a80142d79605bc6", (0, 0, 0));
	zm_trial_util::set_game_state(2);
	level.var_7fe57c6b = 1;
	wait(3);
	level notify(#"hash_4c09c9d01060d7ad");
	level notify(#"end_game");
}

/*
	Name: function_18b797ec
	Namespace: zm_trial
	Checksum: 0xF5E69B4C
	Offset: 0x1488
	Size: 0x1C0
	Parameters: 0
	Flags: Linked
*/
function function_18b797ec()
{
	level flag::set(#"trial_failed");
	level notify(#"end_round_think");
	playsoundatposition(#"hash_24ecb9cb90a831b7", (0, 0, 0));
	setmatchflag("disableIngameMenu", 1);
	foreach(player in getplayers())
	{
		player val::set("end_game", "takedamage", 0);
		player val::set("end_game", "freezecontrols", 1);
		player closeingamemenu();
		player closemenu("StartMenu_Main");
	}
	zm_trial_util::set_game_state(3);
	wait(3);
	level notify(#"hash_4c09c9d01060d7ad");
	level notify(#"end_game");
}

/*
	Name: function_ba9853db
	Namespace: zm_trial
	Checksum: 0xCA75CDF8
	Offset: 0x1650
	Size: 0xE
	Parameters: 0
	Flags: Linked
*/
function function_ba9853db()
{
	return level.var_df8480a0;
}

/*
	Name: function_fe2ecb6
	Namespace: zm_trial
	Checksum: 0x8FE789C2
	Offset: 0x1668
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_fe2ecb6(count)
{
	/#
		assert(count >= 0 && count <= 3);
	#/
	level.var_df8480a0 = count;
	clientfield::set_world_uimodel("ZMHudGlobal.trials.strikes", level.var_df8480a0);
}

/*
	Name: function_d02ffd
	Namespace: zm_trial
	Checksum: 0x90E66CA2
	Offset: 0x16E0
	Size: 0x98
	Parameters: 1
	Flags: None
*/
function function_d02ffd(name)
{
	foreach(var_6d87ac05 in level.var_c556bb2e)
	{
		if(var_6d87ac05.name == name)
		{
			return var_6d87ac05;
		}
	}
	return undefined;
}

/*
	Name: function_5769f26a
	Namespace: zm_trial
	Checksum: 0xC71C5E9
	Offset: 0x1780
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_5769f26a(var_c00ecbf1)
{
	for(i = 0; i <= 5000; i++)
	{
		if((hash("" + i)) == var_c00ecbf1)
		{
			return i;
		}
	}
	/#
		assert(0, "" + var_c00ecbf1);
	#/
	return 0;
}

/*
	Name: reset_round
	Namespace: zm_trial
	Checksum: 0xBD6D64E6
	Offset: 0x1810
	Size: 0x1F4
	Parameters: 0
	Flags: Linked, Private
*/
function private reset_round()
{
	level.custom_spawnplayer = undefined;
	wait(3);
	function_47ed291b();
	level lui::screen_fade_out(0.5);
	level notify(#"hash_2f976f64c9301e7f");
	function_f93fbae5();
	function_10801ad3();
	level zm_game_module::zombie_goto_round(level.round_number);
	zm_trial_util::set_game_state(0);
	level zm_game_module::respawn_players();
	waitframe(1);
	function_bcd35efc();
	waitframe(1);
	foreach(player in getplayers())
	{
		player val::reset("round_reset", "takedamage");
		player val::reset("round_reset", "freezecontrols");
		player function_e0c7d69(1);
		player notify(#"round_reset_done");
	}
	level lui::screen_close_menu();
}

/*
	Name: function_ae725d63
	Namespace: zm_trial
	Checksum: 0x71867EDB
	Offset: 0x1A10
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_ae725d63(n_delay)
{
	if(!isdefined(n_delay))
	{
		n_delay = 8;
	}
	if(level flag::get("round_reset"))
	{
		level flag::wait_till_clear("round_reset");
		if(n_delay > 0)
		{
			wait(n_delay);
		}
	}
}

/*
	Name: function_f93fbae5
	Namespace: zm_trial
	Checksum: 0x2B2ED624
	Offset: 0x1A88
	Size: 0x136
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f93fbae5()
{
	foreach(player in getplayers())
	{
		if(!isdefined(player))
		{
			continue;
		}
		if(player laststand::player_is_in_laststand())
		{
			player thread zm_laststand::auto_revive(player);
			player waittilltimeout(4, #"disconnect", #"hash_9b426cce825928d");
		}
		if(isdefined(player))
		{
			player val::reset(#"laststand", "ignoreme");
			player clientfield::set("zmbLastStand", 0);
		}
	}
	waitframe(1);
}

/*
	Name: function_b4d58bfd
	Namespace: zm_trial
	Checksum: 0x90B4D8C5
	Offset: 0x1BC8
	Size: 0x160
	Parameters: 0
	Flags: Linked, Private
*/
function private function_b4d58bfd()
{
	foreach(player in getplayers())
	{
		foreach(weapon in player getweaponslist(1))
		{
			player unlockweapon(weapon);
			if(weapon.dualwieldweapon != level.weaponnone)
			{
				player unlockweapon(weapon.dualwieldweapon);
			}
		}
		player zm_trial_util::function_73ff0096();
	}
}

/*
	Name: function_47ed291b
	Namespace: zm_trial
	Checksum: 0xEDD2995B
	Offset: 0x1D30
	Size: 0xAC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_47ed291b()
{
	foreach(player in getplayers())
	{
		if(!is_true(player.var_16735873))
		{
			player notify(#"fasttravel_over");
		}
	}
}

/*
	Name: function_10801ad3
	Namespace: zm_trial
	Checksum: 0xAA0D697E
	Offset: 0x1DE8
	Size: 0x16E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_10801ad3()
{
	foreach(player in getplayers())
	{
		player.var_42a4759e = {};
		player.var_42a4759e.score = player zm_score::function_ffc2d0bc();
		player.var_42a4759e.score_total = player.score_total;
		if(player.sessionstate == "spectator")
		{
			if(isdefined(player.s_loadout))
			{
				player.var_42a4759e.loadout = player.s_loadout;
			}
			else
			{
				player.var_42a4759e.loadout = undefined;
			}
		}
		else
		{
			player.var_42a4759e.loadout = player zm_weapons::player_get_loadout();
			player takeallweapons();
		}
		player.var_42a4759e.var_8c5bddf5 = player zm_trial_util::function_3f8a4145(0);
	}
}

/*
	Name: function_23baf070
	Namespace: zm_trial
	Checksum: 0x54095672
	Offset: 0x1F60
	Size: 0x114
	Parameters: 1
	Flags: Linked, Private
*/
function private function_23baf070(loadout)
{
	primary_weapons = self getweaponslistprimaries();
	foreach(primary_weapon in primary_weapons)
	{
		if(isdefined(loadout) && primary_weapon === loadout.current)
		{
			self switchtoweaponimmediate(primary_weapon, 1);
			return;
		}
	}
	if(primary_weapons.size > 0)
	{
		self switchtoweaponimmediate(primary_weapons[0], 1);
		return;
	}
	self switchtoweaponimmediate();
}

/*
	Name: function_bcd35efc
	Namespace: zm_trial
	Checksum: 0x277E5D8C
	Offset: 0x2080
	Size: 0x2F0
	Parameters: 0
	Flags: Linked, Private
*/
function private function_bcd35efc()
{
	foreach(player in getplayers())
	{
		if(!isdefined(player.var_42a4759e))
		{
			/#
				/#
					assertmsg("");
				#/
			#/
			continue;
		}
		player zm_trial_util::function_d37a769(player.var_42a4759e.var_8c5bddf5);
		player zm_score::function_c1f146ff(player.var_42a4759e.score);
		player.score_total = player.var_42a4759e.score_total;
		if(isdefined(player.var_42a4759e.loadout))
		{
			player zm_weapons::player_give_loadout(player.var_42a4759e.loadout, 1, 0);
		}
		else
		{
			player takeallweapons();
			player zm_loadout::give_start_weapon(1);
			player zm_loadout::init_player_offhand_weapons();
		}
		if(isarray(player.var_67ba1237) && !isinarray(player.var_67ba1237, #"specialty_additionalprimaryweapon") && isdefined(player.var_42a4759e.var_8c5bddf5.var_1596d94c))
		{
			player zm_weapons::weapon_take(player.var_42a4759e.var_8c5bddf5.var_1596d94c);
			player.var_42a4759e.var_8c5bddf5.var_1596d94c = undefined;
		}
		player zm_trial_util::function_7f999aa0(player.var_42a4759e.var_8c5bddf5);
		player function_23baf070(player.var_42a4759e.loadout);
		for(slot = 0; slot < 3; slot++)
		{
			if(isdefined(player._gadgets_player[slot]))
			{
				player gadgetcharging(slot, 1);
			}
		}
	}
}

/*
	Name: function_4dbf2663
	Namespace: zm_trial
	Checksum: 0xBB840854
	Offset: 0x2378
	Size: 0x44C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4dbf2663()
{
	var_3b363b7a = getgametypesetting(#"zmtrialsvariant");
	if(isdefined(var_3b363b7a) && var_3b363b7a > 0)
	{
		table = hash(((("gamedata/tables/zm/") + util::get_map_name() + "_trials_variant_") + var_3b363b7a) + ".csv");
	}
	else
	{
		table = hash(("gamedata/tables/zm/") + util::get_map_name() + "_trials.csv");
	}
	column_count = tablelookupcolumncount(table);
	var_e1617d73 = tablelookuprowcount(table);
	row = 0;
	while(row < var_e1617d73)
	{
		var_189d26ca = tablelookupcolumnforrow(table, row, 1);
		/#
			assert(!isdefined(function_d02ffd(var_189d26ca)));
		#/
		var_6d87ac05 = {#index:level.var_c556bb2e.size, #rounds:[], #name:var_189d26ca};
		level.var_c556bb2e[level.var_c556bb2e.size] = var_6d87ac05;
		do
		{
			row++;
			round = tablelookupcolumnforrow(table, row, 0);
			if(row < var_e1617d73 && round != 0)
			{
				round_index = round - 1;
				if(!isdefined(var_6d87ac05.rounds[round_index]))
				{
					var_6d87ac05.rounds[round_index] = {};
					round_info = var_6d87ac05.rounds[round_index];
					round_info.name = tablelookupcolumnforrow(table, row, 1);
					round_info.round = round;
					round_info.name_str = tablelookupcolumnforrow(table, row, 2);
					round_info.var_695d8fd1 = tablelookupcolumnforrow(table, row, 3);
					round_info.challenges = [];
				}
				/#
					assert(isdefined(var_6d87ac05.rounds[round_index]));
				#/
				round_info = var_6d87ac05.rounds[round_index];
				challenge_name = tablelookupcolumnforrow(table, row, 5);
				var_10a28798 = [];
				array::add(round_info.challenges, {#params:var_10a28798, #row:row, #name:challenge_name});
				for(i = 0; i < 8; i++)
				{
					param = tablelookupcolumnforrow(table, row, 6 + i);
					if(isdefined(param) && param != #"")
					{
						var_10a28798[var_10a28798.size] = param;
					}
				}
			}
		}
		while(row < var_e1617d73 && round != 0);
	}
	level.var_6d87ac05 = level.var_c556bb2e[0];
}

/*
	Name: function_17b04fd7
	Namespace: zm_trial
	Checksum: 0x45EA966D
	Offset: 0x27D0
	Size: 0xE2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_17b04fd7()
{
	end_time = gettime() + 10000;
	while(gettime() < end_time)
	{
		all_players_spawned = 1;
		foreach(player in getplayers())
		{
			if(player.sessionstate == "spectator")
			{
				all_players_spawned = 0;
			}
		}
		if(all_players_spawned)
		{
			waitframe(1);
			break;
		}
		waitframe(1);
	}
}

/*
	Name: function_74872db6
	Namespace: zm_trial
	Checksum: 0x45E97B5A
	Offset: 0x28C0
	Size: 0x33C
	Parameters: 0
	Flags: Linked
*/
function function_74872db6()
{
	if(!is_trial_mode())
	{
		return;
	}
	/#
		assert(isdefined(level.var_6d87ac05));
	#/
	/#
		assert(!isdefined(level.var_d77a6967));
	#/
	/#
		assert(!isdefined(level.var_3dd975d5));
	#/
	round_index = level.round_number - 1;
	/#
		assert(round_index >= 0);
	#/
	if(round_index >= level.var_6d87ac05.rounds.size)
	{
		return;
	}
	playsoundatposition(#"hash_44cf63a367dbd4ff", (0, 0, 0));
	zm_trial_util::set_game_state(0);
	zm_trial_util::function_8cdbf9f0();
	zm_trial_util::function_96e10d88(0);
	clientfield::set_world_uimodel("ZMHudGlobal.trials.roundNumber", level.round_number);
	zm_trial_util::function_eaa44cea();
	clientfield::set_world_uimodel("ZMHudGlobal.trials.failurePlayer", 0);
	function_17b04fd7();
	level.var_3dd975d5 = [];
	level.var_d77a6967 = level.var_6d87ac05.rounds[round_index];
	for(i = 0; i < level.var_d77a6967.challenges.size; i++)
	{
		challenge = level.var_d77a6967.challenges[i];
		/#
			assert(isdefined(level.var_75e93a54));
		#/
		/#
			assert(isdefined(level.var_75e93a54[challenge.name]));
		#/
		var_9cd2c51d = level.var_75e93a54[challenge.name];
		var_5285d066 = {#params:challenge.params, #info:var_9cd2c51d, #row:challenge.row, #name:challenge.name};
		array::add(level.var_3dd975d5, var_5285d066);
		if(isdefined(var_9cd2c51d.var_3b7ba215))
		{
			util::single_func_argarray(var_5285d066, var_9cd2c51d.var_3b7ba215, challenge.params);
		}
	}
}

/*
	Name: on_round_end
	Namespace: zm_trial
	Checksum: 0xB473AEB
	Offset: 0x2C08
	Size: 0x27C
	Parameters: 0
	Flags: Linked
*/
function on_round_end()
{
	if(!is_trial_mode())
	{
		return;
	}
	level notify(#"hash_7646638df88a3656");
	playsoundatposition(#"hash_351022f2dd6aba77", (0, 0, 0));
	/#
		assert(isdefined(level.var_d77a6967));
	#/
	/#
		assert(isdefined(level.var_3dd975d5));
	#/
	for(i = 0; i < level.var_3dd975d5.size; i++)
	{
		var_5285d066 = level.var_3dd975d5[i];
		if(isdefined(var_5285d066.info.var_6993ecb4))
		{
			var_5285d066 [[var_5285d066.info.var_6993ecb4]](level flag::get("round_reset"));
		}
	}
	level.var_d77a6967 = undefined;
	level.var_3dd975d5 = undefined;
	var_fc86f1d = level flag::get("round_reset");
	if(isdefined(level.var_bea1981))
	{
		[[level.var_bea1981]](var_fc86f1d);
	}
	if(var_fc86f1d)
	{
		if(isarray(level.var_d3b05dcb))
		{
			arrayremovevalue(level.var_d3b05dcb, undefined);
			array::delete_all(level.var_d3b05dcb);
		}
		foreach(player in getplayers())
		{
			player bgb::take();
		}
	}
	function_b4d58bfd();
}

