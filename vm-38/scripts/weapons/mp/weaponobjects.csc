#using scripts\weapons\weaponobjects.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace weaponobjects;

/*
	Name: function_56d57875
	Namespace: weaponobjects
	Checksum: 0x3710BDAE
	Offset: 0x120
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_56d57875()
{
	level notify(-783763672);
}

/*
	Name: __init__system__
	Namespace: weaponobjects
	Checksum: 0xE7FF0B14
	Offset: 0x140
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"weaponobjects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: weaponobjects
	Checksum: 0xDFDD32C0
	Offset: 0x188
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared((sessionmodeiscampaigngame() ? #"rob_sonar_set_friendlyequip_cp" : #"rob_sonar_set_friendlyequip_mp"), #"rob_sonar_set_enemyequip");
	level setupscriptmovercompassicons();
	level setupmissilecompassicons();
}

/*
	Name: setupscriptmovercompassicons
	Namespace: weaponobjects
	Checksum: 0x85CB466B
	Offset: 0x218
	Size: 0xDC
	Parameters: 0
	Flags: Linked
*/
function setupscriptmovercompassicons()
{
	if(!isdefined(level.scriptmovercompassicons))
	{
		level.scriptmovercompassicons = [];
	}
	level.scriptmovercompassicons[#"wpn_t7_turret_emp_core"] = "compass_empcore_white";
	level.scriptmovercompassicons[#"t6_wpn_turret_ads_world"] = "compass_guardian_white";
	level.scriptmovercompassicons[#"veh_t7_drone_uav_enemy_vista"] = "compass_uav";
	level.scriptmovercompassicons[#"veh_t7_mil_vtol_fighter_mp"] = "compass_lightningstrike";
	level.scriptmovercompassicons[#"veh_t7_drone_rolling_thunder"] = "compass_lodestar";
	level.scriptmovercompassicons[#"veh_t7_drone_srv_blimp"] = "t7_hud_minimap_hatr";
}

/*
	Name: setupmissilecompassicons
	Namespace: weaponobjects
	Checksum: 0x2B206968
	Offset: 0x300
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function setupmissilecompassicons()
{
	if(!isdefined(level.missilecompassicons))
	{
		level.missilecompassicons = [];
	}
	if(isdefined(getweapon(#"drone_strike")))
	{
		level.missilecompassicons[getweapon(#"drone_strike")] = "compass_lodestar";
	}
}

