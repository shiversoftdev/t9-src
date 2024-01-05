#using scripts\weapons\weaponobjects.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\battlechatter.gsc;

#namespace nightingale;

/*
	Name: __init__system__
	Namespace: nightingale
	Checksum: 0xDB2053F5
	Offset: 0x158
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"nightingale", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: nightingale
	Checksum: 0xC245F44D
	Offset: 0x1A0
	Size: 0x21C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("scriptmover", "" + #"hash_7cc71113338444c4", 1, 1, "int");
	clientfield::register("scriptmover", "" + #"hash_7c2ee5bfa7cad803", 1, 1, "int");
	weapon_name = (sessionmodeiszombiesgame() ? #"hash_12f078ddc9b913c3" : #"nightingale");
	weapon = getweapon(weapon_name);
	level.var_432fa05c = {#hash_558ae5bc:sqr(500), #hash_402a4207:[]};
	callback::add_callback(#"hash_7c6da2f2c9ef947a", &function_30a3d1d2);
	globallogic_score::function_5a241bd8(weapon, &function_dedc78a9);
	globallogic_score::function_c1e9b86b(weapon, &function_a8222420);
	weaponobjects::function_e6400478(weapon_name, &createdecoywatcher, 1);
	if(isdefined(level.var_a5dacbea))
	{
		[[level.var_a5dacbea]](weapon, &function_6ab1797f);
	}
	if(isdefined(level.var_f9109dc6))
	{
		[[level.var_f9109dc6]](weapon, &function_7dfb4daa);
	}
}

/*
	Name: createdecoywatcher
	Namespace: nightingale
	Checksum: 0xC288BD32
	Offset: 0x3C8
	Size: 0x6E
	Parameters: 1
	Flags: Linked, Private
*/
function private createdecoywatcher(watcher)
{
	watcher.ignoredirection = 1;
	watcher.ondestroyed = &function_81619d12;
	watcher.ondamage = &function_acc36c55;
	watcher.ondetonatecallback = &function_c4afd8d1;
	watcher.var_ce3a3280 = 48;
}

/*
	Name: function_81619d12
	Namespace: nightingale
	Checksum: 0xF2F59C9B
	Offset: 0x440
	Size: 0x5C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_81619d12(attacker, data)
{
	if(isdefined(self.owner) && isdefined(level.playequipmentdestroyedonplayer))
	{
		self.owner [[level.playequipmentdestroyedonplayer]]();
	}
	self function_1bda2316(data);
}

/*
	Name: function_c4afd8d1
	Namespace: nightingale
	Checksum: 0x85BA775F
	Offset: 0x4A8
	Size: 0x34
	Parameters: 3
	Flags: Linked, Private
*/
function private function_c4afd8d1(attacker, weapon, target)
{
	self function_1bda2316(weapon, target);
}

/*
	Name: function_1bda2316
	Namespace: nightingale
	Checksum: 0x34BFAE82
	Offset: 0x4E8
	Size: 0xDC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_1bda2316(attacker, weapon)
{
	weaponobjects::function_b4793bda(self, self.weapon);
	if(isdefined(attacker) && self.owner util::isenemyplayer(attacker))
	{
		scoreevents::processscoreevent(#"hash_7e4bea54bce26c89", attacker, self.owner, weapon);
		attacker challenges::destroyedequipment(weapon);
		self battlechatter::function_d2600afc(attacker, self.owner, self.weapon, weapon);
	}
	self delete();
}

/*
	Name: function_acc36c55
	Namespace: nightingale
	Checksum: 0xD6666C4
	Offset: 0x5D0
	Size: 0x44C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_acc36c55(watcher)
{
	self endon(#"death", #"hacked", #"detonating");
	self waittill(#"deployed");
	if(!isdefined(self.var_20a0f018))
	{
		return;
	}
	self.var_20a0f018 endon(#"death");
	self.var_20a0f018 setcandamage(1);
	self.var_20a0f018.maxhealth = 100000;
	self.var_20a0f018.health = self.var_20a0f018.maxhealth;
	while(true)
	{
		waitresult = undefined;
		waitresult = self.var_20a0f018 waittill(#"damage");
		attacker = waitresult.attacker;
		weapon = waitresult.weapon;
		damage = waitresult.amount;
		type = waitresult.mod;
		idflags = waitresult.flags;
		if(!isplayer(attacker) && isdefined(attacker.owner))
		{
			attacker = attacker.owner;
		}
		if(isdefined(weapon))
		{
			self weaponobjects::weapon_object_do_damagefeedback(weapon, attacker, type, waitresult.inflictor);
		}
		if(!level.weaponobjectdebug && level.teambased && isplayer(attacker) && isdefined(self.owner))
		{
			if(!level.hardcoremode && !util::function_fbce7263(self.owner.team, attacker.pers[#"team"]) && self.owner != attacker)
			{
				continue;
			}
		}
		if(!isvehicle(self) && !damage::friendlyfirecheck(self.owner, attacker))
		{
			continue;
		}
		if(util::function_fbce7263(attacker.team, self.team))
		{
			killstreaks::function_e729ccee(attacker, weapon);
		}
		break;
	}
	if(level.weaponobjectexplodethisframe)
	{
		wait(0.1 + randomfloat(0.4));
	}
	else
	{
		waitframe(1);
	}
	if(!isdefined(self))
	{
		return;
	}
	level.weaponobjectexplodethisframe = 1;
	thread weaponobjects::resetweaponobjectexplodethisframe();
	self entityheadicons::setentityheadicon("none");
	if(isdefined(type) && (issubstr(type, "MOD_GRENADE_SPLASH") || issubstr(type, "MOD_GRENADE") || issubstr(type, "MOD_EXPLOSIVE")))
	{
		self.waschained = 1;
	}
	if(isdefined(idflags) && idflags & 8)
	{
		self.wasdamagedfrombulletpenetration = 1;
	}
	self.wasdamaged = 1;
	watcher thread weaponobjects::waitanddetonate(self, 0, attacker, weapon);
}

/*
	Name: function_6ab1797f
	Namespace: nightingale
	Checksum: 0x878EBAFC
	Offset: 0xA28
	Size: 0xC4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6ab1797f(decoygrenade)
{
	if(is_true(decoygrenade.shuttingdown))
	{
		return;
	}
	if(isdefined(decoygrenade.var_20a0f018))
	{
		decoygrenade.var_20a0f018 clientfield::set("isJammed", 1);
		decoygrenade.var_20a0f018 clientfield::set("" + #"hash_7c2ee5bfa7cad803", 0);
		decoygrenade.var_20a0f018 stoploopsound(0.5);
	}
	decoygrenade scene::stop();
}

/*
	Name: function_7dfb4daa
	Namespace: nightingale
	Checksum: 0x43A156D7
	Offset: 0xAF8
	Size: 0xE4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_7dfb4daa(decoygrenade)
{
	if(is_true(decoygrenade.shuttingdown))
	{
		return;
	}
	if(!isdefined(decoygrenade.var_20a0f018))
	{
		return;
	}
	decoygrenade.var_20a0f018 clientfield::set("isJammed", 0);
	decoygrenade.var_20a0f018 clientfield::set("" + #"hash_7c2ee5bfa7cad803", 1);
	decoygrenade.var_20a0f018 playloopsound(#"hash_6e07f5906d35471");
	decoygrenade thread scene::play(#"scene_grenade_decoy_footsteps", decoygrenade.var_20a0f018);
}

/*
	Name: function_4776caf4
	Namespace: nightingale
	Checksum: 0x22C7E15C
	Offset: 0xBE8
	Size: 0x24C
	Parameters: 1
	Flags: Private, Event
*/
event private function_4776caf4(eventstruct)
{
	if(eventstruct.weapon.name == #"nightingale" || eventstruct.weapon.name == #"hash_12f078ddc9b913c3")
	{
		grenade = eventstruct.projectile;
		grenade.var_cb19e5d4 = 1;
		grenade.var_515d6dda = 1;
		grenade.var_48d842c3 = 1;
		if(sessionmodeiszombiesgame())
		{
			grenade.var_dfa42180 = &function_400826e;
		}
		grenade waittill(#"stationary", #"death");
		if(!isdefined(grenade))
		{
			return;
		}
		if(isdefined(level.var_1b5a1f0d) && ![[level.var_1b5a1f0d]](grenade.origin))
		{
			weaponobjects::function_f2a06099(grenade, eventstruct.weapon);
			grenade deletedelay();
		}
		else
		{
			grenade thread function_db24f032();
			if(sessionmodeiszombiesgame())
			{
				grenade.var_acdc8d71 = grenade function_65ee50ba();
			}
			if(!isdefined(level.var_432fa05c.var_402a4207))
			{
				level.var_432fa05c.var_402a4207 = [];
			}
			else if(!isarray(level.var_432fa05c.var_402a4207))
			{
				level.var_432fa05c.var_402a4207 = array(level.var_432fa05c.var_402a4207);
			}
			level.var_432fa05c.var_402a4207[level.var_432fa05c.var_402a4207.size] = grenade;
		}
	}
}

/*
	Name: function_db24f032
	Namespace: nightingale
	Checksum: 0xE50A40AD
	Offset: 0xE40
	Size: 0x2B4
	Parameters: 0
	Flags: Linked
*/
function function_db24f032()
{
	decoy = util::spawn_model(self.model, self.origin, self.angles);
	self.var_20a0f018 = decoy;
	decoy setteam(self.team);
	decoy.team = self.team;
	decoy clientfield::set("enemyequip", 1);
	decoy.aitype = #"hash_25454a5a4de341b8";
	decoy linkto(self);
	if(isdefined(self.originalowner) && isplayer(self.originalowner))
	{
		decoy setowner(self.originalowner);
	}
	decoy clientfield::set("" + #"hash_7cc71113338444c4", 1);
	self ghost();
	self notsolid();
	if(is_true(self.isjammed))
	{
		decoy clientfield::set("isJammed", 1);
	}
	else
	{
		self thread scene::play(#"scene_grenade_decoy_footsteps", decoy);
		decoy clientfield::set("" + #"hash_7c2ee5bfa7cad803", 1);
		decoy playloopsound(#"hash_6e07f5906d35471");
	}
	self notify(#"deployed");
	self waittill(#"death");
	self.shuttingdown = 1;
	if(isdefined(self))
	{
		self scene::stop();
	}
	weaponobjects::function_f2a06099(self, self.weapon);
	if(isdefined(decoy))
	{
		decoy deletedelay();
	}
}

/*
	Name: function_29fbe24f
	Namespace: nightingale
	Checksum: 0xE143EC5A
	Offset: 0x1100
	Size: 0x92
	Parameters: 1
	Flags: Linked
*/
function function_29fbe24f(zombie)
{
	arrayremovevalue(level.var_432fa05c.var_402a4207, undefined);
	var_402a4207 = level.var_432fa05c.var_402a4207;
	var_ed793fcb = undefined;
	if(var_402a4207.size > 0)
	{
		var_ed793fcb = arraygetclosest(zombie.origin, var_402a4207, 420);
	}
	return var_ed793fcb;
}

/*
	Name: function_400826e
	Namespace: nightingale
	Checksum: 0xAF1E40E3
	Offset: 0x11A0
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_400826e(zombie)
{
	if(isdefined(self.var_acdc8d71))
	{
		return self.var_acdc8d71;
	}
	return groundtrace(self.origin + vectorscale((0, 0, 1), 8), self.origin + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
}

/*
	Name: function_65ee50ba
	Namespace: nightingale
	Checksum: 0xDBB72106
	Offset: 0x1220
	Size: 0x2BA
	Parameters: 0
	Flags: Linked, Private
*/
function private function_65ee50ba()
{
	check_dist = 10;
	var_1a055edd = [];
	var_a99c2bf3 = self.origin + (0, 0, check_dist * -1);
	var_2eefd050 = groundtrace(var_a99c2bf3 + vectorscale((0, 0, 1), 8), var_a99c2bf3 + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
	if(!isdefined(var_1a055edd))
	{
		var_1a055edd = [];
	}
	else if(!isarray(var_1a055edd))
	{
		var_1a055edd = array(var_1a055edd);
	}
	var_1a055edd[var_1a055edd.size] = var_2eefd050;
	xoffset = -1;
	while(xoffset <= 1)
	{
		yoffset = -1;
		while(yoffset <= 1)
		{
			checkpos = var_a99c2bf3 + (xoffset * check_dist, yoffset * check_dist, 0);
			groundpos = groundtrace(checkpos + vectorscale((0, 0, 1), 8), checkpos + (vectorscale((0, 0, -1), 100000)), 0, self)[#"position"];
			if(!isdefined(var_1a055edd))
			{
				var_1a055edd = [];
			}
			else if(!isarray(var_1a055edd))
			{
				var_1a055edd = array(var_1a055edd);
			}
			var_1a055edd[var_1a055edd.size] = groundpos;
			yoffset = yoffset + 2;
		}
		xoffset = xoffset + 2;
	}
	farthest = arraygetfarthest(var_a99c2bf3, var_1a055edd);
	if((abs(farthest[2] - var_2eefd050[2])) <= check_dist)
	{
		farthest = var_2eefd050;
	}
	/#
		debugstar(farthest, 30, (1, 1, 1));
		recordline(self.origin, farthest, vectorscale((1, 1, 1), 0.1));
	#/
	return getclosestpointonnavmesh(farthest, 420, 15.1875);
}

/*
	Name: function_30a3d1d2
	Namespace: nightingale
	Checksum: 0x798E76B5
	Offset: 0x14E8
	Size: 0x198
	Parameters: 1
	Flags: Linked
*/
function function_30a3d1d2(params)
{
	arrayremovevalue(level.var_432fa05c.var_402a4207, undefined);
	foreach(var_e5d834ab in level.var_432fa05c.var_402a4207)
	{
		if(var_e5d834ab.team == self.team)
		{
			continue;
		}
		owner = var_e5d834ab.owner;
		if(isdefined(owner) && isdefined(params.players[owner getentitynumber()]) && level.var_432fa05c.var_558ae5bc >= distancesquared(var_e5d834ab.origin, self.origin))
		{
			scoreevents::processscoreevent(#"hash_f114eaf6ee78991", owner);
			owner stats::function_622feb0d(var_e5d834ab.weapon.name, #"hash_1f29619736f4b06", 1);
		}
	}
}

/*
	Name: function_dedc78a9
	Namespace: nightingale
	Checksum: 0x339D7FC3
	Offset: 0x1688
	Size: 0x14E
	Parameters: 5
	Flags: Linked
*/
function function_dedc78a9(attacker, victim, weapon, attackerweapon, meansofdeath)
{
	arrayremovevalue(level.var_432fa05c.var_402a4207, undefined);
	foreach(var_e5d834ab in level.var_432fa05c.var_402a4207)
	{
		if(!isdefined(meansofdeath.team))
		{
			continue;
		}
		if(var_e5d834ab.team === meansofdeath.team)
		{
			continue;
		}
		if(attackerweapon === var_e5d834ab.owner && level.var_432fa05c.var_558ae5bc >= distancesquared(var_e5d834ab.origin, meansofdeath.origin))
		{
			return true;
		}
	}
	return false;
}

/*
	Name: function_a8222420
	Namespace: nightingale
	Checksum: 0x36A7535E
	Offset: 0x17E0
	Size: 0x4C
	Parameters: 5
	Flags: Linked
*/
function function_a8222420(attacker, time, weapon, var_25f92d1d, var_deb2a22b)
{
	var_deb2a22b contracts::increment_contract(#"hash_6c38f28fb66ca0c4");
}

