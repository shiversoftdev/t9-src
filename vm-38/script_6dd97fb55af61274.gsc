#using script_1940fc077a028a81;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using script_125eee34421b60ab;

#namespace namespace_d35b13b1;

/*
	Name: function_3290702d
	Namespace: namespace_d35b13b1
	Checksum: 0xE3EEEB98
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_3290702d()
{
	level notify(1589996621);
}

/*
	Name: __init__system__
	Namespace: namespace_d35b13b1
	Checksum: 0x145EBB75
	Offset: 0x110
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7eaac11b6cd35b05", &function_70a657d8, undefined, &function_4df027f2, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d35b13b1
	Checksum: 0xE3682985
	Offset: 0x160
	Size: 0x74
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"raz", &function_ce3b36df);
	spawner::function_89a2cd87(#"raz", &function_e7ad996);
	initrazbehaviorsandasm();
}

/*
	Name: function_4df027f2
	Namespace: namespace_d35b13b1
	Checksum: 0x80F724D1
	Offset: 0x1E0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_4df027f2()
{
}

/*
	Name: initrazbehaviorsandasm
	Namespace: namespace_d35b13b1
	Checksum: 0x80F724D1
	Offset: 0x1F0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private initrazbehaviorsandasm()
{
}

/*
	Name: function_ce3b36df
	Namespace: namespace_d35b13b1
	Checksum: 0x2DDD1249
	Offset: 0x200
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_ce3b36df()
{
	if(is_true(level.is_survival))
	{
		self.ai.var_870d0893 = 1;
		self.completed_emerging_into_playable_area = 1;
	}
	self callback::function_d8abfc3d(#"on_ai_melee", &namespace_85745671::function_b8eb5dea);
	self callback::function_d8abfc3d(#"on_ai_melee", &namespace_85745671::function_95c99579, undefined, [1:1, 0:undefined]);
	self callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &namespace_85745671::function_5cb3181e);
	self.var_12af7864 = 1;
	self.var_c11b8a5a = 1;
	self.var_b3c613a7 = [4:2, 3:2, 2:1.5, 1:1.5, 0:1];
	self.var_414bc881 = 1;
	self.var_97ca51c7 = 2;
	playfx("zombie/fx_portal_keeper_spawn_burst_zod_zmb", self.origin, anglestoforward((0, 0, 0)), anglestoup((0, 0, 0)));
}

/*
	Name: function_e7ad996
	Namespace: namespace_d35b13b1
	Checksum: 0x5F38636A
	Offset: 0x3C8
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_e7ad996()
{
	if(is_true(self.ai.var_870d0893))
	{
		setup_awareness(self);
	}
}

/*
	Name: function_f9780e50
	Namespace: namespace_d35b13b1
	Checksum: 0x716A33
	Offset: 0x410
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_f9780e50(params)
{
	self endon(#"death");
	if(isdefined(self.attackable))
	{
		namespace_85745671::function_2b925fa5(self);
	}
	self.var_98f1f37c = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

/*
	Name: setup_awareness
	Namespace: namespace_d35b13b1
	Checksum: 0x69D3A4A4
	Offset: 0x490
	Size: 0x1AC
	Parameters: 1
	Flags: Linked, Private
*/
function private setup_awareness(entity)
{
	entity.has_awareness = 1;
	entity.ignorelaststandplayers = 1;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::register_state(entity, #"wander", &function_1df172de, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::register_state(entity, #"investigate", &function_bbd541c7, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::register_state(entity, #"chase", &function_7812e703, &function_333a7b23, &awareness::function_b9f81e8b, &awareness::function_5c40e824);
	awareness::set_state(entity, #"wander");
	entity thread awareness::function_fa6e010d();
}

/*
	Name: function_1df172de
	Namespace: namespace_d35b13b1
	Checksum: 0x3F4FD61C
	Offset: 0x648
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1df172de(entity)
{
	self.fovcosine = 0.5;
	self.maxsightdistsqrd = sqr(1000);
	self.var_1267fdea = 0;
	awareness::function_9c9d96b5(entity);
}

/*
	Name: function_bbd541c7
	Namespace: namespace_d35b13b1
	Checksum: 0xC7CE4167
	Offset: 0x6B0
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bbd541c7(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(1800);
	self.var_1267fdea = 0;
	awareness::function_b41f0471(entity);
}

/*
	Name: function_7812e703
	Namespace: namespace_d35b13b1
	Checksum: 0x2F7ADB54
	Offset: 0x718
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7812e703(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(3000);
	self.var_1267fdea = 0;
	awareness::function_978025e4(entity);
}

/*
	Name: function_333a7b23
	Namespace: namespace_d35b13b1
	Checksum: 0x3FAD58A8
	Offset: 0x780
	Size: 0x68C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_333a7b23(entity)
{
	if(isdefined(entity.attackable) && !isdefined(entity.var_b238ef38))
	{
		if(!isdefined(entity.var_3f8ea75c))
		{
			entity.var_3f8ea75c = namespace_85745671::function_12d90bae(entity, 150, 750, entity.attackable);
		}
		if(isdefined(entity.var_3f8ea75c))
		{
			if(!entity isingoal(entity.var_3f8ea75c))
			{
				entity setgoal(entity.var_3f8ea75c);
				entity waittill(#"goal", #"hash_5114eb062d7568b6");
				if(isdefined(entity.attackable))
				{
					var_bf3a521d = vectortoangles(entity.attackable.origin - entity.origin);
					entity forceteleport(entity.origin, (0, var_bf3a521d[1], 0), 0);
				}
			}
			else if(entity isatgoal())
			{
				var_bf3a521d = entity.attackable.origin - entity.origin;
				var_bf3a521d = vectornormalize(var_bf3a521d);
				if(vectordot(var_bf3a521d, anglestoforward(entity.angles)) < 0.99)
				{
					var_ae7100d7 = vectortoangles(var_bf3a521d);
					entity forceteleport(entity.origin, (0, var_ae7100d7[1], 0), 0);
				}
			}
			return;
		}
	}
	if(is_true(entity.var_1fa24724))
	{
		if(!isdefined(entity.var_ba3e3319))
		{
			entity.var_ba3e3319 = -1;
		}
		enemy = zm_ai_utility::function_825317c(entity);
		if(isdefined(enemy) && distance2dsquared(enemy.origin, entity.origin) < (2250000 * sqr(0.5)))
		{
			if(gettime() > entity.var_ba3e3319)
			{
				entity.var_ba3e3319 = gettime() + (int(1 * 1000));
				var_1f1f9cfa = entity function_4794d6a3();
				var_136a3202 = 0;
				target_point = razbehavior::function_3848e282(enemy);
				if(isdefined(var_1f1f9cfa.goalpos))
				{
					var_a2904933 = entity gettagorigin("tag_weapon_right") - entity.origin;
					if(bullettracepassed(var_1f1f9cfa.goalpos + var_a2904933, target_point, 0, enemy))
					{
						var_136a3202 = 1;
					}
				}
				to_enemy = target_point - entity.origin;
				to_enemy = (to_enemy[0], to_enemy[1], 0);
				to_enemy = vectornormalize(to_enemy);
				if(is_false(var_136a3202))
				{
					dist = distance2d(target_point, entity.origin);
					new_goal = checknavmeshdirection(entity.origin, to_enemy * -1, randomfloat(max(750 - dist, 0)), entity getpathfindingradius() * 1.2);
					entity setgoal(new_goal);
				}
				else if(is_true(var_1f1f9cfa.isatgoal))
				{
					to_enemy_angles = vectortoangles(to_enemy);
					entity forceteleport(entity.origin, (0, to_enemy_angles[1], 0), 0);
				}
			}
			return;
		}
	}
	else
	{
		var_bd871069 = !isdefined(entity.enemy_override) && !isdefined(entity.attackable) || isdefined(entity.var_8a3828c6);
		if(var_bd871069)
		{
			var_1f1f9cfa = entity function_4794d6a3();
			enemy = zm_ai_utility::function_825317c(entity);
			if(is_true(var_1f1f9cfa.isatgoal) && isdefined(enemy))
			{
				to_enemy = enemy.origin - self.origin;
				to_enemy_angles = vectortoangles(to_enemy);
				entity forceteleport(entity.origin, (0, to_enemy_angles[1], 0), 0);
			}
		}
	}
	awareness::function_39da6c3c(entity);
}

/*
	Name: function_9cb1b62f
	Namespace: namespace_d35b13b1
	Checksum: 0xB5206BE2
	Offset: 0xE18
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_9cb1b62f(entity)
{
}

