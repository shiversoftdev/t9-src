#using scripts\killstreaks\killstreakrules_shared.gsc;

#namespace killstreakrules;

/*
	Name: init
	Namespace: killstreakrules
	Checksum: 0xC82C9E9E
	Offset: 0x190
	Size: 0x54C
	Parameters: 0
	Flags: None
*/
function init()
{
	init_shared();
	level.var_956bde25 = &function_65739e7b;
	createrule("ac130", 1, 1);
	createrule("tank_robot", 2, 1);
	createrule("airsupport", 1, 1);
	createrule("artillery_barrage", 1, 1);
	createrule("chopper", 2, 1);
	createrule("chopperInTheAir", 2, 1);
	createrule("dog", 1, 1);
	createrule("drone_squadron", 4, 2);
	createrule("playercontrolledchopper", 1, 1);
	createrule("qrdrone", 3, 2);
	createrule("uav", 10, 5);
	createrule("remote_missile", 2, 1);
	createrule("targetableent", 32, 32);
	createrule("turret", 8, 4);
	createrule("ultimate_turret", 8, 4);
	createrule("vehicle", 7, 7);
	addkillstreaktorule("ac130", "ac130", 1, 1);
	addkillstreaktorule("tank_robot", "tank_robot", 1, 1);
	addkillstreaktorule("artillery_barrage", "artillery_barrage", 1, 1);
	addkillstreaktorule("dog", "dog", 1, 1);
	addkillstreaktorule("drone_squadron", "drone_squadron", 1, 1);
	addkillstreaktorule("helicopter_comlink", "chopper", 1, 1);
	addkillstreaktorule("helicopter_comlink", "chopperInTheAir", 1, 0);
	addkillstreaktorule("helicopter_comlink", "targetableent", 1, 1);
	addkillstreaktorule("helicopter_comlink", "vehicle", 1, 1);
	addkillstreaktorule("helicopter_guard", "airsupport", 1, 1);
	addkillstreaktorule("attack_helicopter", "chopperInTheAir", 1, 0);
	addkillstreaktorule("attack_helicopter", "playercontrolledchopper", 1, 1);
	addkillstreaktorule("attack_helicopter", "targetableent", 1, 1);
	addkillstreaktorule("attack_helicopter", "vehicle", 1, 1);
	addkillstreaktorule("uav", "uav", 1, 1);
	addkillstreaktorule("uav", "targetableent", 1, 1);
	addkillstreaktorule("ultimate_turret", "turret", 1, 1);
	addkillstreaktorule("ultimate_turret", "ultimate_turret", 1, 1);
	addkillstreaktorule("remote_missile", "targetableent", 1, 1);
	addkillstreaktorule("remote_missile", "remote_missile", 1, 1);
}

/*
	Name: function_65739e7b
	Namespace: killstreakrules
	Checksum: 0xB0FF70E7
	Offset: 0x6E8
	Size: 0xA4
	Parameters: 3
	Flags: None
*/
function function_65739e7b(type, team, isemped)
{
	if(isdefined(level.killstreaks[isemped]) && isdefined(level.killstreaks[isemped].script_bundle) && isdefined(level.killstreaks[isemped].script_bundle.var_502a0e23))
	{
		self iprintlnbold(level.killstreaks[isemped].script_bundle.var_502a0e23);
	}
}

