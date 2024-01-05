#using script_35598499769dbb3d;
#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_ed80aead;

/*
	Name: init
	Namespace: namespace_ed80aead
	Checksum: 0x98A446E1
	Offset: 0x3B8
	Size: 0x17A
	Parameters: 0
	Flags: Linked
*/
function init()
{
	level.doa.var_1c58e161 = array(getweapon("zombietron_deathmachine"), getweapon("zombietron_deathmachine_1"), getweapon("zombietron_deathmachine_2"), getweapon("zombietron_shotgun_fullauto_t9"), getweapon("zombietron_shotgun_fullauto_t9_1"), getweapon("zombietron_shotgun_fullauto_t9_2"), getweapon("zombietron_launcher_1"), getweapon("zombietron_launcher_2"));
	level.doa.var_d516e53 = array("MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTIVLE_SPLASH", "MOD_EXPLOSIVE");
	level.doa.hitlocs = array("left_hand", "left_arm_lower", "left_arm_upper", "right_hand", "right_arm_lower", "right_arm_upper");
}

/*
	Name: function_1f275794
	Namespace: namespace_ed80aead
	Checksum: 0xD9B5278D
	Offset: 0x540
	Size: 0x84
	Parameters: 2
	Flags: Linked
*/
function function_1f275794(launchvector, attacker)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isactor(self))
	{
		return;
	}
	if(is_true(self.boss))
	{
		return;
	}
	gibserverutils::giblegs(self, 0);
	self function_df5afb5e(1);
}

/*
	Name: function_586ef822
	Namespace: namespace_ed80aead
	Checksum: 0xB2C838E1
	Offset: 0x5D0
	Size: 0x64
	Parameters: 0
	Flags: Linked
*/
function function_586ef822()
{
	/#
		assert(self.health <= 0 || is_true(self.marked_for_death), "");
	#/
	gibserverutils::annihilate(self);
}

/*
	Name: function_c25b3c76
	Namespace: namespace_ed80aead
	Checksum: 0xDB7540D2
	Offset: 0x640
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function function_c25b3c76(launchvector)
{
	if(!isdefined(self))
	{
		return;
	}
	if(!isactor(self))
	{
		return;
	}
	/#
		assert(self.health <= 0 || is_true(self.marked_for_death), "");
	#/
	/#
		assert(!is_true(self.boss));
	#/
	self namespace_83eb6304::function_3ecfde67("gut_explode");
	self thread namespace_ec06fe4a::function_5678f0d(launchvector);
	if(isdefined(launchvector))
	{
		self namespace_e32bb68::function_3a59ec34("zmb_ragdoll_launched");
	}
}

/*
	Name: trygibbinghead
	Namespace: namespace_ed80aead
	Checksum: 0x9C158893
	Offset: 0x750
	Size: 0x1DC
	Parameters: 7
	Flags: Linked
*/
function trygibbinghead(entity, damage, weapon, var_fd90b0bb, hitloc, isexplosive, forced)
{
	if(!isdefined(hitloc))
	{
		hitloc = "head";
	}
	if(!isdefined(isexplosive))
	{
		isexplosive = 0;
	}
	if(!isdefined(forced))
	{
		forced = 0;
	}
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(gibserverutils::isgibbed(entity, 8))
	{
		return;
	}
	if(forced || (isexplosive && randomfloatrange(0, 1) <= 0.5))
	{
		gibserverutils::gibhead(entity, var_c3317960);
	}
	else
	{
		if(isinarray(array("head", "neck", "helmet"), hitloc) && randomfloatrange(0, 1) <= 1)
		{
			gibserverutils::gibhead(entity, var_c3317960);
		}
		else if((entity.health - damage) <= 0 && randomfloatrange(0, 1) <= 0.25)
		{
			gibserverutils::gibhead(entity, var_c3317960);
		}
	}
}

/*
	Name: trygibbinglimb
	Namespace: namespace_ed80aead
	Checksum: 0xC0D9A300
	Offset: 0x938
	Size: 0x35C
	Parameters: 6
	Flags: Linked
*/
function trygibbinglimb(entity, damage, weapon, var_fd90b0bb, hitloc, isexplosive)
{
	if(!isdefined(isexplosive))
	{
		isexplosive = 0;
	}
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(!isdefined(hitloc))
	{
		hitloc = level.doa.hitlocs[randomint(level.doa.hitlocs.size)];
	}
	if(isexplosive && randomfloatrange(0, 1) <= 0.35)
	{
		if((entity.health - damage) <= 0 && entity.allowdeath && math::cointoss())
		{
			if(!gibserverutils::isgibbed(entity, 16))
			{
				gibserverutils::gibrightarm(entity, var_c3317960);
			}
		}
		else if(!gibserverutils::isgibbed(entity, 32))
		{
			gibserverutils::gibleftarm(entity, var_c3317960);
		}
	}
	else
	{
		if(isinarray(array("left_hand", "left_arm_lower", "left_arm_upper"), hitloc))
		{
			if(!gibserverutils::isgibbed(entity, 32))
			{
				gibserverutils::gibleftarm(entity, var_c3317960);
			}
		}
		else
		{
			if((entity.health - damage) <= 0 && entity.allowdeath && isinarray(array("right_hand", "right_arm_lower", "right_arm_upper"), hitloc))
			{
				gibserverutils::gibrightarm(entity, var_c3317960);
			}
			else if((entity.health - damage) <= 0 && entity.allowdeath && randomfloatrange(0, 1) <= 0.45)
			{
				if(math::cointoss())
				{
					if(!gibserverutils::isgibbed(entity, 32))
					{
						gibserverutils::gibleftarm(entity, var_c3317960);
					}
				}
				else if(!gibserverutils::isgibbed(entity, 16))
				{
					gibserverutils::gibrightarm(entity, var_c3317960);
				}
			}
		}
	}
}

/*
	Name: trygibbinglegs
	Namespace: namespace_ed80aead
	Checksum: 0x71CCB307
	Offset: 0xCA0
	Size: 0x4CC
	Parameters: 7
	Flags: Linked
*/
function trygibbinglegs(entity, damage, weapon, var_fd90b0bb, hitloc, isexplosive, attacker)
{
	if(!isdefined(isexplosive))
	{
		isexplosive = 0;
	}
	var_c3317960 = gibserverutils::function_de4d9d(weapon, var_fd90b0bb);
	if(!isdefined(attacker))
	{
		attacker = entity;
	}
	if(!isdefined(hitloc))
	{
		hitloc = level.doa.hitlocs[randomint(level.doa.hitlocs.size)];
	}
	cangiblegs = (entity.health - damage) <= 0 && entity.allowdeath;
	cangiblegs = cangiblegs || (((entity.health - damage) / entity.maxhealth) <= 0.25 && distancesquared(entity.origin, attacker.origin) <= sqr(600) && entity.allowdeath);
	if(!is_true(entity.boss) && (entity.health - damage) <= 0 && entity.allowdeath && isexplosive && randomfloatrange(0, 1) <= 0.5)
	{
		if(!gibserverutils::isgibbed(entity, 384))
		{
			gibserverutils::giblegs(entity, var_c3317960);
			entity function_df5afb5e(1);
			entity thread namespace_ec06fe4a::function_5678f0d();
		}
	}
	else if((entity.health - damage) <= 0 && entity.allowdeath && randomfloatrange(0, 1) <= 0.25)
	{
		if(!gibserverutils::isgibbed(entity, 256))
		{
			gibserverutils::gibleftleg(entity, var_c3317960);
			entity function_df5afb5e(1);
		}
		if(math::cointoss())
		{
			if(!gibserverutils::isgibbed(entity, 128))
			{
				gibserverutils::gibrightleg(entity, var_c3317960);
				entity function_df5afb5e(1);
			}
		}
	}
	if(cangiblegs && isinarray(array("left_leg_upper", "left_leg_lower", "left_foot"), hitloc) && randomfloatrange(0, 1) <= 1)
	{
		if(!gibserverutils::isgibbed(entity, 256))
		{
			gibserverutils::gibleftleg(entity, var_c3317960);
			entity function_df5afb5e(1);
		}
	}
	if(cangiblegs && isinarray(array("right_leg_upper", "right_leg_lower", "right_foot"), hitloc) && randomfloatrange(0, 1) <= 1)
	{
		if(!gibserverutils::isgibbed(entity, 128))
		{
			gibserverutils::gibrightleg(entity, var_c3317960);
			entity function_df5afb5e(1);
		}
	}
}

/*
	Name: function_df5afb5e
	Namespace: namespace_ed80aead
	Checksum: 0xB9185425
	Offset: 0x1178
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_df5afb5e(missinglegs)
{
	if(!isdefined(missinglegs))
	{
		missinglegs = 0;
	}
	if(missinglegs)
	{
		self.knockdown = 0;
	}
	self.missinglegs = missinglegs;
}

/*
	Name: function_5e680689
	Namespace: namespace_ed80aead
	Checksum: 0xC9CCA2CB
	Offset: 0x11C0
	Size: 0x20C
	Parameters: 7
	Flags: Linked
*/
function function_5e680689(attacker, damage, meansofdeath, weapon, var_fd90b0bb, hitloc, vdir)
{
	if(!isactor(self))
	{
		return;
	}
	if(self.archetype != "zombie")
	{
		return;
	}
	if(weapon == "MOD_BURNED")
	{
		return;
	}
	self endon(#"death");
	isexplosive = isinarray(level.doa.var_d516e53, weapon);
	trygibbinglimb(self, meansofdeath, var_fd90b0bb, hitloc, vdir, isexplosive);
	trygibbinglegs(self, meansofdeath, var_fd90b0bb, hitloc, vdir, isexplosive, damage);
	if(meansofdeath >= self.health && gettime() > self.birthtime)
	{
		self.marked_for_death = 1;
		if(isinarray(level.doa.var_1c58e161, var_fd90b0bb))
		{
			self namespace_83eb6304::function_3ecfde67("zombie_chunk");
		}
		if(var_fd90b0bb === level.doa.var_6a5eb56f || var_fd90b0bb === level.doa.var_3efdf9e5)
		{
			trygibbinghead(self, meansofdeath, var_fd90b0bb, hitloc, vdir, isexplosive);
			self namespace_83eb6304::function_3ecfde67("boost_explode");
		}
		if(var_fd90b0bb.doannihilate)
		{
			self function_586ef822();
		}
	}
}

/*
	Name: gib_random_part
	Namespace: namespace_ed80aead
	Checksum: 0x946E79F0
	Offset: 0x13D8
	Size: 0x11C
	Parameters: 1
	Flags: Linked
*/
function gib_random_part(damage)
{
	if(!isdefined(damage))
	{
		damage = 100;
	}
	if(is_true(self.no_gib))
	{
		return;
	}
	if(mayspawnentity() && function_3238d10d(self.origin))
	{
		playsoundatposition(#"zmb_death_gibss", self.origin);
	}
	val = randomint(100);
	if(val > 20)
	{
		trygibbinghead(self, damage);
	}
	if(val > 30)
	{
		trygibbinglegs(self, damage);
	}
	if(val > 50)
	{
		trygibbinglimb(self, damage);
	}
}

