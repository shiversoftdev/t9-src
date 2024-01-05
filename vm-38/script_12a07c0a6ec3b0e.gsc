#using script_7ae1d3c7bfe5070;
#using script_311c446e3df6c3fa;
#using scripts\zm_common\zm_score.csc;
#using script_5ee86fb478309acf;
#using scripts\core_common\postfx_shared.csc;
#using script_18869d46adac498f;
#using script_40e017336a087343;
#using script_14d2d89964cae0b1;
#using scripts\core_common\math_shared.csc;
#using script_20055f2f97341caa;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace namespace_dbaeabbd;

/*
	Name: function_b45f8db1
	Namespace: namespace_dbaeabbd
	Checksum: 0x78FAB966
	Offset: 0x290
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b45f8db1()
{
	level notify(511773358);
}

/*
	Name: init
	Namespace: namespace_dbaeabbd
	Checksum: 0xDCAAC005
	Offset: 0x2B0
	Size: 0x6B4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	luielemtext::register();
	level.var_252ba2b0 = zm_tungsten_grandprix::register();
	clientfield::register("world", "" + #"hash_112d67305f861fe", 28000, 3, "int", &function_3bab499f, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3d5c2390c0768ed2", 28000, 1, "int", &function_dc99662d, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_79077a9af52542c8", 28000, 1, "int", &function_f0302ec9, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_46bf4cc1eea0741a", 28000, 1, "int", &function_e56be134, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_6e68f1a9f11ee7a7", 28000, 1, "int", &function_4aa76e8d, 0, 0);
	clientfield::register("toplayer", "" + #"hash_1c5f8a62c31e12a5", 28000, 1, "int", &function_50f28f68, 0, 0);
	clientfield::register("world", "" + #"hash_1050257bf996b481", 28000, 4, "int", &function_e03501a6, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_696368486685bb5c", 28000, 1, "int", &function_3cfac49e, 0, 0);
	clientfield::register("toplayer", "" + #"hash_1a1bf38ae538a50d", 28000, 1, "int", &function_331544ce, 0, 0);
	clientfield::register("toplayer", "" + #"hash_2b3bf178344cc787", 28000, 1, "int", &function_8376a0af, 0, 0);
	clientfield::register("actor", "" + #"hash_303ed2c4515453aa", 28000, 1, "counter", &function_b6ea5740, 0, 0);
	clientfield::register("vehicle", "" + #"hash_24b93fe5f3d174f8", 28000, 3, "int", &function_b794d678, 0, 0);
	clientfield::register("toplayer", "" + #"hash_355304ea91d4edc8", 28000, 1, "counter", &function_3493f111, 0, 0);
	clientfield::register("vehicle", "" + #"hash_6324044c00c5672d", 28000, 4, "int", &function_1bac5158, 0, 0);
	clientfield::register("world", "" + #"hash_6c40bdc03cfa78bb", 28000, 1, "int", &function_53f2d015, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_2777a21403131281", 28000, 1, "int", &function_58ef33dd, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_4a1dfb77dccf6587", 28000, 1, "counter", &function_ecd6d914, 0, 0);
	clientfield::register("scriptmover", "" + #"hash_3215084197667777", 28000, 1, "int", &function_96148291, 0, 0);
	clientfield::register("world", "" + #"hash_665b17bb90845861", 28000, 2, "int", &function_30aa821d, 0, 0);
}

/*
	Name: function_3bab499f
	Namespace: namespace_dbaeabbd
	Checksum: 0xD12FBBB4
	Offset: 0x970
	Size: 0x398
	Parameters: 7
	Flags: Linked
*/
function function_3bab499f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		var_328baab5 = struct::get_array("s_portal_pos", "targetname");
		s_portal = function_80fdd2aa(var_328baab5, bwasdemojump);
		if(isdefined(s_portal))
		{
			s_portal.fx_tag = util::spawn_model(fieldname, "tag_origin", s_portal.origin, s_portal.angles);
			s_portal.fx_tag playsound(fieldname, #"hash_61bdec1c1b35a33a");
			s_portal.fx_tag.var_68cf83c = s_portal.fx_tag playloopsound(#"hash_e94363edb1efe");
			s_portal.fx_tag.var_fa63b371 = playfx(fieldname, #"hash_57ae7e6f9140093f", s_portal.fx_tag.origin, anglestoforward(s_portal.fx_tag.angles), anglestoup(s_portal.fx_tag.angles));
		}
	}
	else
	{
		var_328baab5 = struct::get_array("s_portal_pos", "targetname");
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
	Name: function_80fdd2aa
	Namespace: namespace_dbaeabbd
	Checksum: 0xC6036341
	Offset: 0xD10
	Size: 0x9C
	Parameters: 2
	Flags: Linked
*/
function function_80fdd2aa(array, n_idx)
{
	foreach(element in array)
	{
		if(element.script_int === n_idx)
		{
			return element;
		}
	}
	return undefined;
}

/*
	Name: function_dc99662d
	Namespace: namespace_dbaeabbd
	Checksum: 0x5A328512
	Offset: 0xDB8
	Size: 0xF2
	Parameters: 7
	Flags: Linked
*/
function function_dc99662d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	self endon(#"death");
	if(bwasdemojump)
	{
		playsound(fieldname, #"hash_707397ff94e45605", self.origin + vectorscale((0, 0, 1), 30));
		self.var_f11dc183 = playfx(fieldname, #"hash_4e0a101bea0199df", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
	}
}

/*
	Name: function_f0302ec9
	Namespace: namespace_dbaeabbd
	Checksum: 0xFBA30AD7
	Offset: 0xEB8
	Size: 0xB6
	Parameters: 7
	Flags: Linked
*/
function function_f0302ec9(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self.var_39c21153 = util::playfxontag(fieldname, #"hash_212d32c5fd4fbdab", self, "tag_mouth");
	}
	else if(isdefined(self.var_39c21153))
	{
		stopfx(fieldname, self.var_39c21153);
		self.var_39c21153 = undefined;
	}
}

/*
	Name: function_e56be134
	Namespace: namespace_dbaeabbd
	Checksum: 0x432841FC
	Offset: 0xF78
	Size: 0xDC
	Parameters: 7
	Flags: Linked
*/
function function_e56be134(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self playrenderoverridebundle(#"hash_33472031c8a872cd");
		self playsound(fieldname, #"hash_1bf3ee4eb2a58e82");
	}
	else
	{
		self stoprenderoverridebundle(#"hash_33472031c8a872cd");
		self playsound(fieldname, #"hash_3a07d2cfdb8bbda7");
	}
}

/*
	Name: function_4aa76e8d
	Namespace: namespace_dbaeabbd
	Checksum: 0x87F83A73
	Offset: 0x1060
	Size: 0x17E
	Parameters: 7
	Flags: Linked
*/
function function_4aa76e8d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self.var_b8719b00 = playfx(fieldname, #"hash_79820377ac325c2b", self.origin, anglestoforward(self.angles), anglestoup(self.angles));
		self.var_1aebf0ec = util::playfxontag(fieldname, #"hash_91d61544c778dbe", self, "tag_mouth");
		playsound(fieldname, #"hash_161fceda8dd44ee3", self.origin + vectorscale((0, 0, 1), 40));
	}
	else
	{
		if(isdefined(self.var_b8719b00))
		{
			stopfx(fieldname, self.var_b8719b00);
			self.var_b8719b00 = undefined;
		}
		if(isdefined(self.var_1aebf0ec))
		{
			stopfx(fieldname, self.var_1aebf0ec);
			self.var_1aebf0ec = undefined;
		}
	}
}

/*
	Name: function_50f28f68
	Namespace: namespace_dbaeabbd
	Checksum: 0x3492692E
	Offset: 0x11E8
	Size: 0x12E
	Parameters: 7
	Flags: Linked
*/
function function_50f28f68(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1 && !self postfx::function_556665f2(#"hash_6f19f661d99b2da9"))
	{
		self postfx::playpostfxbundle(#"hash_6f19f661d99b2da9");
		self.var_b76c34b2 = self playloopsound(#"hash_6141543956130aaa");
	}
	else
	{
		if(self postfx::function_556665f2(#"hash_6f19f661d99b2da9"))
		{
			self postfx::exitpostfxbundle(#"hash_6f19f661d99b2da9");
		}
		if(isdefined(self.var_b76c34b2))
		{
			self stoploopsound(self.var_b76c34b2);
			self.var_b76c34b2 = undefined;
		}
	}
}

/*
	Name: function_e03501a6
	Namespace: namespace_dbaeabbd
	Checksum: 0x4B8728F6
	Offset: 0x1320
	Size: 0x2B8
	Parameters: 7
	Flags: Linked
*/
function function_e03501a6(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	var_b510e160 = struct::get_array("s_little_girl", "targetname");
	if(bwasdemojump > 0)
	{
		player = function_5c10bd79(fieldname);
		if(!is_true(player.var_2642dd3d))
		{
			return;
		}
		var_338ebb64 = function_80fdd2aa(var_b510e160, bwasdemojump);
		if(!isdefined(var_338ebb64.var_8bb0303a.var_5d2af675))
		{
			var_338ebb64.var_8bb0303a = util::spawn_model(fieldname, "tag_origin", var_338ebb64.origin, var_338ebb64.angles);
			var_338ebb64.var_8bb0303a.var_5d2af675 = util::playfxontag(fieldname, #"hash_76394ace7e94981f", var_338ebb64.var_8bb0303a, "tag_origin");
			var_338ebb64.var_8bb0303a.var_13c71aed = var_338ebb64.var_8bb0303a playloopsound(#"hash_b3b9bf3b225b9ae");
		}
	}
	else
	{
		foreach(var_338ebb64 in var_b510e160)
		{
			if(isdefined(var_338ebb64.var_8bb0303a.var_5d2af675))
			{
				stopfx(fieldname, var_338ebb64.var_8bb0303a.var_5d2af675);
				var_338ebb64.var_8bb0303a.var_5d2af675 = undefined;
				var_338ebb64.var_8bb0303a stoploopsound(var_338ebb64.var_8bb0303a.var_13c71aed);
				var_338ebb64.var_8bb0303a.var_13c71aed = undefined;
				if(isdefined(var_338ebb64.var_8bb0303a))
				{
					var_338ebb64.var_8bb0303a delete();
				}
			}
		}
	}
}

/*
	Name: function_b6ea5740
	Namespace: namespace_dbaeabbd
	Checksum: 0x14C44FF6
	Offset: 0x15E0
	Size: 0x284
	Parameters: 7
	Flags: Linked
*/
function function_b6ea5740(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	level endon(#"end_game");
	self util::waittill_dobj(bwasdemojump);
	if(!isdefined(self))
	{
		return;
	}
	e_fx = util::spawn_model(bwasdemojump, "tag_origin", self gettagorigin("J_Spine4"));
	util::playfxontag(bwasdemojump, #"hash_61e3c7a179d7cdfb", e_fx, "tag_origin");
	e_fx playsound(bwasdemojump, #"hash_14182939d9e547b2");
	e_fx.var_1398d03 = e_fx playloopsound(#"hash_20b1d2b1a7ca4646");
	e_fx moveto(e_fx.origin + vectorscale((0, 0, 1), 40), 0.8);
	wait(0.75);
	var_5f90c92a = struct::get("side_quest_gp_machine_screen");
	n_time = distance(e_fx.origin, var_5f90c92a.origin) / 400;
	e_fx moveto(var_5f90c92a.origin + vectorscale((0, 0, 1), 32), n_time);
	e_fx waittill(#"movedone");
	e_fx playsound(bwasdemojump, #"hash_282ba4e04a5fa817");
	e_fx stoploopsound(e_fx.var_1398d03);
	level thread function_db00ff4a(bwasdemojump, var_5f90c92a);
	wait(0.3);
	e_fx delete();
}

/*
	Name: function_db00ff4a
	Namespace: namespace_dbaeabbd
	Checksum: 0xB0C15CFE
	Offset: 0x1870
	Size: 0xEE
	Parameters: 2
	Flags: Linked
*/
function function_db00ff4a(localclientnum, point)
{
	level endon(#"end_game");
	self notify("64e3f3799003b0e8");
	self endon("64e3f3799003b0e8");
	if(!isdefined(level.var_f2a7648a))
	{
		level.var_f2a7648a = playfx(localclientnum, #"hash_64b0865c260e817", point.origin, anglestoforward(point.angles), anglestoup(point.angles));
	}
	wait(10);
	stopfx(localclientnum, level.var_f2a7648a);
	level.var_f2a7648a = undefined;
}

/*
	Name: function_31253aed
	Namespace: namespace_dbaeabbd
	Checksum: 0x7A1F0C57
	Offset: 0x1968
	Size: 0xB6
	Parameters: 3
	Flags: Linked, Private
*/
function private function_31253aed(localclientnum, starttime, var_aee56165)
{
	self notify("71af197fba29be9");
	self endon("71af197fba29be9");
	level endon(#"end_game", #"hash_2ea4e3a9aa7709d5");
	while(true)
	{
		n_delta = getservertime(localclientnum) - starttime;
		if(n_delta < 0)
		{
			n_delta = 0;
		}
		setuimodelvalue(var_aee56165, n_delta);
		waitframe(1);
	}
}

/*
	Name: function_331544ce
	Namespace: namespace_dbaeabbd
	Checksum: 0x61B7D1A6
	Offset: 0x1A28
	Size: 0x16E
	Parameters: 7
	Flags: Linked, Private
*/
function private function_331544ce(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!function_65b9eb0f(fieldname))
	{
		timer_model = createuimodel(function_1df4c3b0(fieldname, #"zm_hud"), "zmGrandPrixTimer");
		if(bwastimejump)
		{
			level.var_c614dedf = getservertime(fieldname);
			level thread function_31253aed(fieldname, level.var_c614dedf, timer_model);
		}
		else
		{
			if(isdefined(level.var_c614dedf))
			{
				level notify(#"hash_2ea4e3a9aa7709d5");
				n_delta = getservertime(fieldname) - level.var_c614dedf;
				if(n_delta < 0)
				{
					n_delta = 0;
				}
				setuimodelvalue(timer_model, n_delta);
			}
			level.var_c614dedf = undefined;
		}
	}
}

/*
	Name: function_8376a0af
	Namespace: namespace_dbaeabbd
	Checksum: 0x8BD2525B
	Offset: 0x1BA0
	Size: 0x94
	Parameters: 7
	Flags: Linked
*/
function function_8376a0af(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump == 1)
	{
		self postfx::playpostfxbundle(#"hash_1369517be3984a32");
	}
	else
	{
		self postfx::stoppostfxbundle(#"hash_1369517be3984a32");
	}
}

/*
	Name: function_b794d678
	Namespace: namespace_dbaeabbd
	Checksum: 0xCFC0771E
	Offset: 0x1C40
	Size: 0x17C
	Parameters: 7
	Flags: Linked
*/
function function_b794d678(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self.var_a00ef04e))
	{
		self stoprenderoverridebundle(self.var_a00ef04e);
		self.var_a00ef04e = undefined;
	}
	var_ce472137 = function_8978c19(fieldname);
	if(bwasdemojump == var_ce472137)
	{
		return;
	}
	switch(bwasdemojump)
	{
		case 1:
		{
			self.var_a00ef04e = #"hash_3fbc671e9c62b033";
			break;
		}
		case 2:
		{
			self.var_a00ef04e = #"hash_4cc46e3d55234d37";
			break;
		}
		case 3:
		{
			self.var_a00ef04e = #"hash_1a7dfc20f42eedc0";
			break;
		}
		case 4:
		{
			self.var_a00ef04e = #"hash_156533bbd58d8d71";
			break;
		}
	}
	if(isdefined(self.var_a00ef04e))
	{
		self playrenderoverridebundle(self.var_a00ef04e);
	}
}

/*
	Name: function_3493f111
	Namespace: namespace_dbaeabbd
	Checksum: 0xC1FAB094
	Offset: 0x1DC8
	Size: 0x104
	Parameters: 7
	Flags: Linked
*/
function function_3493f111(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	e_player = function_5c10bd79(bwastimejump);
	if(isdefined(e_player))
	{
		if(e_player postfx::function_556665f2(#"hash_7fbc9bc489aea188"))
		{
			e_player postfx::stoppostfxbundle(#"hash_7fbc9bc489aea188");
		}
		e_player postfx::playpostfxbundle(#"hash_7fbc9bc489aea188");
		e_player playsound(bwastimejump, #"hash_56a9d9da20064c3f");
		function_5ea2c6e3("zm_silver_darkaether_leadin", 7);
	}
}

/*
	Name: function_30aa821d
	Namespace: namespace_dbaeabbd
	Checksum: 0xF4A0FA12
	Offset: 0x1ED8
	Size: 0x788
	Parameters: 7
	Flags: Linked
*/
function function_30aa821d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		var_30e5780e = struct::get_array("side_quest_gp_fire_work_fx_pos_1", "targetname");
		foreach(var_2b30e4c7 in var_30e5780e)
		{
			if(!isdefined(var_2b30e4c7.fx_tag) && !isdefined(var_2b30e4c7.fx_tag.var_a3701ec9))
			{
				var_2b30e4c7.fx_tag = util::spawn_model(fieldname, "tag_origin", var_2b30e4c7.origin, var_2b30e4c7.angles);
				var_2b30e4c7.fx_tag.var_a3701ec9 = util::playfxontag(fieldname, #"zombie/fx_aat_fireworks_zmb", var_2b30e4c7.fx_tag, "tag_origin");
			}
			playsound(fieldname, #"hash_5147e3b5f415d707", var_2b30e4c7.origin + vectorscale((0, 0, 1), 20));
		}
	}
	if(bwastimejump == 2)
	{
		var_6a116a65 = struct::get_array("side_quest_gp_fire_work_fx_pos_2", "targetname");
		foreach(var_2b30e4c7 in var_6a116a65)
		{
			if(!isdefined(var_2b30e4c7.fx_tag) && !isdefined(var_2b30e4c7.fx_tag.var_a3701ec9))
			{
				var_2b30e4c7.fx_tag = util::spawn_model(fieldname, "tag_origin", var_2b30e4c7.origin, var_2b30e4c7.angles);
				var_2b30e4c7.fx_tag.var_a3701ec9 = util::playfxontag(fieldname, #"zombie/fx_aat_fireworks_zmb", var_2b30e4c7.fx_tag, "tag_origin");
			}
			playsound(fieldname, #"hash_5147e3b5f415d707", var_2b30e4c7.origin + vectorscale((0, 0, 1), 20));
		}
	}
	if(bwastimejump == 3)
	{
		var_fc690f16 = struct::get_array("side_quest_gp_fire_work_fx_pos_3", "targetname");
		foreach(var_2b30e4c7 in var_fc690f16)
		{
			if(!isdefined(var_2b30e4c7.fx_tag))
			{
				var_2b30e4c7.fx_tag = util::spawn_model(fieldname, "tag_origin", var_2b30e4c7.origin, var_2b30e4c7.angles);
			}
			var_2b30e4c7.fx_tag.var_a3701ec9 = util::playfxontag(fieldname, #"hash_43eb5c945959b06f", var_2b30e4c7.fx_tag, "tag_origin");
			playsound(fieldname, #"hash_1b4eb6b7b24acdaf", var_2b30e4c7.origin + vectorscale((0, 0, 1), 20));
		}
	}
	if(bwastimejump == 4)
	{
		var_fc690f16 = struct::get_array("side_quest_gp_fire_work_fx_pos_3", "targetname");
		foreach(var_2b30e4c7 in var_fc690f16)
		{
			if(isdefined(var_2b30e4c7.fx_tag.var_a3701ec9))
			{
				stopfx(fieldname, var_2b30e4c7.fx_tag.var_a3701ec9);
				var_2b30e4c7.fx_tag.var_a3701ec9 = undefined;
				if(isdefined(var_2b30e4c7.fx_tag))
				{
					var_2b30e4c7.fx_tag delete();
				}
			}
		}
	}
	else
	{
		var_30e5780e = struct::get_array("side_quest_gp_fire_work_fx_pos_1", "targetname");
		foreach(var_2b30e4c7 in var_30e5780e)
		{
			if(isdefined(var_2b30e4c7.fx_tag.var_a3701ec9))
			{
				stopfx(fieldname, var_2b30e4c7.fx_tag.var_a3701ec9);
				var_2b30e4c7.fx_tag.var_a3701ec9 = undefined;
				if(isdefined(var_2b30e4c7.fx_tag))
				{
					var_2b30e4c7.fx_tag delete();
				}
			}
		}
		var_6a116a65 = struct::get_array("side_quest_gp_fire_work_fx_pos_2", "targetname");
		foreach(var_2b30e4c7 in var_6a116a65)
		{
			if(isdefined(var_2b30e4c7.fx_tag.var_a3701ec9))
			{
				stopfx(fieldname, var_2b30e4c7.fx_tag.var_a3701ec9);
				var_2b30e4c7.fx_tag.var_a3701ec9 = undefined;
				if(isdefined(var_2b30e4c7.fx_tag))
				{
					var_2b30e4c7.fx_tag delete();
				}
			}
		}
	}
}

/*
	Name: function_1bac5158
	Namespace: namespace_dbaeabbd
	Checksum: 0xA4206FAB
	Offset: 0x2668
	Size: 0x204
	Parameters: 7
	Flags: Linked
*/
function function_1bac5158(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			var_6e938f0b = 50;
			var_e15e9f2a = 1;
			var_801f8ece = 0.15;
			break;
		}
		case 2:
		{
			var_6e938f0b = 30;
			var_e15e9f2a = 1;
			var_801f8ece = 0.15;
			break;
		}
		case 3:
		{
			var_6e938f0b = 20;
			var_e15e9f2a = 1;
			var_801f8ece = 0.15;
			break;
		}
		case 4:
		{
			var_6e938f0b = 10;
			var_e15e9f2a = 1;
			var_801f8ece = 0.15;
			break;
		}
		case 5:
		{
			var_6e938f0b = 10;
			var_e15e9f2a = 1;
			var_801f8ece = 0.15;
			break;
		}
		case 6:
		{
			var_6e938f0b = 10;
			var_e15e9f2a = 2;
			var_801f8ece = 0.2;
			break;
		}
		case 7:
		{
			var_6e938f0b = 10;
			var_e15e9f2a = 3;
			var_801f8ece = 0.3;
			break;
		}
		default:
		{
			break;
		}
	}
	if(isdefined(var_6e938f0b) && isdefined(var_e15e9f2a) && isdefined(var_801f8ece))
	{
		self thread function_bd4d69e3(fieldname, var_6e938f0b, var_e15e9f2a, var_801f8ece);
	}
}

/*
	Name: function_bd4d69e3
	Namespace: namespace_dbaeabbd
	Checksum: 0x3DD5E75B
	Offset: 0x2878
	Size: 0x272
	Parameters: 4
	Flags: Linked
*/
function function_bd4d69e3(localclientnum, var_6e938f0b, var_e15e9f2a, var_801f8ece)
{
	while(var_6e938f0b > 0)
	{
		if(!isdefined(self))
		{
			return;
		}
		n_count = 1;
		if(var_6e938f0b > 1)
		{
			n_count = randomintrange(1, int(min(var_6e938f0b, 3)));
		}
		for(i = 0; i < n_count; i++)
		{
			v_point = function_72c54d21(self.origin, randomintrange(20, 60), 180, 0);
			v_point = v_point + (self.origin + (anglestoforward(self.angles) * 150));
			switch(var_e15e9f2a)
			{
				case 1:
				{
					e_item = util::spawn_model(localclientnum, #"hash_62b204735601bbc9", v_point);
					break;
				}
				case 2:
				{
					e_item = util::spawn_model(localclientnum, #"p9_sur_junk_parts_pile", v_point);
					break;
				}
				case 3:
				{
					e_item = util::spawn_model(localclientnum, #"p9_sur_junk_parts_rare", v_point);
					break;
				}
				default:
				{
					e_item = util::spawn_model(localclientnum, #"hash_62b204735601bbc9", v_point);
					break;
				}
			}
			e_item util::delay(5, undefined, &delete);
			e_item childthread function_69ffb9e7(localclientnum, self, var_e15e9f2a);
			var_6e938f0b--;
		}
		wait(var_801f8ece);
	}
}

/*
	Name: function_72c54d21
	Namespace: namespace_dbaeabbd
	Checksum: 0xC7F0D3E3
	Offset: 0x2AF8
	Size: 0x10A
	Parameters: 4
	Flags: Linked
*/
function function_72c54d21(origin, height, outer_radius, inner_radius)
{
	theta = randomfloatrange(0, 360);
	var_9bdfd = 0.2;
	if(isdefined(inner_radius))
	{
		var_9bdfd = inner_radius / outer_radius;
	}
	x = (sin(theta) * outer_radius) * randomfloatrange(var_9bdfd, 1);
	y = (cos(theta) * outer_radius) * randomfloatrange(var_9bdfd, 1);
	z = height;
	return (x, y, z);
}

/*
	Name: function_69ffb9e7
	Namespace: namespace_dbaeabbd
	Checksum: 0x97D63724
	Offset: 0x2C10
	Size: 0x294
	Parameters: 3
	Flags: Linked
*/
function function_69ffb9e7(localclientnum, e_vehicle, var_e15e9f2a)
{
	self endon(#"death");
	var_11e5eff8 = e_vehicle.origin;
	switch(var_e15e9f2a)
	{
		case 1:
		{
			util::playfxontag(localclientnum, #"hash_240b951190d035ec", self, "tag_origin");
			break;
		}
		case 2:
		{
			util::playfxontag(localclientnum, #"hash_1c62f1903d03705a", self, "tag_origin");
			break;
		}
		case 3:
		{
			util::playfxontag(localclientnum, #"hash_3e3f86ff3fc6055", self, "tag_origin");
			break;
		}
	}
	playfx(localclientnum, #"hash_ea17935f6555b31", self.origin);
	wait(0.1);
	dist = distance(self.origin, var_11e5eff8);
	speed = 420;
	threshold = speed * 0.016;
	while(dist > threshold)
	{
		var_2b1dc7a6 = var_11e5eff8 + vectorscale((0, 0, 1), 16);
		self moveto(var_2b1dc7a6, max(dist / speed, 0.016));
		waitframe(1);
		dist = distance(self.origin, var_2b1dc7a6);
	}
	self playsound(localclientnum, #"hash_5ca9fc80b368b993");
	playfx(localclientnum, #"hash_ea17935f6555b31", self.origin);
	if(isdefined(self))
	{
		self delete();
	}
}

/*
	Name: function_53f2d015
	Namespace: namespace_dbaeabbd
	Checksum: 0xED16D3D8
	Offset: 0x2EB0
	Size: 0x17C
	Parameters: 7
	Flags: Linked
*/
function function_53f2d015(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		var_e8557e87 = struct::get("fx_jump_platform_pos", "targetname");
		var_e8557e87.fx_tag = util::spawn_model(fieldname, "tag_origin", var_e8557e87.origin, var_e8557e87.angles);
		var_e8557e87.fx_tag.fx = util::playfxontag(fieldname, #"hash_1a297fe50dbf9f3e", var_e8557e87.fx_tag, "tag_origin");
	}
	else
	{
		var_e8557e87 = struct::get("fx_jump_platform_pos", "targetname");
		if(isdefined(var_e8557e87.fx_tag.fx))
		{
			stopfx(fieldname, var_e8557e87.fx_tag.fx);
			var_e8557e87.fx_tag.fx = undefined;
			if(isdefined(var_e8557e87.fx_tag))
			{
				var_e8557e87.fx_tag delete();
			}
		}
	}
}

/*
	Name: function_58ef33dd
	Namespace: namespace_dbaeabbd
	Checksum: 0x84BAE709
	Offset: 0x3038
	Size: 0x1EE
	Parameters: 7
	Flags: Linked
*/
function function_58ef33dd(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		player = function_5c10bd79(fieldname);
		if(!is_true(player.var_2642dd3d))
		{
			return;
		}
		if(!isdefined(self.fx_tag) && !isdefined(self.var_66eb3636))
		{
			self.fx_tag = util::spawn_model(fieldname, "tag_origin", self.origin + vectorscale((0, 0, 1), 40), self.angles);
			self.var_66eb3636 = util::playfxontag(fieldname, #"hash_61e3c7a179d7cdfb", self.fx_tag, "tag_origin");
			self.fx_tag linkto(self);
		}
		self playsound(fieldname, #"hash_4a1a9d55eee5995f");
	}
	else if(isdefined(self.fx_tag) && isdefined(self.var_66eb3636))
	{
		stopfx(fieldname, self.var_66eb3636);
		self.var_66eb3636 = undefined;
		self.fx_tag unlink();
		if(isdefined(self.fx_tag))
		{
			self.fx_tag delete();
		}
		self.fx_tag = undefined;
	}
}

/*
	Name: function_3cfac49e
	Namespace: namespace_dbaeabbd
	Checksum: 0xCF4EF457
	Offset: 0x3230
	Size: 0x1CE
	Parameters: 7
	Flags: Linked
*/
function function_3cfac49e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(!isdefined(self.var_8dc5c1c3))
		{
			self.var_8dc5c1c3 = util::spawn_model(fieldname, "tag_origin", self.origin, self.angles);
			self.eye_fx = util::playfxontag(fieldname, #"hash_76394ace7e94981f", self.var_8dc5c1c3, "tag_origin");
			self.var_8dc5c1c3 linkto(self);
			self playsound(fieldname, #"hash_2c4dfc38f6bf9d69");
			self.var_8dc5c1c3 playloopsound(#"hash_b3b9bf3b225b9ae");
		}
	}
	else
	{
		self playsound(fieldname, #"hash_4dc12b2e2af084a8");
		if(isdefined(self.var_8dc5c1c3) && isdefined(self.eye_fx))
		{
			self.var_8dc5c1c3 unlink();
			stopfx(fieldname, self.eye_fx);
			self.eye_fx = undefined;
			self.var_8dc5c1c3 delete();
			self.var_8dc5c1c3 = undefined;
		}
	}
}

/*
	Name: function_ecd6d914
	Namespace: namespace_dbaeabbd
	Checksum: 0xAE973CBE
	Offset: 0x3408
	Size: 0x7A
	Parameters: 7
	Flags: Linked
*/
function function_ecd6d914(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		self.spawn_fx = util::playfxontag(fieldname, #"hash_57873154c0f618e5", self, "tag_mouth");
	}
}

/*
	Name: function_96148291
	Namespace: namespace_dbaeabbd
	Checksum: 0xAC23BD8
	Offset: 0x3490
	Size: 0x20C
	Parameters: 7
	Flags: Linked
*/
function function_96148291(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.var_bf8913a5 = util::spawn_model(fieldname, "tag_origin", self.origin, self.angles);
		self.var_bf8913a5 linkto(self);
		self.var_61fe2578 = util::playfxontag(fieldname, #"hash_15c57e68fc22a6c", self.var_bf8913a5, "tag_origin");
		self playsound(fieldname, #"hash_45ad71e8a13fe765");
	}
	else
	{
		playfx(fieldname, #"hash_6f82a1b9c4ea450e", self.var_bf8913a5.origin, anglestoforward(self.var_bf8913a5.angles), anglestoup(self.var_bf8913a5.angles));
		playsound(fieldname, #"hash_16468f39fa4fc2db", self.var_bf8913a5.origin);
		if(isdefined(self.var_61fe2578) && isdefined(self.var_bf8913a5))
		{
			stopfx(fieldname, self.var_61fe2578);
			self.var_61fe2578 = undefined;
			self.var_bf8913a5 unlink();
			self.var_bf8913a5 delete();
		}
	}
}

