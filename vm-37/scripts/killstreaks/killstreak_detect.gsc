#using scripts\core_common\system_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace killstreak_detect;

/*
	Name: __init__system__
	Namespace: killstreak_detect
	Checksum: 0xC9BE094D
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"killstreak_detect", &init_shared, undefined, undefined, undefined);
}

/*
	Name: init_shared
	Namespace: killstreak_detect
	Checksum: 0xAA9F57FE
	Offset: 0x120
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function init_shared()
{
	if(!isdefined(level.cathedral_sitting))
	{
		level.cathedral_sitting = {};
		clientfield::register("vehicle", "enemyvehicle", 1, 2, "int");
		clientfield::register("scriptmover", "enemyvehicle", 1, 2, "int");
		clientfield::register("missile", "enemyvehicle", 1, 2, "int");
		clientfield::register("actor", "enemyvehicle", 1, 2, "int");
		clientfield::register("vehicle", "vehicletransition", 1, 1, "int");
	}
}

/*
	Name: killstreaktargetset
	Namespace: killstreak_detect
	Checksum: 0x99E0FDF5
	Offset: 0x240
	Size: 0x5C
	Parameters: 2
	Flags: Linked
*/
function killstreaktargetset(killstreakentity, offset)
{
	if(!isdefined(offset))
	{
		offset = (0, 0, 0);
	}
	target_set(killstreakentity, offset);
	/#
		killstreakentity thread killstreak_hacking::killstreak_switch_team(killstreakentity.owner);
	#/
}

/*
	Name: killstreaktargetclear
	Namespace: killstreak_detect
	Checksum: 0x64C16B2
	Offset: 0x2A8
	Size: 0x3C
	Parameters: 1
	Flags: None
*/
function killstreaktargetclear(killstreakentity)
{
	target_remove(killstreakentity);
	/#
		killstreakentity thread killstreak_hacking::killstreak_switch_team_end();
	#/
}

