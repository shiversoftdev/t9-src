#using script_178024232e91b0a1;
#using script_2c5daa95f8fec03c;
#using script_317aa6153a75c589;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_41fe08c37d53a635;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_5e0bde12853401b5;
#using script_6809bf766eba194a;
#using script_71dfbfdfba4489a0;
#using script_7e59d7bba853fe4b;
#using script_8988fdbc78d6c53;
#using script_caf007e2a98afa2;
#using scripts\core_common\aat_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\burnplayer.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_spawner.gsc;

#namespace mechz;

/*
	Name: function_dbe6dcb9
	Namespace: mechz
	Checksum: 0xBE1BABA6
	Offset: 0x9F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dbe6dcb9()
{
	level notify(769715328);
}

#namespace mechzbehavior;

/*
	Name: function_89f2df9
	Namespace: mechzbehavior
	Checksum: 0xB03905E4
	Offset: 0xA18
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"mechz", &init, undefined, &finalize, undefined);
}

/*
	Name: init
	Namespace: mechzbehavior
	Checksum: 0x53952FB8
	Offset: 0xA68
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function init()
{
	initmechzbehaviorsandasm();
	spawner::add_archetype_spawn_function(#"mechz", &archetypemechzblackboardinit);
	spawner::add_archetype_spawn_function(#"mechz", &mechzserverutils::mechzspawnsetup);
	spawner::function_89a2cd87(#"mechz", &mechzserverutils::function_5d873f78);
	clientfield::register("actor", "mechz_ft", 1, 1, "int");
	clientfield::register("actor", "mechz_faceplate_detached", 1, 1, "int");
	clientfield::register("actor", "mechz_powercap_detached", 1, 1, "int");
	clientfield::register("actor", "mechz_claw_detached", 1, 1, "int");
	clientfield::register("actor", "mechz_115_gun_firing", 1, 1, "int");
	clientfield::register("actor", "mechz_headlamp_off", 1, 2, "int");
	clientfield::register("actor", "mechz_long_jump", 1, 1, "counter");
	clientfield::register("actor", "mechz_jetpack_explosion", 1, 1, "int");
	clientfield::register("actor", "mechz_face", 1, 3, "int");
}

/*
	Name: finalize
	Namespace: mechzbehavior
	Checksum: 0xE8513B98
	Offset: 0xCC8
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function finalize()
{
	level thread aat::register_immunity("ammomod_brainrot", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst", #"mechz", 1, 1, 1);
}

/*
	Name: initmechzbehaviorsandasm
	Namespace: mechzbehavior
	Checksum: 0x6ACAD758
	Offset: 0xDB8
	Size: 0x129C
	Parameters: 0
	Flags: Linked, Private
*/
function private initmechzbehaviorsandasm()
{
	/#
		assert(isscriptfunctionptr(&mechztargetservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzTargetService", &mechztargetservice);
	/#
		assert(isscriptfunctionptr(&mechzgrenadeservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzGrenadeService", &mechzgrenadeservice);
	/#
		assert(isscriptfunctionptr(&mechzberserkknockdownservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzBerserkKnockdownService", &mechzberserkknockdownservice);
	/#
		assert(isscriptfunctionptr(&function_277f0392));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzLongJumpService", &function_277f0392, 1);
	/#
		assert(isscriptfunctionptr(&mechzshouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldMelee", &mechzshouldmelee);
	/#
		assert(isscriptfunctionptr(&mechzshouldshowpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldShowPain", &mechzshouldshowpain);
	/#
		assert(isscriptfunctionptr(&function_843546a7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldShowJetpackPain", &function_843546a7);
	/#
		assert(isscriptfunctionptr(&function_3b7595ba));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("mechzEnemyInAim", &function_3b7595ba);
	/#
		assert(isscriptfunctionptr(&mechzshouldshootgrenade));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldShootGrenade", &mechzshouldshootgrenade);
	/#
		assert(isscriptfunctionptr(&mechzshouldshootflame));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldShootFlame", &mechzshouldshootflame);
	/#
		assert(isscriptfunctionptr(&mechzshouldshootflamesweep));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldShootFlameSweep", &mechzshouldshootflamesweep);
	/#
		assert(isscriptfunctionptr(&mechzshouldturnberserk));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldTurnBerserk", &mechzshouldturnberserk);
	/#
		assert(isscriptfunctionptr(&mechzshouldstumble));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldStumble", &mechzshouldstumble);
	/#
		assert(isscriptfunctionptr(&function_a7b88d7a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShouldLongJump", &function_a7b88d7a);
	/#
		assert(isscriptfunctionptr(&function_b6dbf1e0));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzIsJumping", &function_b6dbf1e0);
	/#
		assert(isscriptfunctionptr(&function_77bd7d26));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzIsInSafeZone", &function_77bd7d26);
	/#
		assert(!isdefined(&mechzstumblestart) || isscriptfunctionptr(&mechzstumblestart));
	#/
	/#
		assert(!isdefined(&mechzstumbleupdate) || isscriptfunctionptr(&mechzstumbleupdate));
	#/
	/#
		assert(!isdefined(&mechzstumbleend) || isscriptfunctionptr(&mechzstumbleend));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("mechzStumbleLoop", &mechzstumblestart, &mechzstumbleupdate, &mechzstumbleend);
	/#
		assert(!isdefined(&mechzshootflameactionstart) || isscriptfunctionptr(&mechzshootflameactionstart));
	#/
	/#
		assert(!isdefined(&mechzshootflameactionupdate) || isscriptfunctionptr(&mechzshootflameactionupdate));
	#/
	/#
		assert(!isdefined(&mechzshootflameactionend) || isscriptfunctionptr(&mechzshootflameactionend));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("mechzShootFlameAction", &mechzshootflameactionstart, &mechzshootflameactionupdate, &mechzshootflameactionend);
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_ecd21bd2) || isscriptfunctionptr(&function_ecd21bd2));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("mechzLongJumpLoop", undefined, &function_ecd21bd2, undefined);
	/#
		assert(isscriptfunctionptr(&function_d40c590a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzPrepToShootGrenadeStart", &function_d40c590a);
	/#
		assert(isscriptfunctionptr(&function_d40c590a));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("mechzPrepToShootGrenadeStart", &function_d40c590a);
	/#
		assert(isscriptfunctionptr(&function_f5ffcbb4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzPrepToShootGrenadesTerminate", &function_f5ffcbb4);
	/#
		assert(isscriptfunctionptr(&function_f5ffcbb4));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("mechzPrepToShootGrenadesTerminate", &function_f5ffcbb4);
	/#
		assert(isscriptfunctionptr(&function_61dd507d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShootGrenadeStart", &function_61dd507d);
	/#
		assert(isscriptfunctionptr(&function_61dd507d));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("mechzShootGrenadeStart", &function_61dd507d);
	/#
		assert(isscriptfunctionptr(&function_e8c59ca8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShootGrenadeTerminate", &function_e8c59ca8);
	/#
		assert(isscriptfunctionptr(&function_e8c59ca8));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("mechzShootGrenadeTerminate", &function_e8c59ca8);
	/#
		assert(isscriptfunctionptr(&function_fc05dfd3));
	#/
	behaviorstatemachine::registerbsmscriptapiinternal("mechzSetSpeedWalk", &function_fc05dfd3);
	/#
		assert(isscriptfunctionptr(&function_1a37c206));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzSetSpeedRun", &function_1a37c206);
	/#
		assert(isscriptfunctionptr(&mechzshootflame));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzShootFlame", &mechzshootflame);
	/#
		assert(isscriptfunctionptr(&mechzupdateflame));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzUpdateFlame", &mechzupdateflame);
	/#
		assert(isscriptfunctionptr(&mechzstopflame));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzStopFlame", &mechzstopflame);
	/#
		assert(isscriptfunctionptr(&mechzplayedberserkintro));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzPlayedBerserkIntro", &mechzplayedberserkintro);
	/#
		assert(isscriptfunctionptr(&mechzattackstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzAttackStart", &mechzattackstart);
	/#
		assert(isscriptfunctionptr(&mechzdeathstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzDeathStart", &mechzdeathstart);
	/#
		assert(isscriptfunctionptr(&mechzidlestart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzIdleStart", &mechzidlestart);
	/#
		assert(isscriptfunctionptr(&mechzpainstart));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzPainStart", &mechzpainstart);
	/#
		assert(isscriptfunctionptr(&mechzpainterminate));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzPainTerminate", &mechzpainterminate);
	/#
		assert(isscriptfunctionptr(&function_2726bc43));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzJetpackPainTerminate", &function_2726bc43);
	/#
		assert(isscriptfunctionptr(&function_16c82231));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzLongJumpStart", &function_16c82231);
	/#
		assert(isscriptfunctionptr(&function_4af53b9a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("mechzLongJumpTerminate", &function_4af53b9a);
	animationstatenetwork::registeranimationmocomp("mocomp_mechz_long_jump", &function_e2c3704e, &function_9ba82c0a, &function_62826a8e);
	animationstatenetwork::registeranimationmocomp("mocomp_mechz_long_jump_face_goal", &function_1cc76960, undefined, &function_65225d1f);
	animationstatenetwork::registernotetrackhandlerfunction("melee_soldat", &mechznotetrackmelee);
	animationstatenetwork::registernotetrackhandlerfunction("fire_chaingun", &mechznotetrackshootgrenade);
	animationstatenetwork::registernotetrackhandlerfunction("jump_shake", &function_4e89924a);
}

/*
	Name: archetypemechzblackboardinit
	Namespace: mechzbehavior
	Checksum: 0xE45FF1C3
	Offset: 0x2060
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private archetypemechzblackboardinit()
{
	blackboard::createblackboardforentity(self);
	self.___archetypeonanimscriptedcallback = &archetypemechzonanimscriptedcallback;
}

/*
	Name: archetypemechzonanimscriptedcallback
	Namespace: mechzbehavior
	Checksum: 0xCCDD1576
	Offset: 0x20A0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private archetypemechzonanimscriptedcallback(entity)
{
	entity.__blackboard = undefined;
	entity archetypemechzblackboardinit();
}

/*
	Name: mechznotetrackmelee
	Namespace: mechzbehavior
	Checksum: 0x85968C5F
	Offset: 0x20D8
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private mechznotetrackmelee(entity)
{
	if(isdefined(entity.mechz_melee_knockdown_function))
	{
		entity thread [[entity.mechz_melee_knockdown_function]]();
	}
	entity melee();
}

/*
	Name: mechznotetrackshootgrenade
	Namespace: mechzbehavior
	Checksum: 0x1F0CD1A6
	Offset: 0x2128
	Size: 0x28C
	Parameters: 1
	Flags: Linked, Private
*/
function private mechznotetrackshootgrenade(entity)
{
	if(!isdefined(entity.enemy))
	{
		return;
	}
	base_target_pos = entity.enemy.origin;
	v_velocity = entity.enemy getvelocity();
	var_b6897326 = randomfloatrange(1, 2.5);
	base_target_pos = base_target_pos + (v_velocity * var_b6897326);
	target_pos_offset_x = math::randomsign() * randomint(48);
	target_pos_offset_y = math::randomsign() * randomint(48);
	target_pos = base_target_pos + (target_pos_offset_x, target_pos_offset_y, 0);
	dir = vectortoangles(target_pos - entity.origin);
	dir = anglestoforward(dir);
	launch_offset = dir * 5;
	launch_pos = entity gettagorigin("tag_gun_barrel2") + launch_offset;
	dist = distance(launch_pos, target_pos);
	velocity = dir * dist;
	velocity = velocity + vectorscale((0, 0, 1), 120);
	val = 1;
	oldval = entity clientfield::get("mechz_115_gun_firing");
	if(oldval === val)
	{
		val = 0;
	}
	entity clientfield::set("mechz_115_gun_firing", val);
	entity magicgrenadetype(getweapon("eq_mechz_firebomb"), launch_pos, velocity);
}

/*
	Name: function_4e89924a
	Namespace: mechzbehavior
	Checksum: 0x53D49D36
	Offset: 0x23C0
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function function_4e89924a(entity)
{
	entity clientfield::increment("mechz_long_jump");
}

/*
	Name: mechztargetservice
	Namespace: mechzbehavior
	Checksum: 0x90C048A9
	Offset: 0x23F8
	Size: 0x236
	Parameters: 1
	Flags: Linked
*/
function mechztargetservice(entity)
{
	if(is_true(entity.ignoreall))
	{
		return false;
	}
	if(isdefined(entity.destroy_octobomb))
	{
		return false;
	}
	player = zombie_utility::get_closest_valid_player(self.origin, self.ignore_player);
	entity.favoriteenemy = player;
	if(!isdefined(player) || player isnotarget())
	{
		if(isdefined(entity.ignore_player))
		{
			if(isdefined(level._should_skip_ignore_player_logic) && [[level._should_skip_ignore_player_logic]]())
			{
				return;
			}
			entity.ignore_player = [];
		}
		/#
			if(is_true(level.b_mechz_true_ignore))
			{
				entity setgoal(entity.origin);
				return false;
			}
		#/
		if(isdefined(level.no_target_override))
		{
			[[level.no_target_override]](entity);
		}
		else
		{
			entity setgoal(entity.origin);
		}
		return false;
	}
	if(isdefined(level.enemy_location_override_func))
	{
		enemy_ground_pos = [[level.enemy_location_override_func]](entity, player);
		if(isdefined(enemy_ground_pos))
		{
			entity setgoal(enemy_ground_pos);
			return true;
		}
	}
	targetpos = getclosestpointonnavmesh(player.origin, 64, 30);
	if(isdefined(targetpos))
	{
		entity setgoal(targetpos);
		return true;
	}
	entity setgoal(entity.origin);
	return false;
}

/*
	Name: mechzgrenadeservice
	Namespace: mechzbehavior
	Checksum: 0x40A879FA
	Offset: 0x2638
	Size: 0xCE
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzgrenadeservice(entity)
{
	if(!isdefined(entity.burstgrenadesfired))
	{
		entity.burstgrenadesfired = 0;
	}
	if(entity.burstgrenadesfired >= 1)
	{
		if(gettime() > entity.nextgrenadetime)
		{
			entity.burstgrenadesfired = 0;
		}
	}
	if(isdefined(level.a_electroball_grenades))
	{
		arrayremovevalue(level.a_electroball_grenades, undefined);
		a_active_grenades = array::filter(level.a_electroball_grenades, 0, &mechzfiltergrenadesbyowner, entity);
		entity.activegrenades = a_active_grenades.size;
	}
	else
	{
		entity.activegrenades = 0;
	}
}

/*
	Name: mechzfiltergrenadesbyowner
	Namespace: mechzbehavior
	Checksum: 0x715B0F7E
	Offset: 0x2710
	Size: 0x30
	Parameters: 2
	Flags: Linked, Private
*/
function private mechzfiltergrenadesbyowner(grenade, mechz)
{
	if(grenade.owner === mechz)
	{
		return true;
	}
	return false;
}

/*
	Name: mechzberserkknockdownservice
	Namespace: mechzbehavior
	Checksum: 0xEF1C724C
	Offset: 0x2748
	Size: 0x3CE
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzberserkknockdownservice(entity)
{
	velocity = entity getvelocity();
	predict_time = 0.3;
	predicted_pos = entity.origin + (velocity * predict_time);
	move_dist_sq = distancesquared(predicted_pos, entity.origin);
	speed = move_dist_sq / predict_time;
	if(speed >= 10)
	{
		a_zombies = getentitiesinradius(entity.origin, 48, 15);
		a_filtered_zombies = array::filter(a_zombies, 0, &mechzzombieeligibleforberserkknockdown, entity, predicted_pos);
		if(a_filtered_zombies.size > 0)
		{
			foreach(zombie in a_filtered_zombies)
			{
				zombie.knockdown = 1;
				zombie.knockdown_type = "knockdown_shoved";
				zombie_to_mechz = entity.origin - zombie.origin;
				zombie_to_mechz_2d = vectornormalize((zombie_to_mechz[0], zombie_to_mechz[1], 0));
				zombie_forward = anglestoforward(zombie.angles);
				zombie_forward_2d = vectornormalize((zombie_forward[0], zombie_forward[1], 0));
				zombie_right = anglestoright(zombie.angles);
				zombie_right_2d = vectornormalize((zombie_right[0], zombie_right[1], 0));
				dot = vectordot(zombie_to_mechz_2d, zombie_forward_2d);
				if(dot >= 0.5)
				{
					zombie.knockdown_direction = "front";
					zombie.getup_direction = "getup_back";
					continue;
				}
				if(dot < 0.5 && dot > -0.5)
				{
					dot = vectordot(zombie_to_mechz_2d, zombie_right_2d);
					if(dot > 0)
					{
						zombie.knockdown_direction = "right";
						if(math::cointoss())
						{
							zombie.getup_direction = "getup_back";
						}
						else
						{
							zombie.getup_direction = "getup_belly";
						}
					}
					else
					{
						zombie.knockdown_direction = "left";
						zombie.getup_direction = "getup_belly";
					}
					continue;
				}
				zombie.knockdown_direction = "back";
				zombie.getup_direction = "getup_belly";
			}
		}
	}
}

/*
	Name: mechzzombieeligibleforberserkknockdown
	Namespace: mechzbehavior
	Checksum: 0xF6499D4B
	Offset: 0x2B20
	Size: 0x178
	Parameters: 3
	Flags: Linked, Private
*/
function private mechzzombieeligibleforberserkknockdown(zombie, mechz, predicted_pos)
{
	if(!isdefined(mechz) || !isdefined(predicted_pos))
	{
		return false;
	}
	if(mechz.knockdown === 1)
	{
		return false;
	}
	if(mechz.archetype !== #"zombie")
	{
		return false;
	}
	if(mechz.is_immune_to_knockdown === 1)
	{
		return false;
	}
	origin = predicted_pos.origin;
	facing_vec = anglestoforward(predicted_pos.angles);
	enemy_vec = mechz.origin - origin;
	enemy_yaw_vec = (enemy_vec[0], enemy_vec[1], 0);
	facing_yaw_vec = (facing_vec[0], facing_vec[1], 0);
	enemy_yaw_vec = vectornormalize(enemy_yaw_vec);
	facing_yaw_vec = vectornormalize(facing_yaw_vec);
	enemy_dot = vectordot(facing_yaw_vec, enemy_yaw_vec);
	if(enemy_dot < 0)
	{
		return false;
	}
	return true;
}

/*
	Name: function_12925fd
	Namespace: mechzbehavior
	Checksum: 0x48CCF08
	Offset: 0x2CA0
	Size: 0x2B2
	Parameters: 1
	Flags: Linked
*/
function function_12925fd(entity)
{
	if(isdefined(entity.var_4b559171))
	{
		goalpos = getclosestpointonnavmesh(entity.var_4b559171, 256, entity getpathfindingradius() * 1.2);
		entity.var_4b559171 = undefined;
	}
	else
	{
		var_1f2328d0 = entity function_4794d6a3();
		if(!isdefined(var_1f2328d0) || !isdefined(var_1f2328d0.goalpos))
		{
			return undefined;
		}
		if(isdefined(entity.favoriteenemy))
		{
			velocity = entity.favoriteenemy getvelocity();
			goalpos = var_1f2328d0.goalpos + (velocity * 1);
			goalpos = getclosestpointonnavmesh(goalpos, 256, entity getpathfindingradius() * 1.2);
		}
		else
		{
			if(is_true(entity.var_1fa24724) && isdefined(entity.enemy))
			{
				goalpos = getclosestpointonnavmesh(entity.enemy.origin, 256, entity getpathfindingradius() * 1.2);
			}
			else
			{
				goalpos = getclosestpointonnavmesh(var_1f2328d0.goalpos, 256, entity getpathfindingradius() * 1.2);
			}
		}
		if(!isdefined(goalpos))
		{
			return undefined;
		}
		if(isdefined(entity.favoriteenemy) && distancesquared(entity.favoriteenemy.origin, goalpos) < sqr(96))
		{
			to_origin = entity.origin - goalpos;
			goalpos = checknavmeshdirection(goalpos, to_origin, 96, entity getpathfindingradius() * 1.2);
		}
	}
	return goalpos;
}

/*
	Name: function_277f0392
	Namespace: mechzbehavior
	Checksum: 0x4893DDE5
	Offset: 0x2F60
	Size: 0x848
	Parameters: 1
	Flags: Linked
*/
function function_277f0392(entity)
{
	if(isdefined(entity.var_80dcda45) || gettime() < entity.jump_cooldown || !is_true(entity.var_7c4488fd))
	{
		return false;
	}
	goalpos = function_12925fd(entity);
	if(!isdefined(goalpos))
	{
		return false;
	}
	var_db31ebd5 = !entity haspath() && (abs(goalpos[2] - self.origin[2])) > 120;
	if(!var_db31ebd5 && distance2dsquared(entity.origin, goalpos) <= sqr(500) && (abs(entity.origin[2] - goalpos[2])) <= 2000)
	{
		return false;
	}
	startpos = entity.origin + getmovedelta(#"hash_2cf640e3ec8ad827", 0, 1);
	distance2d = distance2d(goalpos, startpos);
	dir = goalpos - startpos;
	dir = (dir[0], dir[1], 0);
	dir = vectornormalize(dir);
	time = mapfloat(500, 10000, 1, 3.5, distance2d);
	/#
		record3dtext(time, entity.origin, (0, 0, 1), "", entity);
	#/
	time = time / (float(function_60d95f53()) / 1000);
	var_199c57d2 = distance2d / time;
	var_ef97a46c = (goalpos[2] - startpos[2]) + (2.25 * sqr(time)) / time;
	entity.var_80dcda45 = {#vel:(dir[0] * var_199c57d2, dir[1] * var_199c57d2, var_ef97a46c), #to_goal:goalpos - startpos, #goal:goalpos, #nextpos:startpos, #startpos:startpos, #time:1};
	entity.var_80dcda45.nextpos = (entity.var_80dcda45.startpos + (entity.var_80dcda45.vel * entity.var_80dcda45.time)) + ((0.5 * (0, 0, -1)) * 4.5) * sqr(entity.var_80dcda45.time);
	/#
		recordsphere(entity.var_80dcda45.goal, 10, (0, 0, 1), "", entity);
		recordline(startpos, entity.var_80dcda45.goal, (0, 0, 1), "", entity);
		prev_origin = startpos;
		for(i = 1; i <= time; i++)
		{
			pos = (entity.var_80dcda45.startpos + (entity.var_80dcda45.vel * i)) + ((0.5 * (0, 0, -1)) * 4.5) * sqr(i);
			recordline(prev_origin, pos, (0, 0, 1), "", entity);
			record3dtext(i, pos, (0, 0, 1), "", entity);
			prev_origin = pos;
		}
		recordline(prev_origin, entity.var_80dcda45.goal, (0, 0, 1), "", entity);
		record3dtext(i, entity.var_80dcda45.goal, (0, 0, 1), "", entity);
	#/
	prev_origin = entity.origin;
	passed = 1;
	for(i = 1; i <= 5; i++)
	{
		var_21dd2ef6 = (time / 5) * i;
		pos = (entity.var_80dcda45.startpos + (entity.var_80dcda45.vel * var_21dd2ef6)) + ((0.5 * (0, 0, -1)) * 4.5) * sqr(var_21dd2ef6);
		traceresult = physicstraceex(prev_origin, pos, entity getmins(), entity getmaxs(), entity);
		if(traceresult[#"fraction"] != 1)
		{
			if(traceresult[#"normal"][2] < sin(10))
			{
				/#
					recordline(prev_origin, pos, (1, 0, 0), "", entity);
					recordsphere(traceresult[#"position"], 5, (1, 1, 0), "", entity);
					recordline(traceresult[#"position"], traceresult[#"position"] + (traceresult[#"normal"] * 20), (1, 1, 0), "", entity);
				#/
				passed = 0;
				break;
			}
			var_55853a47 = function_9cc082d2(traceresult[#"position"], 2 * 39.37008);
			if(!isdefined(var_55853a47))
			{
				/#
					recordline(prev_origin, pos, (1, 0, 0), "", entity);
				#/
				passed = 0;
				break;
			}
		}
		/#
			recordline(prev_origin, pos, (0, 1, 0), "", entity);
		#/
		prev_origin = pos;
	}
	if(!passed)
	{
		entity.var_80dcda45 = undefined;
		return;
	}
}

/*
	Name: mechzshouldmelee
	Namespace: mechzbehavior
	Checksum: 0x84B3912A
	Offset: 0x37B0
	Size: 0xCA
	Parameters: 1
	Flags: Linked
*/
function mechzshouldmelee(entity)
{
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(distancesquared(entity.origin, entity.enemy.origin) > 12544)
	{
		return false;
	}
	if(is_true(entity.enemy.usingvehicle))
	{
		return true;
	}
	yaw = abs(zombie_utility::getyawtoenemy());
	if(yaw > 45)
	{
		return false;
	}
	return true;
}

/*
	Name: mechzshouldshowpain
	Namespace: mechzbehavior
	Checksum: 0xA0A1AE88
	Offset: 0x3888
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzshouldshowpain(entity)
{
	if(entity.partdestroyed === 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_843546a7
	Namespace: mechzbehavior
	Checksum: 0xB0BAB09D
	Offset: 0x38B8
	Size: 0x28
	Parameters: 1
	Flags: Linked, Private
*/
function private function_843546a7(entity)
{
	if(entity.var_97601164 === 1)
	{
		return true;
	}
	return false;
}

/*
	Name: function_3b7595ba
	Namespace: mechzbehavior
	Checksum: 0x279C0194
	Offset: 0x38E8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3b7595ba(entity)
{
	if(entity mechzserverutils::mechzcheckinarc())
	{
		return true;
	}
	return false;
}

/*
	Name: mechzshouldshootgrenade
	Namespace: mechzbehavior
	Checksum: 0x25BE6A9D
	Offset: 0x3920
	Size: 0x136
	Parameters: 1
	Flags: Linked
*/
function mechzshouldshootgrenade(entity)
{
	if(entity.berserk === 1)
	{
		return false;
	}
	if(entity.gun_attached !== 1)
	{
		return false;
	}
	if(is_true(self.ignoreall))
	{
		return false;
	}
	enemy = namespace_e0710ee6::function_825317c(entity);
	if(!isdefined(enemy))
	{
		return false;
	}
	if(!isdefined(entity.burstgrenadesfired) || entity.burstgrenadesfired >= 1)
	{
		return false;
	}
	if(entity.activegrenades >= 3)
	{
		return false;
	}
	if(!entity cansee(enemy))
	{
		return false;
	}
	dist_sq = distancesquared(entity.origin, enemy.origin);
	if(dist_sq < 62500 || dist_sq > 1440000)
	{
		return false;
	}
	return true;
}

/*
	Name: mechzshouldshootflame
	Namespace: mechzbehavior
	Checksum: 0xFF894CF8
	Offset: 0x3A60
	Size: 0x216
	Parameters: 1
	Flags: Linked
*/
function mechzshouldshootflame(entity)
{
	/#
		if(is_true(entity.shoot_flame))
		{
			return true;
		}
	#/
	if(entity.berserk === 1)
	{
		return false;
	}
	if(is_true(entity.isshootingflame) && gettime() < entity.stopshootingflametime)
	{
		return true;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(entity.isshootingflame === 1 && entity.stopshootingflametime <= gettime())
	{
		return false;
	}
	if(entity.nextflametime > gettime())
	{
		return false;
	}
	if(!entity mechzserverutils::mechzcheckinarc(26))
	{
		return false;
	}
	dist_sq = distancesquared(entity.origin, entity.favoriteenemy.origin);
	if(dist_sq < 9216 || dist_sq > 90000)
	{
		return false;
	}
	in_vehicle = isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle();
	can_see = bullettracepassed(entity.origin + vectorscale((0, 0, 1), 36), entity.favoriteenemy.origin + vectorscale((0, 0, 1), 36), 0, undefined);
	if(!can_see && !in_vehicle)
	{
		entity.nextflametime = gettime() + 2500;
		return false;
	}
	return true;
}

/*
	Name: mechzshouldshootflamesweep
	Namespace: mechzbehavior
	Checksum: 0xA17FA5C2
	Offset: 0x3C80
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzshouldshootflamesweep(entity)
{
	if(entity.berserk === 1)
	{
		return false;
	}
	if(!mechzshouldshootflame(entity))
	{
		return false;
	}
	if(randomint(100) > 10)
	{
		return false;
	}
	near_players = 0;
	players = getplayers(undefined, entity.origin, 100);
	if(players.size < 2)
	{
		return false;
	}
	return true;
}

/*
	Name: mechzshouldturnberserk
	Namespace: mechzbehavior
	Checksum: 0x3BCB27DB
	Offset: 0x3D40
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzshouldturnberserk(entity)
{
	if(entity.berserk === 1 && entity.hasturnedberserk !== 1)
	{
		return true;
	}
	return false;
}

/*
	Name: mechzshouldstumble
	Namespace: mechzbehavior
	Checksum: 0x90C95CBC
	Offset: 0x3D88
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzshouldstumble(entity)
{
	if(is_true(entity.stumble))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a7b88d7a
	Namespace: mechzbehavior
	Checksum: 0x91DB8843
	Offset: 0x3DC0
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a7b88d7a(entity)
{
	if(isdefined(entity.var_80dcda45))
	{
		return true;
	}
	return false;
}

/*
	Name: function_b6dbf1e0
	Namespace: mechzbehavior
	Checksum: 0xABFB957A
	Offset: 0x3DF0
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b6dbf1e0(entity)
{
	if(is_true(entity.isjumping))
	{
		return true;
	}
	return false;
}

/*
	Name: function_77bd7d26
	Namespace: mechzbehavior
	Checksum: 0xEB41BA6B
	Offset: 0x3E28
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_77bd7d26(entity)
{
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	distsqr = distancesquared(entity.origin, entity.favoriteenemy.origin);
	if(distsqr < 360000 && distsqr > 50625)
	{
		return true;
	}
	return false;
}

/*
	Name: mechzshootgrenadeaction
	Namespace: mechzbehavior
	Checksum: 0x5BA25524
	Offset: 0x3EB0
	Size: 0x42
	Parameters: 2
	Flags: Private
*/
function private mechzshootgrenadeaction(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity.grenadestarttime = gettime() + 3000;
	return 5;
}

/*
	Name: mechzshootgrenadeactionupdate
	Namespace: mechzbehavior
	Checksum: 0x81147645
	Offset: 0x3F00
	Size: 0x38
	Parameters: 2
	Flags: Private
*/
function private mechzshootgrenadeactionupdate(entity, asmstatename)
{
	if(!is_true(asmstatename.shoot_grenade))
	{
		return 4;
	}
	return 5;
}

/*
	Name: mechzstumblestart
	Namespace: mechzbehavior
	Checksum: 0x82ADB274
	Offset: 0x3F40
	Size: 0x42
	Parameters: 2
	Flags: Linked, Private
*/
function private mechzstumblestart(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity.stumbletime = gettime() + 500;
	return 5;
}

/*
	Name: mechzstumbleupdate
	Namespace: mechzbehavior
	Checksum: 0x26592227
	Offset: 0x3F90
	Size: 0x2C
	Parameters: 2
	Flags: Linked, Private
*/
function private mechzstumbleupdate(entity, asmstatename)
{
	if(gettime() > asmstatename.stumbletime)
	{
		return 4;
	}
	return 5;
}

/*
	Name: mechzstumbleend
	Namespace: mechzbehavior
	Checksum: 0xFDD6C728
	Offset: 0x3FC8
	Size: 0x32
	Parameters: 2
	Flags: Linked, Private
*/
function private mechzstumbleend(entity, asmstatename)
{
	asmstatename.stumble = 0;
	asmstatename.stumble_stun_cooldown_time = gettime() + 10000;
	return 4;
}

/*
	Name: mechzshootflameactionstart
	Namespace: mechzbehavior
	Checksum: 0xD8808240
	Offset: 0x4008
	Size: 0x56
	Parameters: 2
	Flags: Linked
*/
function mechzshootflameactionstart(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	mechzshootflame(entity);
	entity.blindaim = 1;
	return 5;
}

/*
	Name: mechzshootflameactionupdate
	Namespace: mechzbehavior
	Checksum: 0x25F97C
	Offset: 0x4068
	Size: 0x100
	Parameters: 2
	Flags: Linked
*/
function mechzshootflameactionupdate(entity, asmstatename)
{
	if(is_true(asmstatename.berserk))
	{
		mechzstopflame(asmstatename);
		return 4;
	}
	if(is_true(mechzshouldmelee(asmstatename)))
	{
		mechzstopflame(asmstatename);
		return 4;
	}
	if(is_true(asmstatename.isshootingflame))
	{
		if(isdefined(asmstatename.stopshootingflametime) && gettime() > asmstatename.stopshootingflametime)
		{
			mechzstopflame(asmstatename);
			return 4;
		}
		mechzupdateflame(asmstatename);
	}
	return 5;
}

/*
	Name: mechzshootflameactionend
	Namespace: mechzbehavior
	Checksum: 0xEC190723
	Offset: 0x4170
	Size: 0x3A
	Parameters: 2
	Flags: Linked
*/
function mechzshootflameactionend(entity, asmstatename)
{
	mechzstopflame(asmstatename);
	asmstatename.blindaim = 0;
	return 4;
}

/*
	Name: function_ecd21bd2
	Namespace: mechzbehavior
	Checksum: 0x9D4046F3
	Offset: 0x41B8
	Size: 0x340
	Parameters: 2
	Flags: Linked
*/
function function_ecd21bd2(entity, asmstatename)
{
	if(!isdefined(entity.var_80dcda45))
	{
		return 4;
	}
	if(entity asmgetstatus() == "asm_status_complete" && isdefined(asmstatename))
	{
		animationstatenetworkutility::requeststate(entity, asmstatename);
	}
	entity.var_80dcda45.time = entity.var_80dcda45.time + 1;
	entity.var_80dcda45.nextpos = (entity.var_80dcda45.startpos + (entity.var_80dcda45.vel * entity.var_80dcda45.time)) + ((0.5 * (0, 0, -1)) * 4.5) * sqr(entity.var_80dcda45.time);
	var_f423e961 = entity.var_80dcda45.goal - entity.var_80dcda45.nextpos;
	if(vectordot((var_f423e961[0], var_f423e961[1], 0), (entity.var_80dcda45.to_goal[0], entity.var_80dcda45.to_goal[1], 0)) < 0)
	{
		/#
			recordsphere(entity.var_80dcda45.goal, 10, (0, 1, 0), "", entity);
			recordline(entity.origin, entity.var_80dcda45.goal, (0, 1, 0), "", entity);
		#/
		entity.var_80dcda45.endpos = entity.var_80dcda45.goal;
		return 4;
	}
	traceresult = physicstraceex(entity.origin, entity.var_80dcda45.nextpos, entity getmins(), entity getmaxs(), entity);
	if(traceresult[#"fraction"] != 1)
	{
		/#
			recordsphere(traceresult[#"position"], 10, (0, 1, 0), "", entity);
			recordline(entity.origin, traceresult[#"position"], (0, 1, 0), "", entity);
		#/
		entity.var_80dcda45.endpos = traceresult[#"position"];
		return 4;
	}
	return 5;
}

/*
	Name: function_d40c590a
	Namespace: mechzbehavior
	Checksum: 0x4987AF55
	Offset: 0x4500
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d40c590a(entity)
{
	entity.blindaim = 1;
	return true;
}

/*
	Name: function_f5ffcbb4
	Namespace: mechzbehavior
	Checksum: 0xBF2418FF
	Offset: 0x4528
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f5ffcbb4(entity)
{
	entity.blindaim = 0;
	return true;
}

/*
	Name: function_61dd507d
	Namespace: mechzbehavior
	Checksum: 0x484D6EB
	Offset: 0x4550
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_61dd507d(entity)
{
	entity.burstgrenadesfired++;
	if(entity.burstgrenadesfired >= 1)
	{
		entity.nextgrenadetime = gettime() + 6000;
	}
	entity.blindaim = 1;
	return true;
}

/*
	Name: function_e8c59ca8
	Namespace: mechzbehavior
	Checksum: 0xC60377CB
	Offset: 0x45A8
	Size: 0x50
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e8c59ca8(entity)
{
	entity.blindaim = 0;
	entity clearpath();
	entity setgoal(entity.origin);
	return true;
}

/*
	Name: function_fc05dfd3
	Namespace: mechzbehavior
	Checksum: 0x4E3F296C
	Offset: 0x4600
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fc05dfd3(entity)
{
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
}

/*
	Name: function_1a37c206
	Namespace: mechzbehavior
	Checksum: 0x62C1F4CB
	Offset: 0x4640
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1a37c206(entity)
{
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
}

/*
	Name: mechzshootflame
	Namespace: mechzbehavior
	Checksum: 0x9C0F4931
	Offset: 0x4680
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzshootflame(entity)
{
	entity thread mechzdelayflame();
}

/*
	Name: mechzdelayflame
	Namespace: mechzbehavior
	Checksum: 0xD3E83FEF
	Offset: 0x46B0
	Size: 0x8A
	Parameters: 0
	Flags: Linked, Private
*/
function private mechzdelayflame()
{
	self endon(#"death");
	self notify(#"mechzdelayflame");
	self endon(#"mechzdelayflame");
	wait(0.3);
	self clientfield::set("mechz_ft", 1);
	self.isshootingflame = 1;
	self.stopshootingflametime = gettime() + 2500;
}

/*
	Name: mechzupdateflame
	Namespace: mechzbehavior
	Checksum: 0x4201D2E2
	Offset: 0x4748
	Size: 0x3E0
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzupdateflame(entity)
{
	if(isdefined(level.mechz_flamethrower_player_callback))
	{
		[[level.mechz_flamethrower_player_callback]](entity);
	}
	else
	{
		players = getplayers();
		foreach(player in players)
		{
			var_86d02e70 = 0;
			if(player isinvehicle())
			{
				vehicle = player getvehicleoccupied();
				var_86d02e70 = is_true(vehicle.var_9a6644f2);
			}
			if(!is_true(player.is_burning) && !is_true(var_86d02e70))
			{
				if(player istouching(entity.flametrigger))
				{
					if(isdefined(entity.mechzflamedamage))
					{
						player thread [[entity.mechzflamedamage]]();
						continue;
					}
					player thread playerflamedamage(entity);
				}
			}
		}
		if(!isdefined(entity.var_15978c43))
		{
			entity.var_15978c43 = [];
		}
		if(!isdefined(entity.var_22dae8df))
		{
			entity.var_22dae8df = -1;
		}
		if(entity.var_22dae8df < gettime())
		{
			entity.var_22dae8df = gettime() + 500;
			entity.var_15978c43 = getentitiesinradius(entity.origin, 300, 12);
		}
		foreach(vehicle in entity.var_15978c43)
		{
			if(vehicle istouching(entity.flametrigger))
			{
				vehicle thread function_fd99ea48(entity);
				if(!is_true(vehicle.var_9a6644f2))
				{
					occupants = vehicle getvehoccupants();
					foreach(occupant in occupants)
					{
						if(!is_true(occupant.burning))
						{
							occupant thread playerflamedamage(entity);
						}
					}
				}
			}
		}
	}
	if(isdefined(level.mechz_flamethrower_ai_callback))
	{
		[[level.mechz_flamethrower_ai_callback]](entity);
	}
}

/*
	Name: playerflamedamage
	Namespace: mechzbehavior
	Checksum: 0x4A40AC86
	Offset: 0x4B30
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function playerflamedamage(mechz)
{
	self endon(#"death");
	self endon(#"disconnect");
	if(!is_true(self.is_burning) && zombie_utility::is_player_valid(self, 1))
	{
		self.is_burning = 1;
		if(!self hasperk("specialty_armorvest"))
		{
			self burnplayer::setplayerburning(1.5, 0.5, 30, mechz, undefined);
		}
		else
		{
			self burnplayer::setplayerburning(1.5, 0.5, 20, mechz, undefined);
		}
		wait(1.5);
		self.is_burning = 0;
	}
}

/*
	Name: function_fd99ea48
	Namespace: mechzbehavior
	Checksum: 0xA553D483
	Offset: 0x4C48
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_fd99ea48(mechz)
{
	self endon(#"death");
	self endon(#"disconnect");
	var_4004985c = 0.25;
	if(!is_true(self.is_burning))
	{
		self.is_burning = 1;
		percentage = 0;
		while(percentage <= 1)
		{
			self dodamage(250 * var_4004985c, self.origin, mechz, undefined, undefined, "MOD_BURNED", 0);
			wait(1.5 * var_4004985c);
			percentage = percentage + var_4004985c;
		}
		self.is_burning = 0;
	}
}

/*
	Name: mechzstopflame
	Namespace: mechzbehavior
	Checksum: 0x6AFFD054
	Offset: 0x4D38
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function mechzstopflame(entity)
{
	self notify(#"mechzdelayflame");
	entity clientfield::set("mechz_ft", 0);
	entity.isshootingflame = 0;
	var_82d51e42 = randomintrange(2500, 3500);
	entity.nextflametime = gettime() + var_82d51e42;
	entity.stopshootingflametime = undefined;
}

/*
	Name: mechzgoberserk
	Namespace: mechzbehavior
	Checksum: 0x6BBA8A76
	Offset: 0x4DD0
	Size: 0x8C
	Parameters: 0
	Flags: Linked
*/
function mechzgoberserk()
{
	entity = self;
	g_time = gettime();
	entity.berserkendtime = g_time + 10000;
	if(entity.berserk !== 1)
	{
		entity.berserk = 1;
		entity thread mechzendberserk();
		entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	}
}

/*
	Name: mechzplayedberserkintro
	Namespace: mechzbehavior
	Checksum: 0x4D682AB9
	Offset: 0x4E68
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzplayedberserkintro(entity)
{
	entity.hasturnedberserk = 1;
}

/*
	Name: mechzendberserk
	Namespace: mechzbehavior
	Checksum: 0xF5DE802B
	Offset: 0x4E90
	Size: 0xB0
	Parameters: 0
	Flags: Linked, Private
*/
function private mechzendberserk()
{
	self endon(#"death");
	self endon(#"disconnect");
	while(self.berserk === 1)
	{
		if(gettime() >= self.berserkendtime)
		{
			self.berserk = 0;
			self.hasturnedberserk = 0;
			self asmsetanimationrate(1);
			self setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
		}
		wait(0.25);
	}
}

/*
	Name: mechzattackstart
	Namespace: mechzbehavior
	Checksum: 0xF4A2E88B
	Offset: 0x4F48
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzattackstart(entity)
{
	entity clientfield::set("mechz_face", 1);
}

/*
	Name: mechzdeathstart
	Namespace: mechzbehavior
	Checksum: 0x1CAE9AD4
	Offset: 0x4F80
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzdeathstart(entity)
{
	entity clientfield::set("mechz_face", 2);
}

/*
	Name: mechzidlestart
	Namespace: mechzbehavior
	Checksum: 0xBEA7744F
	Offset: 0x4FB8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzidlestart(entity)
{
	entity clientfield::set("mechz_face", 3);
}

/*
	Name: mechzpainstart
	Namespace: mechzbehavior
	Checksum: 0x6538556A
	Offset: 0x4FF0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzpainstart(entity)
{
	entity clientfield::set("mechz_face", 4);
}

/*
	Name: mechzpainterminate
	Namespace: mechzbehavior
	Checksum: 0xF46A58AA
	Offset: 0x5028
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private mechzpainterminate(entity)
{
	entity.partdestroyed = 0;
	entity.show_pain_from_explosive_dmg = undefined;
}

/*
	Name: function_2726bc43
	Namespace: mechzbehavior
	Checksum: 0xC2CD3F6
	Offset: 0x5058
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2726bc43(entity)
{
	entity.var_97601164 = 0;
	mechzpainterminate(entity);
}

/*
	Name: function_16c82231
	Namespace: mechzbehavior
	Checksum: 0xD5A14EAB
	Offset: 0x5090
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_16c82231(entity)
{
	entity.isjumping = 1;
	entity callback::callback(#"hash_1c5ac76933317a1d");
}

/*
	Name: function_4af53b9a
	Namespace: mechzbehavior
	Checksum: 0x4EAD903C
	Offset: 0x50D8
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4af53b9a(entity)
{
	entity.isjumping = undefined;
	entity.jump_cooldown = (gettime() + 3000) + randomfloat(2000);
	entity callback::callback(#"hash_6ce1d15fa3e62552");
	entity setgoal(entity.origin);
}

/*
	Name: function_e2c3704e
	Namespace: mechzbehavior
	Checksum: 0x2755E96A
	Offset: 0x5160
	Size: 0xDC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_e2c3704e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("zonly_physics", 1);
	mocompduration pathmode("dont move");
	mocompduration.blockingpain = 1;
	mocompduration orientmode("face angle", vectortoangles((mocompduration.var_80dcda45.vel[0], mocompduration.var_80dcda45.vel[1], 0))[1]);
}

/*
	Name: function_9ba82c0a
	Namespace: mechzbehavior
	Checksum: 0x555050F3
	Offset: 0x5248
	Size: 0x5C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_9ba82c0a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration forceteleport(mocompduration.var_80dcda45.nextpos, mocompduration.angles, 0);
}

/*
	Name: function_62826a8e
	Namespace: mechzbehavior
	Checksum: 0xDCE943B9
	Offset: 0x52B0
	Size: 0xB6
	Parameters: 5
	Flags: Linked, Private
*/
function private function_62826a8e(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(isdefined(mocompduration.var_80dcda45.endpos))
	{
		mocompduration forceteleport(mocompduration.var_80dcda45.endpos, mocompduration.angles, 0);
	}
	mocompduration pathmode("move allowed", 1);
	mocompduration.blockingpain = 0;
	mocompduration.var_80dcda45 = undefined;
	mocompduration.jumpgoal = undefined;
}

/*
	Name: function_1cc76960
	Namespace: mechzbehavior
	Checksum: 0x60B55050
	Offset: 0x5370
	Size: 0xDC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_1cc76960(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration pathmode("dont move");
	mocompduration.blockingpain = 1;
	mocompduration animmode("zonly_physics", 1);
	mocompduration orientmode("face angle", vectortoangles((mocompduration.var_80dcda45.vel[0], mocompduration.var_80dcda45.vel[1], 0))[1]);
}

/*
	Name: function_65225d1f
	Namespace: mechzbehavior
	Checksum: 0x9FA7B919
	Offset: 0x5458
	Size: 0x56
	Parameters: 5
	Flags: Linked, Private
*/
function private function_65225d1f(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration pathmode("move allowed");
	mocompduration.blockingpain = 0;
}

#namespace mechzserverutils;

/*
	Name: mechzspawnsetup
	Namespace: mechzserverutils
	Checksum: 0xF5C04B4E
	Offset: 0x54B8
	Size: 0x2C4
	Parameters: 0
	Flags: Linked, Private
*/
function private mechzspawnsetup()
{
	self disableaimassist();
	self.disableammodrop = 1;
	self.no_gib = 1;
	self.ignore_nuke = 1;
	self.ignore_enemy_count = 1;
	self.ignore_round_robbin_death = 1;
	self.zombie_move_speed = "run";
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
	self.var_cccb0ad2 = 1;
	self.grenadecount = 3;
	self.nextflametime = gettime();
	self.stumble_stun_cooldown_time = gettime();
	self.jump_cooldown = 0;
	self.var_e9c62827 = 1;
	self weaponobjects::function_9d7ae85f("eq_mechz_firebomb", &function_d0651b24, 1);
	/#
		self.debug_traversal_ast = "";
	#/
	self.flametrigger = spawn("trigger_box", self.origin, 0, 300, 50, 25);
	self thread deleteondeath(self.flametrigger);
	self.flametrigger enablelinkto();
	self.flametrigger.origin = self gettagorigin("tag_flamethrower_fx");
	self.flametrigger.angles = self gettagangles("tag_flamethrower_fx");
	self.flametrigger linkto(self, "tag_flamethrower_fx");
	self thread weaponobjects::watchweaponobjectspawn();
	self.pers = [];
	self.pers[#"team"] = self.team;
	self destructserverutils::togglespawngibs(self, 1);
	self.var_28621cf4 = "j_neck";
	self.var_e5365d8a = vectorscale((0, 0, 1), 6);
	aiutility::addaioverridedamagecallback(self, &mechzdamagecallback);
	self thread function_fe2419fc();
	level thread zm_spawner::zombie_death_event(self);
}

/*
	Name: function_5d873f78
	Namespace: mechzserverutils
	Checksum: 0x5BA84AB0
	Offset: 0x5788
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function function_5d873f78()
{
	self mechzaddattachments();
	namespace_81245006::initweakpoints(self);
	self.completed_emerging_into_playable_area = 1;
	self.canbetargetedbyturnedzombies = 1;
}

/*
	Name: function_d0651b24
	Namespace: mechzserverutils
	Checksum: 0x4876EA5
	Offset: 0x57E0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_d0651b24(watcher)
{
	namespace_ad7d66e9::function_5545649e(watcher);
}

/*
	Name: deleteondeath
	Namespace: mechzserverutils
	Checksum: 0xB0AB7598
	Offset: 0x5810
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function deleteondeath(object)
{
	self waittill(#"death");
	if(isdefined(object))
	{
		object delete();
	}
}

/*
	Name: mechzflamewatcher
	Namespace: mechzserverutils
	Checksum: 0x6CB89F43
	Offset: 0x5858
	Size: 0x76
	Parameters: 0
	Flags: Private
*/
function private mechzflamewatcher()
{
	self endon(#"death");
	while(true)
	{
		if(isdefined(self.favoriteenemy))
		{
			if(self.flametrigger istouching(self.favoriteenemy))
			{
				/#
					printtoprightln("");
				#/
			}
		}
		waitframe(1);
	}
}

/*
	Name: mechzaddattachments
	Namespace: mechzserverutils
	Checksum: 0xEC59D51A
	Offset: 0x58D8
	Size: 0x42
	Parameters: 0
	Flags: Linked, Private
*/
function private mechzaddattachments()
{
	self.var_7c4488fd = 1;
	self.gun_attached = 1;
	self.has_faceplate = 1;
	self.has_powercap = 1;
	self.powercap_covered = 1;
}

/*
	Name: mechzdamagecallback
	Namespace: mechzserverutils
	Checksum: 0xDF99C414
	Offset: 0x5928
	Size: 0x76A
	Parameters: 13
	Flags: Linked
*/
function mechzdamagecallback(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(damage === self || !util::function_fbce7263(damage.team, self.team))
	{
		return 0;
	}
	if(isdefined(self.b_flyin_done) && !is_true(self.b_flyin_done))
	{
		return 0;
	}
	if(self flag::get("kill_hvt_teleporting"))
	{
		weakpoint = namespace_81245006::function_3131f5dd(self, hitloc, 1);
		self.var_6936b30b = {#hash_ebcff177:4, #weakpoint:weakpoint};
		return 0;
	}
	if(is_true(self.stumble))
	{
		if(self.stumble_stun_cooldown_time < gettime() && !is_true(self.berserk))
		{
			self [[level.mechz_should_stun_override]](attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex);
		}
	}
	dflags = mechzweapondamagemodifier(dflags, var_fd90b0bb);
	if(isdefined(level.mechz_damage_override))
	{
		dflags = [[level.mechz_damage_override]](damage, dflags);
	}
	if(!isdefined(self.next_pain_time) || gettime() >= self.next_pain_time)
	{
		self thread mechz_play_pain_audio();
		self.next_pain_time = (gettime() + 250) + randomint(500);
	}
	if(isdefined(self.damage_scoring_function))
	{
		self [[self.damage_scoring_function]](attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex);
	}
	/#
		if(is_true(level.var_85a39c96))
		{
			return self.health + 1;
		}
	#/
	damage_type = 1;
	if(namespace_81245006::hasarmor(self) && (weapon === "MOD_PROJECTILE_SPLASH" || weapon === "MOD_GRENADE_SPLASH" || weapon == "MOD_EXPLOSIVE"))
	{
		var_3cddb028 = 0.5 * dflags;
		var_31e96b81 = int(var_3cddb028);
		foreach(weakpoint in self.var_5ace757d)
		{
			if(weakpoint.type === #"armor" && weakpoint.currstate === 1)
			{
				function_669e8e27(self, weakpoint, damage, dflags);
			}
		}
	}
	weakpoint = namespace_81245006::function_3131f5dd(self, hitloc, 1);
	if(!isdefined(weakpoint))
	{
		weakpoint = namespace_81245006::function_73ab4754(self, point, 1);
	}
	if(weakpoint.var_3765e777 === 1 && aiutility::function_69c2d36f(weapon))
	{
		damage show_hit_marker();
		dflags = int(dflags * 1);
		/#
			iprintlnbold((("" + dflags) + "") + (self.health - dflags));
		#/
		damage_type = 2;
	}
	if(hitloc !== "none")
	{
		/#
			iprintlnbold((("" + dflags) + "") + (self.health - dflags));
		#/
	}
	else
	{
		if(weapon == "MOD_PROJECTILE" || weapon == "MOD_GRENADE")
		{
			dflags = int(dflags * 2);
			/#
				iprintlnbold((("" + dflags) + "") + (self.health - dflags));
			#/
		}
		else
		{
			if(weapon == "MOD_PROJECTILE_SPLASH" || weapon == "MOD_BURNED" || weapon == "MOD_GRENADE_SPLASH" || weapon == "MOD_EXPLOSIVE")
			{
				dflags = int(dflags * 3);
				/#
					iprintlnbold((("" + dflags) + "") + (self.health - dflags));
				#/
			}
			else if(weapon == "MOD_CRUSH")
			{
				/#
					iprintlnbold((("" + dflags) + "") + (self.health - dflags));
				#/
			}
		}
	}
	if(!isdefined(weakpoint))
	{
		weakpoint = namespace_81245006::function_37e3f011(self, boneindex, 1);
	}
	if(isdefined(weakpoint))
	{
		function_669e8e27(self, weakpoint, damage, dflags);
	}
	if(!aiutility::function_493e5914(weapon))
	{
		point = aiutility::function_cb552839(self);
	}
	self.var_6936b30b = {#hash_ebcff177:damage_type, #weakpoint:weakpoint};
	return dflags;
}

/*
	Name: function_669e8e27
	Namespace: mechzserverutils
	Checksum: 0xB2BE4AFD
	Offset: 0x60A0
	Size: 0x234
	Parameters: 4
	Flags: Linked, Private
*/
function private function_669e8e27(entity, weakpoint, attacker, damage)
{
	if(weakpoint.type === #"weakpoint")
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"hit_weak_point_zm", #attacker:attacker});
	}
	else if(weakpoint.type === #"armor")
	{
		namespace_81245006::function_ef87b7e8(weakpoint, damage);
		if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(entity, weakpoint.var_f371ebb0);
			scoreevent = "destroyed_armor_zm";
			if(weakpoint.var_f371ebb0 == "helmet")
			{
				entity function_40c68562();
			}
			if(weakpoint.var_f371ebb0 == "jet_pack")
			{
				entity function_4c489c31(attacker);
				scoreevent = "mechz_jetpack_destroyed_zm";
			}
			if(weakpoint.var_f371ebb0 == "power_core_cover")
			{
				entity function_3ebf4258();
			}
			if(weakpoint.var_f371ebb0 == "left_arm_armor")
			{
				scoreevent = "mechz_power_core_destroyed_zm";
				entity function_39d47bef(attacker);
			}
			level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:scoreevent, #attacker:attacker});
		}
	}
}

/*
	Name: mechzweapondamagemodifier
	Namespace: mechzserverutils
	Checksum: 0x740727F6
	Offset: 0x62E0
	Size: 0x70
	Parameters: 2
	Flags: Linked, Private
*/
function private mechzweapondamagemodifier(damage, weapon)
{
	if(isdefined(weapon) && isdefined(weapon.name))
	{
		if(weapon.name == #"hash_566413d54185cd2a")
		{
			return 0;
		}
		if(weapon.name == #"hash_23dd6039fe2f36c6")
		{
			return 0;
		}
	}
	return damage;
}

/*
	Name: mechz_play_pain_audio
	Namespace: mechzserverutils
	Checksum: 0x76E7FBFF
	Offset: 0x6358
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function mechz_play_pain_audio()
{
	self playsound("zmb_ai_mechz_destruction");
}

/*
	Name: show_hit_marker
	Namespace: mechzserverutils
	Checksum: 0xD337E3BD
	Offset: 0x6388
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function show_hit_marker()
{
	self util::show_hit_marker();
}

/*
	Name: hide_part
	Namespace: mechzserverutils
	Checksum: 0x28A86A8A
	Offset: 0x63B0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function hide_part(strtag)
{
	if(self haspart(strtag))
	{
		self hidepart(strtag);
	}
}

/*
	Name: function_40c68562
	Namespace: mechzserverutils
	Checksum: 0x386334B5
	Offset: 0x63F8
	Size: 0xA0
	Parameters: 0
	Flags: Linked
*/
function function_40c68562()
{
	self clientfield::set("mechz_faceplate_detached", 1);
	self.has_faceplate = 0;
	self mechz_turn_off_headlamp();
	self.partdestroyed = 1;
	self setblackboardattribute("_mechz_part", "mechz_faceplate");
	self mechzbehavior::mechzgoberserk();
	level notify(#"mechz_faceplate_detached");
}

/*
	Name: function_3ebf4258
	Namespace: mechzserverutils
	Checksum: 0xD61C4CCA
	Offset: 0x64A0
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_3ebf4258()
{
	self clientfield::set("mechz_powercap_detached", 1);
	self.powercap_covered = 0;
	self.partdestroyed = 1;
	self setblackboardattribute("_mechz_part", "mechz_powercore");
}

/*
	Name: function_39d47bef
	Namespace: mechzserverutils
	Checksum: 0xF5930359
	Offset: 0x6508
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_39d47bef(attacker)
{
	self clientfield::set("mechz_claw_detached", 1);
	self.has_powercap = 0;
	self.gun_attached = 0;
	self.partdestroyed = 1;
	self setblackboardattribute("_mechz_part", "mechz_gun");
	level notify(#"mechz_gun_detached");
	var_4f88297a = self.maxhealth * 0.1;
	self dodamage(var_4f88297a, self.origin, attacker, attacker);
}

/*
	Name: function_4c489c31
	Namespace: mechzserverutils
	Checksum: 0x34D40AEF
	Offset: 0x65E0
	Size: 0xD4
	Parameters: 1
	Flags: Linked
*/
function function_4c489c31(attacker)
{
	self hide_part("j_jetpack");
	self clientfield::set("mechz_jetpack_explosion", 1);
	self.var_7c4488fd = 0;
	self.var_97601164 = 1;
	self.partdestroyed = 1;
	if(isplayer(attacker))
	{
		attacker.var_6de2953f = gettime();
	}
	self radiusdamage(self.origin + vectorscale((0, 0, 1), 36), 128, 150, 95, attacker, "MOD_EXPLOSIVE");
}

/*
	Name: mechzcheckinarc
	Namespace: mechzserverutils
	Checksum: 0xE48A3BFA
	Offset: 0x66C0
	Size: 0x232
	Parameters: 3
	Flags: Linked
*/
function mechzcheckinarc(right_offset, aim_tag, var_40f25562)
{
	if(!isdefined(var_40f25562))
	{
		var_40f25562 = 0.5;
	}
	origin = self.origin;
	angles = self.angles;
	if(isdefined(aim_tag))
	{
		origin = self gettagorigin(aim_tag);
		angles = self gettagangles(aim_tag);
	}
	if(isdefined(right_offset))
	{
		right_angle = anglestoright(angles);
		origin = origin + (right_angle * right_offset);
	}
	facing_vec = anglestoforward(angles);
	enemy = (is_true(self.var_1fa24724) ? self.enemy : self.favoriteenemy);
	if(!isdefined(enemy))
	{
		return false;
	}
	enemy_vec = enemy.origin - origin;
	enemy_yaw_vec = (enemy_vec[0], enemy_vec[1], 0);
	facing_yaw_vec = (facing_vec[0], facing_vec[1], 0);
	enemy_yaw_vec = vectornormalize(enemy_yaw_vec);
	facing_yaw_vec = vectornormalize(facing_yaw_vec);
	enemy_dot = vectordot(facing_yaw_vec, enemy_yaw_vec);
	if(enemy_dot < var_40f25562)
	{
		return false;
	}
	enemy_angles = vectortoangles(enemy_vec);
	if(abs(angleclamp180(enemy_angles[0])) > 60)
	{
		return false;
	}
	return true;
}

/*
	Name: mechz_turn_off_headlamp
	Namespace: mechzserverutils
	Checksum: 0x3323F39E
	Offset: 0x6900
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function mechz_turn_off_headlamp(headlamp_broken)
{
	if(headlamp_broken !== 1)
	{
		self clientfield::set("mechz_headlamp_off", 1);
	}
	else
	{
		self clientfield::set("mechz_headlamp_off", 2);
	}
}

/*
	Name: function_fe2419fc
	Namespace: mechzserverutils
	Checksum: 0x97450E08
	Offset: 0x6970
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_fe2419fc()
{
	self.var_b467f3a1 = &function_53f176ae;
	self thread function_fb451f53();
}

/*
	Name: function_53f176ae
	Namespace: mechzserverutils
	Checksum: 0xB8238F6C
	Offset: 0x69A8
	Size: 0x26C
	Parameters: 1
	Flags: Linked
*/
function function_53f176ae(eventstruct)
{
	if(!is_true(level.var_2356dff1))
	{
		return;
	}
	notify_string = eventstruct.action;
	str_alias = notify_string;
	b_override = 0;
	n_priority = 1;
	var_c8109157 = 0;
	switch(notify_string)
	{
		case "arrive":
		case "death":
		{
			b_override = 1;
			n_priority = 4;
			break;
		}
		case "pain":
		case "land":
		case "weapon_fire":
		{
			b_override = 1;
			n_priority = 3;
			break;
		}
		case "summon":
		case "hash_1b1aba0fbbb615c5":
		case "hash_3d74dcddcb044ab3":
		case "hash_660c9ae8799c2768":
		case "hash_6ad5b0562f654076":
		{
			b_override = 1;
			n_priority = 3;
			var_c8109157 = 1;
			break;
		}
		case "alerted":
		case "hash_37f66b10bf727fdf":
		case "hash_42df88229e5571c4":
		case "jump":
		case "hash_7ab80d642b09800b":
		{
			b_override = 1;
			n_priority = 2;
			var_c8109157 = 1;
			break;
		}
		case "ambient":
		case "hash_4320680add0fb1ee":
		case "hash_7609057ae05fd29a":
		{
			n_priority = 1;
			break;
		}
		case "attack_melee":
		{
			return;
			break;
		}
		default:
		{
			n_priority = 2;
			break;
		}
	}
	level thread zm_audio::zmbaivox_playvox(self, str_alias, b_override, n_priority, var_c8109157);
}

/*
	Name: function_fb451f53
	Namespace: mechzserverutils
	Checksum: 0x3CFD1D7D
	Offset: 0x6C20
	Size: 0x168
	Parameters: 0
	Flags: Linked
*/
function function_fb451f53()
{
	self endon(#"death");
	str_notify = "ambient";
	while(true)
	{
		min_wait = 2;
		max_wait = 5;
		if(is_true(self.berserk) || is_true(self.var_e8f3d773))
		{
			str_notify = "ambient_enraged";
		}
		else
		{
			if(isdefined(self.zombie_move_speed) && self.zombie_move_speed === "run")
			{
				str_notify = "ambient_enraged";
			}
			else
			{
				if(isdefined(self.awarenesslevelcurrent) && self.awarenesslevelcurrent === "combat")
				{
					str_notify = "ambient_alert";
				}
				else
				{
					str_notify = "ambient";
				}
			}
		}
		function_6eac4ca1(self, str_notify);
		self notify(#"bhtn_action_notify", {#action:str_notify});
		wait(randomfloatrange(min_wait, max_wait));
	}
}

