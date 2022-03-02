#using scripts\core_common\struct.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace aimappingtable;

/*
	Name: function_77f4a80
	Namespace: aimappingtable
	Checksum: 0x9374E14F
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_77f4a80()
{
	level notify(357846307);
}

#namespace aimappingtableutility;

/*
	Name: setmappingtableforteam
	Namespace: aimappingtableutility
	Checksum: 0x9B1F945C
	Offset: 0xA8
	Size: 0x3C
	Parameters: 2
	Flags: None
*/
function setmappingtableforteam(str_team, aimappingtable)
{
	str_team = util::get_team_mapping(str_team);
	level.aimapppingtable[str_team] = aimappingtable;
}

/*
	Name: getspawnerforai
	Namespace: aimappingtableutility
	Checksum: 0x1DE36DDF
	Offset: 0xF0
	Size: 0x100
	Parameters: 3
	Flags: None
*/
function getspawnerforai(ai, team, str_mapping_table_override)
{
	if(!isdefined(ai))
	{
		return undefined;
	}
	aimappingtable = undefined;
	if(isdefined(str_mapping_table_override))
	{
		aimappingtable = str_mapping_table_override;
	}
	else if(isdefined(level.aimapppingtable) && isdefined(level.aimapppingtable[team]))
	{
		aimappingtable = level.aimapppingtable[team];
	}
	if(!isdefined(aimappingtable))
	{
		return undefined;
	}
	aimappingtablebundle = getscriptbundle(aimappingtable);
	if(!isdefined(aimappingtablebundle))
	{
		return undefined;
	}
	aitype = aimappingtablebundle.("aitype_" + ai);
	if(isdefined(aitype))
	{
		return aitype;
	}
	return aimappingtablebundle.("vehicle_" + ai);
}

