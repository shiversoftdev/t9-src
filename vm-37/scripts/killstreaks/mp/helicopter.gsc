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
#using scripts\core_common\callbacks_shared.gsc;

#namespace helicopter;

/*
	Name: __init__system__
	Namespace: helicopter
	Checksum: 0x35800A4F
	Offset: 0x188
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"helicopter", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: helicopter
	Checksum: 0xD74D8811
	Offset: 0x1D8
	Size: 0x144
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_34f03cda = &function_34f03cda;
	level.var_4d5e1035 = &function_4d5e1035;
	level.var_6af968ce = &function_6af968ce;
	callback::on_vehicle_killed(&on_vehicle_killed);
	bundle = "killstreak_helicopter_comlink";
	if(sessionmodeiswarzonegame())
	{
		bundle = bundle + "_wz";
	}
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		killstreaks::register_killstreak(bundle, &usekillstreakhelicopter);
		killstreaks::function_94c74046("helicopter_comlink");
	}
	init_shared();
	player::function_cf3aa03d(&function_d45a1f8d, 0);
}

/*
	Name: function_6af968ce
	Namespace: helicopter
	Checksum: 0xA06662C
	Offset: 0x328
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
	Checksum: 0x9ED63D3A
	Offset: 0x488
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_34f03cda(hardpointtype)
{
	if(hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink")
	{
		self challenges::calledincomlinkchopper();
	}
}

/*
	Name: function_4d5e1035
	Namespace: helicopter
	Checksum: 0xEC0A6E13
	Offset: 0x4D8
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
	Checksum: 0xDDB634E2
	Offset: 0x628
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
		shitloc namespace_f9b02f80::play_pilot_dialog_on_owner("kill", "helicopter_comlink", shitloc.killstreak_id);
		shitloc.lastkillvo = gettime() + 5000;
	}
}

/*
	Name: on_vehicle_killed
	Namespace: helicopter
	Checksum: 0x1148AA32
	Offset: 0x760
	Size: 0x104
	Parameters: 1
	Flags: Linked
*/
function on_vehicle_killed(params)
{
	vehicle = self;
	einflictor = params.einflictor;
	if(einflictor.killstreaktype === "helicopter_comlink" || einflictor.killstreaktype === "inventory_helicopter_comlink")
	{
		if(vehicle.vehicleclass === "plane" || vehicle.vehicleclass === "helicopter")
		{
			einflictor namespace_f9b02f80::play_pilot_dialog_on_owner("killAircraft", einflictor.killstreaktype, einflictor.killstreak_id);
		}
		else if(!vehicle.vehicleclass === "boat")
		{
			einflictor namespace_f9b02f80::play_pilot_dialog_on_owner("killGroundVehicle", einflictor.killstreaktype, einflictor.killstreak_id);
		}
	}
}

