#using script_31816d064a53f516;
#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_2a445563;

/*
	Name: init
	Namespace: namespace_2a445563
	Checksum: 0xC67519BA
	Offset: 0x278
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_werewolf");
	clientfield::register("actor", "wrwlf_silver_death_fx", 1, 1, "int", &function_c65ce64a, 0, 0);
	clientfield::register("actor", "wrwlf_weakpoint_fx", 1, 2, "counter", &function_3f3f0d8, 0, 0);
	clientfield::register("actor", "wrwlf_silver_hit_fx", 1, 1, "counter", &function_39053880, 0, 0);
	clientfield::register("actor", "wrwlf_leap_attack_rumble", 1, 1, "counter", &function_e980911c, 0, 0);
	ai::add_archetype_spawn_function(#"werewolf", &function_d45ef8ea);
	footsteps::registeraitypefootstepcb(#"werewolf", &function_f4b140ab);
}

/*
	Name: function_d45ef8ea
	Namespace: namespace_2a445563
	Checksum: 0xAE03C18E
	Offset: 0x420
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function function_d45ef8ea(localclientnum)
{
	self.breath_fx = util::playfxontag(localclientnum, "zm_ai/fx8_werewolf_breath", self, "j_head");
	self.var_f87f8fa0 = "tag_eye";
	self zombie_eye_glow::function_3a020b0f(localclientnum, "rob_zm_eyes_orange", #"hash_524decea28717b7c");
	self callback::on_shutdown(&on_entity_shutdown);
	self function_bf9d3071("rob_zm_man_werewolf_nonboss_weakpoint");
}

/*
	Name: on_entity_shutdown
	Namespace: namespace_2a445563
	Checksum: 0xEEF521D1
	Offset: 0x4E8
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function on_entity_shutdown(localclientnum)
{
	if(isdefined(self))
	{
		if(isdefined(self.breath_fx))
		{
			stopfx(localclientnum, self.breath_fx);
		}
		self zombie_eye_glow::good_barricade_damaged(localclientnum);
	}
	self function_5d482e78("rob_zm_man_werewolf_nonboss_weakpoint");
}

/*
	Name: function_c65ce64a
	Namespace: namespace_2a445563
	Checksum: 0xDED7129B
	Offset: 0x568
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_c65ce64a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread function_815cc85c(fieldname);
	}
}

/*
	Name: function_815cc85c
	Namespace: namespace_2a445563
	Checksum: 0xEB5C7530
	Offset: 0x5D0
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function function_815cc85c(localclientnum)
{
	self zombie_eye_glow::good_barricade_damaged(localclientnum);
	self function_5d482e78("rob_zm_man_werewolf_nonboss_weakpoint");
	self function_bf9d3071("rob_zm_werewolf_dust");
}

/*
	Name: function_3f3f0d8
	Namespace: namespace_2a445563
	Checksum: 0xE283842C
	Offset: 0x640
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_3f3f0d8(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		util::playfxontag(fieldname, "zm_ai/fx8_werewolf_dmg_weakspot", self, "tag_chest_ws");
	}
	else if(bwastimejump == 2)
	{
		util::playfxontag(fieldname, "zm_ai/fx8_werewolf_dmg_weakspot", self, "tag_back_ws");
	}
}

/*
	Name: function_39053880
	Namespace: namespace_2a445563
	Checksum: 0x90BB7FE7
	Offset: 0x6F0
	Size: 0x6C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_39053880(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		util::playfxontag(fieldname, "maps/zm_mansion/fx8_silver_hit_werewolf", self, "j_spine4");
	}
}

/*
	Name: function_f4b140ab
	Namespace: namespace_2a445563
	Checksum: 0x39B946FC
	Offset: 0x768
	Size: 0x194
	Parameters: 5
	Flags: Linked, Private
*/
function private function_f4b140ab(localclientnum, pos, surface, notetrack, bone)
{
	e_player = function_5c10bd79(notetrack);
	n_dist = distancesquared(bone, e_player.origin);
	var_107019dc = sqr(1000);
	n_scale = (var_107019dc - n_dist) / var_107019dc;
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
	Name: function_e980911c
	Namespace: namespace_2a445563
	Checksum: 0xDF32A9C4
	Offset: 0x908
	Size: 0x174
	Parameters: 7
	Flags: Linked, Private
*/
function private function_e980911c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	n_dist = distancesquared(self.origin, e_player.origin);
	var_107019dc = sqr(500);
	n_scale = (var_107019dc - n_dist) / var_107019dc;
	n_scale = min(n_scale, 0.75);
	if(n_scale <= 0.01)
	{
		return;
	}
	earthquake(bwastimejump, n_scale, 0.5, self.origin, n_dist, 1);
	if(n_scale >= 0.5)
	{
		function_36e4ebd4(bwastimejump, "damage_heavy");
	}
	else
	{
		function_36e4ebd4(bwastimejump, "damage_light");
	}
}

