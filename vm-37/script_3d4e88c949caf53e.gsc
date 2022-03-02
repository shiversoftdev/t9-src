#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\load.csc;

#namespace bgb_pack;

/*
	Name: function_89f2df9
	Namespace: bgb_pack
	Checksum: 0xE9B69F8D
	Offset: 0x90
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"bgb_pack", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: bgb_pack
	Checksum: 0xCF73C4CE
	Offset: 0xE8
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
}

/*
	Name: function_8ac3bea9
	Namespace: bgb_pack
	Checksum: 0xC9167902
	Offset: 0x110
	Size: 0x20
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	if(!is_true(level.bgb_in_use))
	{
		return;
	}
}

