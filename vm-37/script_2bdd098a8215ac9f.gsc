#using script_19f3d8b7a687a3f1;
#using script_36e0a146280ae23a;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_1cc7b406;

/*
	Name: function_89f2df9
	Namespace: namespace_1cc7b406
	Checksum: 0x6263B563
	Offset: 0xF8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_49e3cc2797ad6fbc", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_1cc7b406
	Checksum: 0x4C7D53B5
	Offset: 0x150
	Size: 0x74
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("scriptmover", "crafting_Table_spawn_fx", 1, 1, "int", &crafting_table_spawn_fx, 0, 0);
	level.var_3ed9fd33 = sr_crafting_table_menu::register();
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_1cc7b406
	Checksum: 0x80F724D1
	Offset: 0x1D0
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_8ac3bea9()
{
}

/*
	Name: crafting_table_spawn_fx
	Namespace: namespace_1cc7b406
	Checksum: 0x7654FB58
	Offset: 0x1E0
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function crafting_table_spawn_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_239993de(fieldname, "zombie/fx9_crafting_table_lantern", self, "lantern_jnt");
	}
}

