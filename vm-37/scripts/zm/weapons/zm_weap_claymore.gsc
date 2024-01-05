#using scripts\weapons\weaponobjects.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\entityheadicons_shared.gsc;

#namespace zm_weap_claymore;

/*
	Name: __init__system__
	Namespace: zm_weap_claymore
	Checksum: 0x9949F343
	Offset: 0xF8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"claymore_zm", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_weap_claymore
	Checksum: 0x9E8A6F65
	Offset: 0x140
	Size: 0x110
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	weaponobjects::function_e6400478(#"claymore", &createclaymorewatcher, 0);
	weaponobjects::function_e6400478(#"claymore_extra", &createclaymorewatcher, 0);
	deployable::register_deployable(getweapon(#"claymore"), &function_4ed6fbd5, undefined, undefined, #"hash_1f65f161716fb57b");
	deployable::register_deployable(getweapon(#"claymore_extra"), &function_4ed6fbd5, undefined, undefined, #"hash_1f65f161716fb57b");
	level.var_817314af = 0;
}

/*
	Name: function_4ed6fbd5
	Namespace: zm_weap_claymore
	Checksum: 0xCC28A3FB
	Offset: 0x258
	Size: 0x3E
	Parameters: 3
	Flags: None
*/
function function_4ed6fbd5(v_origin, v_angles, player)
{
	if(!zm_utility::check_point_in_playable_area(player))
	{
		return false;
	}
	return true;
}

/*
	Name: createclaymorewatcher
	Namespace: zm_weap_claymore
	Checksum: 0x7C124DD6
	Offset: 0x2A0
	Size: 0x172
	Parameters: 1
	Flags: None
*/
function createclaymorewatcher(watcher)
{
	watcher.watchforfire = 1;
	watcher.activatesound = #"wpn_claymore_alert";
	watcher.hackable = 1;
	watcher.hackertoolradius = level.equipmenthackertoolradius;
	watcher.hackertooltimems = level.equipmenthackertooltimems;
	watcher.ownergetsassist = 1;
	watcher.ignoredirection = undefined;
	watcher.immediatedetonation = 1;
	watcher.immunespecialty = "specialty_immunetriggerbetty";
	watcher.detectiondot = cos(70);
	watcher.detectionmindist = 10;
	watcher.detectiongraceperiod = 0.3;
	watcher.detonateradius = 100;
	watcher.stuntime = 1;
	watcher.ondetonatecallback = &proximitydetonate;
	watcher.onfizzleout = &weaponobjects::weaponobjectfizzleout;
	watcher.onspawn = &function_c9893179;
	watcher.stun = &weaponobjects::weaponstun;
	watcher.var_994b472b = &function_aeb91d3;
	watcher.ondamage = &function_cbb2f05b;
}

/*
	Name: proximitydetonate
	Namespace: zm_weap_claymore
	Checksum: 0x58E13671
	Offset: 0x420
	Size: 0x4C
	Parameters: 3
	Flags: None
*/
function proximitydetonate(attacker, weapon, target)
{
	self thread function_1479a342(weapon, target);
	self weaponobjects::weapondetonate(weapon, target);
}

/*
	Name: function_1479a342
	Namespace: zm_weap_claymore
	Checksum: 0x2144B913
	Offset: 0x478
	Size: 0x200
	Parameters: 2
	Flags: None
*/
function function_1479a342(attacker, weapon)
{
	v_origin = self.origin;
	w_claymore = self.weapon;
	function_62e8a3();
	a_enemies = getaiteamarray(level.zombie_team);
	var_8345897c = arraysortclosest(a_enemies, v_origin, undefined, 0, w_claymore.explosionradius);
	var_84d440a5 = 0;
	foreach(ai in var_8345897c)
	{
		if(!isalive(ai))
		{
			continue;
		}
		n_dist = distance2d(ai.origin, v_origin);
		n_damage = mapfloat(0, w_claymore.explosionradius, w_claymore.explosionouterdamage, w_claymore.explosioninnerdamage, n_dist);
		ai dodamage(int(n_damage), v_origin, weapon, undefined, "none", "MOD_EXPLOSIVE", 0, w_claymore);
		var_84d440a5++;
		if(var_84d440a5 > 1)
		{
			waitframe(1);
			var_84d440a5 = 0;
		}
	}
	level.var_817314af--;
}

/*
	Name: function_62e8a3
	Namespace: zm_weap_claymore
	Checksum: 0xFB2CB638
	Offset: 0x680
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_62e8a3(n_count_per_network_frame)
{
	if(!isdefined(n_count_per_network_frame))
	{
		n_count_per_network_frame = 1;
	}
	while(level.var_817314af > n_count_per_network_frame)
	{
		waitframe(1);
	}
	level.var_817314af++;
}

/*
	Name: function_aeb91d3
	Namespace: zm_weap_claymore
	Checksum: 0xA8C2CD3D
	Offset: 0x6D0
	Size: 0x24
	Parameters: 1
	Flags: None
*/
function function_aeb91d3(player)
{
	self weaponobjects::weaponobjectfizzleout();
}

/*
	Name: function_c9893179
	Namespace: zm_weap_claymore
	Checksum: 0xBE9D36C7
	Offset: 0x700
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function function_c9893179(watcher, player)
{
	weaponobjects::onspawnproximitygrenadeweaponobject(watcher, player);
}

/*
	Name: play_claymore_effects
	Namespace: zm_weap_claymore
	Checksum: 0x917A5527
	Offset: 0x738
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function play_claymore_effects(e_planter)
{
	self endon(#"death");
	self zm_utility::waittill_not_moving();
}

/*
	Name: claymore_detonation
	Namespace: zm_weap_claymore
	Checksum: 0xD452A0BD
	Offset: 0x778
	Size: 0x382
	Parameters: 1
	Flags: None
*/
function claymore_detonation(e_planter)
{
	self endon(#"death");
	self zm_utility::waittill_not_moving();
	detonateradius = 96;
	damagearea = spawn("trigger_radius", self.origin, (512 | 1) + 8, detonateradius, detonateradius * 2);
	damagearea setexcludeteamfortrigger(self.owner.team);
	damagearea enablelinkto();
	damagearea linkto(self);
	if(is_true(self.isonbus))
	{
		damagearea setmovingplatformenabled(1);
	}
	self.damagearea = damagearea;
	self thread delete_mines_on_death(self.owner, damagearea);
	if(!isdefined(self.owner.placeable_mines))
	{
		self.owner.placeable_mines = [];
	}
	else if(!isarray(self.owner.placeable_mines))
	{
		self.owner.placeable_mines = array(self.owner.placeable_mines);
	}
	self.owner.placeable_mines[self.owner.placeable_mines.size] = self;
	while(true)
	{
		waitresult = undefined;
		waitresult = damagearea waittill(#"trigger");
		ent = waitresult.activator;
		if(isdefined(self.owner) && ent == self.owner)
		{
			continue;
		}
		if(isdefined(ent.pers) && isdefined(ent.pers[#"team"]) && ent.pers[#"team"] == self.team)
		{
			continue;
		}
		if(is_true(ent.ignore_placeable_mine))
		{
			continue;
		}
		if(!ent should_trigger_claymore(self))
		{
			continue;
		}
		if(ent damageconetrace(self.origin, self) > 0)
		{
			self playsound(#"wpn_claymore_alert");
			wait(0.4);
			if(isdefined(self.owner))
			{
				self detonate(self.owner);
			}
			else
			{
				self detonate(undefined);
			}
			return;
		}
	}
}

/*
	Name: should_trigger_claymore
	Namespace: zm_weap_claymore
	Checksum: 0x84C216AB
	Offset: 0xB08
	Size: 0x10C
	Parameters: 1
	Flags: Private
*/
function private should_trigger_claymore(e_mine)
{
	n_detonation_dot = cos(70);
	pos = self.origin + vectorscale((0, 0, 1), 32);
	dirtopos = pos - e_mine.origin;
	objectforward = anglestoforward(e_mine.angles);
	dist = vectordot(dirtopos, objectforward);
	if(dist < 20)
	{
		return 0;
	}
	dirtopos = vectornormalize(dirtopos);
	dot = vectordot(dirtopos, objectforward);
	return dot > n_detonation_dot;
}

/*
	Name: delete_mines_on_death
	Namespace: zm_weap_claymore
	Checksum: 0x491D0A9E
	Offset: 0xC20
	Size: 0x6C
	Parameters: 2
	Flags: Private
*/
function private delete_mines_on_death(player, ent)
{
	self waittill(#"death");
	if(isdefined(player))
	{
		arrayremovevalue(player.placeable_mines, self);
	}
	waitframe(1);
	if(isdefined(ent))
	{
		ent delete();
	}
}

/*
	Name: function_cbb2f05b
	Namespace: zm_weap_claymore
	Checksum: 0x56D3DD6F
	Offset: 0xC98
	Size: 0x2FC
	Parameters: 1
	Flags: None
*/
function function_cbb2f05b(watcher)
{
	self endon(#"death", #"hacked", #"detonating");
	self setcandamage(1);
	self.maxhealth = 100000;
	self.health = self.maxhealth;
	self.var_18acfe18 = 0;
	self.var_966835e3 = 150;
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"damage");
		attacker = waitresult.attacker;
		weapon = waitresult.weapon;
		damage = waitresult.amount;
		type = waitresult.mod;
		idflags = waitresult.flags;
		self.var_18acfe18 = self.var_18acfe18 + damage;
		if(!isplayer(attacker) && isdefined(attacker.owner))
		{
			attacker = attacker.owner;
		}
		if(isdefined(weapon))
		{
			self weaponobjects::weapon_object_do_damagefeedback(weapon, attacker);
		}
		if(self.var_18acfe18 >= self.var_966835e3)
		{
			break;
		}
	}
	if(level.weaponobjectexplodethisframe)
	{
		wait(0.1 + randomfloat(0.4));
	}
	else
	{
		waitframe(1);
	}
	level.weaponobjectexplodethisframe = 1;
	self thread weaponobjects::resetweaponobjectexplodethisframe();
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

