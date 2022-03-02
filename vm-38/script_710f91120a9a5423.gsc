#using script_383a3b1bb18ba876;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_5e75c551;

/*
	Name: function_463dfb13
	Namespace: namespace_5e75c551
	Checksum: 0x27B0F867
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_463dfb13()
{
	level notify(1749282639);
}

/*
	Name: function_89f2df9
	Namespace: namespace_5e75c551
	Checksum: 0x18AB9179
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7bd5e0fb2a57c52f", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_5e75c551
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
		killstreakrules::addkillstreaktorule("napalm_strike_zm", "hero_weapons", 0, 0);
	}
}

