#using script_59f62971655f7103;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\cp_common\util.csc;

#namespace blood;

/*
	Name: function_89f2df9
	Namespace: blood
	Checksum: 0x5D3D1E5A
	Offset: 0x470
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"blood", &preload, &postload, undefined, undefined);
}

/*
	Name: preload
	Namespace: blood
	Checksum: 0xF014555A
	Offset: 0x4C8
	Size: 0xEC
	Parameters: 0
	Flags: None
*/
function preload()
{
	clientfield::register("toplayer", "player_death_shield", 1, 1, "int", &function_2b83fc6e, 0, 0);
	clientfield::register("toplayer", "player_death_gesture", 1, 1, "int", &function_11057a7d, 0, 0);
	clientfield::register("world", "" + #"hash_7dc38a630ed68eb3", 1, 1, "int", &function_100ac98f, 0, 0);
}

/*
	Name: postload
	Namespace: blood
	Checksum: 0xB5FCEDB
	Offset: 0x5C0
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function postload()
{
	function_dd830dee();
	callback::on_localplayer_spawned(&function_e79ccfd8);
	callback::on_localclient_connect(&localclient_connect);
	level.var_f771ff42 = util::is_mature();
}

/*
	Name: getsplatter
	Namespace: blood
	Checksum: 0x7BB3175
	Offset: 0x638
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function getsplatter(localclientnum)
{
	return level.blood.var_de10c136.var_51036e02[localclientnum];
}

/*
	Name: localclient_connect
	Namespace: blood
	Checksum: 0xB86D0634
	Offset: 0x670
	Size: 0x24
	Parameters: 1
	Flags: Private
*/
function private localclient_connect(localclientnum)
{
	level thread player_splatter(localclientnum);
}

/*
	Name: function_e79ccfd8
	Namespace: blood
	Checksum: 0x70009BF8
	Offset: 0x6A0
	Size: 0x2AC
	Parameters: 1
	Flags: Private
*/
function private function_e79ccfd8(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(function_148ccc79(localclientnum, #"hash_4a1db95d40ab50d"))
	{
		codestoppostfxbundlelocal(localclientnum, #"hash_4a1db95d40ab50d");
	}
	if(function_148ccc79(localclientnum, #"hash_1502559766b0e08f"))
	{
		codestoppostfxbundlelocal(localclientnum, #"hash_1502559766b0e08f");
	}
	self.var_957f4b6b = #"hash_44dcb6ac5e8787e0";
	self.var_36732900 = "rob_wound_blood_splatter";
	self.var_a3b3e5cc = 0;
	self.var_82dad7be = self battlechatter::get_player_dialog_alias("exertBreatheHurt");
	function_162fe6ec(localclientnum);
	self.var_9861062 = 0;
	if(level.blood.rob.stage == 0)
	{
		self.var_28fdff3c = 1;
		self.var_dff3bb2c = 1;
	}
	else
	{
		self.var_28fdff3c = 0;
		self.var_dff3bb2c = 0;
	}
	self.stage2amount = 0;
	self.stage3amount = 0;
	self.lastbloodupdate = 0;
	if(isdefined(level.blood.var_9af02310))
	{
		function_d48752e(localclientnum, level.blood.var_9af02310);
		level.blood.var_9af02310 = undefined;
	}
	level thread wait_game_ended(localclientnum);
	if(self function_d2cb869e("rob_wound_blood_splatter"))
	{
		self function_5d482e78("rob_wound_blood_splatter");
	}
	if(self function_d2cb869e("rob_wound_blood_splatter_reaper"))
	{
		self function_5d482e78("rob_wound_blood_splatter_reaper");
	}
	self thread function_87544c4a(localclientnum);
	self thread function_493a8fbc(localclientnum);
}

/*
	Name: setcontrollerlightbarcolorpulsing
	Namespace: blood
	Checksum: 0xE3D87CD4
	Offset: 0x958
	Size: 0xB4
	Parameters: 3
	Flags: Private
*/
function private setcontrollerlightbarcolorpulsing(localclientnum, color, pulserate)
{
	curcolor = color * 0.2;
	scale = (gettime() % pulserate) / (pulserate * 0.5);
	if(scale > 1)
	{
		scale = (scale - 2) * -1;
	}
	curcolor = curcolor + ((color * 0.8) * scale);
	setcontrollerlightbarcolor(localclientnum, curcolor);
}

/*
	Name: enter_critical_health
	Namespace: blood
	Checksum: 0x198CB309
	Offset: 0xA18
	Size: 0x3C
	Parameters: 1
	Flags: Private
*/
function private enter_critical_health(localclientnum)
{
	self thread play_critical_health_rumble(localclientnum);
	self thread play_breath(localclientnum);
}

/*
	Name: play_critical_health_rumble
	Namespace: blood
	Checksum: 0x39F934CC
	Offset: 0xA60
	Size: 0x168
	Parameters: 1
	Flags: Private
*/
function private play_critical_health_rumble(localclientnum)
{
	self endon(#"death", #"hash_6bf3273fdaffc859", #"disconnect", #"critical_health_end", #"spawned");
	var_cf155b98 = "new_health_stage_critical_cp";
	while(true)
	{
		self waittill(#"hash_7b55313d89ce26ed");
		self playrumbleonentity(localclientnum, var_cf155b98);
		name = self getmpdialogname();
		if(!isdefined(name))
		{
			name = #"human";
		}
		if(name == #"reaper")
		{
			sound = #"hash_14e9bc45552b1ab9";
		}
		else
		{
			sound = #"hash_318f22e4d70ee6d3";
		}
		if(!is_true(self.var_e9dd2ca0))
		{
			self playsound(localclientnum, sound);
		}
	}
}

/*
	Name: play_breath
	Namespace: blood
	Checksum: 0x2FF07260
	Offset: 0xBD0
	Size: 0x11E
	Parameters: 1
	Flags: Private
*/
function private play_breath(localclientnum)
{
	self endon(#"death", #"hash_6bf3273fdaffc859", #"disconnect", #"game_ended", #"critical_health_end");
	self.var_82dad7be = (isdefined(self.var_82dad7be) ? self.var_82dad7be : self battlechatter::get_player_dialog_alias("exertBreatheHurt"));
	while(true)
	{
		if(isdefined(self.var_82dad7be))
		{
			var_a1b836dd = self playsound(localclientnum, self.var_82dad7be);
		}
		if(!isdefined(var_a1b836dd))
		{
			return;
		}
		while(isdefined(var_a1b836dd) && soundplaying(var_a1b836dd))
		{
			wait(0.1);
		}
		wait(2);
	}
}

/*
	Name: wait_game_ended
	Namespace: blood
	Checksum: 0x36FBC2E1
	Offset: 0xCF8
	Size: 0xB8
	Parameters: 1
	Flags: Private
*/
function private wait_game_ended(localclientnum)
{
	if(!isdefined(level.watching_blood_game_ended))
	{
		level.watching_blood_game_ended = [];
	}
	if(level.watching_blood_game_ended[localclientnum] === 1)
	{
		return;
	}
	level.watching_blood_game_ended[localclientnum] = 1;
	level waittill(#"game_ended");
	localplayer = function_5c10bd79(localclientnum);
	if(isdefined(localplayer))
	{
		localplayer notify(#"critical_health_end");
	}
	level.watching_blood_game_ended[localclientnum] = 0;
}

/*
	Name: function_f192f00b
	Namespace: blood
	Checksum: 0x2C666C75
	Offset: 0xDB8
	Size: 0x20C
	Parameters: 2
	Flags: Private
*/
function private function_f192f00b(localclientnum, rob)
{
	self notify("4d57e1325d19c200");
	self endon("4d57e1325d19c200");
	self endon(#"death", #"hash_6bf3273fdaffc859");
	if(function_148ccc79(localclientnum, rob))
	{
		self function_78233d29(rob, "", "U Offset", randomfloatrange(0, 1));
		self function_78233d29(rob, "", "V Offset", randomfloatrange(0, 1));
		self function_78233d29(rob, "", "Threshold", 1);
	}
	wait(float(level.blood.rob.hold_time) / 1000);
	if(function_148ccc79(localclientnum, rob))
	{
		self thread ramprobsetting(localclientnum, 1, 0, level.blood.rob.fade_time, "Threshold");
	}
	wait(float(level.blood.rob.fade_time) / 1000);
	if(function_148ccc79(localclientnum, rob))
	{
		self function_5d482e78(rob);
	}
}

/*
	Name: ramprobsetting
	Namespace: blood
	Checksum: 0x2180115
	Offset: 0xFD0
	Size: 0xA4
	Parameters: 5
	Flags: None
*/
function ramprobsetting(localclientnum, from, to, ramptime, key)
{
	self endon(#"death", #"hash_6bf3273fdaffc859");
	self notify("rampROBsetting" + key);
	self endon("rampROBsetting" + key);
	util::lerp_generic(localclientnum, ramptime, &function_1126eb8c, from, to, key, self.var_36732900);
}

/*
	Name: function_1126eb8c
	Namespace: blood
	Checksum: 0x3F3515D1
	Offset: 0x1080
	Size: 0xC4
	Parameters: 8
	Flags: None
*/
function function_1126eb8c(currenttime, elapsedtime, localclientnum, duration, var_2347e08e, var_991d3376, key, rob)
{
	percent = localclientnum / duration;
	amount = (var_991d3376 * percent) + (var_2347e08e * (1 - percent));
	if(isdefined(self) && self function_d2cb869e(rob))
	{
		self function_78233d29(rob, "", key, amount);
	}
}

/*
	Name: function_672c739
	Namespace: blood
	Checksum: 0xA34C6385
	Offset: 0x1150
	Size: 0x27C
	Parameters: 2
	Flags: None
*/
function function_672c739(localclientnum, shockrifle)
{
	if(is_true(shockrifle))
	{
		function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Enable Tint", 0.9);
		function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color R", 4);
		function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color G", 4);
		function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color B", 4);
	}
	else
	{
		if(util::function_2c435484())
		{
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Enable Tint", 1);
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color R", 0.15);
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color G", 0.13);
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color B", 0.24);
		}
		else
		{
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Enable Tint", 1);
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color R", 0.3);
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color G", 0.025);
			function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Tint Color B", 0);
		}
	}
}

/*
	Name: function_27d3ba05
	Namespace: blood
	Checksum: 0xEE79144F
	Offset: 0x13D8
	Size: 0x68
	Parameters: 1
	Flags: Private
*/
function private function_27d3ba05(localclientnum)
{
	if(function_92beaa28(localclientnum) && !function_d17ae3cc(localclientnum))
	{
		return false;
	}
	if(level.var_4ecf5754 === #"hash_65cfe78dc61dd3af")
	{
		return false;
	}
	return true;
}

/*
	Name: function_47d0632f
	Namespace: blood
	Checksum: 0x2FCA703F
	Offset: 0x1448
	Size: 0xBC
	Parameters: 5
	Flags: Private
*/
function private function_47d0632f(localclientnum, damage, death, dot, shockrifle)
{
	splatter = getsplatter(localclientnum);
	splatter.shockrifle = shockrifle;
	splatter.var_120a7b2c++;
	var_cd141ca2 = splatter.var_120a7b2c % 4;
	if(function_27d3ba05(localclientnum))
	{
		level thread splatter_postfx(localclientnum, self, damage, var_cd141ca2, death, dot);
	}
}

/*
	Name: update_damage_effects
	Namespace: blood
	Checksum: 0xAB725209
	Offset: 0x1510
	Size: 0x17C
	Parameters: 3
	Flags: Private
*/
function private update_damage_effects(localclientnum, damage, death)
{
	if(is_true(self.dot_no_splatter) && damage < 10 && damage > 0)
	{
		self.dot_no_splatter = 0;
	}
	else
	{
		if(self.var_430c4b70 === 1 && damage > 0)
		{
			function_47d0632f(localclientnum, damage, death, 1, 0);
			self.var_430c4b70 = 0;
		}
		else if(damage > 0)
		{
			function_47d0632f(localclientnum, damage, death, 0, 0);
		}
	}
	if(damage > level.blood.rob.damage_threshold)
	{
		if(!self function_d2503806(self.var_36732900))
		{
			self function_bf9d3071(self.var_36732900);
		}
		if(self function_d2503806(self.var_36732900))
		{
			self thread function_f192f00b(localclientnum, self.var_36732900);
		}
	}
}

/*
	Name: player_splatter
	Namespace: blood
	Checksum: 0x14966CBC
	Offset: 0x1698
	Size: 0x452
	Parameters: 1
	Flags: Private
*/
function private player_splatter(localclientnum)
{
	level notify("player_splatter" + localclientnum);
	level endon("player_splatter" + localclientnum);
	while(true)
	{
		level waittill(#"hash_518e8873ad943492");
		while(true)
		{
			splatter = getsplatter(localclientnum);
			blur = 0;
			opacity = 0;
			for(i = 0; i < 4; i++)
			{
				if(isdefined(splatter.splatters[i][#"hash_2151e5b1dafa374"]) && splatter.splatters[i][#"hash_2151e5b1dafa374"] > blur)
				{
					blur = splatter.splatters[i][#"hash_2151e5b1dafa374"];
				}
				if(isdefined(splatter.splatters[i][#"opacity"]) && splatter.splatters[i][#"opacity"] > opacity)
				{
					opacity = splatter.splatters[i][#"opacity"];
				}
			}
			if(blur > 0 || opacity > 0)
			{
				splatter.var_9e4cc220 = 1;
				local_player = function_5c10bd79(localclientnum);
				if(!local_player function_d2cb869e(#"hash_4a1db95d40ab50d"))
				{
					function_a837926b(localclientnum, #"hash_4a1db95d40ab50d");
					function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Inner Mask", 0.1);
					function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Outer Mask", 0.8);
				}
				if(!local_player function_d2cb869e(#"hash_1502559766b0e08f"))
				{
					function_a837926b(localclientnum, #"hash_1502559766b0e08f");
				}
				if(local_player function_d2cb869e(#"hash_4a1db95d40ab50d"))
				{
					function_4238734d(localclientnum, #"hash_4a1db95d40ab50d", "Blur", blur);
				}
				if(local_player function_d2cb869e(#"hash_1502559766b0e08f"))
				{
					function_4238734d(localclientnum, #"hash_1502559766b0e08f", "Opacity", opacity);
				}
			}
			else
			{
				if(is_true(splatter.var_9e4cc220))
				{
					splatter.var_9e4cc220 = 0;
					local_player = function_5c10bd79(localclientnum);
					if(function_148ccc79(localclientnum, #"hash_4a1db95d40ab50d"))
					{
						codestoppostfxbundlelocal(localclientnum, #"hash_4a1db95d40ab50d");
					}
					if(function_148ccc79(localclientnum, #"hash_1502559766b0e08f") && is_false(local_player.var_a3b3e5cc))
					{
						function_24cd4cfb(localclientnum, #"hash_1502559766b0e08f");
					}
				}
				else
				{
					break;
				}
			}
			waitframe(1);
		}
	}
}

/*
	Name: function_b51756a0
	Namespace: blood
	Checksum: 0xE0D03A7B
	Offset: 0x1AF8
	Size: 0xAA
	Parameters: 3
	Flags: Private
*/
function private function_b51756a0(localclientnum, splatter, damage)
{
	if(damage > level.blood.var_de10c136.dot.var_6264f8dd)
	{
		return true;
	}
	if(!isdefined(splatter.var_90495387))
	{
		return true;
	}
	if(getservertime(localclientnum) - splatter.var_90495387 < level.blood.var_de10c136.dot.var_372dff4b)
	{
		return false;
	}
	return true;
}

/*
	Name: splatter_postfx
	Namespace: blood
	Checksum: 0x7214125C
	Offset: 0x1BB0
	Size: 0x43C
	Parameters: 6
	Flags: Private
*/
function private splatter_postfx(localclientnum, player, damage, var_cd141ca2, death, dot)
{
	level notify((localclientnum + "splatter_postfx") + var_cd141ca2);
	level endon((localclientnum + "splatter_postfx") + var_cd141ca2);
	blur = 0;
	opacity = 0;
	var_587ce5b0 = 0;
	var_49774f1 = 0;
	hold_time = 0;
	splatter = getsplatter(localclientnum);
	if(dot && !death)
	{
		splatter.var_90495387 = getservertime(localclientnum);
		blur = level.blood.var_de10c136.dot.blur;
		opacity = level.blood.var_de10c136.dot.opacity;
		var_587ce5b0 = level.blood.var_de10c136.dot.var_587ce5b0;
		hold_time = level.blood.var_de10c136.dot.hold_time;
	}
	else if(function_b51756a0(localclientnum, splatter, damage))
	{
		for(i = level.blood.var_de10c136.var_58f1f80e - 1; i >= 0; i--)
		{
			if(damage > level.blood.var_de10c136.range[i].start || ((level.blood.scriptbundle.var_3e1e9389 - 1) == i && death))
			{
				blur = level.blood.var_de10c136.range[i].blur;
				opacity = level.blood.var_de10c136.range[i].opacity;
				var_587ce5b0 = level.blood.var_de10c136.var_587ce5b0[i];
				var_49774f1 = level.blood.var_de10c136.var_49774f1[i];
				hold_time = level.blood.var_de10c136.hold_time[i];
				break;
			}
		}
	}
	if(isdefined(level.var_7db2b064) && [[level.var_7db2b064]](localclientnum, player, damage))
	{
		blur = 0;
		opacity = 0;
		var_587ce5b0 = 0;
		var_49774f1 = 0;
		hold_time = 0;
	}
	level thread rampvalue(localclientnum, 0, opacity, var_587ce5b0, var_cd141ca2, "Opacity");
	level thread rampvalue(localclientnum, 0, blur, var_587ce5b0, var_cd141ca2, "Blur Amount");
	wait(float(var_587ce5b0) / 1000);
	wait(float(hold_time) / 1000);
	level thread rampvalue(localclientnum, opacity, 0, var_49774f1, var_cd141ca2, "Opacity");
	level thread rampvalue(localclientnum, blur, 0, var_49774f1, var_cd141ca2, "Blur Amount");
}

/*
	Name: rampvalue
	Namespace: blood
	Checksum: 0x29058331
	Offset: 0x1FF8
	Size: 0x9C
	Parameters: 6
	Flags: None
*/
function rampvalue(localclientnum, var_2347e08e, var_991d3376, ramptime, var_cd141ca2, key)
{
	level notify(((localclientnum + "rampValue") + var_cd141ca2) + key);
	level endon(((localclientnum + "rampValue") + var_cd141ca2) + key);
	util::lerp_generic(localclientnum, ramptime, &function_441ef0ca, var_2347e08e, var_991d3376, var_cd141ca2, key);
}

/*
	Name: function_441ef0ca
	Namespace: blood
	Checksum: 0x592429E8
	Offset: 0x20A0
	Size: 0x138
	Parameters: 8
	Flags: None
*/
function function_441ef0ca(currenttime, elapsedtime, localclientnum, duration, var_2347e08e, var_991d3376, var_cd141ca2, key)
{
	percent = 1;
	if(duration > 0)
	{
		percent = elapsedtime / duration;
	}
	amount = (var_991d3376 * percent) + (var_2347e08e * (1 - percent));
	splatter = getsplatter(localclientnum);
	if(!isdefined(splatter.splatters[var_cd141ca2][key]))
	{
		splatter.splatters[var_cd141ca2][key] = 0;
	}
	send_notify = amount > 0 && splatter.splatters[var_cd141ca2][key] == 0;
	splatter.splatters[var_cd141ca2][key] = amount;
	if(send_notify)
	{
		level notify(#"hash_518e8873ad943492");
	}
}

/*
	Name: player_base_health
	Namespace: blood
	Checksum: 0x61E16078
	Offset: 0x21E0
	Size: 0x8A
	Parameters: 0
	Flags: Private
*/
function private player_base_health()
{
	if(!self function_700ca4f5())
	{
		return 150;
	}
	basehealth = self function_3b0f0852();
	basehealth = basehealth + (isdefined(level.var_90bb9821) ? level.var_90bb9821 : 0);
	if(isdefined(self.var_ee9b8af0))
	{
		basehealth = self.var_ee9b8af0;
	}
	return basehealth;
}

/*
	Name: function_55d01d42
	Namespace: blood
	Checksum: 0x7430C639
	Offset: 0x2278
	Size: 0x13A
	Parameters: 0
	Flags: Private
*/
function private function_55d01d42()
{
	/#
		assert(self function_700ca4f5());
	#/
	character_index = self getcharacterbodytype();
	fields = getcharacterfields(character_index, currentsessionmode());
	if(isdefined(fields) && (isdefined(fields.digitalblood) ? fields.digitalblood : 0))
	{
		self.var_957f4b6b = #"hash_21152915158b09dd";
		self.var_36732900 = "rob_wound_blood_splatter_reaper";
	}
	else
	{
		if(util::is_mature())
		{
			self.var_957f4b6b = #"hash_2fe01f2d9cd2c4c";
			self.var_36732900 = "rob_wound_blood_splatter";
		}
		else
		{
			self.var_957f4b6b = #"hash_44dcb6ac5e8787e0";
			self.var_36732900 = "rob_wound_blood_splatter";
		}
	}
}

/*
	Name: function_87544c4a
	Namespace: blood
	Checksum: 0xF8FF7557
	Offset: 0x23C0
	Size: 0x39E
	Parameters: 1
	Flags: Private
*/
function private function_87544c4a(localclientnum)
{
	self endon(#"disconnect", #"death", #"hash_6bf3273fdaffc859");
	self util::function_6d0694af();
	basehealth = player_base_health();
	priorplayerhealth = renderhealthoverlayhealth(localclientnum, (isdefined(self.prop) ? 0 : basehealth));
	var_a234f6c2 = basehealth * priorplayerhealth;
	var_4cdccc55 = util::is_mature();
	self function_55d01d42();
	self thread function_8d8880(localclientnum);
	while(true)
	{
		forceupdate = 0;
		if(util::is_mature() != var_4cdccc55)
		{
			forceupdate = 1;
			self function_436ee4c2(localclientnum, #"hash_2fe01f2d9cd2c4c");
			self function_436ee4c2(localclientnum, #"hash_44dcb6ac5e8787e0");
			var_4cdccc55 = util::is_mature();
			self function_55d01d42();
		}
		render = renderhealthoverlay(localclientnum);
		if(render)
		{
			basehealth = player_base_health();
			playerhealth = renderhealthoverlayhealth(localclientnum, (isdefined(self.prop) ? 0 : basehealth));
			var_406028bf = basehealth * playerhealth;
			damageamount = var_a234f6c2 - var_406028bf;
			update_damage_effects(localclientnum, damageamount, playerhealth == 0);
			shouldenabledoverlay = 0;
			if(playerhealth < 1 || is_true(level.var_99aec053))
			{
				shouldenabledoverlay = 1;
			}
			else if(is_true(self.blood_enabled))
			{
				self function_436ee4c2(localclientnum, self.var_957f4b6b);
			}
			priorplayerhealth = playerhealth;
			var_a234f6c2 = var_406028bf;
			if(!is_true(self.blood_enabled) && shouldenabledoverlay)
			{
				self function_70299400(localclientnum);
			}
			self function_9a8dc0ec(localclientnum, var_406028bf, forceupdate);
		}
		else if(is_true(self.blood_enabled))
		{
			self function_436ee4c2(localclientnum, self.var_957f4b6b);
		}
		waitframe(1);
	}
}

/*
	Name: function_8d8880
	Namespace: blood
	Checksum: 0x413BD5A2
	Offset: 0x2768
	Size: 0x23A
	Parameters: 1
	Flags: Private
*/
function private function_8d8880(localclientnum)
{
	self endon(#"disconnect", #"death", #"hash_6bf3273fdaffc859");
	if(!level.blood.var_f5479429)
	{
		return;
	}
	while(true)
	{
		waitframe(1);
		if(is_true(self.blood_enabled))
		{
			for(pulse = 0; pulse < 2; pulse++)
			{
				self notify(#"hash_7b55313d89ce26ed");
				self thread function_c0cdd1f2(localclientnum, 0, 1, level.blood.var_f2de135e.var_562c41de[pulse], #"hash_152dbb4add22b951", self.var_957f4b6b);
				wait(float(level.blood.var_f2de135e.var_562c41de[pulse]) / 1000);
				wait(float(level.blood.var_f2de135e.var_18f673f1[pulse]) / 1000);
				self thread function_c0cdd1f2(localclientnum, 1, 0, level.blood.var_f2de135e.var_92fc0d45[pulse], #"hash_152dbb4add22b951", self.var_957f4b6b);
				wait(float(level.blood.var_f2de135e.var_92fc0d45[pulse]) / 1000);
				wait(float(level.blood.var_f2de135e.var_5b5500f7[pulse]) / 1000);
			}
		}
	}
}

/*
	Name: function_493a8fbc
	Namespace: blood
	Checksum: 0x78B1AE10
	Offset: 0x29B0
	Size: 0x9C
	Parameters: 1
	Flags: Private
*/
function private function_493a8fbc(localclientnum)
{
	self endon(#"entitydeleted");
	self waittill(#"death", #"hash_6bf3273fdaffc859");
	self function_436ee4c2(localclientnum, self.var_957f4b6b);
	waittillframeend();
	self callback::on_shutdown(&function_2a16507);
	self function_163791a7(localclientnum);
}

/*
	Name: function_163791a7
	Namespace: blood
	Checksum: 0xCBF04D0C
	Offset: 0x2A58
	Size: 0x27C
	Parameters: 1
	Flags: Private
*/
function private function_163791a7(localclientnum)
{
	self endon(#"dead", #"entitydeleted");
	self.var_a3b3e5cc = 1;
	var_3d2a4b86 = 4;
	self codeplaypostfxbundle(self.var_957f4b6b);
	self codeplaypostfxbundle(#"hash_1502559766b0e08f");
	self codeplaypostfxbundle(#"hash_5b630a217af16732");
	self function_116b95e5(#"hash_1502559766b0e08f", "Opacity", 1);
	self thread function_c0cdd1f2(localclientnum, 0, 1, 2000, "Blur Amount", #"hash_5b630a217af16732");
	self function_116b95e5(self.var_957f4b6b, "Desaturation", 0);
	self function_116b95e5(self.var_957f4b6b, "Damage Pulse", 1);
	self function_116b95e5(self.var_957f4b6b, "Fade", level.blood.fade[var_3d2a4b86]);
	self function_116b95e5(self.var_957f4b6b, "Opacity", level.blood.opacity[var_3d2a4b86]);
	self function_116b95e5(self.var_957f4b6b, "Vignette Darkening Amount", level.blood.var_4c8629ad[var_3d2a4b86]);
	self function_116b95e5(self.var_957f4b6b, "Vignette Darkening Factor", level.blood.var_ea220db3[var_3d2a4b86]);
	self function_116b95e5(self.var_957f4b6b, "Blur", level.blood.blur[var_3d2a4b86]);
}

/*
	Name: function_2a16507
	Namespace: blood
	Checksum: 0x93E90553
	Offset: 0x2CE0
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_2a16507(localclientnum)
{
	self endon(#"entitydeleted");
	self notify(#"dead");
	self function_436ee4c2(localclientnum, self.var_957f4b6b);
}

/*
	Name: function_1cf17bbc
	Namespace: blood
	Checksum: 0xD1B1534E
	Offset: 0x2D40
	Size: 0x6E
	Parameters: 3
	Flags: Private
*/
function private function_1cf17bbc(localclientnum, new_blood_stage, prior_blood_stage)
{
	if(prior_blood_stage >= level.blood.rob.stage)
	{
		self.var_28fdff3c = 1;
	}
	else
	{
		self.var_28fdff3c = 0;
	}
	self.var_dff3bb2c = self.var_28fdff3c;
}

/*
	Name: function_62b7e00d
	Namespace: blood
	Checksum: 0x1FE12062
	Offset: 0x2DB8
	Size: 0xFE
	Parameters: 1
	Flags: Private
*/
function private function_62b7e00d(localclientnum)
{
	if(isdefined(level.blood.var_9af02310))
	{
		return;
	}
	level.blood.var_9af02310 = function_604c9983(localclientnum, level.blood.var_d8dc9013);
	waitresult = undefined;
	waitresult = self waittill(#"death", #"hash_6bf3273fdaffc859", #"disconnect", #"critical_health_end");
	if(isdefined(level.blood.var_9af02310))
	{
		function_d48752e(localclientnum, level.blood.var_9af02310);
		level.blood.var_9af02310 = undefined;
	}
}

/*
	Name: function_e91b92e2
	Namespace: blood
	Checksum: 0x381707CD
	Offset: 0x2EC0
	Size: 0x1B6
	Parameters: 4
	Flags: Private
*/
function private function_e91b92e2(localclientnum, new_blood_stage, prior_blood_stage, playerhealth)
{
	if(prior_blood_stage == 4)
	{
		self.var_9861062 = 1;
		self enter_critical_health(new_blood_stage);
		if(is_true(self.blood_enabled))
		{
			self function_116b95e5(self.var_957f4b6b, #"hash_152dbb4add22b951", 1);
		}
		if(playerhealth > 0)
		{
			playsound(new_blood_stage, level.blood.var_8691ed16, (0, 0, 0));
			self thread function_62b7e00d(new_blood_stage);
		}
	}
	else if(self.var_9861062)
	{
		if(isdefined(level.blood.var_9af02310))
		{
			if(playerhealth > 0)
			{
				playsound(new_blood_stage, level.blood.var_dad052de, (0, 0, 0));
			}
		}
		self.var_9861062 = 0;
		if(is_true(self.blood_enabled))
		{
			self function_116b95e5(self.var_957f4b6b, #"hash_152dbb4add22b951", 0);
		}
	}
	if(prior_blood_stage < 4)
	{
		self notify(#"critical_health_end");
	}
}

/*
	Name: function_56419db8
	Namespace: blood
	Checksum: 0x4CD73F45
	Offset: 0x3080
	Size: 0xCC
	Parameters: 1
	Flags: Private
*/
function private function_56419db8(stage)
{
	var_f2de135e = level.blood.var_f2de135e;
	for(pulse = 0; pulse < 2; pulse++)
	{
		var_f2de135e.var_562c41de[pulse] = var_f2de135e.var_621835b4[pulse][stage];
		var_f2de135e.var_18f673f1[pulse] = var_f2de135e.var_a79aba98[pulse][stage];
		var_f2de135e.var_92fc0d45[pulse] = var_f2de135e.time_out[pulse][stage];
		var_f2de135e.var_5b5500f7[pulse] = var_f2de135e.var_97aa6fd2[pulse][stage];
	}
}

/*
	Name: play_new_stage_rumble
	Namespace: blood
	Checksum: 0xC6B3D32F
	Offset: 0x3158
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private play_new_stage_rumble(localclientnum)
{
	self endon(#"death", #"hash_6bf3273fdaffc859", #"disconnect");
	for(i = 0; i < 2; i++)
	{
		self playrumbleonentity(localclientnum, "new_health_stage_cp");
		wait(0.4);
	}
}

/*
	Name: function_5a719e5
	Namespace: blood
	Checksum: 0x1C05BAB
	Offset: 0x31F0
	Size: 0x44
	Parameters: 3
	Flags: Private
*/
function private function_5a719e5(localclientnum, new_blood_stage, prior_blood_stage)
{
	if(new_blood_stage > 0)
	{
		if(new_blood_stage > prior_blood_stage)
		{
			self thread play_new_stage_rumble(localclientnum);
		}
	}
}

/*
	Name: function_e67f278c
	Namespace: blood
	Checksum: 0x39A52F8B
	Offset: 0x3240
	Size: 0x1BC
	Parameters: 3
	Flags: Private
*/
function private function_e67f278c(localclientnum, new_blood_stage, prior_blood_stage)
{
	if(new_blood_stage > 0)
	{
		switch(new_blood_stage)
		{
			case 1:
			{
				setcontrollerlightbarcolorpulsing(localclientnum, (1, 1, 0), 2400);
				break;
			}
			case 2:
			{
				setcontrollerlightbarcolorpulsing(localclientnum, (1, 0.66, 0), 1800);
				break;
			}
			case 3:
			{
				setcontrollerlightbarcolorpulsing(localclientnum, (1, 0.33, 0), 1200);
				break;
			}
			case 4:
			{
				setcontrollerlightbarcolorpulsing(localclientnum, (1, 0, 0), 600);
				break;
			}
			default:
			{
				setcontrollerlightbarcolor(localclientnum);
				break;
			}
		}
	}
	else if(new_blood_stage != prior_blood_stage)
	{
		if(isdefined(level.controllercolor) && isdefined(level.controllercolor[localclientnum]))
		{
			setcontrollerlightbarcolor(localclientnum, level.controllercolor[localclientnum]);
		}
		else
		{
			setcontrollerlightbarcolor(localclientnum);
		}
	}
}

/*
	Name: function_9a8dc0ec
	Namespace: blood
	Checksum: 0x7A7C2A92
	Offset: 0x3408
	Size: 0x27E
	Parameters: 3
	Flags: Private
*/
function private function_9a8dc0ec(localclientnum, playerhealth, forceupdate)
{
	if(!isdefined(self.last_blood_stage))
	{
		self.last_blood_stage = 0;
	}
	prior_blood_stage = self.last_blood_stage;
	new_blood_stage = 0;
	if(!is_true(self.nobloodoverlay))
	{
		if(playerhealth <= level.blood.threshold[1] && playerhealth > 0)
		{
			if(playerhealth <= level.blood.threshold[3])
			{
				new_blood_stage = (playerhealth <= level.blood.threshold[4] ? 4 : 3);
			}
			else
			{
				new_blood_stage = (playerhealth <= level.blood.threshold[2] ? 2 : 1);
			}
		}
	}
	self function_e67f278c(localclientnum, new_blood_stage, prior_blood_stage);
	if(new_blood_stage != prior_blood_stage || forceupdate)
	{
		ramptime = (prior_blood_stage > new_blood_stage ? level.blood.var_49774f1 : level.blood.var_587ce5b0);
		self thread function_8fe966f4(localclientnum, prior_blood_stage, new_blood_stage, ramptime, self.var_957f4b6b);
		if(is_true(self.blood_enabled))
		{
			self function_116b95e5(self.var_957f4b6b, #"hash_3886e6a5c0c3df4c", level.blood.var_d3813c3a[new_blood_stage]);
		}
		self function_56419db8(new_blood_stage);
		self function_5a719e5(localclientnum, new_blood_stage, prior_blood_stage);
		self function_1cf17bbc(localclientnum, new_blood_stage, prior_blood_stage);
		self function_e91b92e2(localclientnum, new_blood_stage, prior_blood_stage, playerhealth);
	}
	self.last_blood_stage = new_blood_stage;
	/#
	#/
}

/*
	Name: function_8fe966f4
	Namespace: blood
	Checksum: 0xB4FC828C
	Offset: 0x3690
	Size: 0x684
	Parameters: 5
	Flags: None
*/
function function_8fe966f4(localclientnum, var_bfd952c7, var_3e434a35, ramptime, postfx)
{
	self endon(#"dead", #"hash_6d50f64fe99aed76");
	self notify(#"hash_224e2e71d8e6add3");
	self endon(#"hash_224e2e71d8e6add3");
	localplayer = function_5c10bd79(localclientnum);
	if(!isdefined(localplayer))
	{
		return;
	}
	starttime = localplayer getclienttime();
	var_d183f050 = getservertime(localclientnum);
	var_e9d8aaf5 = level.blood.var_e9d8aaf5;
	var_5831bf35 = level.blood.var_5831bf35;
	currenttime = starttime;
	elapsedtime = 0;
	while(elapsedtime < ramptime)
	{
		new_percent = elapsedtime / ramptime;
		var_3198c720 = 1 - new_percent;
		if(is_true(self.blood_enabled))
		{
			self function_116b95e5(postfx, #"fade", (level.blood.fade[var_bfd952c7] * var_3198c720) + (level.blood.fade[var_3e434a35] * new_percent));
			self function_116b95e5(postfx, #"opacity", (level.blood.opacity[var_bfd952c7] * var_3198c720) + (level.blood.opacity[var_3e434a35] * new_percent));
			self function_116b95e5(postfx, #"hash_4719d5a85c54db22", (level.blood.var_4c8629ad[var_bfd952c7] * var_3198c720) + (level.blood.var_4c8629ad[var_3e434a35] * new_percent));
			self function_116b95e5(postfx, #"hash_703cc9e25857079", (level.blood.var_ea220db3[var_bfd952c7] * var_3198c720) + (level.blood.var_ea220db3[var_3e434a35] * new_percent));
			self function_116b95e5(postfx, #"blur", (level.blood.blur[var_bfd952c7] * var_3198c720) + (level.blood.blur[var_3e434a35] * new_percent));
			if(var_e9d8aaf5)
			{
				self function_116b95e5(postfx, #"hash_20907a894d572d2a", (level.blood.var_c0dfc7ef[var_bfd952c7] * var_3198c720) + (level.blood.var_c0dfc7ef[var_3e434a35] * new_percent));
			}
			if(var_5831bf35)
			{
				self function_116b95e5(postfx, #"desaturation", (level.blood.desaturation[var_bfd952c7] * var_3198c720) + (level.blood.desaturation[var_3e434a35] * new_percent));
			}
		}
		waitframe(1);
		localplayer = function_5c10bd79(localclientnum);
		if(!isdefined(localplayer))
		{
			return;
		}
		currenttime = localplayer getclienttime();
		var_5710f35c = getservertime(localclientnum);
		if(var_5710f35c < var_d183f050)
		{
			return;
		}
		elapsedtime = currenttime - starttime;
	}
	if(is_true(self.blood_enabled))
	{
		self function_116b95e5(postfx, #"fade", level.blood.fade[var_3e434a35]);
		self function_116b95e5(postfx, #"opacity", level.blood.opacity[var_3e434a35]);
		self function_116b95e5(postfx, #"hash_4719d5a85c54db22", level.blood.var_4c8629ad[var_3e434a35]);
		self function_116b95e5(postfx, #"hash_703cc9e25857079", level.blood.var_ea220db3[var_3e434a35]);
		self function_116b95e5(postfx, #"blur", level.blood.blur[var_3e434a35]);
		if(var_e9d8aaf5)
		{
			self function_116b95e5(postfx, #"hash_20907a894d572d2a", level.blood.var_c0dfc7ef[var_3e434a35]);
		}
		if(var_5831bf35)
		{
			self function_116b95e5(postfx, #"desaturation", level.blood.desaturation[var_3e434a35]);
		}
	}
}

/*
	Name: function_c0cdd1f2
	Namespace: blood
	Checksum: 0x98CD7D48
	Offset: 0x3D20
	Size: 0x26C
	Parameters: 6
	Flags: None
*/
function function_c0cdd1f2(localclientnum, var_2347e08e, var_991d3376, ramptime, key, postfx)
{
	self endon(#"death", #"hash_6bf3273fdaffc859", #"hash_6d50f64fe99aed76");
	notify_event = ("rampPostFx" + key) + postfx;
	self notify(notify_event);
	self endon(notify_event);
	localplayer = function_5c10bd79(localclientnum);
	if(!isdefined(localplayer))
	{
		return;
	}
	starttime = localplayer getclienttime();
	var_d183f050 = getservertime(localclientnum);
	currenttime = starttime;
	elapsedtime = 0;
	while(elapsedtime < ramptime)
	{
		percent = elapsedtime / ramptime;
		amount = (var_991d3376 * percent) + (var_2347e08e * (1 - percent));
		if(is_true(self.blood_enabled) || is_true(self.var_a3b3e5cc))
		{
			self function_116b95e5(postfx, key, amount);
		}
		waitframe(1);
		localplayer = function_5c10bd79(localclientnum);
		if(!isdefined(localplayer))
		{
			return;
		}
		currenttime = localplayer getclienttime();
		var_5710f35c = getservertime(localclientnum);
		if(var_5710f35c < var_d183f050)
		{
			return;
		}
		elapsedtime = currenttime - starttime;
	}
	if(is_true(self.blood_enabled) || is_true(self.var_a3b3e5cc))
	{
		self function_116b95e5(postfx, key, var_991d3376);
	}
}

/*
	Name: function_70299400
	Namespace: blood
	Checksum: 0x1A025B4D
	Offset: 0x3F98
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private function_70299400(localclientnum)
{
	if(level.var_4ecf5754 === #"hash_65cfe78dc61dd3af")
	{
		return;
	}
	self.blood_enabled = 1;
	if(is_true(self.blood_enabled))
	{
		if(!self function_d2cb869e(self.var_957f4b6b))
		{
			self codeplaypostfxbundle(self.var_957f4b6b);
		}
	}
}

/*
	Name: function_436ee4c2
	Namespace: blood
	Checksum: 0x69DBEC6E
	Offset: 0x4030
	Size: 0x294
	Parameters: 2
	Flags: Private
*/
function private function_436ee4c2(localclientnum, var_957f4b6b)
{
	self notify(#"hash_6d50f64fe99aed76");
	if(isdefined(self))
	{
		if(self function_d2cb869e(var_957f4b6b))
		{
			self codestoppostfxbundle(var_957f4b6b);
		}
		if(self function_d2cb869e(#"hash_5b630a217af16732"))
		{
			self codestoppostfxbundle(#"hash_5b630a217af16732");
		}
		if(self function_d2cb869e(#"hash_4a1db95d40ab50d"))
		{
			self codestoppostfxbundle(#"hash_4a1db95d40ab50d");
		}
		if(self function_d2cb869e(#"hash_1502559766b0e08f"))
		{
			self codestoppostfxbundle(#"hash_1502559766b0e08f");
		}
		self.blood_enabled = 0;
		self.var_a3b3e5cc = 0;
	}
	else
	{
		if(function_148ccc79(localclientnum, var_957f4b6b))
		{
			codestoppostfxbundlelocal(localclientnum, var_957f4b6b);
		}
		if(function_148ccc79(localclientnum, #"hash_5b630a217af16732"))
		{
			codestoppostfxbundlelocal(localclientnum, #"hash_5b630a217af16732");
		}
		if(function_148ccc79(localclientnum, #"hash_4a1db95d40ab50d"))
		{
			codestoppostfxbundlelocal(localclientnum, #"hash_4a1db95d40ab50d");
		}
		if(function_148ccc79(localclientnum, #"hash_1502559766b0e08f"))
		{
			codestoppostfxbundlelocal(localclientnum, #"hash_1502559766b0e08f");
		}
	}
	if(!isdefined(self))
	{
		if(isdefined(level.controllercolor) && isdefined(level.controllercolor[localclientnum]))
		{
			setcontrollerlightbarcolor(localclientnum, level.controllercolor[localclientnum]);
		}
		else
		{
			setcontrollerlightbarcolor(localclientnum);
		}
	}
}

/*
	Name: function_dd830dee
	Namespace: blood
	Checksum: 0xE9F16342
	Offset: 0x42D0
	Size: 0x1B56
	Parameters: 1
	Flags: Private
*/
function private function_dd830dee(var_3942c692)
{
	level.blood = spawnstruct();
	if(isdefined(var_3942c692))
	{
		level.blood.scriptbundle = getscriptbundle(var_3942c692);
	}
	else
	{
		if(function_f99d2668())
		{
			level.blood.scriptbundle = getscriptbundle("wz_blood_settings");
		}
		else
		{
			level.blood.scriptbundle = (getgametypesetting(#"hardcoremode") ? getscriptbundle("hardcore_blood_settings") : getscriptbundle("cp_blood_settings"));
		}
	}
	/#
		assert(isdefined(level.blood.scriptbundle));
	#/
	if(!isdefined(level.blood.var_e9d8aaf5))
	{
		level.blood.var_e9d8aaf5 = (isdefined(level.blood.scriptbundle.var_e9d8aaf5) ? level.blood.scriptbundle.var_e9d8aaf5 : 0);
	}
	level.blood.var_c0dfc7ef = [];
	if(!isdefined(level.blood.var_c0dfc7ef[0]))
	{
		level.blood.var_c0dfc7ef[0] = (isdefined(level.blood.scriptbundle.var_9e65e691) ? level.blood.scriptbundle.var_9e65e691 : 0);
	}
	if(!isdefined(level.blood.var_c0dfc7ef[1]))
	{
		level.blood.var_c0dfc7ef[1] = (isdefined(level.blood.scriptbundle.var_49ddbdf6) ? level.blood.scriptbundle.var_49ddbdf6 : 0);
	}
	if(!isdefined(level.blood.var_c0dfc7ef[2]))
	{
		level.blood.var_c0dfc7ef[2] = (isdefined(level.blood.scriptbundle.var_83022fca) ? level.blood.scriptbundle.var_83022fca : 0);
	}
	if(!isdefined(level.blood.var_c0dfc7ef[3]))
	{
		level.blood.var_c0dfc7ef[3] = (isdefined(level.blood.scriptbundle.var_90b9cb39) ? level.blood.scriptbundle.var_90b9cb39 : 0);
	}
	if(!isdefined(level.blood.var_c0dfc7ef[4]))
	{
		level.blood.var_c0dfc7ef[4] = (isdefined(level.blood.scriptbundle.var_e790f8e6) ? level.blood.scriptbundle.var_e790f8e6 : 0);
	}
	if(!isdefined(level.blood.var_5831bf35))
	{
		level.blood.var_5831bf35 = (isdefined(level.blood.scriptbundle.var_5831bf35) ? level.blood.scriptbundle.var_5831bf35 : 0);
	}
	level.blood.desaturation = [];
	if(!isdefined(level.blood.desaturation[0]))
	{
		level.blood.desaturation[0] = (isdefined(level.blood.scriptbundle.var_39a52851) ? level.blood.scriptbundle.var_39a52851 : 0);
	}
	if(!isdefined(level.blood.desaturation[1]))
	{
		level.blood.desaturation[1] = (isdefined(level.blood.scriptbundle.var_53df5cdd) ? level.blood.scriptbundle.var_53df5cdd : 0);
	}
	if(!isdefined(level.blood.desaturation[2]))
	{
		level.blood.desaturation[2] = (isdefined(level.blood.scriptbundle.var_56136145) ? level.blood.scriptbundle.var_56136145 : 0);
	}
	if(!isdefined(level.blood.desaturation[3]))
	{
		level.blood.desaturation[3] = (isdefined(level.blood.scriptbundle.var_285085c0) ? level.blood.scriptbundle.var_285085c0 : 0);
	}
	if(!isdefined(level.blood.desaturation[4]))
	{
		level.blood.desaturation[4] = (isdefined(level.blood.scriptbundle.var_3c8fae3e) ? level.blood.scriptbundle.var_3c8fae3e : 0);
	}
	level.blood.var_d3813c3a = [];
	if(!isdefined(level.blood.var_d3813c3a[0]))
	{
		level.blood.var_d3813c3a[0] = (isdefined(level.blood.scriptbundle.var_fd86eebc) ? level.blood.scriptbundle.var_fd86eebc : 0);
	}
	if(!isdefined(level.blood.var_d3813c3a[1]))
	{
		level.blood.var_d3813c3a[1] = (isdefined(level.blood.scriptbundle.var_e741c232) ? level.blood.scriptbundle.var_e741c232 : 0);
	}
	if(!isdefined(level.blood.var_d3813c3a[2]))
	{
		level.blood.var_d3813c3a[2] = (isdefined(level.blood.scriptbundle.var_e11b35e5) ? level.blood.scriptbundle.var_e11b35e5 : 0);
	}
	if(!isdefined(level.blood.var_d3813c3a[3]))
	{
		level.blood.var_d3813c3a[3] = (isdefined(level.blood.scriptbundle.var_cadf096d) ? level.blood.scriptbundle.var_cadf096d : 0);
	}
	if(!isdefined(level.blood.var_d3813c3a[4]))
	{
		level.blood.var_d3813c3a[4] = (isdefined(level.blood.scriptbundle.var_c3ad7b0a) ? level.blood.scriptbundle.var_c3ad7b0a : 0);
	}
	level.blood.blur = [];
	if(!isdefined(level.blood.blur[0]))
	{
		level.blood.blur[0] = (isdefined(level.blood.scriptbundle.var_d4e546df) ? level.blood.scriptbundle.var_d4e546df : 0);
	}
	if(!isdefined(level.blood.blur[1]))
	{
		level.blood.blur[1] = (isdefined(level.blood.scriptbundle.var_e6a76a63) ? level.blood.scriptbundle.var_e6a76a63 : 0);
	}
	if(!isdefined(level.blood.blur[2]))
	{
		level.blood.blur[2] = (isdefined(level.blood.scriptbundle.var_b9320f69) ? level.blood.scriptbundle.var_b9320f69 : 0);
	}
	if(!isdefined(level.blood.blur[3]))
	{
		level.blood.blur[3] = (isdefined(level.blood.scriptbundle.var_9af9d2f9) ? level.blood.scriptbundle.var_9af9d2f9 : 0);
	}
	if(!isdefined(level.blood.blur[4]))
	{
		level.blood.blur[4] = (isdefined(level.blood.scriptbundle.var_acaf7664) ? level.blood.scriptbundle.var_acaf7664 : 0);
	}
	level.blood.opacity = [];
	if(!isdefined(level.blood.opacity[0]))
	{
		level.blood.opacity[0] = (isdefined(level.blood.scriptbundle.var_a05e6a18) ? level.blood.scriptbundle.var_a05e6a18 : 0);
	}
	if(!isdefined(level.blood.opacity[1]))
	{
		level.blood.opacity[1] = (isdefined(level.blood.scriptbundle.var_920ccd75) ? level.blood.scriptbundle.var_920ccd75 : 0);
	}
	if(!isdefined(level.blood.opacity[2]))
	{
		level.blood.opacity[2] = (isdefined(level.blood.scriptbundle.var_54f2533d) ? level.blood.scriptbundle.var_54f2533d : 0);
	}
	if(!isdefined(level.blood.opacity[3]))
	{
		level.blood.opacity[3] = (isdefined(level.blood.scriptbundle.var_467fb658) ? level.blood.scriptbundle.var_467fb658 : 0);
	}
	if(!isdefined(level.blood.opacity[4]))
	{
		level.blood.opacity[4] = (isdefined(level.blood.scriptbundle.var_ed5b8411) ? level.blood.scriptbundle.var_ed5b8411 : 0);
	}
	level.blood.threshold = [];
	if(!isdefined(level.blood.threshold[0]))
	{
		level.blood.threshold[0] = (isdefined(level.blood.scriptbundle.var_4e06fd93) ? level.blood.scriptbundle.var_4e06fd93 : 0);
	}
	if(!isdefined(level.blood.threshold[1]))
	{
		level.blood.threshold[1] = (isdefined(level.blood.scriptbundle.var_3bc4590e) ? level.blood.scriptbundle.var_3bc4590e : 0);
	}
	if(!isdefined(level.blood.threshold[2]))
	{
		level.blood.threshold[2] = (isdefined(level.blood.scriptbundle.var_bc1cd9c5) ? level.blood.scriptbundle.var_bc1cd9c5 : 0);
	}
	if(!isdefined(level.blood.threshold[3]))
	{
		level.blood.threshold[3] = (isdefined(level.blood.scriptbundle.var_91558437) ? level.blood.scriptbundle.var_91558437 : 0);
	}
	if(!isdefined(level.blood.threshold[4]))
	{
		level.blood.threshold[4] = (isdefined(level.blood.scriptbundle.var_7f6fe064) ? level.blood.scriptbundle.var_7f6fe064 : 0);
	}
	level.blood.fade = [];
	if(!isdefined(level.blood.fade[0]))
	{
		level.blood.fade[0] = (isdefined(level.blood.scriptbundle.var_5eab69fa) ? level.blood.scriptbundle.var_5eab69fa : 0);
	}
	if(!isdefined(level.blood.fade[1]))
	{
		level.blood.fade[1] = (isdefined(level.blood.scriptbundle.var_83dbb45a) ? level.blood.scriptbundle.var_83dbb45a : 0);
	}
	if(!isdefined(level.blood.fade[2]))
	{
		level.blood.fade[2] = (isdefined(level.blood.scriptbundle.var_720a10b7) ? level.blood.scriptbundle.var_720a10b7 : 0);
	}
	if(!isdefined(level.blood.fade[3]))
	{
		level.blood.fade[3] = (isdefined(level.blood.scriptbundle.var_f1f39088) ? level.blood.scriptbundle.var_f1f39088 : 0);
	}
	if(!isdefined(level.blood.fade[4]))
	{
		level.blood.fade[4] = (isdefined(level.blood.scriptbundle.var_2945ff2c) ? level.blood.scriptbundle.var_2945ff2c : 0);
	}
	level.blood.var_4c8629ad = [];
	if(!isdefined(level.blood.var_4c8629ad[0]))
	{
		level.blood.var_4c8629ad[0] = (isdefined(level.blood.scriptbundle.var_43305756) ? level.blood.scriptbundle.var_43305756 : 0);
	}
	if(!isdefined(level.blood.var_4c8629ad[1]))
	{
		level.blood.var_4c8629ad[1] = (isdefined(level.blood.scriptbundle.var_517af3eb) ? level.blood.scriptbundle.var_517af3eb : 0);
	}
	if(!isdefined(level.blood.var_4c8629ad[2]))
	{
		level.blood.var_4c8629ad[2] = (isdefined(level.blood.scriptbundle.var_6ec52e7f) ? level.blood.scriptbundle.var_6ec52e7f : 0);
	}
	if(!isdefined(level.blood.var_4c8629ad[3]))
	{
		level.blood.var_4c8629ad[3] = (isdefined(level.blood.scriptbundle.var_7cfacaea) ? level.blood.scriptbundle.var_7cfacaea : 0);
	}
	if(!isdefined(level.blood.var_4c8629ad[4]))
	{
		level.blood.var_4c8629ad[4] = (isdefined(level.blood.scriptbundle.var_fd0b4b01) ? level.blood.scriptbundle.var_fd0b4b01 : 0);
	}
	level.blood.var_ea220db3 = [];
	if(!isdefined(level.blood.var_ea220db3[0]))
	{
		level.blood.var_ea220db3[0] = (isdefined(level.blood.scriptbundle.var_79c59717) ? level.blood.scriptbundle.var_79c59717 : 0);
	}
	if(!isdefined(level.blood.var_ea220db3[1]))
	{
		level.blood.var_ea220db3[1] = (isdefined(level.blood.scriptbundle.var_a403eb93) ? level.blood.scriptbundle.var_a403eb93 : 0);
	}
	if(!isdefined(level.blood.var_ea220db3[2]))
	{
		level.blood.var_ea220db3[2] = (isdefined(level.blood.scriptbundle.var_95514e2e) ? level.blood.scriptbundle.var_95514e2e : 0);
	}
	if(!isdefined(level.blood.var_ea220db3[3]))
	{
		level.blood.var_ea220db3[3] = (isdefined(level.blood.scriptbundle.var_bf94a2b4) ? level.blood.scriptbundle.var_bf94a2b4 : 0);
	}
	if(!isdefined(level.blood.var_ea220db3[4]))
	{
		level.blood.var_ea220db3[4] = (isdefined(level.blood.scriptbundle.var_3fe4235d) ? level.blood.scriptbundle.var_3fe4235d : 0);
	}
	function_f50652a9();
	function_b0e51f43();
	function_6ad98c9c();
	level.blood.rob = spawnstruct();
	if(!isdefined(level.blood.rob.stage))
	{
		level.blood.rob.stage = (isdefined(level.blood.scriptbundle.var_5e7ac43f) ? level.blood.scriptbundle.var_5e7ac43f : 0);
	}
	if(!isdefined(level.blood.rob.hold_time))
	{
		level.blood.rob.hold_time = (isdefined(level.blood.scriptbundle.var_ae06158b) ? level.blood.scriptbundle.var_ae06158b : 0);
	}
	if(!isdefined(level.blood.rob.fade_time))
	{
		level.blood.rob.fade_time = (isdefined(level.blood.scriptbundle.var_356550c9) ? level.blood.scriptbundle.var_356550c9 : 0);
	}
	if(!isdefined(level.blood.rob.damage_threshold))
	{
		level.blood.rob.damage_threshold = (isdefined(level.blood.scriptbundle.var_8635c7a1) ? level.blood.scriptbundle.var_8635c7a1 : 0);
	}
	if(!isdefined(level.blood.var_f5479429))
	{
		level.blood.var_f5479429 = (isdefined(level.blood.scriptbundle.var_f5479429) ? level.blood.scriptbundle.var_f5479429 : 0);
	}
	level.blood.var_587ce5b0 = level.blood.scriptbundle.var_587ce5b0;
	level.blood.var_49774f1 = level.blood.scriptbundle.var_49774f1;
	if(!isdefined(level.blood.var_f5479429))
	{
		level.blood.var_f5479429 = (isdefined(level.blood.scriptbundle.var_f5479429) ? level.blood.scriptbundle.var_f5479429 : 0);
	}
	if(!isdefined(level.blood.var_8691ed16))
	{
		level.blood.var_8691ed16 = (isdefined(level.blood.scriptbundle.var_8691ed16) ? level.blood.scriptbundle.var_8691ed16 : "");
	}
	if(!isdefined(level.blood.var_d8dc9013))
	{
		level.blood.var_d8dc9013 = (isdefined(level.blood.scriptbundle.var_d8dc9013) ? level.blood.scriptbundle.var_d8dc9013 : "");
	}
	if(!isdefined(level.blood.var_dad052de))
	{
		level.blood.var_dad052de = (isdefined(level.blood.scriptbundle.var_dad052de) ? level.blood.scriptbundle.var_dad052de : "");
	}
}

/*
	Name: function_162fe6ec
	Namespace: blood
	Checksum: 0x972D9AE3
	Offset: 0x5E30
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private function_162fe6ec(localclientnum)
{
	splatter = spawnstruct();
	splatter.splatters = [];
	for(j = 0; j < 4; j++)
	{
		splatter.splatters[j] = [];
	}
	splatter.var_120a7b2c = 0;
	level.blood.var_de10c136.var_51036e02[localclientnum] = splatter;
}

/*
	Name: function_b0e51f43
	Namespace: blood
	Checksum: 0x1D336628
	Offset: 0x5EC8
	Size: 0xB5A
	Parameters: 0
	Flags: Private
*/
function private function_b0e51f43()
{
	level.blood.var_de10c136 = spawnstruct();
	level.blood.var_de10c136.localclients = [];
	for(i = 0; i < getmaxlocalclients(); i++)
	{
		function_162fe6ec(i);
	}
	if(!isdefined(level.blood.var_de10c136.enabled))
	{
		level.blood.var_de10c136.enabled = (isdefined(level.blood.scriptbundle.var_f70c3e8d) ? level.blood.scriptbundle.var_f70c3e8d : 0);
	}
	if(!isdefined(level.blood.var_de10c136.var_58f1f80e))
	{
		level.blood.var_de10c136.var_58f1f80e = (isdefined(level.blood.scriptbundle.var_58f1f80e) ? level.blood.scriptbundle.var_58f1f80e : 1);
	}
	if(!isdefined(level.blood.var_de10c136.var_3e1e9389))
	{
		level.blood.var_de10c136.var_3e1e9389 = (isdefined(level.blood.scriptbundle.var_3e1e9389) ? level.blood.scriptbundle.var_3e1e9389 : 1);
	}
	level.blood.var_de10c136.range = [];
	level.blood.var_de10c136.var_587ce5b0 = [];
	level.blood.var_de10c136.var_49774f1 = [];
	level.blood.var_de10c136.hold_time = [];
	for(i = 0; i < level.blood.var_de10c136.var_58f1f80e; i++)
	{
		level.blood.var_de10c136.range[i] = spawnstruct();
		if(i > 0)
		{
			if(!isdefined(level.blood.var_de10c136.range[i].start))
			{
				level.blood.var_de10c136.range[i].start = (isdefined(level.blood.scriptbundle.("damage_range_start_" + i)) ? level.blood.scriptbundle.("damage_range_start_" + i) : level.blood.var_de10c136.range[i - 1].start);
			}
		}
		else if(!isdefined(level.blood.var_de10c136.range[i].start))
		{
			level.blood.var_de10c136.range[i].start = (isdefined(level.blood.scriptbundle.("damage_range_start_" + i)) ? level.blood.scriptbundle.("damage_range_start_" + i) : 0);
		}
		if(!isdefined(level.blood.var_de10c136.range[i].blur))
		{
			level.blood.var_de10c136.range[i].blur = (isdefined(level.blood.scriptbundle.("damage_range_blur_" + i)) ? level.blood.scriptbundle.("damage_range_blur_" + i) : 0);
		}
		if(!isdefined(level.blood.var_de10c136.range[i].opacity))
		{
			level.blood.var_de10c136.range[i].opacity = (isdefined(level.blood.scriptbundle.("damage_range_opacity_" + i)) ? level.blood.scriptbundle.("damage_range_opacity_" + i) : 0);
		}
		if(!isdefined(level.blood.var_de10c136.var_587ce5b0[i]))
		{
			level.blood.var_de10c136.var_587ce5b0[i] = (isdefined(level.blood.scriptbundle.("hit_flash_ramp_in_time_" + i)) ? level.blood.scriptbundle.("hit_flash_ramp_in_time_" + i) : 0);
		}
		if(!isdefined(level.blood.var_de10c136.var_49774f1[i]))
		{
			level.blood.var_de10c136.var_49774f1[i] = (isdefined(level.blood.scriptbundle.("hit_flash_ramp_out_time_" + i)) ? level.blood.scriptbundle.("hit_flash_ramp_out_time_" + i) : 0);
		}
		if(!isdefined(level.blood.var_de10c136.hold_time[i]))
		{
			level.blood.var_de10c136.hold_time[i] = (isdefined(level.blood.scriptbundle.("hit_flash_hold_time_" + i)) ? level.blood.scriptbundle.("hit_flash_hold_time_" + i) : 0);
		}
	}
	level.blood.var_de10c136.dot = spawnstruct();
	if(!isdefined(level.blood.var_de10c136.dot.blur))
	{
		level.blood.var_de10c136.dot.blur = (isdefined(level.blood.scriptbundle.("dot_blur")) ? level.blood.scriptbundle.("dot_blur") : 0);
	}
	if(!isdefined(level.blood.var_de10c136.dot.opacity))
	{
		level.blood.var_de10c136.dot.opacity = (isdefined(level.blood.scriptbundle.("dot_opacity")) ? level.blood.scriptbundle.("dot_opacity") : 0);
	}
	if(!isdefined(level.blood.var_de10c136.dot.var_587ce5b0))
	{
		level.blood.var_de10c136.dot.var_587ce5b0 = (isdefined(level.blood.scriptbundle.("dot_hit_flash_ramp_in_time")) ? level.blood.scriptbundle.("dot_hit_flash_ramp_in_time") : 0);
	}
	if(!isdefined(level.blood.var_de10c136.dot.var_49774f1))
	{
		level.blood.var_de10c136.dot.var_49774f1 = (isdefined(level.blood.scriptbundle.("dot_hit_flash_ramp_out_time")) ? level.blood.scriptbundle.("dot_hit_flash_ramp_out_time") : 0);
	}
	if(!isdefined(level.blood.var_de10c136.dot.hold_time))
	{
		level.blood.var_de10c136.dot.hold_time = (isdefined(level.blood.scriptbundle.("dot_hit_flash_hold_time")) ? level.blood.scriptbundle.("dot_hit_flash_hold_time") : 0);
	}
	if(!isdefined(level.blood.var_de10c136.dot.var_6264f8dd))
	{
		level.blood.var_de10c136.dot.var_6264f8dd = (isdefined(level.blood.scriptbundle.("dot_ignore_damage_threshold")) ? level.blood.scriptbundle.("dot_ignore_damage_threshold") : 0);
	}
	if(!isdefined(level.blood.var_de10c136.dot.var_372dff4b))
	{
		level.blood.var_de10c136.dot.var_372dff4b = (isdefined(level.blood.scriptbundle.("dot_ignore_damage_time")) ? level.blood.scriptbundle.("dot_ignore_damage_time") : 0);
	}
}

/*
	Name: function_f50652a9
	Namespace: blood
	Checksum: 0x96FB523E
	Offset: 0x6A30
	Size: 0x1B30
	Parameters: 0
	Flags: Private
*/
function private function_f50652a9()
{
	level.blood.var_f2de135e = spawnstruct();
	level.blood.var_f2de135e.var_621835b4 = [];
	level.blood.var_f2de135e.var_a79aba98 = [];
	level.blood.var_f2de135e.time_out = [];
	level.blood.var_f2de135e.var_97aa6fd2 = [];
	level.blood.var_f2de135e.var_562c41de = [];
	level.blood.var_f2de135e.var_18f673f1 = [];
	level.blood.var_f2de135e.var_92fc0d45 = [];
	level.blood.var_f2de135e.var_5b5500f7 = [];
	level.blood.var_f2de135e.var_621835b4[0] = [];
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[0][0]))
	{
		level.blood.var_f2de135e.var_621835b4[0][0] = (isdefined(level.blood.scriptbundle.var_b3272558) ? level.blood.scriptbundle.var_b3272558 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[0][1]))
	{
		level.blood.var_f2de135e.var_621835b4[0][1] = (isdefined(level.blood.scriptbundle.var_d014df1f) ? level.blood.scriptbundle.var_d014df1f : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[0][2]))
	{
		level.blood.var_f2de135e.var_621835b4[0][2] = (isdefined(level.blood.scriptbundle.var_bdca3a8a) ? level.blood.scriptbundle.var_bdca3a8a : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[0][3]))
	{
		level.blood.var_f2de135e.var_621835b4[0][3] = (isdefined(level.blood.scriptbundle.var_ab891608) ? level.blood.scriptbundle.var_ab891608 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[0][4]))
	{
		level.blood.var_f2de135e.var_621835b4[0][4] = (isdefined(level.blood.scriptbundle.var_996371bd) ? level.blood.scriptbundle.var_996371bd : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_562c41de[0]))
	{
		level.blood.var_f2de135e.var_562c41de[0] = level.blood.var_f2de135e.var_621835b4[0][0];
	}
	level.blood.var_f2de135e.var_621835b4[1] = [];
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[1][0]))
	{
		level.blood.var_f2de135e.var_621835b4[1][0] = (isdefined(level.blood.scriptbundle.var_8623b2d2) ? level.blood.scriptbundle.var_8623b2d2 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[1][1]))
	{
		level.blood.var_f2de135e.var_621835b4[1][1] = (isdefined(level.blood.scriptbundle.var_7862174f) ? level.blood.scriptbundle.var_7862174f : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[1][2]))
	{
		level.blood.var_f2de135e.var_621835b4[1][2] = (isdefined(level.blood.scriptbundle.var_d2b4cbf3) ? level.blood.scriptbundle.var_d2b4cbf3 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[1][3]))
	{
		level.blood.var_f2de135e.var_621835b4[1][3] = (isdefined(level.blood.scriptbundle.var_bcf6a077) ? level.blood.scriptbundle.var_bcf6a077 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_621835b4[1][4]))
	{
		level.blood.var_f2de135e.var_621835b4[1][4] = (isdefined(level.blood.scriptbundle.var_af1f04c8) ? level.blood.scriptbundle.var_af1f04c8 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_562c41de[1]))
	{
		level.blood.var_f2de135e.var_562c41de[1] = level.blood.var_f2de135e.var_621835b4[1][0];
	}
	level.blood.var_f2de135e.var_a79aba98[0] = [];
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[0][0]))
	{
		level.blood.var_f2de135e.var_a79aba98[0][0] = (isdefined(level.blood.scriptbundle.var_a647a17d) ? level.blood.scriptbundle.var_a647a17d : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[0][1]))
	{
		level.blood.var_f2de135e.var_a79aba98[0][1] = (isdefined(level.blood.scriptbundle.var_2fc5ae5) ? level.blood.scriptbundle.var_2fc5ae5 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[0][2]))
	{
		level.blood.var_f2de135e.var_a79aba98[0][2] = (isdefined(level.blood.scriptbundle.var_10be7669) ? level.blood.scriptbundle.var_10be7669 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[0][3]))
	{
		level.blood.var_f2de135e.var_a79aba98[0][3] = (isdefined(level.blood.scriptbundle.var_9147f772) ? level.blood.scriptbundle.var_9147f772 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[0][4]))
	{
		level.blood.var_f2de135e.var_a79aba98[0][4] = (isdefined(level.blood.scriptbundle.var_5f8a13f7) ? level.blood.scriptbundle.var_5f8a13f7 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_18f673f1[0]))
	{
		level.blood.var_f2de135e.var_18f673f1[0] = level.blood.var_f2de135e.var_a79aba98[0][0];
	}
	level.blood.var_f2de135e.var_a79aba98[1] = [];
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[1][0]))
	{
		level.blood.var_f2de135e.var_a79aba98[1][0] = (isdefined(level.blood.scriptbundle.var_96868f33) ? level.blood.scriptbundle.var_96868f33 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[1][1]))
	{
		level.blood.var_f2de135e.var_a79aba98[1][1] = (isdefined(level.blood.scriptbundle.var_16780f18) ? level.blood.scriptbundle.var_16780f18 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[1][2]))
	{
		level.blood.var_f2de135e.var_a79aba98[1][2] = (isdefined(level.blood.scriptbundle.var_48c373ae) ? level.blood.scriptbundle.var_48c373ae : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[1][3]))
	{
		level.blood.var_f2de135e.var_a79aba98[1][3] = (isdefined(level.blood.scriptbundle.var_38fed425) ? level.blood.scriptbundle.var_38fed425 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_a79aba98[1][4]))
	{
		level.blood.var_f2de135e.var_a79aba98[1][4] = (isdefined(level.blood.scriptbundle.var_6b3d38a1) ? level.blood.scriptbundle.var_6b3d38a1 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_18f673f1[1]))
	{
		level.blood.var_f2de135e.var_18f673f1[1] = level.blood.var_f2de135e.var_a79aba98[1][0];
	}
	level.blood.var_f2de135e.time_out[0] = [];
	if(!isdefined(level.blood.var_f2de135e.time_out[0][0]))
	{
		level.blood.var_f2de135e.time_out[0][0] = (isdefined(level.blood.scriptbundle.var_54f5763f) ? level.blood.scriptbundle.var_54f5763f : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[0][1]))
	{
		level.blood.var_f2de135e.time_out[0][1] = (isdefined(level.blood.scriptbundle.var_7cedbf3) ? level.blood.scriptbundle.var_7cedbf3 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[0][2]))
	{
		level.blood.var_f2de135e.time_out[0][2] = (isdefined(level.blood.scriptbundle.var_3959bf08) ? level.blood.scriptbundle.var_3959bf08 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[0][3]))
	{
		level.blood.var_f2de135e.time_out[0][3] = (isdefined(level.blood.scriptbundle.var_3e6f492f) ? level.blood.scriptbundle.var_3e6f492f : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[0][4]))
	{
		level.blood.var_f2de135e.time_out[0][4] = (isdefined(level.blood.scriptbundle.var_704a2ce8) ? level.blood.scriptbundle.var_704a2ce8 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_92fc0d45[0]))
	{
		level.blood.var_f2de135e.var_92fc0d45[0] = level.blood.var_f2de135e.time_out[0][0];
	}
	level.blood.var_f2de135e.time_out[1] = [];
	if(!isdefined(level.blood.var_f2de135e.time_out[1][0]))
	{
		level.blood.var_f2de135e.time_out[1][0] = (isdefined(level.blood.scriptbundle.var_50fd2cd8) ? level.blood.scriptbundle.var_50fd2cd8 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[1][1]))
	{
		level.blood.var_f2de135e.time_out[1][1] = (isdefined(level.blood.scriptbundle.var_b2c3f064) ? level.blood.scriptbundle.var_b2c3f064 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[1][2]))
	{
		level.blood.var_f2de135e.time_out[1][2] = (isdefined(level.blood.scriptbundle.var_855a1591) ? level.blood.scriptbundle.var_855a1591 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[1][3]))
	{
		level.blood.var_f2de135e.time_out[1][3] = (isdefined(level.blood.scriptbundle.var_9731393f) ? level.blood.scriptbundle.var_9731393f : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_out[1][4]))
	{
		level.blood.var_f2de135e.time_out[1][4] = (isdefined(level.blood.scriptbundle.var_e9dd5e9a) ? level.blood.scriptbundle.var_e9dd5e9a : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_92fc0d45[1]))
	{
		level.blood.var_f2de135e.var_92fc0d45[1] = level.blood.var_f2de135e.time_out[1][0];
	}
	level.blood.var_f2de135e.var_97aa6fd2[0] = [];
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][0]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[0][0] = (isdefined(level.blood.scriptbundle.var_9e799d8c) ? level.blood.scriptbundle.var_9e799d8c : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][1]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[0][1] = (isdefined(level.blood.scriptbundle.var_8bb8f80b) ? level.blood.scriptbundle.var_8bb8f80b : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][2]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[0][2] = (isdefined(level.blood.scriptbundle.var_7205c4a5) ? level.blood.scriptbundle.var_7205c4a5 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][3]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[0][3] = (isdefined(level.blood.scriptbundle.var_619e23d6) ? level.blood.scriptbundle.var_619e23d6 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[0][4]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[0][4] = (isdefined(level.blood.scriptbundle.var_56f00e7a) ? level.blood.scriptbundle.var_56f00e7a : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_5b5500f7[0]))
	{
		level.blood.var_f2de135e.var_5b5500f7[0] = level.blood.var_f2de135e.var_97aa6fd2[0][0];
	}
	level.blood.var_f2de135e.var_97aa6fd2[1] = [];
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][0]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[1][0] = (isdefined(level.blood.scriptbundle.var_ff41f2f5) ? level.blood.scriptbundle.var_ff41f2f5 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][1]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[1][1] = (isdefined(level.blood.scriptbundle.var_f0f35658) ? level.blood.scriptbundle.var_f0f35658 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][2]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[1][2] = (isdefined(level.blood.scriptbundle.var_9cf6ae3c) ? level.blood.scriptbundle.var_9cf6ae3c : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][3]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[1][3] = (isdefined(level.blood.scriptbundle.var_1ca22db5) ? level.blood.scriptbundle.var_1ca22db5 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_97aa6fd2[1][4]))
	{
		level.blood.var_f2de135e.var_97aa6fd2[1][4] = (isdefined(level.blood.scriptbundle.var_6530117) ? level.blood.scriptbundle.var_6530117 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_5b5500f7[1]))
	{
		level.blood.var_f2de135e.var_5b5500f7[1] = level.blood.var_f2de135e.var_97aa6fd2[1][0];
	}
}

/*
	Name: function_11057a7d
	Namespace: blood
	Checksum: 0xFA5E97D9
	Offset: 0x8568
	Size: 0x56
	Parameters: 7
	Flags: None
*/
function function_11057a7d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self notify(#"hash_6bf3273fdaffc859");
	}
}

/*
	Name: function_6ad98c9c
	Namespace: blood
	Checksum: 0x8B81453F
	Offset: 0x85C8
	Size: 0x158
	Parameters: 0
	Flags: None
*/
function function_6ad98c9c()
{
	level.blood.gameskill = 1;
	if(!isdefined(level.blood.var_286fcc75))
	{
		level.blood.var_286fcc75 = [];
		level.blood.var_286fcc75[0] = getscriptbundle(#"gamedifficulty_recruit");
		level.blood.var_286fcc75[1] = getscriptbundle(#"gamedifficulty_regular");
		level.blood.var_286fcc75[2] = getscriptbundle(#"gamedifficulty_hardened");
		level.blood.var_286fcc75[3] = getscriptbundle(#"gamedifficulty_veteran");
		level.blood.var_286fcc75[4] = getscriptbundle(#"gamedifficulty_realistic");
	}
}

/*
	Name: function_2b83fc6e
	Namespace: blood
	Checksum: 0x646D1EAF
	Offset: 0x8728
	Size: 0x5C
	Parameters: 7
	Flags: None
*/
function function_2b83fc6e(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		self thread function_17323bb3(fieldname);
	}
}

/*
	Name: function_17323bb3
	Namespace: blood
	Checksum: 0xC15863EE
	Offset: 0x8790
	Size: 0x11C
	Parameters: 1
	Flags: Private
*/
function private function_17323bb3(localclientnum)
{
	self notify("7fdb2f58d63647d4");
	self endon("7fdb2f58d63647d4");
	self endon(#"death", #"hash_6bf3273fdaffc859", #"disconnect");
	gameskill = util::function_5a407dc8(localclientnum);
	var_9282deff = level.blood.var_286fcc75[gameskill].player_deathinvulnerabletime;
	ramptime = 0.25;
	self function_116b95e5(self.var_957f4b6b, #"desaturation", 1);
	wait(var_9282deff);
	self thread function_c0cdd1f2(localclientnum, 1, 0, ramptime, #"desaturation", self.var_957f4b6b);
}

/*
	Name: function_100ac98f
	Namespace: blood
	Checksum: 0x4FEB87CC
	Offset: 0x88B8
	Size: 0x96
	Parameters: 7
	Flags: None
*/
function function_100ac98f(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump)
{
	if(bwasdemojump)
	{
		function_dd830dee(#"injured_blood_settings");
		level.var_99aec053 = 1;
	}
	else
	{
		function_dd830dee();
		level.var_99aec053 = undefined;
	}
}

