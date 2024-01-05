#using scripts\zm_common\trials\zm_trial_reset_loadout.gsc;
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

#namespace zm_powerup_small_ammo;

/*
	Name: function_b32dd6ea
	Namespace: zm_powerup_small_ammo
	Checksum: 0xF2AE16A6
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b32dd6ea()
{
	level notify(1464019756);
}

/*
	Name: __init__system__
	Namespace: zm_powerup_small_ammo
	Checksum: 0x296F4084
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_small_ammo", &__init__, undefined, undefined, undefined);
}

/*
	Name: __init__
	Namespace: zm_powerup_small_ammo
	Checksum: 0x1BDB01C3
	Offset: 0x180
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	zm_powerups::register_powerup("small_ammo", &function_81558cdf);
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("small_ammo", "p8_wz_ammo_pickup_45acp", #"hash_69256172c78db147", &zm_powerups::func_should_never_drop, 1, 0, 0);
		zm_powerups::function_59f7f2c6("small_ammo", #"hash_1146b48f827e8523", #"hash_5d462ab6dd09efb0", #"hash_6c4a383f92f64600");
	}
}

/*
	Name: function_81558cdf
	Namespace: zm_powerup_small_ammo
	Checksum: 0x9424D998
	Offset: 0x258
	Size: 0x6C
	Parameters: 1
	Flags: Linked
*/
function function_81558cdf(player)
{
	if(zm_powerups::function_cfd04802(#"small_ammo"))
	{
		level thread function_d7d24283(self, player);
	}
	else
	{
		level thread function_8be02874(self, player);
	}
}

/*
	Name: function_d7d24283
	Namespace: zm_powerup_small_ammo
	Checksum: 0x2A34BD6A
	Offset: 0x2D0
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function function_d7d24283(e_powerup, player)
{
	if(isdefined(level.check_player_is_ready_for_ammo))
	{
		if([[level.check_player_is_ready_for_ammo]](player) == 0)
		{
			return;
		}
	}
	function_ae7afb91(player);
}

/*
	Name: function_8be02874
	Namespace: zm_powerup_small_ammo
	Checksum: 0x593A7A2C
	Offset: 0x330
	Size: 0x118
	Parameters: 2
	Flags: Linked
*/
function function_8be02874(drop_item, player)
{
	players = getplayers(player.team);
	if(isdefined(level._get_game_module_players))
	{
		players = [[level._get_game_module_players]](player);
	}
	level notify(#"hash_41ccd6a10f7370cc");
	foreach(player in players)
	{
		if(isdefined(level.check_player_is_ready_for_ammo))
		{
			if([[level.check_player_is_ready_for_ammo]](player) == 0)
			{
				continue;
			}
		}
		function_ae7afb91(player);
	}
}

/*
	Name: function_ae7afb91
	Namespace: zm_powerup_small_ammo
	Checksum: 0xE74C20FA
	Offset: 0x450
	Size: 0x208
	Parameters: 1
	Flags: Linked
*/
function function_ae7afb91(player)
{
	player.var_655c0753 = undefined;
	player notify(#"zmb_small_ammo");
	player zm_placeable_mine::disable_all_prompts_for_player();
	foreach(slotid in array(17 + 1, ((17 + 1) + 8) + 1, ((((17 + 1) + 8) + 1) + 8) + 1))
	{
		weapon1 = player namespace_a0d533d1::function_2b83d3ff(player item_inventory::function_2e711614(slotid));
		player function_7374e868(weapon1);
	}
	if(is_true(level.var_2f5a329e))
	{
		a_w_weapons = player getweaponslist(0);
		foreach(weapon in a_w_weapons)
		{
			player function_7374e868(weapon);
		}
	}
}

/*
	Name: function_7374e868
	Namespace: zm_powerup_small_ammo
	Checksum: 0x55CA7B0F
	Offset: 0x660
	Size: 0x256
	Parameters: 1
	Flags: Linked
*/
function function_7374e868(weapon)
{
	if(!isdefined(weapon) || weapon == level.weaponnone || weapon == level.weaponbasemeleeheld || zm_weapons::is_wonder_weapon(weapon))
	{
		return;
	}
	if(isdefined(level.zombie_weapons_no_max_ammo) && isdefined(level.zombie_weapons_no_max_ammo[weapon.name]))
	{
		return;
	}
	var_cd9d17e0 = 0;
	if(!zm_loadout::is_offhand_weapon(weapon) || weapon.isriotshield)
	{
		if(isdefined(weapon))
		{
			var_cb48c3c9 = weapon.maxammo;
			var_ef0714fa = weapon.startammo;
			n_clip_size = weapon.clipsize;
			var_5916b9ab = 0;
			if(weapon.dualwieldweapon != level.weaponnone)
			{
				var_5916b9ab = weapon.dualwieldweapon.clipsize;
			}
			var_b8624c26 = self getammocount(weapon);
			if(self hasperk(#"specialty_extraammo"))
			{
				n_ammo_max = var_cb48c3c9;
			}
			else
			{
				n_ammo_max = var_ef0714fa;
			}
			if(weapon.isdualwield)
			{
				n_ammo_max = n_ammo_max * 2;
			}
			if(var_b8624c26 >= ((n_ammo_max + n_clip_size) + var_5916b9ab))
			{
				var_cd9d17e0 = 0;
			}
			else
			{
				var_cd9d17e0 = 1;
			}
		}
	}
	else if(self zm_weapons::has_weapon_or_upgrade(weapon))
	{
		if(self getammocount(weapon) < weapon.maxammo)
		{
			var_cd9d17e0 = 1;
		}
	}
	if(var_cd9d17e0)
	{
		self give_clip_of_ammo(weapon);
		return true;
	}
	if(!var_cd9d17e0)
	{
		return false;
	}
}

/*
	Name: give_clip_of_ammo
	Namespace: zm_powerup_small_ammo
	Checksum: 0x9254DD48
	Offset: 0x8C0
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function give_clip_of_ammo(w_weapon)
{
	if(zm_loadout::function_2ff6913(w_weapon))
	{
		return;
	}
	if(!self hasweapon(w_weapon))
	{
		return;
	}
	self notify(#"hash_64f02bb4452a4bd7");
	var_df670713 = self getammocount(w_weapon);
	var_96ec8ce1 = self getweaponammostock(w_weapon);
	if(self hasperk(#"specialty_extraammo"))
	{
		n_pool = w_weapon.maxammo;
	}
	else
	{
		n_pool = w_weapon.startammo;
	}
	n_stock = int(min(n_pool, var_96ec8ce1 + (n_pool / 5)));
	self setweaponammostock(w_weapon, n_stock);
}

