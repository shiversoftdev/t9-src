#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;

#namespace zombie_vortex;

/*
	Name: function_89f2df9
	Namespace: zombie_vortex
	Checksum: 0xE92C9276
	Offset: 0x1C8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"vortex_shared", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zombie_vortex
	Checksum: 0xC3E67447
	Offset: 0x220
	Size: 0x1AC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.vsmgr_prio_visionset_zombie_vortex))
	{
		level.vsmgr_prio_visionset_zombie_vortex = 23;
	}
	if(!isdefined(level.vsmgr_prio_overlay_zombie_vortex))
	{
		level.vsmgr_prio_overlay_zombie_vortex = 23;
	}
	visionset_mgr::register_info("visionset", "zm_idgun_vortex" + "_visionset", 1, level.vsmgr_prio_visionset_zombie_vortex, 30, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
	visionset_mgr::register_info("overlay", "zm_idgun_vortex" + "_blur", 1, level.vsmgr_prio_overlay_zombie_vortex, 1, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
	clientfield::register("scriptmover", "vortex_start", 1, 2, "counter");
	clientfield::register("allplayers", "vision_blur", 1, 1, "int");
	level.vortex_manager = spawnstruct();
	level.vortex_manager.count = 0;
	level.vortex_manager.a_vorticies = [];
	level.vortex_manager.a_active_vorticies = [];
	level.vortex_id = 0;
	init_vortices();
}

/*
	Name: function_8ac3bea9
	Namespace: zombie_vortex
	Checksum: 0x25EA09D5
	Offset: 0x3D8
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level vehicle_ai::register_custom_add_state_callback(&idgun_add_vehicle_death_state);
}

/*
	Name: init_vortices
	Namespace: zombie_vortex
	Checksum: 0xD196B5B2
	Offset: 0x408
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function init_vortices()
{
	for(i = 0; i < 8; i++)
	{
		svortex = spawn("script_model", (0, 0, 0));
		if(!isdefined(level.vortex_manager.a_vorticies))
		{
			level.vortex_manager.a_vorticies = [];
		}
		else if(!isarray(level.vortex_manager.a_vorticies))
		{
			level.vortex_manager.a_vorticies = array(level.vortex_manager.a_vorticies);
		}
		level.vortex_manager.a_vorticies[level.vortex_manager.a_vorticies.size] = svortex;
	}
}

/*
	Name: get_unused_vortex
	Namespace: zombie_vortex
	Checksum: 0x815D4855
	Offset: 0x510
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function get_unused_vortex()
{
	foreach(vortex in level.vortex_manager.a_vorticies)
	{
		if(!is_true(vortex.in_use))
		{
			return vortex;
		}
	}
	return level.vortex_manager.a_vorticies[0];
}

/*
	Name: get_active_vortex_count
	Namespace: zombie_vortex
	Checksum: 0x9E11F57D
	Offset: 0x5D0
	Size: 0xB2
	Parameters: 0
	Flags: Linked
*/
function get_active_vortex_count()
{
	count = 0;
	foreach(vortex in level.vortex_manager.a_vorticies)
	{
		if(is_true(vortex.in_use))
		{
			count++;
		}
	}
	return count;
}

/*
	Name: stop_vortex_fx_after_time
	Namespace: zombie_vortex
	Checksum: 0x9414E01
	Offset: 0x690
	Size: 0x64
	Parameters: 4
	Flags: Private
*/
function private stop_vortex_fx_after_time(vortex_fx_handle, vortex_position, vortex_explosion_fx, n_vortex_time)
{
	n_starttime = gettime();
	n_curtime = gettime() - n_starttime;
	while(n_curtime < n_vortex_time)
	{
		waitframe(1);
		n_curtime = gettime() - n_starttime;
	}
}

/*
	Name: start_timed_vortex
	Namespace: zombie_vortex
	Checksum: 0x77432D92
	Offset: 0x700
	Size: 0x744
	Parameters: 8
	Flags: Linked
*/
function start_timed_vortex(effect_version, v_vortex_origin, n_vortex_radius, n_vortex_explosion_radius, eattacker, weapon, should_shellshock_player, should_shield)
{
	if(!isdefined(eattacker))
	{
		eattacker = undefined;
	}
	if(!isdefined(weapon))
	{
		weapon = undefined;
	}
	if(!isdefined(should_shellshock_player))
	{
		should_shellshock_player = undefined;
	}
	if(!isdefined(should_shield))
	{
		should_shield = undefined;
	}
	self endon(#"death", #"disconnect");
	n_starttime = gettime();
	n_currtime = gettime() - n_starttime;
	a_e_players = getplayers();
	if(!isdefined(n_vortex_explosion_radius))
	{
		n_vortex_explosion_radius = n_vortex_radius * 1.5;
	}
	if(!isdefined(should_shellshock_player))
	{
		should_shellshock_player = 0;
	}
	if(!isdefined(should_shield))
	{
		should_shield = 0;
	}
	svortex = get_unused_vortex();
	svortex.in_use = 1;
	svortex.attacker = eattacker;
	svortex.weapon = weapon;
	svortex.angles = (0, 0, 0);
	svortex.origin = v_vortex_origin;
	svortex dontinterpolate();
	svortex clientfield::increment("vortex_start", effect_version);
	s_active_vortex = struct::spawn(v_vortex_origin);
	s_active_vortex.weapon = weapon;
	s_active_vortex.attacker = eattacker;
	if(!isdefined(level.vortex_manager.a_active_vorticies))
	{
		level.vortex_manager.a_active_vorticies = [];
	}
	else if(!isarray(level.vortex_manager.a_active_vorticies))
	{
		level.vortex_manager.a_active_vorticies = array(level.vortex_manager.a_active_vorticies);
	}
	level.vortex_manager.a_active_vorticies[level.vortex_manager.a_active_vorticies.size] = s_active_vortex;
	if(effect_version == 2)
	{
		n_vortex_time_sv = 9;
		n_vortex_time_cl = 10;
	}
	else
	{
		n_vortex_time_sv = 4;
		n_vortex_time_cl = 5;
	}
	n_vortex_time = int(n_vortex_time_sv * 1000);
	team = #"axis";
	if(isdefined(level.zombie_team))
	{
		team = level.zombie_team;
	}
	while(n_currtime <= n_vortex_time)
	{
		a_ai_zombies = array::get_all_closest(v_vortex_origin, getaiteamarray(team), undefined, undefined, n_vortex_radius);
		a_ai_zombies = arraycombine(a_ai_zombies, vortex_z_extension(a_ai_zombies, v_vortex_origin, n_vortex_radius), 0, 0);
		svortex.zombies = a_ai_zombies;
		if(is_true(level.idgun_draw_debug))
		{
			/#
				circle(v_vortex_origin, n_vortex_radius, (0, 0, 1), 0, 1, 1);
			#/
		}
		foreach(ai_zombie in a_ai_zombies)
		{
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
			if(!is_true(ai_zombie.interdimensional_gun_kill) && !ai_zombie.ignorevortices)
			{
				ai_zombie.damageorigin = v_vortex_origin;
				if(is_true(should_shield))
				{
					ai_zombie.allowdeath = 0;
					ai_zombie.magic_bullet_shield = 1;
				}
				ai_zombie.interdimensional_gun_kill = 1;
				ai_zombie.interdimensional_gun_attacker = eattacker;
				ai_zombie.interdimensional_gun_inflictor = eattacker;
				ai_zombie.interdimensional_gun_weapon = weapon;
			}
		}
		if(should_shellshock_player)
		{
			foreach(e_player in a_e_players)
			{
				if(isdefined(e_player) && !is_true(e_player.idgun_vision_on))
				{
					if(distance(e_player.origin, v_vortex_origin) < float(n_vortex_radius / 2))
					{
						e_player thread player_vortex_visionset("zm_idgun_vortex");
					}
				}
			}
		}
		waitframe(1);
		n_currtime = gettime() - n_starttime;
	}
	n_time_to_wait_for_explosion = (n_vortex_time_cl - n_vortex_time_sv) + 0.35;
	wait(n_time_to_wait_for_explosion);
	svortex.in_use = 0;
	arrayremovevalue(level.vortex_manager.a_active_vorticies, s_active_vortex);
	vortex_explosion(v_vortex_origin, eattacker, n_vortex_explosion_radius);
}

/*
	Name: vortex_z_extension
	Namespace: zombie_vortex
	Checksum: 0xF3E15706
	Offset: 0xE50
	Size: 0x13C
	Parameters: 3
	Flags: Linked
*/
function vortex_z_extension(a_ai_zombies, v_vortex_origin, n_vortex_radius)
{
	a_ai_zombies_extended = array::get_all_closest(v_vortex_origin, getaiteamarray(#"axis"), undefined, undefined, n_vortex_radius + 72);
	a_ai_zombies_extended_filtered = array::exclude(a_ai_zombies_extended, a_ai_zombies);
	i = 0;
	while(i < a_ai_zombies_extended_filtered.size)
	{
		if(a_ai_zombies_extended_filtered[i].origin[2] < v_vortex_origin[2] && bullettracepassed(a_ai_zombies_extended_filtered[i].origin + vectorscale((0, 0, 1), 5), v_vortex_origin + vectorscale((0, 0, 1), 20), 0, self, undefined, 0, 0))
		{
			i++;
		}
		else
		{
			arrayremovevalue(a_ai_zombies_extended_filtered, a_ai_zombies_extended_filtered[i]);
		}
	}
	return a_ai_zombies_extended_filtered;
}

/*
	Name: vortex_explosion
	Namespace: zombie_vortex
	Checksum: 0x677BCBDB
	Offset: 0xF98
	Size: 0x310
	Parameters: 3
	Flags: Linked, Private
*/
function private vortex_explosion(v_vortex_explosion_origin, eattacker, n_vortex_radius)
{
	team = #"axis";
	if(isdefined(level.zombie_team))
	{
		team = level.zombie_team;
	}
	a_ai_zombies = array::get_all_closest(v_vortex_explosion_origin, getaiteamarray(team), undefined, undefined, n_vortex_radius);
	if(is_true(level.idgun_draw_debug))
	{
		/#
			circle(v_vortex_explosion_origin, n_vortex_radius, (1, 0, 0), 0, 1, 1000);
		#/
	}
	foreach(ai_zombie in a_ai_zombies)
	{
		if(!ai_zombie.ignorevortices)
		{
			if(is_true(ai_zombie.interdimensional_gun_kill))
			{
				ai_zombie hide();
				continue;
			}
			ai_zombie.interdimensional_gun_kill = undefined;
			ai_zombie.interdimensional_gun_kill_vortex_explosion = 1;
			ai_zombie.veh_idgun_allow_damage = 1;
			if(isdefined(eattacker))
			{
				ai_zombie dodamage(ai_zombie.health + 10000, ai_zombie.origin, eattacker, undefined, undefined, "MOD_EXPLOSIVE");
			}
			else
			{
				ai_zombie dodamage(ai_zombie.health + 10000, ai_zombie.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
			}
			n_radius_sqr = n_vortex_radius * n_vortex_radius;
			n_distance_sqr = distancesquared(ai_zombie.origin, v_vortex_explosion_origin);
			n_dist_mult = n_distance_sqr / n_radius_sqr;
			v_fling = vectornormalize(ai_zombie.origin - v_vortex_explosion_origin);
			v_fling = (v_fling[0], v_fling[1], abs(v_fling[2]));
			v_fling = vectorscale(v_fling, 100 + (100 * n_dist_mult));
			ai_zombie startragdoll();
			ai_zombie launchragdoll(v_fling);
		}
	}
}

/*
	Name: player_vortex_visionset
	Namespace: zombie_vortex
	Checksum: 0xCECB41A2
	Offset: 0x12B0
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function player_vortex_visionset(name)
{
	self endon(#"death");
	thread visionset_mgr::activate("visionset", name + "_visionset", self, 0.25, 2, 0.25);
	thread visionset_mgr::activate("overlay", name + "_blur", self, 0.25, 2, 0.25);
	self.idgun_vision_on = 1;
	wait(2.5);
	self.idgun_vision_on = 0;
}

/*
	Name: idgun_add_vehicle_death_state
	Namespace: zombie_vortex
	Checksum: 0xA088836D
	Offset: 0x1378
	Size: 0x9C
	Parameters: 0
	Flags: Linked
*/
function idgun_add_vehicle_death_state()
{
	if(isairborne(self))
	{
		self vehicle_ai::add_state("idgun_death", &state_idgun_flying_crush_enter, &state_idgun_flying_crush_update, undefined);
	}
	else
	{
		self vehicle_ai::add_state("idgun_death", &state_idgun_crush_enter, &state_idgun_crush_update, undefined);
	}
}

/*
	Name: state_idgun_crush_enter
	Namespace: zombie_vortex
	Checksum: 0x6769FEDD
	Offset: 0x1420
	Size: 0x54
	Parameters: 1
	Flags: Linked
*/
function state_idgun_crush_enter(params)
{
	self vehicle_ai::clearalllookingandtargeting();
	self vehicle_ai::clearallmovement();
	self cancelaimove();
}

/*
	Name: flyentdelete
	Namespace: zombie_vortex
	Checksum: 0x5592AB2E
	Offset: 0x1480
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function flyentdelete(enttowatch)
{
	self endon(#"death");
	enttowatch waittill(#"death");
	self delete();
}

/*
	Name: state_idgun_crush_update
	Namespace: zombie_vortex
	Checksum: 0xAED0CE19
	Offset: 0x14D8
	Size: 0x260
	Parameters: 1
	Flags: Linked
*/
function state_idgun_crush_update(params)
{
	self endon(#"death");
	black_hole_center = params.vpoint;
	attacker = params.attacker;
	weapon = params.weapon;
	if(self.archetype == #"raps")
	{
		crush_anim = "ai_zombie_zod_raps_dth_f_id_gun_crush";
	}
	veh_to_black_hole_vec = vectornormalize(black_hole_center - self.origin);
	fly_ent = spawn("script_origin", self.origin);
	fly_ent thread flyentdelete(self);
	self linkto(fly_ent);
	while(true)
	{
		veh_to_black_hole_dist_sqr = distancesquared(self.origin, black_hole_center);
		if(veh_to_black_hole_dist_sqr < 144)
		{
			self.veh_idgun_allow_damage = 1;
			self dodamage(self.health + 666, self.origin, attacker, undefined, "none", "MOD_UNKNOWN", 0, weapon);
			return;
		}
		if(!is_true(self.crush_anim_started) && veh_to_black_hole_dist_sqr < 1600)
		{
			if(isdefined(crush_anim))
			{
				self animscripted("anim_notify", self.origin, self.angles, crush_anim, "normal", undefined, undefined, 0.2);
			}
			self.crush_anim_started = 1;
		}
		fly_ent.origin = fly_ent.origin + (veh_to_black_hole_vec * 8);
		wait(0.1);
	}
}

/*
	Name: state_idgun_flying_crush_enter
	Namespace: zombie_vortex
	Checksum: 0x22849DA5
	Offset: 0x1740
	Size: 0x5E
	Parameters: 1
	Flags: Linked
*/
function state_idgun_flying_crush_enter(params)
{
	self vehicle_ai::clearallmovement();
	self cancelaimove();
	self setneargoalnotifydist(4);
	self.vehaircraftcollisionenabled = 0;
}

/*
	Name: state_idgun_flying_crush_update
	Namespace: zombie_vortex
	Checksum: 0x9B5DEB5F
	Offset: 0x17A8
	Size: 0x15C
	Parameters: 1
	Flags: Linked
*/
function state_idgun_flying_crush_update(params)
{
	self endon(#"death");
	black_hole_center = params.vpoint;
	attacker = params.attacker;
	weapon = params.weapon;
	self setspeed(2);
	self asmrequestsubstate(#"hash_605a76518deb2c5f");
	self thread switch_to_crush_asm(black_hole_center);
	self function_a57c34b7(black_hole_center, 0, 0);
	self waittill(#"near_goal");
	self vehicle_ai::get_state_callbacks("death").update_func = &state_idgun_flying_death_update;
	self.veh_idgun_allow_damage = 1;
	self dodamage(self.health + 666, self.origin, attacker, undefined, "none", "MOD_UNKNOWN", 0, weapon);
}

/*
	Name: switch_to_crush_asm
	Namespace: zombie_vortex
	Checksum: 0xE2C49D29
	Offset: 0x1910
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function switch_to_crush_asm(black_hole_center)
{
	self endon(#"death");
	while(true)
	{
		if(distancesquared(self.origin, black_hole_center) < 900)
		{
			self asmrequestsubstate(#"hash_1d57c7f1617da95b");
			return;
		}
		wait(0.1);
	}
}

/*
	Name: state_idgun_flying_death_update
	Namespace: zombie_vortex
	Checksum: 0x58194FA0
	Offset: 0x19A0
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function state_idgun_flying_death_update(params)
{
	self endon(#"death");
	if(isdefined(self.parasiteenemy) && isdefined(self.parasiteenemy.hunted_by))
	{
		self.parasiteenemy.hunted_by--;
	}
	self playsound(#"zmb_parasite_explo");
	wait(0.2);
	self delete();
}

