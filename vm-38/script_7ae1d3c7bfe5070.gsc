#using script_311c446e3df6c3fa;
#using script_5458797d0d475250;
#using script_5ef14bd74fdef7c6;
#using scripts\core_common\beam_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_a8dddac2;

/*
	Name: function_c1aff0a5
	Namespace: namespace_a8dddac2
	Checksum: 0xF761906E
	Offset: 0x918
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c1aff0a5()
{
	level notify(47495172);
}

/*
	Name: init
	Namespace: namespace_a8dddac2
	Checksum: 0x2FB48BDF
	Offset: 0x938
	Size: 0x934
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::register("actor", "" + #"hash_4a5eb7837f9fd1ba", 1, 1, "counter", &function_7bb3107e, 0, 0);
	clientfield::register("actor", "" + #"hash_11839f68b17da97a", 1, 1, "counter", &function_651b7e42, 0, 0);
	clientfield::register("actor", "" + #"hash_3b24d38fe21de8fd", 1, 1, "int", &function_18f73941, 0, 0);
	clientfield::register("actor", "" + #"hash_6f2c45f149dc1e5d", 1, 1, "counter", &function_87208d06, 0, 0);
	clientfield::register("missile", "" + #"hash_73b8798f1d815108", 1, 1, "int", &function_e095cbef, 0, 0);
	clientfield::register("toplayer", "fogofwareffects", 1, 1, "int", undefined, 0, 1);
	clientfield::register("toplayer", "" + #"hash_1509a2aa5d40a44c", 1, 1, "int", &function_b0f10fd9, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_55456562f670860", 1, 1, "int", &function_9b05e2c0, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_7289d683073752c8", 1, 1, "int", &function_e495fd3e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5b48c7bf93fc3a4b", 1, 1, "int", &function_f621928c, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4b03e692ae3dfa64", 1, 1, "counter", &function_a84c11f7, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6ba3e6fd544c34a5", 1, 2, "int", &function_5c05a55e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2ad0f9c6cbc5eed", 1, 1, "counter", &function_204364c2, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_77d7a6f3a8842303", 1, 1, "int", &function_f9ecb065, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_54a76d632c7c51", 1, 1, "int", &crystal_fx, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4d2911e91cdb1e91", 1, 1, "int", &function_bb8c1f5e, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1b9d966608efb40e", 1, 1, "counter", &function_8d5df064, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_1588c103924da726", 1, 1, "int", &function_7c1ee869, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_5e0a6fc6597e6e03", 1, 1, "counter", &function_5066198d, 0, 0);
	clientfield::register("scriptmover", "" + #"wall_smash", 1, 1, "counter", &function_d147715f, 0, 0);
	clientfield::register("vehicle", "" + #"hash_485fe8f642043f78", 1, 1, "counter", &function_e2f489c, 0, 0);
	clientfield::register("vehicle", "" + #"hash_4145b0d4262e2782", 1, 1, "counter", &function_26e6cccc, 0, 0);
	clientfield::register("world", "" + #"hash_2509c24cd62ed5bc", 1, 1, "int", &function_e9a10998, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_419ce223196785ef", 1, 1, "counter", &function_a5f3bfc2, 0, 0);
	clientfield::register("world", "" + #"hash_5940bc2717a75c96", 1, 1, "int", &function_aecabc8a, 0, 0);
	clientfield::register("world", "" + #"hash_7b50097ac4242bc9", 1, getminbitcountfornum(3), "int", &function_6b85db33, 0, 0);
	level.var_9b6e1cc9 = namespace_6783631d::register();
	if(!zm_utility::function_e51dc2d8())
	{
		return;
	}
	callback::on_localclient_connect(&on_localclient_connect);
}

/*
	Name: on_localclient_connect
	Namespace: namespace_a8dddac2
	Checksum: 0xD826EF52
	Offset: 0x1278
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function on_localclient_connect(localclientnum)
{
	level thread function_347f52dd(localclientnum);
}

/*
	Name: function_347f52dd
	Namespace: namespace_a8dddac2
	Checksum: 0x28D0BA90
	Offset: 0x12A8
	Size: 0xF4
	Parameters: 1
	Flags: Linked, Private
*/
function private function_347f52dd(localclientnum)
{
	self notify("1b5043fd5acb6b04");
	self endon("1b5043fd5acb6b04");
	var_ef2f4cec = spawnstruct();
	var_ef2f4cec.var_e450444f = 0;
	while(true)
	{
		var_d017e788 = function_5c10bd79(localclientnum);
		if(!isdefined(var_d017e788))
		{
			waitframe(1);
			continue;
		}
		b_state = var_d017e788 clientfield::get_to_player("fogofwareffects");
		if(var_ef2f4cec.var_e450444f !== b_state)
		{
			var_ef2f4cec function_d45dd62(localclientnum, b_state, var_d017e788);
			var_ef2f4cec.var_e450444f = b_state;
		}
		waitframe(1);
	}
}

/*
	Name: function_d45dd62
	Namespace: namespace_a8dddac2
	Checksum: 0x8CC1D627
	Offset: 0x13A8
	Size: 0x196
	Parameters: 3
	Flags: Linked, Private
*/
function private function_d45dd62(localclientnum, b_state, var_d017e788)
{
	if(b_state == 1)
	{
		if(!isdefined(var_d017e788.var_103fdf58))
		{
			playsound(localclientnum, #"hash_7b5289d48cc02d77", (0, 0, 0));
			var_d017e788.var_103fdf58 = var_d017e788 playloopsound("evt_sr_phase_player_lp");
		}
		if(!function_148ccc79(localclientnum, #"hash_2964f82e2c05c8b8"))
		{
			function_a837926b(localclientnum, #"hash_2964f82e2c05c8b8");
			self.var_7bd7bdc8 = #"hash_2964f82e2c05c8b8";
		}
	}
	else
	{
		if(isdefined(var_d017e788.var_103fdf58))
		{
			playsound(localclientnum, #"hash_37b1613c2cb4c8f3", (0, 0, 0));
			var_d017e788 stoploopsound(var_d017e788.var_103fdf58);
			var_d017e788.var_103fdf58 = undefined;
		}
		if(isdefined(self.var_7bd7bdc8))
		{
			if(function_148ccc79(localclientnum, self.var_7bd7bdc8))
			{
				function_24cd4cfb(localclientnum, self.var_7bd7bdc8);
			}
			self.var_7bd7bdc8 = undefined;
		}
	}
}

/*
	Name: function_9b05e2c0
	Namespace: namespace_a8dddac2
	Checksum: 0xD629D89A
	Offset: 0x1548
	Size: 0xDC
	Parameters: 7
	Flags: Linked
*/
function function_9b05e2c0(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(self.model === #"hash_1d9e6c13811400c6" || self.model === #"hash_1d9e6b138113ff13")
	{
		var_ee6bcd51 = #"hash_1a6400b20e8126bf";
	}
	else
	{
		var_ee6bcd51 = #"hash_4a9cb80afea6f8cb";
	}
	if(bwastimejump)
	{
		self function_bf9d3071(var_ee6bcd51);
	}
	else
	{
		self function_5d482e78(var_ee6bcd51);
	}
}

/*
	Name: function_f9ecb065
	Namespace: namespace_a8dddac2
	Checksum: 0x25B0C12F
	Offset: 0x1630
	Size: 0x21C
	Parameters: 7
	Flags: Linked
*/
function function_f9ecb065(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self useanimtree("generic");
	if(bwastimejump == 1)
	{
		self setanim("p9_fxanim_zm_tungsten_pn_full_ani");
		if(isdefined(self.var_f1c4246e))
		{
			self stoploopsound(self.var_f1c4246e);
		}
		self.var_67819d90 = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_tungsten_neutralizer_loop", self, "tag_origin");
		self playsound(fieldname, #"hash_1538fd1c5b0e4f80");
		self.var_eb1b20d = self playloopsound(#"hash_3d77ba3fcee6d3a5");
	}
	else
	{
		self notify(#"deactivate");
		self clearanim("p9_fxanim_zm_tungsten_pn_full_ani", 1);
		if(isdefined(self.var_67819d90))
		{
			stopfx(fieldname, self.var_67819d90);
			self.var_67819d90 = undefined;
		}
		self playsound(fieldname, #"hash_3586b76b932a0795");
		if(isdefined(self.var_eb1b20d))
		{
			self stoploopsound(self.var_eb1b20d);
			self.var_eb1b20d = undefined;
		}
		self function_78233d29(self.var_ee6bcd51, "", "Alpha", 0);
	}
}

/*
	Name: function_8d5df064
	Namespace: namespace_a8dddac2
	Checksum: 0x6BC9F338
	Offset: 0x1858
	Size: 0xDE
	Parameters: 7
	Flags: Linked
*/
function function_8d5df064(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self.n_fx_id = playfx(bwastimejump, "maps/zm_tungsten/fx9_zm_catalyzed_crystal_ambient", self.origin);
	self.var_469b2e53 = self playloopsound(#"hash_7bd1dac66847ea05");
	self waittill(#"death");
	if(isdefined(self.n_fx_id))
	{
		killfx(bwastimejump, self.n_fx_id);
		self.n_fx_id = undefined;
	}
}

/*
	Name: function_5066198d
	Namespace: namespace_a8dddac2
	Checksum: 0xC372BCCA
	Offset: 0x1940
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_5066198d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "maps/zm_tungsten/fx9_zm_wall_destruction_c4_exp", self, "tag_origin");
}

/*
	Name: function_d147715f
	Namespace: namespace_a8dddac2
	Checksum: 0x14F46FFC
	Offset: 0x19B0
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_d147715f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "maps/zm_tungsten/fx9_zm_abom_hit_wall_smk", self, "tag_origin");
}

/*
	Name: function_7c1ee869
	Namespace: namespace_a8dddac2
	Checksum: 0xE77D279D
	Offset: 0x1A20
	Size: 0x10E
	Parameters: 7
	Flags: Linked
*/
function function_7c1ee869(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_50573acf = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_crystal_grenade_ambient", self, "tag_origin");
		self.var_141a532a = self playloopsound(#"hash_1ef3679818a3b94");
	}
	else
	{
		if(isdefined(self.var_50573acf))
		{
			stopfx(fieldname, self.var_50573acf);
			self.var_50573acf = undefined;
		}
		if(isdefined(self.var_141a532a))
		{
			self stoploopsound(self.var_141a532a);
			self.var_141a532a = undefined;
		}
	}
}

/*
	Name: function_e095cbef
	Namespace: namespace_a8dddac2
	Checksum: 0x88B27D9C
	Offset: 0x1B38
	Size: 0xD4
	Parameters: 7
	Flags: Linked
*/
function function_e095cbef(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_fac7e686 = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_crystal_grenade_ambient", self, "tag_origin");
	}
	else
	{
		if(isdefined(self.var_fac7e686))
		{
			stopfx(fieldname, self.var_fac7e686);
			self.var_fac7e686 = undefined;
		}
		util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_crystal_grenade_exp", self, "tag_origin");
	}
}

/*
	Name: function_bb8c1f5e
	Namespace: namespace_a8dddac2
	Checksum: 0x6C0407B0
	Offset: 0x1C18
	Size: 0x17C
	Parameters: 7
	Flags: Linked
*/
function function_bb8c1f5e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_a65735b6 = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_dark_crystals_ambient", self, "tag_origin");
		soundloopemitter(#"hash_1aebc516d61c565c", self.origin + vectorscale((0, 0, 1), 30));
	}
	else
	{
		if(isdefined(self.var_a65735b6))
		{
			stopfx(fieldname, self.var_a65735b6);
			self.var_a65735b6 = undefined;
		}
		soundstoploopemitter(#"hash_1aebc516d61c565c", self.origin + vectorscale((0, 0, 1), 30));
		playsound(fieldname, #"hash_10e0a1ad837bef3c", self.origin + vectorscale((0, 0, 1), 30));
		util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_dark_aether_crystals_exp", self, "tag_origin");
	}
}

/*
	Name: function_7bb3107e
	Namespace: namespace_a8dddac2
	Checksum: 0x48D6DB6C
	Offset: 0x1DA0
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_7bb3107e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self setanim(#"hash_1e7cab02cd774616");
	wait(getanimlength("aib_t9_zm_abom_swallow_crystal_01"));
	if(isalive(self))
	{
		self clearanim("aib_t9_zm_abom_swallow_crystal_01", 0.2);
	}
}

/*
	Name: crystal_fx
	Namespace: namespace_a8dddac2
	Checksum: 0x23A1137E
	Offset: 0x1E60
	Size: 0x134
	Parameters: 7
	Flags: Linked
*/
function crystal_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_a5ded638 = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_phase_catalyzed_crystal_ambient", self, "tag_origin");
		self.var_469b2e53 = self playloopsound(#"hash_1c52e7ca3cde1126");
	}
	else
	{
		if(isdefined(self.var_a5ded638))
		{
			stopfx(fieldname, self.var_a5ded638);
			self.var_a5ded638 = undefined;
		}
		if(isdefined(self.var_469b2e53))
		{
			self stoploopsound(self.var_469b2e53);
			self.var_469b2e53 = undefined;
		}
		util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_phase_catalyzed_crystal_breaking", self, "tag_origin");
	}
}

/*
	Name: function_204364c2
	Namespace: namespace_a8dddac2
	Checksum: 0x6F0538B4
	Offset: 0x1FA0
	Size: 0xCA
	Parameters: 7
	Flags: Linked
*/
function function_204364c2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "sr/fx9_obj_secure_rocket_essence_absorb", self, "tag_monitor");
	self playsound(bwastimejump, #"hash_2fae425a6d8e1256");
	self.var_7d8e0749 = self.var_7d8e0749 + 40;
	if(self.var_7d8e0749 > 100)
	{
		self.var_7d8e0749 = 100;
	}
}

/*
	Name: function_651b7e42
	Namespace: namespace_a8dddac2
	Checksum: 0xC5B7EB71
	Offset: 0x2078
	Size: 0x64
	Parameters: 7
	Flags: Linked
*/
function function_651b7e42(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "maps/zm_tungsten/fx9_zm_zombie_dark_black_ambients", self, "tag_origin");
}

/*
	Name: function_a84c11f7
	Namespace: namespace_a8dddac2
	Checksum: 0x4579D60D
	Offset: 0x20E8
	Size: 0x1D6
	Parameters: 7
	Flags: Linked
*/
function function_a84c11f7(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self.var_ee6bcd51 = "rob_zm_fuel_tank_script";
	var_1105889c = 0;
	self.var_38fee6d5 = 100;
	self.var_7d8e0749 = self.var_38fee6d5;
	self function_bf9d3071(self.var_ee6bcd51);
	self function_78233d29(self.var_ee6bcd51, "", "Brightness", 1);
	self function_78233d29(self.var_ee6bcd51, "", "Alpha", var_1105889c);
	self playsound(bwastimejump, #"hash_61951b05c7932ba6");
	self.var_f1c4246e = self playloopsound(#"hash_22d6d61841f2b48a");
	while(true)
	{
		wait(0.5);
		var_1105889c = var_1105889c + 0.01;
		self function_78233d29(self.var_ee6bcd51, "", "Alpha", var_1105889c);
		if(var_1105889c >= 1)
		{
			var_1105889c = 1;
			break;
		}
	}
}

/*
	Name: function_2117533c
	Namespace: namespace_a8dddac2
	Checksum: 0x7B6D89CD
	Offset: 0x22C8
	Size: 0xF8
	Parameters: 1
	Flags: Linked
*/
function function_2117533c(localclientnum)
{
	self endon(#"deactivate");
	var_1105889c = self.var_7d8e0749 / self.var_38fee6d5;
	wait(3.1);
	while(true)
	{
		wait(0.25);
		if(isdefined(self.var_7d8e0749) && self.var_7d8e0749 > 0)
		{
			self.var_7d8e0749 = self.var_7d8e0749 - 1;
			if(self.var_7d8e0749 < 15)
			{
				self.var_7d8e0749 = 15;
			}
		}
		if(isdefined(self.var_7d8e0749))
		{
			var_1105889c = self.var_7d8e0749 / self.var_38fee6d5;
			self function_78233d29(self.var_ee6bcd51, "", "Alpha", var_1105889c);
		}
	}
}

/*
	Name: function_5c05a55e
	Namespace: namespace_a8dddac2
	Checksum: 0xCCDF186F
	Offset: 0x23C8
	Size: 0x37E
	Parameters: 7
	Flags: Linked
*/
function function_5c05a55e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self.var_b235555f))
	{
		killfx(binitialsnap, self.var_b235555f);
		self.var_b235555f = undefined;
	}
	if(isdefined(self.var_b880246b))
	{
		self stoploopsound(self.var_b880246b);
		self.var_b880246b = undefined;
	}
	if(bwastimejump == 1)
	{
		if(!isdefined(self.b_activated))
		{
			self.b_activated = 1;
			self thread function_2117533c(binitialsnap);
		}
		self.var_b235555f = util::playfxontag(binitialsnap, "sr/fx9_mq_phase_neutralizer_shield", self, "tag_origin");
		self.var_b880246b = self playloopsound(#"hash_28d37680253cb1ae");
		if(fieldname == 2 || fieldname == 3)
		{
			self playsound(binitialsnap, #"hash_4bc133d528c81c3");
		}
	}
	else
	{
		if(bwastimejump == 2)
		{
			self.var_b235555f = util::playfxontag(binitialsnap, "maps/zm_tungsten/fx9_zm_tungsten_phase_neutralizer_shield_large", self, "tag_origin");
			self.var_b880246b = self playloopsound(#"hash_6b0024b500e39996");
			if(fieldname == 1)
			{
				self playsound(binitialsnap, #"hash_37821c226fc8accc");
			}
			else if(fieldname == 3)
			{
				self playsound(binitialsnap, #"hash_4bc133d528c81c3");
			}
		}
		else
		{
			if(bwastimejump == 3)
			{
				self.var_b235555f = util::playfxontag(binitialsnap, "maps/zm_tungsten/fx9_zm_tungsten_phase_neutralizer_shield_big", self, "tag_origin");
				self.var_b880246b = self playloopsound(#"hash_40060e2917f3fb33");
				if(fieldname == 1 || fieldname == 2)
				{
					self playsound(binitialsnap, #"hash_37821c226fc8accc");
				}
			}
			else
			{
				if(isdefined(self.var_b235555f))
				{
					killfx(binitialsnap, self.var_b235555f);
					self.var_b235555f = undefined;
				}
				if(isdefined(self.var_b880246b))
				{
					self stoploopsound(self.var_b880246b);
					self.var_b880246b = undefined;
				}
			}
		}
	}
}

/*
	Name: function_f621928c
	Namespace: namespace_a8dddac2
	Checksum: 0x78F690C9
	Offset: 0x2750
	Size: 0x15C
	Parameters: 7
	Flags: Linked
*/
function function_f621928c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.var_1b7a4481 = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_crystals_orbs_trail", self, "tag_origin");
		self.var_7d2ad612 = self playloopsound(#"hash_227bf6d9c3bba85");
	}
	else
	{
		if(isdefined(self.var_1b7a4481))
		{
			stopfx(fieldname, self.var_1b7a4481);
			self.var_1b7a4481 = undefined;
		}
		if(isdefined(self.var_7d2ad612))
		{
			self stoploopsound(self.var_7d2ad612);
			self.var_7d2ad612 = undefined;
		}
		playsound(fieldname, #"hash_98b4462bc702629", self.origin);
		util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_crystals_orbs_exp", self, "tag_origin");
	}
}

/*
	Name: function_e2f489c
	Namespace: namespace_a8dddac2
	Checksum: 0x9718450B
	Offset: 0x28B8
	Size: 0x9C
	Parameters: 7
	Flags: Linked
*/
function function_e2f489c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	util::playfxontag(bwastimejump, "explosions/fx9_vexp_rcxd_exp", self, "tag_origin");
	playsound(bwastimejump, #"hash_49567ef6e7579f2", self.origin + vectorscale((0, 0, 1), 20));
}

/*
	Name: function_26e6cccc
	Namespace: namespace_a8dddac2
	Checksum: 0x3252E21B
	Offset: 0x2960
	Size: 0x164
	Parameters: 7
	Flags: Linked
*/
function function_26e6cccc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	util::playfxontag(bwastimejump, "maps/zm_tungsten/fx9_zm_rcxd_born", self, "tag_origin");
	playsound(bwastimejump, #"hash_828435c0edc0e5c", self.origin + vectorscale((0, 0, 1), 20));
	if(self.model === #"hash_7dde995ef49216f")
	{
		n_delay = 1;
		var_b978a3c9 = 0;
		wait(20);
		while(true)
		{
			if(isdefined(self))
			{
				self playsound(bwastimejump, "mpl_veh_recon_alert");
				wait(n_delay);
				var_b978a3c9++;
				if(var_b978a3c9 === 3)
				{
					n_delay = 0.5;
				}
				else if(var_b978a3c9 === 6)
				{
					n_delay = 0.1;
				}
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_e495fd3e
	Namespace: namespace_a8dddac2
	Checksum: 0x570698A9
	Offset: 0x2AD0
	Size: 0xAE
	Parameters: 7
	Flags: Linked
*/
function function_e495fd3e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump === 1)
	{
		self.var_52240bf2 = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_energy_barrier_area", self, "tag_origin");
	}
	else if(isdefined(self.var_52240bf2))
	{
		stopfx(fieldname, self.var_52240bf2);
		self.var_52240bf2 = undefined;
	}
}

/*
	Name: function_b0f10fd9
	Namespace: namespace_a8dddac2
	Checksum: 0x68EA8D03
	Offset: 0x2B88
	Size: 0x1AE
	Parameters: 7
	Flags: Linked
*/
function function_b0f10fd9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(self isplayer())
		{
			self postfx::playpostfxbundle(#"hash_155ea60c5e7f292e");
			self postfx::playpostfxbundle(#"hash_30968a1635fb3366");
			self function_116b95e5(#"hash_155ea60c5e7f292e", #"hash_77259d33b3998de9", 0.3);
			self function_116b95e5(#"hash_155ea60c5e7f292e", #"hash_1a3ba6e8a0732aac", 0.8);
			self.var_a74ce90c = 1;
		}
	}
	else
	{
		if(function_65b9eb0f(fieldname))
		{
			return;
		}
		if(self isplayer())
		{
			self postfx::exitpostfxbundle(#"hash_155ea60c5e7f292e");
			self postfx::exitpostfxbundle(#"hash_30968a1635fb3366");
			self.var_a74ce90c = undefined;
		}
	}
}

/*
	Name: function_87208d06
	Namespace: namespace_a8dddac2
	Checksum: 0xC55C8C4A
	Offset: 0x2D40
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_87208d06(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	wait(3);
	if(isdefined(self))
	{
		util::playfxontag(bwastimejump, "zm_ai/fx9_abom_gulp_crystal_ambient", self, "j_tail_neck");
	}
}

/*
	Name: function_18f73941
	Namespace: namespace_a8dddac2
	Checksum: 0x4675CC5F
	Offset: 0x2DC0
	Size: 0x25C
	Parameters: 7
	Flags: Linked
*/
function function_18f73941(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		str_fx_tag = (isdefined(self gettagorigin("j_spine4")) ? "j_spine4" : "tag_origin");
		var_9b69599b = struct::get("gp_machine");
		var_bacf9f1e = struct::get("gp_machine_fx");
		if(isdefined(var_9b69599b))
		{
			var_23563ba5 = util::spawn_model(fieldname, "tag_origin", var_9b69599b.origin);
		}
		if(isdefined(var_bacf9f1e))
		{
			var_ea7f8dca = util::spawn_model(fieldname, "tag_origin", var_bacf9f1e.origin, var_bacf9f1e.angles);
		}
		if(isdefined(var_23563ba5))
		{
			self.beam_id = self beam::launch(self, str_fx_tag, var_23563ba5, "tag_origin", "beam9_zm_aat_dead_wire_arc");
			playsound(fieldname, #"hash_44ae4884e8776cc", var_23563ba5.origin);
			self thread function_149bbdd9(fieldname, str_fx_tag, var_23563ba5, "tag_origin", 3);
		}
		wait(0.1);
		if(isdefined(var_ea7f8dca))
		{
			var_ea7f8dca.n_fx_id = util::playfxontag(fieldname, "maps/zm_tungsten/fx9_zm_arcade_cabinet_elec_spark", var_ea7f8dca, "tag_origin");
			var_ea7f8dca thread function_695e2e56(fieldname);
		}
	}
	else if(isdefined(self.beam_id))
	{
		beam::kill(self, str_fx_tag, var_23563ba5, "tag_origin", "beam9_zm_aat_dead_wire_arc");
	}
}

/*
	Name: function_695e2e56
	Namespace: namespace_a8dddac2
	Checksum: 0x63BA7FC2
	Offset: 0x3028
	Size: 0x46
	Parameters: 1
	Flags: Linked
*/
function function_695e2e56(localclientnum)
{
	wait(6);
	if(isdefined(self.n_fx_id))
	{
		stopfx(localclientnum, self.n_fx_id);
		self.n_fx_id = undefined;
	}
}

/*
	Name: function_149bbdd9
	Namespace: namespace_a8dddac2
	Checksum: 0xD6158882
	Offset: 0x3078
	Size: 0x74
	Parameters: 5
	Flags: Linked
*/
function function_149bbdd9(localclientnum, str_fx_tag, var_23563ba5, var_94df3b7b, waittime)
{
	level endon(#"game_ended");
	wait(waittime);
	if(isdefined(self))
	{
		beam::kill(self, str_fx_tag, var_23563ba5, var_94df3b7b, "beam9_zm_aat_dead_wire_arc");
	}
}

/*
	Name: function_e9a10998
	Namespace: namespace_a8dddac2
	Checksum: 0xEBAE43E9
	Offset: 0x30F8
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function function_e9a10998(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		forcestreamxmodel(#"hash_2370a0aa7155ca07");
		function_3385d776(#"hash_122a51c7a09dab6b");
	}
	else
	{
		stopforcestreamingxmodel(#"hash_2370a0aa7155ca07");
		function_c22a1ca2(#"hash_122a51c7a09dab6b");
	}
	level thread function_38b121cf(bwastimejump);
}

/*
	Name: function_38b121cf
	Namespace: namespace_a8dddac2
	Checksum: 0xC0D9EBE5
	Offset: 0x31E8
	Size: 0x1C0
	Parameters: 1
	Flags: Linked
*/
function function_38b121cf(newval)
{
	var_f1f2f161 = [15:"gfx_web_patch_em_gp_i06", 14:"gfx8_fog_slow_lg_anim_lit", 13:"gfx8_fog_slow_lg_anim_em_gp_i06_full_lite", 12:"gfx_lightning_cloud_em_gp_i06", 11:"gfx_lightning_beam_em_pb_i16", 10:"gfx9_elec_lightning_circle_energy_em_gp_i06", 9:"gfx8_smk_md_thick_scatter_anim_lit", 8:"gfx8_smk_md_thick_lobe_anim_lit", 7:"gfx9_fire_sm_base_anim_hdrg_exp_purple", 6:"gfx9_fire_md_lick_dissipate_anim_rof_hdrg", 5:"gfx9_fire_md_lick_deplete_anim_rof_hdrg", 4:"gfx9_fire_md_lick_dissipate_anim_purple_hdrg", 3:"gfx9_fire_md_lick_deplete_anim_purple_hdrg", 2:"gfx9_fire_sm_lick_short_curl_anim_hdrg_exp_purple", 1:"gfx8_shockwave_anim_em_gp_i06", 0:"gfx8_shockwave_elec_anim_em_pb_i16"];
	foreach(var_53edfe53 in var_f1f2f161)
	{
		if(newval)
		{
			forcestreammaterial(var_53edfe53);
			continue;
		}
		stopforcestreamingmaterial(var_53edfe53);
	}
}

/*
	Name: function_a5f3bfc2
	Namespace: namespace_a8dddac2
	Checksum: 0x569D0F1F
	Offset: 0x33B0
	Size: 0x5C
	Parameters: 7
	Flags: Linked
*/
function function_a5f3bfc2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self function_bf9d3071(#"hash_497cc7cd78d13d4e");
}

/*
	Name: function_aecabc8a
	Namespace: namespace_a8dddac2
	Checksum: 0x72F2FD8D
	Offset: 0x3418
	Size: 0x220
	Parameters: 7
	Flags: Linked
*/
function function_aecabc8a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_3f41835d))
	{
		level.var_3f41835d = getdynentarray(#"hash_44bc86e237774e32", 1);
	}
	if(!isdefined(level.var_55f82e4e))
	{
		level.var_55f82e4e = getdynentarray(#"hash_58429c810ec1d78a", 1);
	}
	if(bwastimejump == 1)
	{
		var_a6e81c57 = arraycombine(level.var_3f41835d, level.var_55f82e4e);
		foreach(var_aa3984f0 in var_a6e81c57)
		{
			function_e2a06860(fieldname, var_aa3984f0, 2);
			function_75d53026(var_aa3984f0);
		}
	}
	else
	{
		foreach(var_aa3984f0 in level.var_3f41835d)
		{
			function_e2a06860(fieldname, var_aa3984f0, 0);
		}
	}
}

/*
	Name: function_6b85db33
	Namespace: namespace_a8dddac2
	Checksum: 0xA45D53E3
	Offset: 0x3640
	Size: 0x4EC
	Parameters: 7
	Flags: Linked
*/
function function_6b85db33(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump === 1)
	{
		level.var_5ac1ae9c = 1;
		forcestreamxmodel(#"hash_2676ba5ee50e609b");
		forcestreamxmodel(#"hash_2676bf5ee50e691a");
		forcestreamxmodel(#"hash_2676be5ee50e6767");
		forcestreamxmodel(#"hash_5d5d8e4791668a70");
		forcestreamxmodel(#"hash_5d5d8f4791668c23");
		forcestreamxmodel(#"hash_5d5d9447916694a2");
		forcestreamxmodel(#"hash_5d5d954791669655");
		forcestreamxmodel(#"hash_5d5d92479166913c");
	}
	else if(fieldname === 1)
	{
		stopforcestreamingxmodel(#"hash_2676ba5ee50e609b");
		stopforcestreamingxmodel(#"hash_2676bf5ee50e691a");
		stopforcestreamingxmodel(#"hash_2676be5ee50e6767");
		stopforcestreamingxmodel(#"hash_5d5d8e4791668a70");
		stopforcestreamingxmodel(#"hash_5d5d8f4791668c23");
		stopforcestreamingxmodel(#"hash_5d5d9447916694a2");
		stopforcestreamingxmodel(#"hash_5d5d954791669655");
		stopforcestreamingxmodel(#"hash_5d5d92479166913c");
	}
	if(bwastimejump === 2)
	{
		forcestreamxmodel(#"hash_6ecb1d8b25490379");
		forcestreamxmodel(#"hash_6ecb1b8b25490013");
	}
	else if(fieldname === 2)
	{
		stopforcestreamingxmodel(#"hash_6ecb1d8b25490379");
		stopforcestreamingxmodel(#"hash_6ecb1b8b25490013");
	}
	if(bwastimejump === 3)
	{
		forcestreamxmodel(#"hash_6ecb1d8b25490379");
		forcestreamxmodel(#"hash_6ecb1b8b25490013");
		forcestreamxmodel(#"hash_4f29ef57be52ff53");
		forcestreamxmodel(#"hash_77c9ad3e788f76e0");
		forcestreamxmodel(#"hash_4d930f46137443f5");
		forcestreamxmodel(#"hash_7dde0d6fcb87c79a");
		forcestreamxmodel(#"hash_54e30f7b1638eb6f");
	}
	else if(fieldname === 3)
	{
		stopforcestreamingxmodel(#"hash_6ecb1d8b25490379");
		stopforcestreamingxmodel(#"hash_6ecb1b8b25490013");
		stopforcestreamingxmodel(#"hash_4f29ef57be52ff53");
		stopforcestreamingxmodel(#"hash_77c9ad3e788f76e0");
		stopforcestreamingxmodel(#"hash_4d930f46137443f5");
		stopforcestreamingxmodel(#"hash_7dde0d6fcb87c79a");
		stopforcestreamingxmodel(#"hash_54e30f7b1638eb6f");
	}
}

