#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_4ea0b0e1;

/*
	Name: function_89f2df9
	Namespace: namespace_4ea0b0e1
	Checksum: 0x72ECD717
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_3092c343f49326ae", &function_c7f33cce, undefined, undefined, undefined);
}

/*
	Name: function_c7f33cce
	Namespace: namespace_4ea0b0e1
	Checksum: 0xA15D9E7E
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: Private
*/
function private function_c7f33cce()
{
	function_bc948200();
}

/*
	Name: function_bc948200
	Namespace: namespace_4ea0b0e1
	Checksum: 0xFDF9146F
	Offset: 0x138
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function function_bc948200()
{
	clientfield::register("toplayer", "return_to_combat_postfx", 1, 1, "int", &function_f343c90c, 0, 0);
}

/*
	Name: function_f343c90c
	Namespace: namespace_4ea0b0e1
	Checksum: 0x18FE086B
	Offset: 0x190
	Size: 0xFC
	Parameters: 7
	Flags: Private
*/
function private function_f343c90c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	if(bwastimejump == 1)
	{
		if(self postfx::function_556665f2("pstfx_t9_cp_sepia"))
		{
			self postfx::stoppostfxbundle("pstfx_t9_cp_sepia");
		}
		self postfx::playpostfxbundle("pstfx_t9_cp_sepia");
	}
	else if(self postfx::function_556665f2("pstfx_t9_cp_sepia"))
	{
		self postfx::stoppostfxbundle("pstfx_t9_cp_sepia");
	}
}

