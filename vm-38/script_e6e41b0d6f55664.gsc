#using script_383a3b1bb18ba876;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_f7a26881;

/*
	Name: function_c6e7f535
	Namespace: namespace_f7a26881
	Checksum: 0x852179BD
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c6e7f535()
{
	level notify(1204592039);
}

/*
	Name: function_89f2df9
	Namespace: namespace_f7a26881
	Checksum: 0xADA1A63F
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_17158d9655e9dc58", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_f7a26881
	Checksum: 0xA3AD9DC3
	Offset: 0x108
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(isdefined(level.killstreakrules[#"hero_weapons"]))
	{
		killstreakrules::addkillstreaktorule("hero_annihilator", "hero_weapons", 0, 0);
	}
}

