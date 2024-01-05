#using scripts\zm_common\zm_utility.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace zm_fasttravel;

/*
	Name: __init__system__
	Namespace: zm_fasttravel
	Checksum: 0xCE6D362B
	Offset: 0x340
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_fasttravel", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_fasttravel
	Checksum: 0xBD897F08
	Offset: 0x388
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_clientfields();
	init_fx();
}

/*
	Name: init_clientfields
	Namespace: zm_fasttravel
	Checksum: 0x1110CE1E
	Offset: 0x3B8
	Size: 0x304
	Parameters: 0
	Flags: None
*/
function init_clientfields()
{
	clientfield::register("world", "fasttravel_exploder", 1, 1, "int", &fasttravel_exploder, 0, 0);
	clientfield::register("scriptmover", "" + #"wormhole_fx", 1, 2, "int", &wormhole_fx, 0, 0);
	clientfield::register("toplayer", "player_stargate_fx", 1, 1, "int", &player_stargate_fx, 0, 1);
	clientfield::register("toplayer", "player_chaos_light_rail_fx", 1, 1, "int", &player_chaos_light_rail_fx, 0, 1);
	clientfield::register("toplayer", "fasttravel_teleport_sfx", 1, 1, "int", &fasttravel_teleport_sfx, 0, 0);
	clientfield::register("toplayer", "" + #"hash_638ce9451eb0ea49", 1, 3, "int", &function_f998fa4c, 0, 0);
	clientfield::register("allplayers", "fasttravel_start_fx", 1, 1, "counter", &fasttravel_start_fx, 0, 0);
	clientfield::register("allplayers", "fasttravel_end_fx", 1, 1, "counter", &fasttravel_end_fx, 0, 0);
	clientfield::register("allplayers", "fasttravel_rail_fx", 1, 2, "int", &fasttravel_rail_fx, 0, 0);
	clientfield::register("allplayers", "" + #"hash_1747eb69683ce477", 1, 1, "int", &function_7287c2e4, 0, 0);
}

/*
	Name: init_fx
	Namespace: zm_fasttravel
	Checksum: 0xE82328A5
	Offset: 0x6C8
	Size: 0x11C
	Parameters: 0
	Flags: None
*/
function init_fx()
{
	level._effect[#"fasttravel_start"] = #"hash_2f54a4439f3a1dbf";
	level._effect[#"fasttravel_end"] = #"hash_4ab05aa1282b9bb7";
	level._effect[#"fasttravel_rail_1p"] = #"hash_259bb7806d596ed3";
	level._effect[#"fasttravel_break_1p"] = #"hash_37257517a8fd29e";
	level._effect[#"fasttravel_rail_3p"] = #"hash_72a1af7c420b4134";
	level._effect[#"fasttravel_break_3p"] = #"hash_13715b19c0c0e890";
	level._effect[#"fasttravel_rail_travel"] = #"hash_3659a06ed75f940a";
}

/*
	Name: fasttravel_exploder
	Namespace: zm_fasttravel
	Checksum: 0x9AC1803D
	Offset: 0x7F0
	Size: 0x84
	Parameters: 7
	Flags: None
*/
function fasttravel_exploder(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		level exploder::exploder("fxexp_fast_travel_orbs");
	}
	else
	{
		level exploder::stop_exploder("fxexp_fast_travel_orbs");
	}
}

/*
	Name: player_chaos_light_rail_fx
	Namespace: zm_fasttravel
	Checksum: 0x83BD0394
	Offset: 0x880
	Size: 0x224
	Parameters: 7
	Flags: None
*/
function player_chaos_light_rail_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(isdemoplaying() && demoisanyfreemovecamera())
		{
			return;
		}
		var_8203417 = function_5c10bd79(fieldname);
		if(self != var_8203417)
		{
			return;
		}
		if(!isdefined(self.var_9a68f89f))
		{
			v_origin = self gettagorigin("tag_eye");
			self.var_9a68f89f = self function_dddf661d(fieldname, "fasttravel_rail_travel", "tag_origin", v_origin, self.angles);
			self thread function_eaba4969(fieldname, "fasttravel_rail_travel_complete", self.var_9a68f89f);
		}
		if(isdefined(level.var_5603a802))
		{
			self thread postfx::playpostfxbundle(level.var_5603a802);
		}
		else
		{
			self thread postfx::playpostfxbundle("pstfx_zm_chaos_temp");
		}
	}
	else
	{
		self notify(#"fasttravel_rail_travel_complete");
		if(isdefined(self.var_9a68f89f))
		{
			function_4468d7ac(fieldname, self.var_9a68f89f);
			self.var_9a68f89f = undefined;
		}
		if(isdefined(level.var_5603a802))
		{
			self postfx::exitpostfxbundle(level.var_5603a802);
		}
		else
		{
			self postfx::exitpostfxbundle("pstfx_zm_chaos_temp");
		}
	}
}

/*
	Name: wormhole_fx
	Namespace: zm_fasttravel
	Checksum: 0x3427EE82
	Offset: 0xAB0
	Size: 0xAC
	Parameters: 7
	Flags: None
*/
function wormhole_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	str_fx = "zombie/fx9_aether_tear_portal_tunnel_1p";
	if(isdefined(str_fx))
	{
		self util::waittill_dobj(bwastimejump);
		waitframe(1);
		util::playfxontag(bwastimejump, str_fx, self, "tag_fx_wormhole");
	}
}

/*
	Name: player_stargate_fx
	Namespace: zm_fasttravel
	Checksum: 0xF6994154
	Offset: 0xB68
	Size: 0xB4
	Parameters: 7
	Flags: None
*/
function player_stargate_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(isdemoplaying() && demoisanyfreemovecamera())
		{
			return;
		}
		self thread postfx::playpostfxbundle("pstfx_zm_wormhole");
	}
	else
	{
		self postfx::exitpostfxbundle("pstfx_zm_wormhole");
	}
}

/*
	Name: function_f998fa4c
	Namespace: zm_fasttravel
	Checksum: 0x43BF054F
	Offset: 0xC28
	Size: 0x10C
	Parameters: 7
	Flags: None
*/
function function_f998fa4c(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		if(bwastimejump > 4)
		{
			bwastimejump = 4;
		}
		str_name = "s_teleport_room_" + bwastimejump;
		s_teleport_room = struct::get(str_name, "targetname");
		self camerasetposition(s_teleport_room.origin);
		self camerasetlookat(s_teleport_room.angles);
		self cameraactivate(1);
	}
	else
	{
		self cameraactivate(0);
	}
}

/*
	Name: fasttravel_teleport_sfx
	Namespace: zm_fasttravel
	Checksum: 0x64C2E424
	Offset: 0xD40
	Size: 0x126
	Parameters: 7
	Flags: None
*/
function fasttravel_teleport_sfx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self util::waittill_dobj(fieldname);
	if(!isdefined(self))
	{
		return;
	}
	if(bwastimejump)
	{
		if(!isdefined(self.fasttravel_teleport_sfx))
		{
			self playsound(fieldname, #"hash_695df080bafaf6b7");
			self.fasttravel_teleport_sfx = self playloopsound(#"hash_337255a64f96457b");
		}
	}
	else if(isdefined(self.fasttravel_teleport_sfx))
	{
		self playsound(fieldname, #"hash_32def2a5219ba9ee");
		self stoploopsound(self.fasttravel_teleport_sfx);
		self.fasttravel_teleport_sfx = undefined;
	}
}

/*
	Name: fasttravel_start_fx
	Namespace: zm_fasttravel
	Checksum: 0xF8C173E2
	Offset: 0xE70
	Size: 0x1BC
	Parameters: 7
	Flags: None
*/
function fasttravel_start_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	level endon(#"end_game");
	self endon(#"bled_out", #"disconnect");
	if(self != function_5c10bd79(fieldname))
	{
		if(bwastimejump == 1)
		{
			var_1d1bbd52 = struct::get_array("fasttravel_trigger", "targetname");
			var_4d611aa2 = arraygetclosest(self.origin, var_1d1bbd52);
			if(!isdefined(var_4d611aa2))
			{
				return;
			}
			v_angles = vectortoangles(var_4d611aa2.origin - self.origin);
			mdl_fx = util::spawn_model(fieldname, "tag_origin", self.origin, v_angles);
			waitframe(1);
			util::playfxontag(fieldname, level._effect[#"fasttravel_start"], mdl_fx, "tag_origin");
			wait(1.5);
			mdl_fx delete();
		}
	}
}

/*
	Name: fasttravel_end_fx
	Namespace: zm_fasttravel
	Checksum: 0xEFE67D70
	Offset: 0x1038
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function fasttravel_end_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread play_fasttravel_end_fx(fieldname);
	}
}

/*
	Name: play_fasttravel_end_fx
	Namespace: zm_fasttravel
	Checksum: 0x775F23B6
	Offset: 0x10A0
	Size: 0x12C
	Parameters: 2
	Flags: None
*/
function play_fasttravel_end_fx(localclientnum, var_b8763ebc)
{
	if(!isdefined(var_b8763ebc))
	{
		var_b8763ebc = "fasttravel_end";
	}
	level endon(#"end_game");
	self endon(#"bled_out", #"disconnect");
	if(self != function_5c10bd79(localclientnum))
	{
		v_angles = combineangles(self.angles, vectorscale((-1, 0, 0), 90));
		mdl_fx = util::spawn_model(localclientnum, "tag_origin", self.origin, v_angles);
		waitframe(1);
		util::playfxontag(localclientnum, level._effect[var_b8763ebc], mdl_fx, "tag_origin");
		wait(1.15);
		mdl_fx delete();
	}
}

/*
	Name: fasttravel_rail_fx
	Namespace: zm_fasttravel
	Checksum: 0x50EDF05B
	Offset: 0x11D8
	Size: 0x43E
	Parameters: 7
	Flags: None
*/
function fasttravel_rail_fx(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(!isdefined(self.sfx_fasttravel))
		{
			self playsound(fieldname, #"hash_7204b092c976136b");
			self.sfx_fasttravel = self playloopsound(#"hash_33b6a998603c309d");
		}
		if(!isdefined(self.var_a6b9f4c1))
		{
			var_8203417 = function_5c10bd79(fieldname);
			if(self == var_8203417)
			{
				v_origin = self gettagorigin("tag_eye");
				self.var_a6b9f4c1 = self function_dddf661d(fieldname, "fasttravel_rail_1p", "tag_origin", v_origin, self.angles);
			}
			else
			{
				v_origin = self gettagorigin("j_spine4");
				self.var_a6b9f4c1 = self function_dddf661d(fieldname, "fasttravel_rail_3p", "tag_origin", v_origin, self.angles);
			}
			self thread function_eaba4969(fieldname, "fasttravel_rail_fx_complete", self.var_a6b9f4c1);
		}
	}
	else
	{
		if(bwastimejump == 2)
		{
			if(!isdefined(self.sfx_fasttravel))
			{
				self playsound(fieldname, #"hash_7f171ce50ab41fb8");
				self.sfx_fasttravel = self playloopsound(#"hash_59921813746566c8");
			}
			if(isdefined(self.var_a6b9f4c1))
			{
				self notify(#"fasttravel_rail_fx_complete");
				function_4468d7ac(fieldname, self.var_a6b9f4c1);
			}
			var_8203417 = function_5c10bd79(fieldname);
			if(self == var_8203417)
			{
				v_origin = self gettagorigin("tag_eye");
				self.var_a6b9f4c1 = self function_dddf661d(fieldname, "fasttravel_break_1p", "tag_origin", v_origin, self.angles);
			}
			else
			{
				v_origin = self gettagorigin("j_spine4");
				self.var_a6b9f4c1 = self function_dddf661d(fieldname, "fasttravel_break_3p", "tag_origin", v_origin, self.angles);
			}
			self thread function_eaba4969(fieldname, "fasttravel_rail_fx_complete", self.var_a6b9f4c1);
		}
		else if(bwastimejump == 0)
		{
			if(isdefined(self.sfx_fasttravel))
			{
				self playsound(fieldname, #"hash_588047eba8deb34e");
				self stoploopsound(self.sfx_fasttravel);
				self.sfx_fasttravel = undefined;
			}
			if(isdefined(self.var_a6b9f4c1))
			{
				self notify(#"fasttravel_rail_fx_complete");
				function_4468d7ac(fieldname, self.var_a6b9f4c1);
				self.var_a6b9f4c1 = undefined;
			}
		}
	}
}

/*
	Name: function_dddf661d
	Namespace: zm_fasttravel
	Checksum: 0xC6CB0AB0
	Offset: 0x1620
	Size: 0xAE
	Parameters: 5
	Flags: Private
*/
function private function_dddf661d(localclientnum, str_fx, str_tag, v_origin, v_angles)
{
	mdl_fx = util::spawn_model(localclientnum, "tag_origin", v_origin, v_angles);
	mdl_fx linkto(self, str_tag);
	mdl_fx.n_fx = util::playfxontag(localclientnum, level._effect[str_fx], mdl_fx, "tag_origin");
	return mdl_fx;
}

/*
	Name: function_eaba4969
	Namespace: zm_fasttravel
	Checksum: 0x8A9B316B
	Offset: 0x16D8
	Size: 0x6C
	Parameters: 3
	Flags: Private
*/
function private function_eaba4969(localclientnum, var_92d4e054, mdl_fx)
{
	level endon(#"end_game");
	self endon(var_92d4e054);
	self waittill(#"death");
	function_4468d7ac(localclientnum, mdl_fx);
}

/*
	Name: function_4468d7ac
	Namespace: zm_fasttravel
	Checksum: 0x3FB97681
	Offset: 0x1750
	Size: 0x64
	Parameters: 2
	Flags: Private
*/
function private function_4468d7ac(localclientnum, mdl_fx)
{
	if(isdefined(mdl_fx))
	{
		if(isdefined(mdl_fx.n_fx))
		{
			stopfx(localclientnum, mdl_fx.n_fx);
		}
		mdl_fx delete();
	}
}

/*
	Name: function_7287c2e4
	Namespace: zm_fasttravel
	Checksum: 0x714AAEA9
	Offset: 0x17C0
	Size: 0x3C6
	Parameters: 7
	Flags: None
*/
function function_7287c2e4(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		if(zm_utility::function_f8796df3(fieldname))
		{
			self playrenderoverridebundle(#"hash_6ec5fcc31672bb85");
			self postfx::playpostfxbundle(#"hash_5bcfd80691463dec");
			self.var_f7c6ea19 = playfxoncamera(fieldname, #"hash_7fcde6a254a7228", (0, 0, 0), (1, 0, 0), (0, 0, 1));
		}
		else
		{
			self playrenderoverridebundle(#"hash_733f9eb274c33ff8");
			self.var_40ba3bb2 = util::playfxontag(fieldname, #"hash_803ea6a2550a53a", self, "j_head");
			self.var_4a2dac48 = util::playfxontag(fieldname, #"hash_ee42b8ead6d79d1", self, "j_spine4");
		}
		if(!isdefined(self.var_efa99dd5))
		{
			self playsound(fieldname, #"hash_525507bf80e4399", self.origin + vectorscale((0, 0, 1), 75));
			self.var_efa99dd5 = self playloopsound(#"hash_8cab833a49210df", undefined, vectorscale((0, 0, 1), 75));
		}
	}
	else
	{
		self notify(#"hash_69b6a912d9991761");
		if(self function_d2503806(#"hash_6ec5fcc31672bb85"))
		{
			self stoprenderoverridebundle(#"hash_6ec5fcc31672bb85");
		}
		if(self function_d2503806(#"hash_733f9eb274c33ff8"))
		{
			self stoprenderoverridebundle(#"hash_733f9eb274c33ff8");
		}
		if(self postfx::function_556665f2(#"hash_5bcfd80691463dec"))
		{
			self postfx::exitpostfxbundle(#"hash_5bcfd80691463dec");
		}
		if(isdefined(self.var_f7c6ea19))
		{
			stopfx(fieldname, self.var_f7c6ea19);
			self.var_f7c6ea19 = undefined;
		}
		if(isdefined(self.var_40ba3bb2))
		{
			stopfx(fieldname, self.var_40ba3bb2);
			self.var_40ba3bb2 = undefined;
		}
		if(isdefined(self.var_4a2dac48))
		{
			stopfx(fieldname, self.var_4a2dac48);
			self.var_4a2dac48 = undefined;
		}
		if(isdefined(self.var_efa99dd5))
		{
			self playsound(fieldname, #"hash_4025d3c0c7607b08", self.origin + vectorscale((0, 0, 1), 75));
			self stoploopsound(self.var_efa99dd5);
			self.var_efa99dd5 = undefined;
		}
	}
}

