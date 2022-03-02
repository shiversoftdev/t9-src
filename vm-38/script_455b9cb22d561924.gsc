#using script_19de6a08d25644f4;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;

#namespace namespace_a57914e0;

/*
	Name: function_5bf2ed75
	Namespace: namespace_a57914e0
	Checksum: 0xAB8E7409
	Offset: 0x210
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5bf2ed75()
{
	level notify(983526944);
}

#namespace namespace_2be98cb7;

/*
	Name: init
	Namespace: namespace_2be98cb7
	Checksum: 0x8B6D3836
	Offset: 0x230
	Size: 0x54
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	spawner::add_archetype_spawn_function(#"dog", &function_ef4b81af);
	registerbehaviorscriptfunctions();
	namespace_835228b4::function_7304e94b();
}

/*
	Name: function_ef4b81af
	Namespace: namespace_2be98cb7
	Checksum: 0xF8BE9658
	Offset: 0x290
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ef4b81af()
{
	function_ae45f57b();
	self allowpitchangle(1);
	self setpitchorient();
	self setavoidancemask("avoid all");
	self collidewithactors(1);
	self ai::set_behavior_attribute("spacing_value", randomfloatrange(-1, 1));
	aiutility::addaioverridedamagecallback(self, &function_756cb98c);
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_2be98cb7
	Checksum: 0x9C62BC43
	Offset: 0x370
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&dogtargetservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("dogTargetService", &dogtargetservice);
	/#
		assert(isscriptfunctionptr(&dogshouldmelee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("dogShouldMelee", &dogshouldmelee);
	/#
		assert(isscriptfunctionptr(&dogshouldwalk));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("dogShouldWalk", &dogshouldwalk);
	/#
		assert(isscriptfunctionptr(&dogshouldrun));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi("dogShouldRun", &dogshouldrun);
	/#
		assert(!isdefined(&dogmeleeaction) || isscriptfunctionptr(&dogmeleeaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_303397b0) || isscriptfunctionptr(&function_303397b0));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("dogMeleeAction", &dogmeleeaction, undefined, &function_303397b0);
}

/*
	Name: function_cebd576f
	Namespace: namespace_2be98cb7
	Checksum: 0x3308092B
	Offset: 0x610
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function function_cebd576f(entity)
{
	entity melee();
	/#
		record3dtext("", self.origin, (1, 0, 0), "", entity);
	#/
}

/*
	Name: function_ae45f57b
	Namespace: namespace_2be98cb7
	Checksum: 0xCE20030A
	Offset: 0x670
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_ae45f57b()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_cb274b5;
}

/*
	Name: function_cb274b5
	Namespace: namespace_2be98cb7
	Checksum: 0x4A92FD0F
	Offset: 0x6C8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cb274b5(entity)
{
	entity.__blackboard = undefined;
	entity function_ae45f57b();
}

/*
	Name: bb_getshouldrunstatus
	Namespace: namespace_2be98cb7
	Checksum: 0x8487A977
	Offset: 0x700
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function bb_getshouldrunstatus()
{
	if(is_true(self.hasseenfavoriteenemy) || ai::getaiattribute(self, "chaseenemyonspawn"))
	{
		return "run";
	}
	return "walk";
}

/*
	Name: getyaw
	Namespace: namespace_2be98cb7
	Checksum: 0x8BDF391F
	Offset: 0x758
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function getyaw(org)
{
	angles = vectortoangles(org - self.origin);
	return angles[1];
}

/*
	Name: absyawtoenemy
	Namespace: namespace_2be98cb7
	Checksum: 0xDED20B9A
	Offset: 0x7A0
	Size: 0x92
	Parameters: 0
	Flags: Linked
*/
function absyawtoenemy()
{
	/#
		assert(isdefined(self.enemy));
	#/
	yaw = self.angles[1] - getyaw(self.enemy.origin);
	yaw = angleclamp180(yaw);
	if(yaw < 0)
	{
		yaw = -1 * yaw;
	}
	return yaw;
}

/*
	Name: need_to_run
	Namespace: namespace_2be98cb7
	Checksum: 0x3215719A
	Offset: 0x840
	Size: 0x27A
	Parameters: 0
	Flags: Linked
*/
function need_to_run()
{
	if(ai::getaiattribute(self, "chaseenemyonspawn"))
	{
		return true;
	}
	run_dist_squared = sqr(self ai::get_behavior_attribute("min_run_dist"));
	run_yaw = 20;
	run_pitch = 30;
	run_height = 64;
	if(self.health < self.maxhealth)
	{
		return true;
	}
	if(!isdefined(self.enemy) || !isalive(self.enemy))
	{
		return false;
	}
	lastknownpostime = self lastknowntime(self.enemy);
	var_474944f9 = (gettime() - lastknownpostime) < 20000;
	if(!self cansee(self.enemy) && !var_474944f9)
	{
		return false;
	}
	dist = distancesquared(self.origin, self.enemy.origin);
	if(dist > run_dist_squared)
	{
		return false;
	}
	height = self.origin[2] - self.enemy.origin[2];
	if(abs(height) > run_height)
	{
		return false;
	}
	yaw = self absyawtoenemy();
	if(yaw > run_yaw)
	{
		return false;
	}
	pitch = angleclamp180(vectortoangles(self.origin - self.enemy.origin)[0]);
	if(abs(pitch) > run_pitch)
	{
		return false;
	}
	return true;
}

/*
	Name: is_target_valid
	Namespace: namespace_2be98cb7
	Checksum: 0x88AC44E2
	Offset: 0xAC8
	Size: 0x110
	Parameters: 2
	Flags: Linked, Private
*/
function private is_target_valid(dog, target)
{
	if(!isdefined(target))
	{
		return false;
	}
	if(!isalive(target))
	{
		return false;
	}
	if(isplayer(target) && target.sessionstate == "spectator")
	{
		return false;
	}
	if(isplayer(target) && target.sessionstate == "intermission")
	{
		return false;
	}
	if(is_true(self.intermission))
	{
		return false;
	}
	if(is_true(target.ignoreme))
	{
		return false;
	}
	if(target isnotarget())
	{
		return false;
	}
	if(dog.team == target.team)
	{
		return false;
	}
	return true;
}

/*
	Name: get_favorite_enemy
	Namespace: namespace_2be98cb7
	Checksum: 0x67054611
	Offset: 0xBE0
	Size: 0x1B2
	Parameters: 1
	Flags: Linked, Private
*/
function private get_favorite_enemy(dog)
{
	dog_targets = [];
	dog_targets = arraycombine(getplayers(), getaiarray(), 0, 0);
	least_hunted = dog_targets[0];
	closest_target_dist_squared = undefined;
	for(i = 0; i < dog_targets.size; i++)
	{
		if(!isdefined(dog_targets[i].hunted_by))
		{
			dog_targets[i].hunted_by = 0;
		}
		if(!is_target_valid(dog, dog_targets[i]))
		{
			continue;
		}
		if(!is_target_valid(dog, least_hunted))
		{
			least_hunted = dog_targets[i];
		}
		dist_squared = distancesquared(dog.origin, dog_targets[i].origin);
		if(dog_targets[i].hunted_by <= least_hunted.hunted_by && (!isdefined(closest_target_dist_squared) || dist_squared < closest_target_dist_squared))
		{
			least_hunted = dog_targets[i];
			closest_target_dist_squared = dist_squared;
		}
	}
	if(!is_target_valid(dog, least_hunted))
	{
		return undefined;
	}
	least_hunted.hunted_by = least_hunted.hunted_by + 1;
	return least_hunted;
}

/*
	Name: get_last_valid_position
	Namespace: namespace_2be98cb7
	Checksum: 0xA895C0BB
	Offset: 0xDA0
	Size: 0x2E
	Parameters: 0
	Flags: Linked
*/
function get_last_valid_position()
{
	if(isplayer(self))
	{
		return self.last_valid_position;
	}
	return self.origin;
}

/*
	Name: get_locomotion_target
	Namespace: namespace_2be98cb7
	Checksum: 0x3ECE4704
	Offset: 0xDD8
	Size: 0x21A
	Parameters: 1
	Flags: Linked
*/
function get_locomotion_target(behaviortreeentity)
{
	last_valid_position = behaviortreeentity.favoriteenemy get_last_valid_position();
	if(!isdefined(last_valid_position))
	{
		return undefined;
	}
	locomotion_target = last_valid_position;
	if(ai::has_behavior_attribute("spacing_value"))
	{
		spacing_near_dist = ai::get_behavior_attribute("spacing_near_dist");
		spacing_far_dist = ai::get_behavior_attribute("spacing_far_dist");
		spacing_horz_dist = ai::get_behavior_attribute("spacing_horz_dist");
		spacing_value = ai::get_behavior_attribute("spacing_value");
		to_enemy = behaviortreeentity.favoriteenemy.origin - behaviortreeentity.origin;
		perp = vectornormalize((to_enemy[1] * -1, to_enemy[0], 0));
		offset = (perp * spacing_horz_dist) * spacing_value;
		spacing_dist = math::clamp(length(to_enemy), spacing_near_dist, spacing_far_dist);
		lerp_amount = math::clamp((spacing_dist - spacing_near_dist) / (spacing_far_dist - spacing_near_dist), 0, 1);
		desired_point = last_valid_position + (offset * lerp_amount);
		desired_point = getclosestpointonnavmesh(desired_point, spacing_horz_dist * 1.2, 16);
		if(isdefined(desired_point))
		{
			locomotion_target = desired_point;
		}
	}
	return locomotion_target;
}

/*
	Name: dogtargetservice
	Namespace: namespace_2be98cb7
	Checksum: 0x6604CAB4
	Offset: 0x1000
	Size: 0x2AA
	Parameters: 1
	Flags: Linked
*/
function dogtargetservice(behaviortreeentity)
{
	if(behaviortreeentity.ignoreall || behaviortreeentity.pacifist || (isdefined(behaviortreeentity.favoriteenemy) && !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy)))
	{
		if(isdefined(behaviortreeentity.favoriteenemy) && isdefined(behaviortreeentity.favoriteenemy.hunted_by) && behaviortreeentity.favoriteenemy.hunted_by > 0)
		{
			behaviortreeentity.favoriteenemy.hunted_by--;
		}
		behaviortreeentity.favoriteenemy = undefined;
		behaviortreeentity.hasseenfavoriteenemy = 0;
		if(!behaviortreeentity.ignoreall)
		{
			behaviortreeentity function_a57c34b7(behaviortreeentity.origin);
		}
		return;
	}
	if(!is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy))
	{
		behaviortreeentity.favoriteenemy = get_favorite_enemy(behaviortreeentity);
	}
	if(!is_true(behaviortreeentity.hasseenfavoriteenemy))
	{
		if(isdefined(behaviortreeentity.favoriteenemy) && behaviortreeentity need_to_run())
		{
			behaviortreeentity.hasseenfavoriteenemy = 1;
		}
	}
	if(isdefined(behaviortreeentity.favoriteenemy))
	{
		if(isdefined(level.enemy_location_override_func))
		{
			goalpos = [[level.enemy_location_override_func]](behaviortreeentity, behaviortreeentity.favoriteenemy);
			if(isdefined(goalpos))
			{
				behaviortreeentity function_a57c34b7(goalpos);
				return;
			}
		}
		locomotion_target = get_locomotion_target(behaviortreeentity);
		if(isdefined(locomotion_target))
		{
			repathdist = 16;
			if(!isdefined(behaviortreeentity.lasttargetposition) || distancesquared(behaviortreeentity.lasttargetposition, locomotion_target) > sqr(repathdist) || !behaviortreeentity haspath())
			{
				behaviortreeentity function_a57c34b7(locomotion_target);
				behaviortreeentity.lasttargetposition = locomotion_target;
			}
		}
	}
}

/*
	Name: dogshouldmelee
	Namespace: namespace_2be98cb7
	Checksum: 0xA72A30F5
	Offset: 0x12B8
	Size: 0xE0
	Parameters: 1
	Flags: Linked
*/
function dogshouldmelee(behaviortreeentity)
{
	if(behaviortreeentity.ignoreall || !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy))
	{
		return false;
	}
	if(!is_true(level.intermission))
	{
		meleedist = 72;
		if(distancesquared(behaviortreeentity.origin, behaviortreeentity.favoriteenemy.origin) < sqr(meleedist) && behaviortreeentity cansee(behaviortreeentity.favoriteenemy))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: dogshouldwalk
	Namespace: namespace_2be98cb7
	Checksum: 0x9EE29E38
	Offset: 0x13A0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function dogshouldwalk(behaviortreeentity)
{
	return bb_getshouldrunstatus() == "walk";
}

/*
	Name: dogshouldrun
	Namespace: namespace_2be98cb7
	Checksum: 0x84B9B197
	Offset: 0x13D0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function dogshouldrun(behaviortreeentity)
{
	return bb_getshouldrunstatus() == "run";
}

/*
	Name: use_low_attack
	Namespace: namespace_2be98cb7
	Checksum: 0x8FAB3791
	Offset: 0x1400
	Size: 0x166
	Parameters: 0
	Flags: Linked
*/
function use_low_attack()
{
	if(!isdefined(self.enemy) || !isplayer(self.enemy))
	{
		return false;
	}
	height_diff = self.enemy.origin[2] - self.origin[2];
	low_enough = 30;
	if(height_diff < low_enough && self.enemy getstance() == "prone")
	{
		return true;
	}
	melee_origin = (self.origin[0], self.origin[1], self.origin[2] + 65);
	enemy_origin = (self.enemy.origin[0], self.enemy.origin[1], self.enemy.origin[2] + 32);
	if(!bullettracepassed(melee_origin, enemy_origin, 0, self))
	{
		return true;
	}
	return false;
}

/*
	Name: dogmeleeaction
	Namespace: namespace_2be98cb7
	Checksum: 0xDF5CE1FD
	Offset: 0x1570
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function dogmeleeaction(behaviortreeentity, asmstatename)
{
	behaviortreeentity clearpath();
	context = "high";
	if(behaviortreeentity use_low_attack())
	{
		context = "low";
	}
	behaviortreeentity setblackboardattribute("_context", context);
	animationstatenetworkutility::requeststate(behaviortreeentity, asmstatename);
	return 5;
}

/*
	Name: function_303397b0
	Namespace: namespace_2be98cb7
	Checksum: 0xC4BFE3F8
	Offset: 0x1618
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_303397b0(behaviortreeentity, asmstatename)
{
	asmstatename setblackboardattribute("_context", undefined);
	return 4;
}

/*
	Name: function_756cb98c
	Namespace: namespace_2be98cb7
	Checksum: 0x31C1599D
	Offset: 0x1658
	Size: 0xEA
	Parameters: 13
	Flags: Linked, Private
*/
function private function_756cb98c(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex)
{
	if(isdefined(psoffsettime) && isactor(psoffsettime) && (modelindex === "MOD_RIFLE_BULLET" || modelindex == "MOD_PISTOL_BULLET" || modelindex == "MOD_HEAD_SHOT"))
	{
		level.var_d7e2833c = 1;
		boneindex = boneindex * 3;
	}
	return boneindex;
}

