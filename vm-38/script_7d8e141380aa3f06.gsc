#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_67dab37c;

/*
	Name: function_c5a3de7b
	Namespace: namespace_67dab37c
	Checksum: 0x27560953
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c5a3de7b()
{
	level notify(178078888);
}

#namespace namespace_fa39a5c3;

/*
	Name: function_89f2df9
	Namespace: namespace_fa39a5c3
	Checksum: 0x797C6C83
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5a3be2f74ac4fe03", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_fa39a5c3
	Checksum: 0xF37BB6F8
	Offset: 0x108
	Size: 0x5C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	clientfield::register("toplayer", "" + #"hash_69dc133e22a2769f", 16000, 1, "int", &function_6b66a9a3, 0, 0);
}

/*
	Name: function_2376fab8
	Namespace: namespace_fa39a5c3
	Checksum: 0x6040C3ED
	Offset: 0x170
	Size: 0x9A
	Parameters: 7
	Flags: None
*/
function function_2376fab8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		util::playfxontag(fieldname, #"hash_48761360bb67e8a9", self, "tag_origin");
		self.var_a3b04735 = self playloopsound(#"hash_722697efdfb3562f");
	}
}

/*
	Name: function_6b66a9a3
	Namespace: namespace_fa39a5c3
	Checksum: 0x7AB28457
	Offset: 0x218
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_6b66a9a3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		forcestreamxmodel(#"p9_fxp_zm_teleport_tunnel");
		forcestreamxmodel(#"p9_fxp_zm_teleport_tunnel_edge");
		function_3385d776(#"zombie/fx9_aether_tear_portal_tunnel_1p");
	}
	else
	{
		stopforcestreamingxmodel(#"p9_fxp_zm_teleport_tunnel");
		stopforcestreamingxmodel(#"p9_fxp_zm_teleport_tunnel_edge");
		function_c22a1ca2(#"zombie/fx9_aether_tear_portal_tunnel_1p");
	}
}

