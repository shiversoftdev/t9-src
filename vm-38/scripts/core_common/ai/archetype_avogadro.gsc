#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_41fe08c37d53a635;
#using script_2c5daa95f8fec03c;
#using scripts\abilities\gadgets\gadget_jammer_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_caf007e2a98afa2;
#using script_4d85e8de54b02198;
#using script_4bf952f6ba31bb17;
#using script_59f07c660e6710a5;
#using script_7b7ed6e4bc963a51;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace archetype_avogadro;

/*
	Name: function_e0643c0f
	Namespace: archetype_avogadro
	Checksum: 0x63B17177
	Offset: 0x398
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e0643c0f()
{
	level notify(985446327);
}

/*
	Name: __init__system__
	Namespace: archetype_avogadro
	Checksum: 0xE5D34EFD
	Offset: 0x3B8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"archetype_avogadro", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: archetype_avogadro
	Checksum: 0x35461C59
	Offset: 0x410
	Size: 0x1E4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	registerbehaviorscriptfunctions();
	clientfield::register("missile", "" + #"hash_699d5bb1a9339a93", 1, 2, "int");
	clientfield::register("actor", "" + #"hash_4466de6137f54b59", 1, 1, "int");
	clientfield::register("actor", "" + #"hash_2eec8fc21495a18c", 1, 2, "int");
	clientfield::register("scriptmover", "" + #"hash_183ef3538fd62563", 1, 1, "int");
	clientfield::register("scriptmover", "avogadro_phase_beam", 1, getminbitcountfornum(3), "int");
	spawner::add_archetype_spawn_function(#"avogadro", &function_ee579eb5);
	spawner::function_89a2cd87(#"avogadro", &function_d1359818);
	callback::on_player_damage(&function_99ce086a);
	function_5ca95b95();
}

/*
	Name: function_8ac3bea9
	Namespace: archetype_avogadro
	Checksum: 0x21C5FF89
	Offset: 0x600
	Size: 0x2C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level.var_2ea60515 = getstatuseffect(#"hash_3a1f530cdb5f75f4");
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: archetype_avogadro
	Checksum: 0x355C76F9
	Offset: 0x638
	Size: 0x874
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_f8e8c129));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_520d52c557d9427", &function_f8e8c129);
	/#
		assert(isscriptfunctionptr(&function_7e5905cd));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3a8b7da6a91d85f3", &function_7e5905cd);
	/#
		assert(isscriptfunctionptr(&function_1169b184));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3e8335833e76fa0e", &function_1169b184);
	/#
		assert(isscriptfunctionptr(&function_afa4bed6));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_34a6a91002379d9e", &function_afa4bed6);
	/#
		assert(isscriptfunctionptr(&function_e7e003b0));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_351e1f4e4e8beb5", &function_e7e003b0);
	/#
		assert(isscriptfunctionptr(&function_14e1e2c8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e90b07558cc9b1b", &function_14e1e2c8);
	/#
		assert(isscriptfunctionptr(&function_9ab1c000));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1d3ff4cb570ac40", &function_9ab1c000);
	/#
		assert(isscriptfunctionptr(&function_3b8d314c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_75ba4163e4512e01", &function_3b8d314c);
	/#
		assert(isscriptfunctionptr(&function_ceeb405));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2cca123cff468ca8", &function_ceeb405);
	/#
		assert(isscriptfunctionptr(&function_b57de57a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2992bf38eb0ecb9c", &function_b57de57a);
	/#
		assert(isscriptfunctionptr(&function_36f6a838));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_14db413a212246df", &function_36f6a838);
	/#
		assert(isscriptfunctionptr(&function_d58f8483));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_42901d14fb88f316", &function_d58f8483);
	/#
		assert(isscriptfunctionptr(&function_5ce54900));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_177974191a99d4ac", &function_5ce54900);
	/#
		assert(isscriptfunctionptr(&function_77788917));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6220b20470033c72", &function_77788917);
	/#
		assert(isscriptfunctionptr(&function_c83209ee));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_ebc4b27b9d85561", &function_c83209ee);
	/#
		assert(isscriptfunctionptr(&function_f14292cf));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6955957f9e1d47a3", &function_f14292cf);
	/#
		assert(isscriptfunctionptr(&function_b411d93));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4bb168e1b80acaed", &function_b411d93);
	/#
		assert(isscriptfunctionptr(&function_a495d71f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_49880776aa68a310", &function_a495d71f, 1);
	/#
		assert(isscriptfunctionptr(&function_a495d71f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2b76cd8d945e7de7", &function_a495d71f, 1);
	animationstatenetwork::registernotetrackhandlerfunction("avogadro_shoot_bolt", &shoot_bolt_wait);
	animationstatenetwork::registeranimationmocomp("avogadro_tactical_walk@avogadro", &function_bc2f2686, &function_bc2f2686, undefined);
	animationstatenetwork::registeranimationmocomp("mocomp_traversal_teleport@avogadro", &function_9f3a10a4, &function_4cf6a31d, &function_7b70bdbe);
}

/*
	Name: function_ee579eb5
	Namespace: archetype_avogadro
	Checksum: 0x2CFBFA55
	Offset: 0xEB8
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_ee579eb5()
{
	self callback::function_d8abfc3d(#"on_actor_damage", &function_50a86206);
	self.shield = 1;
	self.hit_by_melee = 0;
	self.phase_time = 0;
	self.var_1ce249af = 0;
	self.var_15aa1ae0 = 2000;
	self.var_f3bbe853 = 1;
	self.var_fc782c29 = 0;
	self.var_b4ca9f11 = gettime();
	self.var_7fde19e8 = 0;
	self.var_9bff71aa = 0;
	self.var_696e2d53 = 0;
	self.var_e3b6f14a = 1;
	self.var_58c4c69b = 1;
	self thread function_f6aed42d();
	self function_8a404313();
}

/*
	Name: function_8a404313
	Namespace: archetype_avogadro
	Checksum: 0x9D80E5AE
	Offset: 0xFC0
	Size: 0x4A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8a404313()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_c7791d22;
}

/*
	Name: function_c7791d22
	Namespace: archetype_avogadro
	Checksum: 0x44817787
	Offset: 0x1018
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c7791d22(entity)
{
	entity.__blackboard = undefined;
	entity function_8a404313();
}

/*
	Name: function_d1359818
	Namespace: archetype_avogadro
	Checksum: 0x1D8D9019
	Offset: 0x1050
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function function_d1359818()
{
	function_dbc638a8(self);
	namespace_81245006::initweakpoints(self);
	self attach("c_t9_zmb_avogadro_ribcage");
	self destructserverutils::togglespawngibs(self, 1);
	self.var_318a0ac8 = &function_29c1ba76;
}

/*
	Name: function_99ce086a
	Namespace: archetype_avogadro
	Checksum: 0x62F0A352
	Offset: 0x10E0
	Size: 0x64
	Parameters: 12
	Flags: Linked
*/
function function_99ce086a(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
}

/*
	Name: function_dbc638a8
	Namespace: archetype_avogadro
	Checksum: 0x50E51577
	Offset: 0x1150
	Size: 0xCC
	Parameters: 1
	Flags: Linked
*/
function function_dbc638a8(entity)
{
	health_ratio = entity.health / entity.maxhealth;
	health_ratio = int(health_ratio * 100);
	var_f8c4006a = 3;
	if(health_ratio <= 33)
	{
		var_f8c4006a = 1;
	}
	else if(health_ratio <= 67 && health_ratio > 33)
	{
		var_f8c4006a = 2;
	}
	entity clientfield::set("" + #"hash_2eec8fc21495a18c", var_f8c4006a);
}

/*
	Name: function_50a86206
	Namespace: archetype_avogadro
	Checksum: 0x391E1469
	Offset: 0x1228
	Size: 0xDE
	Parameters: 1
	Flags: Linked
*/
function function_50a86206(params)
{
	if(!isdefined(self.var_fc782c29) || !isdefined(self.var_b4ca9f11) || self.var_b4ca9f11 < gettime())
	{
		self.var_fc782c29 = 0;
		self.var_b4ca9f11 = gettime() + 2000;
	}
	self.var_fc782c29 = self.var_fc782c29 + params.idamage;
	function_dbc638a8(self);
	if(params.smeansofdeath === "MOD_BURNED")
	{
		self.var_d444767 = gettime();
	}
	if(!isdefined(params.smeansofdeath) || params.smeansofdeath !== "MOD_BURNED")
	{
		self notify(#"hash_114f53e963b59106");
	}
}

/*
	Name: function_29c1ba76
	Namespace: archetype_avogadro
	Checksum: 0xF12F59A4
	Offset: 0x1310
	Size: 0x394
	Parameters: 13
	Flags: Linked
*/
function function_29c1ba76(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	self.var_426947c4 = undefined;
	var_ebcff177 = 1;
	if(namespace_81245006::hasarmor(self) && (psoffsettime === "MOD_PROJECTILE_SPLASH" || psoffsettime === "MOD_GRENADE_SPLASH" || psoffsettime == "MOD_EXPLOSIVE"))
	{
		var_3cddb028 = 0.5 * shitloc;
		var_31e96b81 = int(var_3cddb028);
		foreach(weakpoint in self.var_5ace757d)
		{
			if(weakpoint.type === #"armor" && weakpoint.currstate === 1)
			{
				namespace_81245006::function_ef87b7e8(weakpoint, var_31e96b81);
				if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
				{
					destructserverutils::function_8475c53a(self, weakpoint.var_f371ebb0);
					self.var_426947c4 = 1;
				}
			}
		}
	}
	weakpoint = namespace_81245006::function_3131f5dd(self, surfacetype, 1);
	if(!isdefined(weakpoint))
	{
		weakpoint = namespace_81245006::function_73ab4754(self, boneindex, 1);
	}
	if(isdefined(weakpoint) && weakpoint.type === #"armor" && namespace_81245006::function_f29756fe(weakpoint) !== 3)
	{
		namespace_81245006::function_ef87b7e8(weakpoint, shitloc);
		if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(self, weakpoint.var_f371ebb0);
			self.var_426947c4 = 1;
		}
	}
	if(isdefined(weakpoint) && weakpoint.var_3765e777 === 1 && aiutility::function_69c2d36f(psoffsettime))
	{
		var_ebcff177 = 2;
	}
	return {#hash_ebcff177:var_ebcff177, #weakpoint:weakpoint, #damage:shitloc};
}

/*
	Name: get_target_ent
	Namespace: archetype_avogadro
	Checksum: 0x65B28716
	Offset: 0x16B0
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function get_target_ent(entity)
{
	if(isdefined(entity.attackable))
	{
		return entity.attackable;
	}
	return entity.favoriteenemy;
}

/*
	Name: function_80fc1a78
	Namespace: archetype_avogadro
	Checksum: 0xC3A0FD5F
	Offset: 0x16F0
	Size: 0x62
	Parameters: 1
	Flags: None
*/
function function_80fc1a78(time)
{
	self notify("297d7bf80338955d");
	self endon("297d7bf80338955d");
	self endon(#"death", #"hash_7d29584dcbbe7d67");
	self show();
	wait(time);
}

/*
	Name: function_f8e8c129
	Namespace: archetype_avogadro
	Checksum: 0x4B17D498
	Offset: 0x1760
	Size: 0x294
	Parameters: 1
	Flags: Linked, Private
*/
function private function_f8e8c129(entity)
{
	if(is_false(entity.can_shoot))
	{
		return false;
	}
	enemy = get_target_ent(entity);
	if(!isdefined(enemy))
	{
		return false;
	}
	if(!function_aa6fbf56(entity))
	{
		return false;
	}
	if(isdefined(level.var_a35afcb2) && ![[level.var_a35afcb2]](entity))
	{
		return false;
	}
	if(isdefined(enemy))
	{
		vec_enemy = enemy.origin - self.origin;
		dist_sq = lengthsquared(vec_enemy);
		if(dist_sq > 14400 || is_false(entity.can_phase) && dist_sq < 2250000)
		{
			vec_facing = anglestoforward(self.angles);
			var_482d3bba = (vec_facing[0], vec_facing[1], 0);
			var_45ed4f50 = vectornormalize((vec_facing[0], vec_facing[1], 0));
			var_9743030a = vectornormalize((vec_enemy[0], vec_enemy[1], 0));
			var_5e958f82 = vectordot(var_45ed4f50, var_9743030a);
			if(var_5e958f82 > 0.99)
			{
				var_f6a4b2f3 = enemy getcentroid();
				eye_pos = self geteye();
				traceresult = bullettrace(eye_pos, var_f6a4b2f3, 0, (isentity(enemy) ? enemy : undefined));
				if(traceresult[#"fraction"] == 1)
				{
					return true;
				}
			}
		}
	}
	return false;
}

/*
	Name: function_aa6fbf56
	Namespace: archetype_avogadro
	Checksum: 0x51E86C66
	Offset: 0x1A00
	Size: 0xD8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_aa6fbf56(entity)
{
	var_99387d40 = blackboard::getblackboardevents(#"hash_27bee30b37f7debe");
	if(isdefined(var_99387d40) && var_99387d40.size)
	{
		foreach(var_9fb4c4cc in var_99387d40)
		{
			if(var_9fb4c4cc.data.entity === entity)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_afa4bed6
	Namespace: archetype_avogadro
	Checksum: 0x4A2186A8
	Offset: 0x1AE0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_afa4bed6(entity)
{
	decision = randomint(2);
	entity setblackboardattribute("_ranged_attack_variant", decision);
}

/*
	Name: function_7e5905cd
	Namespace: archetype_avogadro
	Checksum: 0x9BAE3862
	Offset: 0x1B40
	Size: 0xDC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7e5905cd(entity)
{
	enemy = self.favoriteenemy;
	if(isdefined(enemy))
	{
		self.shield = 1;
		self notify(#"hash_7d29584dcbbe7d67");
		self show();
	}
	var_8706203c = 500;
	if(isdefined(entity.var_fffac33))
	{
		var_8706203c = [[entity.var_fffac33]](entity);
	}
	blackboard::addblackboardevent(#"hash_27bee30b37f7debe", {#entity:self}, randomintrange(2000, 3000));
}

/*
	Name: function_e7e003b0
	Namespace: archetype_avogadro
	Checksum: 0xCB3AF514
	Offset: 0x1C28
	Size: 0x110
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e7e003b0(entity)
{
	if(!isdefined(self.var_8f78592b))
	{
		return false;
	}
	var_aa313325 = entity [[entity.var_8f78592b]](entity);
	if(!var_aa313325)
	{
		return false;
	}
	var_a430e28e = blackboard::getblackboardevents(#"hash_71e87bb4fbe53c16");
	if(isdefined(var_a430e28e) && var_a430e28e.size)
	{
		foreach(var_73fafdf0 in var_a430e28e)
		{
			if(var_73fafdf0.data.entity === entity)
			{
				return false;
			}
		}
	}
	return true;
}

/*
	Name: function_14e1e2c8
	Namespace: archetype_avogadro
	Checksum: 0xA3C0511B
	Offset: 0x1D40
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_14e1e2c8(entity)
{
	blackboard::addblackboardevent(#"hash_71e87bb4fbe53c16", {#entity:self}, randomintrange(2000, 3000));
}

/*
	Name: shoot_bolt_wait
	Namespace: archetype_avogadro
	Checksum: 0x3077E584
	Offset: 0x1DA8
	Size: 0x2BC
	Parameters: 1
	Flags: Linked, Private
*/
function private shoot_bolt_wait(entity)
{
	if(!isdefined(get_target_ent(entity)))
	{
		return;
	}
	enemy = get_target_ent(entity);
	target_pos = enemy getcentroid();
	if(issentient(enemy))
	{
		target_pos = enemy geteye();
	}
	target_velocity = (0, 0, 0);
	if(!enemy scene::function_c935c42())
	{
		target_velocity = enemy getvelocity();
		if(isplayer(enemy))
		{
			target_pos = target_pos + (vectorscale((0, 0, -1), 12));
			if(enemy isinvehicle())
			{
				target_velocity = enemy getvehicleoccupied() getvelocity();
			}
		}
	}
	source_pos = self gettagorigin("tag_weapon_right");
	if(!isdefined(source_pos))
	{
		source_pos = self gettagorigin("tag_weapon_left");
	}
	velocity = target_pos - source_pos;
	var_cfca9f29 = length(velocity) / 800;
	target_pos = target_pos + (target_velocity * var_cfca9f29) * randomfloatrange(0, 1);
	/#
		recordsphere(target_pos, 10, (0, 1, 0), "");
	#/
	velocity = target_pos - source_pos;
	velocity = vectornormalize(velocity);
	velocity = velocity * 800;
	bolt = entity magicmissile(getweapon(#"avogadro_bolt"), source_pos, velocity);
	if(!isdefined(bolt))
	{
		return;
	}
	bolt function_b1b41f33(entity);
}

/*
	Name: function_b1b41f33
	Namespace: archetype_avogadro
	Checksum: 0x5ADA841B
	Offset: 0x2070
	Size: 0x164
	Parameters: 1
	Flags: Linked
*/
function function_b1b41f33(owner)
{
	self endon(#"death");
	self.owner = owner;
	self clientfield::set("" + #"hash_699d5bb1a9339a93", 1);
	self thread function_dec8144d();
	waitresult = self function_5f86757d();
	if(!isdefined(owner) || !isdefined(waitresult))
	{
		return;
	}
	if(waitresult._notify == #"explode" || waitresult._notify == #"projectile_impact_explode" && isdefined(waitresult.position))
	{
		owner callback::callback(#"hash_c1d64b00f1dc607", {#jammer:self, #radius:self.weapon.explosionradius, #origin:waitresult.position});
	}
}

/*
	Name: function_dec8144d
	Namespace: archetype_avogadro
	Checksum: 0x40815016
	Offset: 0x21E0
	Size: 0x200
	Parameters: 0
	Flags: Linked
*/
function function_dec8144d()
{
	self endon(#"death", #"explode");
	self.takedamage = 1;
	self.maxhealth = 50;
	self.health = 50;
	if(isdefined(self.owner) && isdefined(self.owner.maxhealth))
	{
		self.maxhealth = int(0.05 * self.owner.maxhealth);
		self.health = self.maxhealth;
	}
	while(isdefined(self))
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		if(waitresult.mod === "MOD_PISTOL_BULLET" || waitresult.mod === "MOD_RIFLE_BULLET" || waitresult.mod === "MOD_PROJECTILE")
		{
			if(self.health <= 0)
			{
				level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:"avogadro_projectile_destroyed_zm", #attacker:waitresult.attacker});
				var_5fae82a9 = spawn("script_model", self.origin);
				var_5fae82a9 setmodel("tag_origin");
				var_5fae82a9 thread function_5f54a393();
				self deletedelay();
			}
		}
	}
}

/*
	Name: function_5f54a393
	Namespace: archetype_avogadro
	Checksum: 0x62A63BD6
	Offset: 0x23E8
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_5f54a393()
{
	self clientfield::set("" + #"hash_183ef3538fd62563", 1);
	wait(5);
	self deletedelay();
}

/*
	Name: function_5f86757d
	Namespace: archetype_avogadro
	Checksum: 0x2DB4AFF0
	Offset: 0x2440
	Size: 0xC0
	Parameters: 0
	Flags: Linked
*/
function function_5f86757d()
{
	level endon(#"game_ended");
	waitresult = undefined;
	waitresult = self waittill(#"explode", #"death", #"projectile_impact_explode");
	if(!isdefined(self))
	{
		return waitresult;
	}
	playsoundatposition(#"hash_525786cd7853a7a0", self.origin);
	self clientfield::set("" + #"hash_699d5bb1a9339a93", 0);
	return waitresult;
}

/*
	Name: function_5ce54900
	Namespace: archetype_avogadro
	Checksum: 0x8A802406
	Offset: 0x2508
	Size: 0x36
	Parameters: 1
	Flags: Linked
*/
function function_5ce54900(entity)
{
	function_dbc638a8(entity);
	self.phase_time = gettime() - 1;
}

/*
	Name: function_b7ba7211
	Namespace: archetype_avogadro
	Checksum: 0xEB2AD47C
	Offset: 0x2548
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function function_b7ba7211(timeout)
{
	self notify("3f8e265d56f9fe8e");
	self endon("3f8e265d56f9fe8e");
	self endon(#"death");
	self endoncallback(&function_e4fda91d, #"hash_114f53e963b59106");
	self.blockingpain = 1;
	wait(timeout);
	self.blockingpain = 0;
}

/*
	Name: function_e4fda91d
	Namespace: archetype_avogadro
	Checksum: 0x2A20435E
	Offset: 0x25C8
	Size: 0x1E
	Parameters: 1
	Flags: Linked
*/
function function_e4fda91d(notifyhash)
{
	if(isdefined(self))
	{
		self.blockingpain = 0;
	}
}

/*
	Name: function_5ca95b95
	Namespace: archetype_avogadro
	Checksum: 0xDB5446FD
	Offset: 0x25F0
	Size: 0x90
	Parameters: 0
	Flags: Linked
*/
function function_5ca95b95()
{
	level.var_be622b90 = [];
	for(i = 0; i < 2; i++)
	{
		level.var_be622b90[i] = array(util::spawn_model(#"tag_origin"), util::spawn_model(#"tag_origin"));
	}
}

/*
	Name: function_205c9932
	Namespace: archetype_avogadro
	Checksum: 0x51E81859
	Offset: 0x2688
	Size: 0x152
	Parameters: 1
	Flags: Linked
*/
function function_205c9932(entity)
{
	foreach(index, array in level.var_be622b90)
	{
		if(isdefined(array[0].owner) || isdefined(array[1].owner))
		{
			continue;
		}
		foreach(ent in array)
		{
			ent.owner = entity;
		}
		return {#array:array, #id:index + 1};
	}
}

/*
	Name: function_c6e09354
	Namespace: archetype_avogadro
	Checksum: 0xF284C70
	Offset: 0x27E8
	Size: 0xAA
	Parameters: 1
	Flags: Linked
*/
function function_c6e09354(var_78dd7804)
{
	foreach(ent in var_78dd7804.array)
	{
		ent clientfield::set("avogadro_phase_beam", 0);
		ent.owner = undefined;
	}
}

/*
	Name: function_2e3c588
	Namespace: archetype_avogadro
	Checksum: 0x55212C57
	Offset: 0x28A0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_2e3c588(notifyhash)
{
	if(isdefined(self) && isdefined(self.var_78dd7804))
	{
		function_c6e09354(self.var_78dd7804);
	}
}

/*
	Name: function_d979c854
	Namespace: archetype_avogadro
	Checksum: 0xB1A4B4F4
	Offset: 0x28E8
	Size: 0x11E
	Parameters: 1
	Flags: Linked
*/
function function_d979c854(entity)
{
	entity endoncallback(&function_2e3c588, #"death");
	var_78dd7804 = entity.var_78dd7804;
	foreach(ent in var_78dd7804.array)
	{
		ent clientfield::set("avogadro_phase_beam", var_78dd7804.id);
	}
	util::wait_network_frame();
	function_c6e09354(var_78dd7804);
	if(isdefined(entity))
	{
		entity.var_78dd7804 = undefined;
	}
}

/*
	Name: function_a495d71f
	Namespace: archetype_avogadro
	Checksum: 0xF601DE7E
	Offset: 0x2A10
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function function_a495d71f(entity)
{
	if(!function_2eb165a4(entity))
	{
		return false;
	}
	entity.var_78dd7804 = function_205c9932(entity);
	if(!isdefined(entity.var_78dd7804))
	{
		return false;
	}
	endpoint = function_c3ceb539(entity);
	if(!isdefined(endpoint))
	{
		function_c6e09354(entity.var_78dd7804);
		entity.var_78dd7804 = undefined;
		return false;
	}
	entity.endpoint = endpoint;
	tag_offset = entity gettagorigin("j_spine4") - entity.origin;
	entity.var_1d95f284 = gettime();
	entity.var_78dd7804.array[0].origin = entity.origin + tag_offset;
	entity.var_78dd7804.array[1].origin = entity.endpoint + tag_offset;
}

/*
	Name: function_2eb165a4
	Namespace: archetype_avogadro
	Checksum: 0x7C8543CE
	Offset: 0x2B68
	Size: 0x34A
	Parameters: 1
	Flags: Linked
*/
function function_2eb165a4(entity)
{
	if(isdefined(level.var_8791f7c5) && ![[level.var_8791f7c5]](entity))
	{
		return false;
	}
	if(is_true(self.var_958cf9c5))
	{
		return false;
	}
	if(entity.phase_time > gettime())
	{
		return false;
	}
	if(isdefined(entity.var_78dd7804))
	{
		return false;
	}
	target = get_target_ent(entity);
	var_c5504ae5 = 1 / 4;
	health_ratio = entity.health / entity.maxhealth;
	if(!isdefined(entity.var_f89ee7ac))
	{
		entity.var_f89ee7ac = 1 - var_c5504ae5;
	}
	if(health_ratio <= entity.var_f89ee7ac)
	{
		entity.var_f89ee7ac = health_ratio - var_c5504ae5;
		return true;
	}
	if(isdefined(entity.favoriteenemy))
	{
		if(isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle())
		{
			return false;
		}
		var_bec89360 = distancesquared(entity.favoriteenemy.origin, entity.origin);
		if(var_bec89360 <= sqr(200))
		{
			return true;
		}
		if(var_bec89360 >= sqr(1500))
		{
			return true;
		}
		if(target === entity.favoriteenemy && !entity seerecently(entity.favoriteenemy, 1))
		{
			return true;
		}
	}
	if(isdefined(entity.attackable))
	{
		var_bec89360 = distancesquared(entity.attackable.origin, entity.origin);
		if(var_bec89360 <= sqr(200))
		{
			return true;
		}
		if(var_bec89360 >= sqr(1500))
		{
			return true;
		}
		var_f5f64fa2 = entity geteye();
		var_ac89c6e3 = entity.attackable getcentroid();
		if(target === entity.attackable && !sighttracepassed(var_f5f64fa2, var_ac89c6e3, 0, entity.attackable))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_c3ceb539
	Namespace: archetype_avogadro
	Checksum: 0x59E31EF0
	Offset: 0x2EC0
	Size: 0x696
	Parameters: 1
	Flags: Linked
*/
function function_c3ceb539(entity)
{
	test_points = [];
	target = get_target_ent(entity);
	var_5494b2e9 = 0;
	self.can_phase = 0;
	if(isdefined(entity.attackable) && entity.attackable === target)
	{
		var_5494b2e9 = 1;
		test_points = array();
		slots = array::randomize(entity.attackable.var_b79a8ac7.slots);
		var_c51aeb32 = int(min(slots.size, 3));
		for(i = 0; i < var_c51aeb32; i++)
		{
			slot = slots[i];
			angles = vectortoangles(slot.origin - entity.attackable.origin);
			test_points[test_points.size] = entity.attackable.origin + (anglestoforward((0, angles[1], 0)) * randomfloatrange(150, 500));
		}
	}
	else
	{
		if(isplayer(entity.favoriteenemy) && entity.favoriteenemy === target)
		{
			var_5494b2e9 = 1;
			enemy_angles = entity.favoriteenemy getplayerangles();
			test_points = array(entity.favoriteenemy.origin + (anglestoforward((0, angleclamp180(enemy_angles[1] + (randomfloatrange(20, 40) / 2)), 0))) * randomfloatrange(1000, 1500), entity.favoriteenemy.origin + (anglestoforward((0, angleclamp180(enemy_angles[1] - (randomfloatrange(20, 40) / 2)), 0))) * randomfloatrange(1000, 1500));
		}
		else
		{
			if(isalive(entity.favoriteenemy) && entity.favoriteenemy === target)
			{
				var_5494b2e9 = 1;
				test_points = array(entity.favoriteenemy.origin + (anglestoforward((0, randomfloat(180), 0)) * randomfloatrange(1000, 1500)), entity.favoriteenemy.origin + (anglestoforward((0, randomfloat(180) * -1, 0))) * randomfloatrange(1000, 1500));
			}
			else
			{
				return undefined;
			}
		}
	}
	enemy = target;
	test_points = array::randomize(test_points);
	if(var_5494b2e9)
	{
		bestpoint = undefined;
		foreach(point in test_points)
		{
			bestpoint = function_3d3ee1a4(entity, point, enemy);
			if(isdefined(bestpoint))
			{
				break;
			}
		}
	}
	else
	{
		bestpoint = test_points[0];
	}
	/#
		if(isdefined(bestpoint))
		{
			recordsphere(bestpoint, 15, (0, 0, 1), "");
			recordline(entity.origin, bestpoint, (0, 0, 1), "");
		}
		if(isplayer(entity.favoriteenemy))
		{
			player_angles = entity.favoriteenemy getplayerangles();
			if(isdefined(player_angles) && isdefined(bestpoint))
			{
				var_891a94cf = anglestoforward(player_angles);
				var_e4529f5f = acos(vectordot(var_891a94cf, vectornormalize(bestpoint - entity.favoriteenemy.origin)));
				distsqrd = distancesquared(bestpoint, entity.favoriteenemy.origin);
				dist = sqrt(distsqrd);
			}
		}
	#/
	self.can_phase = isdefined(bestpoint);
	return bestpoint;
}

/*
	Name: function_77788917
	Namespace: archetype_avogadro
	Checksum: 0xBC56BACC
	Offset: 0x3560
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function function_77788917(entity)
{
	self playsound(#"hash_64bb457a8c6f828c");
	self clientfield::set("" + #"hash_2eec8fc21495a18c", 120);
	self ghost();
	self notsolid();
	if(isdefined(self.var_78dd7804))
	{
		function_c6e09354(self.var_78dd7804);
		self.var_78dd7804 = undefined;
	}
}

/*
	Name: function_3d3ee1a4
	Namespace: archetype_avogadro
	Checksum: 0xBA26542B
	Offset: 0x3628
	Size: 0x316
	Parameters: 3
	Flags: Linked
*/
function function_3d3ee1a4(entity, point, enemy)
{
	groundpos = groundtrace((point + vectorscale((0, 0, 1), 500)) + vectorscale((0, 0, 1), 8), (point + vectorscale((0, 0, 1), 500)) + (vectorscale((0, 0, -1), 100000)), 0, entity)[#"position"];
	if(groundpos[2] < point[2] - 2000)
	{
		/#
			recordsphere(point, 10, (1, 0, 0), "", entity);
		#/
		return undefined;
	}
	nextpos = getclosestpointonnavmesh(groundpos, 128, entity getpathfindingradius());
	if(!isdefined(nextpos))
	{
		/#
			recordsphere(point, 10, (1, 0, 0), "", entity);
		#/
		return undefined;
	}
	if(isdefined(enemy))
	{
		var_94324c7a = getclosestpointonnavmesh(enemy.origin, 128, entity getpathfindingradius());
		if(isdefined(var_94324c7a))
		{
			nextpos = checknavmeshdirection(var_94324c7a, nextpos - var_94324c7a, distance(nextpos, var_94324c7a), entity getpathfindingradius());
			if(isdefined(entity.favoriteenemy) && distancesquared(var_94324c7a, nextpos) <= sqr(1000))
			{
				/#
					recordsphere(nextpos, 10, (1, 0, 0), "", entity);
				#/
				return undefined;
			}
		}
	}
	groundpos = groundtrace((nextpos + vectorscale((0, 0, 1), 500)) + vectorscale((0, 0, 1), 8), (nextpos + vectorscale((0, 0, 1), 500)) + (vectorscale((0, 0, -1), 100000)), 0, entity)[#"position"];
	if(abs(nextpos[2] - groundpos[2]) > 5)
	{
		return undefined;
	}
	if(isdefined(nextpos) && distancesquared(entity.origin, nextpos) < 700)
	{
		return undefined;
	}
	return nextpos;
}

/*
	Name: function_9ab1c000
	Namespace: archetype_avogadro
	Checksum: 0x7FAF3293
	Offset: 0x3948
	Size: 0x18
	Parameters: 1
	Flags: Linked
*/
function function_9ab1c000(entity)
{
	return isdefined(entity.var_78dd7804);
}

/*
	Name: function_3b8d314c
	Namespace: archetype_avogadro
	Checksum: 0x657BEC7A
	Offset: 0x3968
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function function_3b8d314c(entity)
{
	entity.blockingpain = 1;
}

/*
	Name: function_ceeb405
	Namespace: archetype_avogadro
	Checksum: 0x9142550B
	Offset: 0x3990
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_ceeb405(entity)
{
	entity.blockingpain = 0;
	if(isdefined(entity.var_78dd7804))
	{
		entity thread function_d979c854(entity);
	}
}

/*
	Name: function_36f6a838
	Namespace: archetype_avogadro
	Checksum: 0xBB270A37
	Offset: 0x39D8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_36f6a838(entity)
{
	entity.phase_time = gettime() + entity.var_15aa1ae0;
}

/*
	Name: function_b57de57a
	Namespace: archetype_avogadro
	Checksum: 0x330E5FA8
	Offset: 0x3A08
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_b57de57a(entity)
{
	entity dontinterpolate();
	angles = entity.angles;
	target = get_target_ent(entity);
	if(isdefined(target) && isdefined(entity.endpoint))
	{
		angles = vectortoangles(target.origin - entity.endpoint);
		entity forceteleport(entity.endpoint, (0, angles[1], 0));
	}
}

/*
	Name: function_c83209ee
	Namespace: archetype_avogadro
	Checksum: 0x18778AED
	Offset: 0x3AD8
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_c83209ee(entity)
{
	if(!function_f14292cf(entity))
	{
		return false;
	}
	var_d06fc215 = getdvarfloat(#"hash_6911e1fbdc75c93", 3000);
	if(isdefined(entity.var_de2d38ae) && (gettime() - entity.var_de2d38ae) <= var_d06fc215)
	{
		return false;
	}
	return true;
}

/*
	Name: function_f14292cf
	Namespace: archetype_avogadro
	Checksum: 0x8CB0C265
	Offset: 0x3B68
	Size: 0x48
	Parameters: 1
	Flags: Linked
*/
function function_f14292cf(entity)
{
	if(!isdefined(entity.var_d444767) || (gettime() - entity.var_d444767) > 500)
	{
		return false;
	}
	return true;
}

/*
	Name: function_b411d93
	Namespace: archetype_avogadro
	Checksum: 0x5D87080E
	Offset: 0x3BB8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_b411d93(entity)
{
	entity.var_de2d38ae = gettime();
}

/*
	Name: function_1169b184
	Namespace: archetype_avogadro
	Checksum: 0xA1A6CE5B
	Offset: 0x3BD8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_1169b184(entity)
{
	function_dbc638a8(entity);
}

/*
	Name: function_d58f8483
	Namespace: archetype_avogadro
	Checksum: 0xFDADC0C
	Offset: 0x3C08
	Size: 0x1D8
	Parameters: 1
	Flags: Linked
*/
function function_d58f8483(entity)
{
	target = get_target_ent(entity);
	if(isdefined(target) && distancesquared(entity.origin, target.origin) <= sqr(1500))
	{
		/#
			assert(isdefined(entity.var_696e2d53) && isdefined(entity.var_e3b6f14a), "");
		#/
		if(gettime() < entity.var_696e2d53)
		{
			return entity.var_e3b6f14a;
		}
		entity.var_696e2d53 = gettime();
		var_32eb9058 = (isentity(target) ? target getcentroid() : target.origin);
		traceresult = bullettrace(entity geteye(), var_32eb9058, 0, (isentity(target) ? target : undefined));
		if(traceresult[#"fraction"] == 1)
		{
			entity.var_e3b6f14a = 1;
			return 1;
		}
	}
	entity.var_e3b6f14a = 0;
	entity.var_696e2d53 = gettime() + function_21a3a673(800, 1000);
	return 0;
}

/*
	Name: function_bc2f2686
	Namespace: archetype_avogadro
	Checksum: 0xBB3C4395
	Offset: 0x3DE8
	Size: 0x13C
	Parameters: 5
	Flags: Linked
*/
function function_bc2f2686(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration animmode("normal", 0);
	target = get_target_ent(mocompduration);
	if(isdefined(mocompduration.attackable) && mocompduration.attackable === target)
	{
		mocompduration orientmode("face point", mocompduration.attackable getcentroid());
	}
	else
	{
		if(isdefined(mocompduration.favoriteenemy) && mocompduration.favoriteenemy === target)
		{
			mocompduration orientmode("face point", mocompduration.favoriteenemy.origin);
		}
		else
		{
			mocompduration orientmode("face default");
		}
	}
}

/*
	Name: function_9f3a10a4
	Namespace: archetype_avogadro
	Checksum: 0x7AA54EF0
	Offset: 0x3F30
	Size: 0x13E
	Parameters: 5
	Flags: Linked
*/
function function_9f3a10a4(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompanimflag animmode("normal", 0);
	mocompanimflag.blockingpain = 1;
	mocompanimflag.var_78dd7804 = function_205c9932(mocompanimflag);
	if(isdefined(mocompanimflag.var_78dd7804))
	{
		mocompanimflag.var_78dd7804.array[0].origin = mocompanimflag.traversalstartpos;
		mocompanimflag.var_78dd7804.array[1].origin = mocompanimflag.traversalendpos;
	}
	mocompanimflag.var_d39541c9 = {#hash_c970f455:getnotetracktimes(mocompduration, "phase_end")[0], #hash_deb95e3f:getnotetracktimes(mocompduration, "phase_start")[0]};
}

/*
	Name: function_4cf6a31d
	Namespace: archetype_avogadro
	Checksum: 0xF24A081D
	Offset: 0x4078
	Size: 0x16A
	Parameters: 5
	Flags: Linked
*/
function function_4cf6a31d(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	if(mocompanimflag getanimtime(mocompduration) >= mocompanimflag.var_d39541c9.var_deb95e3f && !is_true(mocompanimflag.var_d39541c9.var_50524dbd))
	{
		if(isdefined(mocompanimflag.var_78dd7804))
		{
			mocompanimflag thread function_d979c854(mocompanimflag);
		}
		mocompanimflag.var_d39541c9.var_50524dbd = 1;
	}
	if(mocompanimflag getanimtime(mocompduration) >= mocompanimflag.var_d39541c9.var_c970f455 && !is_true(mocompanimflag.var_d39541c9.var_90a731c))
	{
		mocompanimflag dontinterpolate();
		mocompanimflag forceteleport(mocompanimflag.traversalendpos, mocompanimflag.angles, 0);
		mocompanimflag.var_d39541c9.var_90a731c = 1;
	}
}

/*
	Name: function_7b70bdbe
	Namespace: archetype_avogadro
	Checksum: 0x813D5228
	Offset: 0x41F0
	Size: 0x7C
	Parameters: 5
	Flags: Linked
*/
function function_7b70bdbe(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration.blockingpain = 0;
	mocompduration.var_78dd7804 = undefined;
	mocompduration.var_d39541c9 = undefined;
	if(isactor(mocompduration))
	{
		mocompduration finishtraversal();
	}
}

/*
	Name: function_f6aed42d
	Namespace: archetype_avogadro
	Checksum: 0x6EB9BF03
	Offset: 0x4278
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_f6aed42d()
{
	self.var_b467f3a1 = &function_17be9890;
	self thread function_7ce6b06d();
}

/*
	Name: function_17be9890
	Namespace: archetype_avogadro
	Checksum: 0x4756C116
	Offset: 0x42B0
	Size: 0x1BC
	Parameters: 1
	Flags: Linked
*/
function function_17be9890(eventstruct)
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
		case "death":
		{
			b_override = 1;
			n_priority = 4;
			break;
		}
		case "pain":
		{
			b_override = 1;
			n_priority = 3;
			break;
		}
		case "summon":
		{
			b_override = 1;
			n_priority = 3;
			var_c8109157 = 1;
			break;
		}
		case "attack":
		case "teleport":
		{
			b_override = 1;
			n_priority = 2;
			var_c8109157 = 1;
			break;
		}
		case "ambient":
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
	Name: function_7ce6b06d
	Namespace: archetype_avogadro
	Checksum: 0x949D3B56
	Offset: 0x4478
	Size: 0xF0
	Parameters: 0
	Flags: Linked
*/
function function_7ce6b06d()
{
	self endon(#"death");
	str_notify = "ambient";
	while(true)
	{
		min_wait = 2;
		max_wait = 5;
		if(isdefined(self.awarenesslevelcurrent) && self.awarenesslevelcurrent === "combat")
		{
			str_notify = "ambient_alert";
		}
		else
		{
			str_notify = "ambient";
		}
		function_6eac4ca1(self, str_notify);
		self notify(#"bhtn_action_notify", {#action:str_notify});
		wait(randomfloatrange(min_wait, max_wait));
	}
}

