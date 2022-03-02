#using script_3706d21c449d0d14;
#using scripts\core_common\system_shared.gsc;

#namespace gadget_health_regen;

/*
	Name: function_e88479b5
	Namespace: gadget_health_regen
	Checksum: 0x2E891ACB
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e88479b5()
{
	level notify(1467164304);
}

/*
	Name: function_89f2df9
	Namespace: gadget_health_regen
	Checksum: 0xAC1BAF2E
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_282f48d36d893e20", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gadget_health_regen
	Checksum: 0x59059C20
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_f71267dc = &function_71343595;
	level.var_11e731d7 = &function_3211c56a;
}

/*
	Name: function_71343595
	Namespace: gadget_health_regen
	Checksum: 0x82180C7A
	Offset: 0x118
	Size: 0x42
	Parameters: 2
	Flags: Linked
*/
function function_71343595(var_b16fafc9, weapon)
{
	return int(gamedifficulty::function_b5b7d60e() * 1000);
}

/*
	Name: function_3211c56a
	Namespace: gadget_health_regen
	Checksum: 0x292BE9CB
	Offset: 0x168
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_3211c56a(var_337562a8)
{
	return int(gamedifficulty::function_5151f9d0() * 1000);
}

