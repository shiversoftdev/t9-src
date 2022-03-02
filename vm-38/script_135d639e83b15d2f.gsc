#using script_178024232e91b0a1;
#using script_2c5daa95f8fec03c;
#using script_3411bb48d41bd3b;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_4d85e8de54b02198;
#using script_57f7003580bb15e0;
#using script_6809bf766eba194a;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;

#namespace namespace_3b3d42f;

/*
	Name: function_95507df0
	Namespace: namespace_3b3d42f
	Checksum: 0x1A33B4D2
	Offset: 0x500
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_95507df0()
{
	level notify(1858828775);
}

/*
	Name: function_89f2df9
	Namespace: namespace_3b3d42f
	Checksum: 0xD5B3B08D
	Offset: 0x520
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4e5aab38f14a7d66", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3b3d42f
	Checksum: 0x3DB81B8E
	Offset: 0x578
	Size: 0x14C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"hulk", &function_6f88ed29);
	spawner::function_89a2cd87(#"hulk", &function_186bb1f5);
	clientfield::register("toplayer", "hs_hound_toss_damage_cf", 1, 1, "counter");
	clientfield::register("scriptmover", "hs_hound_toss_miss_cf", 1, 1, "counter");
	clientfield::register("scriptmover", "hs_swarm_state", 1, 1, "counter");
	clientfield::register("allplayers", "hs_swarm_damage", 1, 1, "counter");
	/#
		function_95de83c0();
	#/
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_3b3d42f
	Checksum: 0xADB40FDE
	Offset: 0x6D0
	Size: 0x60
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level.var_c54cc49d = [];
	for(i = 0; i < 8; i++)
	{
		level.var_c54cc49d[level.var_c54cc49d.size] = spawn("script_model", (0, 0, 0));
	}
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_3b3d42f
	Checksum: 0xA2269331
	Offset: 0x738
	Size: 0x974
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_e7256e3d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7f00daebd9b421f3", &function_e7256e3d);
	/#
		assert(isscriptfunctionptr(&function_953cead6));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_455714e4f446fb3f", &function_953cead6);
	/#
		assert(isscriptfunctionptr(&function_13fb73f5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_71aaff9a8a017e0f", &function_13fb73f5);
	/#
		assert(isscriptfunctionptr(&function_522388bb));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e0a179c4a41fc7c", &function_522388bb);
	/#
		assert(isscriptfunctionptr(&function_ef24e74d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6cace5110e683e15", &function_ef24e74d);
	/#
		assert(isscriptfunctionptr(&function_43436fbe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_64202248ca017639", &function_43436fbe);
	/#
		assert(isscriptfunctionptr(&function_d952c34e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3095ba7412015625", &function_d952c34e);
	/#
		assert(isscriptfunctionptr(&function_26f2f052));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_26db78524ff4e80f", &function_26f2f052);
	/#
		assert(!isdefined(&function_69a67765) || isscriptfunctionptr(&function_69a67765));
	#/
	/#
		assert(!isdefined(&function_63dfbf49) || isscriptfunctionptr(&function_63dfbf49));
	#/
	/#
		assert(!isdefined(&function_575afe41) || isscriptfunctionptr(&function_575afe41));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_68cd6332b5b82ad8", &function_69a67765, &function_63dfbf49, &function_575afe41);
	/#
		assert(isscriptfunctionptr(&function_aeaf0515));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_659d60284acf5e4d", &function_aeaf0515);
	/#
		assert(isscriptfunctionptr(&function_32ac1e84));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_79a2a707b47c0856", &function_32ac1e84);
	/#
		assert(isscriptfunctionptr(&function_9dfb4775));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_9f7a23f18ddb154", &function_9dfb4775);
	/#
		assert(isscriptfunctionptr(&function_ae66a936));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_69c65ff122868188", &function_ae66a936);
	/#
		assert(isscriptfunctionptr(&function_6d1fdca6));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6fba980db1d1f999", &function_6d1fdca6);
	/#
		assert(isscriptfunctionptr(&function_3962293));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5fb93d2dd4a17db8", &function_3962293);
	/#
		assert(isscriptfunctionptr(&function_2821f047));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7c9fc245e3cb1889", &function_2821f047);
	/#
		assert(isscriptfunctionptr(&function_82ecc6e1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_587648f764f8a972", &function_82ecc6e1);
	/#
		assert(isscriptfunctionptr(&function_fc58de23));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3f96cb4bdf396a03", &function_fc58de23);
	/#
		assert(isscriptfunctionptr(&function_e4520a56));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_541eda78aa7e01b8", &function_e4520a56);
	/#
		assert(isscriptfunctionptr(&function_b80a0830));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_76d11018e877fc89", &function_b80a0830);
	animationstatenetwork::registernotetrackhandlerfunction("stomp", &function_84259878);
	animationstatenetwork::registernotetrackhandlerfunction("hound_toss", &function_8a252ee4);
	animationstatenetwork::registernotetrackhandlerfunction("swarm_spawn", &function_fd09fbc0);
}

/*
	Name: function_6f88ed29
	Namespace: namespace_3b3d42f
	Checksum: 0x769A4210
	Offset: 0x10B8
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6f88ed29()
{
	namespace_81245006::initweakpoints(self);
	aiutility::addaioverridedamagecallback(self, &function_6ad60d9b);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_914f5e7);
	self function_f4ca4a44();
}

/*
	Name: function_186bb1f5
	Namespace: namespace_3b3d42f
	Checksum: 0x80F724D1
	Offset: 0x1148
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_186bb1f5()
{
}

/*
	Name: function_914f5e7
	Namespace: namespace_3b3d42f
	Checksum: 0xDB5FE2C4
	Offset: 0x1158
	Size: 0xA8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_914f5e7()
{
	if(isdefined(self.swarms))
	{
		foreach(swarm in self.swarms)
		{
			if(isdefined(swarm))
			{
				swarm dodamage(swarm.health, self.origin);
			}
		}
	}
}

/*
	Name: function_6ad60d9b
	Namespace: namespace_3b3d42f
	Checksum: 0x6ECD29D7
	Offset: 0x1208
	Size: 0x162
	Parameters: 13
	Flags: Linked, Private
*/
function private function_6ad60d9b(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	damage_type = 1;
	adjusted_damage = dir;
	var_2e1b791b = boneindex;
	var_3cbf9d23 = modelindex;
	weakpoint = namespace_81245006::function_73ab4754(self, offsettime, 1);
	if(isdefined(weakpoint) && weakpoint.var_3765e777 === 1 && aiutility::function_69c2d36f(hitloc))
	{
		damage_type = 2;
		if(weakpoint.var_8223b0cf > 0)
		{
			adjusted_damage = dir * weakpoint.var_8223b0cf;
		}
	}
	self.var_6936b30b = {#hash_ebcff177:damage_type, #weakpoint:weakpoint};
	return adjusted_damage;
}

/*
	Name: function_f4ca4a44
	Namespace: namespace_3b3d42f
	Checksum: 0xB4D1D93A
	Offset: 0x1378
	Size: 0x254
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f4ca4a44()
{
	self function_6d1daa57(ai::function_9139c839().var_939b6e54);
	self function_b439ef43(#"hash_5615713147132e0a", "tag_zombie1_LE", "ai_t9_zm_hulkingsum_attached_zombie_01");
	self function_b439ef43(#"hash_5615703147132c57", "tag_zombie2_LE", "ai_t9_zm_hulkingsum_attached_zombie_02");
	self function_b439ef43(#"hash_56156f3147132aa4", "tag_zombie3_LE", "ai_t9_zm_hulkingsum_attached_zombie_03");
	self function_b439ef43(#"hash_5615713147132e0a", "tag_zombie1_RI", "ai_t9_zm_hulkingsum_attached_zombie_04");
	self function_b439ef43(#"hash_5615703147132c57", "tag_zombie2_RI", "ai_t9_zm_hulkingsum_attached_zombie_05");
	self function_b439ef43(#"hash_56156f3147132aa4", "tag_zombie3_RI", "ai_t9_zm_hulkingsum_attached_zombie_06");
	self function_b439ef43(#"hash_56156e31471328f1", "tag_zombie4_RI", "ai_t9_zm_hulkingsum_attached_zombie_07");
	self.health = 10000;
	self.maxhealth = 10000;
	self.var_4bb1d630 = int(self.maxhealth * 0.01);
	self.var_4e7cb830 = 0;
	self.var_c0300653 = 4;
	self.var_886fb230 = 2;
	self.zombie_count = 0;
	self.ignore_nuke = 1;
	self.var_b72e8ef2 = 1;
	self.var_d345ded2 = gettime() + 2000;
	self function_231f9a1b("hs_phase_melee_wander");
	self thread function_2d3b0724();
}

/*
	Name: function_2d3b0724
	Namespace: namespace_3b3d42f
	Checksum: 0xB7DF376D
	Offset: 0x15D8
	Size: 0x17E
	Parameters: 0
	Flags: Linked
*/
function function_2d3b0724()
{
	self endon(#"death");
	while(true)
	{
		/#
			var_a2f37704 = self gettagorigin("");
			var_1e070ff7 = self gettagangles("");
			var_cecc3404 = anglestoup(var_1e070ff7) * -1;
			var_6805a372 = (var_cecc3404[0], var_cecc3404[1], 0);
			recordstar(var_a2f37704, (0, 1, 1));
			var_12a895c4 = var_a2f37704 + (var_6805a372 * 100);
			recordline(var_a2f37704, var_12a895c4, (0, 1, 0), "", self);
			recordstar(var_12a895c4, (1, 0, 1));
			if(isdefined(self.enemy))
			{
				recordline(var_a2f37704, self.enemy.origin, (1, 0.5, 0), "", self);
			}
		#/
		waitframe(1);
	}
}

/*
	Name: function_6d1daa57
	Namespace: namespace_3b3d42f
	Checksum: 0xD7DB7B87
	Offset: 0x1760
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_6d1daa57(var_cf79a48d)
{
	self.var_1564b717 = var_cf79a48d;
}

/*
	Name: function_231f9a1b
	Namespace: namespace_3b3d42f
	Checksum: 0x5D43157F
	Offset: 0x1788
	Size: 0x62
	Parameters: 1
	Flags: Linked
*/
function function_231f9a1b(var_b4e2431f)
{
	/#
		record3dtext("" + var_b4e2431f, self.origin + vectorscale((0, 0, 1), 10), (0, 1, 0), "");
	#/
	self.var_b4e2431f = var_b4e2431f;
}

/*
	Name: function_20484c37
	Namespace: namespace_3b3d42f
	Checksum: 0xBB0CB3E3
	Offset: 0x17F8
	Size: 0x8E
	Parameters: 0
	Flags: Linked
*/
function function_20484c37()
{
	if(isdefined(self.favoriteenemy))
	{
		predictedpos = self lastknownpos(self.favoriteenemy);
		if(isdefined(predictedpos))
		{
			turnyaw = absangleclamp360(self.angles[1] - (vectortoangles(predictedpos - self.origin)[1]));
			return turnyaw;
		}
	}
	return 0;
}

/*
	Name: function_b439ef43
	Namespace: namespace_3b3d42f
	Checksum: 0xAAA342CC
	Offset: 0x1890
	Size: 0xD4
	Parameters: 3
	Flags: Linked, Private
*/
function private function_b439ef43(model, tag, animname)
{
	tag_origin = self gettagorigin(tag);
	tag_angles = self gettagangles(tag);
	zombie = util::spawn_model(model, tag_origin, tag_angles);
	zombie linkto(self, tag);
	zombie useanimtree("zm_ai_hulk");
	zombie thread function_9175afae(animname);
}

/*
	Name: function_9175afae
	Namespace: namespace_3b3d42f
	Checksum: 0x48481323
	Offset: 0x1970
	Size: 0x86
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9175afae(animname)
{
	self endon(#"death");
	while(true)
	{
		anim_length = getanimlength(animname);
		self animscripted("zombie_torso", self.origin, self.angles, animname, "normal");
		wait(anim_length);
	}
}

/*
	Name: function_11258b29
	Namespace: namespace_3b3d42f
	Checksum: 0x2F1A3C53
	Offset: 0x1A00
	Size: 0xD0
	Parameters: 0
	Flags: Private
*/
function private function_11258b29()
{
	n_spawns = randomintrange(2, 3);
	var_8be21cb = namespace_85745671::function_e4791424(self.origin, 32, 400, 250);
	for(i = 0; i < n_spawns; i++)
	{
		if(isdefined(var_8be21cb[i]))
		{
			ai_spawned = namespace_85745671::function_9d3ad056(#"hash_7cba8a05511ceedf", var_8be21cb[i].origin, self.angles, "hulk_zombie");
		}
		wait(0.1);
	}
}

/*
	Name: function_e7256e3d
	Namespace: namespace_3b3d42f
	Checksum: 0x2A0A682C
	Offset: 0x1AD8
	Size: 0x66
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7256e3d(entity)
{
	if(entity.var_b4e2431f != "hs_phase_melee_wander")
	{
		return false;
	}
	if(!is_true(entity.is_healing))
	{
		if(entity.health < entity.maxhealth)
		{
			entity.var_ea440991 = 1;
		}
	}
}

/*
	Name: function_13fb73f5
	Namespace: namespace_3b3d42f
	Checksum: 0x1CD23DC4
	Offset: 0x1B48
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_13fb73f5(entity)
{
	if(entity.var_b4e2431f != "hs_phase_melee_wander")
	{
		return false;
	}
	if(is_true(entity.var_ea440991))
	{
		return true;
	}
	return false;
}

/*
	Name: function_522388bb
	Namespace: namespace_3b3d42f
	Checksum: 0xCD2B92BC
	Offset: 0x1BA0
	Size: 0xFE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_522388bb(entity)
{
	/#
		if(is_true(entity.var_874bf234))
		{
			return true;
		}
		if(is_true(level.var_ff169fcb))
		{
			return false;
		}
	#/
	if(entity.var_b4e2431f != "hs_phase_melee_wander")
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(!namespace_85745671::is_player_valid(entity.enemy))
	{
		return false;
	}
	dist_sq = distancesquared(entity.origin, entity.enemy.origin);
	if(dist_sq < sqr(300))
	{
		return true;
	}
	return false;
}

/*
	Name: function_ef24e74d
	Namespace: namespace_3b3d42f
	Checksum: 0xD90AFE51
	Offset: 0x1CA8
	Size: 0xB6
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ef24e74d(entity)
{
	if(entity.var_b4e2431f != "hs_phase_melee_wander")
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(!namespace_85745671::is_player_valid(entity.enemy))
	{
		return false;
	}
	dist_sq = distancesquared(entity.origin, entity.enemy.origin);
	if(dist_sq < sqr(360))
	{
		return true;
	}
	return false;
}

/*
	Name: function_43436fbe
	Namespace: namespace_3b3d42f
	Checksum: 0x7B90607D
	Offset: 0x1D68
	Size: 0xEE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_43436fbe(entity)
{
	if(entity.var_b4e2431f != "hs_phase_hound_toss")
	{
		return false;
	}
	if(entity.var_4e7cb830 >= 10)
	{
		return false;
	}
	if(!isdefined(entity.enemy))
	{
		return false;
	}
	if(!namespace_85745671::is_player_valid(entity.enemy))
	{
		return false;
	}
	dist_sq = distancesquared(entity.origin, entity.enemy.origin);
	if(dist_sq < sqr(1800))
	{
		if(dist_sq > sqr(600))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_d952c34e
	Namespace: namespace_3b3d42f
	Checksum: 0x6109FF53
	Offset: 0x1E60
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d952c34e(entity)
{
	if(!is_true(entity.var_b72e8ef2))
	{
		return false;
	}
	if(entity.zombie_count < entity.var_886fb230)
	{
		entity.var_1a9f6f73 = 1;
	}
	if(!is_true(entity.var_1a9f6f73))
	{
		return false;
	}
	if(gettime() < entity.var_d345ded2)
	{
		return false;
	}
	return true;
}

/*
	Name: function_69a67765
	Namespace: namespace_3b3d42f
	Checksum: 0x49E5419
	Offset: 0x1EF0
	Size: 0x60
	Parameters: 2
	Flags: Linked, Private
*/
function private function_69a67765(entity, asmstatename)
{
	entity.is_healing = 1;
	entity.var_b72e8ef2 = 0;
	entity function_76abccf2();
	animationstatenetworkutility::requeststate(entity, asmstatename);
	return 5;
}

/*
	Name: function_76abccf2
	Namespace: namespace_3b3d42f
	Checksum: 0x9CD1349B
	Offset: 0x1F58
	Size: 0x16
	Parameters: 0
	Flags: Linked, Private
*/
function private function_76abccf2()
{
	self.var_f9536ea1 = gettime() + 1000;
}

/*
	Name: function_63dfbf49
	Namespace: namespace_3b3d42f
	Checksum: 0x334405FC
	Offset: 0x1F78
	Size: 0xA0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_63dfbf49(entity, asmstatename)
{
	if(gettime() >= asmstatename.var_f9536ea1)
	{
		if(asmstatename.health < asmstatename.maxhealth)
		{
			asmstatename.health = asmstatename.health + asmstatename.var_4bb1d630;
			asmstatename function_76abccf2();
		}
	}
	if(asmstatename.health >= asmstatename.maxhealth)
	{
		asmstatename.health = asmstatename.maxhealth;
		return 4;
	}
	return 5;
}

/*
	Name: function_575afe41
	Namespace: namespace_3b3d42f
	Checksum: 0x25F58A94
	Offset: 0x2020
	Size: 0x3A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_575afe41(entity, asmstatename)
{
	asmstatename.is_healing = 0;
	asmstatename.var_b72e8ef2 = 1;
	asmstatename.var_ea440991 = 0;
	return 4;
}

/*
	Name: function_aeaf0515
	Namespace: namespace_3b3d42f
	Checksum: 0xC5246061
	Offset: 0x2068
	Size: 0x66
	Parameters: 1
	Flags: Linked, Private
*/
function private function_aeaf0515(entity)
{
	entity.var_b72e8ef2 = 0;
	entity pathmode("dont move");
	entity.start_pos = entity gettagorigin("j_pocketdown4_le");
	entity.deltas = [];
}

/*
	Name: function_32ac1e84
	Namespace: namespace_3b3d42f
	Checksum: 0xB5064A73
	Offset: 0x20D8
	Size: 0x264
	Parameters: 1
	Flags: Linked, Private
*/
function private function_32ac1e84(entity)
{
	if(is_true(entity.var_8436cae5))
	{
		return;
	}
	var_1b0f41cd = entity gettagorigin("j_pocketdown4_le");
	if(isdefined(var_1b0f41cd))
	{
		if(isdefined(entity.start_pos))
		{
			dist = distance(entity.start_pos, var_1b0f41cd);
			entity.deltas[entity.deltas.size] = dist;
			entity.start_pos = var_1b0f41cd;
		}
		enemy = entity.favoriteenemy;
		if(isdefined(enemy))
		{
			dist_sq = distancesquared(var_1b0f41cd, enemy.origin);
			if(dist_sq < sqr(100))
			{
				entity namespace_85745671::function_a7a7d0b2(100);
				entity.var_8436cae5 = 1;
				/#
					recordsphere(var_1b0f41cd, 25, (1, 0, 0), "");
					recordsphere(enemy.origin, 25, (0, 0, 1), "");
				#/
				enemy playerknockback(1);
				var_cbc73ac4 = anglestoup(entity gettagangles("j_pocketdown4_le")) * -1;
				var_3090e649 = vectornormalize(var_cbc73ac4);
				var_3090e649 = (var_3090e649[0], var_3090e649[1], 0.1);
				enemy applyknockback(200, var_3090e649);
				enemy playerknockback(0);
			}
		}
	}
}

/*
	Name: function_9dfb4775
	Namespace: namespace_3b3d42f
	Checksum: 0xB0D69485
	Offset: 0x2348
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9dfb4775(entity)
{
	entity.var_b72e8ef2 = 1;
	entity pathmode("move allowed");
	entity.var_8436cae5 = 0;
}

/*
	Name: function_ae66a936
	Namespace: namespace_3b3d42f
	Checksum: 0x11500D78
	Offset: 0x2390
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ae66a936(entity)
{
	entity.var_b72e8ef2 = 0;
}

/*
	Name: function_6d1fdca6
	Namespace: namespace_3b3d42f
	Checksum: 0x7FDDF22E
	Offset: 0x23B0
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6d1fdca6(entity)
{
	entity.var_b72e8ef2 = 1;
}

/*
	Name: function_84259878
	Namespace: namespace_3b3d42f
	Checksum: 0xF940EE16
	Offset: 0x23D8
	Size: 0x34
	Parameters: 1
	Flags: Linked, Private
*/
function private function_84259878(entity)
{
	stomp = 1;
	entity thread function_444faea1();
}

/*
	Name: function_444faea1
	Namespace: namespace_3b3d42f
	Checksum: 0xBEA805D4
	Offset: 0x2418
	Size: 0xF6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_444faea1()
{
	self endon(#"death");
	nearby_players = getentitiesinradius(self.origin, 360, 1);
	foreach(player in nearby_players)
	{
		if(!zm_utility::is_player_valid(player))
		{
			continue;
		}
		player dodamage(200, self.origin, self, self);
		waitframe(1);
	}
}

/*
	Name: function_82ecc6e1
	Namespace: namespace_3b3d42f
	Checksum: 0x4D8E1B12
	Offset: 0x2518
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_82ecc6e1(entity)
{
}

/*
	Name: function_fc58de23
	Namespace: namespace_3b3d42f
	Checksum: 0xB82DC99D
	Offset: 0x2530
	Size: 0x6C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fc58de23(entity)
{
	if(entity.zombie_count >= entity.var_c0300653)
	{
		return;
	}
	if(!is_true(entity.var_a74e60ad))
	{
		if(gettime() >= entity.var_d345ded2)
		{
			entity thread function_53660c1e();
		}
	}
}

/*
	Name: function_53660c1e
	Namespace: namespace_3b3d42f
	Checksum: 0x6F4CE90E
	Offset: 0x25A8
	Size: 0xF6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_53660c1e()
{
	self endon(#"death");
	self.var_a74e60ad = 1;
	self.zombie_count++;
	var_8be21cb = namespace_85745671::function_e4791424(self.origin, 32, 400, 250);
	if(isdefined(var_8be21cb[0]))
	{
		ai_spawned = namespace_85745671::function_9d3ad056(#"hash_7cba8a05511ceedf", var_8be21cb[0].origin, self.angles, "hulk_zombie");
		if(isdefined(ai_spawned))
		{
			ai_spawned thread function_5f9f594(self);
		}
		else
		{
			self.zombie_count--;
		}
	}
	self.var_a74e60ad = 0;
	self.var_d345ded2 = gettime() + 2000;
}

/*
	Name: function_5f9f594
	Namespace: namespace_3b3d42f
	Checksum: 0xBE4CBC7E
	Offset: 0x26A8
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5f9f594(entity)
{
	entity endon(#"death");
	self waittill(#"death");
	if(entity.zombie_count > 0)
	{
		entity.zombie_count--;
	}
}

/*
	Name: function_3962293
	Namespace: namespace_3b3d42f
	Checksum: 0x81F9F7C9
	Offset: 0x2708
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3962293(entity)
{
	entity.var_b72e8ef2 = 0;
}

/*
	Name: function_2821f047
	Namespace: namespace_3b3d42f
	Checksum: 0x1D52ADB8
	Offset: 0x2728
	Size: 0x1A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2821f047(entity)
{
	entity.var_b72e8ef2 = 1;
}

/*
	Name: function_8a252ee4
	Namespace: namespace_3b3d42f
	Checksum: 0xEE64F5DA
	Offset: 0x2750
	Size: 0x434
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8a252ee4(entity)
{
	if(!isactor(entity) || !isdefined(entity.favoriteenemy))
	{
		return;
	}
	targetpos = entity.favoriteenemy.origin;
	launchpos = entity gettagorigin("j_clubhole7");
	var_ad804014 = 25;
	if(distancesquared(targetpos, entity.origin) > sqr(250))
	{
		velocity = entity.favoriteenemy getvelocity();
		targetpos = targetpos + (velocity * 0.5);
		var_a76a363d = math::randomsign() * randomint(var_ad804014);
		var_9b241db1 = math::randomsign() * randomint(var_ad804014);
		targetpos = targetpos + (var_a76a363d, var_9b241db1, 0);
		speed = length(velocity);
		if(speed > 0)
		{
			var_7ee6937e = vectornormalize((targetpos[0], targetpos[1], 0) - (launchpos[0], launchpos[1], 0));
			dot = vectordot(-1 * var_7ee6937e, velocity / speed);
			if(dot >= 0.8)
			{
				targetpos = targetpos + (((var_7ee6937e * dot) * speed) * 0.5);
			}
		}
	}
	targetpos = targetpos + vectorscale((0, 0, 1), 36);
	var_872c6826 = vectortoangles(targetpos - launchpos);
	angles = function_cc68801f(launchpos, targetpos, 1110, getdvarfloat(#"bg_lowgravity", 0));
	if(isdefined(angles) && angles[#"hash_1d5798eaa3bed36c"] > 0)
	{
		dir = anglestoforward((-1 * angles[#"hash_1d5798eaa3bed36c"], var_872c6826[1], var_872c6826[2]));
	}
	else
	{
		dir = anglestoforward(var_872c6826);
	}
	velocity = dir * 1110;
	var_1a3b2274 = "hulk_hound_toss_projectile";
	var_ed782d5 = getweapon(var_1a3b2274);
	endpos = entity.favoriteenemy.origin;
	projectile = magicbullet(var_ed782d5, launchpos, endpos, entity, entity.favoriteenemy);
	projectile.dog_model = util::spawn_model("c_t9_zmb_hellhound1", projectile.origin, projectile.angles);
	projectile.dog_model linkto(projectile);
	projectile thread function_7d162bd0(projectile, entity);
}

/*
	Name: function_7d162bd0
	Namespace: namespace_3b3d42f
	Checksum: 0xFCD6D1D
	Offset: 0x2B90
	Size: 0x18C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_7d162bd0(projectile, entity)
{
	projectile endon(#"spear_death");
	result = undefined;
	result = projectile waittill(#"projectile_impact_player", #"death");
	if(isdefined(projectile.dog_model))
	{
		projectile.dog_model deletedelay();
	}
	if(result._notify != "projectile_impact_player")
	{
		var_b12a43cc = function_a1fce938();
		if(isdefined(var_b12a43cc))
		{
			if(isdefined(projectile.origin))
			{
				var_b12a43cc.origin = projectile.origin;
			}
			else if(isdefined(entity) && isdefined(entity.favoriteenemy))
			{
				var_b12a43cc.origin = entity.favoriteenemy.origin;
			}
			util::wait_network_frame();
			var_b12a43cc clientfield::increment("hs_hound_toss_miss_cf");
			wait(0.25);
			var_b12a43cc.in_use = 0;
		}
	}
	else if(isdefined(result.player))
	{
		result.player clientfield::increment_to_player("hs_hound_toss_damage_cf");
	}
}

/*
	Name: function_a1fce938
	Namespace: namespace_3b3d42f
	Checksum: 0xFB63A6C1
	Offset: 0x2D28
	Size: 0xA6
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a1fce938()
{
	foreach(var_b12a43cc in level.var_c54cc49d)
	{
		if(!is_true(var_b12a43cc.in_use))
		{
			var_b12a43cc.in_use = 1;
			return var_b12a43cc;
		}
	}
	return undefined;
}

/*
	Name: function_26f2f052
	Namespace: namespace_3b3d42f
	Checksum: 0x1C7FA2A2
	Offset: 0x2DD8
	Size: 0x3E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_26f2f052(entity)
{
	if(!is_true(entity.var_b4e2431f === "hs_phase_swarm_spawn"))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e4520a56
	Namespace: namespace_3b3d42f
	Checksum: 0xBE551E99
	Offset: 0x2E20
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e4520a56(entity)
{
	entity.var_f01add23 = 0;
}

/*
	Name: function_fd09fbc0
	Namespace: namespace_3b3d42f
	Checksum: 0x4E4A0141
	Offset: 0x2E40
	Size: 0x10C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fd09fbc0(entity)
{
	/#
		assert(isdefined(entity.var_f01add23), "");
	#/
	n_players = getplayers().size;
	var_fc398f5e = n_players * 2;
	var_8214bfd5 = (floor(var_fc398f5e / 4)) + (3 - entity.var_f01add23 < var_fc398f5e % 4 ? 1 : 0);
	entity.var_f01add23 = entity.var_f01add23 + 1;
	for(i = 0; i < var_8214bfd5; i++)
	{
		function_eceecc98(entity);
		wait(0.25);
	}
}

/*
	Name: function_b80a0830
	Namespace: namespace_3b3d42f
	Checksum: 0xF78E2F9F
	Offset: 0x2F58
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b80a0830(entity)
{
	self function_231f9a1b("hs_phase_melee_wander");
}

/*
	Name: function_eceecc98
	Namespace: namespace_3b3d42f
	Checksum: 0xF1B6D9AF
	Offset: 0x2F90
	Size: 0x17C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_eceecc98(var_66a3d186)
{
	origin = (0, 0, 0);
	if(isdefined(var_66a3d186))
	{
		origin = vectorlerp(var_66a3d186 gettagorigin("j_shoulder_le"), var_66a3d186 gettagorigin("j_shoulder_ri"), 0.5);
	}
	swarm = util::spawn_model(#"hash_7a7aadfb584e0859", origin);
	swarm.var_66a3d186 = var_66a3d186;
	if(isdefined(var_66a3d186))
	{
		if(!isdefined(var_66a3d186.swarms))
		{
			var_66a3d186.swarms = [];
		}
		if(!isdefined(var_66a3d186.swarms))
		{
			var_66a3d186.swarms = [];
		}
		else if(!isarray(var_66a3d186.swarms))
		{
			var_66a3d186.swarms = array(var_66a3d186.swarms);
		}
		var_66a3d186.swarms[var_66a3d186.swarms.size] = swarm;
	}
	swarm thread function_187bcbe();
	swarm thread function_e57b9f29();
}

/*
	Name: function_187bcbe
	Namespace: namespace_3b3d42f
	Checksum: 0x6D6B1AC4
	Offset: 0x3118
	Size: 0x8F2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_187bcbe()
{
	self endon(#"death");
	self.var_88b20e7f = 60;
	self.target_ent = undefined;
	self.var_a7882c19 = 0;
	if(isdefined(self.var_66a3d186))
	{
		var_b048de07 = vectorlerp(self.var_66a3d186 gettagorigin("j_head_mouth1"), self.var_66a3d186 gettagorigin("j_head_mouth5"), 0.5);
		launch_dir = vectornormalize(var_b048de07 - self.origin);
		self moveto(self.origin + (launch_dir * 100), 0.25);
		wait(0.25);
		self moveto(self.origin + (launch_dir * 100), 2, 0, 1.5);
		wait(2);
	}
	while(true)
	{
		clockwise = 1;
		var_2f769fb1 = (0, 0, 0);
		var_2d0b175 = 0;
		var_f6107d1 = self.origin;
		self.var_88b20e7f = min(self.var_88b20e7f, 60);
		while(true)
		{
			if(isdefined(self.var_66a3d186))
			{
				var_2f769fb1 = self.var_66a3d186 gettagorigin("j_head");
			}
			var_f6107d1 = (self.origin[0], self.origin[1], var_2f769fb1[2] + (sin(var_2d0b175) * 100));
			var_2d0b175 = var_2d0b175 + 0.02;
			dir_to_target = vectornormalize(var_2f769fb1 - var_f6107d1);
			var_c4fa78f6 = -1 * dir_to_target * 200 + var_2f769fb1;
			/#
				if(getdvarint(#"hash_7b1300b093008e51", 0) > 0)
				{
					debugstar(var_c4fa78f6, 20, (0, 1, 0));
				}
			#/
			var_8e05c13a = (0, 0, clockwise);
			var_dc77dd5c = vectorcross(dir_to_target, var_8e05c13a);
			target_pos = var_c4fa78f6 + (var_dc77dd5c * self.var_88b20e7f);
			self function_c9bcf1cb(target_pos);
			if(gettime() > self.var_a7882c19)
			{
				if(isdefined(self.var_66a3d186))
				{
					self.target_ent = self.var_66a3d186 function_ae1ac363();
				}
				else
				{
					self.target_ent = self function_ae1ac363();
				}
				if(isdefined(self.target_ent))
				{
					break;
				}
			}
		}
		to_target = undefined;
		var_1f2ee4ae = distance2d(self.origin, self.target_ent.origin);
		var_584124bc = self.origin;
		var_c0500b76 = (randomint(2) - 0.5) * 2;
		while(true)
		{
			var_2f769fb1 = self.target_ent.origin + vectorscale((0, 0, 1), 70);
			to_target = vectornormalize(var_2f769fb1 - self.origin);
			target_pos = (to_target * self.var_88b20e7f) + self.origin;
			self.var_88b20e7f = min(self.var_88b20e7f + 0.1, 100);
			target_pos = target_pos + function_d321dcc8(1, to_target);
			target_pos = target_pos + (function_d321dcc8(-1, to_target));
			target_pos = target_pos + function_4e15ba87(var_2f769fb1);
			target_pos = target_pos + function_3a260c9e(var_c0500b76, to_target, var_584124bc, var_1f2ee4ae);
			if(self function_c9bcf1cb(var_2f769fb1, 60, target_pos))
			{
				break;
			}
			if(!zombie_utility::is_player_valid(self.target_ent, 1, 1))
			{
				self.target_ent = undefined;
				break;
			}
		}
		if(isdefined(self.target_ent) && isplayer(self.target_ent))
		{
			params = function_4d1e7b48("dot_molotov_hulk_fireball");
			self.target_ent status_effect::status_effect_apply(params, undefined, self, 0, undefined, undefined, self.origin);
			self.target_ent clientfield::increment("hs_swarm_damage", 1);
			health_frac = self.health / self.maxhealth;
			self.target_ent dodamage(100 * health_frac, self.origin, undefined, undefined, "none", "MOD_EXPLOSIVE");
			self deletedelay();
		}
		var_dd660bcf = 6;
		for(i = 0; i < var_dd660bcf; i++)
		{
			if(zombie_utility::is_player_valid(self.target_ent, 1, 1))
			{
				self moveto(self.target_ent geteye(), 0.2);
			}
			wait(0.2);
		}
		self.var_88b20e7f = 60;
		var_2f769fb1 = (0, 0, 0);
		var_584124bc = self.origin;
		while(true)
		{
			if(isdefined(self.var_66a3d186))
			{
				var_2f769fb1 = self.var_66a3d186 gettagorigin("j_head");
			}
			self.var_88b20e7f = min(self.var_88b20e7f + 0.1, 100);
			to_target = vectornormalize(var_2f769fb1 - (self.origin[0], self.origin[1], var_2f769fb1[2]));
			var_c4fa78f6 = var_2f769fb1 - (to_target * 200);
			target_pos = ((vectornormalize(var_c4fa78f6 - self.origin)) * self.var_88b20e7f) + self.origin;
			target_pos = target_pos + function_4e15ba87(var_2f769fb1);
			target_pos = target_pos + function_3a260c9e(var_c0500b76, to_target, var_584124bc, var_1f2ee4ae);
			if(self function_c9bcf1cb(var_2f769fb1, 200, target_pos))
			{
				break;
			}
		}
		self.var_a7882c19 = gettime() + (int(5 * 1000));
	}
}

/*
	Name: function_d321dcc8
	Namespace: namespace_3b3d42f
	Checksum: 0x240EDCD4
	Offset: 0x3A18
	Size: 0x1C8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_d321dcc8(var_af0000ca, to_target)
{
	var_817b26d2 = var_af0000ca;
	var_dc77dd5c = vectorcross(to_target, (0, 0, var_817b26d2));
	var_d01d9a4b = (to_target * 100) + (var_dc77dd5c * 100) + self.origin;
	bullet_trace = bullettrace(self.origin, var_d01d9a4b, 0, self);
	fraction = bullet_trace[#"fraction"];
	result = (0, 0, 0);
	if(fraction > 0 && fraction < 1)
	{
		result = (var_dc77dd5c * -1) * (1 - fraction) * self.var_88b20e7f;
	}
	/#
		if(getdvarint(#"hash_7b1300b093008e51", 0) > 0)
		{
			recordline(self.origin, var_d01d9a4b, (1, 1, 0));
			if(fraction > 0 && fraction < 1)
			{
				debugstar(((vectornormalize(var_d01d9a4b - self.origin)) * fraction) + self.origin, 20, (1, 0, 0));
			}
		}
	#/
	return result;
}

/*
	Name: function_4e15ba87
	Namespace: namespace_3b3d42f
	Checksum: 0x59FAC794
	Offset: 0x3BE8
	Size: 0xB8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4e15ba87(var_2f769fb1)
{
	delta_z = var_2f769fb1[2] - self.origin[2];
	multiplier = 0.05;
	var_22570ba9 = (0, 0, delta_z * multiplier);
	/#
		if(getdvarint(#"hash_7b1300b093008e51", 0) > 0)
		{
			recordline(self.origin, self.origin + var_22570ba9, (1, 0, 1));
		}
	#/
	return var_22570ba9;
}

/*
	Name: function_3a260c9e
	Namespace: namespace_3b3d42f
	Checksum: 0x92096BBF
	Offset: 0x3CA8
	Size: 0x178
	Parameters: 4
	Flags: Linked, Private
*/
function private function_3a260c9e(var_af0000ca, to_target, spawn_pos, var_93b101fe)
{
	var_815a5910 = distance2d(self.origin, spawn_pos);
	var_269a05 = var_93b101fe * 0.5;
	if(var_815a5910 > var_269a05)
	{
		return (0, 0, 0);
	}
	t = var_815a5910 / var_269a05;
	var_500bdd34 = pow(100, -1 * (pow(t - 0.5, 2)));
	var_dc77dd5c = vectorcross(to_target, (0, 0, var_af0000ca));
	var_9e760d8e = 50;
	var_22570ba9 = (var_dc77dd5c * var_9e760d8e) * var_500bdd34;
	/#
		if(getdvarint(#"hash_7b1300b093008e51", 0) > 0)
		{
			recordline(self.origin, self.origin + var_22570ba9, (0, 0, 1));
		}
	#/
	return var_22570ba9;
}

/*
	Name: function_c9bcf1cb
	Namespace: namespace_3b3d42f
	Checksum: 0xBECC7C67
	Offset: 0x3E28
	Size: 0x12A
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c9bcf1cb(var_2f769fb1, var_1f14bda8, var_4717cb50)
{
	self endon(#"death");
	if(!isdefined(var_4717cb50))
	{
		var_4717cb50 = var_2f769fb1;
	}
	target_pos = ((vectornormalize(var_4717cb50 - self.origin)) * self.var_88b20e7f) + self.origin;
	self moveto(target_pos, 0.2);
	waitresult = undefined;
	waitresult = self waittilltimeout(0.2, #"movedone");
	if(waitresult._notify === "movedone")
	{
		return true;
	}
	if(isdefined(var_1f14bda8) && distancesquared(var_2f769fb1, self.origin) < sqr(var_1f14bda8))
	{
		return true;
	}
	return false;
}

/*
	Name: function_953cead6
	Namespace: namespace_3b3d42f
	Checksum: 0xE45879CE
	Offset: 0x3F60
	Size: 0x2A0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_953cead6(entity)
{
	if(!isdefined(entity.swarms) || entity.swarms.size === 0)
	{
		return;
	}
	entity.var_9cf16573 = [];
	players = function_a1ef346b();
	var_b6e967f9 = arraysortclosest(players, entity gettagorigin("j_head"));
	foreach(player in var_b6e967f9)
	{
		if(zombie_utility::is_player_valid(player, 1, 1))
		{
			if(issentient(entity) && !self cansee(player) && entity.enemy !== player)
			{
				continue;
			}
			if(isdefined(entity.swarms))
			{
				var_ebfb164 = 0;
				foreach(swarm in entity.swarms)
				{
					if(isdefined(swarm.target_ent) && swarm.target_ent == player)
					{
						var_ebfb164 = 1;
						break;
					}
				}
				if(var_ebfb164)
				{
					continue;
				}
			}
			if(!isdefined(self.var_9cf16573))
			{
				self.var_9cf16573 = [];
			}
			else if(!isarray(self.var_9cf16573))
			{
				self.var_9cf16573 = array(self.var_9cf16573);
			}
			self.var_9cf16573[self.var_9cf16573.size] = player;
		}
	}
}

/*
	Name: function_ae1ac363
	Namespace: namespace_3b3d42f
	Checksum: 0xE5105282
	Offset: 0x4208
	Size: 0x52
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ae1ac363()
{
	if(!isdefined(self.var_9cf16573) || self.var_9cf16573.size === 0)
	{
		return;
	}
	target_player = array::pop_front(self.var_9cf16573);
	return target_player;
}

/*
	Name: function_e57b9f29
	Namespace: namespace_3b3d42f
	Checksum: 0x5AE08A6F
	Offset: 0x4268
	Size: 0xD8
	Parameters: 0
	Flags: Linked
*/
function function_e57b9f29()
{
	self endon(#"death", #"end_game");
	self.takedamage = 1;
	self.maxhealth = 360;
	self.health = 360;
	self clientfield::increment("hs_swarm_state", 1);
	self thread function_51d2e478();
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(self.health <= 0)
		{
			self deletedelay();
		}
	}
}

/*
	Name: function_51d2e478
	Namespace: namespace_3b3d42f
	Checksum: 0x97B48B0E
	Offset: 0x4348
	Size: 0x6E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_51d2e478()
{
	self endon(#"death", #"end_game");
	while(isdefined(self))
	{
		self.health = self.health - 6;
		self util::damage_notify_wrapper(6, self);
		wait(1);
	}
}

/*
	Name: function_95de83c0
	Namespace: namespace_3b3d42f
	Checksum: 0x8A1CC766
	Offset: 0x43C0
	Size: 0x124
	Parameters: 0
	Flags: None
*/
function function_95de83c0()
{
	/#
		function_5ac4dc99(#"hash_fed990cce44eb15", "");
		function_cd140ee9(#"hash_fed990cce44eb15", &function_f895e0b0);
		util::function_345e5b9a(((("" + "") + "") + "") + "");
		util::function_345e5b9a(((("" + "") + "") + "") + "");
		util::function_345e5b9a(((("" + "") + "") + "") + "");
	#/
}

/*
	Name: function_f895e0b0
	Namespace: namespace_3b3d42f
	Checksum: 0xC7F80BC8
	Offset: 0x44F0
	Size: 0x11C
	Parameters: 1
	Flags: None
*/
function function_f895e0b0(dvar)
{
	/#
		switch(dvar.value)
		{
			case "hash_3d3ff098d35dcb64":
			{
				level thread function_3bd44cc0();
				break;
			}
			case "hash_5da8b927b9a8507c":
			{
				function_1344db5f();
				break;
			}
			case "hash_340aa006a74a3adc":
			{
				array::run_all(getaiarchetypearray(#"hulk"), &function_231f9a1b, "");
				break;
			}
			case 0:
			{
				return;
			}
		}
		setdvar(#"hash_fed990cce44eb15", "");
	#/
}

/*
	Name: function_3bd44cc0
	Namespace: namespace_3b3d42f
	Checksum: 0x3D543B5F
	Offset: 0x4618
	Size: 0x30
	Parameters: 0
	Flags: None
*/
function function_3bd44cc0()
{
	/#
		level.var_ff169fcb = !is_true(level.var_ff169fcb);
	#/
}

/*
	Name: function_1344db5f
	Namespace: namespace_3b3d42f
	Checksum: 0xC4652363
	Offset: 0x4650
	Size: 0xDC
	Parameters: 0
	Flags: None
*/
function function_1344db5f()
{
	/#
		var_72980fe1 = getaiarchetypearray(#"hulk");
		if(isdefined(var_72980fe1))
		{
			foreach(hulk in var_72980fe1)
			{
				level thread function_eceecc98(hulk);
			}
		}
		else
		{
			level thread function_eceecc98();
		}
	#/
}

