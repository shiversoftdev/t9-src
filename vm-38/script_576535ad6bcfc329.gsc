#using scripts\core_common\ai\archetype_skeleton.csc;
#using script_ac6a30f1991e105;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_d1abdcb5;

/*
	Name: function_c5bf7016
	Namespace: namespace_d1abdcb5
	Checksum: 0xD910088
	Offset: 0x1B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c5bf7016()
{
	level notify(-159845557);
}

/*
	Name: init
	Namespace: namespace_d1abdcb5
	Checksum: 0xCF590BE2
	Offset: 0x1D0
	Size: 0x18C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_skeleton");
	function_cae618b4("spawner_zombietron_skeleton_giant");
	clientfield::register("scriptmover", "" + #"spartoi_reassemble_clientfield", 1, 1, "int", &function_d83c0144, 0, 0);
	clientfield::register("actor", "" + #"hash_3a6a3e4ef0a1a999", 1, 1, "counter", &function_9e6319c8, 0, 0);
	clientfield::register("actor", "skel_spawn_fx", 1, 1, "counter", &skel_spawn_fx, 0, 0);
	ai::add_archetype_spawn_function(#"skeleton", &skeletonspawnsetup);
	ai::add_archetype_spawn_function(#"skeleton", &function_3b8e5273);
}

/*
	Name: skel_spawn_fx
	Namespace: namespace_d1abdcb5
	Checksum: 0x3F2F7551
	Offset: 0x368
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
	Checksum: 0xAEADB02C
	Offset: 0x3E8
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
	Checksum: 0xF459C93B
	Offset: 0x440
	Size: 0xC0
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3b8e5273(localclientnum)
{
	if(self.var_9fde8624 === #"hash_342763a42d8fbca" || self.var_9fde8624 === #"hash_fd7b9665529dd42")
	{
		if(!is_true(level.shield_streaming))
		{
			level.shield_streaming = 1;
			forcestreamxmodel(#"c_t8_zmb_dlc2_skeleton_shield");
			wait(3);
			stopforcestreamingxmodel(#"c_t8_zmb_dlc2_skeleton_shield");
			level.shield_streaming = 0;
		}
	}
}

/*
	Name: function_d83c0144
	Namespace: namespace_d1abdcb5
	Checksum: 0x33727A0A
	Offset: 0x508
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
	Checksum: 0x7C36B8A6
	Offset: 0x5D0
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

