#using script_4d1e366b77f0b4b;
#using script_1940fc077a028a81;
#using script_2618e0f3e5e11649;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_3751b21462a54a7d;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace namespace_cd6bd9f;

/*
	Name: function_9db87168
	Namespace: namespace_cd6bd9f
	Checksum: 0xE68A4FB9
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9db87168()
{
	level notify(563797093);
}

/*
	Name: __init__system__
	Namespace: namespace_cd6bd9f
	Checksum: 0x86B9CE02
	Offset: 0x138
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_54149d856843e31a", &function_70a657d8, undefined, &function_4df027f2, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_cd6bd9f
	Checksum: 0x44FDE4AF
	Offset: 0x188
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"hash_7c0d83ac1e845ac2", &function_8efe7666);
	spawner::function_89a2cd87(#"hash_7c0d83ac1e845ac2", &function_37804710);
}

/*
	Name: function_4df027f2
	Namespace: namespace_cd6bd9f
	Checksum: 0x8EE35A19
	Offset: 0x1F8
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function function_4df027f2()
{
	level thread aat::register_immunity("ammomod_brainrot", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_cryofreeze", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_deadwire", #"mechz", 1, 1, 1);
	level thread aat::register_immunity("ammomod_napalmburst", #"mechz", 1, 1, 1);
}

/*
	Name: function_8efe7666
	Namespace: namespace_cd6bd9f
	Checksum: 0x3E50AEBF
	Offset: 0x2E8
	Size: 0x162
	Parameters: 0
	Flags: Linked
*/
function function_8efe7666()
{
	self callback::function_d8abfc3d(#"on_ai_melee", &namespace_85745671::function_b8eb5dea);
	self callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &namespace_85745671::function_5cb3181e);
	self.var_12af7864 = 1;
	self.var_c11b8a5a = 1;
	self.ai.var_870d0893 = 1;
	self.targetname = "defend_zombie";
	if(!namespace_88795f45::function_6b87eed1())
	{
		self.var_9d59692c = &function_9d59692c;
		self.var_813a079f = &function_1915f8d6;
	}
	else
	{
		self.var_813a079f = &function_ccdf9d44;
	}
	self.var_b3c613a7 = [4:2, 3:2, 2:1.5, 1:1.5, 0:1];
	self.var_414bc881 = 1;
	self.var_97ca51c7 = 3;
}

/*
	Name: function_37804710
	Namespace: namespace_cd6bd9f
	Checksum: 0xC036092D
	Offset: 0x458
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_37804710()
{
	if(!namespace_88795f45::function_6b87eed1())
	{
		setup_awareness(self);
	}
}

/*
	Name: function_bac62d85
	Namespace: namespace_cd6bd9f
	Checksum: 0x74368DB0
	Offset: 0x490
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function function_bac62d85(params)
{
	self endon(#"death");
	if(isdefined(self.attackable))
	{
		namespace_85745671::function_2b925fa5(self);
	}
	self.var_98f1f37c = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

/*
	Name: function_887b8ada
	Namespace: namespace_cd6bd9f
	Checksum: 0x2D229877
	Offset: 0x510
	Size: 0x62
	Parameters: 2
	Flags: Linked, Private
*/
function private function_887b8ada(var_5c5062cd, var_fbac2b3f)
{
	self.var_659efbe = var_fbac2b3f;
	self.var_29459a31 = var_5c5062cd.var_29459a31;
	self.var_89592ba7 = var_5c5062cd.var_89592ba7;
	self.var_722e942 = var_5c5062cd.var_722e942;
	self.hotzone = var_5c5062cd.hotzone;
}

/*
	Name: function_9d59692c
	Namespace: namespace_cd6bd9f
	Checksum: 0xC2C22667
	Offset: 0x580
	Size: 0x2C4
	Parameters: 2
	Flags: Linked, Private
*/
function private function_9d59692c(var_33e339fe, var_551c6a0e)
{
	if(isdefined(var_33e339fe))
	{
		setup_awareness(var_33e339fe);
		awareness::function_c241ef9a(var_33e339fe, self.favoriteenemy, 5);
	}
	if(isdefined(var_551c6a0e))
	{
		setup_awareness(var_551c6a0e);
		awareness::function_c241ef9a(var_551c6a0e, self.favoriteenemy, 5);
	}
	if(!isdefined(self.var_29459a31) || !isdefined(self.var_89592ba7))
	{
		if(isdefined(self.instance.a_ai))
		{
			if(isdefined(var_33e339fe))
			{
				if(!isdefined(self.instance.a_ai))
				{
					self.instance.a_ai = [];
				}
				else if(!isarray(self.instance.a_ai))
				{
					self.instance.a_ai = array(self.instance.a_ai);
				}
				self.instance.a_ai[self.instance.a_ai.size] = var_33e339fe;
				var_33e339fe.instance = self.instance;
			}
			if(isdefined(var_551c6a0e))
			{
				if(!isdefined(self.instance.a_ai))
				{
					self.instance.a_ai = [];
				}
				else if(!isarray(self.instance.a_ai))
				{
					self.instance.a_ai = array(self.instance.a_ai);
				}
				self.instance.a_ai[self.instance.a_ai.size] = var_551c6a0e;
				var_551c6a0e.instance = self.instance;
			}
		}
		return;
	}
	if(isdefined(var_33e339fe))
	{
		var_33e339fe function_887b8ada(self, var_551c6a0e);
		namespace_ce1f29cc::function_418ab095(var_33e339fe, self.hotzone);
	}
	if(isdefined(var_551c6a0e))
	{
		var_551c6a0e function_887b8ada(self, var_33e339fe);
		namespace_ce1f29cc::function_418ab095(var_551c6a0e, self.hotzone);
	}
}

/*
	Name: function_ccdf9d44
	Namespace: namespace_cd6bd9f
	Checksum: 0xEB53325D
	Offset: 0x850
	Size: 0x78
	Parameters: 2
	Flags: Linked, Private
*/
function private function_ccdf9d44(params, hotzone)
{
	if(!isdefined(self.var_29459a31) || !isdefined(self.var_89592ba7) || isplayer(hotzone.eattacker) || isalive(self.var_659efbe))
	{
		return false;
	}
	return true;
}

/*
	Name: function_1915f8d6
	Namespace: namespace_cd6bd9f
	Checksum: 0xC97086B2
	Offset: 0x8D0
	Size: 0x92
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1915f8d6(params, hotzone)
{
	if(!is_true(self.var_8576e0be) && !isplayer(hotzone.eattacker) && (isdefined(self.var_29459a31) && isdefined(self.var_89592ba7)) && !is_true(self.var_7a68cd0c))
	{
		return true;
	}
	return false;
}

/*
	Name: setup_awareness
	Namespace: namespace_cd6bd9f
	Checksum: 0x6389B2F8
	Offset: 0x970
	Size: 0x1BC
	Parameters: 1
	Flags: Linked, Private
*/
function private setup_awareness(entity)
{
	entity.has_awareness = 1;
	entity.ignorelaststandplayers = 1;
	entity.var_1267fdea = 1;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::register_state(entity, #"wander", &function_7cdb2c4c, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::register_state(entity, #"investigate", &function_ba66485e, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::register_state(entity, #"chase", &function_1534f0a3, &function_9ffae104, &awareness::function_b9f81e8b, &awareness::function_5c40e824);
	awareness::set_state(entity, #"wander");
	entity thread awareness::function_fa6e010d();
}

/*
	Name: function_7cdb2c4c
	Namespace: namespace_cd6bd9f
	Checksum: 0x3B1917DE
	Offset: 0xB38
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7cdb2c4c(entity)
{
	self.fovcosine = 0.5;
	self.maxsightdistsqrd = sqr(1000);
	self.var_1267fdea = 0;
	awareness::function_9c9d96b5(entity);
}

/*
	Name: function_ba66485e
	Namespace: namespace_cd6bd9f
	Checksum: 0xE414C73B
	Offset: 0xBA0
	Size: 0x5C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_ba66485e(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(1800);
	self.var_1267fdea = 0;
	awareness::function_b41f0471(entity);
}

/*
	Name: function_1534f0a3
	Namespace: namespace_cd6bd9f
	Checksum: 0x2F3C17A1
	Offset: 0xC08
	Size: 0x84
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1534f0a3(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(3000);
	self.var_1267fdea = 0;
	self.ai.var_8c8fb85a = 1;
	self thread function_6d368182();
	awareness::function_978025e4(entity);
}

/*
	Name: function_9ffae104
	Namespace: namespace_cd6bd9f
	Checksum: 0xD93312A9
	Offset: 0xC98
	Size: 0x27C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9ffae104(entity)
{
	if(isdefined(entity.enemy) && awareness::function_2bc424fd(entity, entity.enemy))
	{
		return;
	}
	if(isdefined(entity.attackable) && !isdefined(entity.var_b238ef38))
	{
		if(!isdefined(entity.var_3f8ea75c))
		{
			entity.var_3f8ea75c = namespace_85745671::function_12d90bae(entity, 150, 500, entity.attackable);
		}
		if(isdefined(entity.var_3f8ea75c))
		{
			if(!entity isingoal(entity.var_3f8ea75c))
			{
				entity setgoal(entity.var_3f8ea75c);
				entity waittill(#"goal", #"hash_5114eb062d7568b6");
				if(isdefined(entity.attackable))
				{
					var_bf3a521d = vectortoangles(entity.attackable.origin - entity.origin);
					entity forceteleport(entity.origin, (0, var_bf3a521d[1], 0), 0);
				}
			}
			else if(entity isatgoal())
			{
				var_bf3a521d = entity.attackable.origin - entity.origin;
				var_bf3a521d = vectornormalize(var_bf3a521d);
				if(vectordot(var_bf3a521d, anglestoforward(entity.angles)) < 0.99)
				{
					var_ae7100d7 = vectortoangles(var_bf3a521d);
					entity forceteleport(entity.origin, (0, var_ae7100d7[1], 0), 0);
				}
			}
			return;
		}
	}
	awareness::function_39da6c3c(entity);
}

/*
	Name: function_b6d015bd
	Namespace: namespace_cd6bd9f
	Checksum: 0x4D377A0F
	Offset: 0xF20
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_b6d015bd(entity)
{
}

/*
	Name: function_6d368182
	Namespace: namespace_cd6bd9f
	Checksum: 0x750B465F
	Offset: 0xF38
	Size: 0x46
	Parameters: 0
	Flags: Linked, Private
*/
function private function_6d368182()
{
	self endon(#"death");
	wait(randomfloatrange(2, 4));
	self.ai.var_8c8fb85a = 0;
}

