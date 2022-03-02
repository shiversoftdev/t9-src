#using script_178024232e91b0a1;
#using script_3411bb48d41bd3b;
#using script_3a704cbcf4081bfb;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_6809bf766eba194a;
#using script_7e59d7bba853fe4b;
#using script_caf007e2a98afa2;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace namespace_6c0f4217;

/*
	Name: function_44bb4720
	Namespace: namespace_6c0f4217
	Checksum: 0x2F0D7713
	Offset: 0x3B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_44bb4720()
{
	level notify(2012376309);
}

/*
	Name: function_89f2df9
	Namespace: namespace_6c0f4217
	Checksum: 0xF0635FF9
	Offset: 0x3D0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_46d4e8c43622004a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_6c0f4217
	Checksum: 0xB5789DF5
	Offset: 0x418
	Size: 0x254
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(!isarchetypeloaded(#"mimic"))
	{
		return;
	}
	clientfield::register("actor", "" + #"hash_2f1c34ea62d86c57", 1, 1, "int");
	clientfield::register("toplayer", "mimic_force_stream", 1, 1, "int");
	clientfield::register("actor", "mimic_emerge_fx", 1, 1, "int");
	clientfield::register("toplayer", "mimic_attack_hit", 1, 1, "int");
	clientfield::register("toplayer", "mimic_grab_hit", 1, 1, "int");
	clientfield::register("actor", "mimic_weakpoint_fx", 1, 1, "int");
	clientfield::register("scriptmover", "mimic_prop_lure_fx", 16000, 1, "int");
	clientfield::register("actor", "mimic_death_gib_fx", 1, 1, "int");
	clientfield::register("toplayer", "mimic_bite_hit", 16000, 1, "counter");
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"mimic", &function_9e93acd1);
	namespace_be0f9d50::init();
	/#
		function_b2616fd7();
	#/
}

/*
	Name: function_9e93acd1
	Namespace: namespace_6c0f4217
	Checksum: 0xF81BF4D4
	Offset: 0x678
	Size: 0x13A
	Parameters: 0
	Flags: Linked
*/
function function_9e93acd1()
{
	function_5c843fec();
	self setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	self callback::on_death(&function_6a99dcd1);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_33960526);
	self callback::function_d8abfc3d(#"hash_484127e0cbd8f8cb", &function_1ef44bfb);
	self.var_6f5b56f6 = 0;
	self.var_6467a1c = 0;
	self callback::function_d8abfc3d(#"hash_11aa32ad6d527054", &function_931c3820);
	self clientfield::set("mimic_weakpoint_fx", 1);
	self.var_847ab632 = &function_caa61267;
}

/*
	Name: function_6a99dcd1
	Namespace: namespace_6c0f4217
	Checksum: 0x8CF5E430
	Offset: 0x7C0
	Size: 0x234
	Parameters: 1
	Flags: Linked
*/
function function_6a99dcd1(params)
{
	level endon(#"game_ended");
	self endon(#"death", #"entitydeleted");
	if(is_true(self.var_655fccbb))
	{
		return;
	}
	self.var_655fccbb = 1;
	if(self.damagemod === "MOD_CRUSH" && isplayer(self.attacker) && self.attacker isinvehicle())
	{
		playfx(#"hash_394bead400fb65a0", self.origin);
		self deletedelay();
		return;
	}
	if(self isplayinganimscripted())
	{
		self stopanimscripted(0, 1);
		self notsolid();
		anim_time = getanimlength(#"hash_5e5bb6d5393f508e");
		self animscripted(#"hash_f4dc819c820cb3f", self.origin, self.angles, #"hash_5e5bb6d5393f508e", "normal", undefined, 1, 0.2);
		self waittilltimeout(anim_time, {#notetrack:"end"}, #"hash_5e5bb6d5393f508e");
		if(isdefined(self))
		{
			self deletedelay();
		}
	}
}

/*
	Name: function_33960526
	Namespace: namespace_6c0f4217
	Checksum: 0x1CEE0A50
	Offset: 0xA00
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_33960526(params)
{
	self notsolid();
	namespace_be0f9d50::function_8c7b02b0(self);
}

/*
	Name: function_5c843fec
	Namespace: namespace_6c0f4217
	Checksum: 0x72D5A33E
	Offset: 0xA48
	Size: 0x4A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_5c843fec()
{
	blackboard::createblackboardforentity(self);
	self.___archetypeonanimscriptedcallback = &function_91dbc944;
	self.___archetypeonbehavecallback = &function_cc066c14;
}

/*
	Name: function_91dbc944
	Namespace: namespace_6c0f4217
	Checksum: 0x3A48DED8
	Offset: 0xAA0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_91dbc944(entity)
{
	entity.__blackboard = undefined;
	entity function_5c843fec();
}

/*
	Name: function_cc066c14
	Namespace: namespace_6c0f4217
	Checksum: 0x58557FEA
	Offset: 0xAD8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc066c14(entity)
{
	entity.keepclaimednode = 0;
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_6c0f4217
	Checksum: 0x5783B444
	Offset: 0xAF8
	Size: 0x76C
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_ce7cc822));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2d48c1194e87de26", &function_ce7cc822);
	/#
		assert(isscriptfunctionptr(&function_1cd29506));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_332bdf71be5c0dc9", &function_1cd29506);
	/#
		assert(isscriptfunctionptr(&function_b773e233));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_49cd4dd204633bfe", &function_b773e233);
	/#
		assert(isscriptfunctionptr(&function_e955e6e1));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_129489a91f88a6f9", &function_e955e6e1);
	/#
		assert(isscriptfunctionptr(&function_4eb15d93));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_248d62b738ab1ca0", &function_4eb15d93);
	/#
		assert(isscriptfunctionptr(&function_d4d23d4a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1a4b21648a0c98a9", &function_d4d23d4a);
	/#
		assert(isscriptfunctionptr(&function_d577e006));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_55836e8f1dc1426e", &function_d577e006);
	/#
		assert(isscriptfunctionptr(&function_59fd3f1d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_413bf2f81ac3089f", &function_59fd3f1d);
	/#
		assert(isscriptfunctionptr(&function_cf8f5cca));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_693f6d1f82cb9a7a", &function_cf8f5cca);
	/#
		assert(isscriptfunctionptr(&function_d3b009d4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7e3b668935979156", &function_d3b009d4);
	/#
		assert(!isdefined(&function_15ef07a4) || isscriptfunctionptr(&function_15ef07a4));
	#/
	/#
		assert(!isdefined(&function_5f11c5b7) || isscriptfunctionptr(&function_5f11c5b7));
	#/
	/#
		assert(!isdefined(&function_5b50f629) || isscriptfunctionptr(&function_5b50f629));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_2278f951c4d99cef", &function_15ef07a4, &function_5f11c5b7, &function_5b50f629);
	/#
		assert(isscriptfunctionptr(&function_3678cec8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_a7de028e2afdb64", &function_3678cec8);
	/#
		assert(isscriptfunctionptr(&function_5eb9b69e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3099a99e0cb59557", &function_5eb9b69e);
	/#
		assert(isscriptfunctionptr(&function_cc64096c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1394a7bab6b295f", &function_cc64096c);
	/#
		assert(isscriptfunctionptr(&function_8177d507));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_234bec6511a23130", &function_8177d507);
	animationstatenetwork::registernotetrackhandlerfunction("mimic_bite", &function_20d2827d);
	animationstatenetwork::registernotetrackhandlerfunction("mimic_death_hide", &function_5c840d7b);
	animationstatenetwork::registernotetrackhandlerfunction("mimic_death_head_explosion", &function_2d4df50a);
}

/*
	Name: function_931c3820
	Namespace: namespace_6c0f4217
	Checksum: 0xF91C87F1
	Offset: 0x1270
	Size: 0x14E
	Parameters: 1
	Flags: Linked
*/
function function_931c3820(params)
{
	self endon(#"death");
	nearby_ai = getentitiesinradius(self.origin, self.meleeweapon.var_d3cafde6, 15);
	foreach(ai in nearby_ai)
	{
		if(isalive(ai) && (absangleclamp180(ai.angles[1] - (vectortoangles(self.origin - ai.origin)[1]))) <= 45)
		{
			ai zombie_utility::setup_zombie_knockdown(self);
			waitframe(1);
		}
	}
}

/*
	Name: function_caa61267
	Namespace: namespace_6c0f4217
	Checksum: 0x74777BD2
	Offset: 0x13C8
	Size: 0x5A0
	Parameters: 0
	Flags: Linked
*/
function function_caa61267()
{
	var_9051190 = [];
	nearby_players = function_a1ef346b(undefined, self.origin, self.meleeweapon.var_d3cafde6);
	foreach(player in nearby_players)
	{
		if(isdefined(self.var_f6fd2062) && ![[self.var_f6fd2062]](player))
		{
			continue;
		}
		in_vehicle = player isinvehicle();
		var_7bbf287d = (in_vehicle ? 80 : 45);
		if(!isalive(player) || (absangleclamp180(self.angles[1] - (vectortoangles(player.origin - self.origin)[1]))) > var_7bbf287d)
		{
			continue;
		}
		if(in_vehicle)
		{
			vehicle = player getvehicleoccupied();
			if(!isinarray(var_9051190, vehicle))
			{
				self namespace_85745671::function_2713ff17(vehicle, self.var_a0193213);
				self namespace_85745671::function_e441487e(vehicle);
				if(!isdefined(var_9051190))
				{
					var_9051190 = [];
				}
				else if(!isarray(var_9051190))
				{
					var_9051190 = array(var_9051190);
				}
				var_9051190[var_9051190.size] = vehicle;
			}
			if(!is_true(vehicle.var_9a6644f2))
			{
				player dodamage(50, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
			}
			continue;
		}
		player dodamage(50, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
	}
	var_1ff1751 = 1.2;
	var_15978c43 = getentitiesinradius(self.origin, self.meleeweapon.var_d3cafde6 * var_1ff1751, 12);
	foreach(vehicle in var_15978c43)
	{
		if(isinarray(var_9051190, vehicle))
		{
			continue;
		}
		if(absangleclamp180(self.angles[1] - (vectortoangles(vehicle.origin - self.origin)[1])) > 80)
		{
			continue;
		}
		self namespace_85745671::function_2713ff17(vehicle, self.var_a0193213);
		self namespace_85745671::function_e441487e(vehicle);
		if(!isdefined(var_9051190))
		{
			var_9051190 = [];
		}
		else if(!isarray(var_9051190))
		{
			var_9051190 = array(var_9051190);
		}
		var_9051190[var_9051190.size] = vehicle;
	}
	attackables = [];
	if(isdefined(level.attackables) && level.attackables.size > 0)
	{
		attackables = arraysortclosest(level.attackables, self.origin, undefined, undefined, self.meleeweapon.var_d3cafde6);
	}
	foreach(attackable in attackables)
	{
		if(isinarray(var_9051190, attackable))
		{
			continue;
		}
		attackable dodamage(50, self.origin, self, self, 0, "MOD_MELEE", 0, self.weapon);
	}
}

/*
	Name: function_ce7cc822
	Namespace: namespace_6c0f4217
	Checksum: 0x3607D2AD
	Offset: 0x1970
	Size: 0x1AA
	Parameters: 1
	Flags: Linked
*/
function function_ce7cc822(entity)
{
	enemy = namespace_e0710ee6::function_825317c(entity);
	if(!isdefined(enemy) || isentity(enemy))
	{
		return false;
	}
	var_ff38566a = lengthsquared(enemy getvelocity());
	var_17c3916f = sqr(100);
	if(var_ff38566a < sqr(175))
	{
		var_17c3916f = sqr(190);
	}
	if(!is_true(level.intermission))
	{
		if(distancesquared(entity.origin, enemy.origin) > var_17c3916f)
		{
			return false;
		}
	}
	yawtoenemy = angleclamp180(entity.angles[1] - (vectortoangles(enemy.origin - entity.origin)[1]));
	if(abs(yawtoenemy) > 60)
	{
		return false;
	}
	return true;
}

/*
	Name: function_1cd29506
	Namespace: namespace_6c0f4217
	Checksum: 0x8DAE410
	Offset: 0x1B28
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_1cd29506(entity)
{
	return !is_true(entity.var_43c4bc66) && is_true(entity.should_hide) && (isdefined(entity.var_a6fe91fd) || namespace_be0f9d50::function_1541ff3a());
}

/*
	Name: function_b773e233
	Namespace: namespace_6c0f4217
	Checksum: 0xAB7D86A3
	Offset: 0x1BA0
	Size: 0x14C
	Parameters: 1
	Flags: Linked
*/
function function_b773e233(entity)
{
	result = 0;
	if(!isdefined(entity.var_a6fe91fd) || !entity.var_a6fe91fd.size)
	{
		result = namespace_be0f9d50::function_861757a2(entity);
	}
	/#
		if(is_true(level.var_bce8fb65))
		{
			println(("" + "") + entity getentitynumber() + (result ? "" : ""));
		}
	#/
	/#
		if(is_true(level.var_bce8fb65))
		{
			println(("" + "") + entity getentitynumber() + (isdefined(entity.var_a6fe91fd) ? "" : ""));
		}
	#/
}

/*
	Name: function_3336041e
	Namespace: namespace_6c0f4217
	Checksum: 0xB66DDF75
	Offset: 0x1CF8
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_3336041e(entity)
{
	namespace_be0f9d50::function_8c7b02b0(entity);
}

/*
	Name: function_e955e6e1
	Namespace: namespace_6c0f4217
	Checksum: 0x59A25F6B
	Offset: 0x1D28
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_e955e6e1(entity)
{
	if(hasasm(entity) && entity asmgetstatus() == "asm_status_complete")
	{
		function_5fa4b25d(entity);
	}
	function_3336041e(entity);
}

/*
	Name: function_5fa4b25d
	Namespace: namespace_6c0f4217
	Checksum: 0xF3649DEF
	Offset: 0x1DB0
	Size: 0x1BE
	Parameters: 1
	Flags: Linked
*/
function function_5fa4b25d(entity)
{
	entity clientfield::set("mimic_weakpoint_fx", 0);
	if(isdefined(entity.var_a6fe91fd))
	{
		arrayremovevalue(entity.var_a6fe91fd, undefined, 0);
	}
	props = entity.var_a6fe91fd;
	var_1386d828 = entity.var_1386d828;
	var_98b1552 = !isdefined(var_1386d828);
	if(isdefined(var_1386d828.spawn_loc.var_da70348d))
	{
		var_98b1552 = 1;
		level thread namespace_be0f9d50::function_175bb809(var_1386d828);
		arrayremovevalue(entity.var_a6fe91fd, var_1386d828);
		entity.var_1386d828 = undefined;
	}
	var_9b487a9b = function_21a3a673(3, 5);
	if(var_98b1552 && namespace_be0f9d50::function_1541ff3a(1, entity))
	{
		namespace_be0f9d50::function_51012821(entity.origin, entity, undefined, var_9b487a9b);
		entity.should_hide = 0;
		return;
	}
	if(isdefined(var_1386d828))
	{
		var_1386d828.origin = entity.origin;
	}
	namespace_be0f9d50::function_913ecbbc(props, entity, var_1386d828, entity.origin);
	entity.should_hide = 0;
}

/*
	Name: function_1ef44bfb
	Namespace: namespace_6c0f4217
	Checksum: 0x64A4EE28
	Offset: 0x1F78
	Size: 0x41C
	Parameters: 1
	Flags: Linked
*/
function function_1ef44bfb(params)
{
	prop = self.var_1386d828;
	angles = (isdefined(prop.angles) ? prop.angles : self.angles);
	origin = (isdefined(prop.origin) ? prop.origin : self.origin);
	activator = undefined;
	if(isdefined(params.var_ef7458f2) && isentity(params.var_ef7458f2[0]))
	{
		activator = params.var_ef7458f2[0];
		angles = vectortoangles(activator.origin - origin);
	}
	self forceteleport(self.origin, angles, 1, 1);
	if(self ispaused())
	{
		self setentitypaused(0);
	}
	self clientfield::set("mimic_emerge_fx", 1);
	self solid();
	self val::reset(#"hash_263a780666aef25", "hide");
	self.var_2ca2d270 = undefined;
	self.var_e8920729 = 0;
	self.clamptonavmesh = 0;
	self pathmode("move allowed");
	self clientfield::set("mimic_weakpoint_fx", 1);
	dist_sqr = 0;
	if(isdefined(activator))
	{
		dist_sqr = distancesquared(activator.origin, self.origin);
	}
	if(isplayer(activator) && dist_sqr < sqr(96))
	{
		self.var_34e5b945 = 1;
	}
	else
	{
		self.var_a516906f = {#angles:(0, angles[1], 0), #origin:origin};
		self.var_a516906f.anim = #"ai_t9_zm_mimic_com_emerge_prop_quick_f_01";
		if(dist_sqr > sqr(200))
		{
			if(isentity(activator))
			{
				var_8a9e27f9 = self getcentroid();
				end_point = var_8a9e27f9 + ((vectornormalize(activator getcentroid() - var_8a9e27f9)) * 200);
				if(bullettracepassed(var_8a9e27f9, end_point, 0, self, activator))
				{
					self.var_a516906f.anim = #"hash_6194bdd16068478f";
				}
			}
		}
		/#
			recordcircle(self.origin, 200, (1, 1, 1));
		#/
		self animcustom(&function_f3b371f1);
	}
	self function_9e27379a();
}

/*
	Name: function_9e27379a
	Namespace: namespace_6c0f4217
	Checksum: 0x24968E6B
	Offset: 0x23A0
	Size: 0x150
	Parameters: 0
	Flags: Linked
*/
function function_9e27379a()
{
	players = function_a1ef346b(undefined, self.origin, 200);
	foreach(player in players)
	{
		targetorigin = (player.origin[0], player.origin[1], self.origin[2]);
		var_a6470558 = vectornormalize(targetorigin - self.origin);
		player playerknockback(1);
		player applyknockback(100, var_a6470558);
		player playerknockback(0);
	}
}

/*
	Name: function_4654959e
	Namespace: namespace_6c0f4217
	Checksum: 0xC6BF152B
	Offset: 0x24F8
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_4654959e(notifyhash)
{
	self clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

/*
	Name: function_f3b371f1
	Namespace: namespace_6c0f4217
	Checksum: 0x6CEC86F7
	Offset: 0x2540
	Size: 0x1AC
	Parameters: 0
	Flags: Linked
*/
function function_f3b371f1()
{
	self endoncallback(&function_4654959e, #"death", #"killanimscript");
	self clientfield::set("" + #"hash_2f1c34ea62d86c57", 0);
	self orientmode("face angle", self.var_a516906f.angles[1]);
	self animmode("nogravity");
	self pathmode("dont move", 1);
	self animscripted(self.var_a516906f.anim, self.var_a516906f.origin, self.angles, self.var_a516906f.anim, "custom");
	wait(getanimlength(self.var_a516906f.anim));
	self.clamptonavmesh = 1;
	self pathmode("move allowed");
	self.var_9d11c76e = undefined;
	self clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

/*
	Name: function_4eb15d93
	Namespace: namespace_6c0f4217
	Checksum: 0xFC90AF1D
	Offset: 0x26F8
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_4eb15d93(entity)
{
	return is_true(entity.var_34e5b945);
}

/*
	Name: function_d4d23d4a
	Namespace: namespace_6c0f4217
	Checksum: 0x86077522
	Offset: 0x2728
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_d4d23d4a(entity)
{
}

/*
	Name: function_d577e006
	Namespace: namespace_6c0f4217
	Checksum: 0xE0179CDF
	Offset: 0x2740
	Size: 0x56
	Parameters: 1
	Flags: Linked
*/
function function_d577e006(entity)
{
	entity.clamptonavmesh = 1;
	entity.var_34e5b945 = undefined;
	entity.var_6f5b56f6 = gettime() + (int(5 * 1000));
}

/*
	Name: function_59fd3f1d
	Namespace: namespace_6c0f4217
	Checksum: 0xB2E1EBA3
	Offset: 0x27A0
	Size: 0x1AC
	Parameters: 1
	Flags: Linked
*/
function function_59fd3f1d(entity)
{
	players = function_a1ef346b(undefined, entity.origin, 96);
	closest_player = arraygetclosest(entity.origin, players);
	if(!isdefined(closest_player) || closest_player isplayinganimscripted() || (isdefined(entity.var_f6fd2062) && ![[entity.var_f6fd2062]](closest_player)))
	{
		return;
	}
	if((absangleclamp180(self.angles[1] - (vectortoangles(closest_player.origin - self.origin)[1]))) < 30 && !function_4f401255(entity.origin, entity.angles, #"hash_5cfca059cd6fdb4c", closest_player getmins(), closest_player getmaxs(), [1:closest_player, 0:entity]))
	{
		self thread grab_player(closest_player, #"hash_49907200665866a4", 0, #"hash_5cfca059cd6fdb4c");
	}
}

/*
	Name: function_cf8f5cca
	Namespace: namespace_6c0f4217
	Checksum: 0x5B124257
	Offset: 0x2958
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_cf8f5cca(entity)
{
}

/*
	Name: function_4f401255
	Namespace: namespace_6c0f4217
	Checksum: 0xA855595D
	Offset: 0x2970
	Size: 0x27C
	Parameters: 6
	Flags: Linked
*/
function function_4f401255(start_origin, start_angles, player_anim, mins, maxs, &var_d72e649c)
{
	var_cc01fa57 = vectorscale((0, 0, 1), 15);
	var_f60dbcf6 = getstartorigin(start_origin, start_angles, player_anim);
	player_start_angles = getstartangles(start_origin, start_angles, player_anim);
	move_delta = getmovedelta(player_anim, 0, 0.5);
	move_delta = rotatepoint(move_delta, player_start_angles);
	var_d26e393f = var_f60dbcf6 + move_delta;
	var_603d4563 = var_f60dbcf6 + (isdefined(var_cc01fa57) ? var_cc01fa57 : (0, 0, 0));
	/#
		recordstar(var_f60dbcf6, (0, 1, 0), "");
		recordline(var_d26e393f, var_f60dbcf6, (0, 1, 0), "");
		recordstar(var_603d4563 + (var_603d4563 == var_f60dbcf6 ? (0, 0, 1) : (0, 0, 0)), (1, 1, 0), "");
		recordline(var_603d4563 + (var_603d4563 == var_f60dbcf6 ? (0, 0, 1) : (0, 0, 0)), var_603d4563, var_d26e393f, (1, 1, 0));
	#/
	trace_result = physicstraceex(var_d26e393f, var_603d4563, mins, maxs, var_d72e649c);
	/#
		if(trace_result[#"fraction"] < 1)
		{
			record3dtext("", var_f60dbcf6, (1, 0, 0), "");
			recordstar(var_d26e393f + ((var_603d4563 - var_d26e393f) * trace_result[#"fraction"]), (1, 0, 0));
		}
	#/
	return trace_result[#"fraction"] < 1;
}

/*
	Name: function_435d7c54
	Namespace: namespace_6c0f4217
	Checksum: 0xA63263F4
	Offset: 0x2BF8
	Size: 0x174
	Parameters: 2
	Flags: Linked
*/
function function_435d7c54(origin, angles)
{
	end_origin = origin + (anglestoforward(angles) * 202);
	/#
		recordstar(end_origin, (1, 0.5, 0), "");
		recordline(origin, end_origin, (1, 0.5, 0), "");
	#/
	trace_result = physicstrace(origin, end_origin, (-4, -4, -16), (4, 4, 16), undefined, 2);
	/#
		if(trace_result[#"fraction"] < 1)
		{
			record3dtext("", end_origin, (1, 0, 0), "");
			recordstar(origin + ((end_origin - origin) * trace_result[#"fraction"]), (1, 0, 0));
		}
	#/
	return trace_result[#"fraction"] < 1;
}

/*
	Name: grab_player
	Namespace: namespace_6c0f4217
	Checksum: 0xA934400F
	Offset: 0x2D78
	Size: 0x154
	Parameters: 4
	Flags: Linked
*/
function grab_player(player, var_1b024168, var_52a75904, player_anim)
{
	self endon(#"death");
	level endon(#"game_ended");
	origin = self.origin;
	angles = self.angles;
	waittillframeend();
	if(!isalive(self))
	{
		return;
	}
	self animscripted(var_1b024168, origin, angles, var_1b024168, "normal", undefined, 1, var_52a75904);
	player thread function_224f342a(player_anim, self, origin, angles);
	anim_time = getanimlength(var_1b024168);
	self waittilltimeout(anim_time, {#notetrack:"end"}, var_1b024168);
	self clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

/*
	Name: function_224f342a
	Namespace: namespace_6c0f4217
	Checksum: 0xCDACA3D7
	Offset: 0x2ED8
	Size: 0x2DC
	Parameters: 4
	Flags: Linked, Private
*/
function private function_224f342a(player_anim, mimic, origin, angles)
{
	self endon(#"death", #"disconnect");
	level endon(#"game_ended");
	player = self;
	player thread function_66eaacd9();
	callback::callback(#"hash_3065435e3005a796", {#player:player});
	player val::set(#"hash_43ae43be63a51874", "ignoreme", 1);
	player clientfield::set_to_player("mimic_grab_hit", 1);
	player.var_7342424d = mimic;
	player animscripted(player_anim, origin, angles, player_anim, "normal", undefined, 1, 0.2, 0.3, 0, 1, 1, undefined, 0, "linear", 0);
	anim_time = getanimlength(player_anim);
	player waittilltimeout(anim_time, {#notetrack:"end"}, player_anim);
	while(isdefined(player) && player isplayinganimscripted())
	{
		waitframe(1);
	}
	if(isdefined(player))
	{
		callback::callback(#"hash_2745091e63972f13", {#player:player});
		if(isdefined(mimic))
		{
			var_aa80d8e1 = player.origin - origin;
			player applyknockback(200, (var_aa80d8e1[0], var_aa80d8e1[1], 10));
		}
		player val::reset(#"hash_43ae43be63a51874", "ignoreme");
		player.var_7342424d = undefined;
		player clientfield::set_to_player("mimic_attack_hit", 0);
		player clientfield::set_to_player("mimic_grab_hit", 0);
	}
}

/*
	Name: function_66eaacd9
	Namespace: namespace_6c0f4217
	Checksum: 0x2CAEFECB
	Offset: 0x31C0
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_66eaacd9()
{
	self waittill(#"hash_471418cd7f391bb1");
	self clientfield::set_to_player("mimic_attack_hit", 1);
}

/*
	Name: function_d3b009d4
	Namespace: namespace_6c0f4217
	Checksum: 0x83856090
	Offset: 0x3208
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function function_d3b009d4(entity)
{
	if(entity.var_6f5b56f6 > gettime() || !isplayer(entity.favoriteenemy) || distancesquared(entity.favoriteenemy.origin, entity.origin) > sqr(96))
	{
		return 0;
	}
	if(isdefined(entity.var_f6fd2062) && ![[entity.var_f6fd2062]](entity.favoriteenemy))
	{
		return 0;
	}
	if(isplayer(entity.favoriteenemy) && entity.favoriteenemy isinvehicle())
	{
		return 0;
	}
	if(function_435d7c54(entity gettagorigin("j_spine4"), entity.angles))
	{
		return 0;
	}
	return !function_4f401255(entity.origin, entity.angles, #"hash_770f46ba71e975e9", entity.favoriteenemy getmins(), entity.favoriteenemy getmaxs(), [1:entity.favoriteenemy, 0:entity]);
}

/*
	Name: function_15ef07a4
	Namespace: namespace_6c0f4217
	Checksum: 0x84E4E334
	Offset: 0x33D8
	Size: 0x60
	Parameters: 2
	Flags: Linked
*/
function function_15ef07a4(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity clientfield::set("" + #"hash_2f1c34ea62d86c57", 0);
	return 5;
}

/*
	Name: function_5f11c5b7
	Namespace: namespace_6c0f4217
	Checksum: 0xBBD8D6C6
	Offset: 0x3440
	Size: 0x478
	Parameters: 2
	Flags: Linked
*/
function function_5f11c5b7(entity, asmstatename)
{
	if(asmstatename asmgetstatus() == "asm_status_complete")
	{
		return 4;
	}
	if(!isdefined(asmstatename.var_50a08864))
	{
		notetracks = getnotetracktimes(asmstatename asmgetcurrentdeltaanimation(), "tentacle_launch_start");
		if(notetracks.size > 0)
		{
			asmstatename.var_50a08864 = notetracks[0];
		}
	}
	else if(asmstatename getanimtime(asmstatename asmgetcurrentdeltaanimation()) <= asmstatename.var_50a08864)
	{
		return 5;
	}
	var_52b615cf = (4, 4, 16) - (-4, -4, -16);
	var_2ed29acc = asmstatename gettagorigin("j_tentacle_04_ri");
	var_1ed13caa = asmstatename gettagorigin("j_tentacle_01_ri");
	var_a36e995b = asmstatename gettagorigin("j_tentacle_04_le");
	var_e49586c9 = asmstatename gettagorigin("j_tentacle_01_le");
	closest_player = arraygetclosest(var_2ed29acc, function_a1ef346b());
	/#
		if(is_true(level.var_ec72eeae))
		{
			recordstar(var_2ed29acc, (0, 1, 0), "");
			recordline(var_1ed13caa, var_2ed29acc, (0, 1, 0), "");
			recordstar(math::closest_point_on_line(closest_player.origin, var_1ed13caa, var_2ed29acc), (1, 0, 1), "");
			recordstar(var_a36e995b, (0, 1, 0), "");
			recordline(var_e49586c9, var_a36e995b, (0, 1, 0), "");
			recordstar(math::closest_point_on_line(closest_player.origin, var_e49586c9, var_a36e995b), (1, 0, 1), "");
		}
	#/
	if(!isdefined(closest_player) || closest_player isplayinganimscripted() || (isdefined(asmstatename.var_f6fd2062) && ![[asmstatename.var_f6fd2062]](closest_player)) || !istouching(math::closest_point_on_line(closest_player.origin, var_1ed13caa, var_2ed29acc), closest_player, var_52b615cf) || !istouching(math::closest_point_on_line(closest_player.origin, var_e49586c9, var_a36e995b), closest_player, var_52b615cf))
	{
		return 5;
	}
	if(!function_4f401255(asmstatename.origin, asmstatename.angles, #"hash_770f46ba71e975e9", closest_player getmins(), closest_player getmaxs(), [1:closest_player, 0:asmstatename]))
	{
		asmstatename thread grab_player(closest_player, #"hash_318ef3b5409e6403", 0.2, #"hash_770f46ba71e975e9");
	}
	return 5;
}

/*
	Name: function_5b50f629
	Namespace: namespace_6c0f4217
	Checksum: 0xE6EF78E7
	Offset: 0x38C0
	Size: 0x4E
	Parameters: 2
	Flags: Linked
*/
function function_5b50f629(entity, asmstatename)
{
	asmstatename.var_6f5b56f6 = gettime() + (int(5 * 1000));
	asmstatename.var_50a08864 = undefined;
	return 4;
}

/*
	Name: function_3678cec8
	Namespace: namespace_6c0f4217
	Checksum: 0xF6153A10
	Offset: 0x3918
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_3678cec8(entity)
{
}

/*
	Name: function_5eb9b69e
	Namespace: namespace_6c0f4217
	Checksum: 0xBE2A6308
	Offset: 0x3930
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_5eb9b69e(entity)
{
	entity clientfield::set("" + #"hash_2f1c34ea62d86c57", 1);
}

/*
	Name: function_20d2827d
	Namespace: namespace_6c0f4217
	Checksum: 0x1EBCFDB2
	Offset: 0x3980
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_20d2827d(entity)
{
	hitent = entity melee();
	if(isplayer(hitent))
	{
		hitent clientfield::increment_to_player("mimic_bite_hit", 1);
	}
}

/*
	Name: function_5c840d7b
	Namespace: namespace_6c0f4217
	Checksum: 0xE7088959
	Offset: 0x39F0
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_5c840d7b(entity)
{
	entity ghost();
	entity notsolid();
	self clientfield::set("mimic_death_gib_fx", 1);
}

/*
	Name: function_2d4df50a
	Namespace: namespace_6c0f4217
	Checksum: 0xCF010837
	Offset: 0x3A58
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_2d4df50a(entity)
{
	if(entity haspart("j_head", "c_t9_zmb_mimic_head") && !entity isattached(#"hash_25e5543fd258a1a6"))
	{
		entity hidepart("j_head", "c_t9_zmb_mimic_head", 1);
		entity attach(#"hash_25e5543fd258a1a6");
	}
}

/*
	Name: function_cc64096c
	Namespace: namespace_6c0f4217
	Checksum: 0x4E037023
	Offset: 0x3B08
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_cc64096c(entity)
{
	decision = randomint(2);
	entity setblackboardattribute("_ranged_attack_variant", decision);
}

/*
	Name: function_8177d507
	Namespace: namespace_6c0f4217
	Checksum: 0x5C8381CA
	Offset: 0x3B68
	Size: 0x2A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8177d507(entity)
{
	entity.var_205ab08b = 1;
	entity.var_1087b4ab = "j_helmet";
}

/*
	Name: function_b2616fd7
	Namespace: namespace_6c0f4217
	Checksum: 0x1C9A8FFE
	Offset: 0x3BA0
	Size: 0x86C
	Parameters: 0
	Flags: None
*/
function function_b2616fd7()
{
	/#
		function_5ac4dc99(#"hash_63d887d4b23cb6e", "");
		function_cd140ee9(#"hash_63d887d4b23cb6e", &function_c19802);
		util::function_345e5b9a("");
		util::function_345e5b9a("");
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		var_211a8012 = (isdefined(var_211a8012) ? var_211a8012 : 0);
		util::function_345e5b9a(((((("" + "") + "") + var_211a8012) + "") + "") + "");
		var_211a8012++;
		level thread function_c5a69992(var_211a8012);
	#/
}

/*
	Name: function_c19802
	Namespace: namespace_6c0f4217
	Checksum: 0x45F4735D
	Offset: 0x4418
	Size: 0x3CC
	Parameters: 1
	Flags: None
*/
function function_c19802(dvar)
{
	/#
		tokens = strtok(dvar.value, "");
		switch((isdefined(tokens[0]) ? tokens[0] : ""))
		{
			case "hash_31323c2655b560b7":
			{
				level thread function_f543fa16();
				break;
			}
			case "hash_601090df5cf5a69a":
			{
				level thread function_fa613511();
				break;
			}
			case "hash_252ab6031286d4fb":
			{
				level thread function_a42f6839();
				break;
			}
			case "hash_7369a81a09f4035":
			{
				level thread function_d70b96a8();
				break;
			}
			case "hash_ae178db3a20b85":
			{
				level thread function_5b9e63e6();
				break;
			}
			case "hash_43a02611d9b79ced":
			{
				level thread function_3bd29cb8();
				break;
			}
			case "hash_68817045e64df700":
			{
				level thread function_d312cd2c();
				break;
			}
			case "hash_22d6e20b320c956b":
			{
				level.var_bce8fb65 = !is_true(level.var_bce8fb65);
				break;
			}
			case "hash_721abb229b429d1d":
			{
				level thread function_37c34605();
				break;
			}
			case "hash_10ab0e022e9a6697":
			{
				namespace_be0f9d50::function_fd24f982();
				break;
			}
			case "hash_21d6880dde085ff6":
			{
				level.var_72a9fe4c = !is_true(level.var_72a9fe4c);
				break;
			}
			case "hash_31c1a67e639807f4":
			{
				level.var_8861a2c7 = !is_true(level.var_8861a2c7);
				break;
			}
			case "hash_2b8cdb3e5ae034ec":
			{
				level notify(#"hash_7fd40fb3202e52db");
				break;
			}
			case "hash_3c03579da902b40e":
			{
				level.var_ec72eeae = !is_true(level.var_ec72eeae);
				break;
			}
			case "hash_1cb34c5ebb1662de":
			{
				level thread function_6469c221();
				break;
			}
			case "hash_2bed8c55c06b6d52":
			{
				level.var_dc3159ff = tokens[1];
				break;
			}
			case "hash_15242ba18dadcfca":
			{
				level thread function_bc75224c();
				break;
			}
			case "hash_8c4454ea8f84335":
			{
				level thread function_7f6a5e14();
				break;
			}
			default:
			{
				return;
			}
		}
		setdvar(#"hash_63d887d4b23cb6e", "");
	#/
}

/*
	Name: function_c5a69992
	Namespace: namespace_6c0f4217
	Checksum: 0x5A8BF403
	Offset: 0x47F0
	Size: 0x218
	Parameters: 1
	Flags: None
*/
function function_c5a69992(var_211a8012)
{
	/#
		if(!isdefined(var_211a8012))
		{
			var_211a8012 = 0;
		}
		level endon(#"game_ended");
		spawn_points = struct::get_array("", "");
		var_7eb6668 = [];
		foreach(index, point in spawn_points)
		{
			if(isdefined(point.scriptbundlename) && !isinarray(var_7eb6668, point.scriptbundlename))
			{
				var_7eb6668[var_7eb6668.size] = point.scriptbundlename;
			}
			if(index & 16)
			{
				waitframe(1);
			}
		}
		foreach(name_index, name in var_7eb6668)
		{
			util::function_345e5b9a(((((("" + var_211a8012) + "") + function_9e72a96(name) + "") + name_index) + "") + function_9e72a96(name) + "");
		}
	#/
}

/*
	Name: function_f543fa16
	Namespace: namespace_6c0f4217
	Checksum: 0x70AF91AF
	Offset: 0x4A10
	Size: 0x21A
	Parameters: 0
	Flags: None
*/
function function_f543fa16()
{
	/#
		level.("") = !is_true(level.(""));
		if(!is_true(level.("")))
		{
			level notify(#"kill_" + "");
			return;
		}
		level endon(#"kill_" + "");
		while(true)
		{
			var_2a1f535d = namespace_be0f9d50::function_2e8c33f6();
			foreach(var_1386d828 in var_2a1f535d)
			{
				color = (is_true(var_1386d828.var_3a3cdab8) ? (1, 0, 0) : (0, 1, 1));
				debugstar(var_1386d828.origin, 1, color);
				line(var_1386d828.origin, var_1386d828.origin + vectorscale((0, 0, 1), 900), color);
				if(is_true(var_1386d828.var_3a3cdab8))
				{
					print3d(var_1386d828.origin + vectorscale((0, 0, 1), 48), "", color);
				}
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_fa613511
	Namespace: namespace_6c0f4217
	Checksum: 0x2DB97560
	Offset: 0x4C38
	Size: 0x162
	Parameters: 0
	Flags: None
*/
function function_fa613511()
{
	/#
		level.("") = !is_true(level.(""));
		if(!is_true(level.("")))
		{
			level notify(#"kill_" + "");
			return;
		}
		level endon(#"kill_" + "");
		while(true)
		{
			foreach(prop in level.var_5fafe5ac)
			{
				if(is_true(prop.var_3e64167))
				{
					continue;
				}
				debugstar(prop.origin, 1, (0, 1, 0));
			}
			waitframe(1);
		}
	#/
}

/*
	Name: function_ea10da3f
	Namespace: namespace_6c0f4217
	Checksum: 0x766BDC65
	Offset: 0x4DA8
	Size: 0xF2
	Parameters: 0
	Flags: None
*/
function function_ea10da3f()
{
	/#
		waitframe(1);
		player = getplayers()[0];
		direction = player getplayerangles();
		direction_vec = anglestoforward(direction);
		eye = player geteye();
		direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
		trace = bullettrace(eye, eye + direction_vec, 0, undefined);
		return trace;
	#/
}

/*
	Name: function_a42f6839
	Namespace: namespace_6c0f4217
	Checksum: 0x2F367967
	Offset: 0x4EA8
	Size: 0xAC
	Parameters: 0
	Flags: None
*/
function function_a42f6839()
{
	/#
		self notify("");
		self endon("");
		trace = function_ea10da3f();
		queryresult = positionquery_source_navigation(trace[#"position"], 500, 1200, 256, 128);
		if(!queryresult.data.size)
		{
			return;
		}
		namespace_be0f9d50::function_b309db61(queryresult.data, undefined, level.var_dc3159ff);
	#/
}

/*
	Name: function_d70b96a8
	Namespace: namespace_6c0f4217
	Checksum: 0xFCA8D290
	Offset: 0x4F60
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_d70b96a8()
{
	/#
		self notify("");
		self endon("");
		trace = function_ea10da3f();
		namespace_be0f9d50::function_51012821(trace[#"position"], undefined, undefined, 3);
	#/
}

/*
	Name: function_5b9e63e6
	Namespace: namespace_6c0f4217
	Checksum: 0x4D1C916
	Offset: 0x4FD0
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_5b9e63e6()
{
	/#
		self notify("");
		self endon("");
		trace = function_ea10da3f();
		namespace_be0f9d50::function_51012821(trace[#"position"], undefined, undefined, 1);
	#/
}

/*
	Name: function_3bd29cb8
	Namespace: namespace_6c0f4217
	Checksum: 0x78156055
	Offset: 0x5040
	Size: 0xA4
	Parameters: 0
	Flags: None
*/
function function_3bd29cb8()
{
	/#
		self notify("");
		self endon("");
		trace = function_ea10da3f();
		closest_point = arraygetclosest(trace[#"position"], level.var_6e175eb);
		namespace_be0f9d50::function_b309db61(array(closest_point), undefined, undefined);
	#/
}

/*
	Name: function_d312cd2c
	Namespace: namespace_6c0f4217
	Checksum: 0x523B9399
	Offset: 0x50F0
	Size: 0xCA
	Parameters: 0
	Flags: None
*/
function function_d312cd2c()
{
	/#
		self notify("");
		self endon("");
		trace = function_ea10da3f();
		mimic = spawnactor("", trace[#"position"], vectortoangles(getplayers()[0].origin - trace[#"position"]));
		if(isdefined(mimic))
		{
			mimic.var_43c4bc66 = 1;
		}
	#/
}

/*
	Name: function_37c34605
	Namespace: namespace_6c0f4217
	Checksum: 0x7F58725E
	Offset: 0x51C8
	Size: 0x142
	Parameters: 0
	Flags: None
*/
function function_37c34605()
{
	/#
		level.("") = !is_true(level.(""));
		if(!is_true(level.("")))
		{
			level notify(#"kill_" + "");
			return;
		}
		level endon(#"kill_" + "");
		while(true)
		{
			foreach(point in level.var_6e175eb)
			{
				debugstar(point.origin, 5, (1, 0, 0));
			}
			waitframe(5);
		}
	#/
}

/*
	Name: function_bc75224c
	Namespace: namespace_6c0f4217
	Checksum: 0x3FAAF744
	Offset: 0x5318
	Size: 0x274
	Parameters: 0
	Flags: None
*/
function function_bc75224c()
{
	/#
		level.("") = !is_true(level.(""));
		if(!is_true(level.("")))
		{
			level notify(#"kill_" + "");
			return;
		}
		level endon(#"kill_" + "");
		var_d6d4c388 = int(5 * 1000);
		var_88f244b8 = 0;
		spawn_points = [];
		while(true)
		{
			if(gettime() >= (var_88f244b8 + var_d6d4c388))
			{
				spawn_points = namespace_be0f9d50::function_bc29cf28();
				var_88f244b8 = gettime();
			}
			foreach(point in spawn_points)
			{
				debugstar(point.origin, int(0.5 / (float(function_60d95f53()) / 1000)), (0, 1, 0));
				line(point.origin, point.origin + vectorscale((0, 0, 1), 64), (0, 1, 0), 1, 0, int(0.5 / (float(function_60d95f53()) / 1000)));
			}
			wait(0.5);
		}
	#/
}

/*
	Name: function_6469c221
	Namespace: namespace_6c0f4217
	Checksum: 0xE5443A69
	Offset: 0x5598
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function function_6469c221()
{
	/#
		self notify("");
		self endon("");
		trace = function_ea10da3f();
		var_68fc2252 = namespace_be0f9d50::function_bc29cf28();
		if(!var_68fc2252.size)
		{
			return;
		}
		closest_struct = arraygetclosest(trace[#"position"], var_68fc2252);
		namespace_be0f9d50::function_b309db61([0:closest_struct]);
	#/
}

/*
	Name: function_7f6a5e14
	Namespace: namespace_6c0f4217
	Checksum: 0xD18CBA75
	Offset: 0x5660
	Size: 0x2F4
	Parameters: 0
	Flags: None
*/
function function_7f6a5e14()
{
	/#
		level.("") = !is_true(level.(""));
		if(!is_true(level.("")))
		{
			level notify(#"kill_" + "");
			return;
		}
		level endon(#"kill_" + "");
		var_d4034654 = struct::get_array("", "");
		var_d4034654 = arraycombine(var_d4034654, namespace_be0f9d50::function_bc29cf28(), 0, 0);
		waitframe(1);
		while(true)
		{
			player = getplayers()[0];
			direction = player getplayerangles();
			direction_vec = anglestoforward(direction);
			eye = player geteye();
			direction_vec = (direction_vec[0] * 8000, direction_vec[1] * 8000, direction_vec[2] * 8000);
			trace = bullettrace(eye, eye + direction_vec, 0, undefined);
			debugstar(trace[#"position"], 5, (0, 1, 1));
			spawn_points = arraysortclosest(var_d4034654, trace[#"position"], 1);
			foreach(point in spawn_points)
			{
				info = function_5ef9a937(point);
				function_ccc08aea(info);
			}
			wait(0.25);
		}
	#/
}

/*
	Name: function_5ef9a937
	Namespace: namespace_6c0f4217
	Checksum: 0x5212DB43
	Offset: 0x5960
	Size: 0x57E
	Parameters: 1
	Flags: Private
*/
function private function_5ef9a937(point)
{
	/#
		if(isdefined(point.var_da70348d))
		{
			switch(point.var_da70348d)
			{
				case 0:
				{
					new_point = (isdefined(point.trigger.scriptmodel) ? point.trigger.scriptmodel : point.scriptmodel);
					point = (isdefined(new_point) ? new_point : point);
					break;
				}
				case 1:
				{
					if(point.targetname === "")
					{
						point = point.machine;
					}
					break;
				}
				default:
				{
					break;
				}
			}
			new_origin = point.origin;
		}
		else
		{
			new_origin = groundtrace((point.origin + vectorscale((0, 0, 1), 15)) + vectorscale((0, 0, 1), 8), (point.origin + vectorscale((0, 0, 1), 15)) + (vectorscale((0, 0, -1), 100000)), 0, undefined)[#"position"];
		}
		var_540ddeae = {#hash_ed56107c:[], #hash_60d91344:[], #angles:point.angles, #origin:new_origin};
		i = -180;
		while(i < 180)
		{
			move_delta = getmovedelta(#"hash_414bef9b5dcae460");
			angle_delta = getangledelta(#"hash_414bef9b5dcae460");
			move_delta = rotatepoint(move_delta, point.angles + (0, angle_delta + i, 0));
			var_feb3dda6 = {#angles:vectortoangles(move_delta), #origin:new_origin + move_delta};
			var_f60dbcf6 = getstartorigin(var_feb3dda6.origin, var_feb3dda6.angles, #"hash_5cfca059cd6fdb4c");
			player_start_angles = getstartangles(var_feb3dda6.origin, var_feb3dda6.angles, #"hash_5cfca059cd6fdb4c");
			move_delta = getmovedelta(#"hash_5cfca059cd6fdb4c", 0, 0.5);
			move_delta = rotatepoint(move_delta, player_start_angles);
			var_d26e393f = var_f60dbcf6 + move_delta;
			var_261937fc = groundtrace((var_feb3dda6.origin + vectorscale((0, 0, 1), 15)) + vectorscale((0, 0, 1), 8), (var_feb3dda6.origin + vectorscale((0, 0, 1), 15)) + (vectorscale((0, 0, -1), 100000)), 0, undefined)[#"position"];
			if(abs(var_261937fc[2] - var_feb3dda6.origin[2]) < 15)
			{
				var_feb3dda6.origin = var_261937fc;
			}
			passed = !function_4f401255(var_feb3dda6.origin, var_feb3dda6.angles, #"hash_5cfca059cd6fdb4c", level.players[0] getmins(), level.players[0] getmaxs(), [0:level.players[0]]);
			var_ed56107c = {#hash_20f2bd48:var_d26e393f, #hash_dc11f544:var_f60dbcf6, #hash_9f7d6d3b:var_feb3dda6.origin, #passed:passed};
			var_540ddeae.var_ed56107c[var_540ddeae.var_ed56107c.size] = var_ed56107c;
			i = i + 15;
		}
		return var_540ddeae;
	#/
}

/*
	Name: function_ccc08aea
	Namespace: namespace_6c0f4217
	Checksum: 0xD59F63D7
	Offset: 0x5EE8
	Size: 0x130
	Parameters: 1
	Flags: Private
*/
function private function_ccc08aea(var_540ddeae)
{
	/#
		foreach(var_ed56107c in var_540ddeae.var_ed56107c)
		{
			debugstar(var_ed56107c.var_dc11f544, 5, (var_ed56107c.passed ? (0, 1, 0) : (1, 0, 0)));
			line(var_ed56107c.var_dc11f544, var_ed56107c.var_20f2bd48, (var_ed56107c.passed ? (0, 1, 0) : (1, 0, 0)), 1, 0, 5);
			line(var_ed56107c.var_9f7d6d3b, var_ed56107c.var_dc11f544, (1, 0, 1), 1, 0, 5);
		}
	#/
}

