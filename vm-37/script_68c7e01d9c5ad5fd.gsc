#using script_31816d064a53f516;
#using script_ac6a30f1991e105;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\struct.csc;

#namespace namespace_146875e;

/*
	Name: init
	Namespace: namespace_146875e
	Checksum: 0x48D60417
	Offset: 0x1C8
	Size: 0x114
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_gladiator_destroyer");
	function_cae618b4("spawner_zombietron_gladiator_marauder");
	level._effect[#"fx8_destroyer_arm_spurt"] = "zm_ai/fx8_destroyer_arm_spurt";
	footsteps::registeraitypefootstepcb(#"gladiator", &function_918ce680);
	clientfield::register("toplayer", "gladiator_melee_effect", 1, 1, "counter", &function_5dae94f, 0, 0);
	clientfield::register("actor", "gladiator_arm_effect", 1, 2, "int", &function_f5a07d57, 0, 0);
}

/*
	Name: function_918ce680
	Namespace: namespace_146875e
	Checksum: 0x6516DA4
	Offset: 0x2E8
	Size: 0x1B4
	Parameters: 5
	Flags: Linked, Private
*/
function private function_918ce680(localclientnum, pos, surface, notetrack, bone)
{
	e_player = function_5c10bd79(notetrack);
	n_dist = distancesquared(bone, e_player.origin);
	var_dfce5acd = 1000000;
	if(var_dfce5acd > 0)
	{
		n_scale = (var_dfce5acd - n_dist) / var_dfce5acd;
	}
	else
	{
		return;
	}
	if(n_scale > 1 || n_scale < 0)
	{
		return;
	}
	n_scale = n_scale * 0.25;
	if(n_scale <= 0.01)
	{
		return;
	}
	earthquake(notetrack, n_scale, 0.1, bone, n_dist);
	if(n_scale <= 0.25 && n_scale > 0.2)
	{
		function_36e4ebd4(notetrack, "anim_med");
	}
	else
	{
		if(n_scale <= 0.2 && n_scale > 0.1)
		{
			function_36e4ebd4(notetrack, "damage_light");
		}
		else
		{
			function_36e4ebd4(notetrack, "damage_light");
		}
	}
}

/*
	Name: function_5dae94f
	Namespace: namespace_146875e
	Checksum: 0xD69EE263
	Offset: 0x4A8
	Size: 0x8C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_5dae94f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	earthquake(bwastimejump, 0.3, 1.2, self.origin, 64);
	function_36e4ebd4(bwastimejump, "damage_light");
}

/*
	Name: function_f5a07d57
	Namespace: namespace_146875e
	Checksum: 0x1AD5A903
	Offset: 0x540
	Size: 0xCC
	Parameters: 7
	Flags: Linked, Private
*/
function private function_f5a07d57(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		util::playfxontag(fieldname, level._effect[#"fx8_destroyer_arm_spurt"], self, "j_shouldertwist_le");
	}
	else if(bwastimejump == 2)
	{
		util::playfxontag(fieldname, level._effect[#"fx8_destroyer_arm_spurt"], self, "tag_shoulder_ri_fx");
	}
}

