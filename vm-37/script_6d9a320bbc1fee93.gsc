#using scripts\core_common\util_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_2e61cc4b;

/*
	Name: init
	Namespace: namespace_2e61cc4b
	Checksum: 0x4E442A81
	Offset: 0x298
	Size: 0x274
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_elephant");
	ai::add_archetype_spawn_function(#"elephant", &function_4c731a08);
	clientfield::register("actor", "towers_boss_melee_effect", 1, 1, "counter", &function_4d07056d, 0, 0);
	clientfield::register("actor", "tower_boss_death_fx", 1, 1, "counter", &function_58e13aab, 0, 0);
	clientfield::register("scriptmover", "entrails_model_cf", 1, 1, "int", &function_e3038292, 0, 0);
	clientfield::register("scriptmover", "towers_boss_head_proj_fx_cf", 1, 1, "int", &function_5f5f6a25, 0, 0);
	clientfield::register("scriptmover", "towers_boss_head_proj_explosion_fx_cf", 1, 1, "int", &function_1308296f, 0, 0);
	clientfield::register("actor", "towers_boss_eye_fx_cf", 1, 2, "int", &function_624041b1, 0, 0);
	clientfield::register("actor", "boss_death_rob", 1, 2, "int", &function_e1fb79d0, 0, 0);
	footsteps::registeraitypefootstepcb(#"elephant", &function_fe0bb012);
}

/*
	Name: function_4c731a08
	Namespace: namespace_2e61cc4b
	Checksum: 0x68A42AA3
	Offset: 0x518
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4c731a08(localclientnum)
{
	self playrenderoverridebundle("rob_zm_eyes_red");
}

/*
	Name: function_624041b1
	Namespace: namespace_2e61cc4b
	Checksum: 0x10E0C4B1
	Offset: 0x550
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function function_624041b1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.eyefx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_eye_glow", self, "tag_eye");
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.eyefx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_eye_glow_alt", self, "tag_eye");
		}
		else if(isdefined(self.eyefx))
		{
			stopfx(fieldname, self.eyefx);
		}
	}
}

/*
	Name: function_e1fb79d0
	Namespace: namespace_2e61cc4b
	Checksum: 0x3DF42896
	Offset: 0x640
	Size: 0xAC
	Parameters: 7
	Flags: Linked
*/
function function_e1fb79d0(var_99c2529a, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self stoprenderoverridebundle("rob_zm_eyes_red");
		self playrenderoverridebundle(#"hash_782edffb9e72130");
	}
	else
	{
		self stoprenderoverridebundle(#"hash_782edffb9e72130");
	}
}

/*
	Name: function_e3038292
	Namespace: namespace_2e61cc4b
	Checksum: 0x203B191E
	Offset: 0x6F8
	Size: 0x84
	Parameters: 7
	Flags: Linked
*/
function function_e3038292(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!util::is_mature() || util::is_gib_restricted_build())
		{
			self hide();
		}
	}
}

/*
	Name: function_5f5f6a25
	Namespace: namespace_2e61cc4b
	Checksum: 0x25E555BE
	Offset: 0x788
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_5f5f6a25(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.fx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_attack_eye_trail", self, "tag_origin");
	}
	else if(isdefined(self.fx))
	{
		stopfx(fieldname, self.fx);
	}
}

/*
	Name: function_1308296f
	Namespace: namespace_2e61cc4b
	Checksum: 0xB065A7DA
	Offset: 0x838
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_1308296f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.fx = util::playfxontag(fieldname, "maps/zm_towers/fx8_boss_attack_eye_trail_split", self, "tag_origin");
	}
	else if(isdefined(self.fx))
	{
		stopfx(fieldname, self.fx);
	}
}

/*
	Name: function_4d07056d
	Namespace: namespace_2e61cc4b
	Checksum: 0xE7B2CA24
	Offset: 0x8E8
	Size: 0x194
	Parameters: 7
	Flags: Linked
*/
function function_4d07056d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	n_dist = distancesquared(self gettagorigin("j_nose4"), e_player.origin);
	var_b12c8a00 = sqr(1400);
	n_scale = (var_b12c8a00 - n_dist) / var_b12c8a00;
	if(n_scale > 0.01)
	{
		earthquake(bwastimejump, n_scale, 1, self.origin, n_dist);
		if(n_scale <= 0.25 && n_scale > 0.2)
		{
			function_36e4ebd4(bwastimejump, "tank_fire");
		}
		else
		{
			function_36e4ebd4(bwastimejump, "damage_heavy");
		}
		physicsexplosionsphere(bwastimejump, self.origin, 400, 100, 20);
	}
}

/*
	Name: function_58e13aab
	Namespace: namespace_2e61cc4b
	Checksum: 0xC4785C5F
	Offset: 0xA88
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_58e13aab(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	earthquake(bwastimejump, 0.6, 1, self.origin, 4000);
	function_36e4ebd4(bwastimejump, "tank_fire");
	physicsexplosionsphere(bwastimejump, self.origin, 2000, 100, 4);
}

/*
	Name: function_fe0bb012
	Namespace: namespace_2e61cc4b
	Checksum: 0x2B9138F9
	Offset: 0xB68
	Size: 0x13C
	Parameters: 5
	Flags: Linked
*/
function function_fe0bb012(localclientnum, pos, surface, notetrack, bone)
{
	e_player = function_5c10bd79(surface);
	n_dist = distancesquared(notetrack, e_player.origin);
	var_b12c8a00 = sqr(1200);
	if(n_dist < var_b12c8a00)
	{
		earthquake(surface, 0.1, 0.5, self.origin, n_dist);
		function_36e4ebd4(surface, "damage_light");
		if(isdefined(bone))
		{
			origin = self gettagorigin(bone);
			physicsexplosionsphere(surface, origin, 200, 20, 20);
		}
	}
}

