#using scripts\core_common\util_shared.csc;
#using scripts\core_common\throttle_shared.csc;
#using scripts\core_common\ai_shared.csc;
#using script_14d2d89964cae0b1;
#using script_ac6a30f1991e105;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace zombie;

/*
	Name: main
	Namespace: zombie
	Checksum: 0xC6F2CEF6
	Offset: 0xE8
	Size: 0x13C
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	ai::add_archetype_spawn_function(#"zombie", &zombieclientutils::zombie_override_burn_fx);
	ai::add_archetype_spawn_function(#"zombie", &zombieclientutils::zombiespawnsetup);
	clientfield::register("actor", "zombie", 1, 1, "int", &zombieclientutils::zombiehandler, 0, 0);
	clientfield::register("actor", "pustule_pulse_cf", 1, 2, "int", &zombieclientutils::function_a17af3df, 0, 0);
	clientfield::register("actor", "stunned_head_fx", 1, 1, "int", &zombieclientutils::function_d2f27d26, 0, 0);
}

#namespace zombieclientutils;

/*
	Name: zombiehandler
	Namespace: zombieclientutils
	Checksum: 0x7D7BC529
	Offset: 0x230
	Size: 0x174
	Parameters: 7
	Flags: Linked
*/
function zombiehandler(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	entity = self;
	if(isdefined(entity.archetype) && entity.archetype != #"zombie")
	{
		return;
	}
	if(!isdefined(entity.initializedgibcallbacks) || !entity.initializedgibcallbacks)
	{
		entity.initializedgibcallbacks = 1;
		gibclientutils::addgibcallback(wasdemojump, entity, 8, &_gibcallback);
		gibclientutils::addgibcallback(wasdemojump, entity, 16, &_gibcallback);
		gibclientutils::addgibcallback(wasdemojump, entity, 32, &_gibcallback);
		gibclientutils::addgibcallback(wasdemojump, entity, 128, &_gibcallback);
		gibclientutils::addgibcallback(wasdemojump, entity, 256, &_gibcallback);
	}
}

/*
	Name: _gibcallback
	Namespace: zombieclientutils
	Checksum: 0xAC62401F
	Offset: 0x3B0
	Size: 0xFA
	Parameters: 3
	Flags: Linked, Private
*/
function private _gibcallback(localclientnum, entity, gibflag)
{
	switch(gibflag)
	{
		case 8:
		{
			playsound(0, #"zmb_zombie_head_gib", self.origin + vectorscale((0, 0, 1), 60));
			break;
		}
		case 16:
		case 32:
		case 128:
		case 256:
		{
			playsound(0, #"zmb_death_gibs", self.origin + vectorscale((0, 0, 1), 30));
			break;
		}
	}
}

/*
	Name: zombie_override_burn_fx
	Namespace: zombieclientutils
	Checksum: 0x44A1A457
	Offset: 0x4B8
	Size: 0x1C4
	Parameters: 1
	Flags: Linked
*/
function zombie_override_burn_fx(localclientnum)
{
	if(sessionmodeiszombiesgame())
	{
		if(!isdefined(self._effect))
		{
			self._effect = [];
		}
		level._effect[#"fire_zombie_j_elbow_le_loop"] = #"fire/fx_fire_ai_human_arm_left_loop";
		level._effect[#"fire_zombie_j_elbow_ri_loop"] = #"fire/fx_fire_ai_human_arm_right_loop";
		level._effect[#"fire_zombie_j_shoulder_le_loop"] = #"fire/fx_fire_ai_human_arm_left_loop";
		level._effect[#"fire_zombie_j_shoulder_ri_loop"] = #"fire/fx_fire_ai_human_arm_right_loop";
		level._effect[#"fire_zombie_j_spine4_loop"] = #"fire/fx_fire_ai_human_torso_loop";
		level._effect[#"fire_zombie_j_hip_le_loop"] = #"fire/fx_fire_ai_human_hip_left_loop";
		level._effect[#"fire_zombie_j_hip_ri_loop"] = #"fire/fx_fire_ai_human_hip_right_loop";
		level._effect[#"fire_zombie_j_knee_le_loop"] = #"fire/fx_fire_ai_human_leg_left_loop";
		level._effect[#"fire_zombie_j_knee_ri_loop"] = #"fire/fx_fire_ai_human_leg_right_loop";
		level._effect[#"fire_zombie_j_head_loop"] = #"fire/fx_fire_ai_human_head_loop";
	}
}

/*
	Name: function_a846c43c
	Namespace: zombieclientutils
	Checksum: 0x60459B23
	Offset: 0x688
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_a846c43c(ai)
{
	if(!isdefined(ai))
	{
		return;
	}
	function_9a725f16(ai.torsodmg1);
	function_9a725f16(ai.torsodmg2);
	function_9a725f16(ai.torsodmg3);
	function_9a725f16(ai.torsodmg4);
	function_9a725f16(ai.torsodmg5);
	function_9a725f16(ai.legdmg1);
	function_9a725f16(ai.legdmg2);
	function_9a725f16(ai.legdmg3);
	function_9a725f16(ai.legdmg4);
}

/*
	Name: function_55aaf3b
	Namespace: zombieclientutils
	Checksum: 0xE1D4FF68
	Offset: 0x788
	Size: 0xF4
	Parameters: 1
	Flags: Linked
*/
function function_55aaf3b(ai)
{
	if(!isdefined(ai))
	{
		return;
	}
	function_2e973803(ai.torsodmg1);
	function_2e973803(ai.torsodmg2);
	function_2e973803(ai.torsodmg3);
	function_2e973803(ai.torsodmg4);
	function_2e973803(ai.torsodmg5);
	function_2e973803(ai.legdmg1);
	function_2e973803(ai.legdmg2);
	function_2e973803(ai.legdmg3);
	function_2e973803(ai.legdmg4);
}

/*
	Name: function_9a725f16
	Namespace: zombieclientutils
	Checksum: 0x5DF5DE0F
	Offset: 0x888
	Size: 0xB6
	Parameters: 1
	Flags: Linked
*/
function function_9a725f16(model)
{
	if(isdefined(model))
	{
		if(!isdefined(level.var_dfb95520))
		{
			level.var_dfb95520 = [];
		}
		if(!isdefined(level.var_dfb95520[model]))
		{
			level.var_dfb95520[model] = 0;
		}
		if(level.var_dfb95520[model] < 1)
		{
			forcestreamxmodel(model, 1);
			forcestreamxmodel(model, 2);
		}
		level.var_dfb95520[model]++;
	}
}

/*
	Name: function_2e973803
	Namespace: zombieclientutils
	Checksum: 0xE7C35549
	Offset: 0x948
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_2e973803(model)
{
	if(!isdefined(level.var_dfb95520))
	{
		level.var_dfb95520 = [];
	}
	if(isdefined(model) && isdefined(level.var_dfb95520[model]))
	{
		if(level.var_dfb95520[model] > 0)
		{
			level.var_dfb95520[model]--;
			if(level.var_dfb95520[model] < 1)
			{
				stopforcestreamingxmodel(model);
			}
		}
	}
}

/*
	Name: function_fd2b858e
	Namespace: zombieclientutils
	Checksum: 0xD621AA52
	Offset: 0x9F0
	Size: 0x206
	Parameters: 1
	Flags: None
*/
function function_fd2b858e(localclientnum)
{
	if(!isdefined(level.var_49883c7))
	{
		level.var_49883c7 = new class_c6c0e94();
		[[ level.var_49883c7 ]]->initialize(#"hash_6c088d467fef5b7f", 2, 0.1);
	}
	self endon(#"death");
	self.var_e22ea2fc = 0;
	self callback::on_shutdown(&function_a0a0fbea);
	while(true)
	{
		waitframe(1);
		[[ level.var_49883c7 ]]->waitinqueue(self);
		localclient = function_5c10bd79(localclientnum);
		if(isdefined(localclient) && gibclientutils::isundamaged(localclientnum, self) && distancesquared(localclient.origin, self.origin) < sqr(700) && (vectordot(anglestoforward(localclient.angles), self.origin - localclient.origin)) > 0)
		{
			if(!self.var_e22ea2fc)
			{
				self.var_e22ea2fc = 1;
				function_a846c43c(self);
			}
		}
		else if(self.var_e22ea2fc)
		{
			self.var_e22ea2fc = 0;
			function_55aaf3b(self);
			if(!gibclientutils::isundamaged(localclientnum, self))
			{
				break;
			}
		}
	}
}

/*
	Name: function_a0a0fbea
	Namespace: zombieclientutils
	Checksum: 0xFE3F4775
	Offset: 0xC00
	Size: 0x44
	Parameters: 1
	Flags: Linked
*/
function function_a0a0fbea(localclientnum)
{
	if(is_true(self.var_e22ea2fc))
	{
		self.var_e22ea2fc = 0;
		function_55aaf3b(self);
	}
}

/*
	Name: zombiespawnsetup
	Namespace: zombieclientutils
	Checksum: 0xF98C7F91
	Offset: 0xC50
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function zombiespawnsetup(localclientnum)
{
	fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
}

/*
	Name: function_a17af3df
	Namespace: zombieclientutils
	Checksum: 0xEDBF37DE
	Offset: 0xC88
	Size: 0x1E4
	Parameters: 7
	Flags: Linked
*/
function function_a17af3df(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump === 1)
	{
		self stoprenderoverridebundle(#"hash_61ce0b7cea532e77");
		if(self.model === #"c_t9_zmb_zombie_light_body2")
		{
			self playrenderoverridebundle(#"hash_882e5d8c59f40a3");
			self callback::on_shutdown(&function_c88acbea);
		}
		else if(self.model === #"c_t9_zmb_ndu_zombie_shirtless2" || self.model === #"hash_16837b6c9b7a1881")
		{
			self playrenderoverridebundle(#"hash_5597c38c16f1dbe9");
			self callback::on_shutdown(&function_c88acbea);
		}
	}
	else
	{
		if(bwastimejump === 2)
		{
			function_c88acbea();
			self playrenderoverridebundle(#"hash_61ce0b7cea532e77");
		}
		else
		{
			function_c88acbea();
			self stoprenderoverridebundle(#"hash_61ce0b7cea532e77");
		}
	}
}

/*
	Name: function_c88acbea
	Namespace: zombieclientutils
	Checksum: 0x6387EC35
	Offset: 0xE78
	Size: 0xA4
	Parameters: 1
	Flags: Linked
*/
function function_c88acbea(params)
{
	if(self.model === #"c_t9_zmb_zombie_light_body2")
	{
		self stoprenderoverridebundle(#"hash_882e5d8c59f40a3");
	}
	else if(self.model === #"c_t9_zmb_ndu_zombie_shirtless2" || self.model === #"hash_16837b6c9b7a1881")
	{
		self stoprenderoverridebundle(#"hash_5597c38c16f1dbe9");
	}
}

/*
	Name: function_d2f27d26
	Namespace: zombieclientutils
	Checksum: 0x6A33507A
	Offset: 0xF28
	Size: 0xF6
	Parameters: 7
	Flags: Linked
*/
function function_d2f27d26(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump && self haspart(fieldname, "j_head"))
	{
		self.stunned_head_fx = function_239993de(fieldname, #"hash_24c6a9d87972dbc5", self, "j_head");
	}
	else if(isdefined(self.stunned_head_fx))
	{
		stopfx(fieldname, self.stunned_head_fx);
		self.stunned_head_fx = undefined;
	}
}

