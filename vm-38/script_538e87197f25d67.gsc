#using script_34c3e29c2c0c97ef;
#using script_19f3d8b7a687a3f1;
#using script_136606144df0f9f1;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_82b4c2d1;

/*
	Name: function_18cdbcee
	Namespace: namespace_82b4c2d1
	Checksum: 0xBBBA86E8
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_18cdbcee()
{
	level notify(-1710244318);
}

/*
	Name: __init__system__
	Namespace: namespace_82b4c2d1
	Checksum: 0xB545B6D0
	Offset: 0xE8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_79fe34c9f8a0e44c", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_82b4c2d1
	Checksum: 0x65B3625
	Offset: 0x140
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	level.var_5df76d0 = sr_perk_machine_choice::register();
	level clientfield::register("scriptmover", "perk_machine_rob", 1, 1, "int", &perk_machine_rob, 0, 0);
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_82b4c2d1
	Checksum: 0x80F724D1
	Offset: 0x1C0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: perk_machine_rob
	Namespace: namespace_82b4c2d1
	Checksum: 0xD93B391D
	Offset: 0x1D0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function perk_machine_rob(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && isdefined(self))
	{
		self playrenderoverridebundle(#"hash_e8f3d55b3b05c7e");
	}
}

