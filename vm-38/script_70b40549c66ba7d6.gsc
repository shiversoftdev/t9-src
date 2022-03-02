#using script_1c65dbfc2f1c8d8f;
#using script_24c32478acf44108;
#using script_35598499769dbb3d;
#using script_4108035fe400ce67;
#using script_471b31bd963b388e;
#using script_4dc6a9b234b838e1;
#using script_6167e26342be354b;
#using script_6f7b2cd5eb7f3e6d;
#using script_8988fdbc78d6c53;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\hud_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace zm_weap_black_hole_bomb;

/*
	Name: function_1aa03bfe
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x8541960E
	Offset: 0x228
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1aa03bfe()
{
	level notify(1747666293);
}

/*
	Name: function_89f2df9
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xB75F5D60
	Offset: 0x248
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_weap_black_hole_bomb", &function_70a657d8, &function_8ac3bea9, undefined, "zm_weapons");
}

/*
	Name: function_70a657d8
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x1E1ABD56
	Offset: 0x2A0
	Size: 0x174
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "" + #"hash_399ab6541d717dc7", 1, 1, "int");
	level.var_2e1abf5f = getweapon(#"hash_6a4dd5ed56f6e3f6");
	weaponobjects::function_e6400478(#"hash_6a4dd5ed56f6e3f6", &function_54881ba1, 1);
	zm_weapons::function_404c3ad5(level.var_2e1abf5f, &function_995359b9);
	zm_weapons::function_76403f51(level.var_2e1abf5f);
	callback::add_callback(#"on_ai_killed", &function_ca505fd3);
	namespace_9ff9f642::register_slowdown(#"hash_2c88ef7895dccf65", 0.7, 1);
	namespace_9ff9f642::register_slowdown(#"hash_54dc5d9bfaadb765", 0.6, 1);
}

/*
	Name: function_995359b9
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xF421F4E5
	Offset: 0x420
	Size: 0xD2
	Parameters: 15
	Flags: Linked
*/
function function_995359b9(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, boneindex, modelindex, surfacetype, vsurfacenormal)
{
	if(isentity(surfacetype) && isplayer(vsurfacenormal))
	{
		self.var_22e8a925 = surfacetype.origin;
		self.var_87b962fc = gettime() + 1000;
	}
}

/*
	Name: function_ca505fd3
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x9AC1A1C1
	Offset: 0x500
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_ca505fd3(params)
{
	if(params.weapon === level.var_2e1abf5f && isplayer(params.eattacker) && params.smeansofdeath === "MOD_GRENADE_SPLASH" && isdefined(self.var_87b962fc) && gettime() < self.var_87b962fc)
	{
		self namespace_cc411409::function_706a56ae((isdefined(self.var_22e8a925) ? self.var_22e8a925 : params.einflictor.origin), 2);
	}
}

/*
	Name: function_8ac3bea9
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x80F724D1
	Offset: 0x5C8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: function_54881ba1
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xE425F98C
	Offset: 0x5D8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_54881ba1(watcher)
{
	watcher.onspawn = &function_e38ab081;
}

/*
	Name: function_e38ab081
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xA51C6075
	Offset: 0x608
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function function_e38ab081(watcher, player)
{
	player endon(#"death");
	level endon(#"end_game");
	self thread function_93a73145(player);
}

/*
	Name: function_93a73145
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xC34ADA38
	Offset: 0x670
	Size: 0x1A4
	Parameters: 1
	Flags: Linked
*/
function function_93a73145(owner)
{
	self endon(#"death");
	self waittill(#"stationary");
	self resetmissiledetonationtime();
	successful = 0;
	if(zm_utility::is_point_inside_enabled_zone(self.origin))
	{
		self.var_acdc8d71 = getclosestpointonnavmesh(self.origin, 100, 15.1875);
		if(isdefined(self.var_acdc8d71))
		{
			level thread black_hole_bomb_teleport_init(self);
			self thread zombie_vortex::start_timed_vortex(1, self.var_acdc8d71, 275, level.var_2e1abf5f.explosionradius, owner, level.var_2e1abf5f, &function_9c0c8ac3, &vortex_explosion);
			successful = 1;
		}
	}
	if(!successful && isplayer(owner) && !is_true(owner.var_9e3339e2))
	{
		owner thread function_600a82c(owner);
		self deletedelay();
	}
}

/*
	Name: function_600a82c
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x2061344D
	Offset: 0x820
	Size: 0x16C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_600a82c(player)
{
	player endon(#"death");
	self notify("1d0aad1ca52c5f89");
	self endon("1d0aad1ca52c5f89");
	waitframe(1);
	item = function_4ba8fde(#"hash_bd1d07994783ddc");
	if(isdefined(item))
	{
		item.amount = 1;
		var_fa3df96 = player namespace_b376ff3f::function_e66dcff5(item);
		if(isdefined(var_fa3df96))
		{
			if(!namespace_ad5a0cd6::function_db35e94f(item.var_bd027dd9))
			{
				item.var_bd027dd9 = namespace_ad5a0cd6::function_970b8d86(var_fa3df96);
			}
			var_ddeb881e = namespace_b376ff3f::function_2e711614(var_fa3df96);
			while(var_ddeb881e.var_a6762160 === item.var_a6762160)
			{
				waitframe(1);
				var_ddeb881e = namespace_b376ff3f::function_2e711614(var_fa3df96);
			}
			if(var_ddeb881e.var_bd027dd9 === 32767)
			{
				player item_world::function_de2018e3(item, player, var_fa3df96, 0);
			}
		}
	}
}

/*
	Name: black_hole_bomb_teleport_init
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x4A5EE0DA
	Offset: 0x998
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function black_hole_bomb_teleport_init(var_a495cbed)
{
	if(!isdefined(var_a495cbed))
	{
		return;
	}
	level endon(#"game_ended");
	var_a495cbed endon(#"death");
	teleport_trigger = spawn("trigger_radius", var_a495cbed.var_acdc8d71, 0, 64, 70);
	var_a495cbed thread black_hole_bomb_trigger_monitor(teleport_trigger);
	var_a495cbed waittill(#"explode");
	teleport_trigger notify(#"black_hole_complete");
	wait(0.1);
	teleport_trigger delete();
}

/*
	Name: function_7ceb96bf
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xE1864269
	Offset: 0xA78
	Size: 0x284
	Parameters: 2
	Flags: Linked
*/
function function_7ceb96bf(player, endon_condition)
{
	endon_condition endon(#"death");
	if(!bullettracepassed(endon_condition geteye(), self.origin + vectorscale((0, 0, 1), 65), 0, endon_condition))
	{
		return;
	}
	new_origin = undefined;
	if(isdefined(level.check_valid_spawn_override))
	{
		new_origin = endon_condition [[level.check_valid_spawn_override]](endon_condition);
	}
	if(isdefined(level.var_8179368e))
	{
		new_origin = endon_condition [[level.var_8179368e]](endon_condition, 1);
	}
	if(isdefined(level.var_dbf9c70d))
	{
		new_origin = endon_condition [[level.var_dbf9c70d]](endon_condition);
	}
	if(!isdefined(new_origin))
	{
		new_origin = endon_condition zm_player::check_for_valid_spawn_near_team(endon_condition, 1);
	}
	if(!isdefined(new_origin))
	{
		if(isdefined(endon_condition.var_f4710251))
		{
			targetplayer = getentbynum(endon_condition.var_f4710251);
			if(isdefined(targetplayer) && isplayer(targetplayer) && isalive(targetplayer))
			{
				new_origin = endon_condition squad_spawn::function_e402b74e(endon_condition, targetplayer);
			}
		}
	}
	if(isdefined(new_origin))
	{
		angles = (isdefined(new_origin.angles) ? new_origin.angles : (0, 0, 0));
		origin = (isdefined(new_origin.origin) ? new_origin.origin : origin);
	}
	if(!isvec(origin) || !isvec(angles))
	{
		return;
	}
	endon_condition black_hole_teleport({#angles:angles, #origin:origin});
}

/*
	Name: black_hole_bomb_trigger_monitor
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x2E6C23A9
	Offset: 0xD08
	Size: 0x158
	Parameters: 1
	Flags: Linked
*/
function black_hole_bomb_trigger_monitor(ent_trigger)
{
	ent_trigger endon(#"black_hole_complete");
	while(true)
	{
		waitresult = undefined;
		waitresult = ent_trigger waittill(#"trigger");
		ent_player = waitresult.activator;
		if(is_true(level.var_b54157cf))
		{
			continue;
		}
		if(isplayer(ent_player) && !ent_player isonground() && !is_true(ent_player.lander) && !ent_player function_b4813488() && !ent_player isonladder() && !ent_player function_e128a831())
		{
			ent_trigger thread black_hole_teleport_trigger_thread(ent_player, &function_7ceb96bf, &black_hole_teleport_cancel);
		}
		wait(0.1);
	}
}

/*
	Name: black_hole_teleport_cancel
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x9DAFCFED
	Offset: 0xE68
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function black_hole_teleport_cancel(ent_player)
{
}

/*
	Name: black_hole_teleport_trigger_thread
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x23B4B10A
	Offset: 0xE80
	Size: 0x13C
	Parameters: 3
	Flags: Linked
*/
function black_hole_teleport_trigger_thread(ent, on_enter_payload, on_exit_payload)
{
	ent endon(#"death");
	self endon(#"black_hole_complete");
	if(ent black_hole_teleport_ent_already_in_trigger(self))
	{
		return;
	}
	self black_hole_teleport_add_trigger_to_ent(ent);
	endon_condition = "leave_trigger_" + self getentitynumber();
	if(isdefined(on_enter_payload))
	{
		self thread [[on_enter_payload]](ent, endon_condition);
	}
	while(isdefined(ent) && ent istouching(self) && isdefined(self))
	{
		waitframe(1);
	}
	ent notify(endon_condition);
	if(isdefined(ent) && isdefined(on_exit_payload))
	{
		self thread [[on_exit_payload]](ent);
	}
	if(isdefined(ent))
	{
		self black_hole_teleport_remove_trigger_from_ent(ent);
	}
}

/*
	Name: black_hole_teleport_ent_already_in_trigger
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xB562D982
	Offset: 0xFC8
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function black_hole_teleport_ent_already_in_trigger(trig)
{
	if(!isdefined(self._triggers))
	{
		return false;
	}
	if(!isdefined(self._triggers[trig getentitynumber()]))
	{
		return false;
	}
	if(!self._triggers[trig getentitynumber()])
	{
		return false;
	}
	return true;
}

/*
	Name: black_hole_teleport_add_trigger_to_ent
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x818F45B9
	Offset: 0x1040
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function black_hole_teleport_add_trigger_to_ent(ent)
{
	if(!isdefined(ent._triggers))
	{
		ent._triggers = [];
	}
	ent._triggers[self getentitynumber()] = 1;
}

/*
	Name: black_hole_teleport_remove_trigger_from_ent
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xE6521FF7
	Offset: 0x1090
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function black_hole_teleport_remove_trigger_from_ent(ent)
{
	if(!isdefined(ent._triggers))
	{
		return;
	}
	if(!isdefined(ent._triggers[self getentitynumber()]))
	{
		return;
	}
	ent._triggers[self getentitynumber()] = 0;
}

/*
	Name: black_hole_teleport
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x572C3B1A
	Offset: 0x1100
	Size: 0x32C
	Parameters: 1
	Flags: Linked
*/
function black_hole_teleport(struct_dest)
{
	self endon(#"death");
	if(!isdefined(struct_dest))
	{
		return;
	}
	prone_offset = vectorscale((0, 0, 1), 49);
	crouch_offset = vectorscale((0, 0, 1), 20);
	stand_offset = (0, 0, 0);
	destination = undefined;
	playsoundatposition(#"hash_89afcb430026d5c", self.origin + vectorscale((0, 0, 1), 50));
	if(self getstance() == "prone")
	{
		destination = struct_dest.origin + prone_offset;
	}
	else
	{
		if(self getstance() == "crouch")
		{
			destination = struct_dest.origin + crouch_offset;
		}
		else
		{
			destination = struct_dest.origin + stand_offset;
		}
	}
	if(isdefined(level._black_hole_teleport_override))
	{
		level [[level._black_hole_teleport_override]](self);
	}
	black_hole_bomb_create_exit_portal(struct_dest.origin);
	self val::set(#"hash_58dc4106d3bee61b", "freezecontrols", 1);
	self val::set(#"hash_58dc4106d3bee61b", "disable_offhand_weapons", 1);
	self val::set(#"hash_58dc4106d3bee61b", "disable_weapons", 1);
	self playsound(#"hash_2bdcf53469acd60d");
	self dontinterpolate();
	self setorigin(destination);
	self setplayerangles(struct_dest.angles);
	self val::reset(#"hash_58dc4106d3bee61b", "freezecontrols");
	self val::reset(#"hash_58dc4106d3bee61b", "disable_offhand_weapons");
	self val::reset(#"hash_58dc4106d3bee61b", "disable_weapons");
	self zm_stats::increment_challenge_stat(#"hash_5a6d38dd5c5f950d");
	self thread slightly_delayed_player_response();
}

/*
	Name: black_hole_bomb_create_exit_portal
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x8DAC6D39
	Offset: 0x1438
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function black_hole_bomb_create_exit_portal(pos)
{
	exit_portal_fx_spot = spawn("script_model", pos);
	exit_portal_fx_spot setmodel("tag_origin");
	playfxontag(#"hash_78a8b7d254316482", exit_portal_fx_spot, "tag_origin");
	exit_portal_fx_spot playsound(#"hash_2f24566e72d6e2ab");
	exit_portal_fx_spot playloopsound(#"hash_172aa3c3eb38f9a7");
	exit_portal_fx_spot thread black_hole_bomb_exit_clean_up();
}

/*
	Name: slightly_delayed_player_response
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xC1E15984
	Offset: 0x1518
	Size: 0xA
	Parameters: 0
	Flags: Linked
*/
function slightly_delayed_player_response()
{
	wait(1);
}

/*
	Name: black_hole_bomb_exit_clean_up
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x6D443F18
	Offset: 0x1530
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function black_hole_bomb_exit_clean_up()
{
	wait(2);
	playsoundatposition("wpn_bhbomb_exit_end", self.origin);
	self delete();
}

/*
	Name: function_9c0c8ac3
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x7991ACB2
	Offset: 0x1580
	Size: 0x814
	Parameters: 7
	Flags: Linked
*/
function function_9c0c8ac3(v_vortex_origin, n_vortex_radius, n_start_time, n_vortex_time, svortex, eattacker, weapon)
{
	team = (isdefined(level.zombie_team) ? level.zombie_team : #"axis");
	n_currtime = 0;
	while(n_currtime <= n_vortex_time)
	{
		a_ai_zombies = function_72d3bca6(getaiteamarray(team), v_vortex_origin, undefined, undefined, n_vortex_radius);
		a_ai_zombies = arraycombine(a_ai_zombies, zombie_vortex::vortex_z_extension(a_ai_zombies, v_vortex_origin, n_vortex_radius), 0, 0);
		svortex.zombies = a_ai_zombies;
		time = gettime();
		foreach(ai_zombie in a_ai_zombies)
		{
			if(!isdefined(ai_zombie.var_6f84b820))
			{
				continue;
			}
			if(isvehicle(ai_zombie))
			{
				if(isalive(ai_zombie) && isdefined(ai_zombie vehicle_ai::get_state_callbacks("idgun_death")) && ai_zombie vehicle_ai::get_current_state() != "idgun_death" && !ai_zombie.ignorevortices)
				{
					params = spawnstruct();
					params.vpoint = v_vortex_origin;
					params.attacker = eattacker;
					params.weapon = weapon;
					ai_zombie vehicle_ai::set_state("idgun_death", params);
				}
				continue;
			}
			ai_zombie clientfield::set("" + #"hash_399ab6541d717dc7", 1);
			ai_zombie.blockingpain = 1;
			ai_zombie thread function_fb7c4f41();
			switch(ai_zombie.var_6f84b820)
			{
				case "normal":
				{
					if(ai_zombie.archetype === #"zombie_dog")
					{
						ai_zombie thread namespace_9ff9f642::slowdown(#"hash_54dc5d9bfaadb765");
						if(!isdefined(ai_zombie.var_56912e22) || time >= ai_zombie.var_56912e22)
						{
							var_34e3b3f7 = ai_zombie.maxhealth * 0.4;
							ai_zombie dodamage(var_34e3b3f7, v_vortex_origin, eattacker, svortex, undefined, "MOD_CRUSH", 0, weapon);
							ai_zombie.var_56912e22 = gettime() + 1000;
						}
						break;
					}
					ai_zombie.var_db490292 = "blackholebomb_pull_fast";
					ai_zombie.var_92b78660 = 1024;
					if(is_true(ai_zombie._black_hole_bomb_collapse_death) && !zm_utility::is_magic_bullet_shield_enabled(ai_zombie))
					{
						ai_zombie.skipautoragdoll = 1;
						ai_zombie kill(ai_zombie.origin + vectorscale((0, 0, 1), 50), ai_zombie.interdimensional_gun_attacker, undefined, weapon, 0, 1);
						level thread hud::function_c9800094(eattacker, ai_zombie.origin + vectorscale((0, 0, 1), 50), ai_zombie.maxhealth, 1);
						if(is_true(ai_zombie.allowdeath))
						{
							gibserverutils::annihilate(ai_zombie);
						}
					}
					if(!is_true(ai_zombie.interdimensional_gun_kill) && !ai_zombie.ignorevortices)
					{
						ai_zombie.var_ecd5b1b9 = svortex;
						ai_zombie.damageorigin = v_vortex_origin;
						ai_zombie.interdimensional_gun_kill = 1;
						ai_zombie.interdimensional_gun_attacker = eattacker;
						ai_zombie.interdimensional_gun_inflictor = eattacker;
						ai_zombie.interdimensional_gun_weapon = weapon;
					}
					break;
				}
				case "special":
				{
					ai_zombie thread namespace_9ff9f642::slowdown(#"hash_2c88ef7895dccf65");
					if(!isdefined(ai_zombie.var_56912e22) || time >= ai_zombie.var_56912e22)
					{
						var_34e3b3f7 = ai_zombie.maxhealth * 0.05;
						ai_zombie dodamage(var_34e3b3f7, v_vortex_origin, eattacker, svortex, undefined, "MOD_CRUSH", 0, weapon);
						ai_zombie.var_56912e22 = gettime() + 1000;
					}
					if(!is_true(ai_zombie.interdimensional_gun_kill) && !ai_zombie.ignorevortices)
					{
						ai_zombie.var_ecd5b1b9 = svortex;
						ai_zombie.damageorigin = v_vortex_origin;
						ai_zombie.interdimensional_gun_kill = 1;
						ai_zombie.interdimensional_gun_attacker = eattacker;
						ai_zombie.interdimensional_gun_inflictor = eattacker;
						ai_zombie.interdimensional_gun_weapon = weapon;
					}
					break;
				}
				case "elite":
				{
					if(is_true(ai_zombie.var_8576e0be))
					{
						ai_zombie namespace_9ff9f642::function_520f4da5(#"hash_2c88ef7895dccf65");
					}
					else
					{
						ai_zombie thread namespace_9ff9f642::slowdown(#"hash_2c88ef7895dccf65");
					}
					if(!isdefined(ai_zombie.var_56912e22) || time >= ai_zombie.var_56912e22)
					{
						var_34e3b3f7 = ai_zombie.maxhealth * 0.02;
						ai_zombie dodamage(var_34e3b3f7, v_vortex_origin, eattacker, svortex, undefined, "MOD_CRUSH", 0, weapon);
						ai_zombie.var_56912e22 = gettime() + 1000;
					}
					if(!is_true(ai_zombie.interdimensional_gun_kill) && !ai_zombie.ignorevortices)
					{
						ai_zombie.var_ecd5b1b9 = svortex;
						ai_zombie.damageorigin = v_vortex_origin;
						ai_zombie.interdimensional_gun_kill = 1;
						ai_zombie.interdimensional_gun_attacker = eattacker;
						ai_zombie.interdimensional_gun_inflictor = eattacker;
						ai_zombie.interdimensional_gun_weapon = weapon;
					}
					break;
				}
				default:
				{
					break;
				}
			}
		}
		waitframe(1);
		n_currtime = gettime() - n_start_time;
	}
}

/*
	Name: function_fb7c4f41
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x173BE9D4
	Offset: 0x1DA0
	Size: 0x76
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fb7c4f41()
{
	self notify(#"hash_1035c763ec8428ac");
	self endon(#"death", #"hash_1035c763ec8428ac");
	wait(0.25);
	self clientfield::set("" + #"hash_399ab6541d717dc7", 0);
	self.blockingpain = 0;
}

/*
	Name: vortex_explosion
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0xC4AD0E86
	Offset: 0x1E20
	Size: 0x7C
	Parameters: 3
	Flags: Linked, Private
*/
function private vortex_explosion(v_vortex_explosion_origin, eattacker, n_vortex_radius)
{
	self.origin = self.origin + vectorscale((0, 0, 1), 50);
	self detonate(n_vortex_radius);
	/#
		recordstar(self.origin, (1, 0, 1), "");
	#/
}

/*
	Name: function_1a6605b0
	Namespace: zm_weap_black_hole_bomb
	Checksum: 0x1072B0C2
	Offset: 0x1EA8
	Size: 0x4C
	Parameters: 1
	Flags: None
*/
function function_1a6605b0(string)
{
	/#
		if(!getdvarint(#"hash_4fd011a8151f574c", 0))
		{
			return;
		}
		println(string);
	#/
}

