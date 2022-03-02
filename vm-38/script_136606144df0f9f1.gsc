#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_791d0451;

/*
	Name: function_e6b7801f
	Namespace: namespace_791d0451
	Checksum: 0xC47758A5
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e6b7801f()
{
	level notify(1007259283);
}

/*
	Name: function_89f2df9
	Namespace: namespace_791d0451
	Checksum: 0xC64A6EF9
	Offset: 0x100
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_2d064899850813e2", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_791d0451
	Checksum: 0x51DEC410
	Offset: 0x158
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::function_a8bbc967("zm_perks_per_controller.count", #"hash_8428dd5c1279587", #"count", 1, 4, "int", undefined, 0, 0);
	for(i = 1; i <= 9; i++)
	{
		clientfield::function_a8bbc967(("zm_perks_per_controller." + i) + ".itemIndex", #"hash_8428dd5c1279587", [1:#"itemindex", 0:hash((isdefined(i) ? "" + i : ""))], 1, 8, "int", undefined, 0, 0);
		clientfield::function_a8bbc967(("zm_perks_per_controller." + i) + ".lost", #"hash_8428dd5c1279587", [1:#"lost", 0:hash((isdefined(i) ? "" + i : ""))], 1, 2, "int", undefined, 0, 0);
	}
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_791d0451
	Checksum: 0x80F724D1
	Offset: 0x320
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

