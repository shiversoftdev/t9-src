#using script_2764f2b7c40521c8;
#using script_38dc72b5220a1a67;
#using script_251549d469e816bf;
#using script_40e017336a087343;
#using script_7276bc654659288;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using script_140d5347de8af85c;
#using script_65fbfb5ecb1f899e;
#using scripts\core_common\serverfield_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace util;

/*
	Name: function_967a438e
	Namespace: util
	Checksum: 0xFEACAD77
	Offset: 0x190
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_967a438e()
{
	level notify(1992403258);
}

/*
	Name: __init__system__
	Namespace: util
	Checksum: 0x2F9745DA
	Offset: 0x1B0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_3b7610eda5a02b79", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: util
	Checksum: 0x6823E2BD
	Offset: 0x1F8
	Size: 0xCC
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdefined(level.var_54ce800f))
	{
		level.var_54ce800f = [];
	}
	function_3969639b(&cp_hint_text::register, "cp_hint_text");
	pip_menu::register();
	clientfield::register("toplayer", "cinematicmotion_blend", 1, 1, "int", &function_e6d37e3b, 0, 0);
	serverfield::register("cinematicmotion_blend", 1, 1, "int");
}

/*
	Name: function_e6d37e3b
	Namespace: util
	Checksum: 0x37D31EAB
	Offset: 0x2D0
	Size: 0x5C
	Parameters: 7
	Flags: Linked, Private
*/
function private function_e6d37e3b(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self thread function_2e48b28e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
}

/*
	Name: function_2e48b28e
	Namespace: util
	Checksum: 0x57B455C0
	Offset: 0x338
	Size: 0x1F4
	Parameters: 7
	Flags: Linked, Private
*/
function private function_2e48b28e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endoncallback(&function_1402addd, #"death");
	var_a6f59e30 = 2.5;
	self notify("63352a601e3213fb");
	self endon("63352a601e3213fb");
	if(!isdefined(self.var_86c3a9a2))
	{
		self.var_86c3a9a2 = 1;
	}
	target = float(!bwastimejump);
	time_total = ((abs(target - self.var_86c3a9a2)) / var_a6f59e30) * 1000;
	time_start = self getclienttime();
	start = self.var_86c3a9a2;
	while(self.var_86c3a9a2 != target)
	{
		waitframe(1);
		time_now = self getclienttime();
		time_delta = time_now - time_start;
		coef = math::clamp(time_delta / time_total, 0, 1);
		self.var_86c3a9a2 = start + ((target - start) * coef);
		self function_97c2dab8(self.var_86c3a9a2);
	}
	self function_1402addd();
}

/*
	Name: function_1402addd
	Namespace: util
	Checksum: 0xD31AD637
	Offset: 0x538
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_1402addd(data)
{
	if(isdefined(self))
	{
		self serverfield::set("cinematicmotion_blend", !serverfield::get("cinematicmotion_blend"));
	}
}

/*
	Name: function_d1397ecd
	Namespace: util
	Checksum: 0xB36D5351
	Offset: 0x588
	Size: 0x1C
	Parameters: 1
	Flags: None
*/
function function_d1397ecd(str_id)
{
	return level.var_54ce800f[str_id];
}

/*
	Name: function_3969639b
	Namespace: util
	Checksum: 0xF2FCBFFC
	Offset: 0x5B0
	Size: 0x2C
	Parameters: 2
	Flags: Linked
*/
function function_3969639b(func, str_id)
{
	level.var_54ce800f[str_id] = [[func]]();
}

/*
	Name: function_ebbb8995
	Namespace: util
	Checksum: 0x3EDDF4D5
	Offset: 0x5E8
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_ebbb8995(str_id)
{
	level.var_54ce800f[str_id] = luielemtext::register();
}

/*
	Name: function_351488bb
	Namespace: util
	Checksum: 0x3556064D
	Offset: 0x618
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_351488bb(str_id)
{
	level.var_54ce800f[str_id] = luielembar::register();
}

/*
	Name: function_d2554df
	Namespace: util
	Checksum: 0xE6DB0009
	Offset: 0x648
	Size: 0x28
	Parameters: 1
	Flags: None
*/
function function_d2554df(str_id)
{
	level.var_54ce800f[str_id] = luielemimage::register();
}

/*
	Name: set_streamer_hint_function
	Namespace: util
	Checksum: 0xC3A80DA5
	Offset: 0x678
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function set_streamer_hint_function(func, number_of_zones)
{
	level.func_streamer_hint = func;
	clientfield::register("world", "force_streamer", 1, getminbitcountfornum(number_of_zones), "int", &_force_streamer, 0, 0);
}

/*
	Name: _force_streamer
	Namespace: util
	Checksum: 0xCB6DFB06
	Offset: 0x6F8
	Size: 0xA4
	Parameters: 7
	Flags: Linked
*/
function _force_streamer(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojumpid)
{
	if(bwasdemojumpid == 0)
	{
		stopforcingstreamer();
	}
	else
	{
		[[level.func_streamer_hint]](bwasdemojumpid);
		level waittilltimeout(15, #"streamer_100");
		streamernotify(bwasdemojumpid);
	}
}

/*
	Name: function_d126379e
	Namespace: util
	Checksum: 0x84A70DFA
	Offset: 0x7A8
	Size: 0x1BA
	Parameters: 2
	Flags: Linked
*/
function function_d126379e(localclientnum, weaponarray)
{
	/#
		assert(isplayer(self));
	#/
	self notify("1fa5700010347000");
	self endon("1fa5700010347000");
	self endon(#"death");
	if(!isdefined(weaponarray))
	{
		return;
	}
	if(!isdefined(weaponarray))
	{
		weaponarray = [];
	}
	else if(!isarray(weaponarray))
	{
		weaponarray = array(weaponarray);
	}
	while(weaponarray.size > 0)
	{
		foreach(var_493cfe65 in weaponarray)
		{
			if(isweapon(var_493cfe65))
			{
				var_57fe74e5 = self getbuildkitweaponoptions(localclientnum, var_493cfe65);
				var_fd90b0bb = self function_1744e243(localclientnum, var_493cfe65);
				function_d780f794(localclientnum, var_493cfe65, var_57fe74e5, var_fd90b0bb);
			}
		}
		waitframe(1);
	}
}

/*
	Name: init_breath_fx
	Namespace: util
	Checksum: 0xF68D8FB9
	Offset: 0x970
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function init_breath_fx()
{
	level.cold_breath = [];
	level._effect[#"player_cold_breath"] = #"hash_3276d891dff1f743";
	level._effect[#"ai_cold_breath"] = #"hash_326fec91dfebfa91";
	clientfield::register("toplayer", "player_cold_breath", 1, 1, "int", &function_73d83dae, 0, 0);
	clientfield::register("actor", "ai_cold_breath", 1, 1, "counter", &function_f39fc31d, 0, 0);
}

/*
	Name: function_73d83dae
	Namespace: util
	Checksum: 0xF0BCEBA1
	Offset: 0xA68
	Size: 0xB0
	Parameters: 7
	Flags: Linked
*/
function function_73d83dae(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 1)
	{
		if(is_true(level.cold_breath[fieldname]))
		{
			return;
		}
		level.cold_breath[fieldname] = 1;
		self thread function_9340eb56(fieldname);
	}
	else
	{
		level.cold_breath[fieldname] = 0;
	}
}

/*
	Name: function_9340eb56
	Namespace: util
	Checksum: 0xE5478103
	Offset: 0xB20
	Size: 0xB8
	Parameters: 1
	Flags: Linked
*/
function function_9340eb56(localclientnum)
{
	self endon(#"disconnect");
	self endon(#"death");
	while(is_true(level.cold_breath[localclientnum]))
	{
		wait(randomintrange(5, 7));
		playfxoncamera(localclientnum, level._effect[#"player_cold_breath"], (0, 0, 0), (1, 0, 0), (0, 0, 1));
	}
}

/*
	Name: function_f39fc31d
	Namespace: util
	Checksum: 0x767CC5FB
	Offset: 0xBE0
	Size: 0xC0
	Parameters: 7
	Flags: Linked
*/
function function_f39fc31d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	while(isalive(self))
	{
		wait(randomintrange(6, 8));
		playfxontag(bwastimejump, level._effect[#"ai_cold_breath"], self, "j_head");
	}
}

/*
	Name: player_keyline_render
	Namespace: util
	Checksum: 0x3C7A6EF1
	Offset: 0xCA8
	Size: 0x188
	Parameters: 1
	Flags: None
*/
function player_keyline_render(localclientnum)
{
	/#
		if(!isdefined(level.var_8530f39a))
		{
			level.var_8530f39a = [];
		}
		if(!isdefined(level.var_8530f39a))
		{
			level.var_8530f39a = [];
		}
		else if(!isarray(level.var_8530f39a))
		{
			level.var_8530f39a = array(level.var_8530f39a);
		}
		level.var_8530f39a[level.var_8530f39a.size] = self;
	#/
	if(self function_21c0fa55())
	{
		self init_duplicaterender_settings();
		self thread force_update_player_clientfields(localclientnum);
	}
	if(isplayer(self) && self function_21c0fa55())
	{
		if(!isdefined(self getlocalclientnumber()) || localclientnum == self getlocalclientnumber())
		{
			return;
		}
	}
	if(!self function_ca024039())
	{
		return;
	}
	wait(1);
}

/*
	Name: force_update_player_clientfields
	Namespace: util
	Checksum: 0x6CC73746
	Offset: 0xE38
	Size: 0x64
	Parameters: 1
	Flags: Linked
*/
function force_update_player_clientfields(localclientnum)
{
	self endon(#"death");
	while(!clienthassnapshot(localclientnum))
	{
		wait(0.25);
	}
	wait(0.25);
	self processclientfieldsasifnew();
}

/*
	Name: init_duplicaterender_settings
	Namespace: util
	Checksum: 0x80F724D1
	Offset: 0xEA8
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function init_duplicaterender_settings()
{
}

/*
	Name: function_8e4d84eb
	Namespace: util
	Checksum: 0x173B6F20
	Offset: 0xEB8
	Size: 0x86E
	Parameters: 2
	Flags: None
*/
function function_8e4d84eb(localclientnum, bundlename)
{
	player = self;
	player endon(#"death", #"disconnected", #"deactivate_camera_lens_overrides");
	/#
		function_5ac4dc99("", 0);
	#/
	var_2c46fc48 = getscriptbundle(bundlename);
	var_73024e3b = 0;
	var_8c180cda = 0;
	var_cbcfc238 = var_2c46fc48.var_8833ab8f;
	player function_49cdf043(var_cbcfc238, 0);
	if(var_cbcfc238 > var_2c46fc48.var_11f00a95)
	{
		var_73024e3b = (var_cbcfc238 - var_2c46fc48.var_11f00a95) / (var_2c46fc48.var_8dd70933 - var_2c46fc48.var_11f00a95);
		if(var_73024e3b < 0)
		{
			var_73024e3b = 0;
		}
		else if(var_73024e3b > 1)
		{
			var_73024e3b = 1;
		}
	}
	var_4f64fb6b = var_2c46fc48.var_691507ba;
	var_c5e00469 = (var_4f64fb6b * -1, var_4f64fb6b * -1, var_4f64fb6b * -1);
	var_43ac2595 = (var_4f64fb6b, var_4f64fb6b, var_4f64fb6b);
	var_e17c45e2 = 1;
	player function_d7be9a9f(var_e17c45e2, 0);
	player function_1816c600(0.1, 0);
	player function_9e574055(1);
	waitframe(1);
	var_6588e6fc = 5;
	player easing::function_136edb11(undefined, 3.5, var_6588e6fc, #"hash_2de1684e2167ada4", 1, 0);
	var_58cb5a30 = 0;
	var_c846ce25 = 0;
	while(true)
	{
		var_a23c6f11 = player function_ca4b4e19(localclientnum, 0)[#"move"][1];
		var_8c180cda = lerpfloat(var_8c180cda, function_b5338ccb(var_a23c6f11, var_2c46fc48.var_b4e0311b), 0.25);
		var_e8be0c0e = abs(var_a23c6f11) != 0 && (var_8c180cda < 0 && var_cbcfc238 > var_2c46fc48.var_11f00a95 || (var_8c180cda > 0 && var_cbcfc238 < var_2c46fc48.var_8dd70933));
		if(var_e8be0c0e)
		{
			var_73024e3b = var_73024e3b + (var_8c180cda * var_2c46fc48.var_95d1f1bd) * (float(self function_8e4cd43b()) / 1000);
			if(var_73024e3b < 0)
			{
				var_73024e3b = 0;
			}
			else if(var_73024e3b > 1)
			{
				var_73024e3b = 1;
			}
			var_cbcfc238 = easing::function_237ad8ca(var_2c46fc48.var_11f00a95, var_2c46fc48.var_8dd70933, var_73024e3b, 1, 1);
			player function_49cdf043(var_cbcfc238, 0);
			var_2c46fc48.var_e78c4b55 = var_cbcfc238;
			if(!var_c846ce25 && abs(var_a23c6f11) > 0)
			{
				var_c846ce25 = 1;
				if(isdefined(var_2c46fc48.var_2afe6ba0))
				{
					player playsound(localclientnum, var_2c46fc48.var_2afe6ba0);
				}
				if(!isdefined(player.var_8bbff4f8) && isdefined(var_2c46fc48.var_9cbc1120))
				{
					player.var_8bbff4f8 = player playloopsound(var_2c46fc48.var_9cbc1120);
				}
			}
		}
		else if(var_c846ce25)
		{
			var_c846ce25 = 0;
			if(isdefined(var_2c46fc48.var_c0a8a9c6))
			{
				self playsound(localclientnum, var_2c46fc48.var_c0a8a9c6);
			}
			if(isdefined(self.var_8bbff4f8))
			{
				self stoploopsound(self.var_8bbff4f8);
				self.var_8bbff4f8 = undefined;
			}
		}
		eye = player geteye();
		fwd = anglestoforward(player getcamangles());
		trace = physicstrace(eye, eye + (fwd * var_2c46fc48.var_e99a5258), var_c5e00469, var_43ac2595, player, 1);
		var_de79cd4c = distance(eye, trace[#"position"] + (fwd * var_43ac2595[0]));
		if(var_58cb5a30 < player getclienttime() && (abs(var_de79cd4c - var_e17c45e2)) < var_2c46fc48.var_b5adab9c)
		{
			var_e17c45e2 = lerpfloat(var_e17c45e2, var_de79cd4c, 0.5);
			player function_d7be9a9f(var_e17c45e2, 0);
		}
		else if(var_58cb5a30 < player getclienttime() || (abs(var_de79cd4c - var_e17c45e2)) >= var_2c46fc48.var_b5adab9c)
		{
			var_36df6119 = (isdefined(var_6588e6fc) ? var_6588e6fc : var_2c46fc48.var_b0ea9e6d);
			var_58cb5a30 = player getclienttime() + (int(var_36df6119 * 1000));
			var_e17c45e2 = var_de79cd4c;
			player easing::function_b6f1c993(undefined, var_e17c45e2, var_36df6119, #"back", 0, 1);
			var_6588e6fc = undefined;
		}
		/#
			if(getdvarint(#"hash_2e5a9052a4b09249", 0))
			{
				var_31a761bf = absangleclamp360(player getcamangles()[1]);
				box(trace[#"position"] + (fwd * var_43ac2595[0]), var_c5e00469, var_43ac2595, var_31a761bf, (1, 0, 0), 1, 0, 1);
			}
		#/
		waitframe(1);
	}
}

/*
	Name: function_e706c315
	Namespace: util
	Checksum: 0x3B9A71CB
	Offset: 0x1730
	Size: 0x66
	Parameters: 0
	Flags: None
*/
function function_e706c315()
{
	player = self;
	player function_c2856ebd(0);
	if(isdefined(player.var_8bbff4f8))
	{
		player stoploopsound(self.var_8bbff4f8);
		player.var_8bbff4f8 = undefined;
	}
}

/*
	Name: function_5a407dc8
	Namespace: util
	Checksum: 0xA34EBC65
	Offset: 0x17A0
	Size: 0x3A
	Parameters: 1
	Flags: Linked
*/
function function_5a407dc8(localclientnum)
{
	return true;
}

