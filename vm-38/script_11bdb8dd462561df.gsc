#using script_383a3b1bb18ba876;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_e321b666;

/*
	Name: function_f6388ae8
	Namespace: namespace_e321b666
	Checksum: 0xCA1B6B21
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f6388ae8()
{
	level notify(258407607);
}

/*
	Name: function_89f2df9
	Namespace: namespace_e321b666
	Checksum: 0x51C3BF90
	Offset: 0xB0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_4236b7e69638cde7", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: namespace_e321b666
	Checksum: 0x2EC2AD32
	Offset: 0x100
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	if(isdefined(level.killstreakrules[#"hero_weapons"]))
	{
		killstreakrules::addkillstreaktorule("sig_lmg", "hero_weapons", 0, 0);
	}
}

