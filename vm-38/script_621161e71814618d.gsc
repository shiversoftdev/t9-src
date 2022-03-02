#using script_10c3f96a6d1d5b35;
#using script_12a07c0a6ec3b0e;
#using script_1611421ee9b880d3;
#using script_179ba564f65e92c5;
#using script_17a9d06bf819b2d3;
#using script_1fe1c6847ce5cb46;
#using script_26df4fcdb3397fd4;
#using script_2c5f2d4e7aa698c4;
#using script_2c8fd33ddb45e78b;
#using script_382ba4154c04904e;
#using script_3aad1d287a89fa82;
#using script_3dc7e0c7f9c90bdb;
#using script_478fc2f0b6421a32;
#using script_581877678e31274c;
#using script_5ef14bd74fdef7c6;
#using script_6243781aa5394e62;
#using script_68732f44626820ed;
#using script_76b36ed1b7a51ed2;
#using script_77597bfbc6274baf;
#using script_7ae1d3c7bfe5070;
#using script_7fc5045bca241a8b;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm.csc;
#using scripts\zm_common\zm_pack_a_punch.csc;
#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_weapons.csc;

#namespace namespace_96b7f11d;

/*
	Name: function_8fd18a15
	Namespace: namespace_96b7f11d
	Checksum: 0x43BBC3BC
	Offset: 0x6E8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8fd18a15()
{
	level notify(21823655);
}

/*
	Name: opt_in
	Namespace: namespace_96b7f11d
	Checksum: 0xAEB3622
	Offset: 0x708
	Size: 0x24
	Parameters: 0
	Flags: AutoExec
*/
function autoexec opt_in()
{
	level.aat_in_use = 1;
	level.var_1d1a6e08 = 1;
}

/*
	Name: main
	Namespace: namespace_96b7f11d
	Checksum: 0xE0B17E2C
	Offset: 0x738
	Size: 0xEF4
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_5b1144e::function_5ae4a10c("p9_zm_gold_teleporter_b", "tungsten_portal_obj", #"hash_7df7e1092633642e", #"hash_5b20033c44a4321f", #"hash_651bd0a238dd47d5");
	namespace_5b1144e::function_5ae4a10c("p9_zm_gold_teleporter_dmg", "tungsten_portal_obj", #"hash_7df7e1092633642e", #"hash_5b20033c44a4321f", #"hash_651bd0a238dd47d5");
	namespace_5b1144e::function_5ae4a10c("p9_fxp_zm_portal_aether_modular_dest_amerika_to_observation_from_under", "tungsten_portal_obj", #"hash_7df7e1092633642e", #"hash_5b20033c44a4321f", #"hash_651bd0a238dd47d5");
	namespace_5b1144e::function_5ae4a10c(undefined, "platinum_rappel_obj", #"hash_337db80f69d05548", #"hash_5b20033c44a4321f", #"hash_2f664e8e6f88f16");
	namespace_5b1144e::function_5ae4a10c(undefined, "platinum_zipline_obj", #"hash_6d0057fa066d6733", #"hash_5b20033c44a4321f", #"hash_2f664e8e6f88f16");
	namespace_5b1144e::function_5ae4a10c("p9_fxanim_zm_platinum_rappel_mod", "platinum_rappel_door_obj", #"hash_50ac7af2c5bc8257", #"hash_5f3108a8ed351288", #"hash_74b8c57369bfb24b");
	namespace_5b1144e::function_5ae4a10c("p9_fxanim_zm_platinum_zipline_mod", "platinum_zipline_door_obj", #"hash_59bd96ed40a5975e", undefined, #"hash_6e7ff1a0f66deab4");
	namespace_5b1144e::function_5ae4a10c("p8_zm_off_trap_switch_box", "tungsten_hind_trap_switch_obj", #"hash_3fe2d338feb5f7b4", #"hash_5b20033c44a4321f", #"hash_2eabbc031eb54dc2");
	clientfield::function_a8bbc967("player_lives", #"zm_hud", #"player_lives", 1, 2, "int", undefined, 0, 0);
	clientfield::register("toplayer", "" + #"hash_464e0cd19b3b8c12", 1, 1, "int", &function_c2858d41, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_16e5e4d2ea0716b7", 1, 2, "int", &function_2879e60b, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_575d68a64ff032b2", 1, 1, "counter", &function_1fa52d9a, 0, 0);
	clientfield::register("toplayer", "" + #"hash_69dc133e22a2769f", 28000, 1, "int", &function_6b66a9a3, 0, 0);
	clientfield::register("toplayer", "" + #"hash_4cb4c776a64a6cca", 28000, getminbitcountfornum(5), "int", &function_fd7a1df2, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_27556b053ce9a6a2", 1, 1, "counter", &function_53c1bf22, 0, 0);
	clientfield::register("toplayer", "" + #"hash_d4826b65faa9efb", 28000, 1, "int", &function_996f5d0f, 0, 0);
	clientfield::register("toplayer", "" + #"hash_4c2c37e44f9d6cf4", 28000, 2, "int", &function_10537d85, 0, 0);
	clientfield::register("toplayer", "" + #"hash_4be33f9c734f0cb9", 1, getminbitcountfornum(4), "int", &namespace_c097de49::function_2f3017ad, 0, 0);
	clientfield::register("toplayer", "" + #"hash_7c5d3ac35353f95c", 28000, getminbitcountfornum(2), "int", &function_949d138a, 0, 0);
	clientfield::register("world", "" + #"hash_763dd8035e80f7c", 28000, 1, "int", &function_44dc8dc9, 0, 0);
	clientfield::register("world", "" + #"hash_7b3ada6e5b1cf81e", 1, 1, "int", &function_167fc35, 0, 0);
	clientfield::register("toplayer", "" + #"hash_56c7e620d1de163a", 1, 1, "counter", &function_33082eb4, 0, 0);
	clientfield::register("toplayer", "" + #"hash_4f232c4c4c5f7816", 1, 1, "int", &function_182ea9e4, 0, 0);
	clientfield::register("world", "" + #"hash_14197af7df70a497", 28000, 1, "int", &function_a146ac0f, 0, 0);
	clientfield::register("world", "" + #"hash_6ecd61d493349ec0", 28000, getminbitcountfornum(2), "int", &function_1d123acd, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_431b27e4b133e650", 28000, 1, "int", &function_5bc9772e, 0, 0);
	clientfield::register("world", "" + #"hash_1fb207d10fbe27ce", 28000, 1, "int", &function_51ee271b, 0, 0);
	clientfield::register("world", "" + #"hash_5a36f05cbdf2580", 28000, getminbitcountfornum(12), "int", &namespace_c097de49::function_933f292d, 0, 0);
	clientfield::register("allplayers", "" + #"hash_3198b85c253e79d4", 28000, 1, "int", &function_5414ee31, 0, 0);
	clientfield::register("actor", "" + #"hash_3e4641a9ea00d061", 28000, 1, "int", &function_eff937db, 0, 0);
	clientfield::register("world", "" + #"hash_2f4e23884d9865e1", 28000, 1, "int", &function_489caa85, 0, 0);
	clientfield::register("world", "" + #"hash_7fd166b952515da7", 28000, 1, "int", &function_72c3294, 0, 0);
	clientfield::register("world", "" + #"hash_3e71bd47ea1a6144", 28000, 1, "int", &function_43b0a4e2, 0, 0);
	clientfield::register("allplayers", "" + #"hash_73227fdae7d9bc0e", 28000, 1, "int", &function_1a91c8d3, 0, 0);
	clientfield::register("vehicle", "" + #"hash_66006a74a4ab8b8e", 28000, 1, "int", &function_9163efd4, 0, 0);
	clientfield::register("allplayers", "" + #"hash_1a529bb0de6717d5", 1, 1, "int", &function_61d33efe, 0, 0);
	clientfield::register("world", "" + #"hash_2a35f1483d5f5467", 1, 1, "int", &function_f2b7289d, 0, 0);
	clientfield::register("world", "" + #"hash_deec7a5e441c482", 1, 1, "int", &function_61297264, 0, 0);
	setdvar(#"hash_384191a42356d34", 1);
	setdvar(#"hash_64d8f355a9e6daa5", 1);
	setdvar(#"hash_2d56e13848a82d14", 0);
	setdvar(#"hash_b3395a8d3abf84a", 1);
	level.setupcustomcharacterexerts = &setup_personality_character_exerts;
	level.var_d0ab70a2 = #"hash_415d2f1314ea548a";
	namespace_4abf1500::function_88645994(#"hash_2315f92412308649");
	load::main();
	namespace_297ae820::init();
	namespace_ff7e490::init();
	namespace_e502fca8::init();
	namespace_a8dddac2::init();
	namespace_95c839d1::init();
	namespace_8a08914c::init();
	namespace_c097de49::init();
	namespace_dbaeabbd::init();
	namespace_60bf0cf2::init();
	namespace_edb23975::init();
	namespace_e5670722::init();
	setsoundcontext("dark_aether", "inactive");
	util::waitforclient(0);
	namespace_297ae820::function_dcf22669();
}

/*
	Name: setup_personality_character_exerts
	Namespace: namespace_96b7f11d
	Checksum: 0x7D0891B
	Offset: 0x1638
	Size: 0x282
	Parameters: 0
	Flags: Linked
*/
function setup_personality_character_exerts()
{
	level.exert_sounds[1][#"playerbreathinsound"] = "vox_plr_1_exert_sniper_hold";
	level.exert_sounds[2][#"playerbreathinsound"] = "vox_plr_2_exert_sniper_hold";
	level.exert_sounds[3][#"playerbreathinsound"] = "vox_plr_3_exert_sniper_hold";
	level.exert_sounds[4][#"playerbreathinsound"] = "vox_plr_4_exert_sniper_hold";
	level.exert_sounds[1][#"playerbreathoutsound"] = "vox_plr_1_exert_sniper_exhale";
	level.exert_sounds[2][#"playerbreathoutsound"] = "vox_plr_2_exert_sniper_exhale";
	level.exert_sounds[3][#"playerbreathoutsound"] = "vox_plr_3_exert_sniper_exhale";
	level.exert_sounds[4][#"playerbreathoutsound"] = "vox_plr_4_exert_sniper_exhale";
	level.exert_sounds[1][#"playerbreathgaspsound"] = "vox_plr_1_exert_sniper_gasp";
	level.exert_sounds[2][#"playerbreathgaspsound"] = "vox_plr_2_exert_sniper_gasp";
	level.exert_sounds[3][#"playerbreathgaspsound"] = "vox_plr_3_exert_sniper_gasp";
	level.exert_sounds[4][#"playerbreathgaspsound"] = "vox_plr_4_exert_sniper_gasp";
	level.exert_sounds[1][#"meleeswipesoundplayer"] = "vox_plr_1_exert_punch_give";
	level.exert_sounds[2][#"meleeswipesoundplayer"] = "vox_plr_2_exert_punch_give";
	level.exert_sounds[3][#"meleeswipesoundplayer"] = "vox_plr_3_exert_punch_give";
	level.exert_sounds[4][#"meleeswipesoundplayer"] = "vox_plr_4_exert_punch_give";
}

/*
	Name: function_c2858d41
	Namespace: namespace_96b7f11d
	Checksum: 0xE2E065E
	Offset: 0x18C8
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_c2858d41(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		function_f58e42ae(fieldname, 1);
	}
	else
	{
		function_f58e42ae(fieldname, 0);
	}
}

/*
	Name: function_2879e60b
	Namespace: namespace_96b7f11d
	Checksum: 0x4CFA94A3
	Offset: 0x1950
	Size: 0x18A
	Parameters: 7
	Flags: Linked
*/
function function_2879e60b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		if(isdefined(self.var_dd37157))
		{
			stopfx(fieldname, self.var_dd37157);
			self.var_dd37157 = undefined;
		}
		self.var_dd37157 = playfx(fieldname, #"hash_5e71af4ea513be2c", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
	if(bwasdemojump == 2)
	{
		if(isdefined(self.var_dd37157))
		{
			stopfx(fieldname, self.var_dd37157);
			self.var_dd37157 = undefined;
		}
		self.var_dd37157 = playfx(fieldname, #"hash_5e71bc4ea513d443", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
}

/*
	Name: function_1fa52d9a
	Namespace: namespace_96b7f11d
	Checksum: 0x9FADD102
	Offset: 0x1AE8
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function function_1fa52d9a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		playfx(fieldname, #"hash_179a76b8d709e8bb", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
}

/*
	Name: function_f2b7289d
	Namespace: namespace_96b7f11d
	Checksum: 0x8FC544F7
	Offset: 0x1B98
	Size: 0x138
	Parameters: 7
	Flags: Linked
*/
function function_f2b7289d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		var_92c5226e = struct::get_array("ts_zipline_frame");
		foreach(var_4b07d80a in var_92c5226e)
		{
			var_4b07d80a.var_cc1c5020 = util::spawn_model(fieldname, var_4b07d80a.model, var_4b07d80a.origin, var_4b07d80a.angles);
			var_4b07d80a.var_cc1c5020.var_fc558e74 = "platinum_zipline_obj";
			var_4b07d80a.var_cc1c5020 function_619a5c20();
		}
	}
}

/*
	Name: function_61297264
	Namespace: namespace_96b7f11d
	Checksum: 0x39A80FC5
	Offset: 0x1CD8
	Size: 0x138
	Parameters: 7
	Flags: Linked
*/
function function_61297264(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		var_e303ba30 = struct::get_array("ts_rappel_frame");
		foreach(var_4b07d80a in var_e303ba30)
		{
			var_4b07d80a.var_cc1c5020 = util::spawn_model(fieldname, var_4b07d80a.model, var_4b07d80a.origin, var_4b07d80a.angles);
			var_4b07d80a.var_cc1c5020.var_fc558e74 = "platinum_rappel_obj";
			var_4b07d80a.var_cc1c5020 function_619a5c20();
		}
	}
}

/*
	Name: function_6b66a9a3
	Namespace: namespace_96b7f11d
	Checksum: 0xDE76242D
	Offset: 0x1E18
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_6b66a9a3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
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

/*
	Name: function_fd7a1df2
	Namespace: namespace_96b7f11d
	Checksum: 0x9F4D805E
	Offset: 0x1F30
	Size: 0x5DA
	Parameters: 7
	Flags: Linked
*/
function function_fd7a1df2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 0:
		{
			stopforcestreamingxmodel(#"hash_76dd4f827daef371");
			stopforcestreamingxmodel(#"hash_72d2ae42e9973cad");
			stopforcestreamingxmodel(#"hash_5c35207bb157a661");
			stopforcestreamingxmodel(#"hash_2f9ea46c29003241");
			stopforcestreamingxmodel(#"hash_5d6f46eb355ec1cb");
			stopforcestreamingxmodel(#"hash_62e92c3479ce24e2");
			stopforcestreamingxmodel(#"hash_7689d161576092c2");
			stopforcestreamingxmodel(#"hash_59fc8173747a78ca");
			stopforcestreamingxmodel(#"hash_1d67a5d0f60e1ea");
			stopforcestreamingxmodel(#"hash_697445b9607e9d53");
			break;
		}
		case 1:
		{
			forcestreamxmodel(#"hash_76dd4f827daef371");
			forcestreamxmodel(#"hash_72d2ae42e9973cad");
			stopforcestreamingxmodel(#"hash_5c35207bb157a661");
			stopforcestreamingxmodel(#"hash_2f9ea46c29003241");
			stopforcestreamingxmodel(#"hash_1d67a5d0f60e1ea");
			stopforcestreamingxmodel(#"hash_697445b9607e9d53");
			break;
		}
		case 2:
		{
			forcestreamxmodel(#"hash_5c35207bb157a661");
			forcestreamxmodel(#"hash_2f9ea46c29003241");
			stopforcestreamingxmodel(#"hash_76dd4f827daef371");
			stopforcestreamingxmodel(#"hash_72d2ae42e9973cad");
			stopforcestreamingxmodel(#"hash_5d6f46eb355ec1cb");
			stopforcestreamingxmodel(#"hash_62e92c3479ce24e2");
			break;
		}
		case 3:
		{
			forcestreamxmodel(#"hash_5d6f46eb355ec1cb");
			forcestreamxmodel(#"hash_62e92c3479ce24e2");
			stopforcestreamingxmodel(#"hash_5c35207bb157a661");
			stopforcestreamingxmodel(#"hash_2f9ea46c29003241");
			stopforcestreamingxmodel(#"hash_7689d161576092c2");
			stopforcestreamingxmodel(#"hash_59fc8173747a78ca");
			break;
		}
		case 4:
		{
			forcestreamxmodel(#"hash_7689d161576092c2");
			forcestreamxmodel(#"hash_59fc8173747a78ca");
			stopforcestreamingxmodel(#"hash_5d6f46eb355ec1cb");
			stopforcestreamingxmodel(#"hash_62e92c3479ce24e2");
			stopforcestreamingxmodel(#"hash_1d67a5d0f60e1ea");
			stopforcestreamingxmodel(#"hash_697445b9607e9d53");
			break;
		}
		case 5:
		{
			forcestreamxmodel(#"hash_1d67a5d0f60e1ea");
			forcestreamxmodel(#"hash_697445b9607e9d53");
			stopforcestreamingxmodel(#"hash_7689d161576092c2");
			stopforcestreamingxmodel(#"hash_59fc8173747a78ca");
			stopforcestreamingxmodel(#"hash_76dd4f827daef371");
			stopforcestreamingxmodel(#"hash_72d2ae42e9973cad");
			break;
		}
	}
}

/*
	Name: function_53c1bf22
	Namespace: namespace_96b7f11d
	Checksum: 0xADD83391
	Offset: 0x2518
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_53c1bf22(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(isdefined(self))
	{
		if(bwastimejump)
		{
			playfx(fieldname, #"hash_7f2cfd191b43c6fa", self.origin);
		}
	}
}

/*
	Name: function_949d138a
	Namespace: namespace_96b7f11d
	Checksum: 0x9A4973AC
	Offset: 0x2598
	Size: 0x1A6
	Parameters: 7
	Flags: Linked
*/
function function_949d138a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(bwasdemojump == 1)
	{
		if(self postfx::function_556665f2(#"hash_7c5d3ac35353f95c"))
		{
			self postfx::stoppostfxbundle(#"hash_7c5d3ac35353f95c");
			self notify(#"hash_31ca7d9fa1b055e0");
		}
		self postfx::playpostfxbundle(#"hash_7c5d3ac35353f95c");
		var_3f79908d = playtagfxset(fieldname, "fx9_stakeout_screen_drop_distort", self);
		self thread function_f524c7a5(fieldname, var_3f79908d);
	}
	else
	{
		if(bwasdemojump == 2)
		{
			self postfx::stoppostfxbundle(#"hash_7c5d3ac35353f95c");
			self notify(#"hash_31ca7d9fa1b055e0");
		}
		else
		{
			self postfx::exitpostfxbundle(#"hash_7c5d3ac35353f95c");
			self notify(#"hash_31ca7d9fa1b055e0");
		}
	}
}

/*
	Name: function_f524c7a5
	Namespace: namespace_96b7f11d
	Checksum: 0xB8EE81E4
	Offset: 0x2748
	Size: 0xD8
	Parameters: 2
	Flags: Linked
*/
function function_f524c7a5(localclientnum, var_3f79908d)
{
	self notify("5533811b04af925");
	self endon("5533811b04af925");
	self waittill(#"death", #"hash_31ca7d9fa1b055e0");
	foreach(fxid in var_3f79908d)
	{
		stopfx(localclientnum, fxid);
	}
}

/*
	Name: function_996f5d0f
	Namespace: namespace_96b7f11d
	Checksum: 0x5FABC04F
	Offset: 0x2828
	Size: 0x1C6
	Parameters: 7
	Flags: Linked
*/
function function_996f5d0f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!self util::function_50ed1561(fieldname))
	{
		return;
	}
	if(bwasdemojump)
	{
		if(!isdefined(self.var_ca8b5a42))
		{
			self.var_ca8b5a42 = playtagfxset(fieldname, #"hash_3fecf62fe603c35e", self);
		}
		if(!isdefined(self.var_79abcb8a))
		{
			self.var_79abcb8a = playfxoncamera(fieldname, #"hash_4c2a73ebbc177abd");
		}
	}
	else
	{
		if(isdefined(self.var_ca8b5a42))
		{
			foreach(n_fx in self.var_ca8b5a42)
			{
				stopfx(fieldname, n_fx);
			}
			self.var_ca8b5a42 = undefined;
		}
		if(isdefined(self.var_79abcb8a))
		{
			stopfx(fieldname, self.var_79abcb8a);
			self.var_79abcb8a = undefined;
		}
	}
}

/*
	Name: function_10537d85
	Namespace: namespace_96b7f11d
	Checksum: 0x629ADB81
	Offset: 0x29F8
	Size: 0x1AE
	Parameters: 7
	Flags: Linked
*/
function function_10537d85(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self endon(#"death");
	if(!self util::function_50ed1561(fieldname))
	{
		return;
	}
	self notify(#"hash_7d19f6000c542b75");
	if(isdefined(self.var_d70173d8))
	{
		self stoploopsound(self.var_d70173d8);
		self.var_d70173d8 = undefined;
	}
	if(bwasdemojump == 1)
	{
		self thread function_40ef083a();
	}
	else
	{
		if(bwasdemojump == 2)
		{
			if(!isdefined(self.var_38a54dff))
			{
				self playsound(fieldname, #"hash_41c806945939eed6");
				self.var_38a54dff = self playloopsound(#"hash_518f551268d347fa");
			}
		}
		else if(isdefined(self.var_38a54dff))
		{
			self playsound(fieldname, #"hash_2f82db47fea25953");
			self stoploopsound(self.var_38a54dff);
			self.var_38a54dff = undefined;
		}
	}
}

/*
	Name: function_40ef083a
	Namespace: namespace_96b7f11d
	Checksum: 0xCD4BCAB2
	Offset: 0x2BB0
	Size: 0x12A
	Parameters: 0
	Flags: Linked
*/
function function_40ef083a()
{
	self notify("2a37c58dbf5fd926");
	self endon("2a37c58dbf5fd926");
	self endon(#"death");
	self endon(#"hash_7d19f6000c542b75");
	if(!isdefined(level.var_d58a6548))
	{
		level.var_d58a6548 = 30;
	}
	self.var_d70173d8 = self playloopsound(#"hash_35d7cc9a4eb405f");
	wait(level.var_d58a6548 / 3);
	self stoploopsound(self.var_d70173d8);
	self.var_d70173d8 = self playloopsound(#"hash_35d7dc9a4eb4212");
	wait(level.var_d58a6548 / 3);
	self stoploopsound(self.var_d70173d8);
	self.var_d70173d8 = self playloopsound(#"hash_35d7ec9a4eb43c5");
}

/*
	Name: function_44dc8dc9
	Namespace: namespace_96b7f11d
	Checksum: 0x8634B1FD
	Offset: 0x2CE8
	Size: 0xCC
	Parameters: 7
	Flags: Linked
*/
function function_44dc8dc9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!function_148ccc79(fieldname, #"hash_5e358762e4678906"))
		{
			function_a837926b(fieldname, #"hash_5e358762e4678906");
		}
	}
	else if(function_148ccc79(fieldname, #"hash_5e358762e4678906"))
	{
		codestoppostfxbundlelocal(fieldname, #"hash_5e358762e4678906");
	}
}

/*
	Name: function_167fc35
	Namespace: namespace_96b7f11d
	Checksum: 0xF5C4DD56
	Offset: 0x2DC0
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_167fc35(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
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

/*
	Name: function_182ea9e4
	Namespace: namespace_96b7f11d
	Checksum: 0xDFB5AF05
	Offset: 0x2ED8
	Size: 0x10C
	Parameters: 7
	Flags: Linked
*/
function function_182ea9e4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		forcestreamxmodel(#"hash_69c0563efeddad47");
		forcestreamxmodel(#"c_zom_dragonhead_e");
		forcestreamxmodel(#"hash_26730916f0bb7003");
	}
	else
	{
		stopforcestreamingxmodel(#"hash_69c0563efeddad47");
		stopforcestreamingxmodel(#"c_zom_dragonhead_e");
		stopforcestreamingxmodel(#"hash_26730916f0bb7003");
	}
}

/*
	Name: function_33082eb4
	Namespace: namespace_96b7f11d
	Checksum: 0x60DD54B3
	Offset: 0x2FF0
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_33082eb4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	if(isdefined(e_player))
	{
		if(e_player postfx::function_556665f2(#"hash_413b0a0d47ce8d45"))
		{
			e_player postfx::stoppostfxbundle(#"hash_413b0a0d47ce8d45");
		}
		e_player postfx::playpostfxbundle(#"hash_413b0a0d47ce8d45");
		e_player playsound(bwastimejump, #"hash_56a9d9da20064c3f");
		function_5ea2c6e3("zm_silver_darkaether_leadin", 2);
	}
}

/*
	Name: function_a146ac0f
	Namespace: namespace_96b7f11d
	Checksum: 0xF4EB8E0A
	Offset: 0x3100
	Size: 0x400
	Parameters: 7
	Flags: Linked
*/
function function_a146ac0f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_328baab5 = struct::get_array("s_dragon_rocket_portals", "targetname");
	if(bwasdemojump)
	{
		foreach(s_portal in var_328baab5)
		{
			if(!isdefined(s_portal.fx_tag.var_fa63b371))
			{
				s_portal.fx_tag = util::spawn_model(fieldname, "tag_origin", s_portal.origin, s_portal.angles);
				s_portal.fx_tag playsound(fieldname, #"hash_61bdec1c1b35a33a");
				s_portal.fx_tag.var_68cf83c = s_portal.fx_tag playloopsound(#"hash_e94363edb1efe");
				s_portal.fx_tag.var_fa63b371 = playfx(fieldname, #"hash_57ae7e6f9140093f", s_portal.fx_tag.origin, anglestoforward(s_portal.fx_tag.angles), anglestoup(s_portal.fx_tag.angles));
			}
		}
	}
	else
	{
		foreach(s_portal in var_328baab5)
		{
			if(isdefined(s_portal.fx_tag.var_68cf83c))
			{
				s_portal.fx_tag playsound(fieldname, #"hash_10ab48d5915334e");
				s_portal.fx_tag stoploopsound(s_portal.fx_tag.var_68cf83c);
				s_portal.fx_tag.var_68cf83c = undefined;
			}
			if(isdefined(s_portal.fx_tag.var_fa63b371))
			{
				s_portal.fx_tag playsound(fieldname, #"hash_10ab48d5915334e");
				playfx(fieldname, #"hash_2786498a222adb04", s_portal.fx_tag.origin, anglestoforward(s_portal.fx_tag.angles), anglestoup(s_portal.fx_tag.angles));
				killfx(fieldname, s_portal.fx_tag.var_fa63b371);
				s_portal.fx_tag.var_fa63b371 = undefined;
				if(isdefined(s_portal.fx_tag))
				{
					s_portal.fx_tag delete();
				}
			}
		}
	}
}

/*
	Name: function_1d123acd
	Namespace: namespace_96b7f11d
	Checksum: 0x1CF3D0A0
	Offset: 0x3508
	Size: 0x78
	Parameters: 7
	Flags: Linked
*/
function function_1d123acd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		level.var_d58a6548 = 45;
	}
	else if(bwasdemojump == 2)
	{
		level.var_d58a6548 = 30;
	}
}

/*
	Name: function_5bc9772e
	Namespace: namespace_96b7f11d
	Checksum: 0xECAA1E2
	Offset: 0x3588
	Size: 0xEC
	Parameters: 7
	Flags: Linked
*/
function function_5bc9772e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self.ambient_fx = playfx(fieldname, #"hash_240b951190d035ec", self.origin);
	}
	else
	{
		self playsound(fieldname, #"hash_5ca9fc80b368b993");
		if(isdefined(self.ambient_fx))
		{
			killfx(fieldname, self.ambient_fx);
		}
		playfx(fieldname, #"hash_ea17935f6555b31", self.origin);
	}
}

/*
	Name: function_51ee271b
	Namespace: namespace_96b7f11d
	Checksum: 0xF25B0BB
	Offset: 0x3680
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_51ee271b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		util::function_8eb5d4b0(3500, 0);
	}
	else
	{
		util::function_8eb5d4b0(3500, 2.5);
	}
}

/*
	Name: function_5414ee31
	Namespace: namespace_96b7f11d
	Checksum: 0xE1C865B8
	Offset: 0x3708
	Size: 0x8C
	Parameters: 7
	Flags: Linked
*/
function function_5414ee31(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		function_3385d776(#"hash_122a51c7a09dab6b");
	}
	else
	{
		function_c22a1ca2(#"hash_122a51c7a09dab6b");
	}
}

/*
	Name: function_eff937db
	Namespace: namespace_96b7f11d
	Checksum: 0xACC5C1C0
	Offset: 0x37A0
	Size: 0x74
	Parameters: 7
	Flags: Linked
*/
function function_eff937db(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self function_c2e69953(1);
	}
	else
	{
		self function_c2e69953(0);
	}
}

/*
	Name: function_489caa85
	Namespace: namespace_96b7f11d
	Checksum: 0x517CBA4E
	Offset: 0x3820
	Size: 0x6C
	Parameters: 7
	Flags: Linked
*/
function function_489caa85(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	setexposureactivebank(fieldname, bwastimejump);
	setpbgactivebank(fieldname, bwastimejump);
}

/*
	Name: function_72c3294
	Namespace: namespace_96b7f11d
	Checksum: 0xE22A8EC2
	Offset: 0x3898
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_72c3294(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		function_be93487f(fieldname, 2, 1, 1, 0, 0);
	}
}

/*
	Name: function_43b0a4e2
	Namespace: namespace_96b7f11d
	Checksum: 0x6F73C811
	Offset: 0x3920
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_43b0a4e2(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_b5eeda48 = getent(fieldname, "pizza_parlor_sign", "targetname");
		var_b5eeda48 setmodel(#"p9_usa_neon_open_sign_on");
	}
}

/*
	Name: function_1a91c8d3
	Namespace: namespace_96b7f11d
	Checksum: 0x64BEA719
	Offset: 0x39C0
	Size: 0xE4
	Parameters: 7
	Flags: Linked
*/
function function_1a91c8d3(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isalive(self) || self !== function_5c10bd79(fieldname))
	{
		return;
	}
	if(bwastimejump)
	{
		function_12f0cc0d("xanim_mm_brawler_male_stand_idle");
		function_12f0cc0d("xanim_mm_brawler_fem_stand_idle");
	}
	else
	{
		function_4b51b406("xanim_mm_brawler_male_stand_idle");
		function_4b51b406("xanim_mm_brawler_fem_stand_idle");
	}
}

/*
	Name: function_9163efd4
	Namespace: namespace_96b7f11d
	Checksum: 0xED3F9FE6
	Offset: 0x3AB0
	Size: 0x226
	Parameters: 7
	Flags: Linked
*/
function function_9163efd4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_ba396b8a))
		{
			self.var_ba396b8a = function_239993de(fieldname, #"hash_7931d47b70c1a3de", self, "tag_searchlight_glass_d0");
		}
		if(!isdefined(self.var_522dfce9))
		{
			self.var_522dfce9 = function_239993de(fieldname, #"hash_33a301617d6aee02", self, "tag_deathfx");
		}
		if(!isdefined(self.var_ddbb1a2b))
		{
			self.var_ddbb1a2b = function_239993de(fieldname, #"hash_38a99091a299bb1", self, "tag_fx_engine_exhaust_right");
		}
		if(!isdefined(self.var_d78780c8))
		{
			self.var_d78780c8 = function_239993de(fieldname, #"hash_64928348a5830b81", self, "tag_ground");
		}
	}
	else
	{
		if(isdefined(self.var_ba396b8a))
		{
			deletefx(fieldname, self.var_ba396b8a);
			self.var_ba396b8a = undefined;
		}
		if(isdefined(self.var_522dfce9))
		{
			deletefx(fieldname, self.var_522dfce9);
			self.var_522dfce9 = undefined;
		}
		if(isdefined(self.var_ddbb1a2b))
		{
			deletefx(fieldname, self.var_ddbb1a2b);
			self.var_ddbb1a2b = undefined;
		}
		if(isdefined(self.var_d78780c8))
		{
			deletefx(fieldname, self.var_d78780c8);
			self.var_d78780c8 = undefined;
		}
	}
}

/*
	Name: function_61d33efe
	Namespace: namespace_96b7f11d
	Checksum: 0x200B0825
	Offset: 0x3CE0
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function function_61d33efe(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isalive(self) || self !== function_5c10bd79(fieldname))
	{
		return;
	}
	if(bwastimejump)
	{
		forcestreamxmodel("veh_t9_zm_arc_xd");
	}
	else
	{
		stopforcestreamingxmodel("veh_t9_zm_arc_xd");
	}
}

