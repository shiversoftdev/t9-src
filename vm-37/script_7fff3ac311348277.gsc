#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_equipment.gsc;

#namespace sticky_grenade;

/*
	Name: function_89f2df9
	Namespace: sticky_grenade
	Checksum: 0x85CBE359
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"sticky_grenade", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: sticky_grenade
	Checksum: 0x56F1F6FD
	Offset: 0xD8
	Size: 0x64
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	zm::function_84d343d(#"eq_acid_bomb", &function_140f2522);
	zm::function_84d343d(#"hash_246c869c9de45f07", &function_140f2522);
}

/*
	Name: function_140f2522
	Namespace: sticky_grenade
	Checksum: 0x58BFE8E6
	Offset: 0x148
	Size: 0x80
	Parameters: 12
	Flags: None
*/
function function_140f2522(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype)
{
	if(surfacetype === "MOD_IMPACT")
	{
		return 0;
	}
	return boneindex;
}

