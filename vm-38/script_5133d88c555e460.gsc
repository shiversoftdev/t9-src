#using script_3bbf85ab4cb9f3c2;
#using script_47851dbeea22fe66;
#using script_3faf478d5b0850fe;
#using script_2a5bf5b4a00cee0d;
#using script_6b6510e124bad778;
#using script_164a456ce05c3483;
#using script_1ee011cd0961afd7;
#using script_5f20d3b434d24884;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_489b835a247c990e;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_caf007e2a98afa2;
#using script_7b7ed6e4bc963a51;
#using script_522aeb6ae906391e;
#using script_3aa0f32b70d4f7cb;
#using script_178024232e91b0a1;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_58e19d6;

/*
	Name: function_afc74aef
	Namespace: namespace_58e19d6
	Checksum: 0xCFB0F7FE
	Offset: 0x5E0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_afc74aef()
{
	level notify(-1525483993);
}

/*
	Name: init
	Namespace: namespace_58e19d6
	Checksum: 0xD3B6010
	Offset: 0x600
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_78fe553b = [];
	clientfield::register("actor", "silverback_spawn", 1, 1, "counter");
	namespace_250e9486::function_252dff4d("silverback", 29, &function_644621c0, &function_12462f60);
	namespace_250e9486::function_252dff4d("silverback_raygun", -1, &function_644621c0, &function_12462f60);
	registerbehaviorscriptfunctions();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_58e19d6
	Checksum: 0xD685157A
	Offset: 0x6D0
	Size: 0x8B4
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_7ea2ce80));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_13a7c5f0e3443c41", &function_7ea2ce80);
	/#
		assert(isscriptfunctionptr(&function_5ea59a34));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2e4df6a195ecfec9", &function_5ea59a34);
	/#
		assert(isscriptfunctionptr(&function_f23c95c0));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5842fe16f70c7666", &function_f23c95c0);
	/#
		assert(isscriptfunctionptr(&function_57a2b7f5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4d98d9c9ffa44e4a", &function_57a2b7f5);
	/#
		assert(isscriptfunctionptr(&function_393e6415));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5e697a4c27f75b89", &function_393e6415);
	/#
		assert(isscriptfunctionptr(&function_300bba8c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_54f2476b821b6122", &function_300bba8c);
	/#
		assert(!isdefined(&function_33d8ef00) || isscriptfunctionptr(&function_33d8ef00));
	#/
	/#
		assert(!isdefined(&function_3e4a0d4f) || isscriptfunctionptr(&function_3e4a0d4f));
	#/
	/#
		assert(!isdefined(&function_a0e76e3c) || isscriptfunctionptr(&function_a0e76e3c));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_40d132fce22a5e1f", &function_33d8ef00, &function_3e4a0d4f, &function_a0e76e3c);
	/#
		assert(!isdefined(&function_6d8dd464) || isscriptfunctionptr(&function_6d8dd464));
	#/
	/#
		assert(!isdefined(&function_3eb8351a) || isscriptfunctionptr(&function_3eb8351a));
	#/
	/#
		assert(!isdefined(&function_fcbe1c10) || isscriptfunctionptr(&function_fcbe1c10));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_2154c6eadedb4030", &function_6d8dd464, &function_3eb8351a, &function_fcbe1c10);
	/#
		assert(!isdefined(&function_a1f4593d) || isscriptfunctionptr(&function_a1f4593d));
	#/
	/#
		assert(!isdefined(&function_78e41d77) || isscriptfunctionptr(&function_78e41d77));
	#/
	/#
		assert(!isdefined(&function_aacc3221) || isscriptfunctionptr(&function_aacc3221));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_3f09038802c74759", &function_a1f4593d, &function_78e41d77, &function_aacc3221);
	/#
		assert(!isdefined(&function_ea163d5b) || isscriptfunctionptr(&function_ea163d5b));
	#/
	/#
		assert(!isdefined(&function_cea06112) || isscriptfunctionptr(&function_cea06112));
	#/
	/#
		assert(!isdefined(&function_ebaf98e0) || isscriptfunctionptr(&function_ebaf98e0));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_507d2a221b595a43", &function_ea163d5b, &function_cea06112, &function_ebaf98e0);
	/#
		assert(!isdefined(&function_77e73b0) || isscriptfunctionptr(&function_77e73b0));
	#/
	/#
		assert(!isdefined(&function_ae656597) || isscriptfunctionptr(&function_ae656597));
	#/
	/#
		assert(!isdefined(&function_3a5a0b29) || isscriptfunctionptr(&function_3a5a0b29));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction(#"hash_32d2aabab53b4ba6", &function_77e73b0, &function_ae656597, &function_3a5a0b29);
}

/*
	Name: function_644621c0
	Namespace: namespace_58e19d6
	Checksum: 0xAA8C833F
	Offset: 0xF90
	Size: 0x42C
	Parameters: 0
	Flags: Linked
*/
function function_644621c0()
{
	self namespace_250e9486::function_25b2c8a9();
	self namespace_250e9486::function_db744d28(getdvarint(#"hash_6c6cccd30dfa33fc", 750));
	self.animrate = 1;
	self.var_1077b9da = 0;
	self.var_9540e8e7 = 0;
	self.var_6e5b38d9 = 0;
	self.var_3b0b5ef8 = 0;
	self.var_434f2387 = 0;
	self.var_aff8ab1 = 0;
	self.var_131a202d = 0;
	self.var_1c8b76d3 = 1;
	self.health = (1000000 + (level.doa.var_6c58d51 * 1000000)) + ((getplayers().size - 1) * 700000);
	self.maxhealth = self.health;
	self.meleedistsq = sqr(80);
	self.specialattack = undefined;
	self setavoidancemask("avoid none");
	self.goalradius = 80;
	self.doa.var_ad888d1f = [];
	self.doa.var_6b4163f1 = 0;
	self setteam(#"neutral");
	self.no_gib = 1;
	self function_678d90a1(0.001001001);
	self.var_5603780 = &function_ddfdaf41;
	self.overrideactordamage = &function_7ff8a49e;
	self callback::function_d8abfc3d(#"on_ai_killed", &function_31f5e5b);
	self thread namespace_ec06fe4a::function_d55f042c(level, "round_about_to_start");
	self notify(#"hash_2ca65c35156a24dc");
	self.var_febfd0 = namespace_ec06fe4a::spawnorigin(self.origin);
	if(isdefined(self.var_febfd0))
	{
		self.var_febfd0 thread namespace_ec06fe4a::function_d55f042c(self, "death");
	}
	self.trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, (2 | 1) | 512, 50, 50);
	if(isdefined(self.trigger))
	{
		self.trigger thread deathtouch(self);
		self.trigger enablelinkto();
		self.trigger linkto(self);
		self.trigger thread namespace_ec06fe4a::function_d55f042c(self, "death");
		self.trigger thread namespace_ec06fe4a::function_d55f042c(self, "killTrigger");
	}
	self namespace_83eb6304::function_3ecfde67("player_trail_red");
	self thread function_fa03570e();
	self thread function_27adf2ff();
	self thread function_2fdfff05();
	self thread function_8ef296ea();
	self function_add8c81a();
}

/*
	Name: function_8ef296ea
	Namespace: namespace_58e19d6
	Checksum: 0x9E6817E7
	Offset: 0x13C8
	Size: 0x9E
	Parameters: 0
	Flags: Linked
*/
function function_8ef296ea()
{
	self endon(#"death");
	while(true)
	{
		level waittill(#"hash_11f6c6a82650cca2");
		if(is_true(self.collector))
		{
			return;
		}
		if(randomint(100) < 85)
		{
			self.var_6e5b38d9 = 0;
			self.var_1077b9da = 1;
			self.specialattack = #"hash_3dd480845ef2e135";
		}
	}
}

/*
	Name: function_2fdfff05
	Namespace: namespace_58e19d6
	Checksum: 0x7A2AB220
	Offset: 0x1470
	Size: 0x118
	Parameters: 0
	Flags: Linked
*/
function function_2fdfff05()
{
	self endon(#"death");
	var_89586b31 = 0;
	while(true)
	{
		curhealth = self.health;
		wait(1);
		var_dc5a778a = curhealth - self.health;
		namespace_1e25ad94::debugmsg((("this interval, Mamaback hit for " + var_dc5a778a) + " damage, health left:") + self.health);
		if(var_dc5a778a > 65000)
		{
			time = gettime();
			if(time > var_89586b31)
			{
				self.var_6e5b38d9 = 0;
				self.var_1077b9da = 1;
				self.specialattack = #"hash_3dd480845ef2e135";
				self.evading = 1;
				var_89586b31 = time + 10000;
				self thread namespace_6e90e490::function_47e11416(1);
			}
		}
	}
}

/*
	Name: function_12462f60
	Namespace: namespace_58e19d6
	Checksum: 0x5279E94E
	Offset: 0x1590
	Size: 0x198
	Parameters: 0
	Flags: Linked
*/
function function_12462f60()
{
	self endon(#"death");
	if(!is_true(self.collector))
	{
		self thread function_11e05208();
	}
	self thread namespace_250e9486::function_8971bbb7();
	var_9a615a35 = 0;
	while(true)
	{
		if(var_9a615a35 < 200 && self.zombie_move_speed == "run" || self.zombie_move_speed == "walk")
		{
			var_9a615a35++;
		}
		if(var_9a615a35 > 0 && self.zombie_move_speed == "sprint")
		{
			var_9a615a35 = var_9a615a35 - 3;
			if(var_9a615a35 <= 0)
			{
				var_9a615a35 = 0;
				self function_add8c81a(self.var_993e6488);
			}
		}
		if(self.zombie_move_speed == "run" && var_9a615a35 >= 200)
		{
			self function_add8c81a("sprint");
		}
		self doa_pickups::function_d936944a();
		self doa_pickups::function_cbae9ca3();
		wait(0.2);
	}
}

/*
	Name: function_11e05208
	Namespace: namespace_58e19d6
	Checksum: 0x49640339
	Offset: 0x1730
	Size: 0x13C
	Parameters: 0
	Flags: Linked
*/
function function_11e05208()
{
	self notify("5c87e52462a443b3");
	self endon("5c87e52462a443b3");
	self endon(#"death");
	wait(3);
	var_a3750609 = 5;
	lastpos = self.origin;
	while(var_a3750609)
	{
		wait(1);
		deltasq = distancesquared(lastpos, self.origin);
		if(deltasq < sqr(12))
		{
			var_a3750609--;
		}
		else
		{
			self thread function_11e05208();
		}
	}
	self clearenemy();
	self.favoriteenemy = undefined;
	self clearpath();
	self setgoal(self.origin);
	self thread function_11e05208();
}

/*
	Name: function_add8c81a
	Namespace: namespace_58e19d6
	Checksum: 0xE843B35B
	Offset: 0x1878
	Size: 0x10E
	Parameters: 1
	Flags: Linked
*/
function function_add8c81a(rate)
{
	if(!isdefined(rate))
	{
		rate = "run";
	}
	if(rate == "next" && self.zombie_move_speed == "walk")
	{
		rate = "run";
	}
	if(rate == "next" && self.zombie_move_speed == "run")
	{
		rate = "sprint";
	}
	if(rate == "next" && self.zombie_move_speed == "sprint")
	{
		rate = "super_sprint";
	}
	if(rate == "walk")
	{
	}
	else
	{
		if(rate == "run")
		{
		}
		else
		{
		}
	}
	self.var_993e6488 = self.zombie_move_speed;
	self.zombie_move_speed = rate;
}

/*
	Name: function_ca4a3a4f
	Namespace: namespace_58e19d6
	Checksum: 0xCAD8851D
	Offset: 0x1990
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_ca4a3a4f(position)
{
	self.var_860a34b9 = getclosestpointonnavmesh(position, self.goalradius, self getpathfindingradius());
	if(!isdefined(self.var_860a34b9))
	{
		self.var_860a34b9 = position;
	}
	self.ignoreall = 1;
	self namespace_250e9486::function_41354e51(self.var_860a34b9, 1, 1);
	/#
		self thread function_31f34cee();
	#/
}

/*
	Name: function_31f34cee
	Namespace: namespace_58e19d6
	Checksum: 0xAB24E03B
	Offset: 0x1A40
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_31f34cee()
{
	self endon(#"death");
	self notify("28be0ca44590041b");
	self endon("28be0ca44590041b");
	while(isdefined(self.var_860a34b9))
	{
		level thread namespace_1e25ad94::function_1d1f2c26(self.var_860a34b9, 0.05, 24, (1, 0, 0));
		waitframe(1);
	}
}

/*
	Name: function_27adf2ff
	Namespace: namespace_58e19d6
	Checksum: 0xB8415E9B
	Offset: 0x1AC0
	Size: 0x17C
	Parameters: 2
	Flags: Linked
*/
function function_27adf2ff(on, var_a53a6d94)
{
	if(!isdefined(on))
	{
		on = 1;
	}
	if(!isdefined(var_a53a6d94))
	{
		var_a53a6d94 = 1;
	}
	/#
		assert(isdefined(self.trigger));
	#/
	if(isdefined(self.trigger))
	{
		self.trigger endon(#"death");
	}
	if(on)
	{
		self namespace_83eb6304::function_3ecfde67("silverback_shield");
		self namespace_e32bb68::function_3a59ec34("evt_doa_player_shield_start");
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_silverback_shield_lp");
		self.takedamage = 0;
	}
	else
	{
		self namespace_83eb6304::turnofffx("silverback_shield");
		self namespace_e32bb68::function_3a59ec34("evt_doa_player_shield_stop");
		self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_silverback_shield_lp");
		self.takedamage = 1;
	}
	if(isdefined(self.trigger))
	{
		self.trigger triggerenable(var_a53a6d94);
	}
}

/*
	Name: deathtouch
	Namespace: namespace_58e19d6
	Checksum: 0x37292587
	Offset: 0x1C48
	Size: 0x136
	Parameters: 1
	Flags: Linked
*/
function deathtouch(owner)
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(isdefined(result.activator))
		{
			if(result.activator.team == #"allies")
			{
				result.activator dodamage(result.activator.health, self.origin, owner, owner);
			}
			else if(result.activator.team == #"axis")
			{
				if(namespace_250e9486::function_3d752709(result.activator))
				{
					result.activator namespace_250e9486::setup_zombie_knockdown(owner);
					result.activator.knockdown_type = "knockdown_shoved";
				}
			}
		}
	}
}

/*
	Name: function_ddfdaf41
	Namespace: namespace_58e19d6
	Checksum: 0x102FA3E7
	Offset: 0x1D88
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_ddfdaf41()
{
	self.var_6e5b38d9 = 0;
	self.var_1077b9da = 1;
	self.specialattack = #"hash_3dd480845ef2e135";
}

/*
	Name: function_7ff8a49e
	Namespace: namespace_58e19d6
	Checksum: 0x66CC121C
	Offset: 0x1DC8
	Size: 0x108
	Parameters: 13
	Flags: Linked
*/
function function_7ff8a49e(inflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, timeoffset, boneindex, modelindex)
{
	if(is_false(self.takedamage) || is_true(self.collector))
	{
		return 0;
	}
	var_799e18e5 = modelindex;
	var_5f32808d = 1;
	if(boneindex >= 1000)
	{
		var_5f32808d = 2;
	}
	self namespace_ec06fe4a::function_2f4b0f9(self.health, timeoffset, var_799e18e5, boneindex, var_5f32808d);
	return boneindex;
}

/*
	Name: function_fa03570e
	Namespace: namespace_58e19d6
	Checksum: 0xAA293FFB
	Offset: 0x1ED8
	Size: 0x60
	Parameters: 0
	Flags: Linked
*/
function function_fa03570e()
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"hash_c7574e887244a9c");
		radiusdamage(self.origin, 100, 20000, 20000, self, "MOD_CRUSH");
	}
}

/*
	Name: function_31f5e5b
	Namespace: namespace_58e19d6
	Checksum: 0x7DA6F68A
	Offset: 0x1F40
	Size: 0x1D4
	Parameters: 1
	Flags: Linked
*/
function function_31f5e5b(params)
{
	if(is_true(level.doa.var_41adf604))
	{
		foreach(player in getplayers())
		{
			player namespace_d2efac9a::function_3f112727();
		}
	}
	self playsound(#"hash_37a5a1ff99e806d");
	if(isdefined(self.var_b94a3fde))
	{
		self.var_b94a3fde delete();
	}
	if(isdefined(self.glasses))
	{
		self.glasses delete();
	}
	if(isdefined(self.spoon))
	{
		self.spoon delete();
	}
	if(isdefined(self.trigger))
	{
		self.trigger delete();
	}
	if(isdefined(self.var_febfd0))
	{
		self.var_febfd0 delete();
	}
	arrayremovevalue(level.doa.var_5598fe58, self);
}

/*
	Name: function_7ea2ce80
	Namespace: namespace_58e19d6
	Checksum: 0xF1365C1D
	Offset: 0x2120
	Size: 0x20A
	Parameters: 1
	Flags: Linked
*/
function function_7ea2ce80(entity)
{
	if(entity.var_1077b9da)
	{
		entity.var_1077b9da = 0;
		return isdefined(entity.specialattack);
	}
	if(is_true(entity.var_6ea9e4cf))
	{
		return 0;
	}
	if(is_true(entity.var_9540e8e7))
	{
		return 0;
	}
	if(isdefined(entity.specialattack))
	{
		return 1;
	}
	if(!isdefined(entity.enemy))
	{
		return 0;
	}
	time = gettime();
	if(time < entity.var_6e5b38d9)
	{
		return 0;
	}
	if(randomint(100) > 30)
	{
		entity.var_6e5b38d9 = time + 3000;
		return 0;
	}
	var_92423047 = [];
	if(time > entity.var_aff8ab1 && randomint(100) < 30)
	{
		var_92423047[var_92423047.size] = #"hash_aea0ed21dcd8548";
	}
	if(time > entity.var_434f2387 && randomint(100) < 50)
	{
		var_92423047[var_92423047.size] = #"hash_3dd480845ef2e135";
	}
	if(time > entity.var_131a202d && randomint(100) < 30)
	{
		var_92423047[var_92423047.size] = #"hash_65e4e48a8b85b3ac";
	}
	if(var_92423047.size == 0)
	{
		return 0;
	}
	entity.specialattack = var_92423047[randomint(var_92423047.size)];
	return 1;
}

/*
	Name: function_6ae08d6c
	Namespace: namespace_58e19d6
	Checksum: 0x502E6839
	Offset: 0x2338
	Size: 0x198
	Parameters: 2
	Flags: Linked
*/
function function_6ae08d6c(origin, raygun)
{
	if(!isdefined(raygun))
	{
		raygun = 0;
	}
	if(raygun == 0)
	{
		silverback = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee("silverback"), origin);
	}
	else
	{
		silverback = doa_enemy::function_db55a448(doa_enemy::function_d7c5adee("silverback_raygun"), origin);
	}
	silverback.targetname = "silverback";
	silverback clientfield::increment("silverback_spawn", 1);
	function_1eaaceab(level.doa.var_5598fe58);
	if(!isdefined(level.doa.var_5598fe58))
	{
		level.doa.var_5598fe58 = [];
	}
	else if(!isarray(level.doa.var_5598fe58))
	{
		level.doa.var_5598fe58 = array(level.doa.var_5598fe58);
	}
	level.doa.var_5598fe58[level.doa.var_5598fe58.size] = silverback;
	return silverback;
}

/*
	Name: function_571bb3ac
	Namespace: namespace_58e19d6
	Checksum: 0x52B33E6D
	Offset: 0x24D8
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
*/
function function_571bb3ac()
{
	/#
		assert(isdefined(level.doa.var_39e3fa99));
	#/
	sides = array("top", "bottom", "left", "right");
	center = [[ level.doa.var_39e3fa99 ]]->function_ffcf1d1();
	spot = [[ level.doa.var_39e3fa99 ]]->function_635991ca();
	silverback = function_6ae08d6c(spot.origin);
	if(isdefined(silverback))
	{
		silverback endon(#"death");
		silverback function_add8c81a("walk");
		silverback.ignoreall = 1;
		silverback.var_6ea9e4cf = 1;
		silverback.goalradius = 16;
		silverback thread function_2c4249ed(sqr(28));
		result = undefined;
		result = level waittilltimeout(60, #"damage", #"doa_exit_taken", #"time_to_leave", #"teleporter_taken", #"enter_the_wild", #"hash_7270a59e1f502d96");
		silverback notify(#"time_to_leave");
		silverback.var_6ea9e4cf = undefined;
		if(result._notify == #"timeout" || result._notify == #"time_to_leave" || result._notify == #"damage")
		{
			silverback.var_37f6ce66 = 0;
			silverback.var_860a34b9 = undefined;
			silverback.ignoreall = 0;
			silverback function_add8c81a("run");
			silverback thread namespace_6e90e490::function_47e11416(6);
			silverback.var_6e5b38d9 = gettime() + 11000;
			result = undefined;
			result = level waittilltimeout(10, #"doa_exit_taken", #"teleporter_taken", #"enter_the_wild", #"hash_7270a59e1f502d96", #"time_to_leave");
		}
		silverback thread namespace_6e90e490::function_47e11416(6);
		silverback.var_1077b9da = 1;
		silverback.specialattack = #"hash_3dd480845ef2e135";
		level waittilltimeout(15, #"move_to_pos_downward_cycle", #"hash_1b322de3d2e3e781");
		silverback delete();
	}
}

/*
	Name: function_2c4249ed
	Namespace: namespace_58e19d6
	Checksum: 0x97CB3FD2
	Offset: 0x2898
	Size: 0x98
	Parameters: 1
	Flags: Linked
*/
function function_2c4249ed(distsq)
{
	self notify("601f11732df744ca");
	self endon("601f11732df744ca");
	self endon(#"death");
	self endon(#"hash_726c573f1b22d654");
	while(true)
	{
		if(distancesquared(self.origin, self.goalpos) <= distsq)
		{
			self notify(#"near_goal");
		}
		waitframe(1);
	}
}

/*
	Name: function_5ea59a34
	Namespace: namespace_58e19d6
	Checksum: 0x43F9D9E0
	Offset: 0x2938
	Size: 0x22
	Parameters: 1
	Flags: Linked
*/
function function_5ea59a34(entity)
{
	return is_true(entity.var_6ea9e4cf);
}

/*
	Name: function_77e73b0
	Namespace: namespace_58e19d6
	Checksum: 0xBAC34366
	Offset: 0x2968
	Size: 0x68
	Parameters: 2
	Flags: Linked, Private
*/
function private function_77e73b0(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	self playsound("zmb_simianaut_roar");
	entity thread function_89406011();
	return 5;
}

/*
	Name: function_ae656597
	Namespace: namespace_58e19d6
	Checksum: 0x760B57EA
	Offset: 0x29D8
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ae656597(entity, asmstatename)
{
	if(is_true(asmstatename.var_6ea9e4cf))
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_3a5a0b29
	Namespace: namespace_58e19d6
	Checksum: 0x18A49CCD
	Offset: 0x2A18
	Size: 0x3A
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3a5a0b29(entity, asmstatename)
{
	asmstatename.var_6ea9e4cf = undefined;
	asmstatename.ignoreall = 0;
	asmstatename.var_860a34b9 = undefined;
	return 4;
}

/*
	Name: function_e0c89bfe
	Namespace: namespace_58e19d6
	Checksum: 0x6C415CAB
	Offset: 0x2A60
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_e0c89bfe()
{
	self notify("66c4111fdf3b0f9b");
	self endon("66c4111fdf3b0f9b");
	self endon(#"death", #"time_to_leave");
	wait(20);
	self function_add8c81a("run");
}

/*
	Name: function_89406011
	Namespace: namespace_58e19d6
	Checksum: 0x7C5D4ADB
	Offset: 0x2AD0
	Size: 0x506
	Parameters: 0
	Flags: Linked
*/
function function_89406011()
{
	self notify("4497f0497caa1c59");
	self endon("4497f0497caa1c59");
	self endon(#"death");
	self thread function_e0c89bfe();
	self.var_418c1493 = 1;
	currenttarget = undefined;
	var_8d48d5f2 = undefined;
	pickups = arraysortclosest(level.doa.var_cc831548, self.origin);
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_silverback_gather_lp");
	while(is_true(self.var_6ea9e4cf))
	{
		while(level.doa.var_cc831548.size)
		{
			pickups = arraysortclosest(level.doa.var_cc831548, self.origin, 12, 64);
			currenttarget = undefined;
			foreach(pickup in pickups)
			{
				if(is_true(pickup.var_23b495d))
				{
					continue;
				}
				currenttarget = pickup;
				break;
			}
			if(!isdefined(currenttarget))
			{
				self notify(#"time_to_leave");
				level notify(#"time_to_leave");
				self.pacifist = 0;
				self.ignoreall = 0;
				self.var_860a34b9 = undefined;
				self.var_6ea9e4cf = undefined;
				self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_silverback_gather_lp");
				return;
			}
			pos = namespace_ec06fe4a::function_65ee50ba(currenttarget.origin);
			self function_ca4a3a4f(pos);
			/#
				if(getdvarint(#"hash_267a8e5d4aab4191", 0) != 0)
				{
					self thread function_bf037906(currenttarget.origin);
				}
			#/
			if(self haspath() == 0 && self.var_f95bc76f === 10)
			{
				currenttarget.var_23b495d = 1;
				continue;
			}
			timeout = 20;
			while(timeout > 0 && isdefined(currenttarget) && !is_true(currenttarget.pickedup))
			{
				lastorigin = self.origin;
				result = undefined;
				result = self waittilltimeout(0.5, #"near_goal", #"picked_up");
				if(result._notify == #"timeout")
				{
					timeout--;
				}
				if(isdefined(self.var_860a34b9) && distancesquared(self.var_860a34b9, self.origin) > sqr(12) && distancesquared(lastorigin, self.origin) < sqr(8))
				{
					if(isdefined(currenttarget))
					{
						currenttarget.var_23b495d = 1;
					}
					break;
				}
				if(!isdefined(currenttarget) || result.item === currenttarget || is_true(currenttarget.pickedup))
				{
					break;
				}
			}
		}
		break;
	}
	self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_silverback_gather_lp");
	self notify(#"time_to_leave");
	level notify(#"time_to_leave");
	self.pacifist = 0;
	self.ignoreall = 0;
	self.var_860a34b9 = undefined;
}

/*
	Name: function_bf037906
	Namespace: namespace_58e19d6
	Checksum: 0x9011423A
	Offset: 0x2FE0
	Size: 0xF6
	Parameters: 1
	Flags: None
*/
function function_bf037906(origin)
{
	self endon(#"death");
	self endon(#"time_to_leave");
	self notify("1622430d5e2a14d3");
	self endon("1622430d5e2a14d3");
	while(is_true(self.var_6ea9e4cf))
	{
		level thread namespace_1e25ad94::debugcircle(origin + vectorscale((0, 0, 1), 20), 30, 0.05, (1, 0, 0));
		level thread namespace_1e25ad94::debugline(self.origin + vectorscale((0, 0, 1), 20), origin + vectorscale((0, 0, 1), 20), 0.05, (1, 0, 0));
		waitframe(1);
	}
}

/*
	Name: function_f23c95c0
	Namespace: namespace_58e19d6
	Checksum: 0x7C245F5
	Offset: 0x30E0
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function function_f23c95c0(entity)
{
	if(is_true(entity.taunting))
	{
		return 1;
	}
	if(gettime() < entity.var_3b0b5ef8)
	{
		return 0;
	}
	entity.var_3b0b5ef8 = entity.var_3b0b5ef8 + randomint(1000);
	return randomint(100) < 5;
}

/*
	Name: function_33d8ef00
	Namespace: namespace_58e19d6
	Checksum: 0x6A62BE91
	Offset: 0x3168
	Size: 0x70
	Parameters: 2
	Flags: Linked, Private
*/
function private function_33d8ef00(entity, asmstatename)
{
	entity.var_3b0b5ef8 = (gettime() + 18000) + randomint(6000);
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity thread function_5dfb821d();
	return 5;
}

/*
	Name: function_3e4a0d4f
	Namespace: namespace_58e19d6
	Checksum: 0xF59B5DBE
	Offset: 0x31E0
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3e4a0d4f(entity, asmstatename)
{
	if(is_true(asmstatename.taunting))
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_a0e76e3c
	Namespace: namespace_58e19d6
	Checksum: 0x4599F3CB
	Offset: 0x3220
	Size: 0x22
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a0e76e3c(entity, asmstatename)
{
	asmstatename.taunting = undefined;
	return 4;
}

/*
	Name: function_5dfb821d
	Namespace: namespace_58e19d6
	Checksum: 0x279C52D1
	Offset: 0x3250
	Size: 0x82
	Parameters: 0
	Flags: Linked
*/
function function_5dfb821d()
{
	self notify("554208aef3b69bfd");
	self endon("554208aef3b69bfd");
	self endon(#"death");
	self.taunting = 1;
	result = undefined;
	result = self waittilltimeout(2, #"taunt_end", #"end");
	self.taunting = undefined;
}

/*
	Name: function_393e6415
	Namespace: namespace_58e19d6
	Checksum: 0x1E67990B
	Offset: 0x32E0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_393e6415(entity)
{
	return entity.specialattack === #"hash_aea0ed21dcd8548";
}

/*
	Name: function_6d8dd464
	Namespace: namespace_58e19d6
	Checksum: 0xB8C38EE9
	Offset: 0x3310
	Size: 0x138
	Parameters: 2
	Flags: Linked, Private
*/
function private function_6d8dd464(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity pathmode("dont move");
	entity.var_febfd0.angles = entity.angles;
	entity.var_febfd0.origin = entity.origin;
	entity linkto(entity.var_febfd0);
	entity.var_c4b93228 = randomint(3) + 2;
	entity thread namespace_6e90e490::function_47e11416(6);
	entity thread function_396fbf53(entity.var_febfd0, entity.var_c4b93228);
	if(isdefined(entity.trigger))
	{
		entity.trigger triggerenable(1);
	}
	return 5;
}

/*
	Name: function_3eb8351a
	Namespace: namespace_58e19d6
	Checksum: 0x297B7E87
	Offset: 0x3450
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_3eb8351a(entity, asmstatename)
{
	if(function_393e6415(asmstatename))
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_fcbe1c10
	Namespace: namespace_58e19d6
	Checksum: 0xEE12BB9C
	Offset: 0x3490
	Size: 0xC6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_fcbe1c10(entity, asmstatename)
{
	asmstatename pathmode("move allowed");
	asmstatename unlink();
	if(isdefined(asmstatename.trigger))
	{
		asmstatename.trigger triggerenable(0);
	}
	asmstatename.var_aff8ab1 = gettime() + 5000;
	asmstatename.var_6e5b38d9 = (gettime() + 3000) + randomint(3000);
	asmstatename.specialattack = undefined;
	return 4;
}

/*
	Name: function_396fbf53
	Namespace: namespace_58e19d6
	Checksum: 0xA35F2A16
	Offset: 0x3560
	Size: 0x4C6
	Parameters: 2
	Flags: Linked
*/
function function_396fbf53(var_febfd0, numattacks)
{
	if(!isdefined(numattacks))
	{
		numattacks = 1;
	}
	if(!isdefined(self.enemy))
	{
		return;
	}
	self endon(#"death");
	sqr64 = sqr(64);
	anim_ang = vectortoangles(self.enemy.origin - self.origin);
	var_febfd0 rotateto((0, anim_ang[1], 0), 0.5);
	self waittill(#"hash_4effc2ad460c79a6");
	while(numattacks && isdefined(self.enemy))
	{
		numattacks--;
		targetorigin = self.enemy.origin;
		anim_ang = vectortoangles(targetorigin - self.origin);
		var_febfd0 rotateto((0, anim_ang[1], 0), 0.5);
		var_febfd0 waittill(#"rotatedone");
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_silverback_boost");
		playrumbleonposition("explosion_generic", self.origin);
		dist = distance(targetorigin, self.origin) + 256;
		forward = anglestoforward(var_febfd0.angles);
		targetspot = var_febfd0.origin + (forward * dist);
		trace = groundtrace(var_febfd0.origin + vectorscale((0, 0, 1), 30), targetspot + vectorscale((0, 0, 1), 30), 0, self);
		targetspot = trace[#"position"] + (forward * -64);
		distsq = distancesquared(var_febfd0.origin, targetspot);
		var_e1f43424 = math::clamp(int(distsq / sqr64), 1, 9999);
		traveltime = math::clamp(var_e1f43424 * 0.005, 0, 0.7);
		if(getdvarint(#"hash_370090a969cdbc39", 0))
		{
			level thread namespace_1e25ad94::debugcircle(targetspot + vectorscale((0, 0, 1), 20), 30, 3, (1, 0, 0));
			level thread namespace_1e25ad94::debugline(targetspot + vectorscale((0, 0, 1), 20), self.origin + vectorscale((0, 0, 1), 20), 3, (1, 0, 0));
			var_febfd0 thread namespace_1e25ad94::debugorigin(3, 20, (1, 0, 0));
		}
		var_febfd0 thread function_51226983(self.enemy);
		self.boosting = 1;
		var_febfd0 moveto(targetspot, traveltime);
		var_febfd0 waittilltimeout(traveltime + 2, #"movedone");
		self.boosting = undefined;
		var_febfd0 notify(#"hash_531e95963631c569");
		if(getdvarint(#"hash_370090a969cdbc39", 0))
		{
			var_febfd0 notify(#"hash_60eabc6ae83239fe");
		}
	}
	self.specialattack = undefined;
}

/*
	Name: function_51226983
	Namespace: namespace_58e19d6
	Checksum: 0x73674ED1
	Offset: 0x3A30
	Size: 0xEE
	Parameters: 1
	Flags: Linked, Private
*/
function private function_51226983(target)
{
	if(!isdefined(target))
	{
		return;
	}
	self notify("127c7b4fd400fd9e");
	self endon("127c7b4fd400fd9e");
	self endon(#"death", #"hash_531e95963631c569");
	target endon(#"death", #"disconnect");
	while(isdefined(target))
	{
		anim_ang = vectortoangles(target.origin - self.origin);
		self rotateto((0, anim_ang[1], 0), 0.5);
		self waittill(#"rotatedone");
	}
}

/*
	Name: function_300bba8c
	Namespace: namespace_58e19d6
	Checksum: 0x4AAE9C5A
	Offset: 0x3B28
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_300bba8c(entity)
{
	return entity.specialattack === #"hash_3dd480845ef2e135";
}

/*
	Name: function_a1f4593d
	Namespace: namespace_58e19d6
	Checksum: 0xED165E54
	Offset: 0x3B58
	Size: 0x120
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a1f4593d(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	entity pathmode("dont move");
	entity.var_febfd0.angles = entity.angles;
	entity.var_febfd0.origin = entity.origin;
	entity linkto(entity.var_febfd0);
	entity.var_66f5fb1a = randomint(3) + 1;
	entity thread function_de1c2fc3(entity.var_febfd0, entity.var_66f5fb1a);
	if(isdefined(entity.trigger))
	{
		entity.trigger triggerenable(1);
	}
	return 5;
}

/*
	Name: function_78e41d77
	Namespace: namespace_58e19d6
	Checksum: 0x68088443
	Offset: 0x3C80
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_78e41d77(entity, asmstatename)
{
	if(function_300bba8c(asmstatename))
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_aacc3221
	Namespace: namespace_58e19d6
	Checksum: 0x1EAF51C
	Offset: 0x3CC0
	Size: 0xC6
	Parameters: 2
	Flags: Linked, Private
*/
function private function_aacc3221(entity, asmstatename)
{
	asmstatename pathmode("move allowed");
	asmstatename unlink();
	if(isdefined(asmstatename.trigger))
	{
		asmstatename.trigger triggerenable(0);
	}
	asmstatename.var_7d10766 = gettime() + 3000;
	asmstatename.var_6e5b38d9 = (gettime() + 3000) + randomint(3000);
	asmstatename.specialattack = undefined;
	return 4;
}

/*
	Name: function_de1c2fc3
	Namespace: namespace_58e19d6
	Checksum: 0x2282AE3C
	Offset: 0x3D90
	Size: 0x4B6
	Parameters: 2
	Flags: Linked
*/
function function_de1c2fc3(var_febfd0, numattacks)
{
	if(!isdefined(numattacks))
	{
		numattacks = 1;
	}
	self endon(#"death");
	self waittill(#"hash_3b8882dbdaef63bf");
	self notify(#"jumping");
	if(is_true(self.evading))
	{
		numattacks = 4;
		self.evading = undefined;
		var_3aeed2b5 = 1;
	}
	while(numattacks)
	{
		numattacks--;
		targetpos = undefined;
		if(!is_true(var_3aeed2b5))
		{
			players = namespace_7f5aeb59::function_23e1f90f();
			if(players.size == 0)
			{
				break;
			}
			if(players.size == 1)
			{
				self.favoriteenemy = players[0];
			}
			else
			{
				if(isdefined(self.enemy))
				{
					arrayremovevalue(players, self.enemy);
				}
				if(players.size == 1)
				{
					self.favoriteenemy = players[0];
				}
				else
				{
					self.favoriteenemy = players[randomint(players.size)];
				}
			}
			if(isdefined(self.favoriteenemy) && function_7d0161cb(self.favoriteenemy))
			{
				targetpos = self.favoriteenemy.origin;
			}
		}
		if(!isdefined(targetpos))
		{
			spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745();
			targetpos = spot.origin;
		}
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_silverback_jet_takeoff");
		self namespace_83eb6304::function_3ecfde67("silverback_launch");
		playrumbleonposition("explosion_generic", self.origin);
		height = 1000;
		timems = (height / 1000) * 3000;
		var_febfd0.angles = self.angles;
		var_febfd0.origin = self.origin;
		self linkto(var_febfd0);
		if(getdvarint(#"hash_225943d24ee71d", 0))
		{
			level thread namespace_1e25ad94::debugcircle(targetpos + vectorscale((0, 0, 1), 20), 30, 3, (1, 0, 0));
			var_febfd0 thread namespace_1e25ad94::debugorigin(3, 20, (1, 0, 0));
		}
		var_febfd0 thread function_51226983(self.enemy);
		self thread function_3a558b65("move_to_pos_downward_cycle");
		var_febfd0 move_to_position_over_time(targetpos, timems, height);
		if(isdefined(self.var_617140d4))
		{
			self.var_617140d4 unlink();
			self.var_617140d4 = undefined;
		}
		var_febfd0 notify(#"hash_531e95963631c569");
		if(getdvarint(#"hash_225943d24ee71d", 0))
		{
			var_febfd0 notify(#"hash_60eabc6ae83239fe");
		}
		self namespace_83eb6304::function_3ecfde67("silverback_land");
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_silverback_jet_land");
		physicsexplosionsphere(self.origin, 200, 128, 2);
		earthquake(0.6, 0.75, self.origin, 200);
		targetpos = undefined;
	}
	self.specialattack = undefined;
}

/*
	Name: function_3a558b65
	Namespace: namespace_58e19d6
	Checksum: 0xA134B3E2
	Offset: 0x4250
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3a558b65(var_8767c017)
{
	self notify("34bbb93719857f14");
	self endon("34bbb93719857f14");
	self endon(#"death");
	level waittill(var_8767c017);
	self thread function_bf9a2a1d();
}

/*
	Name: function_7d0161cb
	Namespace: namespace_58e19d6
	Checksum: 0x6445ED6B
	Offset: 0x42B8
	Size: 0xA2
	Parameters: 1
	Flags: Linked
*/
function function_7d0161cb(ent)
{
	if(!isdefined(ent))
	{
		return false;
	}
	if(!isplayer(ent))
	{
		return false;
	}
	if(isdefined(ent.doa) && isdefined(ent.doa.vehicle))
	{
		return false;
	}
	if(!isdefined(level.doa.var_39e3fa99) || !([[ level.doa.var_39e3fa99 ]]->function_94e37da2(ent)))
	{
		return false;
	}
	return true;
}

/*
	Name: move_to_position_over_time
	Namespace: namespace_58e19d6
	Checksum: 0x509CF188
	Offset: 0x4368
	Size: 0x2A8
	Parameters: 3
	Flags: Linked
*/
function move_to_position_over_time(destination, timems, elevationdelta)
{
	self endon(#"death");
	frames = timems / 50;
	delta = (destination - self.origin) / frames;
	stoptime = gettime() + timems;
	var_9843db1b = 0;
	if(isdefined(elevationdelta))
	{
		deltaz = elevationdelta / (frames / 2);
		stoptimeup = gettime() + (timems / 2);
		while(true)
		{
			time = gettime();
			if(time > stoptime)
			{
				break;
			}
			if(time < stoptimeup)
			{
				deltaplus = delta + (0, 0, deltaz);
				var_9843db1b = 1;
			}
			else
			{
				if(is_true(var_9843db1b))
				{
					level notify(#"move_to_pos_downward_cycle");
					self notify(#"move_to_pos_downward_cycle");
				}
				var_9843db1b = 0;
				deltaplus = delta - (0, 0, deltaz);
			}
			newspot = self.origin + deltaplus;
			if(!var_9843db1b && newspot[2] < destination[2])
			{
				newspot = (newspot[0], newspot[1], destination[2]);
				if(isai(self))
				{
					self forceteleport(newspot);
				}
				else
				{
					self.origin = newspot;
				}
				return;
			}
			if(isai(self))
			{
				self forceteleport(newspot);
			}
			else
			{
				self.origin = newspot;
			}
			waitframe(1);
		}
	}
	else
	{
		while(gettime() < stoptime)
		{
			if(isai(self))
			{
				self forceteleport(self.origin + delta);
			}
			else
			{
				self.origin = self.origin + delta;
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_57a2b7f5
	Namespace: namespace_58e19d6
	Checksum: 0xB3C40462
	Offset: 0x4618
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_57a2b7f5(entity)
{
	return entity.specialattack === #"hash_65e4e48a8b85b3ac";
}

/*
	Name: function_ea163d5b
	Namespace: namespace_58e19d6
	Checksum: 0x72C9CDA
	Offset: 0x4648
	Size: 0x1E8
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ea163d5b(entity, asmstatename)
{
	animationstatenetworkutility::requeststate(entity, asmstatename);
	self thread function_36f40887();
	if(function_1d0310f4())
	{
		banana1 = namespace_ec06fe4a::function_e22ae9b3(self.origin, "zombietron_banana");
		if(isdefined(banana1))
		{
			banana1.targetname = "banana1";
			banana1 setmodel("zombietron_banana");
			banana1 enablelinkto();
			banana1 linkto(self, "j_thumb_ri_3", (0, 0, 0), (0, 0, 0));
			banana1 thread function_bcfd19b2(self, "fire_banana_right");
		}
	}
	if(function_1d0310f4())
	{
		banana2 = namespace_ec06fe4a::function_e22ae9b3(self.origin, "zombietron_banana");
		if(isdefined(banana2))
		{
			banana2.targetname = "banana2";
			banana2 setmodel("zombietron_banana");
			banana2 enablelinkto();
			banana2 linkto(self, "j_thumb_le_3", (0, 0, 0), (0, 0, 0));
			banana2 thread function_bcfd19b2(self, "fire_banana_left");
		}
	}
	return 5;
}

/*
	Name: function_cea06112
	Namespace: namespace_58e19d6
	Checksum: 0xAB6C7CA0
	Offset: 0x4838
	Size: 0x38
	Parameters: 2
	Flags: Linked, Private
*/
function private function_cea06112(entity, asmstatename)
{
	if(function_57a2b7f5(asmstatename))
	{
		return 5;
	}
	return 4;
}

/*
	Name: function_ebaf98e0
	Namespace: namespace_58e19d6
	Checksum: 0x660E02AF
	Offset: 0x4878
	Size: 0x5E
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ebaf98e0(entity, asmstatename)
{
	asmstatename.var_131a202d = gettime() + 3000;
	asmstatename.var_6e5b38d9 = (gettime() + 3000) + randomint(3000);
	asmstatename.specialattack = undefined;
	return 4;
}

/*
	Name: function_1d0310f4
	Namespace: namespace_58e19d6
	Checksum: 0xF087E602
	Offset: 0x48E0
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_1d0310f4()
{
	return level.doa.var_78fe553b.size <= 6;
}

/*
	Name: function_36f40887
	Namespace: namespace_58e19d6
	Checksum: 0x886B5E09
	Offset: 0x4908
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_36f40887()
{
	self endon(#"death");
	self waittill(#"hash_25e58964d378516");
	self.specialattack = undefined;
}

/*
	Name: function_bf9a2a1d
	Namespace: namespace_58e19d6
	Checksum: 0x57A45709
	Offset: 0x4948
	Size: 0xFE
	Parameters: 1
	Flags: Linked
*/
function function_bf9a2a1d(number)
{
	if(!isdefined(number))
	{
		number = 5;
	}
	self endon(#"death");
	baseangle = self.angles;
	increment = (0, 360 / (number + 1), 80);
	while(number)
	{
		banana1 = namespace_ec06fe4a::function_e22ae9b3(self.origin, "zombietron_banana");
		if(isdefined(banana1))
		{
			banana1.targetname = "banana1";
			banana1 setmodel("zombietron_banana");
			banana1 thread function_bcfd19b2(self, undefined, baseangle);
			baseangle = baseangle + increment;
		}
		number--;
	}
}

/*
	Name: function_bcfd19b2
	Namespace: namespace_58e19d6
	Checksum: 0x830ED770
	Offset: 0x4A50
	Size: 0x3BC
	Parameters: 3
	Flags: Linked
*/
function function_bcfd19b2(silverback, note, angles)
{
	level.doa.var_78fe553b[level.doa.var_78fe553b.size] = self;
	if(isdefined(angles))
	{
		forward = anglestoforward(angles);
	}
	else
	{
		forward = anglestoforward(silverback.angles);
	}
	target_point = (silverback.origin + (64 * forward)) + (randomfloatrange(2 * -1, 2), randomfloatrange(2 * -1, 2), 130);
	dir = vectornormalize(target_point - silverback.origin);
	if(isdefined(note))
	{
		silverback waittilltimeout(2, note, #"death");
		self unlink();
	}
	vel = mapfloat(sqr(32), sqr(1600), 1.8, 5.5, distancesquared(target_point, self.origin));
	throw = dir * vel;
	self notsolid();
	self physicslaunch(self.origin, throw);
	wait(0.2);
	self solid();
	self namespace_83eb6304::function_3ecfde67("explo_warning_light");
	self namespace_e32bb68::function_3a59ec34("evt_doa_hazard_redbarrel_warning");
	wait(5);
	self namespace_83eb6304::function_3ecfde67("silverback_banana_explo");
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_silverback_banana_explo");
	waitframe(1);
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, 0, 128, 64);
	trigger thread namespace_ec06fe4a::function_52afe5df(5 + 0.1);
	arrayremovevalue(level.doa.var_78fe553b, self);
	self namespace_ec06fe4a::function_8c808737();
	self thread namespace_ec06fe4a::function_52afe5df(5 + 0.1);
	if(isdefined(trigger))
	{
		trigger.targetname = "banana";
		trigger thread function_d70f65d0();
		wait(5);
		trigger delete();
	}
}

/*
	Name: function_d70f65d0
	Namespace: namespace_58e19d6
	Checksum: 0x3D896E40
	Offset: 0x4E18
	Size: 0xEA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d70f65d0()
{
	self endon(#"death");
	self playloopsound("zmb_doa_ai_silverback_banana_gas_lp");
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(isplayer(result.activator))
		{
			if(!isdefined(result.activator.var_76eebaf0) || gettime() > result.activator.var_76eebaf0)
			{
				result.activator thread namespace_250e9486::function_b5feb0bf();
				result.activator.var_76eebaf0 = gettime() + 1000;
			}
		}
	}
}

