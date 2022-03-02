#using script_136606144df0f9f1;
#using script_19f3d8b7a687a3f1;
#using script_34c3e29c2c0c97ef;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_82b4c2d1;

/*
	Name: function_89f2df9
	Namespace: namespace_82b4c2d1
	Checksum: 0x276E2E04
	Offset: 0xC8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_79fe34c9f8a0e44c", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_82b4c2d1
	Checksum: 0x9A061FB8
	Offset: 0x120
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
	Offset: 0x1A0
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
	Checksum: 0x2A2F317C
	Offset: 0x1B0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function perk_machine_rob(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && isdefined(self))
	{
		self function_bf9d3071(#"hash_e8f3d55b3b05c7e");
	}
}

