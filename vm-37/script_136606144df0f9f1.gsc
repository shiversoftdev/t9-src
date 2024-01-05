#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_791d0451;

/*
	Name: __init__system__
	Namespace: namespace_791d0451
	Checksum: 0x767ED90E
	Offset: 0xE0
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2d064899850813e2", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_791d0451
	Checksum: 0xCFA0A034
	Offset: 0x138
	Size: 0x1BC
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register_clientuimodel("zm_perks_per_controller.count", #"hash_8428dd5c1279587", #"count", 1, 4, "int", undefined, 0, 0);
	for(i = 1; i <= 9; i++)
	{
		clientfield::register_clientuimodel(("zm_perks_per_controller." + i) + ".itemIndex", #"hash_8428dd5c1279587", [1:#"itemindex", 0:hash((isdefined(i) ? "" + i : ""))], 1, 8, "int", undefined, 0, 0);
		clientfield::register_clientuimodel(("zm_perks_per_controller." + i) + ".lost", #"hash_8428dd5c1279587", [1:#"lost", 0:hash((isdefined(i) ? "" + i : ""))], 1, 1, "int", undefined, 0, 0);
	}
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_791d0451
	Checksum: 0x80F724D1
	Offset: 0x300
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

