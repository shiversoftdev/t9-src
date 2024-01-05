#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace aimappingtableutility;

/*
	Name: setmappingtableforteam
	Namespace: aimappingtableutility
	Checksum: 0xFAAA0E44
	Offset: 0x88
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
	Checksum: 0x6E6BD106
	Offset: 0xD0
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

