#using script_383a3b1bb18ba876;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_db2eee11;

/*
	Name: function_cb3215c8
	Namespace: namespace_db2eee11
	Checksum: 0x4386C287
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_cb3215c8()
{
	level notify(164037560);
}

/*
	Name: function_89f2df9
	Namespace: namespace_db2eee11
	Checksum: 0x5683568C
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_1b51a976dc0202c7", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_db2eee11
	Checksum: 0xD1529033
	Offset: 0x108
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(isdefined(level.killstreakrules[#"hero_weapons"]))
	{
		killstreakrules::addkillstreaktorule("hero_flamethrower", "hero_weapons", 0, 0);
	}
}

