#using script_17a9d06bf819b2d3;
#using script_2c8fd33ddb45e78b;
#using script_430de98794e456b;
#using script_49d775adf53f3e10;
#using script_4c3ae065d31d9544;
#using script_50a657242c20890c;
#using script_6243781aa5394e62;
#using script_7785d936148d9f8;
#using script_791ecf7869b6b24f;
#using script_7d8e141380aa3f06;
#using script_a28cfdb7ec79c28;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\load_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm\zm_gold_main_quest.csc;
#using scripts\zm\zm_gold_pap_quest.csc;
#using scripts\zm\zm_gold_util.csc;
#using scripts\zm\zm_gold_ww_quest.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace namespace_808e3265;

/*
	Name: function_1ae8f698
	Namespace: namespace_808e3265
	Checksum: 0x86FD6420
	Offset: 0x400
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1ae8f698()
{
	level notify(269211906);
}

/*
	Name: opt_in
	Namespace: namespace_808e3265
	Checksum: 0x7B94B9FE
	Offset: 0x420
	Size: 0x94
	Parameters: 0
	Flags: AutoExec
*/
function autoexec opt_in()
{
	level.aat_in_use = 1;
	system::ignore(#"hash_36cdf1547e49b57a");
	namespace_4abf1500::function_88645994(#"hash_1367b294390f3ba9", #"hash_6aeeb56daf9669c5", #"hash_483da168d7c978d9", #"hash_7ad762022f44fb97", #"hash_37b19a33841ec0fa");
}

/*
	Name: main
	Namespace: namespace_808e3265
	Checksum: 0x453E0CE5
	Offset: 0x4C0
	Size: 0x464
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	clientfield::function_a8bbc967("player_lives", #"zm_hud", #"player_lives", 1, 2, "int", undefined, 0, 0);
	clientfield::register("toplayer", "" + #"hash_697cae64fbcf81f8", 1, 1, "int", &function_6c117bd1, 0, 0);
	clientfield::register("allplayers", "" + #"hash_63af42145e260fb5", 1, 2, "int", &function_4fd00e1f, 0, 0);
	clientfield::register("world", "" + #"hash_7d7dcebcb0511b14", 1, 1, "int", &function_84e68eed, 0, 0);
	clientfield::register("world", "" + #"hash_5368b2aa337a0ec3", 16000, 2, "int", &function_36f11a86, 0, 0);
	clientfield::register("world", "" + #"hash_4c60439fcb3b4056", 16000, 1, "int", &function_d03c22c, 0, 0);
	level.setupcustomcharacterexerts = &setup_personality_character_exerts;
	level.var_d0ab70a2 = #"hash_466c279241bfbf7c";
	level.var_a7c8e7d7 = 1;
	setdvar(#"hash_5e3c0f05d2935beb", 1);
	setdvar(#"hash_190c5373848fa8e6", 1);
	load::main();
	namespace_f7b3ed9::init();
	namespace_e0b1e9f5::init();
	namespace_2a67e53::init();
	namespace_5c4c9a39::init();
	namespace_9f2e6680::init();
	namespace_af171776::init();
	namespace_36ebd7e4::init();
	namespace_47809ab2::init();
	namespace_e5d0906e::init();
	namespace_c4d353e7::init();
	namespace_8dac58da::init();
	util::waitforclient(0);
	setsoundcontext("dark_aether", "inactive");
	namespace_8dac58da::function_dcf22669();
	namespace_5b1144e::function_5ae4a10c(#"hash_1625d9b97f824726", "orda_end_boss_gold", #"hash_5df52c0e133d3e52", #"hash_73fd41d7b25c7854", undefined, undefined, -700);
	namespace_5b1144e::function_5ae4a10c(#"hash_3a0f3a6dbef0284a", "orda_assault_boss_gold", #"hash_5df52c0e133d3e52", #"hash_73fd41d7b25c7854", undefined, undefined, -50);
	level thread function_1493eabf();
}

/*
	Name: function_1493eabf
	Namespace: namespace_808e3265
	Checksum: 0x95BFF0D6
	Offset: 0x930
	Size: 0x3C
	Parameters: 0
	Flags: Linked
*/
function function_1493eabf()
{
	level waittill(#"hash_2ccb1e2f5d9ce793");
	function_2cca7b47(0, #"hash_7186f461234ff0fb");
}

/*
	Name: setup_personality_character_exerts
	Namespace: namespace_808e3265
	Checksum: 0x764283D2
	Offset: 0x978
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
	Name: function_6c117bd1
	Namespace: namespace_808e3265
	Checksum: 0xC88C884F
	Offset: 0xC08
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function function_6c117bd1(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
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
	Name: function_4fd00e1f
	Namespace: namespace_808e3265
	Checksum: 0xFA302ECE
	Offset: 0xC90
	Size: 0x354
	Parameters: 7
	Flags: Linked
*/
function function_4fd00e1f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	if(!isdefined(level.var_3630f9c0))
	{
		level.var_3630f9c0 = [];
	}
	n_entity = self getentitynumber();
	var_e534cbe9 = 0;
	if(isdefined(level.var_3630f9c0[n_entity][fieldname]))
	{
		killfx(fieldname, level.var_3630f9c0[n_entity][fieldname]);
		level.var_3630f9c0[n_entity][fieldname] = undefined;
		var_e534cbe9 = 1;
	}
	if(bwastimejump > 0)
	{
		if(!var_e534cbe9)
		{
			self playsound(fieldname, #"hash_79a78504d4dbaf3f");
		}
		if(self zm_utility::function_f8796df3(fieldname))
		{
			if(bwastimejump == 1)
			{
				str_fx = #"hash_679d39e5fd4eae19";
			}
			else if(bwastimejump == 2)
			{
				str_fx = #"hash_1581235a1b9b6071";
			}
			if(viewmodelhastag(fieldname, "tag_flashlight"))
			{
				level.var_3630f9c0[n_entity][fieldname] = playviewmodelfx(fieldname, str_fx, "tag_flashlight");
			}
			/#
				if(!isdefined(level.var_3630f9c0[n_entity][fieldname]))
				{
					level.var_3630f9c0[n_entity][fieldname] = playviewmodelfx(fieldname, str_fx, "");
				}
			#/
		}
		else
		{
			if(bwastimejump == 1)
			{
				str_fx = #"hash_153f56ac9d13a399";
			}
			else if(bwastimejump == 2)
			{
				str_fx = #"hash_626d3f491b870eb1";
			}
			level.var_3630f9c0[n_entity][fieldname] = util::playfxontag(fieldname, str_fx, self, "tag_flashlight");
		}
		if(self == function_5c10bd79(fieldname))
		{
			util::function_8eb5d4b0(3500, 0);
		}
	}
	else
	{
		if(var_e534cbe9)
		{
			self playsound(fieldname, #"hash_13715035b161a0c3");
		}
		if(self == function_5c10bd79(fieldname))
		{
			util::function_8eb5d4b0(3500, 2.5);
		}
	}
}

/*
	Name: function_84e68eed
	Namespace: namespace_808e3265
	Checksum: 0xF572419D
	Offset: 0xFF0
	Size: 0x19C
	Parameters: 7
	Flags: Linked
*/
function function_84e68eed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	var_30b095e = getent(fieldname, "phase_wall_01", "targetname");
	var_de143f71 = getent(fieldname, "phase_wall_02", "targetname");
	if(bwastimejump)
	{
		var_30b095e function_bf9d3071(#"hash_4f98e06b5af6e109");
		var_30b095e function_78233d29(#"hash_4f98e06b5af6e109", "", "Scale", 1);
		var_de143f71 function_bf9d3071(#"hash_581f8b6e6995c9c7");
		var_de143f71 function_78233d29(#"hash_581f8b6e6995c9c7", "", "Scale", 1);
	}
	else
	{
		var_30b095e function_5d482e78(#"hash_4f98e06b5af6e109");
		var_de143f71 function_5d482e78(#"hash_581f8b6e6995c9c7");
	}
}

/*
	Name: function_36f11a86
	Namespace: namespace_808e3265
	Checksum: 0x49F02102
	Offset: 0x1198
	Size: 0x1E4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_36f11a86(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	fx_pos = struct::get("cm_pos", "targetname");
	if(bwasdemojump == 1)
	{
		if(isdefined(level.var_86248265))
		{
			stopfx(fieldname, level.var_86248265);
		}
		level.var_78a0366b = playfx(fieldname, #"hash_475a4f50991bd21b", fx_pos.origin, anglestoforward(fx_pos.angles));
	}
	else
	{
		if(bwasdemojump == 2)
		{
			if(isdefined(level.var_78a0366b))
			{
				stopfx(fieldname, level.var_78a0366b);
			}
			level.var_86248265 = playfx(fieldname, #"hash_5620a6bb92498dcf", fx_pos.origin, anglestoforward(fx_pos.angles));
		}
		else
		{
			if(isdefined(level.var_86248265))
			{
				stopfx(fieldname, level.var_86248265);
			}
			if(isdefined(level.var_78a0366b))
			{
				stopfx(fieldname, level.var_78a0366b);
			}
		}
	}
}

/*
	Name: function_d03c22c
	Namespace: namespace_808e3265
	Checksum: 0x148C0331
	Offset: 0x1388
	Size: 0x15C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d03c22c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_39b48ddb = struct::get("mq_flsh_lgt_pos", "targetname");
	var_928e2c6a = struct::get("mq_stm_pos", "targetname");
	if(bwasdemojump == 1)
	{
		level.var_86248265 = playfx(fieldname, #"hash_5cca0097f7a9cd6f", var_39b48ddb.origin, var_39b48ddb.angles);
		playfx(fieldname, #"hash_4434a88296cb704a", var_928e2c6a.origin, var_928e2c6a.angles);
		playsound(fieldname, #"hash_395c68a4d926cb0f", var_928e2c6a.origin);
	}
	else if(isdefined(level.var_86248265))
	{
		stopfx(fieldname, level.var_86248265);
	}
}

