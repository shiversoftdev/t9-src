#using scripts\core_common\ai_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace namespace_a204c0f4;

/*
	Name: init
	Namespace: namespace_a204c0f4
	Checksum: 0x70322DB2
	Offset: 0x590
	Size: 0x77C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	function_cae618b4("spawner_zombietron_margwa");
	clientfield::register("actor", "margwa_head_left", 1, 2, "int", &margwaheadleftcallback, 0, 0);
	clientfield::register("actor", "margwa_head_mid", 1, 2, "int", &margwaheadmidcallback, 0, 0);
	clientfield::register("actor", "margwa_head_right", 1, 2, "int", &margwaheadrightcallback, 0, 0);
	clientfield::register("actor", "margwa_fx_in", 1, 1, "counter", &margwafxincallback, 0, 0);
	clientfield::register("actor", "margwa_fx_out", 1, 1, "counter", &margwafxoutcallback, 0, 0);
	clientfield::register("actor", "margwa_fx_spawn", 1, 1, "counter", &margwafxspawncallback, 0, 0);
	clientfield::register("actor", "margwa_smash", 1, 1, "counter", &margwasmashcallback, 0, 0);
	clientfield::register("actor", "margwa_head_left_hit", 1, 1, "counter", &margwalefthitcallback, 0, 0);
	clientfield::register("actor", "margwa_head_mid_hit", 1, 1, "counter", &margwamidhitcallback, 0, 0);
	clientfield::register("actor", "margwa_head_right_hit", 1, 1, "counter", &margwarighthitcallback, 0, 0);
	clientfield::register("actor", "margwa_head_killed", 1, 2, "int", &margwaheadkilledcallback, 0, 0);
	clientfield::register("actor", "margwa_jaw", 1, 6, "int", &margwajawcallback, 0, 0);
	clientfield::register("toplayer", "margwa_head_explosion", 1, 1, "counter", &margwaheadexplosion, 0, 0);
	clientfield::register("scriptmover", "margwa_fx_travel", 1, 1, "int", &margwafxtravelcallback, 0, 0);
	clientfield::register("scriptmover", "margwa_fx_travel_tell", 1, 1, "int", &margwafxtraveltellcallback, 0, 0);
	clientfield::register("actor", "supermargwa", 1, 1, "int", undefined, 0, 0);
	ai::add_archetype_spawn_function(#"margwa", &margwaspawn);
	level._jaw = [];
	level._jaw[1] = "idle_1";
	level._jaw[3] = "idle_pain_head_l_explode";
	level._jaw[4] = "idle_pain_head_m_explode";
	level._jaw[5] = "idle_pain_head_r_explode";
	level._jaw[6] = "react_stun";
	level._jaw[8] = "react_idgun";
	level._jaw[9] = "react_idgun_pack";
	level._jaw[7] = "run_charge_f";
	level._jaw[13] = "run_f";
	level._jaw[14] = "smash_attack_1";
	level._jaw[15] = "swipe";
	level._jaw[16] = "swipe_player";
	level._jaw[17] = "teleport_in";
	level._jaw[18] = "teleport_out";
	level._jaw[19] = "trv_jump_across_256";
	level._jaw[20] = "trv_jump_down_128";
	level._jaw[21] = "trv_jump_down_36";
	level._jaw[22] = "trv_jump_down_96";
	level._jaw[23] = "trv_jump_up_128";
	level._jaw[24] = "trv_jump_up_36";
	level._jaw[25] = "trv_jump_up_96";
	level._effect[#"fx_margwa_teleport_zod_zmb"] = "zombie/fx_margwa_teleport_zod_zmb";
	level._effect[#"fx_margwa_teleport_travel_zod_zmb"] = "zombie/fx_margwa_teleport_travel_zod_zmb";
	level._effect[#"fx_margwa_teleport_tell_zod_zmb"] = "zombie/fx_margwa_teleport_tell_zod_zmb";
	level._effect[#"fx_margwa_teleport_intro_zod_zmb"] = "zombie/fx_margwa_teleport_intro_zod_zmb";
	level._effect[#"fx_margwa_head_shot_zod_zmb"] = "zombie/fx_margwa_head_shot_zod_zmb";
	level._effect[#"fx_margwa_roar_zod_zmb"] = "zombie/fx_margwa_roar_zod_zmb";
	level._effect[#"fx_margwa_roar_purple_zod_zmb"] = "zombie/fx_margwa_roar_purple_zod_zmb";
	footsteps::registeraitypefootstepcb(#"margwa", &margwaprocessfootstep);
}

/*
	Name: margwaspawn
	Namespace: namespace_a204c0f4
	Checksum: 0x34887BEF
	Offset: 0xD18
	Size: 0x32A
	Parameters: 1
	Flags: Linked, Private
*/
function private margwaspawn(localclientnum)
{
	self util::waittill_dobj(localclientnum);
	if(!isdefined(self))
	{
		return;
	}
	self setanim(#"ai_margwa_head_l_closed_add", 1, 0.2, 1);
	self setanim(#"ai_margwa_head_m_closed_add", 1, 0.2, 1);
	self setanim(#"ai_margwa_head_r_closed_add", 1, 0.2, 1);
	for(i = 1; i <= 7; i++)
	{
		lefttentacle = #"ai_margwa_tentacle_l_0" + i;
		righttentacle = #"ai_margwa_tentacle_r_0" + i;
		self setanim(lefttentacle, 1, 0.2, 1);
		self setanim(righttentacle, 1, 0.2, 1);
	}
	self.heads = [];
	self.heads[1] = spawnstruct();
	self.heads[1].index = 1;
	self.heads[1].prevheadanim = #"ai_margwa_head_l_closed_add";
	self.heads[1].jawbase = "ai_margwa_jaw_l_";
	self.heads[2] = spawnstruct();
	self.heads[2].index = 2;
	self.heads[2].prevheadanim = #"ai_margwa_head_m_closed_add";
	self.heads[2].jawbase = "ai_margwa_jaw_m_";
	self.heads[3] = spawnstruct();
	self.heads[3].index = 3;
	self.heads[3].prevheadanim = #"ai_margwa_head_r_closed_add";
	self.heads[3].jawbase = "ai_margwa_jaw_r_";
}

/*
	Name: margwaheadleftcallback
	Namespace: namespace_a204c0f4
	Checksum: 0xB6F6D972
	Offset: 0x1050
	Size: 0x442
	Parameters: 7
	Flags: Linked, Private
*/
function private margwaheadleftcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(isdefined(self.leftglowfx))
	{
		stopfx(fieldname, self.leftglowfx);
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	switch(wasdemojump)
	{
		case 1:
		{
			self.heads[1].prevheadanim = #"ai_margwa_head_l_open_add";
			self setanim(#"ai_margwa_head_l_open_add", 1, 0.1, 1);
			self clearanim(#"ai_margwa_head_l_closed_add", 0.1);
			roar_effect = level._effect[#"fx_margwa_roar_zod_zmb"];
			if(isdefined(self.margwa_roar_effect))
			{
				roar_effect = self.margwa_roar_effect;
			}
			if(self clientfield::get("supermargwa"))
			{
				self.leftglowfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_roar_purple_zod_zmb"], self, "tag_head_left");
			}
			else
			{
				self.leftglowfx = util::playfxontag(fieldname, roar_effect, self, "tag_head_left");
			}
			break;
		}
		case 2:
		{
			self.heads[1].prevheadanim = #"ai_margwa_head_l_closed_add";
			self setanim(#"ai_margwa_head_l_closed_add", 1, 0.1, 1);
			self clearanim(#"ai_margwa_head_l_open_add", 0.1);
			self clearanim(#"ai_margwa_head_l_smash_attack_1", 0.1);
			break;
		}
		case 3:
		{
			self.heads[1].prevheadanim = #"ai_margwa_head_l_smash_attack_1";
			self clearanim(#"ai_margwa_head_l_open_add", 0.1);
			self clearanim(#"ai_margwa_head_l_closed_add", 0.1);
			self setanimrestart(#"ai_margwa_head_l_smash_attack_1", 1, 0.1, 1);
			roar_effect = level._effect[#"fx_margwa_roar_zod_zmb"];
			if(isdefined(self.margwa_roar_effect))
			{
				roar_effect = self.margwa_roar_effect;
			}
			if(self clientfield::get("supermargwa"))
			{
				self.leftglowfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_roar_purple_zod_zmb"], self, "tag_head_left");
			}
			else
			{
				self.leftglowfx = util::playfxontag(fieldname, roar_effect, self, "tag_head_left");
			}
			self thread margwastopsmashfx(fieldname);
			break;
		}
	}
}

/*
	Name: margwaheadmidcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x1F313A36
	Offset: 0x14A0
	Size: 0x3D2
	Parameters: 7
	Flags: Linked, Private
*/
function private margwaheadmidcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(isdefined(self.midglowfx))
	{
		stopfx(fieldname, self.midglowfx);
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	switch(wasdemojump)
	{
		case 1:
		{
			self setanim(#"ai_margwa_head_m_open_add", 1, 0.1, 1);
			self clearanim(#"ai_margwa_head_m_closed_add", 0.1);
			roar_effect = level._effect[#"fx_margwa_roar_zod_zmb"];
			if(isdefined(self.margwa_roar_effect))
			{
				roar_effect = self.margwa_roar_effect;
			}
			if(self clientfield::get("supermargwa"))
			{
				self.midglowfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_roar_purple_zod_zmb"], self, "tag_head_mid");
			}
			else
			{
				self.midglowfx = util::playfxontag(fieldname, roar_effect, self, "tag_head_mid");
			}
			break;
		}
		case 2:
		{
			self setanim(#"ai_margwa_head_m_closed_add", 1, 0.1, 1);
			self clearanim(#"ai_margwa_head_m_open_add", 0.1);
			self clearanim(#"ai_margwa_head_m_smash_attack_1", 0.1);
			break;
		}
		case 3:
		{
			self clearanim(#"ai_margwa_head_m_open_add", 0.1);
			self clearanim(#"ai_margwa_head_m_closed_add", 0.1);
			self setanimrestart(#"ai_margwa_head_m_smash_attack_1", 1, 0.1, 1);
			roar_effect = level._effect[#"fx_margwa_roar_zod_zmb"];
			if(isdefined(self.margwa_roar_effect))
			{
				roar_effect = self.margwa_roar_effect;
			}
			if(self clientfield::get("supermargwa"))
			{
				self.midglowfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_roar_purple_zod_zmb"], self, "tag_head_mid");
			}
			else
			{
				self.midglowfx = util::playfxontag(fieldname, roar_effect, self, "tag_head_mid");
			}
			self thread margwastopsmashfx(fieldname);
			break;
		}
	}
}

/*
	Name: margwaheadrightcallback
	Namespace: namespace_a204c0f4
	Checksum: 0xA8DD019
	Offset: 0x1880
	Size: 0x3D2
	Parameters: 7
	Flags: Linked, Private
*/
function private margwaheadrightcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(isdefined(self.rightglowfx))
	{
		stopfx(fieldname, self.rightglowfx);
	}
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	switch(wasdemojump)
	{
		case 1:
		{
			self setanim(#"ai_margwa_head_r_open_add", 1, 0.1, 1);
			self clearanim(#"ai_margwa_head_r_closed_add", 0.1);
			roar_effect = level._effect[#"fx_margwa_roar_zod_zmb"];
			if(isdefined(self.margwa_roar_effect))
			{
				roar_effect = self.margwa_roar_effect;
			}
			if(self clientfield::get("supermargwa"))
			{
				self.rightglowfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_roar_purple_zod_zmb"], self, "tag_head_right");
			}
			else
			{
				self.rightglowfx = util::playfxontag(fieldname, roar_effect, self, "tag_head_right");
			}
			break;
		}
		case 2:
		{
			self setanim(#"ai_margwa_head_r_closed_add", 1, 0.1, 1);
			self clearanim(#"ai_margwa_head_r_open_add", 0.1);
			self clearanim(#"ai_margwa_head_r_smash_attack_1", 0.1);
			break;
		}
		case 3:
		{
			self clearanim(#"ai_margwa_head_r_open_add", 0.1);
			self clearanim(#"ai_margwa_head_r_closed_add", 0.1);
			self setanimrestart(#"ai_margwa_head_r_smash_attack_1", 1, 0.1, 1);
			roar_effect = level._effect[#"fx_margwa_roar_zod_zmb"];
			if(isdefined(self.margwa_roar_effect))
			{
				roar_effect = self.margwa_roar_effect;
			}
			if(self clientfield::get("supermargwa"))
			{
				self.rightglowfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_roar_purple_zod_zmb"], self, "tag_head_right");
			}
			else
			{
				self.rightglowfx = util::playfxontag(fieldname, roar_effect, self, "tag_head_right");
			}
			self thread margwastopsmashfx(fieldname);
			break;
		}
	}
}

/*
	Name: margwastopsmashfx
	Namespace: namespace_a204c0f4
	Checksum: 0x794E83A3
	Offset: 0x1C60
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private margwastopsmashfx(localclientnum)
{
	self endon(#"death");
	wait(0.6);
	if(isdefined(self.leftglowfx))
	{
		stopfx(localclientnum, self.leftglowfx);
	}
	if(isdefined(self.midglowfx))
	{
		stopfx(localclientnum, self.midglowfx);
	}
	if(isdefined(self.rightglowfx))
	{
		stopfx(localclientnum, self.rightglowfx);
	}
}

/*
	Name: margwafxincallback
	Namespace: namespace_a204c0f4
	Checksum: 0xF8C9314F
	Offset: 0x1D10
	Size: 0x9A
	Parameters: 7
	Flags: Linked, Private
*/
function private margwafxincallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		self.teleportfxin = playfx(fieldname, level._effect[#"fx_margwa_teleport_zod_zmb"], self gettagorigin("j_spine_1"));
	}
}

/*
	Name: margwafxoutcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x92C774B4
	Offset: 0x1DB8
	Size: 0xAA
	Parameters: 7
	Flags: Linked, Private
*/
function private margwafxoutcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		tagpos = self gettagorigin("j_spine_1");
		self.teleportfxout = playfx(fieldname, level._effect[#"fx_margwa_teleport_zod_zmb"], tagpos);
	}
}

/*
	Name: margwafxtravelcallback
	Namespace: namespace_a204c0f4
	Checksum: 0xA3E7CF63
	Offset: 0x1E70
	Size: 0xDA
	Parameters: 7
	Flags: Linked, Private
*/
function private margwafxtravelcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	switch(wasdemojump)
	{
		case 0:
		{
			deletefx(fieldname, self.travelerfx);
			break;
		}
		case 1:
		{
			self.travelerfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_teleport_travel_zod_zmb"], self, "tag_origin");
			break;
		}
	}
}

/*
	Name: margwafxtraveltellcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x31085708
	Offset: 0x1F58
	Size: 0x102
	Parameters: 7
	Flags: Linked, Private
*/
function private margwafxtraveltellcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	switch(wasdemojump)
	{
		case 0:
		{
			deletefx(fieldname, self.travelertellfx);
			self notify(#"stop_margwatraveltell");
			break;
		}
		case 1:
		{
			self.travelertellfx = util::playfxontag(fieldname, level._effect[#"fx_margwa_teleport_tell_zod_zmb"], self, "tag_origin");
			self thread margwatraveltellupdate(fieldname);
			break;
		}
	}
}

/*
	Name: margwatraveltellupdate
	Namespace: namespace_a204c0f4
	Checksum: 0xA6B15843
	Offset: 0x2068
	Size: 0xCE
	Parameters: 1
	Flags: Linked
*/
function margwatraveltellupdate(localclientnum)
{
	self notify(#"stop_margwatraveltell");
	self endon(#"stop_margwatraveltell");
	self endon(#"death");
	player = function_5c10bd79(localclientnum);
	while(true)
	{
		if(isdefined(player))
		{
			dist_sq = distancesquared(player.origin, self.origin);
			if(dist_sq < 1000000)
			{
				player playrumbleonentity(localclientnum, "tank_rumble");
			}
		}
		waitframe(1);
	}
}

/*
	Name: margwafxspawncallback
	Namespace: namespace_a204c0f4
	Checksum: 0xBEE55AF0
	Offset: 0x2140
	Size: 0xF4
	Parameters: 7
	Flags: Linked, Private
*/
function private margwafxspawncallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		spawnfx = level._effect[#"fx_margwa_teleport_intro_zod_zmb"];
		if(isdefined(self.margwa_spawn_effect))
		{
			spawnfx = self.margwa_spawn_effect;
		}
		self.spawnfx = playfx(fieldname, spawnfx, self gettagorigin("j_spine_1"));
		playsound(0, #"zmb_margwa_spawn", self gettagorigin("j_spine_1"));
	}
}

/*
	Name: margwaheadexplosion
	Namespace: namespace_a204c0f4
	Checksum: 0x937A83EF
	Offset: 0x2240
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private margwaheadexplosion(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		self postfx::playpostfxbundle(#"pstfx_parasite_dmg");
	}
}

/*
	Name: margwaprocessfootstep
	Namespace: namespace_a204c0f4
	Checksum: 0xB4B9EAEA
	Offset: 0x22B0
	Size: 0x1F4
	Parameters: 5
	Flags: Linked
*/
function margwaprocessfootstep(localclientnum, pos, surface, notetrack, bone)
{
	e_player = function_5c10bd79(notetrack);
	n_dist = distancesquared(bone, e_player.origin);
	n_margwa_dist = getdvarint(#"scr_margwa_footstep_eq_radius", 1000) * getdvarint(#"scr_margwa_footstep_eq_radius", 1000);
	if(n_margwa_dist > 0)
	{
		n_scale = (n_margwa_dist - n_dist) / n_margwa_dist;
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
		function_36e4ebd4(notetrack, "shotgun_fire");
	}
	else
	{
		if(n_scale <= 0.2 && n_scale > 0.1)
		{
			function_36e4ebd4(notetrack, "damage_heavy");
		}
		else
		{
			function_36e4ebd4(notetrack, "reload_small");
		}
	}
}

/*
	Name: margwasmashcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x3152A1AA
	Offset: 0x24B0
	Size: 0x184
	Parameters: 7
	Flags: Linked, Private
*/
function private margwasmashcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		e_player = function_5c10bd79(fieldname);
		smashpos = self.origin + vectorscale(anglestoforward(self.angles), 60);
		distsq = distancesquared(smashpos, e_player.origin);
		if(distsq < 20736)
		{
			earthquake(fieldname, 0.7, 0.25, e_player.origin, 3000);
			function_36e4ebd4(fieldname, "shotgun_fire");
		}
		else if(distsq < 36864)
		{
			earthquake(fieldname, 0.7, 0.25, e_player.origin, 1500);
			function_36e4ebd4(fieldname, "damage_heavy");
		}
	}
}

/*
	Name: margwalefthitcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x53C555D3
	Offset: 0x2640
	Size: 0xA2
	Parameters: 7
	Flags: Linked, Private
*/
function private margwalefthitcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		effect = level._effect[#"fx_margwa_head_shot_zod_zmb"];
		if(isdefined(self.margwa_head_hit_fx))
		{
			effect = self.margwa_head_hit_fx;
		}
		self.lefthitfx = util::playfxontag(fieldname, effect, self, "tag_head_left");
	}
}

/*
	Name: margwamidhitcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x7B8DBC4A
	Offset: 0x26F0
	Size: 0xA2
	Parameters: 7
	Flags: Linked, Private
*/
function private margwamidhitcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		effect = level._effect[#"fx_margwa_head_shot_zod_zmb"];
		if(isdefined(self.margwa_head_hit_fx))
		{
			effect = self.margwa_head_hit_fx;
		}
		self.midhitfx = util::playfxontag(fieldname, effect, self, "tag_head_mid");
	}
}

/*
	Name: margwarighthitcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x3FB95130
	Offset: 0x27A0
	Size: 0xA2
	Parameters: 7
	Flags: Linked, Private
*/
function private margwarighthitcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		effect = level._effect[#"fx_margwa_head_shot_zod_zmb"];
		if(isdefined(self.margwa_head_hit_fx))
		{
			effect = self.margwa_head_hit_fx;
		}
		self.righthitfx = util::playfxontag(fieldname, effect, self, "tag_head_right");
	}
}

/*
	Name: margwaheadkilledcallback
	Namespace: namespace_a204c0f4
	Checksum: 0x718A2499
	Offset: 0x2850
	Size: 0x82
	Parameters: 7
	Flags: Linked, Private
*/
function private margwaheadkilledcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump && isdefined(self.heads) && isdefined(self.heads[wasdemojump]))
	{
		self.heads[wasdemojump].killed = 1;
	}
}

/*
	Name: margwajawcallback
	Namespace: namespace_a204c0f4
	Checksum: 0xB7AACFC9
	Offset: 0x28E0
	Size: 0x1A0
	Parameters: 7
	Flags: Linked, Private
*/
function private margwajawcallback(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump)
	{
		foreach(head in self.heads)
		{
			if(is_true(head.killed))
			{
				if(isdefined(head.prevjawanim))
				{
					self clearanim(head.prevjawanim, 0.2);
				}
				if(isdefined(head.prevheadanim))
				{
					self clearanim(head.prevheadanim, 0.1);
				}
				jawanim = head.jawbase + level._jaw[wasdemojump];
				head.prevjawanim = jawanim;
				self setanim(jawanim, 1, 0.2, 1);
			}
		}
	}
}

