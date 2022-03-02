#using script_41fe08c37d53a635;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_81245006;

/*
	Name: function_89f2df9
	Namespace: namespace_81245006
	Checksum: 0x76A11443
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_130a49b747d3bf82", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_81245006
	Checksum: 0x5B1A88C2
	Offset: 0x118
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!sessionmodeiszombiesgame())
	{
		return;
	}
	for(i = 0; i < 6; i++)
	{
		clientfield::register("actor", ("" + #"hash_1474b2823ab7e9f3") + i, 1, 1, "int");
		clientfield::register("actor", ("" + #"hash_855297c2add300") + i, 1, 1, "counter");
	}
}

/*
	Name: initweakpoints
	Namespace: namespace_81245006
	Checksum: 0xAE1AB343
	Offset: 0x1F0
	Size: 0x488
	Parameters: 1
	Flags: Linked
*/
function initweakpoints(entity)
{
	var_97e1b97d = function_768b9c03(self.aitype);
	if(!isdefined(var_97e1b97d))
	{
		return;
	}
	var_5ace757d = getscriptbundle(var_97e1b97d);
	if(!isdefined(var_5ace757d) || !isdefined(var_5ace757d.weakpoints))
	{
		return;
	}
	entity.var_5ace757d = [];
	foreach(var_dd54fdb1 in var_5ace757d.weakpoints)
	{
		var_7c4db75f = function_2e532eed(var_dd54fdb1);
		function_6c64ebd3(var_7c4db75f, 2);
		if(!is_true(var_dd54fdb1.var_5a93cd2e))
		{
			var_7c4db75f.health = var_dd54fdb1.health * entity.health;
		}
		else
		{
			var_7c4db75f.health = var_dd54fdb1.health;
		}
		var_7c4db75f.maxhealth = var_7c4db75f.health;
		var_7c4db75f.var_d8fa3d82 = [];
		if(isdefined(var_dd54fdb1.var_51e8b151))
		{
			array::add(var_7c4db75f.var_d8fa3d82, var_dd54fdb1.var_51e8b151);
		}
		if(isdefined(var_dd54fdb1.var_910e2f9b))
		{
			array::add(var_7c4db75f.var_d8fa3d82, var_dd54fdb1.var_910e2f9b);
		}
		var_7c4db75f.var_51e8b151 = undefined;
		var_7c4db75f.var_910e2f9b = undefined;
		var_7c4db75f.hitlocs = [];
		if(isdefined(var_dd54fdb1.var_60790e23))
		{
			foreach(struct in var_dd54fdb1.var_60790e23)
			{
				array::add(var_7c4db75f.hitlocs, struct.hitloc);
			}
		}
		var_7c4db75f.var_60790e23 = undefined;
		if(isdefined(var_7c4db75f.var_8b732142))
		{
			var_7c4db75f.var_8b732142 = var_7c4db75f.var_8b732142 - 1;
		}
		array::add(entity.var_5ace757d, var_7c4db75f);
	}
	foreach(var_dd54fdb1 in entity.var_5ace757d)
	{
		if(isdefined(var_dd54fdb1.var_8b732142))
		{
			var_dd54fdb1.var_8b732142 = entity.var_5ace757d[var_dd54fdb1.var_8b732142];
		}
	}
	if(sessionmodeiszombiesgame() && isdefined(var_5ace757d.var_8009bee))
	{
		function_bd0bd9f4(entity, var_5ace757d.var_8009bee);
	}
	foreach(var_dd54fdb1 in entity.var_5ace757d)
	{
		if(is_true(var_dd54fdb1.var_e37acc23))
		{
			function_6c64ebd3(var_dd54fdb1, 1);
		}
	}
}

/*
	Name: function_bd0bd9f4
	Namespace: namespace_81245006
	Checksum: 0x9A2735F9
	Offset: 0x680
	Size: 0x160
	Parameters: 2
	Flags: Linked
*/
function function_bd0bd9f4(entity, &var_426069a)
{
	clientfield_index = 0;
	foreach(var_8cc382e6 in var_426069a)
	{
		if(!isdefined(var_8cc382e6.var_4aa216c9) || !isdefined(var_8cc382e6.weakpoint))
		{
			continue;
		}
		entity.var_5ace757d[var_8cc382e6.weakpoint - 1].var_ee8794bf = ("" + #"hash_1474b2823ab7e9f3") + clientfield_index;
		entity.var_5ace757d[var_8cc382e6.weakpoint - 1].var_98634dc5 = ("" + #"hash_855297c2add300") + clientfield_index;
		clientfield_index++;
		/#
			assert(clientfield_index <= 6, "");
		#/
	}
}

/*
	Name: hasarmor
	Namespace: namespace_81245006
	Checksum: 0xB9ABC783
	Offset: 0x7E8
	Size: 0xB4
	Parameters: 1
	Flags: Linked
*/
function hasarmor(entity)
{
	if(!isdefined(entity.var_5ace757d))
	{
		return false;
	}
	foreach(var_dd54fdb1 in entity.var_5ace757d)
	{
		if(var_dd54fdb1.type === #"armor")
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_3131f5dd
	Namespace: namespace_81245006
	Checksum: 0xAC499AB
	Offset: 0x8A8
	Size: 0xF0
	Parameters: 3
	Flags: Linked
*/
function function_3131f5dd(entity, hitloc, var_6b0c6fac)
{
	if(!isdefined(hitloc))
	{
		return undefined;
	}
	if(isdefined(entity.var_5ace757d))
	{
		foreach(var_dd54fdb1 in entity.var_5ace757d)
		{
			if(isdefined(var_6b0c6fac) && var_dd54fdb1.currstate !== var_6b0c6fac)
			{
				continue;
			}
			if(isinarray(var_dd54fdb1.hitlocs, hitloc))
			{
				return var_dd54fdb1;
			}
		}
	}
}

/*
	Name: function_73ab4754
	Namespace: namespace_81245006
	Checksum: 0xC1D57091
	Offset: 0x9A0
	Size: 0x1F0
	Parameters: 3
	Flags: Linked
*/
function function_73ab4754(entity, point, var_6b0c6fac)
{
	if(!isdefined(point))
	{
		return undefined;
	}
	if(isdefined(entity.var_5ace757d))
	{
		var_e2b4fa2b = undefined;
		var_833f593 = 2147483647;
		foreach(var_dd54fdb1 in entity.var_5ace757d)
		{
			if(isdefined(var_6b0c6fac) && var_dd54fdb1.currstate !== var_6b0c6fac)
			{
				continue;
			}
			if(isdefined(var_dd54fdb1.var_b7fbe51b))
			{
				foreach(var_f16c2276 in var_dd54fdb1.var_d8fa3d82)
				{
					tagorigin = entity gettagorigin(var_f16c2276);
					distsq = distancesquared(point, tagorigin);
					if(distsq <= sqr(var_dd54fdb1.var_b7fbe51b) && var_833f593 > distsq)
					{
						var_e2b4fa2b = var_dd54fdb1;
						var_833f593 = distsq;
					}
				}
			}
		}
	}
	return var_e2b4fa2b;
}

/*
	Name: function_6bb685f0
	Namespace: namespace_81245006
	Checksum: 0xA8DD386
	Offset: 0xB98
	Size: 0x1B6
	Parameters: 3
	Flags: None
*/
function function_6bb685f0(entity, point, var_6b0c6fac)
{
	if(!isdefined(point))
	{
		return undefined;
	}
	if(isdefined(entity.var_5ace757d))
	{
		foreach(var_dd54fdb1 in entity.var_5ace757d)
		{
			if(isdefined(var_6b0c6fac) && var_dd54fdb1.currstate !== var_6b0c6fac)
			{
				continue;
			}
			if(isdefined(var_dd54fdb1.var_b7fbe51b))
			{
				foreach(var_f16c2276 in var_dd54fdb1.var_d8fa3d82)
				{
					tagorigin = entity gettagorigin(var_f16c2276);
					distsq = distancesquared(point, tagorigin);
					if(distsq <= sqr(var_dd54fdb1.var_b7fbe51b))
					{
						return var_dd54fdb1;
					}
				}
			}
		}
	}
}

/*
	Name: function_37e3f011
	Namespace: namespace_81245006
	Checksum: 0x8CE4A8EC
	Offset: 0xD58
	Size: 0x208
	Parameters: 3
	Flags: Linked
*/
function function_37e3f011(entity, bone, var_6b0c6fac)
{
	if(!isdefined(entity))
	{
		return undefined;
	}
	if(isdefined(bone) && !isstring(bone))
	{
		bonename = getpartname(entity, bone);
	}
	else
	{
		bonename = bone;
	}
	if(isdefined(bonename) && isdefined(entity.var_5ace757d))
	{
		/#
			if(getdvarint(#"hash_50608e24a3f5f666", 0) > 0)
			{
				if(!isstring(bone))
				{
					iprintlnbold("" + bonename);
				}
			}
		#/
		foreach(var_dd54fdb1 in entity.var_5ace757d)
		{
			if(isdefined(var_6b0c6fac) && var_dd54fdb1.currstate !== var_6b0c6fac)
			{
				continue;
			}
			foreach(var_f16c2276 in var_dd54fdb1.var_d8fa3d82)
			{
				if(var_f16c2276 == bonename)
				{
					return var_dd54fdb1;
				}
			}
		}
	}
	return undefined;
}

/*
	Name: function_fab3ee3e
	Namespace: namespace_81245006
	Checksum: 0x225B6B07
	Offset: 0xF68
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_fab3ee3e(entity)
{
	return entity.var_5ace757d;
}

/*
	Name: function_ef87b7e8
	Namespace: namespace_81245006
	Checksum: 0xC2EF55DD
	Offset: 0xF88
	Size: 0xF4
	Parameters: 2
	Flags: Linked
*/
function function_ef87b7e8(var_dd54fdb1, damage)
{
	var_dd54fdb1.health = var_dd54fdb1.health - damage;
	if(isactor(self) && isdefined(var_dd54fdb1.var_98634dc5))
	{
		self clientfield::increment(var_dd54fdb1.var_98634dc5);
	}
	if(var_dd54fdb1.health <= 0)
	{
		function_6c64ebd3(var_dd54fdb1, 3);
		if(isdefined(var_dd54fdb1.var_8b732142) && var_dd54fdb1.var_8b732142.currstate == 2)
		{
			function_6c64ebd3(var_dd54fdb1.var_8b732142, 1);
		}
	}
}

/*
	Name: function_76e239dc
	Namespace: namespace_81245006
	Checksum: 0x1C1DF3EF
	Offset: 0x1088
	Size: 0x22C
	Parameters: 2
	Flags: Linked
*/
function function_76e239dc(entity, attacker)
{
	var_e67ec32 = function_fab3ee3e(entity);
	if(isarray(var_e67ec32))
	{
		foreach(var_7092cd34 in var_e67ec32)
		{
			if(var_7092cd34.type === #"armor" && var_7092cd34.health > 0)
			{
				function_ef87b7e8(var_7092cd34, var_7092cd34.health);
				if(isdefined(var_7092cd34.var_f371ebb0))
				{
					destructserverutils::function_8475c53a(entity, var_7092cd34.var_f371ebb0);
					entity.var_426947c4 = 1;
					entity.var_67f98db0 = 1;
					if(isdefined(level.var_887c77a4) && isplayer(attacker))
					{
						if(sessionmodeiszombiesgame())
						{
							level scoreevents::doscoreeventcallback("scoreEventZM", {#scoreevent:level.var_887c77a4, #attacker:attacker});
						}
					}
					if(var_7092cd34.var_f371ebb0 === "body_armor")
					{
						callback::callback(#"hash_7d67d0e9046494fb");
					}
				}
			}
		}
		entity function_2d4173a8(0);
	}
}

/*
	Name: function_6c64ebd3
	Namespace: namespace_81245006
	Checksum: 0x4C57DDCE
	Offset: 0x12C0
	Size: 0x74
	Parameters: 2
	Flags: Linked
*/
function function_6c64ebd3(var_dd54fdb1, state)
{
	if(!isdefined(var_dd54fdb1))
	{
		return;
	}
	var_dd54fdb1.currstate = state;
	if(isactor(self) && isdefined(var_dd54fdb1.var_ee8794bf))
	{
		self clientfield::set(var_dd54fdb1.var_ee8794bf, state == 1);
	}
}

/*
	Name: function_f29756fe
	Namespace: namespace_81245006
	Checksum: 0xA277BC94
	Offset: 0x1340
	Size: 0x16
	Parameters: 1
	Flags: Linked
*/
function function_f29756fe(var_dd54fdb1)
{
	return var_dd54fdb1.currstate;
}

/*
	Name: function_26901d33
	Namespace: namespace_81245006
	Checksum: 0xC2517EA4
	Offset: 0x1360
	Size: 0x76
	Parameters: 1
	Flags: Linked
*/
function function_26901d33(var_dd54fdb1)
{
	if(is_true(var_dd54fdb1.var_e37acc23))
	{
		function_6c64ebd3(var_dd54fdb1, 1);
	}
	else
	{
		function_6c64ebd3(var_dd54fdb1, 2);
	}
	var_dd54fdb1.health = var_dd54fdb1.maxhealth;
}

/*
	Name: function_6742b846
	Namespace: namespace_81245006
	Checksum: 0x8A110F32
	Offset: 0x13E0
	Size: 0x44
	Parameters: 2
	Flags: Linked
*/
function function_6742b846(entity, var_dd54fdb1)
{
	if(isdefined(entity.var_5ace757d))
	{
		arrayremovevalue(entity.var_5ace757d, var_dd54fdb1, 0);
	}
}

