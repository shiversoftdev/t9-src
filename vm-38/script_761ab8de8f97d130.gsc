#using script_60c9f7551ce6c823;
#using script_2a5bf5b4a00cee0d;
#using script_3faf478d5b0850fe;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_774302f762d76254;
#using script_1b0b07ff57d1dde3;
#using script_79315a6ccf4fce3d;
#using script_1ee011cd0961afd7;
#using script_5f20d3b434d24884;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using scripts\core_common\util_shared.gsc;
#using script_556e19065f09f8a2;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using script_2c5daa95f8fec03c;
#using script_35598499769dbb3d;
#using script_41fe08c37d53a635;
#using script_522aeb6ae906391e;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace namespace_b5ca279a;

/*
	Name: function_6600926c
	Namespace: namespace_b5ca279a
	Checksum: 0xCCBE6A4D
	Offset: 0x3D8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6600926c()
{
	level notify(-969670593);
}

/*
	Name: init
	Namespace: namespace_b5ca279a
	Checksum: 0xF147AEA6
	Offset: 0x3F8
	Size: 0x1E4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("basic_zombie", 21, &function_7f78da, undefined, 0);
	namespace_250e9486::function_252dff4d("barreler_zombie", 22, &function_ef2758f9, undefined, 9);
	namespace_250e9486::function_252dff4d("riser_zombie", 23, &function_a4b27d0e, undefined, 17);
	namespace_250e9486::function_252dff4d("smoke_zombie", 25, &function_83a2d68c, undefined, 21);
	namespace_250e9486::function_252dff4d("pole_zombie", 28, &function_38f9cf8c, undefined, 33, &function_56304f4a);
	namespace_250e9486::function_252dff4d("blood_riser", 24, &function_1eb8e7ef, undefined, 41, &function_c291edbd);
	registration = namespace_250e9486::function_3dd94c25("barreler_zombie");
	if(!isdefined(registration.var_71e54e3a))
	{
		registration.var_71e54e3a = [];
	}
	else if(!isarray(registration.var_71e54e3a))
	{
		registration.var_71e54e3a = array(registration.var_71e54e3a);
	}
	registration.var_71e54e3a[registration.var_71e54e3a.size] = "kgb";
	registerbehaviorscriptfunctions();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_b5ca279a
	Checksum: 0x26915C95
	Offset: 0x5E8
	Size: 0x3B4
	Parameters: 0
	Flags: Linked
*/
function registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_63e044e7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_11f0b891a9d2e6c7", &function_63e044e7);
	/#
		assert(isscriptfunctionptr(&function_9e433573));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2b2a4705912ffb22", &function_9e433573);
	/#
		assert(isscriptfunctionptr(&function_55b7ea22));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7561185fb9f89048", &function_55b7ea22);
	/#
		assert(isscriptfunctionptr(&function_98b102d8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_66d076094cefbdbb", &function_98b102d8);
	/#
		assert(isscriptfunctionptr(&function_4402c40a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_530185ba74913077", &function_4402c40a);
	/#
		assert(isscriptfunctionptr(&function_6a3bcddc));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_545373e09d03a06c", &function_6a3bcddc);
	/#
		assert(isscriptfunctionptr(&function_b9b03294));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1f70e1d883cae162", &function_b9b03294);
	/#
		assert(isscriptfunctionptr(&zombietraversalservice));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4367922f0295c370", &zombietraversalservice);
	/#
		assert(isscriptfunctionptr(&function_f637b05d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_52efb6ed5d3a4220", &function_f637b05d, 1);
}

/*
	Name: function_7f78da
	Namespace: namespace_b5ca279a
	Checksum: 0x94C45030
	Offset: 0x9A8
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_7f78da()
{
	self namespace_250e9486::function_25b2c8a9();
	self.var_1038c5e0 = "ai_zombie_riser";
	self.var_596fb6ed = "ai_zombie_riser";
	animrate = 1 + (level.doa.var_6c58d51 * 0.025);
	self asmsetanimationrate(animrate);
	self.basic = 1;
	self.var_c3ce559a = 0;
	self.var_bb68380c = namespace_4dae815d::function_59a9cf1d() == 0 && !isdefined(level.doa.var_6f3d327);
	self.shouldspawn = !self.var_bb68380c;
	self thread zombie_eye_glow::function_b43f92cd();
	if(self.var_bb68380c)
	{
		self thread function_e6634b0c();
		self thread function_a00c9d13();
	}
	else if(self.zombie_move_speed == "walk")
	{
		self.zombie_move_speed = (math::cointoss() ? "sprint" : "run");
	}
	self thread namespace_9fc66ac::function_ba33d23d(#"hash_6298fe3f8c45ac9f", #"hash_8c6429df541c34c", #"hash_774f44ae3771ad84");
}

/*
	Name: function_c4faf752
	Namespace: namespace_b5ca279a
	Checksum: 0x1F8C3ED4
	Offset: 0xB70
	Size: 0x19A
	Parameters: 0
	Flags: None
*/
function function_c4faf752()
{
	self function_7f78da();
	self.basic = undefined;
	self.shouldspawn = 0;
	self.zombie_move_speed = (isdefined(level.doa.var_13e8f9c9) ? level.doa.var_13e8f9c9 : (math::cointoss() ? "sprint" : "run"));
	self.var_c3ce559a = 1;
	animrate = randomfloatrange(1.2, 1.4);
	self asmsetanimationrate(animrate);
	self namespace_ed80aead::function_df5afb5e(1);
	self allowedstances("crouch");
	self setphysparams(15, 0, 24);
	self allowpitchangle(1);
	self setpitchorient();
	if(isdefined(level.doa.var_a598a835))
	{
		self.spawnloc = [[level.doa.var_a598a835]]();
	}
}

/*
	Name: function_c291edbd
	Namespace: namespace_b5ca279a
	Checksum: 0x44D03992
	Offset: 0xD18
	Size: 0x4C
	Parameters: 0
	Flags: Linked
*/
function function_c291edbd()
{
	if(!isdefined(level.doa.var_39e3fa99))
	{
		return 0;
	}
	return ([[ level.doa.var_39e3fa99 ]]->function_7856fdb6()) == #"bloodlake";
}

/*
	Name: function_1eb8e7ef
	Namespace: namespace_b5ca279a
	Checksum: 0x3DF37BED
	Offset: 0xD70
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function function_1eb8e7ef()
{
	function_a4b27d0e();
	self.var_1038c5e0 = "ai_blood_riser";
	self.var_596fb6ed = "ai_blood_riser";
}

/*
	Name: function_a4b27d0e
	Namespace: namespace_b5ca279a
	Checksum: 0x8ADE6359
	Offset: 0xDB0
	Size: 0x146
	Parameters: 0
	Flags: Linked
*/
function function_a4b27d0e()
{
	self function_7f78da();
	self.basic = undefined;
	self.shouldspawn = 1;
	self asmsetanimationrate(1.1);
	self.zombie_arms_position = (randomint(100) > 50 ? "up" : "down");
	self.zombie_move_speed = (isdefined(level.doa.var_13e8f9c9) ? level.doa.var_13e8f9c9 : "run");
	if(isdefined(level.doa.var_a598a835))
	{
		self.spawnloc = [[level.doa.var_a598a835]]();
	}
	else
	{
		/#
			assert(isdefined(level.doa.var_39e3fa99));
		#/
		self.spawnloc = [[ level.doa.var_39e3fa99 ]]->function_59fc184c();
	}
}

/*
	Name: function_ef2758f9
	Namespace: namespace_b5ca279a
	Checksum: 0xF72ED4B4
	Offset: 0xF00
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_ef2758f9()
{
	self function_7f78da();
	self.basic = undefined;
	self.zombie_arms_position = "up";
	self setavoidancemask("avoid none");
	self.zombie_move_speed = (isdefined(level.doa.var_13e8f9c9) ? level.doa.var_13e8f9c9 : "run");
	barrel = namespace_fb2125f::function_f1ca69a7("zombietron_explosive_barrel", undefined, self.origin, self.angles, 0);
	if(isdefined(barrel))
	{
		barrel notsolid();
		barrel enablelinkto();
		self enablelinkto();
		barrel disableaimassist();
		barrel.carried = 1;
		barrel.takedamage = 1;
		barrel.health = 99999;
		barrel linkto(self, "j_head", vectorscale((0, 0, 1), 15), vectorscale((1, 0, 0), 90));
		barrel thread function_bd3de922(self);
		barrel thread namespace_ec06fe4a::function_52afe5df(120);
	}
}

/*
	Name: function_56304f4a
	Namespace: namespace_b5ca279a
	Checksum: 0x7505B0E2
	Offset: 0x10C8
	Size: 0x1E
	Parameters: 0
	Flags: Linked
*/
function function_56304f4a()
{
	return level.doa.var_8d14dcbf.size < 75;
}

/*
	Name: function_38f9cf8c
	Namespace: namespace_b5ca279a
	Checksum: 0x765CE4EA
	Offset: 0x10F0
	Size: 0x104
	Parameters: 0
	Flags: Linked
*/
function function_38f9cf8c()
{
	self function_7f78da();
	self.basic = undefined;
	self.var_2b989b2e = 1;
	self.var_4dcf6637 = 1;
	self.zombie_arms_position = "up";
	self setavoidancemask("avoid none");
	self.zombie_move_speed = "run";
	self thread function_9bca3cb6();
	self.var_d415ee14 = 1;
	if(namespace_4dae815d::function_59a9cf1d() == 0 && level.doa.var_8d14dcbf.size > 30)
	{
		return;
	}
	if(randomint(100) > 50)
	{
		self thread function_7b1377e8();
	}
}

/*
	Name: function_9bca3cb6
	Namespace: namespace_b5ca279a
	Checksum: 0xB9F0358D
	Offset: 0x1200
	Size: 0x68
	Parameters: 0
	Flags: Linked
*/
function function_9bca3cb6()
{
	self endon(#"death");
	while(true)
	{
		wait(randomfloatrange(0.1, 0.4));
		self namespace_83eb6304::function_3ecfde67("pole_zombie_elecBurst");
	}
}

/*
	Name: function_711927a1
	Namespace: namespace_b5ca279a
	Checksum: 0xBEA9F41
	Offset: 0x1270
	Size: 0x138
	Parameters: 1
	Flags: Linked
*/
function function_711927a1(origin)
{
	org = namespace_ec06fe4a::function_e22ae9b3(origin);
	org thread namespace_ec06fe4a::function_52afe5df(3.4);
	trap = {};
	trap.origin = origin + (vectorscale((0, 0, -1), 100));
	trap.angles = (0, 0, 0);
	pole = namespace_53f73cda::function_28826539(trap, 0);
	level.doa.var_8d14dcbf[level.doa.var_8d14dcbf.size] = pole;
	pole moveto(origin, 2);
	while(isdefined(org))
	{
		org namespace_83eb6304::function_3ecfde67("pole_blast");
		wait(randomfloatrange(0.5, 1.2));
	}
}

/*
	Name: function_7b1377e8
	Namespace: namespace_b5ca279a
	Checksum: 0x34FC635F
	Offset: 0x13B0
	Size: 0xBC
	Parameters: 0
	Flags: Linked
*/
function function_7b1377e8()
{
	self endon(#"death");
	wait(4);
	while(true)
	{
		wait(0.2);
		if(randomint(100) < 3)
		{
			break;
		}
	}
	self.ignoreall = 1;
	self.var_c0bd8c06 = 1;
	self thread namespace_ec06fe4a::function_570729f0(10);
	self waittilltimeout(4, #"hash_12b1eb419a23e3bd");
	level thread function_711927a1(self.origin);
}

/*
	Name: function_bd3de922
	Namespace: namespace_b5ca279a
	Checksum: 0x25CD9342
	Offset: 0x1478
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_bd3de922(carrier)
{
	self endon(#"death");
	carrier waittill(#"death");
	self unlink();
	self solid();
	impulse = anglestoforward(self.angles) + vectorscale((0, 0, 1), 5);
	impulse = vectorscale(impulse, 3);
	self physicslaunch(self.origin, impulse);
	self enableaimassist();
	self thread namespace_fb2125f::function_db4a8bad(1, self);
}

/*
	Name: function_83a2d68c
	Namespace: namespace_b5ca279a
	Checksum: 0x3C73EAC4
	Offset: 0x1578
	Size: 0x244
	Parameters: 0
	Flags: Linked
*/
function function_83a2d68c()
{
	self namespace_250e9486::function_25b2c8a9();
	self.var_1038c5e0 = "shadow_rez_in";
	self.var_596fb6ed = "shadow_appear";
	self.var_bb68380c = namespace_4dae815d::function_59a9cf1d() == 0;
	self.shouldspawn = 1;
	self.teleports = randomint(2) + 1;
	self.zombie_move_speed = (isdefined(level.doa.var_13e8f9c9) ? level.doa.var_13e8f9c9 : "sprint");
	if(isdefined(level.doa.var_a598a835))
	{
		self.spawnloc = [[level.doa.var_a598a835]]();
	}
	else
	{
		/#
			assert(isdefined(level.doa.var_39e3fa99));
		#/
		self.spawnloc = [[ level.doa.var_39e3fa99 ]]->function_70fb5745();
	}
	self.org = namespace_ec06fe4a::function_e22ae9b3(self.spawnloc.origin + vectorscale((0, 0, 1), 40), "tag_origin");
	if(isdefined(self.org))
	{
		self.org.takedamage = 0;
		self.org.targetname = "shadowTeleportMeNow";
		self.org thread namespace_ec06fe4a::function_d55f042c(self, "death");
	}
	self.no_ragdoll = 1;
	self.var_66d5e435 = 1;
	aiutility::addaioverridedamagecallback(self, &function_a86c6bf8);
	self thread shadowteleportmenow(1, self.spawnloc.origin);
}

/*
	Name: shadowteleportmenow
	Namespace: namespace_b5ca279a
	Checksum: 0x1BD15AFA
	Offset: 0x17C8
	Size: 0x496
	Parameters: 2
	Flags: Linked
*/
function shadowteleportmenow(initial, origin)
{
	if(!isdefined(initial))
	{
		initial = 0;
	}
	if(!isdefined(origin))
	{
		origin = self.origin;
	}
	if(!isdefined(level.doa.var_39e3fa99))
	{
		self thread namespace_ec06fe4a::function_570729f0();
		return;
	}
	self endon(#"death");
	if(is_true(self.var_6a59f093))
	{
		return;
	}
	/#
		assert(self.teleports > 0);
	#/
	self.var_6a59f093 = 1;
	if(!initial)
	{
		self.teleports--;
	}
	spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745(origin, 256, 1400).origin;
	self.ignoreall = 1;
	self.takedamage = 0;
	self namespace_83eb6304::function_3ecfde67("shadow_fade");
	self namespace_83eb6304::function_3ecfde67("spawnZombie");
	wait(0.1);
	if(isdefined(self.org))
	{
		self.org.origin = self.origin + vectorscale((0, 0, 1), 40);
		util::wait_network_frame();
		self.org namespace_83eb6304::function_3ecfde67("shadow_move");
		self.org namespace_83eb6304::function_3ecfde67("shadow_glow");
		self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_smokeman_lp");
		self.org namespace_e32bb68::function_3a59ec34("zmb_doa_ai_smokeman_teleport_out");
		wait(0.3);
		self namespace_ec06fe4a::function_8c808737();
		self notsolid();
		self setplayercollision(0);
		self linkto(self.org);
		self.org moveto(spot + vectorscale((0, 0, 1), 40), 2);
		self.org waittilltimeout(2.1, #"movedone");
		self.org namespace_83eb6304::function_3ecfde67("shadow_appear");
		self.org namespace_e32bb68::function_3a59ec34("zmb_doa_ai_smokeman_teleport_in_pre");
		wait(1.9);
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_smokeman_teleport_in");
		self unlink();
		self forceteleport(spot);
		self namespace_ec06fe4a::function_4f72130c();
		self solid();
		self setplayercollision(1);
		self.org namespace_83eb6304::turnofffx("shadow_move");
		self.org namespace_83eb6304::turnofffx("shadow_glow");
		self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_smokeman_lp");
	}
	self namespace_83eb6304::function_3ecfde67("spawnZombie");
	wait(1);
	self.ignoreall = 0;
	self.takedamage = 1;
	self.var_6a59f093 = undefined;
	self.var_72283e28 = 0;
}

/*
	Name: function_a86c6bf8
	Namespace: namespace_b5ca279a
	Checksum: 0x619FE3B8
	Offset: 0x1C68
	Size: 0x1A8
	Parameters: 16
	Flags: Linked
*/
function function_a86c6bf8(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, var_fd90b0bb, vpoint, vdir, shitloc, vdamageorigin, timeoffset, boneindex, modelindex, surfacetype, surfacenormal)
{
	if(self.teleports > 0)
	{
		if(surfacenormal >= self.health)
		{
			surfacenormal = self.health - 1;
		}
		self thread shadowteleportmenow();
	}
	else if(surfacenormal >= self.health)
	{
		self namespace_e32bb68::function_ae271c0b("zmb_doa_ai_smokeman_lp");
		self namespace_ec06fe4a::function_4f72130c();
		self.takedamage = 0;
		self.aioverridedamage = undefined;
		orb = namespace_ec06fe4a::function_e22ae9b3(self.origin);
		if(isdefined(orb))
		{
			orb thread namespace_ec06fe4a::function_52afe5df(0.4);
			orb namespace_83eb6304::function_3ecfde67("shadow_die");
			orb namespace_e32bb68::function_3a59ec34("zmb_doa_ai_smokeman_death");
		}
	}
	return surfacenormal;
}

/*
	Name: function_a00c9d13
	Namespace: namespace_b5ca279a
	Checksum: 0x38B8F9D0
	Offset: 0x1E18
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_a00c9d13()
{
	self endon(#"death");
	self waittill(#"speed_change");
	self.var_860a34b9 = undefined;
	self.var_72283e28 = 0;
	self thread function_e6634b0c(self.var_fe2082cc);
}

/*
	Name: function_e6634b0c
	Namespace: namespace_b5ca279a
	Checksum: 0x88732AF3
	Offset: 0x1E80
	Size: 0x1E4
	Parameters: 1
	Flags: Linked
*/
function function_e6634b0c(var_11b86a4c)
{
	if(!isdefined(var_11b86a4c))
	{
		var_11b86a4c = 45;
	}
	if(!isdefined(level.doa.var_39e3fa99))
	{
		return;
	}
	self notify("71c7368f172d6e8d");
	self endon("71c7368f172d6e8d");
	self endon(#"death");
	if(self.zombie_move_speed != "walk")
	{
		self waittilltimeout(var_11b86a4c, #"wander");
		if(isdefined(self.var_ce1aa55f) && (gettime() - self.var_ce1aa55f) <= 10000)
		{
			self thread function_e6634b0c();
		}
	}
	else
	{
		self waittill(#"wander", #"speed_change");
	}
	spot = [[ level.doa.var_39e3fa99 ]]->function_70fb5745(self.origin, 300, 2048);
	if(isdefined(spot))
	{
		self.var_860a34b9 = spot.origin;
	}
	else
	{
		self.var_860a34b9 = self.startposition;
	}
	self.oldradius = self.goalradius;
	self.goalradius = 256;
	self.var_72283e28 = 0;
	self namespace_250e9486::function_41354e51(self.var_860a34b9, 1, 1);
	self waittilltimeout(10, #"goal");
	self.var_860a34b9 = undefined;
	self.goalradius = self.oldradius;
	self thread function_e6634b0c(var_11b86a4c);
}

/*
	Name: function_f637b05d
	Namespace: namespace_b5ca279a
	Checksum: 0xC46ED0CF
	Offset: 0x2070
	Size: 0x32
	Parameters: 1
	Flags: Linked
*/
function function_f637b05d(behaviortreeentity)
{
	behaviortreeentity.var_93a62fe = namespace_7f5aeb59::function_7781556b(behaviortreeentity.origin, 1);
}

/*
	Name: zombietraversalservice
	Namespace: namespace_b5ca279a
	Checksum: 0x7ED5ADAD
	Offset: 0x20B0
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function zombietraversalservice(entity)
{
	if(isdefined(entity.traversestartnode))
	{
		entity collidewithactors(0);
		return true;
	}
	return false;
}

/*
	Name: function_b9b03294
	Namespace: namespace_b5ca279a
	Checksum: 0x5DD398B9
	Offset: 0x20F8
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b9b03294(entity)
{
	if(self function_3c566724())
	{
		return true;
	}
	startnode = entity.traversestartnode;
	if(!isdefined(startnode) || !isnodeenabled(startnode))
	{
		return false;
	}
	return true;
}

/*
	Name: function_4402c40a
	Namespace: namespace_b5ca279a
	Checksum: 0xCEAC8A76
	Offset: 0x2178
	Size: 0xA0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4402c40a(entity)
{
	if(!is_true(entity.var_e5ad72a0))
	{
		if(isdefined(entity.var_1038c5e0))
		{
			entity namespace_83eb6304::function_3ecfde67(entity.var_1038c5e0);
		}
		entity.var_c0bd8c06 = undefined;
		entity.var_e5ad72a0 = 1;
		entity disableaimassist();
		entity pathmode("dont move", 1);
	}
	return true;
}

/*
	Name: function_6a3bcddc
	Namespace: namespace_b5ca279a
	Checksum: 0xE90BB4C2
	Offset: 0x2220
	Size: 0x5E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6a3bcddc(entity)
{
	entity namespace_ec06fe4a::function_8c808737();
	entity notsolid();
	entity notify(#"hash_12b1eb419a23e3bd");
	entity.var_e5ad72a0 = undefined;
	return true;
}

/*
	Name: function_55b7ea22
	Namespace: namespace_b5ca279a
	Checksum: 0xBA868529
	Offset: 0x2288
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_55b7ea22(entity)
{
	if(!is_true(entity.var_1f2d0447))
	{
		entity solid();
		if(isdefined(entity.var_596fb6ed))
		{
			entity namespace_83eb6304::function_3ecfde67(entity.var_596fb6ed);
		}
		entity pathmode("dont move");
		entity.var_1f2d0447 = 1;
		entity.shouldspawn = undefined;
		entity disableaimassist();
	}
}

/*
	Name: function_98b102d8
	Namespace: namespace_b5ca279a
	Checksum: 0x69B47B51
	Offset: 0x2350
	Size: 0x76
	Parameters: 1
	Flags: Linked, Private
*/
function private function_98b102d8(entity)
{
	entity.var_1f2d0447 = undefined;
	entity pathmode("move allowed");
	entity enableaimassist();
	entity notify(#"not_underground");
	entity.doa.original_origin = self.origin;
}

/*
	Name: function_63e044e7
	Namespace: namespace_b5ca279a
	Checksum: 0x9CA8DD93
	Offset: 0x23D0
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_63e044e7(entity)
{
	return is_true(entity.shouldspawn);
}

/*
	Name: function_9e433573
	Namespace: namespace_b5ca279a
	Checksum: 0xEA6071F3
	Offset: 0x2400
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e433573(entity)
{
	return is_true(entity.var_c0bd8c06);
}

/*
	Name: function_d2fee26e
	Namespace: namespace_b5ca279a
	Checksum: 0x1B8D8767
	Offset: 0x2430
	Size: 0x228
	Parameters: 12
	Flags: None
*/
function function_d2fee26e(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex)
{
	self.var_426947c4 = undefined;
	weakpoint = namespace_81245006::function_3131f5dd(self, modelindex, 1);
	if(isdefined(weakpoint) && weakpoint.type === #"armor")
	{
		namespace_81245006::function_ef87b7e8(weakpoint, boneindex);
		if(namespace_81245006::function_f29756fe(weakpoint) === 3 && isdefined(weakpoint.var_f371ebb0))
		{
			destructserverutils::function_8475c53a(self, weakpoint.var_f371ebb0);
			self.var_426947c4 = 1;
			if(weakpoint.var_f371ebb0 === "body_armor")
			{
				callback::callback(#"hash_7d67d0e9046494fb");
			}
		}
		if(self.var_9fde8624 === #"hash_7a778318514578f7")
		{
			boneindex = int(boneindex * 0.25);
		}
		else if(self.var_9fde8624 === #"hash_622e7c9cc7c06c7")
		{
			boneindex = int(boneindex * 0.5);
		}
		self.var_67f98db0 = 1;
		var_43f0e034 = function_f4e9bba4(self);
		self function_2d4173a8(var_43f0e034);
	}
	return boneindex;
}

/*
	Name: function_f4e9bba4
	Namespace: namespace_b5ca279a
	Checksum: 0x69C975E2
	Offset: 0x2660
	Size: 0x12A
	Parameters: 1
	Flags: Linked
*/
function function_f4e9bba4(entity)
{
	max_health = 0;
	var_765c0df4 = 0;
	weakpoints = namespace_81245006::function_fab3ee3e(entity);
	if(!isdefined(weakpoints))
	{
		return 0;
	}
	foreach(weakpoint in weakpoints)
	{
		if(weakpoint.type === #"armor")
		{
			max_health = max_health + weakpoint.maxhealth;
			var_765c0df4 = var_765c0df4 + max(weakpoint.health, 0);
		}
	}
	if(max_health == 0)
	{
		return 0;
	}
	return var_765c0df4 / max_health;
}

