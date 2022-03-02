#using script_3728b3b9606c4299;
#using scripts\core_common\system_shared.gsc;

#namespace heatseekingmissile;

/*
	Name: function_89f2df9
	Namespace: heatseekingmissile
	Checksum: 0x9813242A
	Offset: 0x70
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"heatseekingmissile", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: heatseekingmissile
	Checksum: 0x9DAAD88B
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
}

