#using scripts\mp_common\player\player_utils.gsc;
#using scripts\core_common\battlechatter.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using script_4721de209091b1a6;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;

#namespace helicopter;

/*
	Name: __init__system__
	Namespace: helicopter
	Checksum: 0x35CD3DF8
	Offset: 0x138
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"helicopter_guard", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: helicopter
	Checksum: 0x1C49BCA5
	Offset: 0x188
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
	if(sessionmodeiswarzonegame())
	{
		bundle = "killstreak_helicopter_guard_wz";
	}
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		killstreaks::register_killstreak(bundle, &usekillstreakhelicopter);
	}
	init_shared();
	player::function_cf3aa03d(&function_d45a1f8d, 0);
}

/*
	Name: function_6af968ce
	Namespace: helicopter
	Checksum: 0xDDBEDF8F
	Offset: 0x298
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
	Checksum: 0x5E3BD6F
	Offset: 0x3F8
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
	Checksum: 0xAEC95BB3
	Offset: 0x410
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
	Checksum: 0x935893D6
	Offset: 0x560
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
	if(shitloc.owner == psoffsettime && deathanimduration == getweapon(#"cobra_20mm_comlink") && (isdefined(shitloc.lastkillvo) ? shitloc.lastkillvo : 0) < gettime())
	{
		shitloc namespace_f9b02f80::play_pilot_dialog_on_owner("kill", "helicopter_guard", shitloc.killstreak_id);
		shitloc.lastkillvo = gettime() + 5000;
	}
}

