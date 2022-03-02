#using script_3706d21c449d0d14;
#using scripts\core_common\system_shared.gsc;

#namespace gadget_health_regen;

/*
	Name: function_89f2df9
	Namespace: gadget_health_regen
	Checksum: 0x334085A
	Offset: 0x70
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
	Checksum: 0xD90AD7E4
	Offset: 0xB8
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.var_f71267dc = &function_71343595;
	level.var_11e731d7 = &function_3211c56a;
}

/*
	Name: function_71343595
	Namespace: gadget_health_regen
	Checksum: 0x28C5DF47
	Offset: 0xF8
	Size: 0x42
	Parameters: 2
	Flags: None
*/
function function_71343595(var_b16fafc9, weapon)
{
	return int(gamedifficulty::function_b5b7d60e() * 1000);
}

/*
	Name: function_3211c56a
	Namespace: gadget_health_regen
	Checksum: 0x3DED36AE
	Offset: 0x148
	Size: 0x3A
	Parameters: 1
	Flags: None
*/
function function_3211c56a(var_337562a8)
{
	return int(gamedifficulty::function_5151f9d0() * 1000);
}

