#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace oob;

/*
	Name: function_89f2df9
	Namespace: oob
	Checksum: 0x9E534645
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"out_of_bounds", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: oob
	Checksum: 0xB1C44E27
	Offset: 0x130
	Size: 0x2B4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(sessionmodeismultiplayergame())
	{
		level.var_dcb68d74 = 1;
		level.oob_timelimit_ms = getdvarint(#"oob_timelimit_ms", 3000);
		level.oob_timekeep_ms = getdvarint(#"oob_timekeep_ms", 3000);
	}
	else
	{
		if(function_f99d2668())
		{
			level.var_dcb68d74 = 1;
			level.oob_timelimit_ms = getdvarint(#"oob_timelimit_ms", 10000);
			level.oob_timekeep_ms = getdvarint(#"oob_timekeep_ms", 3000);
		}
		else
		{
			if(sessionmodeiscampaigngame())
			{
				level.var_dcb68d74 = 0;
				level.oob_timelimit_ms = getdvarint(#"oob_timelimit_ms", 6000);
			}
			else
			{
				level.var_dcb68d74 = 1;
				level.oob_timelimit_ms = getdvarint(#"oob_timelimit_ms", 6000);
			}
		}
	}
	clientfield::register("toplayer", "out_of_bounds", 1, 5, "int", &onoutofboundschange, 0, 1);
	clientfield::register("toplayer", "nonplayer_oob_usage", 1, 1, "int", &function_95c61f07, 0, 1);
	callback::on_localclient_connect(&on_localplayer_connect);
	callback::on_localplayer_spawned(&on_localplayer_spawned);
	callback::on_localclient_shutdown(&on_localplayer_shutdown);
	callback::function_a880899e(&function_a880899e);
}

/*
	Name: on_localplayer_connect
	Namespace: oob
	Checksum: 0xD3F9B9AB
	Offset: 0x3F0
	Size: 0x140
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_connect(localclientnum)
{
	setuimodelvalue(createuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "outOfBoundsEndTime"), 0);
	/#
		if(getdvarstring(#"hash_4e9b02559bacb944", "") == "")
		{
			oobtriggers = function_29bda34d(localclientnum, "");
			foreach(var_7a0e76fe in oobtriggers)
			{
				var_7a0e76fe function_704c070e(localclientnum);
			}
		}
	#/
}

/*
	Name: on_localplayer_spawned
	Namespace: oob
	Checksum: 0xBBA198EA
	Offset: 0x538
	Size: 0xC
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_spawned(localclientnum)
{
}

/*
	Name: on_localplayer_shutdown
	Namespace: oob
	Checksum: 0x46625E7A
	Offset: 0x550
	Size: 0x3C
	Parameters: 1
	Flags: Linked
*/
function on_localplayer_shutdown(localclientnum)
{
	localplayer = self;
	if(isdefined(localplayer))
	{
		stopoutofboundseffects(localclientnum, localplayer);
	}
}

/*
	Name: function_a880899e
	Namespace: oob
	Checksum: 0xC0133979
	Offset: 0x598
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_a880899e(var_aa127355)
{
	localplayer = function_5c10bd79(var_aa127355.localclientnum);
	if(!isdefined(localplayer.oob_effect_enabled))
	{
		return;
	}
	if(var_aa127355.enabled)
	{
		function_d36db451(var_aa127355.localclientnum);
	}
	else
	{
		function_52b5ffe3(var_aa127355.localclientnum);
	}
}

/*
	Name: function_95c61f07
	Namespace: oob
	Checksum: 0x91474BB8
	Offset: 0x628
	Size: 0x5E
	Parameters: 7
	Flags: Linked
*/
function function_95c61f07(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump > 0)
	{
		self.var_f043b10a = 1;
	}
	else
	{
		self.var_f043b10a = undefined;
	}
}

/*
	Name: function_2fb8e4d4
	Namespace: oob
	Checksum: 0xE578E4CB
	Offset: 0x690
	Size: 0x36
	Parameters: 2
	Flags: Linked
*/
function function_2fb8e4d4(localclientnum, localplayer)
{
	if(function_3132f113(localplayer))
	{
		return false;
	}
	return true;
}

/*
	Name: onoutofboundschange
	Namespace: oob
	Checksum: 0xEB8F0084
	Offset: 0x6D0
	Size: 0x20C
	Parameters: 7
	Flags: Linked
*/
function onoutofboundschange(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!isdefined(level.oob_sound_ent))
	{
		level.oob_sound_ent = [];
	}
	if(!isdefined(level.oob_sound_ent[binitialsnap]))
	{
		level.oob_sound_ent[binitialsnap] = spawn(binitialsnap, (0, 0, 0), "script_origin");
	}
	localplayer = function_5c10bd79(binitialsnap);
	var_d66b86ee = function_2fb8e4d4(binitialsnap, localplayer);
	self callback::entity_callback(#"oob", binitialsnap, {#new_val:bwastimejump, #old_val:fieldname});
	if(var_d66b86ee && bwastimejump > 0)
	{
		if(!isdefined(localplayer.oob_effect_enabled))
		{
			function_da2afac6(binitialsnap, localplayer);
		}
	}
	else
	{
		if(isdefined(level.oob_timekeep_ms) && isdefined(self.oob_start_time))
		{
			self.oob_end_time = getservertime(0, 1);
			if(!isdefined(self.oob_active_duration))
			{
				self.oob_active_duration = 0;
			}
			self.oob_active_duration = self.oob_active_duration + (self.oob_end_time - self.oob_start_time);
		}
		if(is_true(self.var_f043b10a))
		{
			self.oob_active_duration = undefined;
		}
		stopoutofboundseffects(binitialsnap, localplayer);
	}
}

/*
	Name: function_52b5ffe3
	Namespace: oob
	Checksum: 0x9AAAF42F
	Offset: 0x8E8
	Size: 0xE4
	Parameters: 1
	Flags: Linked
*/
function function_52b5ffe3(localclientnum)
{
	if(function_21dc7cf(localclientnum))
	{
		return;
	}
	if(!isdefined(level.oob_sound_ent[localclientnum]))
	{
		return;
	}
	if(util::function_5df4294() === #"zstandard")
	{
		level.oob_sound_ent[localclientnum] playloopsound(#"hash_6da7ae12f538ef5e", 0.5);
	}
	else
	{
		level.oob_sound_ent[localclientnum] playloopsound(#"uin_out_of_bounds_loop", 0.5);
	}
}

/*
	Name: function_da2afac6
	Namespace: oob
	Checksum: 0x921FFAD4
	Offset: 0x9D8
	Size: 0x172
	Parameters: 2
	Flags: Linked
*/
function function_da2afac6(localclientnum, localplayer)
{
	localplayer.oob_effect_enabled = 1;
	function_52b5ffe3(localclientnum);
	oobmodel = getoobuimodel(localclientnum);
	if(level.var_dcb68d74)
	{
		var_e09617 = localplayer function_54e69ee4();
		if(isdefined(level.oob_timekeep_ms) && isdefined(self.oob_start_time) && isdefined(self.oob_active_duration) && (getservertime(0) - self.oob_end_time) < level.oob_timekeep_ms)
		{
			setuimodelvalue(oobmodel, getservertime(0, 1) + (var_e09617 - self.oob_active_duration));
		}
		else
		{
			self.oob_active_duration = undefined;
			setuimodelvalue(oobmodel, getservertime(0, 1) + var_e09617);
		}
	}
	self.oob_start_time = getservertime(0, 1);
}

/*
	Name: function_d36db451
	Namespace: oob
	Checksum: 0x313AEC79
	Offset: 0xB58
	Size: 0x5C
	Parameters: 1
	Flags: Linked
*/
function function_d36db451(localclientnum)
{
	if(isdefined(level.oob_sound_ent) && isdefined(level.oob_sound_ent[localclientnum]))
	{
		level.oob_sound_ent[localclientnum] stopallloopsounds(0.5);
	}
}

/*
	Name: stopoutofboundseffects
	Namespace: oob
	Checksum: 0xEFEBE451
	Offset: 0xBC0
	Size: 0xA6
	Parameters: 2
	Flags: Linked
*/
function stopoutofboundseffects(localclientnum, localplayer)
{
	if(!isdefined(localplayer))
	{
		return;
	}
	function_d36db451(localclientnum);
	if(level.var_dcb68d74)
	{
		oobmodel = getoobuimodel(localclientnum);
		setuimodelvalue(oobmodel, 0);
	}
	if(isdefined(localplayer) && isdefined(localplayer.oob_effect_enabled))
	{
		localplayer.oob_effect_enabled = 0;
		localplayer.oob_effect_enabled = undefined;
	}
}

/*
	Name: getoobuimodel
	Namespace: oob
	Checksum: 0x62B7F45F
	Offset: 0xC70
	Size: 0x42
	Parameters: 1
	Flags: Linked
*/
function getoobuimodel(localclientnum)
{
	return getuimodel(function_1df4c3b0(localclientnum, #"hud_items"), "outOfBoundsEndTime");
}

/*
	Name: function_93bd17f6
	Namespace: oob
	Checksum: 0x43019A30
	Offset: 0xCC0
	Size: 0x70
	Parameters: 2
	Flags: None
*/
function function_93bd17f6(id, time)
{
	if(!isdefined(self.var_2ae9ee7e))
	{
		self.var_2ae9ee7e = [];
	}
	else if(!isarray(self.var_2ae9ee7e))
	{
		self.var_2ae9ee7e = array(self.var_2ae9ee7e);
	}
	self.var_2ae9ee7e[id] = time;
}

/*
	Name: function_e2d18c01
	Namespace: oob
	Checksum: 0x19CE04AC
	Offset: 0xD38
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function function_e2d18c01(id)
{
	if(isarray(self.var_2ae9ee7e))
	{
		arrayremoveindex(self.var_2ae9ee7e, id, 1);
	}
}

/*
	Name: function_54e69ee4
	Namespace: oob
	Checksum: 0x191C84F1
	Offset: 0xD88
	Size: 0xF2
	Parameters: 0
	Flags: Linked
*/
function function_54e69ee4()
{
	if(!isarray(self.var_2ae9ee7e) || !self.var_2ae9ee7e.size)
	{
		return level.oob_timelimit_ms;
	}
	var_56afe472 = undefined;
	foreach(time in self.var_2ae9ee7e)
	{
		if(!isdefined(var_56afe472) || time < var_56afe472)
		{
			var_56afe472 = time;
		}
	}
	return int(var_56afe472 * 1000);
}

