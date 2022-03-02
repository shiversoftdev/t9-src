#namespace map;

/*
	Name: function_b9741ef8
	Namespace: map
	Checksum: 0xECE30B7E
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b9741ef8()
{
	level notify(989279992);
}

/*
	Name: init
	Namespace: map
	Checksum: 0x97E0CD6D
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function init()
{
	get_script_bundle();
}

/*
	Name: get_script_bundle
	Namespace: map
	Checksum: 0x2CF17800
	Offset: 0xA0
	Size: 0x72
	Parameters: 0
	Flags: Linked
*/
function get_script_bundle()
{
	if(!isdefined(level.var_427d6976))
	{
		level.var_427d6976 = function_2717b55f();
	}
	if(!isdefined(level.var_427d6976))
	{
		level.var_179eaba8 = 1;
		level.var_427d6976 = {};
	}
	else
	{
		level.var_179eaba8 = 0;
	}
	return level.var_427d6976;
}

/*
	Name: is_default
	Namespace: map
	Checksum: 0xD66F871A
	Offset: 0x120
	Size: 0x2E
	Parameters: 0
	Flags: None
*/
function is_default()
{
	if(!isdefined(level.var_179eaba8))
	{
		level.var_179eaba8 = 1;
	}
	return level.var_179eaba8;
}

/*
	Name: function_596f8772
	Namespace: map
	Checksum: 0x65407BD2
	Offset: 0x158
	Size: 0x144
	Parameters: 0
	Flags: Linked
*/
function function_596f8772()
{
	var_427d6976 = get_script_bundle();
	if(isdefined(var_427d6976.factionlist))
	{
		factionlist = getscriptbundle(var_427d6976.factionlist);
	}
	else
	{
		switch(currentsessionmode())
		{
			case 0:
			{
				faction = #"hash_4c048298ead49860";
				break;
			}
			case 1:
			{
				faction = #"factions_mp";
				break;
			}
			case 2:
			{
				faction = #"hash_4baf8998ea8c6446";
				break;
			}
			case 3:
			{
				faction = #"factions_wz";
				break;
			}
		}
		factionlist = getscriptbundle(faction);
	}
	if(isdefined(factionlist.faction))
	{
		return factionlist;
	}
	return undefined;
}

