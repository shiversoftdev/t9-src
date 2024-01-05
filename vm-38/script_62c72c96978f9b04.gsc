#using script_2d7a84fdf413563d;
#using script_19f3d8b7a687a3f1;
#using scripts\zm_common\zm_fasttravel.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_dbb31ff3;

/*
	Name: function_85a597ad
	Namespace: namespace_dbb31ff3
	Checksum: 0xF5F65463
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_85a597ad()
{
	level notify(230615350);
}

/*
	Name: __init__system__
	Namespace: namespace_dbb31ff3
	Checksum: 0x21E75237
	Offset: 0xD0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_7bb41176a4b58056", &function_70a657d8, undefined, &finalize, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_dbb31ff3
	Checksum: 0x9189626F
	Offset: 0x120
	Size: 0xD4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	sr_beacon_menu::register();
	clientfield::register("toplayer", "" + #"hash_5616eb8cc6b9c498", 1, 1, "counter", &function_595556d0, 0, 0);
	clientfield::register("toplayer", "" + #"hash_5752601fd90562e1", 1, 1, "counter", &function_cc5db8e3, 0, 0);
	namespace_52c8f34d::function_70a657d8();
}

/*
	Name: finalize
	Namespace: namespace_dbb31ff3
	Checksum: 0x80F724D1
	Offset: 0x200
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private finalize()
{
}

/*
	Name: function_595556d0
	Namespace: namespace_dbb31ff3
	Checksum: 0x2EA87CC0
	Offset: 0x210
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_595556d0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	forcestreamxmodel(#"p9_fxp_zm_teleport_tunnel");
	forcestreamxmodel(#"p9_fxp_zm_teleport_tunnel_edge");
	function_3385d776(#"zombie/fx9_aether_tear_portal_tunnel_1p");
	self.var_915bbac = 1;
	playsound(bwastimejump, #"hash_df74ba2c210beef", (0, 0, 0));
	wait(3);
	self postfx::playpostfxbundle(#"hash_7fbc9bc489aea188");
}

/*
	Name: function_cc5db8e3
	Namespace: namespace_dbb31ff3
	Checksum: 0x8A26F792
	Offset: 0x328
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_cc5db8e3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	stopforcestreamingxmodel(#"p9_fxp_zm_teleport_tunnel");
	stopforcestreamingxmodel(#"p9_fxp_zm_teleport_tunnel_edge");
	function_c22a1ca2(#"zombie/fx9_aether_tear_portal_tunnel_1p");
}

