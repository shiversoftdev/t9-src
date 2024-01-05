#using script_590bc513b5881751;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\core_common\vehicle_ai_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace ac130;

/*
	Name: function_ce273ac5
	Namespace: ac130
	Checksum: 0xBA34087F
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ce273ac5()
{
	level notify(-653782628);
}

#namespace namespace_7ef26eea;

/*
	Name: __init__system__
	Namespace: namespace_7ef26eea
	Checksum: 0x59A967DE
	Offset: 0xD8
	Size: 0x54
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"ac130", &function_70a657d8, undefined, &function_3675de8b, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_7ef26eea
	Checksum: 0x21170833
	Offset: 0x138
	Size: 0x5E
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	player::function_cf3aa03d(&function_d45a1f8d, 1);
	level.var_f987766c = &spawnac130;
	namespace_2d34cefc::function_70a657d8("killstreak_ac130");
}

/*
	Name: function_3675de8b
	Namespace: namespace_7ef26eea
	Checksum: 0xE13769EC
	Offset: 0x1A0
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_3675de8b()
{
	namespace_2d34cefc::function_3675de8b();
}

/*
	Name: spawnac130
	Namespace: namespace_7ef26eea
	Checksum: 0xBF84859
	Offset: 0x1C0
	Size: 0x118
	Parameters: 1
	Flags: Linked, Private
*/
function private spawnac130(killstreaktype)
{
	player = self;
	player endon(#"disconnect");
	level endon(#"game_ended");
	/#
		assert(!isdefined(level.ac130));
	#/
	var_b0b764aa = namespace_2d34cefc::spawnac130(killstreaktype);
	if(var_b0b764aa && isbot(player))
	{
		level.ac130 thread namespace_2d34cefc::function_a514a080(player);
	}
	util::function_a3f7de13(21, player.team, player getentitynumber(), level.killstreaks[#"ac130"].uiname);
	return var_b0b764aa;
}

/*
	Name: function_d45a1f8d
	Namespace: namespace_7ef26eea
	Checksum: 0x22BD7EEF
	Offset: 0x2E0
	Size: 0x16C
	Parameters: 9
	Flags: Linked
*/
function function_d45a1f8d(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!isdefined(shitloc) || !isdefined(shitloc.owner) || !isdefined(psoffsettime) || self.team === psoffsettime.team || !isdefined(deathanimduration))
	{
		return;
	}
	if(shitloc.owner == psoffsettime && deathanimduration.statname == "ac130")
	{
		if(deathanimduration == getweapon(#"hash_17df39d53492b0bf"))
		{
			var_f9e67747 = 0;
		}
		else
		{
			if(deathanimduration == getweapon(#"hash_7b24d0d0d2823bca"))
			{
				var_f9e67747 = 1;
			}
			else
			{
				var_f9e67747 = 2;
			}
		}
		if(isdefined(level.ac130))
		{
			level.ac130 namespace_2d34cefc::function_631f02c5(var_f9e67747);
		}
	}
}

/*
	Name: function_6b26dd0c
	Namespace: namespace_7ef26eea
	Checksum: 0xE157DAF9
	Offset: 0x458
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function function_6b26dd0c(player)
{
	self endon(#"death", #"ac130_shutdown");
	player endon(#"disconnect");
	wait(2);
	player thread namespace_2d34cefc::function_8721028e(player, 0, 1);
}

