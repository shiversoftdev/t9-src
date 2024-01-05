#using script_5dc2afb89fe97cd0;
#using scripts\core_common\footsteps_shared.csc;
#using scripts\core_common\util_shared.csc;
#using script_ac6a30f1991e105;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\ai_shared.csc;

#namespace namespace_88795f45;

/*
	Name: __init__system__
	Namespace: namespace_88795f45
	Checksum: 0xD3C9D85D
	Offset: 0x408
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_338a74f5c94ba66a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_88795f45
	Checksum: 0x49980C27
	Offset: 0x450
	Size: 0x25C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	clientfield::register("actor", "steiner_radiation_bomb_prepare_fire_clientfield", 1, 1, "int", &function_bc28111c, 0, 0);
	clientfield::register("scriptmover", "radiation_bomb_play_landed_fx", 1, 2, "int", &function_8a3fc4ac, 0, 0);
	clientfield::register("missile", "radiation_bomb_trail_fx_clientfield", 1, 1, "int", &function_fc88234b, 0, 0);
	clientfield::register("actor", "steiner_split_combine_fx_clientfield", 1, 1, "int", &function_66027924, 0, 0);
	clientfield::register("actor", "steiner_perform_split_clientfield", 1, 1, "counter", &function_5bde700f, 0, 0);
	clientfield::register("actor", "steiner_cleanup_teleport_clientfield", 4000, 1, "counter", &function_99c14949, 0, 0);
	function_cae618b4("spawner_zm_steiner");
	function_cae618b4("spawner_zm_steiner_split_radiation_blast");
	function_cae618b4("spawner_zm_steiner_split_radiation_bomb");
	footsteps::registeraitypefootstepcb(#"hash_7c0d83ac1e845ac2", &function_5a53905d);
	ai::add_archetype_spawn_function(#"hash_7c0d83ac1e845ac2", &function_7ec99c76);
}

/*
	Name: function_7ec99c76
	Namespace: namespace_88795f45
	Checksum: 0x383D5066
	Offset: 0x6B8
	Size: 0x19C
	Parameters: 1
	Flags: Private
*/
function private function_7ec99c76(localclientnum)
{
	if(self.var_9fde8624 === #"hash_5653bbc44a034094" || self.var_9fde8624 === #"hash_12fa854f3a7721b9")
	{
		util::playfxontag(localclientnum, "zm_ai/fx9_steiner_eyes_glow_sm", self, "J_EyeBall_RI");
		self thread function_59ee055f(localclientnum);
	}
	else
	{
		if(self.var_9fde8624 === #"hash_70162f4bc795092" || self.var_9fde8624 === #"hash_3498fb1fbfcd0cf")
		{
			util::playfxontag(localclientnum, "zm_ai/fx9_steiner_eyes_glow_sm", self, "J_EyeBall_LE");
			self thread function_59ee055f(localclientnum);
		}
		else
		{
			if(self.team === #"allies")
			{
			}
			else
			{
				self.eyefx = util::playfxontag(localclientnum, "zm_ai/fx9_steiner_eyes_glow", self, "J_EyeBall_LE");
				self thread function_8d607c5a(localclientnum);
			}
		}
	}
	if(isdefined(self.fxdef))
	{
		fxclientutils::playfxbundle(localclientnum, self, self.fxdef);
	}
	self thread function_14dd171f(localclientnum);
}

/*
	Name: function_8d607c5a
	Namespace: namespace_88795f45
	Checksum: 0xD8C74709
	Offset: 0x860
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_8d607c5a(localclientnum)
{
	self playsound(localclientnum, #"hash_13985582064d5e89");
	if(!is_true(level.var_12da60e6))
	{
		self playsound(localclientnum, #"hash_152bc9d7c6ad1991");
	}
	self.var_5bea7e99 = self playloopsound(#"hash_2353ca5802f38a90", undefined, vectorscale((0, 0, 1), 50));
	self thread function_c3ae0dcf();
	self thread function_ce1bd3f2(localclientnum);
}

/*
	Name: function_59ee055f
	Namespace: namespace_88795f45
	Checksum: 0x1F1EF91A
	Offset: 0x940
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_59ee055f(localclientnum)
{
	self.var_5bea7e99 = self playloopsound(#"hash_2cf37d960900db7a", undefined, vectorscale((0, 0, 1), 50));
	self thread function_c3ae0dcf();
	self thread function_b53ee6c9(localclientnum);
}

/*
	Name: function_c3ae0dcf
	Namespace: namespace_88795f45
	Checksum: 0xE96E5899
	Offset: 0x9B8
	Size: 0x76
	Parameters: 0
	Flags: None
*/
function function_c3ae0dcf()
{
	self endon(#"death", #"entitydeleted");
	while(true)
	{
		s_result = undefined;
		s_result = self waittill(#"hash_75d966259d999fc2");
		self.var_ce0f9600 = int(s_result.active);
	}
}

/*
	Name: function_ce1bd3f2
	Namespace: namespace_88795f45
	Checksum: 0xAF604228
	Offset: 0xA38
	Size: 0x1E8
	Parameters: 1
	Flags: None
*/
function function_ce1bd3f2(localclientnum)
{
	if(!isdefined(self.var_ce0f9600))
	{
		self.var_ce0f9600 = 1;
	}
	self endon(#"death", #"entitydeleted");
	var_b240b48 = "inhale";
	suffix = "";
	var_4f50b172 = 0.7;
	var_5fbfc988 = 0.8;
	var_7f07b218 = 1.2;
	var_4dfa7e5a = 1.3;
	n_wait_min = var_4f50b172;
	n_wait_max = var_5fbfc988;
	var_d49193ec = #"hash_43accb909782c33";
	while(true)
	{
		if(self.var_ce0f9600 >= 1)
		{
			suffix = "";
			n_wait_min = var_4f50b172;
			n_wait_max = var_5fbfc988;
			if(self.var_ce0f9600 >= 2)
			{
				suffix = "_slow";
				n_wait_min = var_7f07b218;
				n_wait_max = var_4dfa7e5a;
			}
			self playsound(localclientnum, (var_d49193ec + var_b240b48) + suffix, self.origin + vectorscale((0, 0, 1), 75));
			wait(randomfloatrange(n_wait_min, n_wait_max));
			if(var_b240b48 === "inhale")
			{
				var_b240b48 = "exhale";
			}
			else
			{
				var_b240b48 = "inhale";
			}
		}
		else
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_b53ee6c9
	Namespace: namespace_88795f45
	Checksum: 0x9A3F4F39
	Offset: 0xC28
	Size: 0x220
	Parameters: 1
	Flags: None
*/
function function_b53ee6c9(localclientnum)
{
	if(!isdefined(self.var_ce0f9600))
	{
		self.var_ce0f9600 = 1;
	}
	self endon(#"death", #"entitydeleted");
	var_b240b48 = "inhale";
	suffix = "";
	var_4f50b172 = 0.75;
	var_5fbfc988 = 0.85;
	var_7f07b218 = 0.75;
	var_4dfa7e5a = 0.85;
	n_wait_min = var_4f50b172;
	n_wait_max = var_5fbfc988;
	var_d49193ec = #"hash_24b7a2e5066beff3";
	while(true)
	{
		if(self.var_ce0f9600 >= 1)
		{
			suffix = "";
			n_wait_min = var_4f50b172;
			n_wait_max = var_5fbfc988;
			if(self.var_ce0f9600 >= 2)
			{
				suffix = "_slow";
				n_wait_min = var_7f07b218;
				n_wait_max = var_4dfa7e5a;
			}
			self playsound(localclientnum, (var_d49193ec + var_b240b48) + suffix, self.origin + vectorscale((0, 0, 1), 75));
			if(var_b240b48 === "inhale")
			{
				wait(randomfloatrange(0.45, 0.5));
			}
			else
			{
				wait(randomfloatrange(n_wait_min, n_wait_max));
			}
			if(var_b240b48 === "inhale")
			{
				var_b240b48 = "exhale";
			}
			else
			{
				var_b240b48 = "inhale";
			}
		}
		else
		{
			wait(0.1);
		}
	}
}

/*
	Name: function_43c3e59b
	Namespace: namespace_88795f45
	Checksum: 0x5DD9DB9B
	Offset: 0xE50
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function function_43c3e59b(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
	if(wasdemojump && self util::function_50ed1561(fieldname))
	{
		self thread function_90825d39(fieldname);
	}
}

/*
	Name: function_90825d39
	Namespace: namespace_88795f45
	Checksum: 0x4D891ACE
	Offset: 0xED0
	Size: 0xE6
	Parameters: 1
	Flags: Private
*/
function private function_90825d39(localclientnum)
{
	self notify(#"hash_508cee63b27b3dfe");
	self endon(#"death", #"disconnect", #"hash_508cee63b27b3dfe");
	var_9e38be0 = 1;
	self endoncallback(&function_8e5ed66f, #"death", #"hash_54e6312d7378b65e");
	if(!self postfx::function_556665f2("pstfx_damage_over_time"))
	{
		self postfx::playpostfxbundle("pstfx_damage_over_time");
	}
	wait(var_9e38be0);
	self notify(#"hash_54e6312d7378b65e");
}

/*
	Name: function_8e5ed66f
	Namespace: namespace_88795f45
	Checksum: 0x2A4B107
	Offset: 0xFC0
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private function_8e5ed66f(notifyhash)
{
	if(self postfx::function_556665f2("pstfx_damage_over_time"))
	{
		self postfx::stoppostfxbundle("pstfx_damage_over_time");
	}
}

/*
	Name: function_bc28111c
	Namespace: namespace_88795f45
	Checksum: 0x91DC9479
	Offset: 0x1018
	Size: 0x3C
	Parameters: 7
	Flags: None
*/
function function_bc28111c(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump)
{
}

/*
	Name: function_523961e2
	Namespace: namespace_88795f45
	Checksum: 0x3F4B51E0
	Offset: 0x1060
	Size: 0x8C
	Parameters: 7
	Flags: Private
*/
function private function_523961e2(startpos, normal, var_4997e17c, fxindex, fxcount, defaultdistance, rotation)
{
	currentangle = (360 / fxcount) * fxindex;
	var_7ee25402 = rotatepointaroundaxis(var_4997e17c * defaultdistance, normal, currentangle + rotation);
	return startpos + var_7ee25402;
}

/*
	Name: function_371c2ab4
	Namespace: namespace_88795f45
	Checksum: 0x77622CD8
	Offset: 0x10F8
	Size: 0x5CA
	Parameters: 2
	Flags: Private
*/
function private function_371c2ab4(startpos, normal)
{
	normal = vectornormalize(normal);
	if(normal[2] < 0.3)
	{
		normal = (0, 0, 1);
	}
	locations = [];
	rotation = randomint(360);
	var_4997e17c = perpendicularvector(normal);
	for(count = 0; count < 12; count++)
	{
		locations[count] = {#fx:"zm_ai/fx9_steiner_rad_bomb_spot_lg_loop", #normal:(0, 0, 1), #position:(0, 0, 0)};
		point = function_523961e2(startpos, normal, var_4997e17c, count, 12, 120, rotation);
		/#
			if(getdvarint(#"hash_65abc910bc611782", 0))
			{
				line(startpos + (normal * 20), point, vectorscale((1, 1, 1), 0.1), 1, 1, 300);
			}
		#/
		trace = bullettrace(startpos + (normal * 20), point, 0, undefined);
		traceposition = trace[#"position"];
		hitsomething = 0;
		if(trace[#"fraction"] < 0.7)
		{
			locations[count].position = traceposition;
			locations[count].normal = trace[#"normal"];
			locations[count].fx = (trace[#"fraction"] < 0.2 ? "zm_ai/fx9_steiner_rad_bomb_spot_lg_loop" : "zm_ai/fx9_steiner_rad_bomb_spot_md_loop");
			hitsomething = 1;
		}
		if(!hitsomething)
		{
			var_e5d1793d = bullettrace(traceposition, traceposition - (normal * 100), 0, undefined);
			if(var_e5d1793d[#"fraction"] != 1)
			{
				locations[count].position = var_e5d1793d[#"position"];
				locations[count].normal = var_e5d1793d[#"normal"];
				locations[count].fx = "zm_ai/fx9_steiner_rad_bomb_spot_sm_loop";
			}
		}
		randangle = randomint(360);
		var_c4b09917 = randomfloatrange(-25, 25);
		var_7ee25402 = rotatepointaroundaxis(var_4997e17c, normal, randangle);
		var_995eb37a = int(min((2 * trace[#"fraction"]) + 1, 2));
		for(var_ecef2fde = 0; var_ecef2fde < var_995eb37a && (count % 2) == 0; var_ecef2fde++)
		{
			fraction = (var_ecef2fde + 1) / (var_995eb37a + 1);
			offsetpoint = (startpos + ((traceposition - startpos) * fraction)) + (var_7ee25402 * var_c4b09917);
			var_9417df90 = bullettrace(offsetpoint, offsetpoint - (normal * 90), 0, undefined);
			if(var_9417df90[#"fraction"] != 1)
			{
				locindex = count + (12 * (var_ecef2fde + 1));
				locations[locindex] = {#fx:"zm_ai/fx9_steiner_rad_bomb_spot_lg_loop", #normal:var_9417df90[#"normal"], #position:var_9417df90[#"position"]};
			}
		}
	}
	return arraycombine([1:{#fx:"zm_ai/fx9_steiner_rad_bomb_circle_128", #normal:normal, #position:startpos}, 0:{#fx:"zm_ai/fx9_steiner_rad_bomb_rock_exp", #normal:normal, #position:startpos}], locations);
}

/*
	Name: function_8a3fc4ac
	Namespace: namespace_88795f45
	Checksum: 0x5803EFCD
	Offset: 0x16D0
	Size: 0x424
	Parameters: 7
	Flags: None
*/
function function_8a3fc4ac(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(self))
	{
		return;
	}
	if(isdefined(self.var_c84b9ae1))
	{
		foreach(fx in self.var_c84b9ae1)
		{
			stopfx(fieldname, fx);
		}
		self.var_c84b9ae1 = undefined;
	}
	if(isdefined(self.var_50ad299b))
	{
		self stoploopsound(self.var_50ad299b);
		self.var_50ad299b = undefined;
	}
	if(bwastimejump == 1)
	{
		if(!isdefined(self.var_50ad299b))
		{
			self.var_50ad299b = self playloopsound(#"hash_274eabfed204a7fc", undefined, vectorscale((0, 0, 1), 25));
		}
		locations = function_371c2ab4(self.origin, self.angles);
		self.var_c84b9ae1 = [];
		foreach(loc in locations)
		{
			if(!isdefined(loc))
			{
				continue;
			}
			/#
				if(getdvarint(#"hash_65abc910bc611782", 0))
				{
					sphere(loc.position, 5, (1, 0, 0), 1, 1, 60, 300);
				}
			#/
			if(lengthsquared(loc.position) < 0.001 || lengthsquared(loc.normal) < 0.99)
			{
				continue;
			}
			forward = (1, 0, 0);
			if(abs(vectordot(forward, loc.normal)) > 0.999)
			{
				forward = (0, 0, 1);
			}
			self.var_c84b9ae1[self.var_c84b9ae1.size] = playfx(fieldname, loc.fx, loc.position, forward, loc.normal);
		}
	}
	else
	{
		if(bwastimejump == 2)
		{
		}
		else
		{
			normal = vectornormalize(self.angles);
			forward = (1, 0, 0);
			if(abs(vectordot(forward, normal)) > 0.999)
			{
				forward = (0, 0, 1);
			}
			if(normal !== (0, 0, 0))
			{
				playfx(fieldname, #"hash_f384e23fbf73002", self.origin, forward, normal);
			}
		}
	}
}

/*
	Name: function_fc88234b
	Namespace: namespace_88795f45
	Checksum: 0xD8383CC0
	Offset: 0x1B00
	Size: 0xAE
	Parameters: 7
	Flags: None
*/
function function_fc88234b(localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self.trailfx = util::playfxontag(fieldname, #"zm_ai/fx9_steiner_rad_bomb_ai", self, "tag_origin");
	}
	else if(isdefined(self.trailfx))
	{
		level thread function_e5799b09(fieldname, self.trailfx);
		self.trailfx = undefined;
	}
}

/*
	Name: function_e5799b09
	Namespace: namespace_88795f45
	Checksum: 0xE4987719
	Offset: 0x1BB8
	Size: 0x34
	Parameters: 2
	Flags: Private
*/
function private function_e5799b09(localclientnum, fx)
{
	waitframe(1);
	stopfx(localclientnum, fx);
}

/*
	Name: function_5a53905d
	Namespace: namespace_88795f45
	Checksum: 0x97F8F66D
	Offset: 0x1BF8
	Size: 0x1B4
	Parameters: 5
	Flags: None
*/
function function_5a53905d(localclientnum, pos, surface, notetrack, bone)
{
	if(self.var_9fde8624 === #"hash_5653bbc44a034094" || self.var_9fde8624 === #"hash_70162f4bc795092" || self.var_9fde8624 === #"hash_12fa854f3a7721b9" || self.var_9fde8624 === #"hash_3498fb1fbfcd0cf")
	{
		return;
	}
	/#
		if(isdefined(level.var_53094f02))
		{
			return;
		}
	#/
	a_players = getlocalplayers();
	for(i = 0; i < a_players.size; i++)
	{
		if(abs(self.origin[2] - a_players[i].origin[2]) < 128)
		{
			var_ed2e93e5 = a_players[i] getlocalclientnumber();
			if(isdefined(var_ed2e93e5))
			{
				earthquake(var_ed2e93e5, 0.22, 0.1, self.origin, 1000);
				playrumbleonposition(var_ed2e93e5, "steiner_footsteps", self.origin);
			}
		}
	}
}

/*
	Name: function_66027924
	Namespace: namespace_88795f45
	Checksum: 0x9EE22EA0
	Offset: 0x1DB8
	Size: 0x74
	Parameters: 7
	Flags: None
*/
function function_66027924(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump && isdefined(self))
	{
		util::playfxontag(fieldname, "zombie/fx8_red_bathhouse_mirror_glare_loop", self, "j_spineupper");
	}
}

/*
	Name: function_14dd171f
	Namespace: namespace_88795f45
	Checksum: 0xE9347338
	Offset: 0x1E38
	Size: 0xC
	Parameters: 1
	Flags: Private
*/
function private function_14dd171f(localclientnum)
{
}

/*
	Name: function_5bde700f
	Namespace: namespace_88795f45
	Checksum: 0x7EE409A2
	Offset: 0x1E50
	Size: 0x86
	Parameters: 7
	Flags: None
*/
function function_5bde700f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump && isdefined(self))
	{
		if(isdefined(self.eyefx))
		{
			killfx(fieldname, self.eyefx);
			self.eyefx = undefined;
		}
	}
}

/*
	Name: function_99c14949
	Namespace: namespace_88795f45
	Checksum: 0xDF1597E1
	Offset: 0x1EE0
	Size: 0x6C
	Parameters: 7
	Flags: None
*/
function function_99c14949(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(isdefined(self))
	{
		util::playfxontag(bwasdemojump, #"hash_784a8bc7b9b17876", self, "j_spineupper");
	}
}

