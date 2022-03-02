#using script_164a456ce05c3483;
#using script_178024232e91b0a1;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_455b9cb22d561924;
#using script_47851dbeea22fe66;
#using script_489b835a247c990e;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_59f07c660e6710a5;
#using script_5f20d3b434d24884;
#using script_774302f762d76254;
#using script_7b7ed6e4bc963a51;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\oob.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_53a8fe5e;

/*
	Name: init
	Namespace: namespace_53a8fe5e
	Checksum: 0x3E881744
	Offset: 0x450
	Size: 0xD4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("actor", "hellhound_fx", 1, 1, "int");
	namespace_250e9486::function_252dff4d("wolf_ghosthound", 19, &function_3ba58018, &function_df18852, 45);
	namespace_250e9486::function_252dff4d("wolf_hellhound", 20, &function_ebb53c52, &function_df18852, 65);
	registerbehaviorscriptfunctions();
	function_8c1ad7f9();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_53a8fe5e
	Checksum: 0x3620CA87
	Offset: 0x530
	Size: 0x31C
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_52fd1aa8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_347361909496bb67", &function_52fd1aa8);
	/#
		assert(isscriptfunctionptr(&function_ee68dfca));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_589814e7ae852fb7", &function_ee68dfca);
	/#
		assert(isscriptfunctionptr(&function_86104a92));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2c51dac6b31ae16e", &function_86104a92);
	/#
		assert(isscriptfunctionptr(&function_cf98d4f7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4d690a74a315c5c3", &function_cf98d4f7);
	/#
		assert(isscriptfunctionptr(&function_ad163d5a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4c13ee431006ea01", &function_ad163d5a);
	/#
		assert(!isdefined(&wolfmeleeaction) || isscriptfunctionptr(&wolfmeleeaction));
	#/
	/#
		assert(!isdefined(undefined) || isscriptfunctionptr(undefined));
	#/
	/#
		assert(!isdefined(&function_8d42c979) || isscriptfunctionptr(&function_8d42c979));
	#/
	behaviortreenetworkutility::registerbehaviortreeaction("wolfMeleeAction", &wolfmeleeaction, undefined, &function_8d42c979);
}

/*
	Name: function_8c1ad7f9
	Namespace: namespace_53a8fe5e
	Checksum: 0xA344D562
	Offset: 0x858
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_8c1ad7f9()
{
	ai::registermatchedinterface(#"zombie_dog", #"min_run_dist", 500);
	ai::registermatchedinterface(#"zombie_dog", #"sprint", 0, array(1, 0));
	ai::registermatchedinterface(#"zombie_dog", #"patrol", 0, array(1, 0));
}

/*
	Name: function_3ba58018
	Namespace: namespace_53a8fe5e
	Checksum: 0xD780CCF9
	Offset: 0x930
	Size: 0xA6
	Parameters: 0
	Flags: Linked
*/
function function_3ba58018()
{
	function_ebb53c52();
	self.doa.var_74e4ded8 = 1;
	self setavoidancemask("avoid none");
	self collidewithactors(0);
	self setplayercollision(0);
	self.health = 1500;
	self.var_af545843 = 1;
	self.var_abe67a20 = 1;
	self.var_bbdaef90 = 1;
}

/*
	Name: function_ebb53c52
	Namespace: namespace_53a8fe5e
	Checksum: 0x9AA5A6A3
	Offset: 0x9E0
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function function_ebb53c52()
{
	self namespace_250e9486::function_25b2c8a9();
	self namespace_ec06fe4a::function_8c808737();
	self.shouldrun = 0;
	self.var_3b227abd = randomintrange(10, 30) * 1000;
	if(namespace_4dae815d::function_59a9cf1d() != 0)
	{
		self.var_717a48cb = 0;
		self.var_f506c5cd = 1200;
		self.var_32d07c96 = sqr(self.var_f506c5cd);
		self.var_c8b974fe = self.origin;
	}
	self.var_cc28f8dc = 80;
	self.var_651e2d9b = 2;
	self.health = 4000;
	self.var_1c8b76d3 = 1;
	self.no_gib = 1;
	self.var_27860c49 = 1;
	self thread function_92312127();
	self thread function_47c86b9e(self);
	self thread function_b8558f62();
	self enableaimassist();
	aiutility::addaioverridedamagecallback(self, &function_da4ec7ea);
}

/*
	Name: function_da4ec7ea
	Namespace: namespace_53a8fe5e
	Checksum: 0xF8106C45
	Offset: 0xB78
	Size: 0x212
	Parameters: 13
	Flags: Linked, Private
*/
function private function_da4ec7ea(inflictor, attacker, damage, idflags, meansofdeath, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(modelindex >= self.health)
	{
		self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_ghosthound_vocal_sprint");
		self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_hellhound_vocal_sprint");
		self namespace_ec06fe4a::function_8c808737();
		self notsolid();
		orb = namespace_ec06fe4a::function_e22ae9b3(self.origin);
		if(!isdefined(orb))
		{
			return modelindex;
		}
		orb thread namespace_ec06fe4a::function_52afe5df(0.4);
		if(self.script_noteworthy === "wolf_ghosthound")
		{
			orb namespace_83eb6304::function_3ecfde67("ghosthound_death");
			orb namespace_83eb6304::function_3ecfde67("electrical_explo");
			orb namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghosthound_explode");
		}
		else if(self.script_noteworthy === "wolf_hellhound")
		{
			orb namespace_e32bb68::function_3a59ec34("zmb_doa_ai_hellhound_explode");
			orb namespace_83eb6304::function_3ecfde67("hellhound_death");
		}
	}
	return modelindex;
}

/*
	Name: function_b4b1df9c
	Namespace: namespace_53a8fe5e
	Checksum: 0x76761B25
	Offset: 0xD98
	Size: 0xEC
	Parameters: 1
	Flags: None
*/
function function_b4b1df9c(params)
{
	self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_plaguehound_vocal_sprint");
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_plaguehound_explode");
	self namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
	trigger = namespace_ec06fe4a::spawntrigger("trigger_radius", self.origin, (2 | 1) | 512, 40, 50);
	if(isdefined(trigger))
	{
		trigger thread namespace_ec06fe4a::function_52afe5df(3);
		trigger thread function_86555fba();
	}
}

/*
	Name: function_1c24aba3
	Namespace: namespace_53a8fe5e
	Checksum: 0x71EDDDBC
	Offset: 0xE90
	Size: 0x48
	Parameters: 0
	Flags: Linked
*/
function function_1c24aba3()
{
	self endon(#"death");
	while(true)
	{
		self namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
		wait(0.25);
	}
}

/*
	Name: function_86555fba
	Namespace: namespace_53a8fe5e
	Checksum: 0xAB22C679
	Offset: 0xEE0
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_86555fba()
{
	self endon(#"death");
	org = namespace_ec06fe4a::function_e22ae9b3(self.origin);
	if(isdefined(org))
	{
		org thread namespace_ec06fe4a::function_d55f042c(self, "death");
		org thread function_1c24aba3();
	}
	while(true)
	{
		result = undefined;
		result = self waittill(#"trigger");
		if(isdefined(org))
		{
			org namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
		}
		if(isdefined(result.activator) && !is_true(result.activator.boss))
		{
			result.activator thread namespace_250e9486::function_b5feb0bf();
		}
	}
}

/*
	Name: damagewatch
	Namespace: namespace_53a8fe5e
	Checksum: 0xD34C911A
	Offset: 0x1010
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function damagewatch()
{
	self notify("54541a049aceddf6");
	self endon("54541a049aceddf6");
	self endon(#"death");
	result = undefined;
	result = self waittill(#"damage");
	if(isdefined(result.attacker) && issentient(result.attacker))
	{
		self.favoriteenemy = result.attacker;
		self.hasseenfavoriteenemy = 1;
		self namespace_250e9486::function_41354e51(get_locomotion_target(self), 1);
		self.var_717a48cb = 0;
	}
}

/*
	Name: function_df18852
	Namespace: namespace_53a8fe5e
	Checksum: 0xD24BDFA4
	Offset: 0x10F0
	Size: 0x128
	Parameters: 0
	Flags: Linked
*/
function function_df18852()
{
	self endon(#"death");
	self thread damagewatch();
	self thread function_a47b7e79(1);
	self function_56bb65ac("WALK");
	self.var_84f9cc2e = gettime() + 1000;
	var_30d02a4c = 0;
	while(true)
	{
		self namespace_250e9486::function_89c95270();
		while(self function_ad163d5a())
		{
			wait(0.5);
		}
		self.shouldrun = need_to_run();
		self function_56bb65ac((self.shouldrun ? "RUN" : "WALK"));
		wait(self.doa.thinkrate);
	}
}

/*
	Name: function_47c86b9e
	Namespace: namespace_53a8fe5e
	Checksum: 0x5018ACC6
	Offset: 0x1220
	Size: 0x200
	Parameters: 1
	Flags: Linked
*/
function function_47c86b9e(ai)
{
	ai endon(#"death");
	ai namespace_ec06fe4a::function_8c808737();
	ai.takedamage = 0;
	ai setfreecameralockonallowed(0);
	if(isdefined(ai.favoriteenemy))
	{
		angle = vectortoangles(ai.favoriteenemy.origin - ai.origin);
		angles = (ai.angles[0], angle[1], ai.angles[2]);
	}
	else
	{
		angles = ai.angles;
	}
	ai dontinterpolate();
	ai forceteleport(ai.origin, angles);
	if(ai.script_noteworthy === "wolf_plaguehound")
	{
		ai namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
	}
	else
	{
		ai namespace_83eb6304::function_3ecfde67("lightningStrike");
	}
	ai.takedamage = 1;
	wait(0.4);
	ai namespace_ec06fe4a::function_4f72130c();
	ai setfreecameralockonallowed(1);
	if(ai.script_noteworthy === "wolf_hellhound")
	{
		ai clientfield::set("hellhound_fx", 1);
	}
	ai notify(#"hash_6f1cd023691af538");
}

/*
	Name: function_b8558f62
	Namespace: namespace_53a8fe5e
	Checksum: 0x5C668DFC
	Offset: 0x1428
	Size: 0xEC
	Parameters: 0
	Flags: Linked
*/
function function_b8558f62()
{
	if(self.script_noteworthy === "wolf_plaguehound")
	{
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_plaguehound_spawn");
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_plaguehound_vocal_sprint");
	}
	else
	{
		if(self.script_noteworthy === "wolf_hellhound")
		{
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_hellhound_spawn");
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_hellhound_vocal_sprint");
		}
		else
		{
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghosthound_spawn");
			self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_ghosthound_vocal_sprint");
		}
	}
}

/*
	Name: function_2e6b2ca9
	Namespace: namespace_53a8fe5e
	Checksum: 0xC9BDC858
	Offset: 0x1520
	Size: 0x32C
	Parameters: 0
	Flags: None
*/
function function_2e6b2ca9()
{
	namespace_250e9486::function_4b49bf0d();
	force = 0;
	if(isdefined(self.favoriteenemy) && level.doa.world_state == 0)
	{
		force = 1;
		self.hasseenfavoriteenemy = 1;
		self thread function_a47b7e79(1);
	}
	else if(!is_true(self.hasseenfavoriteenemy) && isdefined(self.favoriteenemy))
	{
		var_35c0bfbe = self util::point_in_fov(self.favoriteenemy.origin, 0.8, 1);
		cansee = var_35c0bfbe && self cansee(self.favoriteenemy);
		/#
			if(isdefined(self.favoriteenemy) && isplayer(self.favoriteenemy) && self.favoriteenemy isinmovemode("", ""))
			{
				cansee = 0;
			}
		#/
		if(cansee)
		{
			force = 1;
			self.hasseenfavoriteenemy = 1;
			self thread function_a47b7e79(1);
		}
	}
	if(isdefined(self.favoriteenemy) && is_true(self.hasseenfavoriteenemy))
	{
		self namespace_250e9486::function_8f172270(get_locomotion_target(self));
		self.var_717a48cb = 0;
	}
	else if(!is_true(self.hasseenfavoriteenemy))
	{
		time = gettime();
		if(self.var_717a48cb < time)
		{
			var_86faa86d = doa_enemy::function_4b2f19cb();
			self.var_717a48cb = time + randomintrange(12000, 24000);
			if(isdefined(var_86faa86d))
			{
				self namespace_250e9486::function_41354e51(var_86faa86d);
				self.lasttargetposition = var_86faa86d;
			}
		}
		else
		{
			var_1f2328d0 = self function_4794d6a3();
			if(is_true(var_1f2328d0.isatgoal))
			{
				function_a47b7e79(randomint(100) > 80);
			}
		}
	}
}

/*
	Name: get_locomotion_target
	Namespace: namespace_53a8fe5e
	Checksum: 0x1274ABC
	Offset: 0x1858
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function get_locomotion_target(behaviortreeentity)
{
	if(!isdefined(behaviortreeentity.favoriteenemy))
	{
		return undefined;
	}
	return behaviortreeentity namespace_250e9486::function_bd5a9fa6();
}

/*
	Name: need_to_run
	Namespace: namespace_53a8fe5e
	Checksum: 0x182A14A2
	Offset: 0x1898
	Size: 0x17A
	Parameters: 0
	Flags: Linked
*/
function need_to_run()
{
	run_yaw = 35;
	run_pitch = 30;
	run_height = 64;
	if(!isdefined(self.enemy))
	{
		return false;
	}
	if(self.health < self.maxhealth)
	{
		return true;
	}
	if(isdefined(self.favoriteenemy) && !is_true(self.hasseenfavoriteenemy))
	{
		return false;
	}
	height = self.origin[2] - self.enemy.origin[2];
	if(abs(height) > run_height)
	{
		return false;
	}
	yaw = self namespace_ec06fe4a::absyawtoenemy();
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
	Name: function_56bb65ac
	Namespace: namespace_53a8fe5e
	Checksum: 0xBBEF67C6
	Offset: 0x1A20
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_56bb65ac(speed)
{
	if(!isdefined(speed))
	{
		speed = "WALK";
	}
	self setblackboardattribute("_wolf_should_run", speed);
}

/*
	Name: function_ad163d5a
	Namespace: namespace_53a8fe5e
	Checksum: 0xA45FC3CA
	Offset: 0x1A68
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_ad163d5a(behaviortreeentity)
{
	return self getblackboardattribute("_wolf_should_howl") === "HOWL";
}

/*
	Name: function_a47b7e79
	Namespace: namespace_53a8fe5e
	Checksum: 0xDDB48597
	Offset: 0x1AA8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_a47b7e79(howl)
{
	if(!isdefined(howl))
	{
		howl = 1;
	}
	self endon(#"death");
	if(howl)
	{
		self setblackboardattribute("_wolf_should_howl", "HOWL");
		self waittilltimeout(2, #"damage");
	}
	self setblackboardattribute("_wolf_should_howl", "DONT_HOWL");
}

/*
	Name: get_last_valid_position
	Namespace: namespace_53a8fe5e
	Checksum: 0xAD7A4E5C
	Offset: 0x1B50
	Size: 0xC
	Parameters: 1
	Flags: None
*/
function get_last_valid_position(var_8dfc1c3)
{
}

/*
	Name: is_target_valid
	Namespace: namespace_53a8fe5e
	Checksum: 0x1774054C
	Offset: 0x1B68
	Size: 0xCE
	Parameters: 2
	Flags: Linked
*/
function is_target_valid(dog, target)
{
	if(!isdefined(target))
	{
		return false;
	}
	if(!isalive(target))
	{
		return false;
	}
	if(dog.team == target.team)
	{
		return false;
	}
	if(isplayer(target) && !namespace_7f5aeb59::isplayervalid(target))
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
	return true;
}

/*
	Name: function_52fd1aa8
	Namespace: namespace_53a8fe5e
	Checksum: 0xAAAC0B04
	Offset: 0x1C40
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_52fd1aa8(behaviortreeentity)
{
	return behaviortreeentity getblackboardattribute("_wolf_should_run") === "WALK";
}

/*
	Name: function_ee68dfca
	Namespace: namespace_53a8fe5e
	Checksum: 0xE9482BBB
	Offset: 0x1C80
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_ee68dfca(behaviortreeentity)
{
	return behaviortreeentity getblackboardattribute("_wolf_should_run") === "RUN";
}

/*
	Name: function_86104a92
	Namespace: namespace_53a8fe5e
	Checksum: 0xE1122C00
	Offset: 0x1CC0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_86104a92(behaviortreeentity)
{
	return behaviortreeentity getblackboardattribute("_wolf_should_run") === "SPRINT";
}

/*
	Name: function_cf98d4f7
	Namespace: namespace_53a8fe5e
	Checksum: 0xC8E50D3
	Offset: 0x1D00
	Size: 0xC0
	Parameters: 1
	Flags: Linked
*/
function function_cf98d4f7(behaviortreeentity)
{
	if(behaviortreeentity.ignoreall || !is_target_valid(behaviortreeentity, behaviortreeentity.favoriteenemy))
	{
		return false;
	}
	meleedist = 72;
	if(distancesquared(behaviortreeentity.origin, behaviortreeentity.favoriteenemy.origin) < sqr(meleedist) && behaviortreeentity cansee(behaviortreeentity.favoriteenemy))
	{
		return true;
	}
	return false;
}

/*
	Name: function_a19ebce9
	Namespace: namespace_53a8fe5e
	Checksum: 0x4564C9F2
	Offset: 0x1DC8
	Size: 0x1FC
	Parameters: 1
	Flags: Linked
*/
function function_a19ebce9(target)
{
	if(!isdefined(target))
	{
		return;
	}
	if(distancesquared(self.origin, target.origin) > sqr(36))
	{
		return;
	}
	registernotice_walla = anglestoforward(self.angles);
	var_2f706708 = self gettagorigin("j_neck");
	vec_to_target = vectornormalize(target.origin - self.origin);
	vecdot = vectordot(vec_to_target, registernotice_walla);
	if(vecdot > 0.8)
	{
		var_1be3aa53 = 1;
	}
	if(!is_true(var_1be3aa53))
	{
		return;
	}
	target_origin = (target.origin[0], target.origin[1], target.origin[2] + 32);
	if(bullettracepassed(var_2f706708, target_origin, 0, self))
	{
		target dodamage(self.var_cc28f8dc, self.origin, self, self, "none", "MOD_MELEE");
		if(isplayer(target))
		{
			target playrumbleonentity("damage_heavy");
		}
	}
}

/*
	Name: function_92312127
	Namespace: namespace_53a8fe5e
	Checksum: 0xB37E9544
	Offset: 0x1FD0
	Size: 0x88
	Parameters: 0
	Flags: Linked
*/
function function_92312127()
{
	self endon(#"death");
	while(true)
	{
		result = undefined;
		result = self waittill(#"dog_melee");
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_hound_bite");
		self function_a19ebce9(self.enemy);
	}
}

/*
	Name: use_low_attack
	Namespace: namespace_53a8fe5e
	Checksum: 0x2123F796
	Offset: 0x2060
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
	Name: wolfmeleeaction
	Namespace: namespace_53a8fe5e
	Checksum: 0xBAEB29FB
	Offset: 0x21D0
	Size: 0xA0
	Parameters: 2
	Flags: Linked
*/
function wolfmeleeaction(behaviortreeentity, asmstatename)
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
	Name: function_8d42c979
	Namespace: namespace_53a8fe5e
	Checksum: 0x96185401
	Offset: 0x2278
	Size: 0x38
	Parameters: 2
	Flags: Linked
*/
function function_8d42c979(behaviortreeentity, asmstatename)
{
	asmstatename setblackboardattribute("_context", undefined);
	return 4;
}

