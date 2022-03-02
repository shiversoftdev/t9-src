#using script_742a01a2b6a9bb07;
#using script_ac6a30f1991e105;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_d1abdcb5;

/*
	Name: init
	Namespace: namespace_d1abdcb5
	Checksum: 0x5C4EDA4D
	Offset: 0x1B0
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_skeleton");
	function_cae618b4("spawner_zombietron_skeleton_giant");
	clientfield::register("scriptmover", "" + #"hash_26686fdfe90ecd97", 1, 1, "int", &function_d83c0144, 0, 0);
	clientfield::register("actor", "" + #"hash_3a6a3e4ef0a1a999", 1, 1, "counter", &function_9e6319c8, 0, 0);
	clientfield::register("actor", "skel_spawn_fx", 1, 1, "counter", &skel_spawn_fx, 0, 0);
	ai::add_archetype_spawn_function(#"skeleton", &skeletonspawnsetup);
	ai::add_archetype_spawn_function(#"skeleton", &function_3b8e5273);
}

/*
	Name: skel_spawn_fx
	Namespace: namespace_d1abdcb5
	Checksum: 0xE0B4374E
	Offset: 0x348
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function skel_spawn_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	util::playfxontag(bwasdemojump, level._effect[#"lightning_dog_spawn"], self, "j_spine2");
}

/*
	Name: skeletonspawnsetup
	Namespace: namespace_d1abdcb5
	Checksum: 0x67A12C98
	Offset: 0x3C8
	Size: 0x4C
	Parameters: 1
	Flags: Linked, Private
*/
function private skeletonspawnsetup(localclientnum)
{
	self util::waittill_dobj(localclientnum);
	if(isdefined(self))
	{
		fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
	}
}

/*
	Name: function_3b8e5273
	Namespace: namespace_d1abdcb5
	Checksum: 0x312889FB
	Offset: 0x420
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3b8e5273(localclientnum)
{
	if(self.var_9fde8624 === #"hash_342763a42d8fbca" || self.var_9fde8624 === #"hash_fd7b9665529dd42")
	{
		if(!is_true(level.var_a08217e1))
		{
			level.var_a08217e1 = 1;
			forcestreamxmodel(#"c_t8_zmb_dlc2_skeleton_shield");
			wait(3);
			stopforcestreamingxmodel(#"c_t8_zmb_dlc2_skeleton_shield");
			level.var_a08217e1 = 0;
		}
	}
}

/*
	Name: function_d83c0144
	Namespace: namespace_d1abdcb5
	Checksum: 0x8B5C5944
	Offset: 0x4E8
	Size: 0xBC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d83c0144(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump == 1)
	{
		self.fx = function_239993de(fieldname, "zm_ai/fx8_spartoi_reassemble_displace_trail", self, "tag_origin");
	}
	else
	{
		stopfx(fieldname, self.fx);
	}
}

/*
	Name: function_9e6319c8
	Namespace: namespace_d1abdcb5
	Checksum: 0xF48CFB30
	Offset: 0x5B0
	Size: 0x114
	Parameters: 7
	Flags: Linked, Private
*/
function private function_9e6319c8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwastimejump == 1)
	{
		point = self gettagorigin("j_skeleton_shield");
		if(!isdefined(point))
		{
			return;
		}
		angles = self.angles;
		forward = anglestoforward(angles);
		up = anglestoup(angles);
		playfx(fieldname, "impacts/fx8_bul_impact_metal_lg", point, forward, up);
	}
}

