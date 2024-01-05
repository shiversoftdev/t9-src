#using scripts\zm_common\zm_behavior.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_5e0bde12853401b5;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_7f35d42a9593323b;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_394b7174;

/*
	Name: function_90bae423
	Namespace: namespace_394b7174
	Checksum: 0xDFFA675C
	Offset: 0x390
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_90bae423()
{
	level notify(1861899174);
}

/*
	Name: __init__system__
	Namespace: namespace_394b7174
	Checksum: 0xA3E4FB00
	Offset: 0x3B0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_76fcf333cf2abd11", &__init__, undefined, &function_4df027f2, undefined);
}

/*
	Name: __init__
	Namespace: namespace_394b7174
	Checksum: 0xE2FF3565
	Offset: 0x400
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function __init__()
{
	spawner::add_archetype_spawn_function(#"mechz", &function_b8e86206);
	spawner::function_89a2cd87(#"mechz", &function_3f369eaa);
}

/*
	Name: function_4df027f2
	Namespace: namespace_394b7174
	Checksum: 0xD086A29A
	Offset: 0x470
	Size: 0x544
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4df027f2()
{
	level thread aat::register_immunity("ammomod_brainrot", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_brainrot_1", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_brainrot_2", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_brainrot_3", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_brainrot_4", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_brainrot_5", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze_1", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze_2", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze_3", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze_4", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze_5", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire_1", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire_2", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire_3", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire_4", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire_5", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst_1", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst_2", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst_3", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst_4", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst_5", #"mechz", 1, 1, 1);
}

/*
	Name: function_b8e86206
	Namespace: namespace_394b7174
	Checksum: 0x9A9AD7E4
	Offset: 0x9C0
	Size: 0x136
	Parameters: 0
	Flags: Linked
*/
function function_b8e86206()
{
	self callback::function_d8abfc3d(#"on_ai_melee", &namespace_85745671::function_b8eb5dea);
	self callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &mechz_cleanup);
	self.var_12af7864 = 1;
	self.blockingpain = 1;
	self.var_d8695234 = 1;
	self.var_90d0c0ff = "anim_mechz_spawn";
	self.var_ecbef856 = "anim_mechz_despawn";
	self.should_zigzag = 0;
	self.ai.var_870d0893 = 1;
	self.var_b3c613a7 = [4:2, 3:2, 2:1.5, 1:1.5, 0:1];
	self.var_414bc881 = 0.5;
	self.var_97ca51c7 = 2;
}

/*
	Name: function_3f369eaa
	Namespace: namespace_394b7174
	Checksum: 0x1A879885
	Offset: 0xB00
	Size: 0xFC
	Parameters: 0
	Flags: Linked
*/
function function_3f369eaa()
{
	self function_8d5f13fa();
	if(is_true(self.var_1a5b6b7e))
	{
		self endon(#"death");
		awareness::pause(self);
		self animscripted("rise_anim", self.origin, (0, self.angles[1], 0), #"hash_768cb7840d5e6d2b", "normal", undefined, 1, 0.2);
		self waittillmatch({#notetrack:"end"}, #"rise_anim");
		awareness::resume(self);
	}
}

/*
	Name: mechz_cleanup
	Namespace: namespace_394b7174
	Checksum: 0x8A105304
	Offset: 0xC08
	Size: 0x124
	Parameters: 1
	Flags: Linked
*/
function mechz_cleanup(params)
{
	self endon(#"death");
	if(isdefined(self.attackable))
	{
		namespace_85745671::function_2b925fa5(self);
	}
	self animscripted("despawn_anim", self.origin, self.angles, #"hash_d4f220b98771ce4", "normal", undefined, 1, 0.2);
	self waittillmatch({#notetrack:"end"}, #"despawn_anim");
	self ghost();
	self notsolid();
	waittillframeend();
	self.var_98f1f37c = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

/*
	Name: function_8d5f13fa
	Namespace: namespace_394b7174
	Checksum: 0x860695B2
	Offset: 0xD38
	Size: 0x314
	Parameters: 0
	Flags: Linked
*/
function function_8d5f13fa()
{
	self.fovcosine = 0.5;
	self.maxsightdistsqrd = sqr(900);
	self.has_awareness = 1;
	self.ignorelaststandplayers = 1;
	self.var_1267fdea = 1;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::register_state(self, #"wander", &function_65f28890, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::register_state(self, #"investigate", &awareness::function_b41f0471, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::register_state(self, #"chase", &function_43c21e81, &function_3715dbff, &function_dca46c2e, &awareness::function_5c40e824, undefined);
	awareness::register_state(self, #"relocate", &function_3a6dfa8b, &function_6e7d7d1, &function_7ea826b6, &awareness::function_5c40e824, undefined);
	awareness::register_state(self, #"scripted", &function_235c2ec8, undefined, &function_39e16337);
	awareness::set_state(self, #"wander");
	self callback::function_d8abfc3d(#"hash_1c5ac76933317a1d", &awareness::pause, undefined, array(self));
	self callback::function_d8abfc3d(#"hash_6ce1d15fa3e62552", &function_a84a928b);
	self callback::on_ai_damage(&function_d3f3bff7);
	self thread awareness::function_fa6e010d();
}

/*
	Name: function_65f28890
	Namespace: namespace_394b7174
	Checksum: 0xC964CBF3
	Offset: 0x1058
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_65f28890(entity)
{
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	entity.fovcosine = 0.5;
	entity.maxsightdistsqrd = sqr(1000);
	entity.var_1267fdea = 0;
	awareness::function_9c9d96b5(entity);
}

/*
	Name: function_64072d21
	Namespace: namespace_394b7174
	Checksum: 0x6F7675
	Offset: 0x10E8
	Size: 0x5C
	Parameters: 1
	Flags: None
*/
function function_64072d21(entity)
{
	entity.fovcosine = 0;
	entity.maxsightdistsqrd = sqr(1800);
	entity.var_1267fdea = 0;
	awareness::function_b41f0471(entity);
}

/*
	Name: function_32309e80
	Namespace: namespace_394b7174
	Checksum: 0x218CA85D
	Offset: 0x1150
	Size: 0x2C
	Parameters: 1
	Flags: Private
*/
function private function_32309e80(entity)
{
	return isdefined(entity.nextgrenadetime) && entity.nextgrenadetime > gettime();
}

/*
	Name: function_cdbe8d0a
	Namespace: namespace_394b7174
	Checksum: 0x2A8AAA0E
	Offset: 0x1188
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cdbe8d0a(entity)
{
	return isdefined(entity.nextflametime) && entity.nextflametime > gettime();
}

/*
	Name: function_43c21e81
	Namespace: namespace_394b7174
	Checksum: 0xB2C68851
	Offset: 0x11C0
	Size: 0xC4
	Parameters: 1
	Flags: Linked
*/
function function_43c21e81(entity)
{
	entity.fovcosine = 0;
	entity.maxsightdistsqrd = sqr(3000);
	entity.var_1267fdea = 0;
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
	entity.maxsightdistsqrd = sqr(3000);
	entity.var_972b23bb = 1;
	zm_ai_utility::function_4d22f6d1(entity);
	awareness::function_978025e4(entity);
}

/*
	Name: function_3715dbff
	Namespace: namespace_394b7174
	Checksum: 0xD67EE4B9
	Offset: 0x1290
	Size: 0x294
	Parameters: 1
	Flags: Linked
*/
function function_3715dbff(entity)
{
	if(is_true(entity.var_1fa24724) && isdefined(entity.enemy))
	{
		zm_behavior::function_483766be(entity);
		var_db31ebd5 = !entity haspath() && (abs(entity.enemy.origin[2] - self.origin[2])) > 120;
		if(var_db31ebd5)
		{
			return;
		}
	}
	target = (isdefined(entity.favoriteenemy) ? entity.favoriteenemy : entity.attackable);
	if(isdefined(target))
	{
		if(mechzbehavior::function_77bd7d26(entity) && entity cansee(target))
		{
			/#
				distsqr = distancesquared(entity.origin, entity.favoriteenemy.origin);
				record3dtext((((("" + 225) + "") + 600) + "") + sqrt(distsqr), entity.origin, (0, 1, 0));
				recordline(entity.origin, target.origin, (0, 1, 0));
			#/
			if(!mechzbehavior::mechzshouldshootgrenade(entity))
			{
				if(function_cdbe8d0a(entity))
				{
					awareness::set_state(entity, #"relocate");
				}
				else
				{
					var_274bac27 = 90000;
					if(distancesquared(entity.origin, target.origin) > var_274bac27)
					{
						awareness::function_39da6c3c(entity);
					}
				}
			}
			return;
		}
	}
	awareness::function_39da6c3c(entity);
}

/*
	Name: function_dca46c2e
	Namespace: namespace_394b7174
	Checksum: 0xF89FE840
	Offset: 0x1530
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_dca46c2e(entity)
{
	entity.maxsightdistsqrd = sqr(900);
	entity.var_972b23bb = undefined;
	if(isdefined(entity.cluster) && entity.cluster.status === 0)
	{
		entity callback::callback(#"hash_10ab46b52df7967a");
		return;
	}
	awareness::function_b9f81e8b(entity);
}

/*
	Name: function_3a6dfa8b
	Namespace: namespace_394b7174
	Checksum: 0xB96D3843
	Offset: 0x15D8
	Size: 0x5DC
	Parameters: 1
	Flags: Linked
*/
function function_3a6dfa8b(entity)
{
	function_43c21e81(entity);
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
	enemy = entity.favoriteenemy;
	/#
		assert(isdefined(enemy));
	#/
	var_1f1d655 = vectortoangles(entity.origin - entity.favoriteenemy.origin)[1];
	var_8daf3ac3 = 300;
	var_5c85bc30 = [];
	angle_offsets = [1:-30, 0:30];
	foreach(angle in angle_offsets)
	{
		var_43ed722a = absangleclamp360(var_1f1d655 + angle);
		target_vec = anglestoforward((0, var_43ed722a, 0));
		target_pos = enemy.origin + (target_vec * var_8daf3ac3);
		var_c38ec8b1 = getclosestpointonnavmesh(target_pos, 64, entity getpathfindingradius());
		if(isdefined(var_c38ec8b1))
		{
			var_5c85bc30[var_5c85bc30.size] = var_c38ec8b1;
		}
	}
	var_e3a26bf0 = undefined;
	var_9da770d9 = 0;
	var_e1aa7e8 = undefined;
	var_6481e3f2 = entity getangles()[1];
	forward_vec = anglestoforward((0, var_6481e3f2, 0));
	foreach(pos in var_5c85bc30)
	{
		var_2872f5ac = pos - entity.origin;
		dot = vectordot(var_2872f5ac, forward_vec);
		if(dot > 0)
		{
			var_e3a26bf0 = pos;
		}
		if(!isdefined(var_e1aa7e8))
		{
			var_e1aa7e8 = dot;
		}
		if(math::sign(dot) != math::sign(var_e1aa7e8))
		{
			var_9da770d9 = 1;
		}
		var_e1aa7e8 = dot;
		/#
			recordsphere(pos, 10, (1, 0, 0), "");
			record3dtext("" + dot, pos + (vectorscale((0, 0, -1), 10)), (1, 0, 0));
		#/
	}
	if(var_9da770d9)
	{
	}
	else
	{
		if(isplayer(enemy))
		{
			player_yaw = enemy getplayerangles()[1];
			var_ae507841 = anglestoforward((0, player_yaw, 0));
			player_view_pos = enemy.origin + (var_ae507841 * var_8daf3ac3);
			/#
				recordsphere(player_view_pos, 10, (0, 1, 0), "");
			#/
			var_3393a039 = 2147483647;
			foreach(pos in var_5c85bc30)
			{
				dist_sqr = distancesquared(player_view_pos, pos);
				if(dist_sqr < var_3393a039)
				{
					var_3393a039 = dist_sqr;
					var_e3a26bf0 = pos;
				}
			}
		}
		else if(var_5c85bc30.size > 0)
		{
			var_e3a26bf0 = var_5c85bc30[randomint(var_5c85bc30.size)];
		}
	}
	if(isdefined(var_e3a26bf0))
	{
		entity setgoal(var_e3a26bf0);
		/#
			recordsphere(var_e3a26bf0, 10, (0, 0, 1), "");
		#/
	}
}

/*
	Name: function_6e7d7d1
	Namespace: namespace_394b7174
	Checksum: 0x620FEBD5
	Offset: 0x1BC0
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_6e7d7d1(entity)
{
	/#
		record3dtext("", entity.origin + vectorscale((0, 1, 0), 20), (0, 0, 1));
	#/
	if(is_true(entity.var_1fa24724))
	{
		awareness::set_state(entity, #"chase");
		return;
	}
	if(isdefined(entity.favoriteenemy))
	{
		var_1f2328d0 = entity function_4794d6a3();
		var_127a38a7 = distancesquared(var_1f2328d0.goalpos, entity.origin);
		if(!mechzbehavior::function_77bd7d26(entity) || var_1f2328d0.isatgoal || var_127a38a7 < sqr(64))
		{
			awareness::set_state(entity, #"chase");
		}
	}
}

/*
	Name: function_7ea826b6
	Namespace: namespace_394b7174
	Checksum: 0x9920EA3E
	Offset: 0x1D18
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_7ea826b6(entity)
{
	function_dca46c2e(entity);
}

/*
	Name: function_235c2ec8
	Namespace: namespace_394b7174
	Checksum: 0xE296EDA7
	Offset: 0x1D48
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_235c2ec8(entity)
{
	entity.favoriteenemy = undefined;
	entity clearpath();
	entity setgoal(entity.origin, 1);
}

/*
	Name: function_39e16337
	Namespace: namespace_394b7174
	Checksum: 0x41959831
	Offset: 0x1DA0
	Size: 0x4C
	Parameters: 1
	Flags: Linked
*/
function function_39e16337(entity)
{
	entity.favoriteenemy = undefined;
	entity clearpath();
	entity setgoal(entity.origin, 1);
}

/*
	Name: function_d3f3bff7
	Namespace: namespace_394b7174
	Checksum: 0xC718CAAB
	Offset: 0x1DF8
	Size: 0x252
	Parameters: 1
	Flags: Linked
*/
function function_d3f3bff7(params)
{
	if(isdefined(params.einflictor) && !isdefined(self.attackable) && isdefined(params.einflictor.var_b79a8ac7) && isarray(params.einflictor.var_b79a8ac7.slots) && isarray(level.var_7fc48a1a) && isinarray(level.var_7fc48a1a, params.weapon))
	{
		if(params.einflictor namespace_85745671::get_attackable_slot(self))
		{
			self.attackable = params.einflictor;
		}
	}
	if(!isdefined(self.favoriteenemy) && isdefined(params.einflictor) && !isdefined(self.var_4b559171))
	{
		awareness::function_c241ef9a(self, params.einflictor, 8);
		var_55853a47 = getclosestpointonnavmesh(params.einflictor.origin, 256, self getpathfindingradius() * 1.2);
		var_f2f7ce25 = getclosestpointonnavmesh(self.origin, 256, self getpathfindingradius() * 1.2);
		if(!isdefined(var_55853a47) || !isdefined(var_f2f7ce25))
		{
			return;
		}
		to_origin = self.origin - var_55853a47;
		goalpos = checknavmeshdirection(var_55853a47, to_origin, 96, self getpathfindingradius() * 1.2);
		self.var_4b559171 = goalpos;
	}
}

/*
	Name: function_a84a928b
	Namespace: namespace_394b7174
	Checksum: 0xA89C2220
	Offset: 0x2058
	Size: 0x100
	Parameters: 1
	Flags: Linked
*/
function function_a84a928b(params)
{
	awareness::resume(self);
	var_8e1582ca = getentitiesinradius(self.origin, self getpathfindingradius() * 3, 15);
	foreach(zombie in var_8e1582ca)
	{
		if(zombie.archetype == #"zombie")
		{
			zombie zombie_utility::setup_zombie_knockdown(self);
		}
	}
}

