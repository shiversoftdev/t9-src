#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_player.gsc;
#using script_301f64a4090c381a;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace riotshield;

/*
	Name: __init__system__
	Namespace: riotshield
	Checksum: 0x524C4BB5
	Offset: 0x1F8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_equip_riotshield", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: riotshield
	Checksum: 0xB4605C24
	Offset: 0x250
	Size: 0x454
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.weaponriotshield))
	{
		level.weaponriotshield = getweapon(#"riotshield");
	}
	clientfield::register("toplayer", "zm_shield_damage_rumble", 1, 1, "counter");
	clientfield::register("toplayer", "zm_shield_break_rumble", 1, 1, "counter");
	clientfield::register_clientuimodel("ZMInventoryPersonal.shield_health", 1, 4, "float");
	zombie_utility::set_zombie_var(#"riotshield_cylinder_radius", 360);
	zombie_utility::set_zombie_var(#"riotshield_fling_range", 90);
	zombie_utility::set_zombie_var(#"riotshield_gib_range", 90);
	zombie_utility::set_zombie_var(#"riotshield_gib_damage", 75);
	zombie_utility::set_zombie_var(#"riotshield_knockdown_range", 90);
	zombie_utility::set_zombie_var(#"riotshield_fling_force_melee", 100);
	zombie_utility::set_zombie_var(#"riotshield_fling_damage_shield", 50);
	zombie_utility::set_zombie_var(#"hash_6835f7c5524585f3", 50);
	zombie_utility::set_zombie_var(#"hash_bfdf728041b626a", 120);
	zombie_utility::set_zombie_var(#"riotshield_knockdown_damage_shield", 200);
	zombie_utility::set_zombie_var(#"riotshield_stowed_block_fraction", 1);
	level.riotshield_gib_refs = [];
	level.riotshield_gib_refs[level.riotshield_gib_refs.size] = "guts";
	level.riotshield_gib_refs[level.riotshield_gib_refs.size] = "right_arm";
	level.riotshield_gib_refs[level.riotshield_gib_refs.size] = "left_arm";
	zm_player::function_57301eaf(&player_damage_override_callback);
	if(!isdefined(level.riotshield_melee))
	{
		level.riotshield_melee = &riotshield_melee;
	}
	if(!isdefined(level.riotshield_melee_power))
	{
		level.riotshield_melee_power = &riotshield_melee;
	}
	if(!isdefined(level.riotshield_damage_callback))
	{
		level.riotshield_damage_callback = &player_damage_shield;
	}
	if(!isdefined(level.should_shield_absorb_damage))
	{
		level.should_shield_absorb_damage = &should_shield_absorb_damage;
	}
	if(!isdefined(level.callbackplayershielddamageblocked))
	{
		level.callbackplayershielddamageblocked = &callback_playershielddamageblocked;
	}
	if(!isdefined(level.var_2677b8bb))
	{
		level.var_2677b8bb = new throttle();
		[[ level.var_2677b8bb ]]->initialize(4, 0.1);
	}
	callback::on_connect(&on_player_connect);
	zm::register_actor_damage_callback(&function_4aa5e0c7);
}

/*
	Name: function_8ac3bea9
	Namespace: riotshield
	Checksum: 0xFCC459C
	Offset: 0x6B0
	Size: 0x1C
	Parameters: 0
	Flags: Private
*/
function private function_8ac3bea9()
{
	level thread function_d987f765();
}

/*
	Name: on_player_connect
	Namespace: riotshield
	Checksum: 0xA6F96C
	Offset: 0x6D8
	Size: 0x7C
	Parameters: 0
	Flags: None
*/
function on_player_connect()
{
	self.player_shield_reset_health = &player_init_shield_health;
	if(!isdefined(self.player_shield_apply_damage))
	{
		self.player_shield_apply_damage = &player_damage_shield;
	}
	self thread player_watch_weapon_change();
	self thread player_watch_shield_melee();
	self thread player_watch_shield_melee_power();
}

/*
	Name: player_init_shield_health
	Namespace: riotshield
	Checksum: 0x49B21848
	Offset: 0x760
	Size: 0x260
	Parameters: 2
	Flags: None
*/
function player_init_shield_health(weapon, var_cd9d17e0)
{
	if(!isdefined(var_cd9d17e0))
	{
		var_cd9d17e0 = 0;
	}
	self endon(#"disconnect");
	if(!isdefined(weapon))
	{
		weapon = level.weaponriotshield;
		if(isdefined(self.weaponriotshield))
		{
			weapon = self.weaponriotshield;
		}
	}
	switch(zm_custom::function_901b751c(#"zmshielddurability"))
	{
		case 0:
		{
			level.var_7bcfc873 = 2;
			break;
		}
		case 2:
		{
			level.var_7bcfc873 = 0.5;
			break;
		}
		case 1:
		default:
		{
			level.var_7bcfc873 = 1;
			break;
		}
	}
	var_2aaf6cdb = zombie_utility::function_d2dfacfd(#"hash_cc85b961f25c2ff");
	if(isdefined(var_2aaf6cdb))
	{
		level.var_7bcfc873 = level.var_7bcfc873 * var_2aaf6cdb;
	}
	damagemax = int(weapon.weaponstarthitpoints);
	shieldhealth = self damageriotshield(0);
	shieldhealth = self damageriotshield(shieldhealth - damagemax);
	self updateriotshieldmodel();
	self clientfield::set_player_uimodel("ZMInventoryPersonal.shield_health", 1);
	n_current_health = self damageriotshield(0);
	if(n_current_health < damagemax)
	{
		self.var_d3345483 = 1;
	}
	else
	{
		self.var_d3345483 = undefined;
	}
	if(var_cd9d17e0)
	{
		self givemaxammo(weapon);
	}
	return true;
}

/*
	Name: player_set_shield_health
	Namespace: riotshield
	Checksum: 0x387E96F6
	Offset: 0x9C8
	Size: 0x7C
	Parameters: 2
	Flags: None
*/
function player_set_shield_health(damage, max_damage)
{
	self endon(#"disconnect");
	self updateriotshieldmodel();
	val = 0;
	if(max_damage)
	{
		val = damage / max_damage;
	}
	self clientfield::set_player_uimodel("ZMInventoryPersonal.shield_health", val);
}

/*
	Name: function_d987f765
	Namespace: riotshield
	Checksum: 0x17A62A01
	Offset: 0xA50
	Size: 0x1C4
	Parameters: 0
	Flags: None
*/
function function_d987f765()
{
	level endon(#"game_ended");
	while(true)
	{
		s_waitresult = undefined;
		s_waitresult = level waittill(#"carpenter_started");
		if(zm_powerups::function_cfd04802(#"carpenter") && isplayer(s_waitresult.var_264cf1f9))
		{
			if(is_true(s_waitresult.var_264cf1f9.hasriotshield) && isdefined(s_waitresult.var_264cf1f9.player_shield_reset_health))
			{
				s_waitresult.var_264cf1f9 [[s_waitresult.var_264cf1f9.player_shield_reset_health]]();
			}
		}
		else
		{
			players = getplayers();
			foreach(e_player in players)
			{
				if(isdefined(e_player) && is_true(e_player.hasriotshield) && isdefined(e_player.player_shield_reset_health))
				{
					e_player [[e_player.player_shield_reset_health]]();
				}
			}
		}
	}
}

/*
	Name: player_shield_absorb_damage
	Namespace: riotshield
	Checksum: 0x588F0D22
	Offset: 0xC20
	Size: 0x24
	Parameters: 4
	Flags: None
*/
function player_shield_absorb_damage(eattacker, idamage, shitloc, smeansofdeath)
{
}

/*
	Name: callback_playershielddamageblocked
	Namespace: riotshield
	Checksum: 0x15546BBE
	Offset: 0xC50
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function callback_playershielddamageblocked(damage)
{
}

/*
	Name: player_shield_facing_attacker
	Namespace: riotshield
	Checksum: 0xC284A1AC
	Offset: 0xC68
	Size: 0x11C
	Parameters: 3
	Flags: None
*/
function player_shield_facing_attacker(vdir, limit, attacker)
{
	orientation = self getplayerangles();
	forwardvec = anglestoforward(orientation);
	forwardvec2d = (forwardvec[0], forwardvec[1], 0);
	unitforwardvec2d = vectornormalize(forwardvec2d);
	tofaceevec = attacker.origin - self.origin;
	tofaceevec2d = (tofaceevec[0], tofaceevec[1], 0);
	unittofaceevec2d = vectornormalize(tofaceevec2d);
	dotproduct = vectordot(unitforwardvec2d, unittofaceevec2d);
	return dotproduct > limit;
}

/*
	Name: should_shield_absorb_damage
	Namespace: riotshield
	Checksum: 0xCD9A396A
	Offset: 0xD90
	Size: 0x192
	Parameters: 10
	Flags: None
*/
function should_shield_absorb_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	if(is_true(self.hasriotshield) && isdefined(psoffsettime))
	{
		if(isdefined(shitloc) && issentient(shitloc))
		{
			if(is_true(self.hasriotshieldequipped))
			{
				if(self hasperk(#"specialty_shield") || self player_shield_facing_attacker(psoffsettime, 0.2, shitloc))
				{
					return 1;
				}
			}
			else
			{
				if(!isdefined(self.riotshieldentity))
				{
					if(!self player_shield_facing_attacker(psoffsettime, -0.2, shitloc))
					{
						return zombie_utility::function_d2dfacfd(#"riotshield_stowed_block_fraction");
					}
				}
				else
				{
					/#
						assert(!isdefined(self.riotshieldentity), "");
					#/
				}
			}
		}
	}
	return 0;
}

/*
	Name: player_damage_override_callback
	Namespace: riotshield
	Checksum: 0x4F432738
	Offset: 0xF30
	Size: 0x192
	Parameters: 10
	Flags: None
*/
function player_damage_override_callback(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime)
{
	friendly_fire = isdefined(eattacker) && eattacker.team === self.team;
	if(is_true(self.hasriotshield) && !friendly_fire)
	{
		fblockfraction = self [[level.should_shield_absorb_damage]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime);
		if(fblockfraction > 0 && isdefined(self.player_shield_apply_damage))
		{
			iblocked = int(fblockfraction * idamage);
			iunblocked = idamage - iblocked;
			if(isdefined(self.player_shield_apply_damage))
			{
				self [[self.player_shield_apply_damage]](iblocked, 0, shitloc == "riotshield", smeansofdeath);
				if(isdefined(self.riotshield_damage_absorb_callback))
				{
					self [[self.riotshield_damage_absorb_callback]](eattacker, iblocked, shitloc, smeansofdeath);
				}
			}
			return iunblocked;
		}
	}
	return -1;
}

/*
	Name: player_damage_shield
	Namespace: riotshield
	Checksum: 0x1970A2FF
	Offset: 0x10D0
	Size: 0x2D4
	Parameters: 5
	Flags: None
*/
function player_damage_shield(idamage, bheld, fromcode, smod, var_4e0da269)
{
	if(!isdefined(smod))
	{
		smod = 0;
	}
	if(!isdefined(var_4e0da269))
	{
		var_4e0da269 = 1;
	}
	self endon(#"disconnect");
	if(!isdefined(self.var_9c2026aa))
	{
		self.var_9c2026aa = 0;
	}
	if(!isdefined(fromcode))
	{
		fromcode = 0;
	}
	if(!isdefined(level.var_7bcfc873))
	{
		level.var_7bcfc873 = 1;
	}
	if(isdefined(self.weaponriotshield))
	{
		damagemax = self.weaponriotshield.weaponstarthitpoints;
		weapon = self.weaponriotshield;
	}
	else
	{
		damagemax = level.weaponriotshield.weaponstarthitpoints;
		weapon = level.weaponriotshield;
	}
	shieldhealth = damagemax;
	var_4d0cca6e = self function_d24e0d61();
	shielddamage = (fromcode * level.var_7bcfc873) * var_4d0cca6e;
	shielddamage = int(max(shielddamage, 1));
	if(smod)
	{
		shielddamage = 0;
	}
	shieldhealth = self damageriotshield(shielddamage);
	self.var_d3345483 = 1;
	if(shieldhealth <= 0)
	{
		if(isdefined(self.var_27aeb716))
		{
			self thread [[self.var_27aeb716]](weapon);
		}
		self clientfield::increment_to_player("zm_shield_break_rumble");
		self thread zm_audio::create_and_play_dialog(#"shield", #"destroy");
		self thread player_take_riotshield();
	}
	else
	{
		if(var_4e0da269)
		{
			self clientfield::increment_to_player("zm_shield_damage_rumble");
			self playsound(#"fly_riotshield_zm_impact_zombies");
		}
		self updateriotshieldmodel();
	}
	if(damagemax > 0)
	{
		self clientfield::set_player_uimodel("ZMInventoryPersonal.shield_health", shieldhealth / damagemax);
	}
}

/*
	Name: function_d24e0d61
	Namespace: riotshield
	Checksum: 0x37C94D59
	Offset: 0x13B0
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function function_d24e0d61()
{
	var_41f4ea3c = self.var_9c2026aa + namespace_e38c57c1::function_cbf286b0();
	return 1 - var_41f4ea3c;
}

/*
	Name: function_4aa5e0c7
	Namespace: riotshield
	Checksum: 0xF310C259
	Offset: 0x13F0
	Size: 0x11C
	Parameters: 13
	Flags: None
*/
function function_4aa5e0c7(inflictor, attacker, damage, flags, meansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(surfacetype.isriotshield && boneindex != "MOD_MELEE" && boneindex != "MOD_IMPACT" && boneindex != "MOD_ELECTROCUTED")
	{
		var_754eb193 = psoffsettime + (psoffsettime * 0.2) * (math::clamp(level.round_number - 10, 0, 20));
		return var_754eb193;
	}
	return -1;
}

/*
	Name: player_watch_weapon_change
	Namespace: riotshield
	Checksum: 0xFF2B40B8
	Offset: 0x1518
	Size: 0xE8
	Parameters: 0
	Flags: None
*/
function player_watch_weapon_change()
{
	self endon(#"disconnect");
	for(;;)
	{
		self waittill(#"weapon_change");
		self updateriotshieldmodel();
		damagemax = level.weaponriotshield.weaponstarthitpoints;
		if(isdefined(self.weaponriotshield) && self.weaponriotshield != level.weaponnone)
		{
			damagemax = self.weaponriotshield.weaponstarthitpoints;
		}
		shieldhealth = self.weaponhealth;
		val = 0;
		if(damagemax)
		{
			val = shieldhealth / damagemax;
		}
		self clientfield::set_player_uimodel("ZMInventoryPersonal.shield_health", val);
	}
}

/*
	Name: player_watch_shield_melee
	Namespace: riotshield
	Checksum: 0x4A1EB948
	Offset: 0x1608
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function player_watch_shield_melee()
{
	self endon(#"disconnect");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_melee");
		if(waitresult.weapon.isriotshield)
		{
			self [[level.riotshield_melee]](waitresult.weapon);
		}
	}
}

/*
	Name: player_watch_shield_melee_power
	Namespace: riotshield
	Checksum: 0xDB1A2E0B
	Offset: 0x1688
	Size: 0x74
	Parameters: 0
	Flags: None
*/
function player_watch_shield_melee_power()
{
	self endon(#"disconnect");
	for(;;)
	{
		waitresult = undefined;
		waitresult = self waittill(#"weapon_melee_power");
		if(waitresult.weapon.isriotshield)
		{
			self [[level.riotshield_melee_power]](waitresult.weapon);
		}
	}
}

/*
	Name: riotshield_fling_zombie
	Namespace: riotshield
	Checksum: 0x973521AC
	Offset: 0x1708
	Size: 0x114
	Parameters: 3
	Flags: None
*/
function riotshield_fling_zombie(player, fling_vec, index)
{
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	if(is_true(self.ignore_riotshield))
	{
		return;
	}
	if(isdefined(self.riotshield_fling_func))
	{
		self [[self.riotshield_fling_func]](fling_vec);
		return;
	}
	self dodamage(3000, fling_vec.origin, fling_vec, fling_vec, "", "MOD_IMPACT");
	if(self.health < 1 || fling_vec zm_powerups::is_insta_kill_active())
	{
		self startragdoll(1);
		self launchragdoll(index);
	}
}

/*
	Name: riotshield_knockdown_zombie
	Namespace: riotshield
	Checksum: 0xA832C0FC
	Offset: 0x1828
	Size: 0x18C
	Parameters: 3
	Flags: None
*/
function riotshield_knockdown_zombie(player, gib, weapon)
{
	self endon(#"death");
	playsoundatposition(#"vox_riotshield_forcehit", self.origin);
	playsoundatposition(#"wpn_riotshield_proj_impact", self.origin);
	if(!isdefined(self) || !isalive(self))
	{
		return;
	}
	if(self.archetype === #"brutus")
	{
		self ai::stun();
	}
	else
	{
		self zombie_utility::setup_zombie_knockdown(player);
	}
	if(gib)
	{
		self.a.gib_ref = array::random(level.riotshield_gib_refs);
		self thread zombie_death::do_gib();
	}
	self dodamage(3000, player.origin, player, undefined, "none", "MOD_IMPACT", 0, weapon);
	self playsound(#"fly_riotshield_forcehit");
}

/*
	Name: riotshield_get_enemies_in_range
	Namespace: riotshield
	Checksum: 0x672360FC
	Offset: 0x19C0
	Size: 0x8EE
	Parameters: 6
	Flags: None
*/
function riotshield_get_enemies_in_range(riotshield_knockdown_range, riotshield_gib_range, riotshield_fling_range, var_1c3d89, riotshield_cylinder_radius, riotshield_fling_force_melee)
{
	view_pos = self geteye();
	var_25e2354 = function_4d8c71ce();
	var_72714481 = getaispeciesarray(level.zombie_team, "all");
	a_e_targets = arraycombine(var_72714481, var_25e2354, 0, 0);
	if(!isdefined(riotshield_knockdown_range))
	{
		riotshield_knockdown_range = zombie_utility::function_d2dfacfd(#"riotshield_knockdown_range");
	}
	a_e_targets = array::get_all_closest(view_pos, a_e_targets, undefined, undefined, 2 * zombie_utility::function_d2dfacfd(#"riotshield_knockdown_range"));
	if(!isdefined(a_e_targets))
	{
		return;
	}
	knockdown_range_squared = riotshield_knockdown_range * riotshield_knockdown_range;
	if(!isdefined(riotshield_gib_range))
	{
		riotshield_gib_range = zombie_utility::function_d2dfacfd(#"riotshield_gib_range");
	}
	gib_range_squared = riotshield_gib_range * riotshield_gib_range;
	if(!isdefined(riotshield_fling_range))
	{
		riotshield_fling_range = zombie_utility::function_d2dfacfd(#"riotshield_fling_range");
	}
	fling_range_squared = riotshield_fling_range * riotshield_fling_range;
	if(!isdefined(riotshield_cylinder_radius))
	{
		riotshield_cylinder_radius = zombie_utility::function_d2dfacfd(#"riotshield_cylinder_radius");
	}
	cylinder_radius_squared = riotshield_cylinder_radius * riotshield_cylinder_radius;
	if(!isdefined(var_1c3d89))
	{
		var_1c3d89 = zombie_utility::function_d2dfacfd(#"riotshield_cylinder_radius");
	}
	var_8f9e26e4 = var_1c3d89 * var_1c3d89;
	var_606a8462 = riotshield_knockdown_range > riotshield_fling_range;
	if(!isdefined(riotshield_fling_force_melee))
	{
		riotshield_fling_force_melee = zombie_utility::function_d2dfacfd(#"riotshield_fling_force_melee");
	}
	fling_force = riotshield_fling_force_melee;
	fling_force_v = 0.5;
	forward_view_angles = self getweaponforwarddir();
	end_pos = view_pos + vectorscale(forward_view_angles, riotshield_knockdown_range);
	/#
		if(2 == getdvarint(#"scr_riotshield_debug", 0))
		{
			near_circle_pos = view_pos + vectorscale(forward_view_angles, 2);
			circle(near_circle_pos, riotshield_cylinder_radius, (1, 0, 0), 0, 0, 300);
			line(near_circle_pos, end_pos, (0, 0, 1), 1, 0, 100);
			circle(end_pos, riotshield_cylinder_radius, (1, 0, 0), 0, 0, 300);
		}
	#/
	foreach(e_target in a_e_targets)
	{
		if(!isalive(e_target) || !isdefined(e_target.var_6f84b820))
		{
			continue;
		}
		test_origin = e_target getcentroid();
		test_range_squared = distancesquared(view_pos, test_origin);
		if(test_range_squared > knockdown_range_squared)
		{
			return;
		}
		normal = vectornormalize(test_origin - view_pos);
		dot = vectordot(forward_view_angles, normal);
		if(0 > dot)
		{
			continue;
		}
		radial_origin = pointonsegmentnearesttopoint(view_pos, end_pos, test_origin);
		if(distancesquared(test_origin, radial_origin) > var_8f9e26e4)
		{
			continue;
		}
		if(0 == e_target damageconetrace(view_pos, self))
		{
			continue;
		}
		switch(e_target.var_6f84b820)
		{
			case "normal":
			{
				if(test_range_squared < fling_range_squared)
				{
					if(distancesquared(test_origin, radial_origin) > cylinder_radius_squared)
					{
						break;
					}
					level.riotshield_fling_enemies[level.riotshield_fling_enemies.size] = e_target;
					dist_mult = (fling_range_squared - test_range_squared) / fling_range_squared;
					fling_vec = vectornormalize(test_origin - view_pos);
					if(5000 < test_range_squared)
					{
						fling_vec = fling_vec + (vectornormalize(test_origin - radial_origin));
					}
					fling_vec = (fling_vec[0], fling_vec[1], fling_force_v * abs(fling_vec[2]));
					fling_vec = vectorscale(fling_vec, fling_force + (fling_force * dist_mult));
					level.riotshield_fling_vecs[level.riotshield_fling_vecs.size] = fling_vec;
				}
				else if(var_606a8462 && test_range_squared < knockdown_range_squared)
				{
					if(distancesquared(test_origin, radial_origin) > var_8f9e26e4)
					{
						break;
					}
					level.riotshield_knockdown_enemies[level.riotshield_knockdown_enemies.size] = e_target;
					if(var_606a8462 && test_range_squared < gib_range_squared)
					{
						level.riotshield_knockdown_gib[level.riotshield_knockdown_gib.size] = 1;
					}
				}
				break;
			}
			case "special":
			case "elite":
			{
				if(self hasperk(#"specialty_mod_shield"))
				{
					level.riotshield_knockdown_enemies[level.riotshield_knockdown_enemies.size] = e_target;
					level.riotshield_knockdown_gib[level.riotshield_knockdown_gib.size] = 0;
				}
				else
				{
					if(!isdefined(level.var_21ffc192))
					{
						level.var_21ffc192 = [];
					}
					else if(!isarray(level.var_21ffc192))
					{
						level.var_21ffc192 = array(level.var_21ffc192);
					}
					level.var_21ffc192[level.var_21ffc192.size] = e_target;
					e_target dodamage(3000, self.origin, self, self, "", "MOD_IMPACT");
				}
				break;
			}
			default:
			{
				if(!isdefined(level.var_21ffc192))
				{
					level.var_21ffc192 = [];
				}
				else if(!isarray(level.var_21ffc192))
				{
					level.var_21ffc192 = array(level.var_21ffc192);
				}
				level.var_21ffc192[level.var_21ffc192.size] = e_target;
				e_target dodamage(3000, self.origin, self, self, "", "MOD_IMPACT");
			}
		}
	}
}

/*
	Name: riotshield_melee
	Namespace: riotshield
	Checksum: 0x164E4099
	Offset: 0x22B8
	Size: 0x42C
	Parameters: 7
	Flags: None
*/
function riotshield_melee(weapon, riotshield_knockdown_range, riotshield_gib_range, riotshield_fling_range, var_1c3d89, riotshield_cylinder_radius, riotshield_fling_force_melee)
{
	if(!isdefined(level.riotshield_knockdown_enemies))
	{
		level.riotshield_knockdown_enemies = [];
		level.riotshield_knockdown_gib = [];
		level.riotshield_fling_enemies = [];
		level.riotshield_fling_vecs = [];
		level.var_21ffc192 = [];
	}
	self riotshield_get_enemies_in_range(riotshield_knockdown_range, riotshield_gib_range, riotshield_fling_range, var_1c3d89, riotshield_cylinder_radius, riotshield_fling_force_melee);
	shield_damage = 0;
	for(i = 0; i < level.riotshield_fling_enemies.size; i++)
	{
		[[ level.var_2677b8bb ]]->waitinqueue(level.riotshield_fling_enemies[i]);
		if(isdefined(level.riotshield_fling_enemies[i]))
		{
			level.riotshield_fling_enemies[i] thread riotshield_fling_zombie(self, level.riotshield_fling_vecs[i], i);
			var_d3f92d4d = zombie_utility::function_d2dfacfd(#"riotshield_fling_damage_shield");
			if(self hasperk(#"specialty_mod_shield"))
			{
				var_d3f92d4d = var_d3f92d4d * 0.66;
			}
			shield_damage = shield_damage + var_d3f92d4d;
		}
	}
	for(i = 0; i < level.riotshield_knockdown_enemies.size; i++)
	{
		[[ level.var_2677b8bb ]]->waitinqueue(level.riotshield_knockdown_enemies[i]);
		if(!isdefined(level.riotshield_knockdown_enemies[i]))
		{
			continue;
		}
		level.riotshield_knockdown_enemies[i] thread riotshield_knockdown_zombie(self, level.riotshield_knockdown_gib[i]);
		shield_damage = shield_damage + zombie_utility::function_d2dfacfd(#"riotshield_knockdown_damage_shield");
	}
	foreach(ai_enemy in level.var_21ffc192)
	{
		switch(ai_enemy.var_6f84b820)
		{
			case "boss":
			case "special":
			case "elite":
			{
				var_d3f92d4d = zombie_utility::function_d2dfacfd(#"hash_bfdf728041b626a");
				break;
			}
			default:
			{
				var_d3f92d4d = zombie_utility::function_d2dfacfd(#"hash_6835f7c5524585f3");
			}
		}
		if(self hasperk(#"specialty_mod_shield"))
		{
			var_d3f92d4d = var_d3f92d4d * 0.66;
		}
		shield_damage = shield_damage + var_d3f92d4d;
	}
	level.riotshield_knockdown_enemies = [];
	level.riotshield_knockdown_gib = [];
	level.riotshield_fling_enemies = [];
	level.riotshield_fling_vecs = [];
	level.var_21ffc192 = [];
	if(shield_damage)
	{
		self player_damage_shield(shield_damage, 0);
	}
}

/*
	Name: updateriotshieldmodel
	Namespace: riotshield
	Checksum: 0x704F8412
	Offset: 0x26F0
	Size: 0x1EC
	Parameters: 0
	Flags: None
*/
function updateriotshieldmodel()
{
	self endon(#"disconnect");
	waitframe(1);
	self.hasriotshield = 0;
	self.weaponriotshield = level.weaponnone;
	foreach(weapon in self getweaponslist(1))
	{
		if(weapon.isriotshield)
		{
			level.var_ef7415bc = 1;
			self.hasriotshield = 1;
			self.weaponriotshield = weapon;
			break;
		}
	}
	current = self getcurrentweapon();
	self.hasriotshieldequipped = current.isriotshield;
	if(self.hasriotshield)
	{
		if(self.hasriotshieldequipped)
		{
			self zm_weapons::clear_stowed_weapon();
			if(isdefined(level.var_ecfcf864))
			{
				self [[level.var_ecfcf864]]();
			}
		}
		else
		{
			self zm_weapons::set_stowed_weapon(self.weaponriotshield);
			if(isdefined(level.var_1177ae05))
			{
				self [[level.var_1177ae05]]();
			}
		}
	}
	else
	{
		self zm_weapons::clear_stowed_weapon();
	}
	self refreshshieldattachment();
}

/*
	Name: player_take_riotshield
	Namespace: riotshield
	Checksum: 0x6A287C04
	Offset: 0x28E8
	Size: 0x142
	Parameters: 0
	Flags: None
*/
function player_take_riotshield()
{
	self notify(#"destroy_riotshield");
	self endon(#"disconnect");
	self disableweaponcycling();
	util::wait_network_frame();
	self function_a9109d26();
	self playsoundtoplayer(#"hash_560e1cb348d4600f", self);
	weapon = level.weaponriotshield;
	if(isdefined(self.weaponriotshield))
	{
		weapon = self.weaponriotshield;
	}
	if(zm_equipment::is_equipment(weapon))
	{
		self zm_equipment::take(weapon);
	}
	else
	{
		self zm_weapons::weapon_take(weapon);
	}
	self updateriotshieldmodel();
	self enableweaponcycling();
	self.hasriotshield = 0;
	self.hasriotshieldequipped = 0;
	self.var_d3345483 = undefined;
}

/*
	Name: function_a9109d26
	Namespace: riotshield
	Checksum: 0x3D500D39
	Offset: 0x2A38
	Size: 0x17A
	Parameters: 0
	Flags: None
*/
function function_a9109d26()
{
	self endon(#"death");
	current = self getcurrentweapon();
	if(current.isriotshield)
	{
		if(!self laststand::player_is_in_laststand())
		{
			new_primary = level.weaponnone;
			primaryweapons = self getweaponslistprimaries();
			for(i = 0; i < primaryweapons.size; i++)
			{
				if(!primaryweapons[i].isriotshield)
				{
					new_primary = primaryweapons[i];
					break;
				}
			}
			if(new_primary == level.weaponnone)
			{
				self zm_weapons::give_fallback_weapon();
				self switchtoweaponimmediate(undefined, 1);
				self playsound(#"wpn_riotshield_zm_destroy");
			}
			else
			{
				self switchtoweaponimmediate(undefined, 1);
				self playsound(#"wpn_riotshield_zm_destroy");
				self waittill(#"weapon_change");
			}
		}
	}
}

