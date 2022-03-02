#using script_3b8f43c68572f06;
#using script_6409d04aa560106c;
#using script_70ab01a7690ea256;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\load.csc;
#using scripts\zm_common\util.csc;

#namespace zm_laststand;

/*
	Name: function_89f2df9
	Namespace: zm_laststand
	Checksum: 0xBE366670
	Offset: 0x2A0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_laststand", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_laststand
	Checksum: 0x6A95CC76
	Offset: 0x2E8
	Size: 0x2A4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.var_629da31e = function_e49dbc72();
	callback::on_localplayer_spawned(&function_772f66bd);
	revive_hud::register();
	level.laststands = [];
	level.var_ff482f76 = zm_laststand_client::register();
	level.var_16af4504 = [];
	clientfield::function_a8bbc967("ZMInventoryPersonal.self_revive_count", #"hash_1d3ddede734994d8", #"hash_6f4d1146f69437b9", 1, 7, "int", undefined, 0, 0);
	clientfield::register("allplayers", "zm_last_stand_postfx", 1, 1, "int", &function_50d4c00a, 0, 1);
	for(i = 0; i < 5; i++)
	{
		level.laststands[i] = spawnstruct();
		level.laststands[i].laststand_update_clientfields = "laststand_update" + i;
		clientfield::register("world", level.laststands[i].laststand_update_clientfields, 1, 5, "float", &update_bleedout_timer, 0, 0);
		clientfield::function_a8bbc967(("WorldSpaceIndicators.bleedOutModel" + i) + ".hide", #"hash_56cb8e9a65d9f9ad", [1:#"hide", 0:#"bleedoutmodel" + (isdefined(i) ? "" + i : "")], 1, 1, "int", undefined, 0, 0);
	}
	callback::on_localplayer_spawned(&function_e1479c);
	level thread wait_and_set_revive_shader_constant();
}

/*
	Name: function_772f66bd
	Namespace: zm_laststand
	Checksum: 0x5498ACB6
	Offset: 0x598
	Size: 0x16A
	Parameters: 1
	Flags: Linked
*/
function function_772f66bd(localclientnum)
{
	localplayer = function_5c10bd79(localclientnum);
	var_ca9c0ca2 = getscriptbundle("zm_base_difficulty");
	switch(level.gamedifficulty)
	{
		case 0:
		{
			str_suffix = "_E";
			break;
		}
		case 1:
		default:
		{
			str_suffix = "_N";
			break;
		}
		case 2:
		{
			str_suffix = "_H";
			break;
		}
		case 3:
		{
			str_suffix = "_I";
			break;
		}
	}
	n_base = var_ca9c0ca2.("plyBaseHealth" + str_suffix);
	n_target = int(max(n_base, 1));
	localplayer.var_ee9b8af0 = n_target;
}

/*
	Name: function_e49dbc72
	Namespace: zm_laststand
	Checksum: 0x8A9E3C35
	Offset: 0x710
	Size: 0x22
	Parameters: 0
	Flags: Linked
*/
function function_e49dbc72()
{
	return getdvarfloat(#"player_laststandbleedouttime", 0);
}

/*
	Name: wait_and_set_revive_shader_constant
	Namespace: zm_laststand
	Checksum: 0x31F4A251
	Offset: 0x740
	Size: 0xD6
	Parameters: 0
	Flags: Linked
*/
function wait_and_set_revive_shader_constant()
{
	while(true)
	{
		waitresult = undefined;
		waitresult = level waittillmatch({#notetrack:"revive_shader_constant"}, #"notetrack");
		player = function_5c10bd79(waitresult.localclientnum);
		player mapshaderconstant(waitresult.localclientnum, 0, "scriptVector2", 0, 1, 0, getservertime(waitresult.localclientnum) / 1000);
		waitframe(1);
	}
}

/*
	Name: update_bleedout_timer
	Namespace: zm_laststand
	Checksum: 0xD975337C
	Offset: 0x820
	Size: 0xFC
	Parameters: 7
	Flags: Linked
*/
function update_bleedout_timer(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	substr = getsubstr(bwastimejump, 16);
	playernum = int(substr);
	model = getuimodel(getuimodel(function_1df4c3b0(binitialsnap, #"hash_56cb8e9a65d9f9ad"), "bleedOutModel" + playernum), "bleedOutPercent");
	if(isdefined(model))
	{
		setuimodelvalue(model, fieldname);
	}
}

/*
	Name: function_50d4c00a
	Namespace: zm_laststand
	Checksum: 0x24F940BC
	Offset: 0x928
	Size: 0x1B4
	Parameters: 7
	Flags: Linked
*/
function function_50d4c00a(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.var_629da31e))
	{
		return;
	}
	if(bwastimejump)
	{
		var_32c41440 = self getentitynumber();
		if(!isdefined(level.var_16af4504[var_32c41440]))
		{
			level.var_16af4504[var_32c41440] = getservertime(fieldname);
		}
		if(self == function_5c10bd79(fieldname))
		{
			var_d2c301e0 = level.var_16af4504[var_32c41440];
			self thread function_be34e28f(fieldname, var_d2c301e0);
		}
	}
	else
	{
		if(self == function_5c10bd79(fieldname))
		{
			self notify(#"hash_2f1dc2ea83ba9e2");
			self postfx::exitpostfxbundle("pstfx_zm_last_stand");
			function_ed62c9c2("zmb_laststand_riser", 0.25);
			if(isdefined(self.var_e781ace2))
			{
				self stoploopsound(self.var_e781ace2);
				self.var_e781ace2 = undefined;
			}
		}
		level.var_16af4504[self getentitynumber()] = undefined;
	}
}

/*
	Name: function_be34e28f
	Namespace: zm_laststand
	Checksum: 0xCC2BF7DB
	Offset: 0xAE8
	Size: 0x33E
	Parameters: 2
	Flags: Linked
*/
function function_be34e28f(localclientnum, var_d2c301e0)
{
	self endoncallback(&function_ac994c83, #"death", #"hash_2f1dc2ea83ba9e2");
	self postfx::playpostfxbundle("pstfx_zm_last_stand");
	var_6c2f58e2 = var_d2c301e0 + (int(level.var_629da31e * 1000));
	if(util::function_cd6c95db(localclientnum) || namespace_a6aea2c6::is_active(#"hash_65cfe78dc61dd3af"))
	{
		self postfx::function_c8b5f318("pstfx_zm_last_stand", "Desaturation", 1);
	}
	else
	{
		self postfx::function_c8b5f318("pstfx_zm_last_stand", "Enable Tint", 1);
		self postfx::function_c8b5f318("pstfx_zm_last_stand", "Tint Color R", 0.9);
		self postfx::function_c8b5f318("pstfx_zm_last_stand", "Tint Color G", 0.2);
	}
	if(!isdefined(self.var_e781ace2))
	{
		self.var_e781ace2 = self playloopsound("zmb_laststand_player_whisper_riser");
		setsoundvolume(self.var_e781ace2, 0);
	}
	while(true)
	{
		n_current_time = getservertime(localclientnum);
		if(n_current_time >= var_6c2f58e2)
		{
			self postfx::function_c8b5f318("pstfx_zm_last_stand", "Opacity", 0.25);
			return;
		}
		n_opacity = mapfloat(var_d2c301e0, var_6c2f58e2, 0, 0.25, n_current_time);
		self postfx::function_c8b5f318("pstfx_zm_last_stand", "Opacity", n_opacity);
		var_22cd2467 = mapfloat(var_d2c301e0, var_6c2f58e2, 0, 1, n_current_time);
		var_f384f371 = mapfloat(var_d2c301e0, var_6c2f58e2, 0, 0.6, n_current_time);
		function_5ea2c6e3("zmb_laststand_riser", 0.05, var_f384f371);
		setsoundvolume(self.var_e781ace2, var_22cd2467);
		waitframe(1);
	}
}

/*
	Name: function_ac994c83
	Namespace: zm_laststand
	Checksum: 0x98A01154
	Offset: 0xE30
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function function_ac994c83(var_c34665fc)
{
	if(var_c34665fc == "death" && isdefined(self))
	{
		self postfx::exitpostfxbundle("pstfx_zm_last_stand");
		function_ed62c9c2("zmb_laststand_riser", 0.25);
		if(isdefined(self.var_e781ace2))
		{
			self stoploopsound(self.var_e781ace2);
			self.var_e781ace2 = undefined;
		}
	}
}

/*
	Name: function_e1479c
	Namespace: zm_laststand
	Checksum: 0xF4E53BE0
	Offset: 0xED0
	Size: 0xEC
	Parameters: 1
	Flags: Linked
*/
function function_e1479c(localclientnum)
{
	if(!isdefined(level.var_4678ce7c))
	{
		level.var_4678ce7c = [];
	}
	if(function_65b9eb0f(localclientnum) && !is_true(level.var_4678ce7c[localclientnum]))
	{
		level lui::screen_fade_out(localclientnum, 0, (1, 1, 1));
		level thread lui::screen_fade_in(localclientnum, 0.75, (1, 1, 1));
		level.var_4678ce7c[localclientnum] = 1;
	}
	else if(!function_65b9eb0f(localclientnum))
	{
		level.var_4678ce7c[localclientnum] = undefined;
	}
}

