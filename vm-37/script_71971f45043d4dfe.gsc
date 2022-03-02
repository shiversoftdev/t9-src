#using script_164a456ce05c3483;
#using script_17dcb1172e441bf6;
#using script_1b01e95a6b5270fd;
#using script_1ee011cd0961afd7;
#using script_2a5bf5b4a00cee0d;
#using script_317aa6153a75c589;
#using script_35598499769dbb3d;
#using script_3819e7a1427df6d2;
#using script_3aa0f32b70d4f7cb;
#using script_3f9e0dc8454d98e1;
#using script_41fe08c37d53a635;
#using script_47851dbeea22fe66;
#using script_489b835a247c990e;
#using script_4bf952f6ba31bb17;
#using script_4d85e8de54b02198;
#using script_522aeb6ae906391e;
#using script_5701633066d199f2;
#using script_57f7003580bb15e0;
#using script_59f07c660e6710a5;
#using script_5f20d3b434d24884;
#using script_6809bf766eba194a;
#using script_71dfbfdfba4489a0;
#using script_7b7ed6e4bc963a51;
#using script_bd2b8aaa388dcce;
#using script_caf007e2a98afa2;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_6479037a;

/*
	Name: init
	Namespace: namespace_6479037a
	Checksum: 0x1231CAD4
	Offset: 0x4C8
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function init()
{
	namespace_250e9486::function_252dff4d("steiner", 15, &function_a485d734, undefined, 65);
	namespace_250e9486::function_252dff4d("steiner_split_left_arm", 16, &function_a485d734, undefined, 65);
	namespace_250e9486::function_252dff4d("steiner_split_right_arm", 17, &function_a485d734, undefined, 65);
	clientfield::register("actor", "steiner_radiation_bomb_prepare_fire_clientfield", 1, 1, "int");
	clientfield::register("actor", "steiner_split_combine_fx_clientfield", 1, 1, "int");
	function_a767bb1c("zombie_steiner_split_radiation_blast_spawner", "split_blast");
	function_a767bb1c("zombie_steiner_split_radiation_bomb_spawner", "split_bomb");
	registerbehaviorscriptfunctions();
}

/*
	Name: function_a485d734
	Namespace: namespace_6479037a
	Checksum: 0xA821A737
	Offset: 0x618
	Size: 0x3D2
	Parameters: 0
	Flags: Linked
*/
function function_a485d734()
{
	if(!isdefined(level.doa.steiner))
	{
		level.doa.steiner = doa_enemy::function_d7c5adee("steiner");
		level.doa.var_c1781ccb = doa_enemy::function_d7c5adee("steiner_split_left_arm");
		level.doa.var_e6cf829d = doa_enemy::function_d7c5adee("steiner_split_right_arm");
	}
	self namespace_250e9486::function_25b2c8a9();
	if(!isdefined(self.var_9fde8624))
	{
		self.maxhealth = self.maxhealth + (60000 + (15000 * getplayers().size));
		self.var_8d1d18aa = 1;
		self setblackboardattribute("_run_n_gun_variation", "variation_forward");
	}
	else
	{
		self.maxhealth = self.maxhealth + (25000 + (7000 * getplayers().size));
	}
	self.health = self.maxhealth;
	self.no_gib = 1;
	self.zombie_move_speed = "walk";
	self.var_216935f8 = 1;
	self.var_c7121c91 = 1;
	self.org = namespace_ec06fe4a::function_e22ae9b3(self.origin, "tag_origin", (0, 0, 0), "steiner org");
	if(isdefined(self.org))
	{
		self.org thread namespace_ec06fe4a::function_d55f042c(self, "death");
	}
	if(!isdefined(self.var_9fde8624) || self.var_9fde8624 == #"hash_5653bbc44a034094")
	{
		self.var_53bac70d = 1;
	}
	if(!isdefined(self.var_9fde8624) || self.var_9fde8624 == #"hash_70162f4bc795092")
	{
		self.var_22b8f534 = 1;
	}
	self.overrideactordamage = &function_aab3a5fc;
	self.var_3ad8ef86 = 0;
	self.var_b52fc691 = 0;
	self.var_fcca372 = 0;
	if(!isdefined(self.ai))
	{
		self.ai = spawnstruct();
	}
	self.ai.var_a02f86e7 = 0;
	self.ai.var_5dc77566 = 0;
	self.ai.var_b13e6817 = 0;
	self.ai.var_76786d9c = 0;
	self.ai.var_fad877bf = 0;
	self.ai.var_2642a09b = 0;
	self.ai.var_a29f9a91 = 0;
	self.ai.var_e93366a = 0;
	self.ai.var_3dbed9a0 = 0;
	self.ai.var_9d91cfcc = 0;
	self.ai.var_b90dccd6 = 0;
	self.ai.var_62741bfb = 0;
	if(is_true(self.var_22b8f534) && !isdefined(level.var_879dbfb8))
	{
		level.var_879dbfb8 = 0;
	}
	self.var_b077b73d = &function_b077b73d;
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_6479037a
	Checksum: 0xC5AA37FD
	Offset: 0x9F8
	Size: 0xD54
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
	/#
		assert(isscriptfunctionptr(&function_7a893a7));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7280253b8045f3aa", &function_7a893a7);
	/#
		assert(isscriptfunctionptr(&function_e6d0f1d4));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_25f6a58aa44b9b2a", &function_e6d0f1d4);
	/#
		assert(isscriptfunctionptr(&function_99ab692d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_59de9b23ef7ed486", &function_99ab692d);
	/#
		assert(isscriptfunctionptr(&function_b46c0796));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_79642ea6dc02eebd", &function_b46c0796);
	/#
		assert(isscriptfunctionptr(&function_1dcf9f45));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_200340d1ad88d275", &function_1dcf9f45);
	/#
		assert(isscriptfunctionptr(&function_15c1e3df));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ad94e79dd5192", &function_15c1e3df);
	/#
		assert(isscriptfunctionptr(&function_29744716));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7a17e3794c739769", &function_29744716);
	/#
		assert(isscriptfunctionptr(&function_52479a49));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4f21279adbfeb5c6", &function_52479a49);
	/#
		assert(isscriptfunctionptr(&function_dcac38af));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_6ada226476fbbc5a", &function_dcac38af);
	/#
		assert(isscriptfunctionptr(&function_e6b7aa9d));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_50a4fe24c23b6d27", &function_e6b7aa9d);
	/#
		assert(isscriptfunctionptr(&function_dab44559));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_23c568af83b67b77", &function_dab44559);
	/#
		assert(isscriptfunctionptr(&function_baffe829));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1146baaf761ec6ed", &function_baffe829);
	/#
		assert(isscriptfunctionptr(&function_fe1e617c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_57c7c778e27ffa59", &function_fe1e617c);
	/#
		assert(isscriptfunctionptr(&function_4245d56f));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_98b56eef8e28325", &function_4245d56f);
	/#
		assert(isscriptfunctionptr(&function_45fabe41));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1658d524a973ce91", &function_45fabe41);
	/#
		assert(isscriptfunctionptr(&function_99608cba));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1a163703acd2ed3f", &function_99608cba);
	/#
		assert(isscriptfunctionptr(&function_779b5a9));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_2bb826405d693ccb", &function_779b5a9);
	/#
		assert(isscriptfunctionptr(&function_363c063));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_f175e396e0073c6", &function_363c063);
	/#
		assert(isscriptfunctionptr(&function_380fc4a5));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4f54754f71b9dd6e", &function_380fc4a5);
	/#
		assert(isscriptfunctionptr(&function_545f48af));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_305325825d9f1ae9", &function_545f48af);
	/#
		assert(isscriptfunctionptr(&function_42d0830a));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_188114dd969b5dd5", &function_42d0830a);
	/#
		assert(isscriptfunctionptr(&function_bc86ecfb));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3248e7c31b84322a", &function_bc86ecfb);
	/#
		assert(isscriptfunctionptr(&function_d94a4d59));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_61916b6e085cb852", &function_d94a4d59);
	/#
		assert(isscriptfunctionptr(&function_5c25cce9));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_79093a39082de682", &function_5c25cce9);
	/#
		assert(isscriptfunctionptr(&function_5070830c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4544909102899fea", &function_5070830c);
	/#
		assert(isscriptfunctionptr(&function_d33f94e));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_170557ad6e763f0c", &function_d33f94e);
	/#
		assert(isscriptfunctionptr(&function_4b63f114));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_5676e5630fdedd2c", &function_4b63f114);
	/#
		assert(isscriptfunctionptr(&function_46e10c70));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_7cb881b920ccf02e", &function_46e10c70);
	/#
		assert(isscriptfunctionptr(&function_d778b630));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_1e786509dc63e8d5", &function_d778b630);
	/#
		assert(isscriptfunctionptr(&function_56f72e3c));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_27dfca0196f711e7", &function_56f72e3c);
	/#
		assert(isscriptfunctionptr(&function_7b89edb0));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_4a436c24681915c9", &function_7b89edb0);
	animationstatenetwork::registernotetrackhandlerfunction("steiner_blast_fire", &function_46f4d406);
	animationstatenetwork::registernotetrackhandlerfunction("steiner_bomb_fire", &function_fc9189dd);
	/#
		assert(isscriptfunctionptr(&function_829cfcc8));
	#/
	behaviortreenetworkutility::registerbehaviortreescriptapi(#"hash_3bd518a057cb317c", &function_829cfcc8);
}

/*
	Name: function_aab3a5fc
	Namespace: namespace_6479037a
	Checksum: 0x31EFB4A2
	Offset: 0x1758
	Size: 0xAA
	Parameters: 13
	Flags: Linked
*/
function function_aab3a5fc(inflictor, attacker, damage, dflags, mod, weapon, var_fd90b0bb, point, dir, hitloc, offsettime, boneindex, modelindex)
{
	if(modelindex > self.health)
	{
		self thread function_4b193227();
	}
	self.lastattacker = boneindex;
	self.var_d429b0ce = offsettime;
	return modelindex;
}

/*
	Name: get_enemy
	Namespace: namespace_6479037a
	Checksum: 0xBDD714FF
	Offset: 0x1810
	Size: 0x22
	Parameters: 0
	Flags: Linked, Private
*/
function private get_enemy()
{
	return (isdefined(self.favoriteenemy) ? self.favoriteenemy : self.enemy);
}

/*
	Name: is_enemy_valid
	Namespace: namespace_6479037a
	Checksum: 0xEA47831D
	Offset: 0x1840
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private is_enemy_valid(enemy)
{
	if(isplayer(enemy))
	{
		return isalive(enemy) && !enemy inlaststand();
	}
	return isalive(enemy);
}

/*
	Name: function_4ee74b24
	Namespace: namespace_6479037a
	Checksum: 0x3858AE42
	Offset: 0x18B8
	Size: 0xD2
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4ee74b24()
{
	if(!isdefined(self.var_4ee74b24))
	{
		self.var_4ee74b24 = 0;
	}
	if(!isdefined(self.var_6d5a7a2d))
	{
		self.var_6d5a7a2d = 0;
	}
	enemy = self get_enemy();
	if(!isdefined(enemy))
	{
		self.var_4ee74b24 = 0;
	}
	else if(self.var_6d5a7a2d < gettime())
	{
		self.var_4ee74b24 = util::within_fov(self.origin, self.angles, enemy.origin, cos(30));
		self.var_6d5a7a2d = gettime() + 50;
	}
	return self.var_4ee74b24;
}

/*
	Name: can_see_enemy
	Namespace: namespace_6479037a
	Checksum: 0xA3BAE8F8
	Offset: 0x1998
	Size: 0x9A
	Parameters: 0
	Flags: Linked, Private
*/
function private can_see_enemy()
{
	if(!isdefined(self.can_see_enemy))
	{
		self.can_see_enemy = 0;
	}
	if(!isdefined(self.var_6ed00311))
	{
		self.var_6ed00311 = 0;
	}
	enemy = self get_enemy();
	if(isdefined(enemy) && self.var_6ed00311 < gettime())
	{
		self.can_see_enemy = self cansee(enemy);
		self.var_6ed00311 = gettime() + 50;
	}
	return self.can_see_enemy;
}

/*
	Name: function_880fad96
	Namespace: namespace_6479037a
	Checksum: 0xC2B670FD
	Offset: 0x1A40
	Size: 0x16
	Parameters: 0
	Flags: Linked, Private
*/
function private function_880fad96()
{
	return self.ai.var_2642a09b != 0;
}

/*
	Name: function_1da02b50
	Namespace: namespace_6479037a
	Checksum: 0x129C8C1C
	Offset: 0x1A60
	Size: 0x4E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1da02b50(var_b268a2ed)
{
	/#
		assert(var_b268a2ed >= 0 && var_b268a2ed <= 3);
	#/
	self.ai.var_2642a09b = var_b268a2ed;
}

/*
	Name: function_9ee55afa
	Namespace: namespace_6479037a
	Checksum: 0x190137
	Offset: 0x1AB8
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private function_9ee55afa()
{
	self.ai.var_2642a09b = 0;
	self.var_fcca372 = gettime() + (int(3 * 1000));
	self notify(#"hash_58f0b0e23afeccb9");
}

/*
	Name: function_efd416d6
	Namespace: namespace_6479037a
	Checksum: 0x3F8DC668
	Offset: 0x1B18
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_efd416d6()
{
	return !isdefined(self.var_fcca372) || self.var_fcca372 < gettime();
}

/*
	Name: function_af554aaf
	Namespace: namespace_6479037a
	Checksum: 0xF0A1BB08
	Offset: 0x1B40
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_af554aaf(enable)
{
	if(!isdefined(self))
	{
		return;
	}
	var_53bac70d = is_true(self.var_53bac70d);
	self.var_53bac70d = is_true(enable);
	if(var_53bac70d != self.var_53bac70d)
	{
		self.var_3ad8ef86 = 0;
	}
}

/*
	Name: function_7a893a7
	Namespace: namespace_6479037a
	Checksum: 0xB23375A5
	Offset: 0x1BB8
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7a893a7(entity)
{
	if(!is_true(entity.var_53bac70d))
	{
		return 0;
	}
	return entity.ai.var_a02f86e7;
}

/*
	Name: function_baffe829
	Namespace: namespace_6479037a
	Checksum: 0x72238FFB
	Offset: 0x1C00
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_baffe829(entity)
{
	entity function_1da02b50(1);
}

/*
	Name: function_fe1e617c
	Namespace: namespace_6479037a
	Checksum: 0x15105F0F
	Offset: 0x1C30
	Size: 0xBC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fe1e617c(entity)
{
	if(isalive(entity))
	{
		var_16122b95 = 2 * 0.5;
		cooldown = randomintrange(6, 8);
		entity.var_3ad8ef86 = gettime() + (int((var_16122b95 + cooldown) * 1000));
		entity.ai.var_a02f86e7 = 0;
		entity function_9ee55afa();
	}
}

/*
	Name: function_3aa93442
	Namespace: namespace_6479037a
	Checksum: 0x87048756
	Offset: 0x1CF8
	Size: 0x214
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3aa93442(entity)
{
	level endon(#"end_game");
	entity endon(#"death", #"entitydeleted");
	weapon = getweapon(#"hash_2124b6f8fa3f7f43");
	count = randomint(3) + 1;
	enemy = entity get_enemy();
	if(!isdefined(enemy))
	{
		return;
	}
	wait(0.6);
	while(count)
	{
		if(!isalive(entity))
		{
			return;
		}
		if(is_enemy_valid(enemy))
		{
			target_origin = enemy.origin;
			velocity = enemy getvelocity();
			target_origin = target_origin + velocity;
			org = namespace_ec06fe4a::function_e22ae9b3(target_origin, "tag_origin", (0, 0, 0), "steiner blast org");
			if(isdefined(org))
			{
				org thread namespace_ec06fe4a::function_52afe5df(2);
				org thread function_f7d9bc34();
			}
			source_origin = entity gettagorigin("J_EyeBall_RI");
			magicbullet(weapon, source_origin, target_origin, entity);
		}
		count--;
		if(-1)
		{
			wait(0.5);
		}
	}
}

/*
	Name: function_f7d9bc34
	Namespace: namespace_6479037a
	Checksum: 0x4290C430
	Offset: 0x1F18
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_f7d9bc34()
{
	self endon(#"disconnect");
	self namespace_83eb6304::function_3ecfde67("incoming_impact");
	wait(1.2);
	if(isdefined(self))
	{
		self namespace_83eb6304::turnofffx("incoming_impact");
	}
}

/*
	Name: function_7709f2df
	Namespace: namespace_6479037a
	Checksum: 0xFD10A1AB
	Offset: 0x1F88
	Size: 0xC8
	Parameters: 12
	Flags: Private
*/
function private function_7709f2df(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	var_7aa37d9f = surfacetype;
	if(isdefined(psoffsettime) && isdefined(boneindex) && isdefined(psoffsettime.team) && isdefined(boneindex.team) && psoffsettime.team == boneindex.team)
	{
		var_7aa37d9f = 0;
	}
	return var_7aa37d9f;
}

/*
	Name: function_46f4d406
	Namespace: namespace_6479037a
	Checksum: 0xA7E0EA27
	Offset: 0x2058
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_46f4d406(entity)
{
	if(isalive(entity))
	{
		level thread function_3aa93442(entity);
	}
}

/*
	Name: function_829cfcc8
	Namespace: namespace_6479037a
	Checksum: 0x81662A81
	Offset: 0x20A0
	Size: 0x236
	Parameters: 1
	Flags: Linked, Private
*/
function private function_829cfcc8(entity)
{
	if(entity function_880fad96())
	{
		return;
	}
	entity.ai.var_a02f86e7 = 0;
	entity.ai.var_5dc77566 = 0;
	entity.ai.var_b13e6817 = 0;
	if(!entity function_efd416d6())
	{
		return;
	}
	enemy = entity get_enemy();
	if(!isdefined(enemy))
	{
		return;
	}
	var_eab3f54a = distance2dsquared(entity.origin, enemy.origin);
	if(is_true(entity.var_22b8f534) && entity.var_b52fc691 < gettime() && !function_2bde9dfa(entity))
	{
		if(var_eab3f54a <= 1000000 && entity function_4ee74b24() && entity can_see_enemy())
		{
			entity.ai.var_b13e6817 = 1;
			entity.ai.var_5dc77566 = 1;
		}
	}
	else if(is_true(entity.var_53bac70d) && entity.var_3ad8ef86 < gettime() && !function_2bde9dfa(entity))
	{
		if(var_eab3f54a <= 1000000 && entity function_4ee74b24() && entity can_see_enemy())
		{
			entity.ai.var_a02f86e7 = 1;
		}
	}
}

/*
	Name: function_16a8babd
	Namespace: namespace_6479037a
	Checksum: 0xC5C8D373
	Offset: 0x22E0
	Size: 0x6E
	Parameters: 1
	Flags: Linked
*/
function function_16a8babd(enable)
{
	if(!isdefined(self))
	{
		return;
	}
	var_22b8f534 = is_true(self.var_22b8f534);
	self.var_22b8f534 = is_true(enable);
	if(var_22b8f534 != self.var_22b8f534)
	{
		self.var_b52fc691 = 0;
	}
}

/*
	Name: function_99ab692d
	Namespace: namespace_6479037a
	Checksum: 0xC8A4AE34
	Offset: 0x2358
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_99ab692d(entity)
{
	if(!is_true(entity.var_22b8f534))
	{
		return 0;
	}
	return entity.ai.var_b13e6817;
}

/*
	Name: function_e6d0f1d4
	Namespace: namespace_6479037a
	Checksum: 0x79937DF9
	Offset: 0x23A0
	Size: 0x54
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e6d0f1d4(entity)
{
	if(!is_true(entity.var_22b8f534))
	{
		return 0;
	}
	return entity.ai.var_5dc77566 && entity function_52562969();
}

/*
	Name: function_52562969
	Namespace: namespace_6479037a
	Checksum: 0x64DD2E32
	Offset: 0x2400
	Size: 0x38
	Parameters: 0
	Flags: Linked, Private
*/
function private function_52562969()
{
	if(isdefined(self.var_90c3aec8) && self.var_90c3aec8.size >= 3)
	{
		return 0;
	}
	return level.var_879dbfb8 < 9;
}

/*
	Name: function_99608cba
	Namespace: namespace_6479037a
	Checksum: 0x23DE7B99
	Offset: 0x2440
	Size: 0x82
	Parameters: 1
	Flags: Linked, Private
*/
function private function_99608cba(entity)
{
	if(entity function_52562969())
	{
		level.var_879dbfb8++;
		entity.var_4d0d199c = 1;
		entity clientfield::set("steiner_radiation_bomb_prepare_fire_clientfield", 1);
		entity function_1da02b50(2);
	}
	else
	{
		entity.var_4d0d199c = 0;
	}
}

/*
	Name: function_779b5a9
	Namespace: namespace_6479037a
	Checksum: 0xBBEBB5CB
	Offset: 0x24D0
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_779b5a9(entity)
{
	entity.ai.var_b13e6817 = 0;
}

/*
	Name: function_4245d56f
	Namespace: namespace_6479037a
	Checksum: 0x1B103AC4
	Offset: 0x24F8
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4245d56f(entity)
{
}

/*
	Name: function_45fabe41
	Namespace: namespace_6479037a
	Checksum: 0x1A82300D
	Offset: 0x2510
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_45fabe41(entity)
{
	if(is_true(entity.var_4d0d199c))
	{
		entity clientfield::set("steiner_radiation_bomb_prepare_fire_clientfield", 0);
		entity.var_4d0d199c = 0;
	}
	cooldown = randomintrange(19, 21);
	entity.var_b52fc691 = gettime() + (int(cooldown * 1000));
	entity.ai.var_5dc77566 = 0;
	entity function_9ee55afa();
}

/*
	Name: function_7ff0ce68
	Namespace: namespace_6479037a
	Checksum: 0xFCEC18D8
	Offset: 0x25E0
	Size: 0xC8
	Parameters: 12
	Flags: Private
*/
function private function_7ff0ce68(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	var_7aa37d9f = surfacetype;
	if(isdefined(psoffsettime) && isdefined(boneindex) && isdefined(psoffsettime.team) && isdefined(boneindex.team) && psoffsettime.team == boneindex.team)
	{
		var_7aa37d9f = 0;
	}
	return var_7aa37d9f;
}

/*
	Name: function_bf8080c1
	Namespace: namespace_6479037a
	Checksum: 0xB7A515E8
	Offset: 0x26B0
	Size: 0x228
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bf8080c1(entity)
{
	enemy = entity get_enemy();
	if(!is_enemy_valid(enemy))
	{
		return false;
	}
	var_6e3ad56b = enemy.origin;
	if(0)
	{
		velocity = enemy getvelocity();
		if(length(velocity) >= 0)
		{
			var_6e3ad56b = var_6e3ad56b + vectorscale(velocity, 0.5);
		}
	}
	target_pos = var_6e3ad56b;
	angles = vectortoangles(target_pos - entity.origin);
	dir = anglestoforward(angles);
	launch_pos = entity gettagorigin("tag_bombthrower_FX");
	dist = distance(launch_pos, target_pos);
	velocity = vectorscale(dir, dist);
	velocity = velocity + vectorscale((0, 0, 1), 120);
	entity.org.origin = target_pos;
	entity.org thread function_f7d9bc34();
	grenade = entity magicgrenadetype(getweapon(#"hash_7e3de6b5b2134623"), launch_pos, velocity);
	if(isdefined(grenade))
	{
		grenade.owner = entity;
		grenade.team = entity.team;
		grenade thread function_a56050b0();
	}
	return true;
}

/*
	Name: function_2bde9dfa
	Namespace: namespace_6479037a
	Checksum: 0xDFAC223D
	Offset: 0x28E0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2bde9dfa(entity)
{
	if(entity.ai.var_5dc77566 || entity.ai.var_b13e6817)
	{
		return true;
	}
	return false;
}

/*
	Name: function_a56050b0
	Namespace: namespace_6479037a
	Checksum: 0x83DDCC96
	Offset: 0x2930
	Size: 0x164
	Parameters: 0
	Flags: Linked, Private
*/
function private function_a56050b0()
{
	level endon(#"end_game");
	owner = self.owner;
	self waittill(#"grenade_explode", #"death");
	if(isalive(owner))
	{
		origin = self.origin;
		trace = bullettrace(origin + vectorscale((0, 0, 1), 50), origin + (vectorscale((0, 0, -1), 50)), 0, self);
		if(trace[#"fraction"] < 1)
		{
			origin = trace[#"position"];
		}
		var_b308e59c = namespace_ec06fe4a::function_e22ae9b3(origin, "tag_origin");
		if(isdefined(var_b308e59c))
		{
			var_b308e59c.targetname = "steinerBomb";
			var_b308e59c.owner = owner;
			owner function_4d70c1d3(var_b308e59c);
			var_b308e59c thread function_fac064dc();
		}
	}
}

/*
	Name: function_4d70c1d3
	Namespace: namespace_6479037a
	Checksum: 0xA2AD13
	Offset: 0x2AA0
	Size: 0x8C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4d70c1d3(ent)
{
	if(!isdefined(self.var_90c3aec8))
	{
		self.var_90c3aec8 = [];
	}
	if(!isdefined(self.var_90c3aec8))
	{
		self.var_90c3aec8 = [];
	}
	else if(!isarray(self.var_90c3aec8))
	{
		self.var_90c3aec8 = array(self.var_90c3aec8);
	}
	self.var_90c3aec8[self.var_90c3aec8.size] = ent;
}

/*
	Name: function_f2cb8145
	Namespace: namespace_6479037a
	Checksum: 0x4C147891
	Offset: 0x2B38
	Size: 0xD0
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f2cb8145(var_ec2c535e, destroyed)
{
	if(is_true(destroyed) && isdefined(self.owner) && isdefined(self.owner.var_90c3aec8))
	{
		arrayremovevalue(self.owner.var_90c3aec8, self);
	}
	if(is_true(self.var_5d15d0b2))
	{
		return;
	}
	self namespace_ec06fe4a::function_52afe5df(0.2);
	if(level.var_879dbfb8 > 0)
	{
		level.var_879dbfb8--;
	}
}

/*
	Name: function_4b193227
	Namespace: namespace_6479037a
	Checksum: 0xAD130321
	Offset: 0x2C10
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_4b193227()
{
	if(!isdefined(self.var_90c3aec8) || !self.var_90c3aec8.size)
	{
		return;
	}
	array::thread_all(self.var_90c3aec8, &function_f2cb8145, 0);
	self.var_90c3aec8 = [];
}

/*
	Name: function_fac064dc
	Namespace: namespace_6479037a
	Checksum: 0xEB40FCC8
	Offset: 0x2C78
	Size: 0x1C4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fac064dc()
{
	level endon(#"end_game");
	self endon(#"death");
	var_6f13bbe0 = gettime() + int(4000);
	origin = self.origin;
	owner = self.owner;
	while(gettime() < var_6f13bbe0)
	{
		self namespace_83eb6304::function_3ecfde67("electrical_explo");
		players = function_a1ef346b(undefined, origin, 24);
		/#
		#/
		foreach(player in players)
		{
			if(isdefined(player.var_3de278ea) && (gettime() - player.var_3de278ea) < 0.5)
			{
				continue;
			}
			player dodamage(20, origin, owner, self, undefined, "MOD_DOT");
			player.var_3de278ea = gettime();
		}
		wait(0.5);
	}
	self thread function_f2cb8145(1);
}

/*
	Name: function_fc9189dd
	Namespace: namespace_6479037a
	Checksum: 0xF11E711F
	Offset: 0x2E48
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fc9189dd(entity)
{
	if(isalive(entity))
	{
		function_bf8080c1(entity);
	}
}

/*
	Name: function_a767bb1c
	Namespace: namespace_6479037a
	Checksum: 0x97CD5190
	Offset: 0x2E90
	Size: 0x106
	Parameters: 2
	Flags: Linked, Private
*/
function private function_a767bb1c(spawner_name, var_5c583e69)
{
	if(!isdefined(level.var_f88d42fc))
	{
		level.var_f88d42fc = [];
	}
	level.var_f88d42fc[var_5c583e69] = getentarray(spawner_name, "script_noteworthy");
	if(level.var_f88d42fc[var_5c583e69].size == 0)
	{
		return;
	}
	foreach(var_694b1d7b in level.var_f88d42fc[var_5c583e69])
	{
		var_694b1d7b.is_enabled = 1;
		var_694b1d7b.script_forcespawn = 1;
	}
}

/*
	Name: function_ac56fb75
	Namespace: namespace_6479037a
	Checksum: 0xFC6EFAC0
	Offset: 0x2FA0
	Size: 0x34C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_ac56fb75()
{
	level endon(#"end_game");
	self endon(#"death", #"entitydeleted");
	if(is_true(self.var_8576e0be) || is_true(self.var_9b474709))
	{
		return;
	}
	if(self function_880fad96())
	{
		self.var_9b474709 = 1;
		waitresult = undefined;
		waitresult = self waittill(#"hash_58f0b0e23afeccb9", #"stop_wait_for_split");
		if(!isalive(self) || waitresult._notify == "stop_wait_for_split")
		{
			return;
		}
		self.var_9b474709 = 0;
	}
	self.var_8576e0be = 1;
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_steiner_split_start");
	self function_1da02b50(3);
	health = int(ceil(self.health * 0.5));
	var_65110e32 = anglestoright(self.angles);
	var_7584b84b = (var_65110e32[0], var_65110e32[1], 0);
	var_53d254e5 = vectorscale(var_7584b84b, 15);
	var_488052a8 = vectorscale(var_7584b84b, -15);
	self thread function_eafb4701(level.doa.var_c1781ccb, self.origin, health, var_488052a8, self.enemy);
	self thread function_eafb4701(level.doa.var_e6cf829d, self.origin, health, var_53d254e5, self.enemy);
	self namespace_e32bb68::function_3a59ec34("zmb_doa_ai_steiner_split_explode");
	self namespace_83eb6304::function_3ecfde67("zombie_generator_die");
	self namespace_83eb6304::function_3ecfde67("nova_crawler_burst");
	self namespace_ec06fe4a::function_8c808737();
	attacker = self.lastattacker;
	if(isdefined(self.var_d429b0ce) && isdefined(self.var_d429b0ce.owner))
	{
		attacker = self.var_d429b0ce.owner;
	}
	self thread namespace_ec06fe4a::function_570729f0(0.4, attacker);
}

/*
	Name: function_eafb4701
	Namespace: namespace_6479037a
	Checksum: 0x3CCA3497
	Offset: 0x32F8
	Size: 0x164
	Parameters: 5
	Flags: Linked, Private
*/
function private function_eafb4701(spawndef, location, health, offset, enemy)
{
	if(!isdefined(spawndef))
	{
		return;
	}
	entity = doa_enemy::function_db55a448(spawndef, location, enemy);
	if(!isdefined(entity))
	{
		return;
	}
	if(!isdefined(location.angles))
	{
		angles = (0, 0, 0);
	}
	else
	{
		angles = location.angles;
	}
	entity.maxhealth = health;
	entity.health = health;
	entity setmaxhealth(health);
	var_99b76528 = 25;
	point = getclosestpointonnavmesh(location + offset, var_99b76528);
	if(!isdefined(point))
	{
		point = getclosestpointonnavmesh(location + offset, var_99b76528 * 4);
	}
	if(isdefined(point) && tracepassedonnavmesh(location, point, 15))
	{
		entity forceteleport(point, angles);
	}
}

/*
	Name: function_b46c0796
	Namespace: namespace_6479037a
	Checksum: 0x24EFDCF4
	Offset: 0x3468
	Size: 0x9A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b46c0796(entity)
{
	if(isalive(entity) && is_true(entity.var_8d1d18aa) && entity.health <= (entity.maxhealth * 0.65))
	{
		if(!is_true(entity.var_8576e0be))
		{
			return true;
		}
		return false;
	}
	return false;
}

/*
	Name: function_363c063
	Namespace: namespace_6479037a
	Checksum: 0xA7E04844
	Offset: 0x3510
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_363c063(entity)
{
}

/*
	Name: function_380fc4a5
	Namespace: namespace_6479037a
	Checksum: 0x5F2A7E6B
	Offset: 0x3528
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_380fc4a5(entity)
{
	entity thread function_ac56fb75();
}

/*
	Name: function_1dcf9f45
	Namespace: namespace_6479037a
	Checksum: 0xC2B3383C
	Offset: 0x3558
	Size: 0x3A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1dcf9f45(entity)
{
	if(is_true(entity.ai.var_9d91cfcc))
	{
		return false;
	}
	return true;
}

/*
	Name: function_bc86ecfb
	Namespace: namespace_6479037a
	Checksum: 0x7DE69A6D
	Offset: 0x35A0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_bc86ecfb(entity)
{
}

/*
	Name: function_d94a4d59
	Namespace: namespace_6479037a
	Checksum: 0x70D66DC9
	Offset: 0x35B8
	Size: 0x22
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d94a4d59(entity)
{
	entity.ai.var_9d91cfcc = 1;
}

/*
	Name: function_15c1e3df
	Namespace: namespace_6479037a
	Checksum: 0x3DB815CE
	Offset: 0x35E8
	Size: 0x2E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_15c1e3df(entity)
{
	if(entity.ai.var_fad877bf)
	{
		return true;
	}
	return false;
}

/*
	Name: function_d33f94e
	Namespace: namespace_6479037a
	Checksum: 0xFA713C52
	Offset: 0x3620
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d33f94e(entity)
{
}

/*
	Name: function_4b63f114
	Namespace: namespace_6479037a
	Checksum: 0xFA183044
	Offset: 0x3638
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4b63f114(entity)
{
	entity.ai.var_fad877bf = 0;
}

/*
	Name: function_b077b73d
	Namespace: namespace_6479037a
	Checksum: 0x527FD0EB
	Offset: 0x3660
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function function_b077b73d(time)
{
	if(!isdefined(time) || time <= 0)
	{
		return;
	}
	self thread function_392a816a(time);
}

/*
	Name: function_392a816a
	Namespace: namespace_6479037a
	Checksum: 0xA0E1D0B9
	Offset: 0x36A8
	Size: 0x19E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_392a816a(time)
{
	if(is_true(self.var_8576e0be))
	{
		return;
	}
	if(!is_true(self.var_8d1d18aa) && !isdefined(self.var_e1f39584))
	{
		return;
	}
	self notify(#"hash_1126b46a114399d");
	self endon(#"death", #"hash_1126b46a114399d");
	self.var_8d1d18aa = 0;
	if(is_true(self.var_9b474709))
	{
		self notify(#"stop_wait_for_split");
		self.var_9b474709 = 0;
	}
	var_e1f39584 = gettime() + (int(time * 1000));
	if(isdefined(self.var_e1f39584))
	{
		self.var_e1f39584 = int(max(self.var_e1f39584, var_e1f39584));
	}
	else
	{
		self.var_e1f39584 = var_e1f39584;
	}
	while(isalive(self) && isdefined(self.var_e1f39584))
	{
		if(gettime() >= self.var_e1f39584)
		{
			self.var_8d1d18aa = 1;
			return;
		}
		waitframe(1);
	}
}

/*
	Name: function_d778b630
	Namespace: namespace_6479037a
	Checksum: 0x79826B76
	Offset: 0x3850
	Size: 0x32
	Parameters: 1
	Flags: Linked, Private
*/
function private function_d778b630(entity)
{
	entity.ai.var_76786d9c = 0;
	entity.ai.var_80045105 = gettime();
}

/*
	Name: function_46e10c70
	Namespace: namespace_6479037a
	Checksum: 0x16819F35
	Offset: 0x3890
	Size: 0x58
	Parameters: 1
	Flags: Linked, Private
*/
function private function_46e10c70(entity)
{
	if(entity.ai.var_76786d9c)
	{
		entity.ai.var_fad877bf = 1;
		entity.ai.var_76786d9c = 0;
		return 4;
	}
	return 5;
}

/*
	Name: function_56f72e3c
	Namespace: namespace_6479037a
	Checksum: 0xF9122FFA
	Offset: 0x38F8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_56f72e3c(behaviortreeentity)
{
	behaviortreeentity asmsetanimationrate(1.05);
}

/*
	Name: function_7b89edb0
	Namespace: namespace_6479037a
	Checksum: 0x83430F7B
	Offset: 0x3930
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7b89edb0(behaviortreeentity)
{
	behaviortreeentity asmsetanimationrate(1);
}

/*
	Name: function_e6b7aa9d
	Namespace: namespace_6479037a
	Checksum: 0xA9FBFA3C
	Offset: 0x3960
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_e6b7aa9d(behaviortreeentity)
{
	return behaviortreeentity getblackboardattribute("_locomotion_speed_zombie") === "locomotion_speed_walk";
}

/*
	Name: function_dab44559
	Namespace: namespace_6479037a
	Checksum: 0xF7ECCA6A
	Offset: 0x39A0
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function function_dab44559(behaviortreeentity)
{
	return behaviortreeentity getblackboardattribute("_locomotion_speed_zombie") === "locomotion_speed_run";
}

/*
	Name: function_21746f2d
	Namespace: namespace_6479037a
	Checksum: 0x122D7B6F
	Offset: 0x39E0
	Size: 0x1BA
	Parameters: 1
	Flags: Private
*/
function private function_21746f2d(var_eab3f54a)
{
	var_533af8f8 = !is_true(self.ai.var_e93366a) && var_eab3f54a > 722500;
	isrunning = self.zombie_move_speed == "run";
	if(var_533af8f8 && !isrunning)
	{
		if(!isdefined(self.ai.rundelay))
		{
			self.ai.rundelay = gettime() + randomintrange(1000, 2000);
		}
		if(self.ai.rundelay > gettime())
		{
			var_533af8f8 = 0;
		}
	}
	if(self.ai.var_3dbed9a0 < gettime() && var_533af8f8 != isrunning)
	{
		if(var_533af8f8)
		{
			currentvelocity = self getvelocity();
			currentspeed = length(currentvelocity);
			if(!isrunning || currentspeed > 0)
			{
				self.ai.var_3dbed9a0 = gettime() + 2000;
				self.zombie_move_speed = "run";
				self.ai.rundelay = undefined;
			}
		}
		else
		{
			self.ai.var_3dbed9a0 = gettime() + 2000;
			self.zombie_move_speed = "walk";
		}
	}
}

/*
	Name: function_29744716
	Namespace: namespace_6479037a
	Checksum: 0xD69D31C5
	Offset: 0x3BA8
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_29744716(entity)
{
	return entity.ai.var_b90dccd6;
}

/*
	Name: function_67a0e9a2
	Namespace: namespace_6479037a
	Checksum: 0xADD4EFE5
	Offset: 0x3BD0
	Size: 0xF6
	Parameters: 2
	Flags: None
*/
function function_67a0e9a2(var_2fa3c4c9, location)
{
	level.var_f0c367c9 = location;
	level.var_8cc83376 = [];
	foreach(split in var_2fa3c4c9)
	{
		split.ai.var_b90dccd6 = 0;
		split.ai.var_62741bfb = 1;
		split setgoal(split.origin, 1);
		split.ignoreall = 1;
	}
}

/*
	Name: function_52479a49
	Namespace: namespace_6479037a
	Checksum: 0x5CCFE882
	Offset: 0x3CD0
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_52479a49(entity)
{
	return entity.ai.var_62741bfb;
}

/*
	Name: function_5c25cce9
	Namespace: namespace_6479037a
	Checksum: 0x6C5AD120
	Offset: 0x3CF8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5c25cce9(entity)
{
	entity clientfield::set("steiner_split_combine_fx_clientfield", 1);
}

/*
	Name: function_5070830c
	Namespace: namespace_6479037a
	Checksum: 0x6ADEB3E3
	Offset: 0x3D30
	Size: 0xA8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5070830c(entity)
{
	array::add(level.var_8cc83376, entity, 0);
	entity clientfield::set("steiner_split_combine_fx_clientfield", 0);
	entity.ai.var_62741bfb = 0;
	if(level.var_8cc83376.size == 2)
	{
		level thread function_aed09e18(level.var_8cc83376, level.var_f0c367c9);
		level.var_8cc83376 = [];
	}
}

/*
	Name: function_dcac38af
	Namespace: namespace_6479037a
	Checksum: 0xB9C9640A
	Offset: 0x3DE0
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_dcac38af(entity)
{
	return entity.ai.var_a29f9a91;
}

/*
	Name: function_545f48af
	Namespace: namespace_6479037a
	Checksum: 0x31C64E30
	Offset: 0x3E08
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_545f48af(entity)
{
}

/*
	Name: function_42d0830a
	Namespace: namespace_6479037a
	Checksum: 0xA911BD70
	Offset: 0x3E20
	Size: 0x72
	Parameters: 1
	Flags: Linked, Private
*/
function private function_42d0830a(entity)
{
	if(isdefined(entity) && isdefined(entity.variant_type))
	{
		if(entity.variant_type < 3)
		{
			entity.variant_type = entity.variant_type + 1;
		}
		else
		{
			entity.variant_type = 0;
			entity.ai.var_a29f9a91 = 0;
		}
	}
}

/*
	Name: function_aed09e18
	Namespace: namespace_6479037a
	Checksum: 0xC6856641
	Offset: 0x3EA0
	Size: 0x1FC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_aed09e18(var_2fa3c4c9, location)
{
	foreach(split in var_2fa3c4c9)
	{
		split hide();
		split deletedelay();
	}
	steiner = doa_enemy::function_db55a448(level.doa.steiner, location, undefined);
	if(isdefined(steiner))
	{
		steiner forceteleport(location.origin, location.angles);
		steiner.team = #"allies";
		steiner.ignoreall = 1;
		steiner.ignoreme = 1;
		steiner.ignore_nuke = 1;
		steiner.ignore_all_poi = 1;
		steiner.cant_move_cb = &zombiebehavior::function_79fe956f;
		steiner.takedamage = 0;
		steiner.var_8d1d18aa = 0;
		steiner.ai.var_a29f9a91 = 1;
		steiner.variant_type = 0;
		steiner function_af554aaf(0);
		steiner function_16a8babd(0);
	}
	level flag::set("steiner_merge_done");
}

/*
	Name: function_7e855c12
	Namespace: namespace_6479037a
	Checksum: 0xFA784BF9
	Offset: 0x40A8
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_7e855c12(point)
{
	self.var_9ecae3b4 = 1;
	self.zombie_move_speed = "walk";
	self setgoal(point, 0);
	self waittill(#"goal");
	self.var_9ecae3b4 = undefined;
	self setgoal(self.origin, 1);
}

/*
	Name: function_c6579189
	Namespace: namespace_6479037a
	Checksum: 0x952F247B
	Offset: 0x4138
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_c6579189(target)
{
	if(!isdefined(target))
	{
		return;
	}
	v_to_target = target.origin - self.origin;
	v_angles = vectortoangles(v_to_target);
	self orientmode("face angle", v_angles);
}

/*
	Name: function_46d99f6b
	Namespace: namespace_6479037a
	Checksum: 0x9943052D
	Offset: 0x41B8
	Size: 0x132
	Parameters: 0
	Flags: Private
*/
function private function_46d99f6b()
{
	steiners = getaiarchetypearray(#"hash_7c0d83ac1e845ac2");
	var_ddb534a3 = [];
	foreach(steiner in steiners)
	{
		if(isalive(steiner) && steiner.team == #"allies")
		{
			if(!isdefined(var_ddb534a3))
			{
				var_ddb534a3 = [];
			}
			else if(!isarray(var_ddb534a3))
			{
				var_ddb534a3 = array(var_ddb534a3);
			}
			var_ddb534a3[var_ddb534a3.size] = steiner;
		}
	}
	return var_ddb534a3;
}

