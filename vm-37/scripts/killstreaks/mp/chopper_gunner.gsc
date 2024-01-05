#using script_72d96920f15049b8;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace chopper_gunner;

/*
	Name: __init__system__
	Namespace: chopper_gunner
	Checksum: 0xABE16705
	Offset: 0xB8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"chopper_gunner", &function_70a657d8, undefined, &function_3675de8b, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: chopper_gunner
	Checksum: 0x3BDEC365
	Offset: 0x118
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	player::function_cf3aa03d(&function_d45a1f8d, 1);
	level.var_2d4792e7 = &function_5160bb1e;
	namespace_e8c18978::function_70a657d8("killstreak_chopper_gunner");
}

/*
	Name: function_3675de8b
	Namespace: chopper_gunner
	Checksum: 0xEDDB1817
	Offset: 0x180
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3675de8b()
{
	namespace_e8c18978::function_3675de8b();
}

/*
	Name: function_5160bb1e
	Namespace: chopper_gunner
	Checksum: 0x9D49E7A9
	Offset: 0x1A0
	Size: 0x118
	Parameters: 1
	Flags: Linked, Private
*/
function private function_5160bb1e(killstreaktype)
{
	player = self;
	player endon(#"disconnect");
	level endon(#"game_ended");
	/#
		assert(!isdefined(level.chopper_gunner));
	#/
	var_d6940e18 = namespace_e8c18978::function_5160bb1e(killstreaktype);
	if(var_d6940e18 && isbot(player))
	{
		player thread function_25d9a09f(level.chopper_gunner);
	}
	util::function_a3f7de13(21, player.team, player getentitynumber(), level.killstreaks[#"chopper_gunner"].uiname);
	return var_d6940e18;
}

/*
	Name: function_d45a1f8d
	Namespace: chopper_gunner
	Checksum: 0x76229B27
	Offset: 0x2C0
	Size: 0xE4
	Parameters: 9
	Flags: Linked
*/
function function_d45a1f8d(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!isdefined(level.chopper_gunner) || !isdefined(shitloc.owner) || !isdefined(psoffsettime) || !isdefined(deathanimduration))
	{
		return;
	}
	if(shitloc.owner == psoffsettime && deathanimduration == getweapon(#"hash_1734871fef9c0549"))
	{
		level.chopper_gunner namespace_e8c18978::function_631f02c5();
	}
}

/*
	Name: function_25d9a09f
	Namespace: chopper_gunner
	Checksum: 0xB78D0BE
	Offset: 0x3B0
	Size: 0x2A4
	Parameters: 1
	Flags: Linked
*/
function function_25d9a09f(vehicle)
{
	vehicle endon(#"hash_6668be249f2eab45", #"death");
	self endon(#"disconnect");
	waitframe(1);
	while(self isremotecontrolling())
	{
		enemy = undefined;
		enemies = self teams::getenemyplayers();
		enemies = array::randomize(enemies);
		foreach(var_607bb54c in enemies)
		{
			if(isalive(var_607bb54c))
			{
				enemy = var_607bb54c;
				break;
			}
		}
		if(isdefined(enemy))
		{
			vectorfromenemy = vectornormalize((vehicle.origin - enemy.origin[0], vehicle.origin - enemy.origin[1], 0));
			vehicle turretsettarget(0, enemy);
			vehicle waittilltimeout(1, #"turret_on_target");
			vehicle vehicle_ai::fire_for_time(2 + randomfloat(0.8), 0, enemy);
			vehicle vehicle_ai::fire_for_rounds(1, 1, enemy);
			vehicle turretcleartarget(0);
			vehicle turretsettargetangles(0, vectorscale((1, 0, 0), 15));
			if(isdefined(enemy))
			{
				wait(2 + randomfloat(0.5));
			}
		}
		wait(0.1);
	}
}

