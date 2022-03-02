#using script_2c49ae69cd8ce30c;
#using script_3fda550bc6e1089a;
#using script_4721de209091b1a6;
#using script_47fb62300ac0bd60;
#using script_6c8abe14025b47c4;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\challenges.gsc;

#namespace helicopter_guard;

/*
	Name: function_9adb801
	Namespace: helicopter_guard
	Checksum: 0x3009C1F6
	Offset: 0x138
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9adb801()
{
	level notify(1198042134);
}

#namespace helicopter;

/*
	Name: function_89f2df9
	Namespace: helicopter
	Checksum: 0x1E5C1A04
	Offset: 0x158
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"helicopter_guard", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: helicopter
	Checksum: 0xA2AAD656
	Offset: 0x1A8
	Size: 0x104
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_34f03cda = &function_34f03cda;
	level.var_4d5e1035 = &function_4d5e1035;
	level.var_6af968ce = &function_6af968ce;
	bundle = "killstreak_helicopter_guard";
	if(function_f99d2668())
	{
		bundle = "killstreak_helicopter_guard_wz";
	}
	if(sessionmodeismultiplayergame() || function_f99d2668())
	{
		killstreaks::function_e4ef8390(bundle, &usekillstreakhelicopter);
	}
	init_shared();
	player::function_cf3aa03d(&function_d45a1f8d, 0);
}

/*
	Name: function_6af968ce
	Namespace: helicopter
	Checksum: 0xB40CDB06
	Offset: 0x2B8
	Size: 0x158
	Parameters: 3
	Flags: Linked
*/
function function_6af968ce(attacker, weapon, mod)
{
	if(isdefined(attacker) && isplayer(attacker))
	{
		if(!isdefined(self.owner) || self.owner util::isenemyplayer(attacker))
		{
			attacker battlechatter::function_eebf94f6(self.killstreaktype);
			self killstreaks::function_73566ec7(attacker, weapon, self.owner);
			challenges::destroyedhelicopter(attacker, weapon, mod, 0, self);
			attacker challenges::addflyswatterstat(weapon, self);
			attacker stats::function_e24eec31(weapon, #"hash_3f3d8a93c372c67d", 1);
		}
	}
	if(self.leaving !== 1)
	{
		self namespace_f9b02f80::play_destroyed_dialog_on_owner(self.killstreaktype, self.killstreak_id);
		attacker notify(#"destroyedaircraft");
	}
}

/*
	Name: function_34f03cda
	Namespace: helicopter
	Checksum: 0x78A38FCD
	Offset: 0x418
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function function_34f03cda(hardpointtype)
{
}

/*
	Name: function_4d5e1035
	Namespace: helicopter
	Checksum: 0xF79ADAAD
	Offset: 0x430
	Size: 0x148
	Parameters: 7
	Flags: Linked
*/
function function_4d5e1035(attacker, weapon, type, weapon_damage, event, playercontrolled, hardpointtype)
{
	if(weapon_damage > 0)
	{
		self challenges::trackassists(attacker, weapon_damage, 0);
	}
	if(isdefined(event))
	{
		if(isdefined(self.owner) && self.owner util::isenemyplayer(attacker))
		{
			challenges::destroyedhelicopter(attacker, weapon, type, playercontrolled, self);
			scoreevents::processscoreevent(event, attacker, self.owner, weapon);
			attacker challenges::addflyswatterstat(weapon, self);
			if(playercontrolled == 1)
			{
				attacker challenges::destroyedplayercontrolledaircraft();
			}
			if(hardpointtype == "helicopter_player_gunner")
			{
				attacker stats::function_e24eec31(weapon, #"destroyed_controlled_killstreak", 1);
			}
		}
	}
}

/*
	Name: function_d45a1f8d
	Namespace: helicopter
	Checksum: 0x2164BE41
	Offset: 0x580
	Size: 0x12E
	Parameters: 9
	Flags: Linked
*/
function function_d45a1f8d(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration)
{
	if(!isdefined(shitloc) || !isdefined(shitloc.owner) || !isdefined(psoffsettime) || !isdefined(deathanimduration))
	{
		return;
	}
	if(shitloc.owner == psoffsettime && deathanimduration == getweapon(#"cobra_20mm_comlink") && (isdefined(shitloc.var_6ac0633e) ? shitloc.var_6ac0633e : 0) < gettime())
	{
		shitloc namespace_f9b02f80::play_pilot_dialog_on_owner("kill", "helicopter_guard", shitloc.killstreak_id);
		shitloc.var_6ac0633e = gettime() + 5000;
	}
}

