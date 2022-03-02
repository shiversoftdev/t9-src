#using script_178024232e91b0a1;
#using script_1940fc077a028a81;
#using script_20dc0f45753888c7;
#using script_2118e128407b7acb;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_57f7003580bb15e0;
#using script_59f07c660e6710a5;
#using script_6809bf766eba194a;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;

#namespace namespace_ec0691f8;

/*
	Name: function_53eebf84
	Namespace: namespace_ec0691f8
	Checksum: 0x917A7701
	Offset: 0x2F8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_53eebf84()
{
	level notify(905475520);
}

/*
	Name: function_89f2df9
	Namespace: namespace_ec0691f8
	Checksum: 0x241E7EDB
	Offset: 0x318
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4863f776a30a1247", &function_d29d4c99, undefined, undefined, undefined);
}

/*
	Name: function_d29d4c99
	Namespace: namespace_ec0691f8
	Checksum: 0xC059836E
	Offset: 0x360
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_d29d4c99()
{
	clientfield::register("actor", "sr_dog_pre_spawn_fx", 1, 1, "counter");
	clientfield::register("actor", "sr_dog_spawn_fx", 1, 1, "counter");
	clientfield::register("actor", "sr_dog_fx", 1, 1, "int");
	registerbehaviorscriptfunctions();
	if(zm_utility::is_survival())
	{
		spawner::add_archetype_spawn_function(#"zombie_dog", &function_51d21736);
		spawner::add_archetype_spawn_function(#"zombie_dog", &function_26a59150);
		spawner::function_89a2cd87(#"zombie_dog", &function_e79ec851);
	}
}

/*
	Name: function_cef412a7
	Namespace: namespace_ec0691f8
	Checksum: 0x4FD1F194
	Offset: 0x4B0
	Size: 0x308
	Parameters: 14
	Flags: Linked, Private
*/
function private function_cef412a7(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, psoffsettime, damagefromunderneath, modelindex, partname)
{
	/#
		if(is_true(level.var_85a39c96))
		{
			damagefromunderneath = self.health + 1;
		}
	#/
	if(isdefined(psoffsettime) && !util::function_fbce7263(self.team, psoffsettime.team))
	{
		return 0;
	}
	if(isdefined(partname) && modelindex !== "MOD_DOT")
	{
		var_9a429025 = function_f74d2943(partname, 7);
		if(isdefined(var_9a429025))
		{
			status_effect::status_effect_apply(var_9a429025, partname, shitloc);
		}
	}
	if(isdefined(shitloc) && !isdefined(self.attackable) && isdefined(shitloc.var_b79a8ac7) && isarray(shitloc.var_b79a8ac7.slots) && isarray(level.var_7fc48a1a) && isinarray(level.var_7fc48a1a, partname))
	{
		if(shitloc namespace_85745671::get_attackable_slot(self))
		{
			self.attackable = shitloc;
		}
	}
	if(is_true(level.is_survival) && !isdefined(self.enemy_override) && !isdefined(self.favoriteenemy) && isdefined(psoffsettime) && isplayer(psoffsettime))
	{
		if(isdefined(modelindex) && (modelindex == "MOD_MELEE" || modelindex == "MOD_MELEE_WEAPON_BUTT") || (isdefined(partname) && partname.statname === #"hatchet"))
		{
			n_radius = 512;
		}
		else
		{
			n_radius = 2048;
		}
		awareness::function_e732359c(1, self.origin, n_radius, self, {#position:psoffsettime.origin});
	}
	return damagefromunderneath;
}

/*
	Name: function_51d21736
	Namespace: namespace_ec0691f8
	Checksum: 0x43D76CEE
	Offset: 0x7C0
	Size: 0x252
	Parameters: 0
	Flags: Linked
*/
function function_51d21736()
{
	self.ai.var_870d0893 = 1;
	self callback::function_d8abfc3d(#"hash_11aa32ad6d527054", &namespace_85745671::function_b8eb5dea);
	self callback::function_d8abfc3d(#"hash_45b50cc48ee7f9d8", &function_69c3e2ac);
	self callback::function_d8abfc3d(#"hash_3bb51ce51020d0eb", &namespace_85745671::function_16e2f075);
	self callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &namespace_85745671::function_5cb3181e);
	self callback::function_d8abfc3d(#"hash_790882ac8688cee5", &function_2272dcba);
	self callback::function_d8abfc3d(#"hash_46a032931418eecf", &function_ae78134);
	aiutility::addaioverridedamagecallback(self, &function_cef412a7);
	if(self.var_9fde8624 === #"hash_2a5479b83161cb35")
	{
		self.var_12af7864 = 1;
	}
	self.var_65e57a10 = 1;
	self.cant_move_cb = &function_9c573bc6;
	self.var_31a789c0 = 1;
	self.var_1c0eb62a = 180;
	self.var_13138acf = 1;
	self.var_cbc65493 = 1.5;
	self.var_a9db7324 = 4;
	self.var_f1b4d6d3 = 1;
	self.var_6daa6190 = 1;
	self.var_c50d964 = 35;
	self.var_721a3dbd = 1;
	self.var_28621cf4 = "j_spine3";
	self.var_e5365d8a = vectorscale((0, 0, 1), 3);
	self.completed_emerging_into_playable_area = 1;
	self.canbetargetedbyturnedzombies = 1;
}

/*
	Name: function_26a59150
	Namespace: namespace_ec0691f8
	Checksum: 0x48F38331
	Offset: 0xA20
	Size: 0x5E
	Parameters: 0
	Flags: Linked
*/
function function_26a59150()
{
	self.var_b3c613a7 = [4:1, 3:1, 2:1, 1:1, 0:1];
	self.var_414bc881 = 0.5;
}

/*
	Name: function_e79ec851
	Namespace: namespace_ec0691f8
	Checksum: 0x79B89E4
	Offset: 0xA88
	Size: 0x14
	Parameters: 0
	Flags: Linked
*/
function function_e79ec851()
{
	function_c2400b01();
}

/*
	Name: function_2272dcba
	Namespace: namespace_ec0691f8
	Checksum: 0xCFBC2767
	Offset: 0xAA8
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_2272dcba(params)
{
}

/*
	Name: function_9c573bc6
	Namespace: namespace_ec0691f8
	Checksum: 0xD11FF4CF
	Offset: 0xAC0
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9c573bc6(entity)
{
	self notify("5c2a82620d7bf511");
	self endon("77ae64c1f0aa89ae", #"death");
	if(isdefined(self.enemy_override))
	{
		return;
	}
	self collidewithactors(0);
	wait(2);
	self collidewithactors(1);
}

/*
	Name: function_c2400b01
	Namespace: namespace_ec0691f8
	Checksum: 0xF6372AC4
	Offset: 0xB48
	Size: 0x294
	Parameters: 0
	Flags: Linked
*/
function function_c2400b01()
{
	self endon(#"death");
	self.var_f9a12c59 = 1;
	self.var_ed35eeb2 = 1;
	self.var_1267fdea = 1;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	self callback::function_d8abfc3d(#"hash_4afe635f36531659", &awareness::function_c6b1009e);
	awareness::function_dad6ba0e(self, #"wander", &function_9f9d7a80, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::function_dad6ba0e(self, #"investigate", &function_461711c2, &awareness::function_9eefc327, &function_2114b12b, undefined, &awareness::function_a360dd00);
	if(self.var_9fde8624 === #"hash_28e36e7b7d5421f")
	{
		awareness::function_dad6ba0e(self, #"chase", &function_6f207918, &function_d005c417, &function_cf29908a, &awareness::function_5c40e824, undefined);
	}
	else
	{
		awareness::function_dad6ba0e(self, #"chase", &function_6f207918, &namespace_5eb9b9b6::function_90da9686, &function_cf29908a, &awareness::function_5c40e824, undefined);
	}
	awareness::set_state(self, #"wander");
	self thread awareness::function_c6b1009e();
	self thread awareness::function_fa6e010d();
}

/*
	Name: function_9f9d7a80
	Namespace: namespace_ec0691f8
	Checksum: 0xC3D4CA68
	Offset: 0xDE8
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9f9d7a80(entity)
{
	entity.fovcosine = 0.5;
	entity.maxsightdistsqrd = sqr(1400);
	entity.var_1267fdea = 0;
	entity namespace_85745671::function_9758722(#"walk");
	self.var_6daa6190 = 1;
	awareness::function_9c9d96b5(entity);
}

/*
	Name: function_461711c2
	Namespace: namespace_ec0691f8
	Checksum: 0x794A5E48
	Offset: 0xE78
	Size: 0xAC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_461711c2(entity)
{
	entity.fovcosine = 0;
	entity.maxsightdistsqrd = sqr(2000);
	entity.var_1267fdea = 0;
	util::delay(randomfloatrange(0.1, 1), "state_changed", &namespace_85745671::function_9758722, #"run");
	awareness::function_b41f0471(entity);
}

/*
	Name: function_2114b12b
	Namespace: namespace_ec0691f8
	Checksum: 0xF25FEC14
	Offset: 0xF30
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2114b12b(entity)
{
	awareness::function_34162a25(entity);
}

/*
	Name: function_6f207918
	Namespace: namespace_ec0691f8
	Checksum: 0x310CD77F
	Offset: 0xF60
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6f207918(entity)
{
	entity.fovcosine = 0;
	entity.maxsightdistsqrd = sqr(3000);
	entity.var_1267fdea = 0;
	self namespace_85745671::function_9758722(#"super_sprint");
	awareness::function_978025e4(entity);
}

/*
	Name: function_cf29908a
	Namespace: namespace_ec0691f8
	Checksum: 0xC7A984B1
	Offset: 0xFE8
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cf29908a(entity)
{
	awareness::function_b9f81e8b(entity);
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_ec0691f8
	Checksum: 0x7F62E340
	Offset: 0x1018
	Size: 0x40C
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	spawner::add_archetype_spawn_function(#"zombie_dog", &archetypezombiedogblackboardinit);
	/#
		assert(isscriptfunctionptr(&function_5bac75b6));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_77ab4b89c5221f6a", &function_5bac75b6);
	/#
		assert(isscriptfunctionptr(&function_4cc712c8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6125f61af86f0b68", &function_4cc712c8);
	/#
		assert(isscriptfunctionptr(&function_e393f5fe));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_105b4f2a2302e4fc", &function_e393f5fe);
	/#
		assert(isscriptfunctionptr(&function_80f985a4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_39dff89e44839780", &function_80f985a4);
	/#
		assert(isscriptfunctionptr(&function_47e1bdeb));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_17b0ff54092cd3bd", &function_47e1bdeb);
	/#
		assert(isscriptfunctionptr(&function_a5103696));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_741bad83e4d39bf2", &function_a5103696);
	/#
		assert(isscriptfunctionptr(&function_648f6c9b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5dacd9fb020cb77b", &function_648f6c9b);
	/#
		assert(isscriptfunctionptr(&function_a5c4f83b));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5c24ff85e2293300", &function_a5c4f83b);
	animationstatenetwork::registeranimationmocomp("mocomp_dog_lightning_teleport", &function_90dbd41, &function_2fa3612a, &function_1f51eea3);
	animationstatenetwork::registernotetrackhandlerfunction("zombie_dog_death_vocal", &function_6f24d732);
	animationstatenetwork::registernotetrackhandlerfunction("show_hound", &function_2705e687);
}

/*
	Name: archetypezombiedogblackboardinit
	Namespace: namespace_ec0691f8
	Checksum: 0xC8C31DBA
	Offset: 0x1430
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function archetypezombiedogblackboardinit()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &archetypezombiedogonanimscriptedcallback;
}

/*
	Name: archetypezombiedogonanimscriptedcallback
	Namespace: namespace_ec0691f8
	Checksum: 0x7C4338EA
	Offset: 0x1488
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private archetypezombiedogonanimscriptedcallback(entity)
{
	entity.__blackboard = undefined;
	entity archetypezombiedogblackboardinit();
}

/*
	Name: function_2705e687
	Namespace: namespace_ec0691f8
	Checksum: 0xF1708D07
	Offset: 0x14C0
	Size: 0x1EC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2705e687(entity)
{
	entity endon(#"death");
	earthquake(0.5, 0.75, self.origin, 1000);
	if(isdefined(self.favoriteenemy))
	{
		angle = vectortoangles(self.favoriteenemy.origin - self.origin);
		angles = (self.angles[0], angle[1], self.angles[2]);
	}
	else
	{
		angles = self.angles;
	}
	self dontinterpolate();
	self forceteleport(self.origin, angles);
	self clientfield::increment("sr_dog_spawn_fx");
	self val::reset(#"dog_spawn", "takedamage");
	wait(0.1);
	self show();
	self setfreecameralockonallowed(1);
	self val::reset(#"dog_spawn", "ignoreme");
	self pathmode("move allowed");
	self clientfield::set("sr_dog_fx", 1);
}

/*
	Name: function_6f24d732
	Namespace: namespace_ec0691f8
	Checksum: 0x4C8D0E7B
	Offset: 0x16B8
	Size: 0x94
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6f24d732(params)
{
	self clientfield::set("sndAwarenessChange", 0);
	if(self.var_9fde8624 === #"hash_2a5479b83161cb35")
	{
		self playsound(#"hash_6e603d5f1970365b");
	}
	else
	{
		self playsound(#"hash_120ccc6f833fa6dc");
	}
}

/*
	Name: function_ae78134
	Namespace: namespace_ec0691f8
	Checksum: 0x170678C8
	Offset: 0x1758
	Size: 0x15A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ae78134(params)
{
	if(!isdefined(self.var_9fde8624))
	{
		blast_radius = 150;
		var_83f35abe = 20;
		var_6927cfa0 = 1;
		if(zm_utility::is_survival())
		{
			blast_radius = 100;
			var_83f35abe = 5;
		}
		radiusdamage(self.origin + vectorscale((0, 0, 1), 18), blast_radius, var_83f35abe, var_6927cfa0, undefined, "MOD_PROJECTILE_SPLASH");
		self clientfield::set("sr_dog_fx", 0);
		self ghost();
		self notsolid();
		playsoundatposition(#"zmb_hellhound_explode", self.origin);
	}
	if(namespace_5eb9b9b6::function_a82712bc(self))
	{
		function_2bf6dd1c(self);
	}
	self.var_7a68cd0c = 1;
}

/*
	Name: function_69c3e2ac
	Namespace: namespace_ec0691f8
	Checksum: 0x77DCB25F
	Offset: 0x18C0
	Size: 0x22
	Parameters: 0
	Flags: Linked, Private
*/
function private function_69c3e2ac()
{
	self.hasseenfavoriteenemy = isdefined(self.enemy_override) || isdefined(self.favoriteenemy);
}

/*
	Name: bb_getshouldhowlstatus
	Namespace: namespace_ec0691f8
	Checksum: 0x6E106306
	Offset: 0x18F0
	Size: 0xC2
	Parameters: 0
	Flags: None
*/
function bb_getshouldhowlstatus()
{
	if(self ai::has_behavior_attribute("howl_chance") && is_true(self.hasseenfavoriteenemy))
	{
		if(!isdefined(self.shouldhowl))
		{
			chance = self ai::get_behavior_attribute("howl_chance");
			self.shouldhowl = randomfloat(1) <= chance;
		}
		return (self.shouldhowl ? "howl" : "dont_howl");
	}
	return "dont_howl";
}

/*
	Name: function_5bac75b6
	Namespace: namespace_ec0691f8
	Checksum: 0xEE652F92
	Offset: 0x19C0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_5bac75b6(behaviortreeentity)
{
	return is_true(self.var_8a96267d);
}

/*
	Name: function_4cc712c8
	Namespace: namespace_ec0691f8
	Checksum: 0x49D295F2
	Offset: 0x19F0
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_4cc712c8(behaviortreeentity)
{
	return is_true(self.var_8ba6ede3);
}

/*
	Name: function_e393f5fe
	Namespace: namespace_ec0691f8
	Checksum: 0xC7F2928
	Offset: 0x1A20
	Size: 0xA8
	Parameters: 1
	Flags: Linked
*/
function function_e393f5fe(behaviortreeentity)
{
	enemy = behaviortreeentity.favoriteenemy;
	if(isplayer(enemy) && util::within_fov(enemy getplayercamerapos(), enemy getplayerangles(), behaviortreeentity.origin, 0.5))
	{
		behaviortreeentity setblackboardattribute("_dog_jump_explode", 1);
	}
	return true;
}

/*
	Name: function_80f985a4
	Namespace: namespace_ec0691f8
	Checksum: 0xC29DFA29
	Offset: 0x1AD0
	Size: 0x30
	Parameters: 1
	Flags: Linked
*/
function function_80f985a4(behaviortreeentity)
{
	if(behaviortreeentity.var_9fde8624 === #"hash_2a5479b83161cb35")
	{
		return true;
	}
	return false;
}

/*
	Name: function_2bf6dd1c
	Namespace: namespace_ec0691f8
	Checksum: 0xE8BF7D61
	Offset: 0x1B08
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_2bf6dd1c(entity)
{
	barricade = entity.traversal_blocker;
	if(isdefined(barricade))
	{
		barricade notify(#"hash_5cfbbb6ee8378665");
		return true;
	}
}

/*
	Name: use_low_attack
	Namespace: namespace_ec0691f8
	Checksum: 0xADB9F1B
	Offset: 0x1B58
	Size: 0x166
	Parameters: 0
	Flags: None
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
	Name: function_648f6c9b
	Namespace: namespace_ec0691f8
	Checksum: 0xE65DCE4A
	Offset: 0x1CC8
	Size: 0xAC
	Parameters: 1
	Flags: Linked
*/
function function_648f6c9b(behaviortreeentity)
{
	behaviortreeentity.var_8a96267d = undefined;
	behaviortreeentity clientfield::set("sr_dog_fx", 0);
	behaviortreeentity ghost();
	behaviortreeentity notsolid();
	behaviortreeentity pathmode("dont move", 1);
	playsoundatposition(#"zmb_hellhound_explode", behaviortreeentity.origin);
}

/*
	Name: function_a5c4f83b
	Namespace: namespace_ec0691f8
	Checksum: 0xA3B8E327
	Offset: 0x1D80
	Size: 0x20
	Parameters: 1
	Flags: Linked
*/
function function_a5c4f83b(behaviortreeentity)
{
	behaviortreeentity notify(#"is_underground");
}

/*
	Name: function_47e1bdeb
	Namespace: namespace_ec0691f8
	Checksum: 0xBB5D1072
	Offset: 0x1DA8
	Size: 0x2E
	Parameters: 1
	Flags: Linked
*/
function function_47e1bdeb(behaviortreeentity)
{
	behaviortreeentity solid();
	behaviortreeentity.var_8ba6ede3 = undefined;
}

/*
	Name: function_a5103696
	Namespace: namespace_ec0691f8
	Checksum: 0xA56D7C2F
	Offset: 0x1DE0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_a5103696(behaviortreeentity)
{
	behaviortreeentity thread function_1980a07a(behaviortreeentity);
}

/*
	Name: function_1980a07a
	Namespace: namespace_ec0691f8
	Checksum: 0x5CFC90C5
	Offset: 0x1E10
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1980a07a(behaviortreeentity)
{
	behaviortreeentity endon(#"death");
	behaviortreeentity pathmode("move allowed");
	behaviortreeentity.var_8ba6ede3 = undefined;
	behaviortreeentity notify(#"hash_661885e7a60ccf04");
}

/*
	Name: function_90dbd41
	Namespace: namespace_ec0691f8
	Checksum: 0xB2174E5
	Offset: 0x1E70
	Size: 0x7C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_90dbd41(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration clientfield::increment("sr_dog_spawn_fx");
	mocompduration ghost();
	mocompduration notsolid();
}

/*
	Name: function_2fa3612a
	Namespace: namespace_ec0691f8
	Checksum: 0x476A0C45
	Offset: 0x1EF8
	Size: 0x2C
	Parameters: 5
	Flags: Linked, Private
*/
function private function_2fa3612a(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
}

/*
	Name: function_1f51eea3
	Namespace: namespace_ec0691f8
	Checksum: 0x99D9E844
	Offset: 0x1F30
	Size: 0xCC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_1f51eea3(entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration)
{
	mocompduration dontinterpolate();
	mocompduration forceteleport(mocompduration.traverseendnode.origin, mocompduration.traverseendnode.angles, 0);
	mocompduration clientfield::increment("sr_dog_spawn_fx");
	mocompduration show();
	mocompduration solid();
}

/*
	Name: function_d005c417
	Namespace: namespace_ec0691f8
	Checksum: 0x9CF2DF46
	Offset: 0x2008
	Size: 0x49C
	Parameters: 1
	Flags: Linked
*/
function function_d005c417(entity)
{
	if(is_true(entity.var_1fa24724))
	{
		if(!isplayer(entity.enemy) || ((float(gettime() - entity.enemy.var_dbb28b34)) / 1000) > 5)
		{
			entity.var_6324ed63 = undefined;
		}
		if(isdefined(entity.origin))
		{
			goal = getclosestpointonnavmesh(entity.origin, 2 * 39.37008, entity getpathfindingradius() * 1.2);
		}
		if(isdefined(goal))
		{
			entity setgoal(goal);
		}
		else
		{
			entity setgoal(self.origin);
		}
	}
	if(!isdefined(entity.enemy_override) && !isdefined(entity.attackable) && !awareness::function_2bc424fd(entity, entity.enemy))
	{
		awareness::set_state(entity, #"wander");
		return;
	}
	if(isdefined(entity.var_b238ef38) && isdefined(entity.var_b238ef38.position) && is_true(entity.var_b238ef38.slot.var_bb075e37))
	{
		entity namespace_e292b080::zombieupdategoal(entity.var_b238ef38.position);
		return;
	}
	if(isdefined(entity.enemy_override))
	{
		goal = getclosestpointonnavmesh(entity.enemy_override.origin, 200, entity getpathfindingradius() * 1.2);
		if(isdefined(goal))
		{
			entity setgoal(goal);
			entity namespace_e292b080::zombieupdategoal(goal);
			return;
		}
	}
	if(isdefined(entity.favoriteenemy))
	{
		if(isentity(entity) && isentity(entity.enemy))
		{
			lastknownpos = entity lastknownpos(entity.enemy);
		}
		if(isdefined(lastknownpos))
		{
			in_vehicle = isdefined(entity.favoriteenemy) && isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle();
			if(in_vehicle)
			{
				lastknownpos = namespace_85745671::function_401070dd();
			}
			if(isvec(lastknownpos))
			{
				goal = getclosestpointonnavmesh(lastknownpos, 200, entity getpathfindingradius() * 1.2);
			}
			if(isdefined(goal))
			{
				entity namespace_e292b080::zombieupdategoal(goal);
			}
		}
	}
	else if(isvec(entity.origin))
	{
		goal = getclosestpointonnavmesh(entity.origin, 200, entity getpathfindingradius() * 1.2);
		if(isdefined(goal))
		{
			entity namespace_e292b080::zombieupdategoal(goal);
		}
		else
		{
			entity setgoal(self.origin);
		}
	}
}

