#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using script_3d0f36632dad12df;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\callbacks_shared.csc;
#using script_59f62971655f7103;

#namespace blood;

/*
	Name: function_94463dc1
	Namespace: blood
	Checksum: 0xB8F2C0A3
	Offset: 0x330
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_94463dc1()
{
	level notify(-77937605);
}

/*
	Name: __init__system__
	Namespace: blood
	Checksum: 0x432A7DD5
	Offset: 0x350
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"blood", undefined, &postload, undefined, undefined);
}

/*
	Name: postload
	Namespace: blood
	Checksum: 0xA5174293
	Offset: 0x398
	Size: 0x6C
	Parameters: 0
	Flags: Linked
*/
function postload()
{
	function_22302b4b();
	callback::on_localplayer_spawned(&function_e79ccfd8);
	callback::on_localclient_connect(&localclient_connect);
	level.var_f771ff42 = util::is_mature();
}

/*
	Name: getsplatter
	Namespace: blood
	Checksum: 0x2674D776
	Offset: 0x410
	Size: 0x2C
	Parameters: 1
	Flags: Linked
*/
function getsplatter(localclientnum)
{
	return level.blood.var_de10c136.var_51036e02[localclientnum];
}

/*
	Name: localclient_connect
	Namespace: blood
	Checksum: 0xC40275F
	Offset: 0x448
	Size: 0x24
	Parameters: 1
	Flags: Linked, Private
*/
function private localclient_connect(localclientnum)
{
	level thread player_splatter(localclientnum);
}

/*
	Name: function_e79ccfd8
	Namespace: blood
	Checksum: 0x41D65836
	Offset: 0x478
	Size: 0x1FC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_e79ccfd8(localclientnum)
{
	if(!self function_21c0fa55())
	{
		return;
	}
	if(function_148ccc79(localclientnum, #"hash_73c750f53749d44d"))
	{
		codestoppostfxbundlelocal(localclientnum, #"hash_73c750f53749d44d");
	}
	self.pstfx_blood = #"hash_44dcb6ac5e8787e0";
	self.wound_rob = "rob_wound_blood_splatter";
	self.var_82dad7be = self battlechatter::get_player_dialog_alias("exertBreatheHurt");
	function_6deee27e(localclientnum);
	function_162fe6ec(localclientnum);
	self.var_9861062 = 0;
	if(isdefined(level.blood.soundhandle))
	{
		function_d48752e(localclientnum, level.blood.soundhandle);
		level.blood.soundhandle = undefined;
	}
	level thread wait_game_ended(localclientnum);
	if(self function_d2cb869e("rob_wound_blood_splatter"))
	{
		self stoprenderoverridebundle("rob_wound_blood_splatter");
	}
	if(self function_d2cb869e("rob_wound_blood_splatter_reaper"))
	{
		self stoprenderoverridebundle("rob_wound_blood_splatter_reaper");
	}
	self thread function_87544c4a(localclientnum);
	self thread function_493a8fbc(localclientnum);
}

/*
	Name: setcontrollerlightbarcolorpulsing
	Namespace: blood
	Checksum: 0xA4857416
	Offset: 0x680
	Size: 0xB4
	Parameters: 3
	Flags: Linked, Private
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
	Checksum: 0x1991BEE0
	Offset: 0x740
	Size: 0x3C
	Parameters: 1
	Flags: Linked, Private
*/
function private enter_critical_health(localclientnum)
{
	self thread play_critical_health_rumble(localclientnum);
	self thread play_breath(localclientnum);
}

/*
	Name: play_critical_health_rumble
	Namespace: blood
	Checksum: 0x5BB08F4D
	Offset: 0x788
	Size: 0x158
	Parameters: 1
	Flags: Linked, Private
*/
function private play_critical_health_rumble(localclientnum)
{
	self endon(#"death", #"disconnect", #"critical_health_end", #"spawned");
	var_cf155b98 = "new_health_stage_critical";
	while(true)
	{
		self waittill(#"pulse_blood");
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
	Checksum: 0x4F41A6C
	Offset: 0x8E8
	Size: 0x10E
	Parameters: 1
	Flags: Linked, Private
*/
function private play_breath(localclientnum)
{
	self endon(#"death", #"disconnect", #"game_ended", #"critical_health_end");
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
	Checksum: 0x6E7060C3
	Offset: 0xA00
	Size: 0xB8
	Parameters: 1
	Flags: Linked, Private
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
	Checksum: 0x794B04EB
	Offset: 0xAC0
	Size: 0x1FC
	Parameters: 2
	Flags: Linked, Private
*/
function private function_f192f00b(localclientnum, rob)
{
	self notify("433b6fd240a3a61");
	self endon("433b6fd240a3a61");
	self endon(#"death");
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
		self stoprenderoverridebundle(rob);
	}
}

/*
	Name: ramprobsetting
	Namespace: blood
	Checksum: 0xC9C42616
	Offset: 0xCC8
	Size: 0x94
	Parameters: 5
	Flags: Linked
*/
function ramprobsetting(localclientnum, from, to, ramptime, key)
{
	self endon(#"death");
	self notify("rampROBsetting" + key);
	self endon("rampROBsetting" + key);
	util::lerp_generic(localclientnum, ramptime, &function_1126eb8c, from, to, key, self.wound_rob);
}

/*
	Name: function_1126eb8c
	Namespace: blood
	Checksum: 0xDF456EF6
	Offset: 0xD68
	Size: 0xC4
	Parameters: 8
	Flags: Linked
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
	Checksum: 0xA12E9F3E
	Offset: 0xE38
	Size: 0x2DC
	Parameters: 2
	Flags: Linked
*/
function function_672c739(localclientnum, shockrifle)
{
	if(is_true(shockrifle))
	{
		function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_1e551ab82e5c6703", 0.9);
		function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aee96c75fe05d39", 4);
		function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aeea9c75fe07d82", 4);
		function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aeea6c75fe07869", 4);
	}
	else
	{
		if(util::function_2c435484())
		{
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_1e551ab82e5c6703", 1);
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aee96c75fe05d39", 0.15);
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aeea9c75fe07d82", 0.13);
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aeea6c75fe07869", 0.24);
		}
		else
		{
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_1e551ab82e5c6703", 1);
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aee96c75fe05d39", 0.3);
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aeea9c75fe07d82", 0.025);
			function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"hash_2aeea6c75fe07869", 0);
		}
	}
}

/*
	Name: function_27d3ba05
	Namespace: blood
	Checksum: 0xF49F447B
	Offset: 0x1120
	Size: 0x90
	Parameters: 1
	Flags: Linked, Private
*/
function private function_27d3ba05(localclientnum)
{
	if(function_92beaa28(localclientnum) && !function_d17ae3cc(localclientnum))
	{
		return false;
	}
	if(squad_spawn::function_21b773d5(localclientnum) === 1)
	{
		return false;
	}
	if(level.var_4ecf5754 === #"silent_film")
	{
		return false;
	}
	return true;
}

/*
	Name: function_47d0632f
	Namespace: blood
	Checksum: 0x933ECBD4
	Offset: 0x11B8
	Size: 0xBC
	Parameters: 5
	Flags: Linked, Private
*/
function private function_47d0632f(localclientnum, damage, death, dot, shockrifle)
{
	if(function_27d3ba05(localclientnum))
	{
		splatter = getsplatter(localclientnum);
		splatter.shockrifle = shockrifle;
		splatter.var_120a7b2c++;
		var_cd141ca2 = splatter.var_120a7b2c % 4;
		level thread splatter_postfx(localclientnum, self, damage, var_cd141ca2, death, dot);
	}
}

/*
	Name: update_damage_effects
	Namespace: blood
	Checksum: 0x44E8ED
	Offset: 0x1280
	Size: 0xF4
	Parameters: 3
	Flags: Linked, Private
*/
function private update_damage_effects(localclientnum, damage, death)
{
	if(codcaster::function_b8fe9b52(localclientnum))
	{
		return;
	}
	/#
		assert(damage > 0);
	#/
	if(damage < 10 && is_true(self.dot_no_splatter))
	{
		self.dot_no_splatter = 0;
	}
	else
	{
		if(self.dot_damaged === 1)
		{
			function_47d0632f(localclientnum, damage, death, 1, 0);
			self.dot_damaged = 0;
		}
		else
		{
			function_47d0632f(localclientnum, damage, death, 0, 0);
		}
	}
}

/*
	Name: player_splatter
	Namespace: blood
	Checksum: 0x37AB0AA7
	Offset: 0x1420
	Size: 0x32A
	Parameters: 1
	Flags: Linked, Private
*/
function private player_splatter(localclientnum)
{
	level notify("player_splatter" + localclientnum);
	level endon("player_splatter" + localclientnum);
	while(true)
	{
		level waittill(#"splatters_active");
		splatter = getsplatter(localclientnum);
		splatters = splatter.splatters;
		while(true)
		{
			blur = 0;
			opacity = 0;
			for(i = 0; i < 4; i++)
			{
				if(splatters[i][#"blur amount"] > blur)
				{
					blur = splatters[i][#"blur amount"];
				}
				if(splatters[i][#"opacity"] > opacity)
				{
					opacity = splatters[i][#"opacity"];
				}
			}
			if(opacity > 0 || blur > 0)
			{
				local_player = function_5c10bd79(localclientnum);
				if(isdefined(local_player))
				{
					splatter.var_9e4cc220 = 1;
					if(!local_player function_d2cb869e(#"hash_73c750f53749d44d"))
					{
						function_a837926b(localclientnum, #"hash_73c750f53749d44d");
					}
					if(local_player function_d2cb869e(#"hash_73c750f53749d44d"))
					{
						function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"blur amount", blur);
						if(is_true(splatter.shockrifle))
						{
							opacity = opacity * 0.05;
						}
						function_4238734d(localclientnum, #"hash_73c750f53749d44d", #"opacity", opacity);
						function_672c739(localclientnum, splatter.shockrifle);
					}
				}
			}
			else
			{
				if(is_true(splatter.var_9e4cc220))
				{
					splatter.var_9e4cc220 = 0;
					if(function_148ccc79(localclientnum, #"hash_73c750f53749d44d"))
					{
						codestoppostfxbundlelocal(localclientnum, #"hash_73c750f53749d44d");
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
	Checksum: 0xD4820180
	Offset: 0x1758
	Size: 0xAA
	Parameters: 3
	Flags: Linked, Private
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
	Checksum: 0xBEBBDC76
	Offset: 0x1810
	Size: 0x3E4
	Parameters: 6
	Flags: Linked, Private
*/
function private splatter_postfx(localclientnum, player, damage, var_cd141ca2, death, dot)
{
	notify_event = (localclientnum + "splatter_postfx") + var_cd141ca2;
	level notify(notify_event);
	level endon(notify_event);
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
		var_de10c136 = level.blood.var_de10c136;
		var_813d0fe9 = level.blood.scriptbundle.var_3e1e9389 - 1;
		for(i = var_de10c136.damage_ranges - 1; i >= 0; i--)
		{
			if(damage > var_de10c136.range[i].start || (death && var_813d0fe9 == i))
			{
				blur = var_de10c136.range[i].blur;
				opacity = var_de10c136.range[i].opacity;
				var_587ce5b0 = var_de10c136.var_587ce5b0[i];
				var_49774f1 = var_de10c136.var_49774f1[i];
				hold_time = var_de10c136.hold_time[i];
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
	if(blur == 0)
	{
		level thread function_23901270(localclientnum, var_587ce5b0, var_cd141ca2, 0, opacity);
		wait((float(var_587ce5b0 + hold_time)) / 1000);
		level thread function_23901270(localclientnum, var_49774f1, var_cd141ca2, opacity, 0);
	}
	else
	{
		level thread function_90064049(localclientnum, var_587ce5b0, var_cd141ca2, 0, opacity, 0, blur);
		wait((float(var_587ce5b0 + hold_time)) / 1000);
		level thread function_90064049(localclientnum, var_49774f1, var_cd141ca2, opacity, 0, blur, 0);
	}
}

/*
	Name: function_23901270
	Namespace: blood
	Checksum: 0x8682ED37
	Offset: 0x1C00
	Size: 0x2E0
	Parameters: 5
	Flags: Linked
*/
function function_23901270(localclientnum, ramptime, var_cd141ca2, var_9f153e5b, var_a3c5be40)
{
	notify_event = (localclientnum + "rampSplatterValue") + var_cd141ca2;
	level notify(notify_event);
	level endon(notify_event);
	localplayer = function_5c10bd79(localclientnum);
	if(!isdefined(localplayer))
	{
		return;
	}
	starttime = localplayer getclienttime();
	var_d183f050 = getservertime(localclientnum);
	currenttime = starttime;
	elapsedtime = 0;
	var_6dc11453 = getsplatter(localclientnum);
	var_9cdbd967 = &var_6dc11453.splatters[var_cd141ca2];
	var_484d4e48 = var_a3c5be40 > 0 && var_9f153e5b == 0;
	var_e04a3690 = 0;
	while(elapsedtime < ramptime)
	{
		percent = 1;
		if(ramptime > 0)
		{
			percent = elapsedtime / ramptime;
		}
		var_a2f77259 = 1 - percent;
		var_3a331087 = (var_a3c5be40 * percent) + (var_9f153e5b * var_a2f77259);
		send_notify = var_484d4e48 && var_3a331087 > 0 && var_9cdbd967[#"opacity"] == 0;
		var_9cdbd967[#"opacity"] = var_3a331087;
		if(send_notify)
		{
			level notify(#"splatters_active");
			var_e04a3690 = 1;
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
	var_9cdbd967[#"opacity"] = var_a3c5be40;
	if(var_484d4e48 && !var_e04a3690)
	{
		level notify(#"splatters_active");
	}
}

/*
	Name: function_90064049
	Namespace: blood
	Checksum: 0xEE856171
	Offset: 0x1EE8
	Size: 0x378
	Parameters: 7
	Flags: Linked
*/
function function_90064049(localclientnum, ramptime, var_cd141ca2, var_9f153e5b, var_a3c5be40, var_1f06be44, var_b19159d7)
{
	notify_event = (localclientnum + "rampSplatterValue") + var_cd141ca2;
	level notify(notify_event);
	level endon(notify_event);
	localplayer = function_5c10bd79(localclientnum);
	if(!isdefined(localplayer))
	{
		return;
	}
	starttime = localplayer getclienttime();
	var_d183f050 = getservertime(localclientnum);
	currenttime = starttime;
	elapsedtime = 0;
	var_6dc11453 = getsplatter(localclientnum);
	var_9cdbd967 = var_6dc11453.splatters[var_cd141ca2];
	var_484d4e48 = var_a3c5be40 > 0 && var_9f153e5b == 0 || (var_b19159d7 > 0 && var_1f06be44 == 0);
	var_e04a3690 = 0;
	while(elapsedtime < ramptime)
	{
		percent = 1;
		if(ramptime > 0)
		{
			percent = elapsedtime / ramptime;
		}
		var_a2f77259 = 1 - percent;
		var_3a331087 = (var_a3c5be40 * percent) + (var_9f153e5b * var_a2f77259);
		var_85322688 = (var_b19159d7 * percent) + (var_1f06be44 * var_a2f77259);
		send_notify = var_484d4e48 && (var_3a331087 > 0 && var_9cdbd967[#"opacity"] == 0 || (var_85322688 > 0 && var_9cdbd967[#"blur amount"] == 0));
		var_9cdbd967[#"opacity"] = var_3a331087;
		var_9cdbd967[#"blur amount"] = var_85322688;
		if(send_notify)
		{
			level notify(#"splatters_active");
			var_e04a3690 = 1;
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
	var_9cdbd967[#"opacity"] = var_a3c5be40;
	var_9cdbd967[#"blur amount"] = var_b19159d7;
	if(var_484d4e48 && !var_e04a3690)
	{
		level notify(#"splatters_active");
	}
}

/*
	Name: player_base_health
	Namespace: blood
	Checksum: 0x29F8777B
	Offset: 0x2268
	Size: 0x6A
	Parameters: 0
	Flags: Linked, Private
*/
function private player_base_health()
{
	if(isdefined(self.var_ee9b8af0))
	{
		return self.var_ee9b8af0;
	}
	if(!self function_700ca4f5())
	{
		return 150;
	}
	return self getplayerspawnhealth() + (isdefined(level.var_90bb9821) ? level.var_90bb9821 : 0);
}

/*
	Name: function_55d01d42
	Namespace: blood
	Checksum: 0xF6E7FEFF
	Offset: 0x22E0
	Size: 0x13A
	Parameters: 0
	Flags: Linked, Private
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
		self.pstfx_blood = #"hash_21152915158b09dd";
		self.wound_rob = "rob_wound_blood_splatter_reaper";
	}
	else
	{
		if(util::is_mature())
		{
			self.pstfx_blood = #"hash_263a0659c7ff81ad";
			self.wound_rob = "rob_wound_blood_splatter";
		}
		else
		{
			self.pstfx_blood = #"hash_44dcb6ac5e8787e0";
			self.wound_rob = "rob_wound_blood_splatter";
		}
	}
}

/*
	Name: function_87544c4a
	Namespace: blood
	Checksum: 0x3FF97F16
	Offset: 0x2428
	Size: 0x346
	Parameters: 1
	Flags: Linked, Private
*/
function private function_87544c4a(localclientnum)
{
	self endon(#"death", #"disconnect");
	if(!isdefined(self.blood_enabled))
	{
		self.blood_enabled = 0;
	}
	self util::function_6d0694af();
	basehealth = player_base_health();
	priorplayerhealth = renderhealthoverlayhealth(localclientnum, (isdefined(self.prop) ? 0 : basehealth));
	var_a234f6c2 = basehealth * priorplayerhealth;
	var_406028bf = var_a234f6c2;
	var_4cdccc55 = util::is_mature();
	self function_55d01d42();
	self thread function_8d8880(localclientnum);
	while(true)
	{
		forceupdate = 0;
		if(util::is_mature() != var_4cdccc55)
		{
			forceupdate = 1;
			self function_436ee4c2(localclientnum, #"hash_263a0659c7ff81ad");
			self function_436ee4c2(localclientnum, #"hash_44dcb6ac5e8787e0");
			var_4cdccc55 = util::is_mature();
			self function_55d01d42();
		}
		if(renderhealthoverlay(localclientnum))
		{
			basehealth = player_base_health();
			playerhealth = renderhealthoverlayhealth(localclientnum, (isdefined(self.prop) ? 0 : basehealth));
			if(playerhealth != priorplayerhealth)
			{
				var_406028bf = basehealth * playerhealth;
				if(var_a234f6c2 > var_406028bf)
				{
					update_damage_effects(localclientnum, var_a234f6c2 - var_406028bf, playerhealth == 0);
				}
			}
			if(playerhealth < 1)
			{
				if(!self.blood_enabled)
				{
					self function_70299400(localclientnum);
				}
			}
			else if(self.blood_enabled)
			{
				self function_436ee4c2(localclientnum, self.pstfx_blood);
			}
			function_9a8dc0ec(localclientnum, var_406028bf, var_a234f6c2, forceupdate);
			if(playerhealth != priorplayerhealth)
			{
				priorplayerhealth = playerhealth;
				var_a234f6c2 = var_406028bf;
			}
		}
		else if(self.blood_enabled)
		{
			self function_436ee4c2(localclientnum, self.pstfx_blood);
		}
		waitframe(1);
	}
}

/*
	Name: function_8d8880
	Namespace: blood
	Checksum: 0x37E7E531
	Offset: 0x2778
	Size: 0x22A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_8d8880(localclientnum)
{
	self endon(#"death", #"disconnect");
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
				self notify(#"pulse_blood");
				self thread function_c0cdd1f2(localclientnum, 0, 1, level.blood.var_f2de135e.var_562c41de[pulse], #"hash_152dbb4add22b951", self.pstfx_blood);
				wait(float(level.blood.var_f2de135e.var_562c41de[pulse]) / 1000);
				wait(float(level.blood.var_f2de135e.var_18f673f1[pulse]) / 1000);
				self thread function_c0cdd1f2(localclientnum, 1, 0, level.blood.var_f2de135e.var_92fc0d45[pulse], #"hash_152dbb4add22b951", self.pstfx_blood);
				wait(float(level.blood.var_f2de135e.var_92fc0d45[pulse]) / 1000);
				wait(float(level.blood.var_f2de135e.var_5b5500f7[pulse]) / 1000);
			}
		}
	}
}

/*
	Name: function_493a8fbc
	Namespace: blood
	Checksum: 0xA0C9F380
	Offset: 0x29B0
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private function_493a8fbc(localclientnum)
{
	self waittill(#"death");
	self function_436ee4c2(localclientnum, self.pstfx_blood);
}

/*
	Name: function_62b7e00d
	Namespace: blood
	Checksum: 0x2D0D702B
	Offset: 0x2A00
	Size: 0x11E
	Parameters: 1
	Flags: Linked, Private
*/
function private function_62b7e00d(localclientnum)
{
	if(isdefined(level.blood.soundhandle))
	{
		return;
	}
	if(util::get_game_type() === #"doa")
	{
		return;
	}
	level.blood.soundhandle = function_604c9983(localclientnum, level.blood.var_d8dc9013);
	waitresult = undefined;
	waitresult = self waittill(#"death", #"disconnect", #"critical_health_end");
	if(isdefined(level.blood.soundhandle))
	{
		function_d48752e(localclientnum, level.blood.soundhandle);
		level.blood.soundhandle = undefined;
	}
}

/*
	Name: function_e91b92e2
	Namespace: blood
	Checksum: 0xACAA9250
	Offset: 0x2B28
	Size: 0x1B6
	Parameters: 4
	Flags: Linked, Private
*/
function private function_e91b92e2(localclientnum, new_blood_stage, prior_blood_stage, playerhealth)
{
	if(prior_blood_stage == 4)
	{
		self.var_9861062 = 1;
		self enter_critical_health(new_blood_stage);
		if(is_true(self.blood_enabled))
		{
			self function_116b95e5(self.pstfx_blood, #"hash_152dbb4add22b951", 1);
		}
		if(playerhealth > 0)
		{
			playsound(new_blood_stage, level.blood.var_8691ed16, (0, 0, 0));
			self thread function_62b7e00d(new_blood_stage);
		}
	}
	else if(self.var_9861062)
	{
		if(isdefined(level.blood.soundhandle))
		{
			if(playerhealth > 0)
			{
				playsound(new_blood_stage, level.blood.var_dad052de, (0, 0, 0));
			}
		}
		self.var_9861062 = 0;
		if(is_true(self.blood_enabled))
		{
			self function_116b95e5(self.pstfx_blood, #"hash_152dbb4add22b951", 0);
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
	Checksum: 0x19FF6116
	Offset: 0x2CE8
	Size: 0xCC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_56419db8(stage)
{
	var_f2de135e = level.blood.var_f2de135e;
	for(pulse = 0; pulse < 2; pulse++)
	{
		var_f2de135e.var_562c41de[pulse] = var_f2de135e.time_in[pulse][stage];
		var_f2de135e.var_18f673f1[pulse] = var_f2de135e.var_a79aba98[pulse][stage];
		var_f2de135e.var_92fc0d45[pulse] = var_f2de135e.time_out[pulse][stage];
		var_f2de135e.var_5b5500f7[pulse] = var_f2de135e.var_97aa6fd2[pulse][stage];
	}
}

/*
	Name: play_new_stage_rumble
	Namespace: blood
	Checksum: 0x30DD4B9C
	Offset: 0x2DC0
	Size: 0x7C
	Parameters: 1
	Flags: Linked, Private
*/
function private play_new_stage_rumble(localclientnum)
{
	self endon(#"death", #"disconnect");
	for(i = 0; i < 2; i++)
	{
		self playrumbleonentity(localclientnum, "new_health_stage");
		wait(0.4);
	}
}

/*
	Name: function_5a719e5
	Namespace: blood
	Checksum: 0xE99A78BB
	Offset: 0x2E48
	Size: 0x44
	Parameters: 3
	Flags: Linked, Private
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
	Name: update_lightbar
	Namespace: blood
	Checksum: 0xA3BE4029
	Offset: 0x2E98
	Size: 0x1BC
	Parameters: 3
	Flags: Linked, Private
*/
function private update_lightbar(localclientnum, new_blood_stage, prior_blood_stage)
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
	Checksum: 0xF527CB1E
	Offset: 0x3060
	Size: 0x27A
	Parameters: 4
	Flags: Linked, Private
*/
function private function_9a8dc0ec(localclientnum, playerhealth, priorplayerhealth, forceupdate)
{
	if(!isdefined(self.last_blood_stage))
	{
		self.last_blood_stage = 0;
	}
	prior_blood_stage = self.last_blood_stage;
	new_blood_stage = 0;
	if(!is_true(self.nobloodoverlay))
	{
		if(playerhealth > 0)
		{
			if(playerhealth == priorplayerhealth)
			{
				new_blood_stage = prior_blood_stage;
			}
			else if(playerhealth <= level.blood.threshold[1])
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
	}
	self update_lightbar(localclientnum, new_blood_stage, prior_blood_stage);
	if(new_blood_stage != prior_blood_stage || forceupdate)
	{
		ramptime = (prior_blood_stage > new_blood_stage ? level.blood.var_49774f1 : level.blood.var_587ce5b0);
		self thread function_8fe966f4(localclientnum, prior_blood_stage, new_blood_stage, ramptime, self.pstfx_blood);
		if(is_true(self.blood_enabled))
		{
			self function_116b95e5(self.pstfx_blood, #"blood boost", level.blood.blood_boost[new_blood_stage]);
		}
		self function_56419db8(new_blood_stage);
		self function_5a719e5(localclientnum, new_blood_stage, prior_blood_stage);
		self function_e91b92e2(localclientnum, new_blood_stage, prior_blood_stage, playerhealth);
	}
	self.last_blood_stage = new_blood_stage;
}

/*
	Name: function_8fe966f4
	Namespace: blood
	Checksum: 0x2E75E20B
	Offset: 0x32E8
	Size: 0x684
	Parameters: 5
	Flags: Linked
*/
function function_8fe966f4(localclientnum, var_bfd952c7, new_stage, ramptime, postfx)
{
	self endon(#"death", #"hash_6d50f64fe99aed76");
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
			self function_116b95e5(postfx, #"fade", (level.blood.fade[var_bfd952c7] * var_3198c720) + (level.blood.fade[new_stage] * new_percent));
			self function_116b95e5(postfx, #"opacity", (level.blood.opacity[var_bfd952c7] * var_3198c720) + (level.blood.opacity[new_stage] * new_percent));
			self function_116b95e5(postfx, #"hash_4719d5a85c54db22", (level.blood.var_4c8629ad[var_bfd952c7] * var_3198c720) + (level.blood.var_4c8629ad[new_stage] * new_percent));
			self function_116b95e5(postfx, #"hash_703cc9e25857079", (level.blood.var_ea220db3[var_bfd952c7] * var_3198c720) + (level.blood.var_ea220db3[new_stage] * new_percent));
			self function_116b95e5(postfx, #"blur", (level.blood.blur[var_bfd952c7] * var_3198c720) + (level.blood.blur[new_stage] * new_percent));
			if(var_e9d8aaf5)
			{
				self function_116b95e5(postfx, #"refraction", (level.blood.refraction[var_bfd952c7] * var_3198c720) + (level.blood.refraction[new_stage] * new_percent));
			}
			if(var_5831bf35)
			{
				self function_116b95e5(postfx, #"desaturation", (level.blood.desaturation[var_bfd952c7] * var_3198c720) + (level.blood.desaturation[new_stage] * new_percent));
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
		self function_116b95e5(postfx, #"fade", level.blood.fade[new_stage]);
		self function_116b95e5(postfx, #"opacity", level.blood.opacity[new_stage]);
		self function_116b95e5(postfx, #"hash_4719d5a85c54db22", level.blood.var_4c8629ad[new_stage]);
		self function_116b95e5(postfx, #"hash_703cc9e25857079", level.blood.var_ea220db3[new_stage]);
		self function_116b95e5(postfx, #"blur", level.blood.blur[new_stage]);
		if(var_e9d8aaf5)
		{
			self function_116b95e5(postfx, #"refraction", level.blood.refraction[new_stage]);
		}
		if(var_5831bf35)
		{
			self function_116b95e5(postfx, #"desaturation", level.blood.desaturation[new_stage]);
		}
	}
}

/*
	Name: function_c0cdd1f2
	Namespace: blood
	Checksum: 0x2DB30A90
	Offset: 0x3978
	Size: 0x22C
	Parameters: 6
	Flags: Linked
*/
function function_c0cdd1f2(localclientnum, var_2347e08e, var_991d3376, ramptime, key, postfx)
{
	self endon(#"death", #"hash_6d50f64fe99aed76");
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
		if(is_true(self.blood_enabled))
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
	if(is_true(self.blood_enabled))
	{
		self function_116b95e5(postfx, key, var_991d3376);
	}
}

/*
	Name: function_70299400
	Namespace: blood
	Checksum: 0x9399DF30
	Offset: 0x3BB0
	Size: 0x74
	Parameters: 1
	Flags: Linked, Private
*/
function private function_70299400(localclientnum)
{
	if(level.var_4ecf5754 === #"silent_film")
	{
		return;
	}
	self.blood_enabled = 1;
	if(!self function_d2cb869e(self.pstfx_blood))
	{
		self codeplaypostfxbundle(self.pstfx_blood);
	}
}

/*
	Name: function_436ee4c2
	Namespace: blood
	Checksum: 0x8A9AFB95
	Offset: 0x3C30
	Size: 0x18C
	Parameters: 2
	Flags: Linked, Private
*/
function private function_436ee4c2(localclientnum, pstfx_blood)
{
	self notify(#"hash_6d50f64fe99aed76");
	if(isdefined(self))
	{
		if(self function_d2cb869e(pstfx_blood))
		{
			self codestoppostfxbundle(pstfx_blood);
		}
		if(self function_d2cb869e(#"hash_73c750f53749d44d"))
		{
			self codestoppostfxbundle(#"hash_73c750f53749d44d");
		}
		self.blood_enabled = 0;
	}
	else
	{
		if(function_148ccc79(localclientnum, pstfx_blood))
		{
			codestoppostfxbundlelocal(localclientnum, pstfx_blood);
		}
		if(function_148ccc79(localclientnum, #"hash_73c750f53749d44d"))
		{
			codestoppostfxbundlelocal(localclientnum, #"hash_73c750f53749d44d");
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
	Name: function_22302b4b
	Namespace: blood
	Checksum: 0x65A51987
	Offset: 0x3DC8
	Size: 0x1B46
	Parameters: 0
	Flags: Linked, Private
*/
function private function_22302b4b()
{
	level.blood = spawnstruct();
	if(isdefined(level.var_9c5e7d9))
	{
		level.blood.scriptbundle = getscriptbundle(level.var_9c5e7d9);
	}
	else
	{
		if(sessionmodeiswarzonegame())
		{
			level.blood.scriptbundle = getscriptbundle("wz_blood_settings");
		}
		else
		{
			level.blood.scriptbundle = (getgametypesetting(#"hardcoremode") ? getscriptbundle("hardcore_blood_settings") : getscriptbundle("blood_settings"));
		}
	}
	/#
		assert(isdefined(level.blood.scriptbundle));
	#/
	if(!isdefined(level.blood.var_e9d8aaf5))
	{
		level.blood.var_e9d8aaf5 = (isdefined(level.blood.scriptbundle.var_e9d8aaf5) ? level.blood.scriptbundle.var_e9d8aaf5 : 0);
	}
	level.blood.refraction = [];
	if(!isdefined(level.blood.refraction[0]))
	{
		level.blood.refraction[0] = (isdefined(level.blood.scriptbundle.var_9e65e691) ? level.blood.scriptbundle.var_9e65e691 : 0);
	}
	if(!isdefined(level.blood.refraction[1]))
	{
		level.blood.refraction[1] = (isdefined(level.blood.scriptbundle.var_49ddbdf6) ? level.blood.scriptbundle.var_49ddbdf6 : 0);
	}
	if(!isdefined(level.blood.refraction[2]))
	{
		level.blood.refraction[2] = (isdefined(level.blood.scriptbundle.var_83022fca) ? level.blood.scriptbundle.var_83022fca : 0);
	}
	if(!isdefined(level.blood.refraction[3]))
	{
		level.blood.refraction[3] = (isdefined(level.blood.scriptbundle.var_90b9cb39) ? level.blood.scriptbundle.var_90b9cb39 : 0);
	}
	if(!isdefined(level.blood.refraction[4]))
	{
		level.blood.refraction[4] = (isdefined(level.blood.scriptbundle.var_e790f8e6) ? level.blood.scriptbundle.var_e790f8e6 : 0);
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
	level.blood.blood_boost = [];
	if(!isdefined(level.blood.blood_boost[0]))
	{
		level.blood.blood_boost[0] = (isdefined(level.blood.scriptbundle.var_fd86eebc) ? level.blood.scriptbundle.var_fd86eebc : 0);
	}
	if(!isdefined(level.blood.blood_boost[1]))
	{
		level.blood.blood_boost[1] = (isdefined(level.blood.scriptbundle.var_e741c232) ? level.blood.scriptbundle.var_e741c232 : 0);
	}
	if(!isdefined(level.blood.blood_boost[2]))
	{
		level.blood.blood_boost[2] = (isdefined(level.blood.scriptbundle.var_e11b35e5) ? level.blood.scriptbundle.var_e11b35e5 : 0);
	}
	if(!isdefined(level.blood.blood_boost[3]))
	{
		level.blood.blood_boost[3] = (isdefined(level.blood.scriptbundle.var_cadf096d) ? level.blood.scriptbundle.var_cadf096d : 0);
	}
	if(!isdefined(level.blood.blood_boost[4]))
	{
		level.blood.blood_boost[4] = (isdefined(level.blood.scriptbundle.var_c3ad7b0a) ? level.blood.scriptbundle.var_c3ad7b0a : 0);
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
	level.blood.rob = spawnstruct();
	if(!isdefined(level.blood.rob.stage))
	{
		level.blood.rob.stage = (isdefined(level.blood.scriptbundle.rob_stage) ? level.blood.scriptbundle.rob_stage : 0);
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
	Name: function_6deee27e
	Namespace: blood
	Checksum: 0x2D1A41F5
	Offset: 0x5918
	Size: 0x6A
	Parameters: 1
	Flags: Linked, Private
*/
function private function_6deee27e(localclientnum)
{
	level notify(localclientnum + "splatter_postfx");
	notify_event = localclientnum + "rampSplatterValue";
	for(i = 0; i < 4; i++)
	{
		level notify(notify_event + i);
	}
}

/*
	Name: function_162fe6ec
	Namespace: blood
	Checksum: 0x52018F9F
	Offset: 0x5990
	Size: 0x152
	Parameters: 1
	Flags: Linked, Private
*/
function private function_162fe6ec(localclientnum)
{
	splatter = getsplatter(localclientnum);
	if(!isdefined(splatter))
	{
		splatter = spawnstruct();
		splatter.splatters = [];
		if(!isdefined(level.blood.var_de10c136.var_51036e02))
		{
			level.blood.var_de10c136.var_51036e02 = [];
		}
		level.blood.var_de10c136.var_51036e02[localclientnum] = splatter;
	}
	for(j = 0; j < 4; j++)
	{
		if(!isdefined(splatter.splatters[j]))
		{
			splatter.splatters[j] = [];
		}
		splatter.splatters[j][#"blur amount"] = 0;
		splatter.splatters[j][#"opacity"] = 0;
	}
	splatter.var_120a7b2c = 0;
	splatter.var_90495387 = undefined;
}

/*
	Name: function_b0e51f43
	Namespace: blood
	Checksum: 0x8C3D046B
	Offset: 0x5AF0
	Size: 0xB5A
	Parameters: 0
	Flags: Linked, Private
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
	if(!isdefined(level.blood.var_de10c136.damage_ranges))
	{
		level.blood.var_de10c136.damage_ranges = (isdefined(level.blood.scriptbundle.damage_ranges) ? level.blood.scriptbundle.damage_ranges : 1);
	}
	if(!isdefined(level.blood.var_de10c136.var_3e1e9389))
	{
		level.blood.var_de10c136.var_3e1e9389 = (isdefined(level.blood.scriptbundle.var_3e1e9389) ? level.blood.scriptbundle.var_3e1e9389 : 1);
	}
	level.blood.var_de10c136.range = [];
	level.blood.var_de10c136.var_587ce5b0 = [];
	level.blood.var_de10c136.var_49774f1 = [];
	level.blood.var_de10c136.hold_time = [];
	for(i = 0; i < level.blood.var_de10c136.damage_ranges; i++)
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
	Checksum: 0x55698F8D
	Offset: 0x6658
	Size: 0x1B30
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f50652a9()
{
	level.blood.var_f2de135e = spawnstruct();
	level.blood.var_f2de135e.time_in = [];
	level.blood.var_f2de135e.var_a79aba98 = [];
	level.blood.var_f2de135e.time_out = [];
	level.blood.var_f2de135e.var_97aa6fd2 = [];
	level.blood.var_f2de135e.var_562c41de = [];
	level.blood.var_f2de135e.var_18f673f1 = [];
	level.blood.var_f2de135e.var_92fc0d45 = [];
	level.blood.var_f2de135e.var_5b5500f7 = [];
	level.blood.var_f2de135e.time_in[0] = [];
	if(!isdefined(level.blood.var_f2de135e.time_in[0][0]))
	{
		level.blood.var_f2de135e.time_in[0][0] = (isdefined(level.blood.scriptbundle.var_b3272558) ? level.blood.scriptbundle.var_b3272558 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[0][1]))
	{
		level.blood.var_f2de135e.time_in[0][1] = (isdefined(level.blood.scriptbundle.var_d014df1f) ? level.blood.scriptbundle.var_d014df1f : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[0][2]))
	{
		level.blood.var_f2de135e.time_in[0][2] = (isdefined(level.blood.scriptbundle.var_bdca3a8a) ? level.blood.scriptbundle.var_bdca3a8a : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[0][3]))
	{
		level.blood.var_f2de135e.time_in[0][3] = (isdefined(level.blood.scriptbundle.var_ab891608) ? level.blood.scriptbundle.var_ab891608 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[0][4]))
	{
		level.blood.var_f2de135e.time_in[0][4] = (isdefined(level.blood.scriptbundle.var_996371bd) ? level.blood.scriptbundle.var_996371bd : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_562c41de[0]))
	{
		level.blood.var_f2de135e.var_562c41de[0] = level.blood.var_f2de135e.time_in[0][0];
	}
	level.blood.var_f2de135e.time_in[1] = [];
	if(!isdefined(level.blood.var_f2de135e.time_in[1][0]))
	{
		level.blood.var_f2de135e.time_in[1][0] = (isdefined(level.blood.scriptbundle.var_8623b2d2) ? level.blood.scriptbundle.var_8623b2d2 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[1][1]))
	{
		level.blood.var_f2de135e.time_in[1][1] = (isdefined(level.blood.scriptbundle.var_7862174f) ? level.blood.scriptbundle.var_7862174f : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[1][2]))
	{
		level.blood.var_f2de135e.time_in[1][2] = (isdefined(level.blood.scriptbundle.var_d2b4cbf3) ? level.blood.scriptbundle.var_d2b4cbf3 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[1][3]))
	{
		level.blood.var_f2de135e.time_in[1][3] = (isdefined(level.blood.scriptbundle.var_bcf6a077) ? level.blood.scriptbundle.var_bcf6a077 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.time_in[1][4]))
	{
		level.blood.var_f2de135e.time_in[1][4] = (isdefined(level.blood.scriptbundle.var_af1f04c8) ? level.blood.scriptbundle.var_af1f04c8 : 0);
	}
	if(!isdefined(level.blood.var_f2de135e.var_562c41de[1]))
	{
		level.blood.var_f2de135e.var_562c41de[1] = level.blood.var_f2de135e.time_in[1][0];
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

