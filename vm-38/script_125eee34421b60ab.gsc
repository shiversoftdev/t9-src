#using scripts\weapons\weaponobjects.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\ai\archetype_mocomps_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie.gsc;
#using script_35598499769dbb3d;
#using script_71dfbfdfba4489a0;
#using script_41fe08c37d53a635;
#using script_2c5daa95f8fec03c;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_3819e7a1427df6d2;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_caf007e2a98afa2;
#using scripts\core_common\visionset_mgr_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace raz;

/*
	Name: function_46759466
	Namespace: raz
	Checksum: 0x8584D469
	Offset: 0xB50
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_46759466()
{
	level notify(-1036210333);
}

#namespace razbehavior;

/*
	Name: init
	Namespace: razbehavior
	Checksum: 0x778F84EE
	Offset: 0xB70
	Size: 0x164
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	initrazbehaviorsandasm();
	spawner::add_archetype_spawn_function(#"raz", &archetyperazblackboardinit);
	spawner::add_archetype_spawn_function(#"raz", &razserverutils::razspawnsetup);
	spawner::function_89a2cd87(#"raz", &razserverutils::function_ac64daa7);
	clientfield::register("scriptmover", "raz_detonate_ground_torpedo", 1, 1, "int");
	clientfield::register("scriptmover", "raz_torpedo_play_fx_on_self", 1, 1, "int");
	clientfield::register("scriptmover", "raz_torpedo_play_trail", 1, 1, "counter");
	clientfield::register("actor", "raz_gun_weakpoint_hit", 1, 1, "counter");
}

/*
	Name: initrazbehaviorsandasm
	Namespace: razbehavior
	Checksum: 0x11DA0930
	Offset: 0xCE0
	Size: 0x894
	Parameters: 0
	Flags: Linked, Private
*/
function private initrazbehaviorsandasm()
{
	/#
		assert(isscriptfunctionptr(&razsprintservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razSprintService", &razsprintservice);
	/#
		assert(isscriptfunctionptr(&razshouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldMelee", &razshouldmelee);
	/#
		assert(isscriptfunctionptr(&razshouldshowpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldShowPain", &razshouldshowpain);
	/#
		assert(isscriptfunctionptr(&razshouldshowspecialpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldShowSpecialPain", &razshouldshowspecialpain);
	/#
		assert(isscriptfunctionptr(&razshouldshowshieldpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldShowShieldPain", &razshouldshowshieldpain);
	/#
		assert(isscriptfunctionptr(&razshouldshootgroundtorpedo));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldShootGroundTorpedo", &razshouldshootgroundtorpedo);
	/#
		assert(isscriptfunctionptr(&razshouldgoberserk));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldGoBerserk", &razshouldgoberserk);
	/#
		assert(isscriptfunctionptr(&razshouldtraversewindow));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldTraverseWindow", &razshouldtraversewindow);
	/#
		assert(isscriptfunctionptr(&function_a812a54));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razGroundTorpedoWasInterrupted", &function_a812a54);
	/#
		assert(isscriptfunctionptr(&function_7e5f6277));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldCutOffArm", &function_7e5f6277);
	/#
		assert(isscriptfunctionptr(&function_ba199276));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razShouldMeleeRun", &function_ba199276);
	/#
		assert(isscriptfunctionptr(&razstartmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razStartMelee", &razstartmelee);
	/#
		assert(isscriptfunctionptr(&razfinishmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razFinishMelee", &razfinishmelee);
	/#
		assert(isscriptfunctionptr(&razfinishgroundtorpedo));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razFinishGroundTorpedo", &razfinishgroundtorpedo);
	/#
		assert(isscriptfunctionptr(&razgoneberserk));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razGoneBerserk", &razgoneberserk);
	/#
		assert(isscriptfunctionptr(&raztookpain));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razTookPain", &raztookpain);
	/#
		assert(isscriptfunctionptr(&razstartdeath));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razStartDeath", &razstartdeath);
	/#
		assert(isscriptfunctionptr(&function_7e8a6d1f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("razGroundTorpedoStaggerStart", &function_7e8a6d1f);
	/#
		assert(!isdefined(&function_68ef46bd) || isscriptfunctionptr(&function_68ef46bd));
	#/
	/#
		assert(!isdefined(&function_46545247) || isscriptfunctionptr(&function_46545247));
	#/
	/#
		assert(!isdefined(&razfinishgroundtorpedo) || isscriptfunctionptr(&razfinishgroundtorpedo));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("razGroundTorpedoAction", &function_68ef46bd, &function_46545247, &razfinishgroundtorpedo);
	animationstatenetwork::registeranimationmocomp("mocomp_raz_shoot_torpedo", &function_20e100b4, &function_70204084, &function_bf9973c);
	animationstatenetwork::registernotetrackhandlerfunction("mangler_fire", &raznotetrackshootgroundtorpedo);
	animationstatenetwork::registernotetrackhandlerfunction("raz_mangler_gib", &function_c49e4c9);
}

/*
	Name: archetyperazblackboardinit
	Namespace: razbehavior
	Checksum: 0xF98DE575
	Offset: 0x1580
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private archetyperazblackboardinit()
{
	blackboard::createblackboardforentity(self);
	self.___archetypeonanimscriptedcallback = &archetyperazonanimscriptedcallback;
}

/*
	Name: archetyperazonanimscriptedcallback
	Namespace: razbehavior
	Checksum: 0xEB1F0E1A
	Offset: 0x15C0
	Size: 0xB4
	Parameters: 1
	Flags: Linked, Private
*/
function private archetyperazonanimscriptedcallback(entity)
{
	entity.__blackboard = undefined;
	entity archetyperazblackboardinit();
	if(is_true(entity.started_running))
	{
		entity.invoke_sprint_time = undefined;
		entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	}
	if(!is_true(entity.razhasgunattached))
	{
		entity setblackboardattribute("_gibbed_limbs", "right_arm");
	}
}

/*
	Name: bb_getshouldturn
	Namespace: razbehavior
	Checksum: 0xD0326AB6
	Offset: 0x1680
	Size: 0x2A
	Parameters: 0
	Flags: Private
*/
function private bb_getshouldturn()
{
	if(isdefined(self.should_turn) && self.should_turn)
	{
		return "should_turn";
	}
	return "should_not_turn";
}

/*
	Name: razsprintservice
	Namespace: razbehavior
	Checksum: 0x3FC12793
	Offset: 0x16B8
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private razsprintservice(entity)
{
	if(is_true(entity.started_running))
	{
		return false;
	}
	if(!isdefined(entity.invoke_sprint_time))
	{
		return false;
	}
	if(gettime() > entity.invoke_sprint_time)
	{
		entity.invoke_sprint_time = undefined;
		entity.started_running = 1;
		entity.berserk = 1;
		entity thread razsprintknockdownzombies();
		entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
		entity asmsetanimationrate(1);
	}
}

/*
	Name: razshouldmelee
	Namespace: razbehavior
	Checksum: 0x7935B4A9
	Offset: 0x1790
	Size: 0xD2
	Parameters: 1
	Flags: Linked
*/
function razshouldmelee(entity)
{
	if(entity.ignoreall)
	{
		return false;
	}
	if(is_true(entity.destroy_window_by_melee))
	{
		return true;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(distancesquared(entity.origin, entity.enemy.origin) > 5625)
	{
		return false;
	}
	yaw = abs(zombie_utility::getyawtoenemy());
	if(yaw > 45)
	{
		return false;
	}
	return true;
}

/*
	Name: razshouldshowpain
	Namespace: razbehavior
	Checksum: 0x40F60D58
	Offset: 0x1870
	Size: 0x80
	Parameters: 1
	Flags: Linked, Private
*/
function private razshouldshowpain(entity)
{
	if(is_true(entity.berserk) && !is_true(entity.razhasgoneberserk) || isdefined(entity.var_3059ea5f) || is_true(entity.var_6d2f7ac8))
	{
		return false;
	}
	return true;
}

/*
	Name: razshouldshowspecialpain
	Namespace: razbehavior
	Checksum: 0xD2F4A99A
	Offset: 0x18F8
	Size: 0xFA
	Parameters: 1
	Flags: Linked, Private
*/
function private razshouldshowspecialpain(entity)
{
	gib_location = entity getblackboardattribute("_gib_location");
	if(gib_location === "right_arm")
	{
		return true;
	}
	if(!razshouldshowpain(entity))
	{
		return false;
	}
	var_a8fd62d7 = gettime() - entity.var_5ed30918;
	if(var_a8fd62d7 > 100)
	{
		return false;
	}
	if(gib_location === "head" || gib_location === "arms" || gib_location === "right_leg" || gib_location === "left_leg" || gib_location === "left_arm")
	{
		return true;
	}
	return false;
}

/*
	Name: razshouldshowshieldpain
	Namespace: razbehavior
	Checksum: 0xA8190EB8
	Offset: 0x1A00
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private razshouldshowshieldpain(entity)
{
	if(isdefined(entity.damageweapon) && isdefined(entity.damageweapon.name))
	{
		return entity.damageweapon.name == "dragonshield";
	}
	return 0;
}

/*
	Name: razshouldgoberserk
	Namespace: razbehavior
	Checksum: 0xABD779AF
	Offset: 0x1A60
	Size: 0x52
	Parameters: 1
	Flags: Linked, Private
*/
function private razshouldgoberserk(entity)
{
	if(is_true(entity.berserk) && !is_true(entity.razhasgoneberserk))
	{
		return true;
	}
	return false;
}

/*
	Name: razshouldtraversewindow
	Namespace: razbehavior
	Checksum: 0x6CFB83D3
	Offset: 0x1AC0
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private razshouldtraversewindow(entity)
{
	return is_true(entity.jump_through_window);
}

/*
	Name: function_a812a54
	Namespace: razbehavior
	Checksum: 0x1DF1F042
	Offset: 0x1AF0
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_a812a54(entity)
{
	return is_true(entity.var_6d2f7ac8);
}

/*
	Name: function_7e5f6277
	Namespace: razbehavior
	Checksum: 0x1DD52B09
	Offset: 0x1B20
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7e5f6277(entity)
{
	return entity.razgunhealth <= 0;
}

/*
	Name: function_ba199276
	Namespace: razbehavior
	Checksum: 0xFEA384F4
	Offset: 0x1B48
	Size: 0x18A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba199276(entity)
{
	if(entity.ignoreall)
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy) || entity getblackboardattribute("_locomotion_speed") != "locomotion_speed_sprint")
	{
		return false;
	}
	var_ff38566a = lengthsquared(entity.favoriteenemy getvelocity());
	var_17c3916f = 7225;
	if(var_ff38566a < sqr(100))
	{
		var_17c3916f = 30625;
	}
	if(distancesquared(entity.origin, entity.favoriteenemy.origin) > var_17c3916f)
	{
		return false;
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(entity.favoriteenemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	return true;
}

/*
	Name: razgoneberserk
	Namespace: razbehavior
	Checksum: 0x6A65F287
	Offset: 0x1CE0
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private razgoneberserk(entity)
{
	entity.razhasgoneberserk = 1;
}

/*
	Name: raztookpain
	Namespace: razbehavior
	Checksum: 0x3059E640
	Offset: 0x1D08
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private raztookpain(entity)
{
	entity setblackboardattribute("_gib_location", "legs");
}

/*
	Name: razstartdeath
	Namespace: razbehavior
	Checksum: 0xA0D2E33F
	Offset: 0x1D48
	Size: 0x23E
	Parameters: 1
	Flags: Linked, Private
*/
function private razstartdeath(entity)
{
	entity playsoundontag("zmb_raz_death", "tag_eye");
	weakpoints = namespace_81245006::function_fab3ee3e(entity);
	if(!isdefined(weakpoints))
	{
		return;
	}
	foreach(weakpoint in weakpoints)
	{
		if(namespace_81245006::function_f29756fe(weakpoint) === 1 && isdefined(weakpoint.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(self, weakpoint.var_f371ebb0);
			switch(weakpoint.var_f371ebb0)
			{
				case "helmet":
				{
					self razserverutils::function_2eb802f5(undefined);
					break;
				}
				case "body_armor":
				{
					self razserverutils::function_50c2a59e(undefined);
					break;
				}
				case "left_arm_armor":
				{
					self razserverutils::function_597f31c9(undefined);
					break;
				}
				case "right_leg_armor":
				{
					self razserverutils::function_578362e9(undefined);
					break;
				}
				case "left_leg_armor":
				{
					self razserverutils::function_50f53d3b(undefined);
					break;
				}
				case "right_arm_armor":
				{
					self razserverutils::function_afcd63e1(undefined, undefined, undefined);
					break;
				}
				default:
				{
					break;
				}
			}
		}
	}
}

/*
	Name: function_7e8a6d1f
	Namespace: razbehavior
	Checksum: 0xC46CD6
	Offset: 0x1F90
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7e8a6d1f(entity)
{
	entity.var_6d2f7ac8 = undefined;
}

/*
	Name: razshouldshootgroundtorpedo
	Namespace: razbehavior
	Checksum: 0xCF487D85
	Offset: 0x1FB0
	Size: 0x19E
	Parameters: 1
	Flags: Linked, Private
*/
function private razshouldshootgroundtorpedo(entity)
{
	if(entity.ignoreall)
	{
		return false;
	}
	if(is_true(entity.destroy_window_by_torpedo))
	{
		return true;
	}
	target = get_target_ent(entity);
	if(!isdefined(target))
	{
		return false;
	}
	if(!is_true(entity.razhasgunattached))
	{
		return false;
	}
	time = gettime();
	if(time < entity.next_torpedo_time)
	{
		return false;
	}
	enemy_dist_sq = distancesquared(entity.origin, target.origin);
	if(!(enemy_dist_sq >= 22500 || is_true(entity.var_1fa24724) && enemy_dist_sq <= 2250000 && entity razcanseetorpedotarget(target)))
	{
		return false;
	}
	if(isdefined(entity.check_point_in_enabled_zone))
	{
		in_enabled_zone = [[entity.check_point_in_enabled_zone]](entity.origin);
		if(!in_enabled_zone)
		{
			return false;
		}
	}
	if(is_true(entity.var_e8f3d773))
	{
		return false;
	}
	return true;
}

/*
	Name: razcanseetorpedotarget
	Namespace: razbehavior
	Checksum: 0x7806E807
	Offset: 0x2158
	Size: 0x1A0
	Parameters: 1
	Flags: Linked, Private
*/
function private razcanseetorpedotarget(enemy)
{
	entity = self;
	origin_point = entity gettagorigin("tag_weapon_right");
	target_point = function_3848e282(enemy);
	forward_vect = anglestoforward(self.angles);
	vect_to_enemy = target_point - origin_point;
	if(vectordot(forward_vect, vect_to_enemy) <= 0 && !is_true(entity.var_1fa24724))
	{
		return false;
	}
	right_vect = anglestoright(self.angles);
	projected_distance = vectordot(vect_to_enemy, right_vect);
	if(abs(projected_distance) > 50 && !is_true(entity.var_1fa24724))
	{
		return false;
	}
	trace = bullettrace(origin_point, target_point, 0, enemy);
	if(trace[#"fraction"] === 1)
	{
		return true;
	}
	return false;
}

/*
	Name: razstartmelee
	Namespace: razbehavior
	Checksum: 0x9F62696B
	Offset: 0x2300
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private razstartmelee(entity)
{
}

/*
	Name: razfinishmelee
	Namespace: razbehavior
	Checksum: 0xC8FCED34
	Offset: 0x2318
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private razfinishmelee(entity)
{
	entity.destroy_window_by_melee = undefined;
}

/*
	Name: function_68ef46bd
	Namespace: razbehavior
	Checksum: 0xD34BDC81
	Offset: 0x2338
	Size: 0x30
	Parameters: 2
	Flags: Linked, Private
*/
function private function_68ef46bd(entity, asmstate)
{
	animationstatenetworkutility::requeststate(entity, asmstate);
	return 5;
}

/*
	Name: function_46545247
	Namespace: razbehavior
	Checksum: 0xAACC275F
	Offset: 0x2370
	Size: 0xBA
	Parameters: 2
	Flags: Linked, Private
*/
function private function_46545247(entity, asmstate)
{
	if(isdefined(asmstate.razgunhealth) && isdefined(asmstate.var_3059ea5f) && is_true(asmstate.var_3059ea5f.var_2b605d6f) && asmstate.razgunhealth <= asmstate.var_3059ea5f.var_f4c2aef8)
	{
		asmstate.var_6d2f7ac8 = 1;
		return 4;
	}
	if(asmstate asmgetstatus() == "asm_status_complete")
	{
		return 4;
	}
	return 5;
}

/*
	Name: razfinishgroundtorpedo
	Namespace: razbehavior
	Checksum: 0x3CBE4ACB
	Offset: 0x2438
	Size: 0x32
	Parameters: 2
	Flags: Linked, Private
*/
function private razfinishgroundtorpedo(entity, asmstate)
{
	asmstate.destroy_window_by_torpedo = undefined;
	asmstate.next_torpedo_time = gettime() + 3000;
	return 4;
}

/*
	Name: function_20e100b4
	Namespace: razbehavior
	Checksum: 0x48127B0
	Offset: 0x2478
	Size: 0x27E
	Parameters: 5
	Flags: Linked, Private
*/
function private function_20e100b4(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompanimflag notify(#"hash_6abeb88b076c8c04");
	if(is_true(mocompanimflag.var_1fa24724))
	{
		target = get_target_ent(mocompanimflag);
		mocompanimflag orientmode("face point", target.origin);
	}
	else
	{
		mocompanimflag orientmode("face current");
	}
	mocompanimflag animmode("zonly_physics");
	mocompanimflag.blockingpain = 1;
	health_multiplier = 1;
	n_player_count = getplayers().size;
	var_9385094f = n_player_count - 1;
	if(isdefined(self.var_b3c613a7) && isdefined(self.var_b3c613a7[var_9385094f]))
	{
		health_multiplier = self.var_b3c613a7[var_9385094f];
	}
	var_85c30cab = max(mocompanimflag.razgunhealth - (0.05 * mocompanimflag.maxhealth), 0);
	if(mocompanimflag.var_9fde8624 === #"hash_471ba598e7e8c460")
	{
		var_85c30cab = max(mocompanimflag.razgunhealth - (0.01 * mocompanimflag.maxhealth), 0);
	}
	mocompanimflag.var_3059ea5f = {#hash_eea3c0a6:getnotetracktimes(mocompduration, "raz_vulnerable_end")[0], #hash_a0a74f78:getnotetracktimes(mocompduration, "raz_vulnerable_start")[0], #hash_f4c2aef8:var_85c30cab, #hash_2b605d6f:0};
}

/*
	Name: function_70204084
	Namespace: razbehavior
	Checksum: 0xC65805C1
	Offset: 0x2700
	Size: 0xB2
	Parameters: 5
	Flags: Linked, Private
*/
function private function_70204084(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	animtime = mocompanimflag getanimtime(mocompduration);
	if(animtime >= mocompanimflag.var_3059ea5f.var_a0a74f78 && animtime < mocompanimflag.var_3059ea5f.var_eea3c0a6)
	{
		mocompanimflag.var_3059ea5f.var_2b605d6f = 1;
	}
	else
	{
		mocompanimflag.var_3059ea5f.var_2b605d6f = 0;
	}
	return 5;
}

/*
	Name: function_bf9973c
	Namespace: razbehavior
	Checksum: 0xD63483CD
	Offset: 0x27C0
	Size: 0x42
	Parameters: 5
	Flags: Linked, Private
*/
function private function_bf9973c(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.var_3059ea5f = undefined;
	mocompduration.blockingpain = 0;
}

/*
	Name: raznotetrackshootgroundtorpedo
	Namespace: razbehavior
	Checksum: 0xBB423E33
	Offset: 0x2810
	Size: 0xAE
	Parameters: 1
	Flags: Linked, Private
*/
function private raznotetrackshootgroundtorpedo(entity)
{
	target = get_target_ent(entity);
	if(!isdefined(target) && !is_true(entity.destroy_window_by_torpedo))
	{
		/#
			println("");
		#/
		return;
	}
	entity razshootgroundtorpedo(target, vectorscale((0, 0, 1), 48));
	entity.next_torpedo_time = gettime() + 3000;
}

/*
	Name: function_c49e4c9
	Namespace: razbehavior
	Checksum: 0xE85DABC3
	Offset: 0x28C8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c49e4c9(entity)
{
	razserverutils::function_30df6d2b(entity);
}

/*
	Name: get_target_ent
	Namespace: razbehavior
	Checksum: 0x343A50F6
	Offset: 0x28F8
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function get_target_ent(entity)
{
	if(isdefined(entity.attackable))
	{
		return entity.attackable;
	}
	return zm_ai_utility::function_825317c(entity);
}

/*
	Name: raztorpedolaunchdirection
	Namespace: razbehavior
	Checksum: 0xF45114DF
	Offset: 0x2940
	Size: 0x106
	Parameters: 4
	Flags: Linked, Private
*/
function private raztorpedolaunchdirection(forward_dir, torpedo_pos, torpedo_target_pos, max_angle)
{
	vec_to_enemy = torpedo_target_pos - torpedo_pos;
	vec_to_enemy_normal = vectornormalize(vec_to_enemy);
	angle_to_enemy = vectordot(forward_dir, vec_to_enemy_normal);
	if(angle_to_enemy >= max_angle)
	{
		return vec_to_enemy_normal;
	}
	plane_normal = vectorcross(forward_dir, vec_to_enemy_normal);
	perpendicular_normal = vectorcross(plane_normal, forward_dir);
	torpedo_dir = (forward_dir * cos(max_angle)) + (perpendicular_normal * sin(max_angle));
	return torpedo_dir;
}

/*
	Name: razshootgroundtorpedo
	Namespace: razbehavior
	Checksum: 0x2558D47A
	Offset: 0x2A50
	Size: 0x234
	Parameters: 2
	Flags: Linked, Private
*/
function private razshootgroundtorpedo(torpedo_target, torpedo_target_offset)
{
	torpedo_pos = self gettagorigin("tag_weapon_right");
	torpedo_target_pos = torpedo_target.origin + torpedo_target_offset;
	torpedo = spawn("script_model", torpedo_pos);
	torpedo setmodel("tag_origin");
	torpedo clientfield::set("raz_torpedo_play_fx_on_self", 1);
	torpedo.torpedo_trail_iterations = 0;
	torpedo.raz_torpedo_owner = self;
	if(!isdefined(level.var_9ded2ca6))
	{
		level.var_9ded2ca6 = [];
	}
	else if(!isarray(level.var_9ded2ca6))
	{
		level.var_9ded2ca6 = array(level.var_9ded2ca6);
	}
	level.var_9ded2ca6[level.var_9ded2ca6.size] = torpedo;
	vec_to_enemy = raztorpedolaunchdirection(anglestoforward(self.angles), torpedo_pos, torpedo_target_pos, 0.7);
	angles_to_enemy = vectortoangles(vec_to_enemy);
	torpedo.angles = angles_to_enemy;
	normal_vector = vectornormalize(vec_to_enemy);
	torpedo.torpedo_old_normal_vector = normal_vector;
	torpedo.knockdown_iterations = 0;
	torpedo thread function_8e224906(torpedo_target);
	torpedo thread raztorpedoknockdownzombies(torpedo_target);
	torpedo thread raztorpedodetonateifclosetotarget(torpedo_target, torpedo_target_offset);
}

/*
	Name: function_8e224906
	Namespace: razbehavior
	Checksum: 0x87ACC022
	Offset: 0x2C90
	Size: 0xFC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8e224906(torpedo_target)
{
	self endon(#"death", #"detonated");
	torpedo = self;
	iteration_move_distance = 70;
	max_trail_iterations = int(1500 / iteration_move_distance);
	while(isdefined(torpedo))
	{
		if(!isdefined(torpedo_target) || torpedo.torpedo_trail_iterations >= max_trail_iterations)
		{
			torpedo thread raztorpedodetonate(0);
		}
		else
		{
			torpedo raztorpedomovetotarget(torpedo_target);
			torpedo.torpedo_trail_iterations = torpedo.torpedo_trail_iterations + 1;
		}
		wait(0.1);
	}
}

/*
	Name: raztorpedodetonateifclosetotarget
	Namespace: razbehavior
	Checksum: 0x1687ED2D
	Offset: 0x2D98
	Size: 0xBE
	Parameters: 2
	Flags: Linked, Private
*/
function private raztorpedodetonateifclosetotarget(torpedo_target, torpedo_target_offset)
{
	self endon(#"death", #"detonated");
	torpedo = self;
	while(isdefined(torpedo) && isdefined(torpedo_target))
	{
		torpedo_target_pos = torpedo_target.origin + torpedo_target_offset;
		if(distancesquared(torpedo.origin, torpedo_target_pos) <= 2304)
		{
			torpedo thread raztorpedodetonate(0);
		}
		waitframe(1);
	}
}

/*
	Name: function_3848e282
	Namespace: razbehavior
	Checksum: 0x8AFB80CE
	Offset: 0x2E60
	Size: 0xE2
	Parameters: 1
	Flags: Linked
*/
function function_3848e282(var_14df4369)
{
	height_offset = vectorscale((0, 0, 1), 48);
	torpedo_target_point = var_14df4369.origin + height_offset;
	if(isplayer(var_14df4369))
	{
		if(var_14df4369 isinvehicle())
		{
			vehicle = var_14df4369 getvehicleoccupied();
			torpedo_target_point = (var_14df4369.origin[0], var_14df4369.origin[1], vehicle.origin[2]) + height_offset;
		}
		else
		{
			torpedo_target_point = var_14df4369 getplayercamerapos();
		}
	}
	return torpedo_target_point;
}

/*
	Name: raztorpedomovetotarget
	Namespace: razbehavior
	Checksum: 0xD80C798A
	Offset: 0x2F50
	Size: 0x404
	Parameters: 1
	Flags: Linked, Private
*/
function private raztorpedomovetotarget(torpedo_target)
{
	self endon(#"death");
	self endon(#"detonated");
	if(!isdefined(self.torpedo_max_yaw_cos))
	{
		torpedo_yaw_per_interval = 2.8;
		self.torpedo_max_yaw_cos = cos(torpedo_yaw_per_interval);
	}
	if(isdefined(self.torpedo_old_normal_vector))
	{
		torpedo_target_point = function_3848e282(torpedo_target);
		vector_to_target = torpedo_target_point - self.origin;
		normal_vector = vectornormalize(vector_to_target);
		flat_mapped_normal_vector = vectornormalize((normal_vector[0], normal_vector[1], 0));
		flat_mapped_old_normal_vector = vectornormalize((self.torpedo_old_normal_vector[0], self.torpedo_old_normal_vector[1], 0));
		dot = vectordot(flat_mapped_normal_vector, flat_mapped_old_normal_vector);
		if(dot >= 1)
		{
			dot = 1;
		}
		else if(dot <= -1)
		{
			dot = -1;
		}
		if(dot < self.torpedo_max_yaw_cos)
		{
			new_vector = normal_vector - self.torpedo_old_normal_vector;
			angle_between_vectors = acos(dot);
			if(!isdefined(angle_between_vectors))
			{
				angle_between_vectors = 180;
			}
			if(angle_between_vectors == 0)
			{
				angle_between_vectors = 0.0001;
			}
			max_angle_per_interval = 2.8;
			ratio = max_angle_per_interval / angle_between_vectors;
			if(ratio > 1)
			{
				ratio = 1;
			}
			new_vector = new_vector * ratio;
			new_vector = new_vector + self.torpedo_old_normal_vector;
			normal_vector = vectornormalize(new_vector);
		}
	}
	move_distance = 70;
	move_vector = move_distance * normal_vector;
	move_to_point = self.origin + move_vector;
	trace = bullettrace(self.origin, move_to_point, 0, self);
	if(trace[#"surfacetype"] !== "none")
	{
		detonate_point = trace[#"position"];
		dist_sq = distancesquared(detonate_point, self.origin);
		move_dist_sq = move_distance * move_distance;
		ratio = dist_sq / move_dist_sq;
		delay = ratio * 0.1;
		self thread raztorpedodetonate(delay);
	}
	self.torpedo_old_normal_vector = normal_vector;
	self moveto(move_to_point, 0.1);
	/#
		if(getdvarint(#"hash_4901482f884b01dc", 0))
		{
			line(self.origin, move_to_point, (0, 0, 1), 1, 0, 500);
		}
	#/
}

/*
	Name: raztorpedoplaytraileffect
	Namespace: razbehavior
	Checksum: 0x5ECFB65C
	Offset: 0x3360
	Size: 0xD4
	Parameters: 0
	Flags: Private
*/
function private raztorpedoplaytraileffect()
{
	self endon(#"death");
	self endon(#"detonated");
	surface_check_offset = 26;
	if(self.torpedo_trail_iterations >= 1)
	{
		trace = bullettrace(self.origin + vectorscale((0, 0, 1), 10), self.origin - (0, 0, surface_check_offset), 0, self);
		if(trace[#"surfacetype"] !== "none")
		{
			self clientfield::increment("raz_torpedo_play_trail", 1);
		}
	}
}

/*
	Name: razknockdownzombies
	Namespace: razbehavior
	Checksum: 0xA1CCF282
	Offset: 0x3440
	Size: 0x354
	Parameters: 1
	Flags: Linked, Private
*/
function private razknockdownzombies(target)
{
	self endon(#"death");
	while(isdefined(self))
	{
		if(isdefined(target))
		{
			if(isplayer(target))
			{
				torpedo_target_position = target.origin + vectorscale((0, 0, 1), 48);
			}
			else
			{
				torpedo_target_position = target.origin;
			}
			prediction_time = 0.3;
			if(isdefined(self.knockdown_iterations) && self.knockdown_iterations < 3)
			{
				if(self.knockdown_iterations == 0)
				{
					prediction_time = 0.075;
				}
				if(self.knockdown_iterations == 1)
				{
					prediction_time = 0.15;
				}
				if(self.knockdown_iterations == 2)
				{
					prediction_time = 0.225;
				}
			}
			self.knockdown_iterations = self.knockdown_iterations + 1;
			vector_to_target = torpedo_target_position - self.origin;
			normal_vector = vectornormalize(vector_to_target);
			move_distance = 700 * prediction_time;
			move_vector = move_distance * normal_vector;
			self.angles = vectortoangles(move_vector);
		}
		else
		{
			velocity = self getvelocity();
			velocitymag = length(velocity);
			b_sprinting = velocitymag >= 40;
			if(b_sprinting)
			{
				predict_time = 0.2;
				move_vector = velocity * predict_time;
			}
		}
		if(!isdefined(b_sprinting) || b_sprinting == 1)
		{
			predicted_pos = self.origin + move_vector;
			a_zombies = getentitiesinradius(predicted_pos, 48, 15);
			a_filtered_zombies = array::filter(a_zombies, 0, &razzombieeligibleforknockdown, self, predicted_pos);
		}
		else
		{
			wait(0.2);
			continue;
		}
		foreach(zombie in a_filtered_zombies)
		{
			zombie zombie_utility::setup_zombie_knockdown(self.origin);
		}
		wait(0.2);
	}
}

/*
	Name: raztorpedoknockdownzombies
	Namespace: razbehavior
	Checksum: 0x17AC820C
	Offset: 0x37A0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private raztorpedoknockdownzombies(torpedo_target)
{
	self endon(#"death");
	self endon(#"detonated");
	razknockdownzombies(torpedo_target);
}

/*
	Name: razsprintknockdownzombies
	Namespace: razbehavior
	Checksum: 0xE2F48687
	Offset: 0x37F0
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private razsprintknockdownzombies()
{
	self endon(#"death", #"hash_ce013f00056f6fe");
	self notify(#"razsprintknockdownzombies");
	self endon(#"razsprintknockdownzombies");
	razknockdownzombies();
}

/*
	Name: raztorpedodetonate
	Namespace: razbehavior
	Checksum: 0x8F03CAD9
	Offset: 0x3860
	Size: 0x1E4
	Parameters: 1
	Flags: Linked, Private
*/
function private raztorpedodetonate(delay)
{
	self endon(#"death");
	self notify(#"detonated");
	torpedo = self;
	raz_torpedo_owner = self.raz_torpedo_owner;
	if(delay > 0)
	{
		wait(delay);
	}
	if(isdefined(self))
	{
		self razapplyplayerdetonationeffects();
		w_weapon = getweapon("none");
		explosion_point = torpedo.origin;
		torpedo clientfield::set("raz_detonate_ground_torpedo", 1);
		radiusdamage(explosion_point + vectorscale((0, 0, 1), 18), 96, 75, 50, self.raz_torpedo_owner, "MOD_UNKNOWN", w_weapon);
		razapplytorpedodetonationpushtoplayers(explosion_point + vectorscale((0, 0, 1), 18));
		self clientfield::set("raz_torpedo_play_fx_on_self", 0);
		if(isarray(level.var_9ded2ca6))
		{
			arrayremovevalue(level.var_9ded2ca6, self);
		}
		wait(0.5);
		if(isdefined(raz_torpedo_owner) && is_true(level.b_raz_ignore_mangler_cooldown))
		{
			raz_torpedo_owner.next_torpedo_time = gettime();
		}
		if(isdefined(self))
		{
			self delete();
		}
	}
}

/*
	Name: razapplytorpedodetonationpushtoplayers
	Namespace: razbehavior
	Checksum: 0xDAA8D175
	Offset: 0x3A50
	Size: 0x23C
	Parameters: 1
	Flags: Linked, Private
*/
function private razapplytorpedodetonationpushtoplayers(torpedo_origin)
{
	players = getplayers();
	v_length = sqr(100);
	for(i = 0; i < players.size; i++)
	{
		player = players[i];
		if(!isalive(player))
		{
			continue;
		}
		if(player.sessionstate == "spectator")
		{
			continue;
		}
		if(player.sessionstate == "intermission")
		{
			continue;
		}
		if(is_true(player.ignoreme))
		{
			continue;
		}
		if(player isnotarget())
		{
			continue;
		}
		if(!player isonground())
		{
			continue;
		}
		n_distance = distance2dsquared(torpedo_origin, player.origin);
		if(n_distance < 0.01)
		{
			continue;
		}
		if(n_distance < v_length)
		{
			v_dir = player.origin - torpedo_origin;
			v_dir = (v_dir[0], v_dir[1], 0.1);
			v_dir = vectornormalize(v_dir);
			n_push_strength = getdvarint(#"hash_3ce74fce73494ef0", 500);
			n_push_strength = 200 + (randomint(n_push_strength - 200));
			v_player_velocity = player getvelocity();
			player setvelocity(v_player_velocity + (v_dir * n_push_strength));
		}
	}
}

/*
	Name: razapplyplayerdetonationeffects
	Namespace: razbehavior
	Checksum: 0xE9F78926
	Offset: 0x3C98
	Size: 0xE8
	Parameters: 0
	Flags: Linked, Private
*/
function private razapplyplayerdetonationeffects()
{
	earthquake(0.4, 0.8, self.origin, 300);
	players = getentitiesinradius(self.origin, 48, 1);
	foreach(player in players)
	{
		player playrumbleonentity("damage_heavy");
	}
}

/*
	Name: razzombieeligibleforknockdown
	Namespace: razbehavior
	Checksum: 0x64BB3261
	Offset: 0x3D88
	Size: 0x160
	Parameters: 2
	Flags: Linked, Private
*/
function private razzombieeligibleforknockdown(zombie, target)
{
	if(zombie.archetype !== #"zombie" || zombie.knockdown === 1 || gibserverutils::isgibbed(zombie, 384))
	{
		return false;
	}
	origin = target.origin;
	facing_vec = anglestoforward(target.angles);
	enemy_vec = zombie.origin - origin;
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

#namespace razserverutils;

/*
	Name: razspawnsetup
	Namespace: razserverutils
	Checksum: 0x87F196AF
	Offset: 0x3EF0
	Size: 0x114
	Parameters: 0
	Flags: Linked, Private
*/
function private razspawnsetup()
{
	self.next_torpedo_time = gettime();
	self.razhasgunattached = 1;
	self.razhashelmet = 1;
	self.razhasleftshoulderarmor = 1;
	self.razhaschestarmor = 1;
	self.razhasrightthigharmor = 1;
	self.razhasleftthigharmor = 1;
	self.razhasgoneberserk = 0;
	self.var_28621cf4 = "j_head";
	self.var_e5365d8a = (0, 0, 0);
	self.canbetargetedbyturnedzombies = 1;
	self.no_widows_wine = 1;
	self.flame_fx_timeout = 3;
	self.var_5ed30918 = 0;
	aiutility::addaioverridedamagecallback(self, &razdamagecallback);
	self thread razgibzombiesonmelee();
	self destructserverutils::togglespawngibs(self, 1);
	level thread zm_spawner::zombie_death_event(self);
}

/*
	Name: function_ac64daa7
	Namespace: razserverutils
	Checksum: 0xF7E9710E
	Offset: 0x4010
	Size: 0xEC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ac64daa7()
{
	self.razgunhealth = 0.25 * self.maxhealth;
	self.razhelmethealth = 0.1 * self.maxhealth;
	self.razchestarmorhealth = 0.2 * self.maxhealth;
	self.razrightthighhealth = 0.1 * self.maxhealth;
	self.razleftthighhealth = 0.1 * self.maxhealth;
	self.razleftshoulderarmorhealth = 0.1 * self.maxhealth;
	namespace_81245006::initweakpoints(self);
	self thread function_1f9940b8();
	self thread function_435778e4();
}

/*
	Name: function_435778e4
	Namespace: razserverutils
	Checksum: 0x319402C2
	Offset: 0x4108
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_435778e4()
{
	self.var_b467f3a1 = &function_2869a8ae;
	self thread function_3d267030();
	self thread function_3c2e8416();
}

/*
	Name: function_2869a8ae
	Namespace: razserverutils
	Checksum: 0x3C5B01C5
	Offset: 0x4158
	Size: 0x27C
	Parameters: 1
	Flags: Linked
*/
function function_2869a8ae(eventstruct)
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
		case "summon":
		case "ambient_line":
		{
			self thread function_6f9720f9(notify_string);
			return;
			break;
		}
		case "death":
		{
			b_override = 1;
			n_priority = 4;
			break;
		}
		case "pain":
		case "land":
		case "weapon_fire":
		case "idle_anim":
		case "hash_671cca6978fb0b90":
		{
			b_override = 1;
			n_priority = 3;
			break;
		}
		case "hash_3d74dcddcb044ab3":
		case "hash_6ad5b0562f654076":
		{
			b_override = 1;
			n_priority = 3;
			var_c8109157 = 1;
			break;
		}
		case "alerted":
		case "melee_notetrack":
		case "jump":
		case "hash_7ab80d642b09800b":
		{
			b_override = 1;
			n_priority = 2;
			var_c8109157 = 1;
			break;
		}
		case "ambient":
		case "ambient_enraged":
		case "ambient_alert":
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
	Name: function_6f9720f9
	Namespace: razserverutils
	Checksum: 0xC428AA31
	Offset: 0x43E0
	Size: 0x1F6
	Parameters: 1
	Flags: Linked
*/
function function_6f9720f9(str_type)
{
	self endon(#"death");
	if(isdefined(self.currentvoxpriority))
	{
		if(self.currentvoxpriority >= 3)
		{
			return;
		}
	}
	if(isdefined(self.currentvox))
	{
		self stopsound(self.currentvox);
		waitframe(1);
	}
	str_alias = function_5e4c45ae(str_type);
	if(!isdefined(str_alias))
	{
		return;
	}
	self.delayambientvox = 1;
	self thread zm_audio::zmbaivox_ambientdelay();
	self.talking = 1;
	self.currentvox = str_alias;
	self.currentvoxpriority = 4;
	if(self haspart("tag_eye"))
	{
		self playsoundontag(str_alias, "tag_eye");
	}
	else if(self haspart("j_neck"))
	{
		self playsoundontag(str_alias, "j_neck");
	}
	playbacktime = float(max((isdefined(soundgetplaybacktime(str_alias)) ? soundgetplaybacktime(str_alias) : 500), 500)) / 1000;
	wait(playbacktime);
	self.talking = 0;
	self.currentvox = undefined;
	self.currentvoxpriority = 1;
}

/*
	Name: function_5e4c45ae
	Namespace: razserverutils
	Checksum: 0x9CEB0FC
	Offset: 0x45E0
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function function_5e4c45ae(str_type)
{
	var_e31ec7b0 = array("vox_obj_hvt_hunt_sumn_mglr_mglr_0", "vox_obj_hvt_hunt_sumn_mglr_mglr_1", "vox_obj_hvt_hunt_sumn_mglr_mglr_2", "vox_obj_hvt_hunt_sumn_mglr_mglr_3");
	var_f7458ee2 = array("vox_obj_hvt_mglr_threat_mglr_0", "vox_obj_hvt_mglr_threat_mglr_1", "vox_obj_hvt_mglr_threat_mglr_2", "vox_obj_hvt_mglr_threat_mglr_3", "vox_obj_hvt_mglr_threat_mglr_4", "vox_obj_hvt_mglr_threat_mglr_5", "vox_obj_hvt_mglr_threat_mglr_6", "vox_obj_hvt_mglr_threat_mglr_7", "vox_obj_hvt_mglr_threat_mglr_8", "vox_obj_hvt_mglr_threat_mglr_9");
	if(str_type === "summon")
	{
		return var_e31ec7b0[randomintrange(0, var_e31ec7b0.size)];
	}
	return var_f7458ee2[randomintrange(0, var_f7458ee2.size)];
}

/*
	Name: function_3c2e8416
	Namespace: razserverutils
	Checksum: 0xFA214CC9
	Offset: 0x46E8
	Size: 0x1B0
	Parameters: 0
	Flags: Linked
*/
function function_3c2e8416()
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
			if(isdefined(self.zombie_move_speed) && self.zombie_move_speed === "sprint")
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
		if(str_notify === "ambient_alert")
		{
			if(function_21a3a673(1, 100) <= 9)
			{
				str_notify = "ambient_line";
				min_wait = 4;
				max_wait = 7;
			}
		}
		function_6eac4ca1(self, str_notify);
		self notify(#"bhtn_action_notify", {#action:str_notify});
		wait(randomfloatrange(min_wait, max_wait));
	}
}

/*
	Name: function_1f9940b8
	Namespace: razserverutils
	Checksum: 0x4A8B5F8D
	Offset: 0x48A0
	Size: 0x18E
	Parameters: 0
	Flags: Linked
*/
function function_1f9940b8()
{
	self endon(#"death");
	playfx(#"zombie/fx9_onslaught_spawn_sm", self.origin);
	playsoundatposition(#"hash_14247392847093a6", self.origin + vectorscale((0, 0, 1), 75));
	self.in_the_ground = 1;
	self ghost();
	self pathmode("dont move", 1);
	wait(0.5);
	if(!isdefined(self))
	{
		return;
	}
	self orientmode("face default");
	self playsound(#"hash_4b49f05e8c054fd9");
	self animscripted("rise_anim", self.origin, self.angles, #"ai_t9_zm_zombie_base_traverse_ground_dugup", "normal");
	waitframe(1);
	self show();
	self pathmode("move allowed");
	self.in_the_ground = 0;
}

/*
	Name: function_3d267030
	Namespace: razserverutils
	Checksum: 0xB3C54F62
	Offset: 0x4A38
	Size: 0x6E
	Parameters: 0
	Flags: Linked
*/
function function_3d267030()
{
	self endon(#"death");
	while(isdefined(self))
	{
		wait(randomintrange(2, 9));
		self playsoundontag("vox_ai_raz_ambient_radio", "tag_eye");
		wait(5);
	}
}

/*
	Name: razgibzombiesonmelee
	Namespace: razserverutils
	Checksum: 0xCA9D7378
	Offset: 0x4AB0
	Size: 0x43C
	Parameters: 0
	Flags: Linked, Private
*/
function private razgibzombiesonmelee()
{
	self endon(#"death");
	self endon(#"disconnect");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"melee_fire", #"zombie_melee");
		if(waitresult._notify === #"melee_fire")
		{
			zombiebehavior::zombienotetrackmeleefire(self);
		}
		a_zombies = getentitiesinradius(self.origin, 90, 15);
		function_1eaaceab(a_zombies);
		foreach(zombie in a_zombies)
		{
			if(zombie.archetype !== #"zombie" || is_true(zombie.no_gib))
			{
				continue;
			}
			heightdiff = abs(zombie.origin[2] - self.origin[2]);
			if(heightdiff > 50)
			{
				continue;
			}
			distance2dsq = distance2dsquared(zombie.origin, self.origin);
			if(distance2dsq > sqr(90))
			{
				continue;
			}
			raz_forward = anglestoforward(self.angles);
			vect_to_enemy = zombie.origin - self.origin;
			if(vectordot(raz_forward, vect_to_enemy) <= 0)
			{
				continue;
			}
			right_vect = anglestoright(self.angles);
			projected_distance = vectordot(vect_to_enemy, right_vect);
			if(abs(projected_distance) > 35)
			{
				continue;
			}
			b_gibbed = 0;
			val = randomint(100);
			if(val > 50)
			{
				if(!gibserverutils::isgibbed(zombie, 32))
				{
					gibserverutils::gibrightarm(zombie, 0);
					b_gibbed = 1;
				}
			}
			val = randomint(100);
			if(val > 50)
			{
				if(!gibserverutils::isgibbed(zombie, 16))
				{
					gibserverutils::gibleftarm(zombie, 0);
					b_gibbed = 1;
				}
			}
			if(!is_true(b_gibbed))
			{
				if(!gibserverutils::isgibbed(zombie, 32))
				{
					gibserverutils::gibrightarm(zombie, 0);
					continue;
				}
				if(!gibserverutils::isgibbed(zombie, 16))
				{
					gibserverutils::gibleftarm(zombie, 0);
				}
			}
		}
	}
}

/*
	Name: hide_part
	Namespace: razserverutils
	Checksum: 0xBDBEF371
	Offset: 0x4EF8
	Size: 0x64
	Parameters: 2
	Flags: Linked, Private
*/
function private hide_part(strtag, var_9c5eab68)
{
	if(!isdefined(var_9c5eab68))
	{
		var_9c5eab68 = 1;
	}
	if(self haspart(strtag))
	{
		self hidepart(strtag, "", var_9c5eab68);
	}
}

/*
	Name: razinvalidategibbedarmor
	Namespace: razserverutils
	Checksum: 0xD68FF1C1
	Offset: 0x4F68
	Size: 0x294
	Parameters: 0
	Flags: Linked, Private
*/
function private razinvalidategibbedarmor()
{
	if(!is_true(self.razhasgunattached))
	{
		self hide_part("j_shouldertwist_ri_attach");
		self hide_part("j_shoulder_ri_attach", 0);
	}
	if(!is_true(self.razhaschestarmor))
	{
		self hide_part("j_spine4_attach");
		self hide_part("j_spineupper_attach");
		self hide_part("j_spinelower_attach");
		self hide_part("j_mainroot_attach");
		self hide_part("j_clavicle_ri_attachbp");
		self hide_part("j_clavicle_le_attachbp");
	}
	if(!is_true(self.razhasleftshoulderarmor))
	{
		self hide_part("j_shouldertwist_le_attach");
		self hide_part("j_shoulder_le_attach");
		self hide_part("j_clavicle_le_attach");
	}
	if(!is_true(self.razhasrightthigharmor))
	{
		self hide_part("j_hiptwist_ri_attach");
		self hide_part("j_hip_ri_attach");
	}
	if(!is_true(self.razhasleftthigharmor))
	{
		self hide_part("j_hiptwist_le_attach");
		self hide_part("j_hip_le_attach");
	}
	if(!is_true(self.razhashelmet))
	{
		self hide_part("j_head_attach");
	}
}

/*
	Name: razdamagecallback
	Namespace: razserverutils
	Checksum: 0x3319ED7A
	Offset: 0x5208
	Size: 0x550
	Parameters: 13
	Flags: Linked, Private
*/
function private razdamagecallback(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	entity = self;
	entity.last_damage_hit_armor = 0;
	if(isdefined(var_fd90b0bb) && var_fd90b0bb == entity)
	{
		return 0;
	}
	if(entity flag::get("kill_hvt_teleporting"))
	{
		weakpoint = namespace_81245006::function_3131f5dd(entity, boneindex, 1);
		if(!isdefined(weakpoint))
		{
			weakpoint = namespace_81245006::function_37e3f011(entity, modelindex, 1);
		}
		entity.var_6936b30b = {#hash_ebcff177:4, #weakpoint:weakpoint};
		return 0;
	}
	var_a70572a9 = 0.4;
	if(isdefined(level.var_dff96419) && isplayer(var_fd90b0bb))
	{
		var_a70572a9 = var_fd90b0bb [[level.var_dff96419]](0.4, hitloc);
	}
	if(!isdefined(entity.invoke_sprint_time) && !is_true(entity.berserk))
	{
		entity.invoke_sprint_time = gettime() + 60000;
	}
	var_ebcff177 = 1;
	if(namespace_81245006::hasarmor(self) && (dir === "MOD_PROJECTILE_SPLASH" || dir === "MOD_GRENADE_SPLASH" || dir == "MOD_EXPLOSIVE"))
	{
		var_3cddb028 = 1 * point;
		var_31e96b81 = int(var_3cddb028);
		foreach(weakpoint in self.var_5ace757d)
		{
			if(weakpoint.type === #"armor" && weakpoint.currstate === 1)
			{
				function_4c13b4e7(entity, weakpoint, var_fd90b0bb, var_31e96b81, var_a70572a9, hitloc, offsettime);
			}
		}
	}
	weakpoint = namespace_81245006::function_3131f5dd(self, boneindex, 1);
	if(!isdefined(weakpoint))
	{
		weakpoint = namespace_81245006::function_37e3f011(self, modelindex, 1);
	}
	if(isdefined(weakpoint))
	{
		function_4c13b4e7(entity, weakpoint, var_fd90b0bb, point, var_a70572a9, hitloc, offsettime);
		if(weakpoint.type === #"armor" && weakpoint.var_f371ebb0 !== "right_arm_armor")
		{
			var_ebcff177 = 3;
			point = int(point * var_a70572a9);
		}
	}
	if(weakpoint.var_3765e777 === 1 && aiutility::function_69c2d36f(dir))
	{
		var_ebcff177 = 2;
	}
	/#
		if(is_true(level.var_85a39c96))
		{
			point = self.health + 1;
		}
	#/
	if(!aiutility::function_493e5914(dir))
	{
		var_cdbcfa73 = self gettagorigin("j_head");
		offsettime = var_cdbcfa73 + (0, 0, 0);
	}
	self.var_6936b30b = {#hash_ebcff177:var_ebcff177, #weakpoint:weakpoint};
	var_d58c98fd = 0;
	if(!is_true(self.var_e7d6f7b4) && !is_true(self.blockingpain) && !isdefined(self.var_3059ea5f))
	{
		self thread function_1bdbe36c();
	}
	return point;
}

/*
	Name: function_1bdbe36c
	Namespace: razserverutils
	Checksum: 0x52C04E49
	Offset: 0x5760
	Size: 0x96
	Parameters: 0
	Flags: Linked
*/
function function_1bdbe36c()
{
	self endon(#"death", #"hash_6abeb88b076c8c04");
	level endon(#"end_game", #"game_ended");
	self.var_e7d6f7b4 = 1;
	waittillframeend();
	self.blockingpain = 1;
	wait(randomfloatrange(1, 2));
	self.blockingpain = 0;
	self.var_e7d6f7b4 = undefined;
}

/*
	Name: function_4c13b4e7
	Namespace: razserverutils
	Checksum: 0x1DCB5595
	Offset: 0x5800
	Size: 0x3DC
	Parameters: 7
	Flags: Linked
*/
function function_4c13b4e7(entity, weakpoint, attacker, damage, var_a70572a9, weapon, point)
{
	if(weakpoint.type === #"weakpoint")
	{
		level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"hit_weak_point_zm", #attacker:attacker});
	}
	else if(weakpoint.type === #"armor")
	{
		self.var_426947c4 = undefined;
		if(namespace_81245006::function_f29756fe(weakpoint) === 1 && isdefined(weakpoint.var_f371ebb0))
		{
			if(isdefined(level.var_337f9ff7))
			{
				damage_mod = [[level.var_337f9ff7]](attacker, damage, weapon, entity);
				damage = damage * damage_mod;
			}
			if(weakpoint.var_f371ebb0 == "right_arm_armor")
			{
				namespace_81245006::function_ef87b7e8(weakpoint, damage);
				entity clientfield::increment("raz_gun_weakpoint_hit", 1);
				entity.razgunhealth = weakpoint.health;
			}
			else
			{
				damage = damage * var_a70572a9;
				namespace_81245006::function_ef87b7e8(weakpoint, damage);
			}
		}
		if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(entity, weakpoint.var_f371ebb0);
			scoreevent = "destroyed_armor_zm";
			self.var_426947c4 = 1;
			if(weakpoint.var_f371ebb0 == "helmet")
			{
				entity function_2eb802f5(attacker);
			}
			if(weakpoint.var_f371ebb0 == "body_armor")
			{
				entity function_50c2a59e(attacker);
			}
			if(weakpoint.var_f371ebb0 == "left_arm_armor")
			{
				entity function_597f31c9(attacker);
			}
			if(weakpoint.var_f371ebb0 == "right_leg_armor")
			{
				entity function_578362e9(attacker);
			}
			if(weakpoint.var_f371ebb0 == "left_leg_armor")
			{
				entity function_50f53d3b(attacker);
			}
			if(weakpoint.var_f371ebb0 == "right_arm_armor")
			{
				scoreevent = "mangler_cannon_destroyed_zm";
				entity function_afcd63e1(attacker, damage, point, weapon);
				if(isplayer(attacker))
				{
					attacker stats::function_dad108fa(#"hash_6a37af3afff55532", 1);
				}
			}
			level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:scoreevent, #attacker:attacker});
		}
	}
}

/*
	Name: raz_check_for_location_hit
	Namespace: razserverutils
	Checksum: 0x2588AFE
	Offset: 0x5BE8
	Size: 0xBC
	Parameters: 6
	Flags: Private
*/
function private raz_check_for_location_hit(entity, hitloc, point, location, hit_radius_sq, tag)
{
	b_hit_location = 0;
	if(isdefined(hitloc) && hitloc != "none")
	{
		if(hitloc == location)
		{
			b_hit_location = 1;
		}
	}
	else
	{
		dist_sq = distancesquared(point, entity gettagorigin(tag));
		if(dist_sq <= hit_radius_sq)
		{
			b_hit_location = 1;
		}
	}
	return b_hit_location;
}

/*
	Name: function_30df6d2b
	Namespace: razserverutils
	Checksum: 0x70BBAC96
	Offset: 0x5CB0
	Size: 0xEE
	Parameters: 1
	Flags: Linked
*/
function function_30df6d2b(entity)
{
	self hide_part("j_shouldertwist_ri_attach");
	self hide_part("j_shoulder_ri_attach", 0);
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	entity asmsetanimationrate(1);
	entity setblackboardattribute("_gibbed_limbs", "right_arm");
	entity setblackboardattribute("_gib_location", "right_arm");
	entity.var_5ed30918 = gettime();
}

/*
	Name: function_afcd63e1
	Namespace: razserverutils
	Checksum: 0x579E7885
	Offset: 0x5DA8
	Size: 0x244
	Parameters: 4
	Flags: Linked
*/
function function_afcd63e1(attacker, damage, point, damage_weapon)
{
	entity = self;
	entity.razgunhealth = 0;
	entity.razhasgunattached = 0;
	entity.invoke_sprint_time = undefined;
	entity.started_running = 1;
	entity thread razbehavior::razsprintknockdownzombies();
	if(!isdefined(entity.var_3059ea5f) || !is_true(entity.var_3059ea5f.var_2b605d6f))
	{
		function_30df6d2b(entity);
	}
	razinvalidategibbedarmor();
	if(isdefined(damage))
	{
		level notify(#"raz_arm_detach", damage);
		self notify(#"raz_arm_detach", damage);
	}
	if(isdefined(point))
	{
		var_cdbcfa73 = self gettagorigin("j_head");
		damage_weapon = var_cdbcfa73 + (0, 0, 0);
		post_hit_health = entity.health - point;
		gun_detach_damage = entity.maxhealth * 0.33;
		if(entity.var_9fde8624 === #"hash_471ba598e7e8c460")
		{
			gun_detach_damage = entity.maxhealth * 0.15;
		}
		post_hit_health_percent = (post_hit_health - gun_detach_damage) / entity.maxhealth;
		if(gun_detach_damage >= self.health)
		{
			level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"mangler_arm_cannon_kill_zm", #attacker:damage});
		}
		self dodamage(gun_detach_damage, self.origin, damage);
	}
}

/*
	Name: function_2eb802f5
	Namespace: razserverutils
	Checksum: 0x71DE749A
	Offset: 0x5FF8
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_2eb802f5(attacker)
{
	entity = self;
	entity.razhashelmet = 0;
	entity setblackboardattribute("_gib_location", "head");
	entity.var_5ed30918 = gettime();
	/#
		println("");
	#/
	entity function_5027ed0f();
	if(isdefined(attacker))
	{
		level notify(#"raz_mask_destroyed", attacker);
	}
}

/*
	Name: function_50c2a59e
	Namespace: razserverutils
	Checksum: 0x4C59E271
	Offset: 0x60A8
	Size: 0x144
	Parameters: 1
	Flags: Linked
*/
function function_50c2a59e(attacker)
{
	entity = self;
	entity hide_part("j_spine4_attach");
	entity hide_part("j_spineupper_attach");
	entity hide_part("j_spinelower_attach");
	entity hide_part("j_mainroot_attach");
	entity hide_part("j_clavicle_ri_attachbp");
	entity hide_part("j_clavicle_le_attachbp");
	entity.razhaschestarmor = 0;
	entity setblackboardattribute("_gib_location", "arms");
	entity.var_5ed30918 = gettime();
	/#
		println("");
	#/
	entity function_5027ed0f();
}

/*
	Name: function_597f31c9
	Namespace: razserverutils
	Checksum: 0x37E0F7B7
	Offset: 0x61F8
	Size: 0xAE
	Parameters: 1
	Flags: Linked
*/
function function_597f31c9(attacker)
{
	entity = self;
	entity hide_part("j_shouldertwist_le_attach");
	entity hide_part("j_shoulder_le_attach");
	entity hide_part("j_clavicle_le_attach");
	entity.razhasleftshoulderarmor = 0;
	entity setblackboardattribute("_gib_location", "left_arm");
	entity.var_5ed30918 = gettime();
}

/*
	Name: function_50f53d3b
	Namespace: razserverutils
	Checksum: 0x761C44F6
	Offset: 0x62B0
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_50f53d3b(attacker)
{
	entity = self;
	entity hide_part("j_hiptwist_le_attach");
	entity hide_part("j_hip_le_attach");
	entity.razhasleftthigharmor = 0;
	entity setblackboardattribute("_gib_location", "left_leg");
	entity.var_5ed30918 = gettime();
}

/*
	Name: function_578362e9
	Namespace: razserverutils
	Checksum: 0x868D2335
	Offset: 0x6348
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_578362e9(attacker)
{
	entity = self;
	entity hide_part("j_hiptwist_ri_attach");
	entity hide_part("j_hip_ri_attach");
	entity.razhasrightthigharmor = 0;
	entity setblackboardattribute("_gib_location", "right_leg");
	entity.var_5ed30918 = gettime();
}

/*
	Name: function_296795d8
	Namespace: razserverutils
	Checksum: 0xD78A17BE
	Offset: 0x63E0
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_296795d8(time)
{
	self endon(#"death");
	self notify("e32e078e9d362da");
	self endon("e32e078e9d362da");
	wait(time);
	self.razhasgoneberserk = 0;
	self.var_e8f3d773 = 0;
	if(!is_true(self.berserk))
	{
		self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
		self asmsetanimationrate(1);
		self notify(#"hash_ce013f00056f6fe");
	}
}

/*
	Name: function_5027ed0f
	Namespace: razserverutils
	Checksum: 0x52682E5A
	Offset: 0x64B0
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function function_5027ed0f()
{
	entity = self;
	entity.var_e8f3d773 = 1;
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_sprint");
	entity thread razbehavior::razsprintknockdownzombies();
	entity thread function_296795d8(15);
	entity asmsetanimationrate(1);
}

