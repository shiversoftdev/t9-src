#using script_35b8a6927c851193;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using script_1940fc077a028a81;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\archetype_utility.gsc;
#using script_35598499769dbb3d;
#using script_2c5daa95f8fec03c;
#using script_3819e7a1427df6d2;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_59f07c660e6710a5;
#using scripts\core_common\ai\archetype_avogadro.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_9f3d3e9;

/*
	Name: function_5c17ad81
	Namespace: namespace_9f3d3e9
	Checksum: 0x8DA840C4
	Offset: 0x3F0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5c17ad81()
{
	level notify(975845901);
}

/*
	Name: __init__system__
	Namespace: namespace_9f3d3e9
	Checksum: 0xFE461728
	Offset: 0x410
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"wz_ai_avogadro", &function_70a657d8, undefined, &function_4df027f2, #"archetype_avogadro");
}

/*
	Name: function_70a657d8
	Namespace: namespace_9f3d3e9
	Checksum: 0x91CF11ED
	Offset: 0x470
	Size: 0x1D4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"avogadro", &function_f34df3c);
	spawner::function_89a2cd87(#"avogadro", &function_c41e67c);
	level.var_8791f7c5 = &function_ac94df05;
	level.var_a35afcb2 = &function_7d5cf0e4;
	/#
		assert(isscriptfunctionptr(&function_f498585b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_76e19aed5b42448f", &function_f498585b);
	/#
		assert(isscriptfunctionptr(&function_5871bcf8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_408e0b3d57595bf7", &function_5871bcf8, 1);
	/#
		assert(isscriptfunctionptr(&function_14b5c940));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_21f9e6b4d52f79cb", &function_14b5c940);
}

/*
	Name: function_4df027f2
	Namespace: namespace_9f3d3e9
	Checksum: 0x80F724D1
	Offset: 0x650
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_4df027f2()
{
}

/*
	Name: function_f34df3c
	Namespace: namespace_9f3d3e9
	Checksum: 0x51A17974
	Offset: 0x660
	Size: 0x3D2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f34df3c()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &namespace_85745671::function_5cb3181e);
	self.var_8f78592b = &namespace_e292b080::zombieshouldmelee;
	self.cant_move_cb = &function_9c573bc6;
	self.var_31a789c0 = 1;
	self.var_1c0eb62a = 180;
	self.var_13138acf = 1;
	self.var_e729ffb = 2;
	self.var_1731eda3 = 1;
	self.var_721a3dbd = 1;
	self.var_8f61d7f4 = 1;
	self.var_4cc2bf28 = 0;
	self.var_90d0c0ff = "anim_avogadro_spawn";
	self.var_ecbef856 = "anim_avogadro_despawn";
	self.despawn_anim = "ai_t9_zm_avogadro_exit";
	self.var_c11b8a5a = 1;
	self.var_28621cf4 = "j_head";
	self.var_e5365d8a = (0, 0, 0);
	self.var_e9c62827 = 1;
	self.ai.var_870d0893 = 1;
	self.no_powerups = 1;
	self.var_b3c613a7 = [4:1, 3:1, 2:1, 1:1, 0:1];
	self.var_414bc881 = 1;
	self.var_97ca51c7 = 1;
	self namespace_85745671::function_9758722("walk");
	self callback::function_d8abfc3d(#"on_ai_damage", &function_ce2bd83c);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_8886bcc4);
	self callback::function_d8abfc3d(#"on_ai_melee", &namespace_85745671::function_b8eb5dea);
	self callback::function_d8abfc3d(#"hash_7140c3848cbefaa1", &function_e44ef704);
	self callback::function_d8abfc3d(#"hash_3bb51ce51020d0eb", &namespace_85745671::function_16e2f075);
	self callback::function_d8abfc3d(#"hash_c1d64b00f1dc607", &function_f59c1777);
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &awareness::function_c6b1009e);
	aiutility::addaioverridedamagecallback(self, &function_1fef432);
	self.completed_emerging_into_playable_area = 1;
	self.canbetargetedbyturnedzombies = 1;
	level thread zm_spawner::zombie_death_event(self);
	self ghost();
	if(!isdefined(self))
	{
		return;
	}
	/#
		self.var_6c408220 = &function_c698f66b;
	#/
}

/*
	Name: function_c41e67c
	Namespace: namespace_9f3d3e9
	Checksum: 0x2C74F4FE
	Offset: 0xA40
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_c41e67c()
{
	self endon(#"death");
	self show();
	function_905d3c1a(self);
	self function_99cad91e();
}

/*
	Name: function_9c573bc6
	Namespace: namespace_9f3d3e9
	Checksum: 0x4D43538E
	Offset: 0xAA8
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function function_9c573bc6()
{
	self notify("7bf9b9b7936e2866");
	self endon("5e562bb39a880473", #"death");
	if(isdefined(self.enemy_override))
	{
		return;
	}
	if(is_true(self.allowoffnavmesh) && is_true(level.var_5e8121a) && is_true(self.var_35eedf58))
	{
		self.var_ef59b90 = 5;
		return;
	}
	if(self.aistate === 3 && is_true(self.var_5a8f690))
	{
		if(isdefined(self.favoriteenemy) && is_true(self.var_de6e22f7) && !self.var_13138acf)
		{
			self.var_ef59b90 = 6;
		}
		else
		{
			self.var_ef59b90 = 5;
		}
		return;
	}
	self collidewithactors(0);
	wait(2);
	self collidewithactors(1);
}

/*
	Name: function_99cad91e
	Namespace: namespace_9f3d3e9
	Checksum: 0xE16D5A08
	Offset: 0xC18
	Size: 0x1DC
	Parameters: 0
	Flags: Linked
*/
function function_99cad91e()
{
	self.has_awareness = 1;
	self.ignorelaststandplayers = 1;
	self.fovcosine = 0.2;
	self.maxsightdistsqrd = sqr(1000);
	self.var_1267fdea = 1;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::register_state(self, #"wander", &function_83e04f3c, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::register_state(self, #"investigate", &function_92c28840, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::register_state(self, #"chase", &function_b28bc84e, &function_f8aa7ab9, &function_cea6c5e9, &function_93d792b9, undefined);
	awareness::set_state(self, #"wander");
	self thread awareness::function_fa6e010d();
}

/*
	Name: function_83e04f3c
	Namespace: namespace_9f3d3e9
	Checksum: 0xDBB856F6
	Offset: 0xE00
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_83e04f3c(entity)
{
	self.fovcosine = 0.2;
	self.maxsightdistsqrd = sqr(1000);
	self.var_1267fdea = 0;
	entity namespace_85745671::function_9758722("walk");
	awareness::function_9c9d96b5(entity);
}

/*
	Name: function_92c28840
	Namespace: namespace_9f3d3e9
	Checksum: 0x39C3EED9
	Offset: 0xE88
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_92c28840(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(1800);
	self.var_1267fdea = 0;
	awareness::function_b41f0471(entity);
}

/*
	Name: function_b28bc84e
	Namespace: namespace_9f3d3e9
	Checksum: 0x8ED8D728
	Offset: 0xEF0
	Size: 0x94
	Parameters: 1
	Flags: Linked
*/
function function_b28bc84e(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(3000);
	self.var_1267fdea = 0;
	entity namespace_85745671::function_9758722("run");
	entity.maxsightdistsqrd = sqr(2000);
	awareness::function_978025e4(entity);
}

/*
	Name: function_f8aa7ab9
	Namespace: namespace_9f3d3e9
	Checksum: 0xB7AD4AA0
	Offset: 0xF90
	Size: 0x10C
	Parameters: 1
	Flags: Linked
*/
function function_f8aa7ab9(entity)
{
	if(function_7436ece2(entity.favoriteenemy))
	{
		entity.var_972b23bb = 1;
		function_a756bd8e(entity);
		return;
	}
	target = archetype_avogadro::get_target_ent(entity);
	if(isdefined(target) && archetype_avogadro::function_d58f8483(entity))
	{
		entity namespace_85745671::function_9758722("run");
		function_de781d41(entity);
		return;
	}
	entity namespace_85745671::function_9758722("sprint");
	function_a756bd8e(entity);
	awareness::function_39da6c3c(entity);
}

/*
	Name: function_a756bd8e
	Namespace: namespace_9f3d3e9
	Checksum: 0xBD5A202
	Offset: 0x10A8
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_a756bd8e(entity)
{
	entity.var_e8a7f45d = undefined;
}

/*
	Name: function_de781d41
	Namespace: namespace_9f3d3e9
	Checksum: 0x530F5C9
	Offset: 0x10C8
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_de781d41(entity)
{
	if(!isdefined(entity.var_e8a7f45d))
	{
		entity.var_e8a7f45d = {#hash_a5afe5a1:gettime(), #state:#"hash_24e69bf779de4940"};
	}
	if(!isdefined(entity.var_e8a7f45d.center_point))
	{
		entity.var_e8a7f45d.center_point = entity.origin;
	}
	if(gettime() < entity.var_e8a7f45d.var_a5afe5a1)
	{
		return;
	}
	entity.var_e8a7f45d.var_a5afe5a1 = gettime() + 2000;
	var_1c6ab728 = function_598bf886(self);
	if(isdefined(var_1c6ab728))
	{
		entity setgoal(var_1c6ab728);
	}
}

/*
	Name: function_598bf886
	Namespace: namespace_9f3d3e9
	Checksum: 0xBB523169
	Offset: 0x11C8
	Size: 0x420
	Parameters: 1
	Flags: Linked
*/
function function_598bf886(entity)
{
	nextstate = #"hash_24e69bf779de4940";
	switch(entity.var_e8a7f45d.state)
	{
		case "hash_24e69bf779de4940":
		{
			random = randomint(100);
			if(random < 33)
			{
				nextstate = #"hash_a69905121714d7c";
			}
			else if(random < 66)
			{
				nextstate = #"hash_46c85a951b2258a9";
			}
			break;
		}
		case "hash_a69905121714d7c":
		case "hash_46c85a951b2258a9":
		{
			nextstate = #"hash_24e69bf779de4940";
			break;
		}
		default:
		{
			break;
		}
	}
	target = archetype_avogadro::get_target_ent(entity);
	if(nextstate != entity.var_e8a7f45d.state)
	{
		dirtoenemy = vectornormalize(target.origin - entity.origin);
		angles = vectortoangles(dirtoenemy);
		angles = (0, angles[1], 0);
		if(nextstate == #"hash_a69905121714d7c")
		{
			dir = anglestoright(angles) * -1;
			movepos = entity.origin + (dir * randomintrange(100, 300));
		}
		else
		{
			if(nextstate == #"hash_46c85a951b2258a9")
			{
				dir = anglestoright(angles);
				movepos = entity.origin + (dir * randomintrange(100, 300));
			}
			else
			{
				movepos = entity.var_e8a7f45d.center_point;
			}
		}
		if(isdefined(movepos))
		{
			var_37c56a35 = getclosestpointonnavmesh(movepos, 128, entity getpathfindingradius() * 1.2);
		}
		if(isdefined(var_37c56a35))
		{
			potentialspot = checknavmeshdirection(entity.origin, var_37c56a35 - entity.origin, distance(entity.origin, var_37c56a35), entity getpathfindingradius());
			/#
				recordline(entity.origin, potentialspot, (0, 1, 0), "", entity);
			#/
			/#
				recordline(entity.origin + vectorscale((0, 0, 1), 3), var_37c56a35 + vectorscale((0, 0, 1), 3), (1, 0.5, 0), "", entity);
			#/
			if(distancesquared(entity.origin, potentialspot) >= 100 || is_false(entity.can_phase))
			{
				entity.var_e8a7f45d.state = nextstate;
				return potentialspot;
			}
		}
	}
}

/*
	Name: function_cea6c5e9
	Namespace: namespace_9f3d3e9
	Checksum: 0x909FC3F0
	Offset: 0x15F0
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_cea6c5e9(entity)
{
	function_a756bd8e(entity);
	entity.var_972b23bb = undefined;
	if(isdefined(entity.cluster) && entity.cluster.status === 0)
	{
		entity callback::callback(#"hash_10ab46b52df7967a");
		return;
	}
	entity.maxsightdistsqrd = sqr(1000);
	awareness::function_b9f81e8b(entity);
}

/*
	Name: function_93d792b9
	Namespace: namespace_9f3d3e9
	Checksum: 0x6F223E13
	Offset: 0x16A8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_93d792b9(entity)
{
	if(function_7436ece2(entity.favoriteenemy))
	{
		return;
	}
	awareness::function_5c40e824(entity);
}

/*
	Name: function_905d3c1a
	Namespace: namespace_9f3d3e9
	Checksum: 0x43723CAA
	Offset: 0x16F0
	Size: 0x134
	Parameters: 1
	Flags: Linked
*/
function function_905d3c1a(entity)
{
	entity endon(#"death");
	if(is_true(entity.var_83fa6083))
	{
		return;
	}
	delta = getmovedelta("ai_t9_zm_avogadro_arrival", 0, 1);
	timeout = getanimlength("ai_t9_zm_avogadro_arrival");
	new_origin = (entity.origin[0], entity.origin[1], entity.origin[2] - delta[2]);
	entity animscripted("avogadro_arrival_finished", new_origin, (0, entity.angles[1], 0), "ai_t9_zm_avogadro_arrival", "normal", "root", 1, 0);
	entity waittilltimeout(timeout, #"avogadro_arrival_finished");
}

/*
	Name: avogadrodespawn
	Namespace: namespace_9f3d3e9
	Checksum: 0xB5B24E58
	Offset: 0x1830
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function avogadrodespawn(entity)
{
	entity thread onallcracks(entity);
}

/*
	Name: onallcracks
	Namespace: namespace_9f3d3e9
	Checksum: 0x3B88AFE8
	Offset: 0x1860
	Size: 0x198
	Parameters: 1
	Flags: Linked
*/
function onallcracks(entity)
{
	entity endon(#"death");
	entity.var_8a96267d = undefined;
	entity.is_digging = 1;
	entity pathmode("dont move", 1);
	timeout = getanimlength("ai_t9_zm_avogadro_exit");
	entity animscripted("avogadro_exit_finished", self.origin, self.angles, "ai_t9_zm_avogadro_exit", "normal", "root", 1, 0);
	waitresult = undefined;
	waitresult = entity waittilltimeout(timeout, #"avogadro_exit_finished");
	entity ghost();
	entity notsolid();
	entity val::set(#"avogadro_despawn", "ignoreall", 1);
	entity clientfield::set("" + #"hash_2eec8fc21495a18c", 0);
	entity notify(#"is_underground");
}

/*
	Name: function_7436ece2
	Namespace: namespace_9f3d3e9
	Checksum: 0xADA1EC50
	Offset: 0x1A00
	Size: 0x8A
	Parameters: 1
	Flags: Linked
*/
function function_7436ece2(entity)
{
	if(!isplayer(entity) || !namespace_85745671::function_142c3c86(entity))
	{
		return false;
	}
	vehicle = entity getvehicleoccupied();
	if(vehicle getspeed() < 100)
	{
		return false;
	}
	return true;
}

/*
	Name: function_f498585b
	Namespace: namespace_9f3d3e9
	Checksum: 0xC21352C9
	Offset: 0x1A98
	Size: 0xFA
	Parameters: 1
	Flags: Linked
*/
function function_f498585b(entity)
{
	if(gettime() < entity.var_4cc2bf28)
	{
		return 0;
	}
	if(isdefined(entity.favoriteenemy) && is_true(entity.favoriteenemy.usingvehicle))
	{
		vehicle = entity.favoriteenemy getvehicleoccupied();
		if(isdefined(vehicle.var_7cdc3732))
		{
			function_1eaaceab(vehicle.var_7cdc3732, 0);
			if(vehicle.var_7cdc3732.size >= 3 && !isinarray(vehicle.var_7cdc3732, self))
			{
				return 0;
			}
		}
	}
	return function_7436ece2(entity.favoriteenemy);
}

/*
	Name: function_14b5c940
	Namespace: namespace_9f3d3e9
	Checksum: 0x54ED7DF5
	Offset: 0x1BA0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_14b5c940(entity)
{
	if(is_false(entity.can_shoot))
	{
		return false;
	}
	if(!isdefined(entity.favoriteenemy))
	{
		return false;
	}
	if(isdefined(level.var_a35afcb2) && ![[level.var_a35afcb2]](entity))
	{
		return false;
	}
	return true;
}

/*
	Name: function_175d123b
	Namespace: namespace_9f3d3e9
	Checksum: 0x25E4981F
	Offset: 0x1C18
	Size: 0xFC
	Parameters: 1
	Flags: Linked
*/
function function_175d123b(vehicle)
{
	self endon(#"death");
	vehicle endon(#"death");
	if(!isdefined(vehicle.var_7cdc3732))
	{
		vehicle.var_7cdc3732 = [];
	}
	vehicle.var_7cdc3732[vehicle.var_7cdc3732.size] = self;
	while(vehicle getspeed() >= 100 && isplayer(self.favoriteenemy) && isdefined(vehicle getoccupantseat(self.favoriteenemy)))
	{
		waitframe(1);
	}
	if(isdefined(vehicle) && isdefined(self))
	{
		arrayremovevalue(vehicle.var_7cdc3732, self);
	}
}

/*
	Name: function_5871bcf8
	Namespace: namespace_9f3d3e9
	Checksum: 0xCBAA3713
	Offset: 0x1D20
	Size: 0x786
	Parameters: 1
	Flags: Linked
*/
function function_5871bcf8(entity)
{
	if(isdefined(entity.var_78dd7804))
	{
		return;
	}
	vehicle = entity.favoriteenemy getvehicleoccupied();
	speed = vehicle getspeed();
	if(!isdefined(vehicle.var_7cdc3732) || !isinarray(vehicle.var_7cdc3732, entity))
	{
		entity thread function_175d123b(vehicle);
	}
	angles = entity.favoriteenemy getplayerangles();
	angles = (0, angles[1], 0);
	direction = anglestoforward(angles);
	right = anglestoright(angles);
	angularvelocity = vehicle getangularvelocity();
	var_b03d2fe7 = abs(angularvelocity[2]);
	var_c27adf49 = mapfloat(0, 2.6, 300, 800, var_b03d2fe7);
	rightoffset = (right * var_c27adf49) * (angularvelocity[2] < 0 ? 1 : -1);
	var_ff89cc4c = max(speed * 2, 1500);
	forwardoffset = direction * var_ff89cc4c;
	var_2ca243fc = rightoffset + forwardoffset;
	var_9d75e0da = length(var_2ca243fc);
	if(isdefined(vehicle.origin))
	{
		var_37cf85c7 = getclosestpointonnavmesh(vehicle.origin, 128, entity getpathfindingradius() * 1.2);
	}
	if(!isdefined(var_37cf85c7))
	{
		return;
	}
	entity.var_78dd7804 = archetype_avogadro::function_205c9932(entity);
	if(!isdefined(entity.var_78dd7804))
	{
		return;
	}
	nextpos = checknavmeshdirection(var_37cf85c7, var_2ca243fc, var_9d75e0da, entity getpathfindingradius() * 1.2);
	if(distancesquared(vehicle.origin, nextpos) < sqr(1500))
	{
		archetype_avogadro::function_c6e09354(entity.var_78dd7804);
		entity.var_78dd7804 = undefined;
		return;
	}
	points = array(nextpos + vectorscale((1, 0, 0), 150), nextpos + vectorscale((1, 0, 0), 300), nextpos - vectorscale((1, 0, 0), 150), nextpos - vectorscale((1, 0, 0), 300), nextpos + vectorscale((0, 1, 0), 150), nextpos + vectorscale((0, 1, 0), 300), nextpos - vectorscale((0, 1, 0), 150), nextpos - vectorscale((0, 1, 0), 300));
	bestpoint = undefined;
	var_fa442d4c = entity function_6a9ae71();
	points = array::randomize(points);
	foreach(point in points)
	{
		nextpos = groundtrace((point + vectorscale((0, 0, 1), 500)) + vectorscale((0, 0, 1), 8), (point + vectorscale((0, 0, 1), 500)) + (vectorscale((0, 0, -1), 100000)), 0, entity)[#"position"];
		if(nextpos[2] < point[2] - 2000)
		{
			/#
				recordsphere(point, 10, (1, 0, 0), "", entity);
			#/
			continue;
		}
		if(bullettracepassed(nextpos + (0, 0, var_fa442d4c), vehicle.origin + (0, 0, var_fa442d4c), 0, vehicle))
		{
			bestpoint = nextpos;
			break;
		}
		/#
			recordsphere(nextpos, 10, (1, 0, 0), "", entity);
		#/
	}
	if(!isdefined(bestpoint))
	{
		archetype_avogadro::function_c6e09354(entity.var_78dd7804);
		entity.var_78dd7804 = undefined;
		return;
	}
	var_baa2a8c4 = vehicle.origin - bestpoint;
	/#
		recordsphere(bestpoint, 15, (0, 0, 1), "");
		recordline(entity.origin, bestpoint, (0, 0, 1), "");
	#/
	tag_offset = entity gettagorigin("j_spine4") - entity.origin;
	entity.var_78dd7804.array[0].origin = entity.origin + tag_offset;
	entity.var_78dd7804.array[1].origin = bestpoint + tag_offset;
	entity thread archetype_avogadro::function_d979c854(entity);
	entity forceteleport(bestpoint, vectortoangles(var_baa2a8c4));
	entity.var_4cc2bf28 = gettime() + (int(3.5 * 1000));
}

/*
	Name: function_ce2bd83c
	Namespace: namespace_9f3d3e9
	Checksum: 0x25F16F35
	Offset: 0x24B0
	Size: 0x394
	Parameters: 1
	Flags: Linked
*/
function function_ce2bd83c(params)
{
	if(is_true(self.is_phasing))
	{
		return;
	}
	if(isdefined(params.einflictor) && isdefined(params.weapon) && params.smeansofdeath !== "MOD_DOT")
	{
		dot_params = function_f74d2943(params.weapon, 7);
		if(isdefined(dot_params))
		{
			status_effect::status_effect_apply(dot_params, params.weapon, params.einflictor);
		}
	}
	if(isdefined(params.einflictor) && !isdefined(self.attackable) && isdefined(params.einflictor.var_b79a8ac7) && isarray(params.einflictor.var_b79a8ac7.slots) && isarray(level.var_7fc48a1a) && isinarray(level.var_7fc48a1a, params.weapon))
	{
		if(params.einflictor namespace_85745671::get_attackable_slot(self))
		{
			self.attackable = params.einflictor;
		}
	}
	if(params.smeansofdeath == "MOD_CRUSH")
	{
		self function_f59c1777({#jammer:self, #radius:250, #origin:self.origin});
		if(isdefined(params.einflictor))
		{
			params.einflictor dodamage(500, self.origin, self, self, "none", "MOD_UNKNOWN");
		}
		if(isalive(self))
		{
			self.allowdeath = 1;
			self kill(self.origin, params.eattacker, params.einflictor);
		}
	}
	if(params.smeansofdeath === "MOD_MELEE")
	{
		if(isplayer(params.einflictor))
		{
			if(self.shield)
			{
				params.einflictor status_effect::status_effect_apply(level.var_2ea60515, undefined, self, 0);
			}
		}
		if(!self.shield)
		{
			self.shield = 1;
			self.hit_by_melee++;
		}
	}
	else if(self.hit_by_melee > 0)
	{
		self.hit_by_melee--;
	}
	self function_ec39f01c(params.idamage, params.eattacker, params.vdir, params.vpoint, params.smeansofdeath, undefined, undefined, undefined, params.weapon);
}

/*
	Name: function_ec39f01c
	Namespace: namespace_9f3d3e9
	Checksum: 0x27357F6B
	Offset: 0x2850
	Size: 0x4F2
	Parameters: 10
	Flags: Linked
*/
function function_ec39f01c(amount, attacker, direction_vec, point, type, tagname, modelname, partname, weapon, var_fd90b0bb)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!self zombie_utility::zombie_should_gib(type, tagname, partname, weapon))
	{
		return;
	}
	if(self zombie_utility::head_should_gib(tagname, partname, modelname, weapon) && partname != "MOD_BURNED")
	{
		self zombie_utility::zombie_head_gib(weapon, var_fd90b0bb, tagname, partname);
		return;
	}
	if(!is_true(self.gibbed) && !isdefined(self.damagelocation))
	{
		if(type >= (self.maxhealth * 0.5) && (partname != "MOD_GRENADE" || partname != "MOD_GRENADE_SPLASH" || partname != "MOD_PROJECTILE" || partname != "MOD_PROJECTILE_SPLASH"))
		{
			self function_fe84424f(weapon, var_fd90b0bb, modelname, 0);
		}
	}
	if(!is_true(self.gibbed) && isdefined(self.damagelocation))
	{
		if(self zombie_utility::damagelocationisany("head", "helmet", "neck"))
		{
			return;
		}
		if(self zombie_utility::damagelocationisany("right_leg_upper", "right_leg_lower", "right_foot", "left_leg_upper", "left_leg_lower", "left_foot") && type < (self.maxhealth * 0.5) && (partname != "MOD_GRENADE" || partname != "MOD_GRENADE_SPLASH" || partname != "MOD_PROJECTILE" || partname != "MOD_PROJECTILE_SPLASH"))
		{
			return;
		}
		self.stumble = undefined;
		b_gibbed = 1;
		var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
		switch(self.damagelocation)
		{
			case "right_leg_upper":
			case "right_leg_lower":
			case "right_foot":
			{
				if(gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
				{
					break;
				}
				gibserverutils::gibrightleg(self, var_c3317960);
				if(randomint(100) > 75)
				{
					gibserverutils::gibleftleg(self, var_c3317960);
				}
				break;
			}
			case "left_leg_lower":
			case "left_foot":
			case "left_leg_upper":
			{
				if(gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
				{
					break;
				}
				gibserverutils::gibleftleg(self, var_c3317960);
				if(randomint(100) > 75)
				{
					gibserverutils::gibrightleg(self, var_c3317960);
				}
				break;
			}
			default:
			{
				if(self.damagelocation == "none")
				{
					if(partname == "MOD_GRENADE" || partname == "MOD_GRENADE_SPLASH" || partname == "MOD_PROJECTILE" || partname == "MOD_PROJECTILE_SPLASH")
					{
						self function_fe84424f(weapon, var_fd90b0bb, modelname);
						break;
					}
				}
			}
		}
	}
}

/*
	Name: function_fe84424f
	Namespace: namespace_9f3d3e9
	Checksum: 0xD0EE7E9E
	Offset: 0x2D50
	Size: 0x324
	Parameters: 4
	Flags: Linked
*/
function function_fe84424f(weapon, var_fd90b0bb, point, var_87a07ff5)
{
	if(!isdefined(var_87a07ff5))
	{
		var_87a07ff5 = 1;
	}
	if(!isdefined(self))
	{
		return;
	}
	if(!isdefined(point))
	{
		return;
	}
	if(!isdefined(level.gib_tags))
	{
		zombie_utility::init_gib_tags();
	}
	closesttag = "tag_origin";
	var_19874b3 = [];
	for(i = 0; i < level.gib_tags.size; i++)
	{
		if(self haspart(level.gib_tags[i]))
		{
			var_19874b3[var_19874b3.size] = {#origin:self gettagorigin(level.gib_tags[i]), #tag:level.gib_tags[i]};
		}
	}
	var_6844367f = arraygetclosest(point, var_19874b3);
	if(isdefined(var_6844367f))
	{
		closesttag = var_6844367f.tag;
	}
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(closesttag == "J_Hip_LE" || closesttag == "J_Knee_LE" || closesttag == "J_Ankle_LE")
	{
		if(gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
		{
			return;
		}
		gibserverutils::gibleftleg(self, var_c3317960);
		if(var_87a07ff5)
		{
			if(randomint(100) > 75)
			{
				gibserverutils::gibrightleg(self, var_c3317960);
			}
		}
	}
	else if(closesttag == "J_Hip_RI" || closesttag == "J_Knee_RI" || closesttag == "J_Ankle_RI")
	{
		if(gibserverutils::isgibbed(self, 16) || gibserverutils::isgibbed(self, 32))
		{
			return;
		}
		gibserverutils::gibrightleg(self, var_c3317960);
		if(var_87a07ff5)
		{
			if(randomint(100) > 75)
			{
				gibserverutils::gibleftleg(self, var_c3317960);
			}
		}
	}
}

/*
	Name: function_1fef432
	Namespace: namespace_9f3d3e9
	Checksum: 0xC7CD533D
	Offset: 0x3080
	Size: 0xA2
	Parameters: 13
	Flags: Linked
*/
function function_1fef432(inflictor, attacker, damage, idflags, smeansofdeath, weapon, var_fd90b0bb, point, dir, shitloc, offsettime, boneindex, modelindex)
{
	/#
		if(is_true(level.var_85a39c96))
		{
			return self.health + 1;
		}
	#/
	return modelindex;
}

/*
	Name: function_8886bcc4
	Namespace: namespace_9f3d3e9
	Checksum: 0xACE108D0
	Offset: 0x3130
	Size: 0x68
	Parameters: 1
	Flags: Linked
*/
function function_8886bcc4(params)
{
	self playsound(#"hash_64bb457a8c6f828c");
	self clientfield::set("sndAwarenessChange", 0);
	if(!isplayer(params.eattacker))
	{
		return;
	}
}

/*
	Name: function_e44ef704
	Namespace: namespace_9f3d3e9
	Checksum: 0x4852A9EE
	Offset: 0x31A0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_e44ef704(params)
{
	self.var_ef59b90 = 5;
	self callback::callback(#"hash_10ab46b52df7967a");
}

/*
	Name: function_ac94df05
	Namespace: namespace_9f3d3e9
	Checksum: 0xEC32FC9D
	Offset: 0x31E8
	Size: 0x6A
	Parameters: 1
	Flags: Linked
*/
function function_ac94df05(entity)
{
	return isdefined(entity.current_state) && entity.current_state.name === #"chase" && (entity.var_9bff71aa < 2 || (gettime() - entity.var_7fde19e8) > 1000);
}

/*
	Name: function_7d5cf0e4
	Namespace: namespace_9f3d3e9
	Checksum: 0x253548D6
	Offset: 0x3260
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function function_7d5cf0e4(entity)
{
	return isdefined(entity.current_state) && entity.current_state.name == #"chase";
}

/*
	Name: function_f59c1777
	Namespace: namespace_9f3d3e9
	Checksum: 0xFD7A21EA
	Offset: 0x32A8
	Size: 0x120
	Parameters: 1
	Flags: Linked
*/
function function_f59c1777(params)
{
	entities = getentitiesinradius(params.origin, params.radius);
	foreach(entity in entities)
	{
		if(!function_b16c8865(entity, self))
		{
			continue;
		}
		if(isplayer(entity))
		{
			entity status_effect::status_effect_apply(level.var_2ea60515, undefined, self, 0);
			continue;
		}
		self thread function_e27c41b4(entity, params.jammer);
	}
}

/*
	Name: function_b16c8865
	Namespace: namespace_9f3d3e9
	Checksum: 0x80D7AF4C
	Offset: 0x33D0
	Size: 0x118
	Parameters: 2
	Flags: Linked, Private
*/
function private function_b16c8865(entity, owner)
{
	if(self == entity)
	{
		return false;
	}
	if(!isplayer(entity) && (!isdefined(entity.model) || entity.model == #""))
	{
		return false;
	}
	if(isactor(entity) && !is_true(entity.var_8f61d7f4))
	{
		return false;
	}
	if(isdefined(entity.team) && !util::function_fbce7263(entity.team, owner.team))
	{
		return false;
	}
	if((isdefined(entity.ignoreemp) ? entity.ignoreemp : 0))
	{
		return false;
	}
	return true;
}

/*
	Name: function_e27c41b4
	Namespace: namespace_9f3d3e9
	Checksum: 0xD22ACB84
	Offset: 0x34F0
	Size: 0x17E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_e27c41b4(entity, jammer)
{
	if(!isdefined(jammer))
	{
		jammer = undefined;
	}
	entity endon(#"death");
	if(!isdefined(entity))
	{
		return;
	}
	if(isalive(entity) && isvehicle(entity) && isdefined(level.is_staircase_up))
	{
		if(isdefined(entity.maxhealth))
		{
			damage = max(entity.maxhealth * 0.35, 750);
			entity dodamage(damage, entity.origin, jammer, undefined, "none", "MOD_UNKNOWN");
		}
		function_1c430dad(entity, 1);
		entity thread [[level.is_staircase_up]](self, jammer);
		return;
	}
	if(isalive(entity) && isactor(entity))
	{
		function_1c430dad(entity, 1);
		return;
	}
}

/*
	Name: function_b8c5ab9c
	Namespace: namespace_9f3d3e9
	Checksum: 0x2DB1FFD3
	Offset: 0x3678
	Size: 0xC4
	Parameters: 1
	Flags: Private
*/
function private function_b8c5ab9c(player)
{
	player notify(#"hash_4f2e183cc0ec68bd");
	player endon(#"death", #"hash_4f2e183cc0ec68bd");
	player clientfield::set_to_player("isJammed", 1);
	player.isjammed = 1;
	player.var_fe1ebada = self;
	player setempjammed(1);
	wait(5);
	if(!isdefined(player))
	{
		return;
	}
	function_d88f3e48(player);
}

/*
	Name: function_1c430dad
	Namespace: namespace_9f3d3e9
	Checksum: 0x5A373753
	Offset: 0x3748
	Size: 0x86
	Parameters: 2
	Flags: Linked
*/
function function_1c430dad(entity, isjammed)
{
	if(!isplayer(entity) && !isactor(entity))
	{
		entity clientfield::set("isJammed", isjammed);
	}
	entity.isjammed = isjammed;
	entity.emped = isjammed;
}

/*
	Name: function_d88f3e48
	Namespace: namespace_9f3d3e9
	Checksum: 0x9C26B7B8
	Offset: 0x37D8
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d88f3e48(entity)
{
	if(!isdefined(entity))
	{
		return;
	}
	if(isplayer(entity))
	{
		entity clientfield::set_to_player("isJammed", 0);
		entity setempjammed(0);
	}
	function_1c430dad(entity, 0);
}

/*
	Name: function_c698f66b
	Namespace: namespace_9f3d3e9
	Checksum: 0x17CD00A
	Offset: 0x3860
	Size: 0x8
	Parameters: 0
	Flags: None
*/
function function_c698f66b()
{
	/#
	#/
}

