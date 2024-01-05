#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_weapon_minigun;

/*
	Name: __init__system__
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0x707D2AC3
	Offset: 0x160
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_powerup_weapon_minigun", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0x6E59CA56
	Offset: 0x1A8
	Size: 0x174
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm_powerups::register_powerup("minigun", &grab_minigun);
	zm_powerups::register_powerup_weapon("minigun", &minigun_countdown);
	zm_powerups::powerup_set_prevent_pick_up_if_drinking("minigun", 1);
	zm_powerups::set_weapon_ignore_max_ammo("minigun");
	if(zm_powerups::function_cc33adc8())
	{
		zm_powerups::add_zombie_powerup("minigun", "zombie_pickup_minigun", #"zombie/powerup_minigun", &func_should_drop_minigun, 1, 0, 0, undefined, "powerup_mini_gun", "zombie_powerup_minigun_time", "zombie_powerup_minigun_on");
		level.zombie_powerup_weapon[#"minigun"] = getweapon(#"minigun");
	}
	callback::on_connect(&init_player_zombie_vars);
	zm::register_actor_damage_callback(&minigun_damage_adjust);
}

/*
	Name: grab_minigun
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0xE5A499B8
	Offset: 0x328
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function grab_minigun(player)
{
	level thread minigun_weapon_powerup(player);
	player thread zm_powerups::powerup_vo("minigun");
	if(isdefined(level._grab_minigun))
	{
		level thread [[level._grab_minigun]](player);
	}
}

/*
	Name: init_player_zombie_vars
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0xEDF9A7C2
	Offset: 0x3A0
	Size: 0x34
	Parameters: 0
	Flags: None
*/
function init_player_zombie_vars()
{
	self.zombie_vars[#"zombie_powerup_minigun_on"] = 0;
	self.zombie_vars[#"zombie_powerup_minigun_time"] = 0;
}

/*
	Name: func_should_drop_minigun
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0x9E6F0104
	Offset: 0x3E0
	Size: 0x1E
	Parameters: 0
	Flags: None
*/
function func_should_drop_minigun()
{
	if(zm_powerups::minigun_no_drop())
	{
		return false;
	}
	return true;
}

/*
	Name: minigun_weapon_powerup
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0x15B4E0ED
	Offset: 0x408
	Size: 0x23C
	Parameters: 2
	Flags: None
*/
function minigun_weapon_powerup(ent_player, time)
{
	ent_player endon(#"disconnect", #"death", #"player_downed");
	if(!isdefined(time))
	{
		time = 30;
	}
	if(isdefined(level._minigun_time_override))
	{
		time = level._minigun_time_override;
	}
	if(ent_player.zombie_vars[#"zombie_powerup_minigun_on"] && (level.zombie_powerup_weapon[#"minigun"] == ent_player getcurrentweapon() || (isdefined(ent_player.has_powerup_weapon[#"minigun"]) && ent_player.has_powerup_weapon[#"minigun"])))
	{
		if(ent_player.zombie_vars[#"zombie_powerup_minigun_time"] < time)
		{
			ent_player.zombie_vars[#"zombie_powerup_minigun_time"] = time;
		}
		return;
	}
	level._zombie_minigun_powerup_last_stand_func = &minigun_powerup_last_stand;
	stance_disabled = 0;
	if(ent_player getstance() === "prone")
	{
		ent_player allowcrouch(0);
		ent_player allowprone(0);
		stance_disabled = 1;
		while(ent_player getstance() != "stand")
		{
			waitframe(1);
		}
	}
	zm_powerups::weapon_powerup(ent_player, time, "minigun", 1);
	if(stance_disabled)
	{
		ent_player allowcrouch(1);
		ent_player allowprone(1);
	}
}

/*
	Name: minigun_powerup_last_stand
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0x85025FC5
	Offset: 0x650
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function minigun_powerup_last_stand()
{
	zm_powerups::weapon_watch_gunner_downed("minigun");
}

/*
	Name: minigun_countdown
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0xAE31474
	Offset: 0x678
	Size: 0x54
	Parameters: 2
	Flags: None
*/
function minigun_countdown(ent_player, str_weapon_time)
{
	while(ent_player.zombie_vars[str_weapon_time] > 0)
	{
		waitframe(1);
		ent_player.zombie_vars[str_weapon_time] = ent_player.zombie_vars[str_weapon_time] - 0.05;
	}
}

/*
	Name: minigun_weapon_powerup_off
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0xE1562206
	Offset: 0x6D8
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function minigun_weapon_powerup_off()
{
	self.zombie_vars[#"zombie_powerup_minigun_time"] = 0;
}

/*
	Name: minigun_damage_adjust
	Namespace: zm_powerup_weapon_minigun
	Checksum: 0xEE751C85
	Offset: 0x700
	Size: 0x184
	Parameters: 13
	Flags: None
*/
function minigun_damage_adjust(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(var_fd90b0bb.name != "minigun")
	{
		return -1;
	}
	if(self.archetype == #"zombie" || self.archetype == #"zombie_dog" || self.archetype == #"zombie_quad")
	{
		n_percent_damage = self.health * randomfloatrange(0.34, 0.75);
	}
	if(isdefined(level.minigun_damage_adjust_override))
	{
		n_override_damage = thread [[level.minigun_damage_adjust_override]](attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
		if(isdefined(n_override_damage))
		{
			n_percent_damage = n_override_damage;
		}
	}
	if(isdefined(n_percent_damage))
	{
		flags = flags + n_percent_damage;
	}
	return flags;
}

