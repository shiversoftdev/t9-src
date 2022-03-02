#using script_1b80a90bb1ce332e;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\helicopter_sounds_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace helicopter;

/*
	Name: function_89f2df9
	Namespace: helicopter
	Checksum: 0xDB0DFEEF
	Offset: 0x1F8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"helicopter", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: helicopter
	Checksum: 0xA12A3AA8
	Offset: 0x248
	Size: 0x254
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	bundle = "killstreak_helicopter_guard";
	if(function_f99d2668())
	{
		bundle = bundle + "_wz";
	}
	params = getscriptbundle(bundle);
	level._effect[#"heli_guard_light"][#"friendly"] = params.var_667eb0de;
	level._effect[#"heli_guard_light"][#"enemy"] = params.var_1d8c24a8;
	clientfield::register("vehicle", "heli_warn_targeted", 1, 1, "int", &warnmissilelocking, 0, 0);
	clientfield::register("vehicle", "heli_warn_locked", 1, 1, "int", &warnmissilelocked, 0, 0);
	clientfield::register("vehicle", "heli_warn_fired", 1, 1, "int", &warnmissilefired, 0, 0);
	clientfield::register("vehicle", "heli_comlink_bootup_anim", 1, 1, "int", &heli_comlink_bootup_anim, 0, 0);
	clientfield::register("vehicle", "active_camo", 1, 3, "int", &active_camo_changed, 0, 0);
	callback::on_spawned(&on_player_spawned);
}

/*
	Name: on_player_spawned
	Namespace: helicopter
	Checksum: 0x586680EF
	Offset: 0x4A8
	Size: 0x9E
	Parameters: 1
	Flags: Linked
*/
function on_player_spawned(localclientnum)
{
	player = self;
	player waittill(#"death");
	player.markerfx = undefined;
	if(isdefined(player.markerobj))
	{
		player.markerobj delete();
	}
	if(isdefined(player.markerfxhandle))
	{
		killfx(localclientnum, player.markerfxhandle);
		player.markerfxhandle = undefined;
	}
}

/*
	Name: active_camo_changed
	Namespace: helicopter
	Checksum: 0x48869954
	Offset: 0x550
	Size: 0xB4
	Parameters: 7
	Flags: Linked
*/
function active_camo_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump == 0)
	{
		self thread heli_comlink_lights_on_after_wait(fieldname, 0.7);
	}
	else
	{
		self heli_comlink_lights_off(fieldname);
	}
	self notify(#"endtest");
	self thread doreveal(fieldname, bwastimejump != 0);
}

/*
	Name: doreveal
	Namespace: helicopter
	Checksum: 0xF99651C9
	Offset: 0x610
	Size: 0x184
	Parameters: 2
	Flags: Linked
*/
function doreveal(local_client_num, direction)
{
	self notify(#"endtest");
	self endon(#"endtest");
	self endon(#"death");
	if(direction)
	{
		startval = 0;
		endval = 1;
	}
	else
	{
		startval = 1;
		endval = 0;
	}
	priorvalue = startval;
	while(startval >= 0 && startval <= 1)
	{
		self mapshaderconstant(local_client_num, 0, "scriptVector0", startval, 0, 0, 0);
		if(direction)
		{
			startval = startval + 0.032;
		}
		else
		{
			startval = startval - 0.032;
		}
		priorvalue = startval;
		waitframe(1);
	}
	self mapshaderconstant(local_client_num, 0, "scriptVector0", endval, 0, 0, 0);
}

/*
	Name: heli_comlink_bootup_anim
	Namespace: helicopter
	Checksum: 0x3DE4DF99
	Offset: 0x7A0
	Size: 0x3C
	Parameters: 7
	Flags: Linked
*/
function heli_comlink_bootup_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

/*
	Name: warnmissilelocking
	Namespace: helicopter
	Checksum: 0x589A8BA8
	Offset: 0x7E8
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function warnmissilelocking(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !self function_4add50a7())
	{
		return;
	}
	helicopter_sounds::play_targeted_sound(bwastimejump);
}

/*
	Name: warnmissilelocked
	Namespace: helicopter
	Checksum: 0x62D931C1
	Offset: 0x870
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function warnmissilelocked(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !self function_4add50a7())
	{
		return;
	}
	helicopter_sounds::play_locked_sound(bwastimejump);
}

/*
	Name: warnmissilefired
	Namespace: helicopter
	Checksum: 0x8563E582
	Offset: 0x8F8
	Size: 0x7C
	Parameters: 7
	Flags: Linked
*/
function warnmissilefired(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump && !self function_4add50a7())
	{
		return;
	}
	helicopter_sounds::play_fired_sound(bwastimejump);
}

/*
	Name: heli_deletefx
	Namespace: helicopter
	Checksum: 0x171D3E1F
	Offset: 0x980
	Size: 0x156
	Parameters: 1
	Flags: Linked
*/
function heli_deletefx(localclientnum)
{
	if(isdefined(self.exhaustleftfxhandle))
	{
		deletefx(localclientnum, self.exhaustleftfxhandle);
		self.exhaustleftfxhandle = undefined;
	}
	if(isdefined(self.exhaustrightfxhandlee))
	{
		deletefx(localclientnum, self.exhaustrightfxhandle);
		self.exhaustrightfxhandle = undefined;
	}
	if(isdefined(self.lightfxid))
	{
		deletefx(localclientnum, self.lightfxid);
		self.lightfxid = undefined;
	}
	if(isdefined(self.propfxid))
	{
		deletefx(localclientnum, self.propfxid);
		self.propfxid = undefined;
	}
	if(isdefined(self.vtolleftfxid))
	{
		deletefx(localclientnum, self.vtolleftfxid);
		self.vtolleftfxid = undefined;
	}
	if(isdefined(self.vtolrightfxid))
	{
		deletefx(localclientnum, self.vtolrightfxid);
		self.vtolrightfxid = undefined;
	}
}

/*
	Name: startfx
	Namespace: helicopter
	Checksum: 0xCC8A5CA2
	Offset: 0xAE0
	Size: 0x22A
	Parameters: 1
	Flags: Linked
*/
function startfx(localclientnum)
{
	self endon(#"death");
	if(isdefined(self.vehicletype))
	{
		if(self.vehicletype == #"remote_mortar_vehicle_mp")
		{
			return;
		}
		if(self.vehicletype == #"vehicle_straferun_mp")
		{
			return;
		}
	}
	if(isdefined(self.exhaustfxname) && self.exhaustfxname != "")
	{
		self.exhaustfx = self.exhaustfxname;
	}
	if(isdefined(self.exhaustfx))
	{
		self.exhaustleftfxhandle = util::playfxontag(localclientnum, self.exhaustfx, self, "tag_engine_left");
		if(!is_true(self.oneexhaust))
		{
			self.exhaustrightfxhandle = util::playfxontag(localclientnum, self.exhaustfx, self, "tag_engine_right");
		}
	}
	else
	{
		/#
			println("");
		#/
	}
	if(isdefined(self.vehicletype))
	{
		light_fx = undefined;
		switch(self.vehicletype)
		{
			case "heli_ai_mp":
			{
				light_fx = "heli_comlink_light";
				break;
			}
			case "heli_guard_mp":
			{
				light_fx = "heli_guard_light";
				break;
			}
		}
		if(isdefined(light_fx))
		{
			self.lightfxid = self fx::function_3539a829(localclientnum, level._effect[light_fx][#"friendly"], level._effect[light_fx][#"enemy"], "tag_origin");
		}
	}
}

/*
	Name: startfx_loop
	Namespace: helicopter
	Checksum: 0xEE3DB33
	Offset: 0xD18
	Size: 0xE2
	Parameters: 1
	Flags: None
*/
function startfx_loop(localclientnum)
{
	self endon(#"death");
	self thread helicopter_sounds::aircraft_dustkick(localclientnum);
	startfx(localclientnum);
	servertime = getservertime(0);
	lastservertime = servertime;
	while(isdefined(self))
	{
		if(servertime < lastservertime)
		{
			heli_deletefx(localclientnum);
			startfx(localclientnum);
		}
		waitframe(1);
		lastservertime = servertime;
		servertime = getservertime(0);
	}
}

/*
	Name: heli_comlink_lights_on_after_wait
	Namespace: helicopter
	Checksum: 0xD2D2041E
	Offset: 0xE08
	Size: 0x54
	Parameters: 2
	Flags: Linked
*/
function heli_comlink_lights_on_after_wait(localclientnum, wait_time)
{
	self endon(#"death");
	self endon(#"heli_comlink_lights_off");
	wait(wait_time);
	self heli_comlink_lights_on(localclientnum);
}

/*
	Name: heli_comlink_lights_on
	Namespace: helicopter
	Checksum: 0xF3006D65
	Offset: 0xE68
	Size: 0x194
	Parameters: 1
	Flags: Linked
*/
function heli_comlink_lights_on(localclientnum)
{
	if(!isdefined(self.light_fx_handles_heli_comlink))
	{
		self.light_fx_handles_heli_comlink = [];
	}
	params = getscriptbundle("killstreak_helicopter_comlink");
	self.light_fx_handles_heli_comlink[0] = util::playfxontag(localclientnum, params.var_ffb74bd2, self, params.var_cc7457a3);
	self.light_fx_handles_heli_comlink[1] = util::playfxontag(localclientnum, params.var_ffb74bd2, self, params.var_a4b60827);
	self.light_fx_handles_heli_comlink[2] = util::playfxontag(localclientnum, params.var_ffb74bd2, self, params.var_caf75475);
	self.light_fx_handles_heli_comlink[3] = util::playfxontag(localclientnum, params.var_ffb74bd2, self, params.var_a6b70bf5);
	if(isdefined(self.team))
	{
		for(i = 0; i < self.light_fx_handles_heli_comlink.size; i++)
		{
			setfxteam(localclientnum, self.light_fx_handles_heli_comlink[i], self.owner.team);
		}
	}
}

/*
	Name: heli_comlink_lights_off
	Namespace: helicopter
	Checksum: 0xCBBE8211
	Offset: 0x1008
	Size: 0x96
	Parameters: 1
	Flags: Linked
*/
function heli_comlink_lights_off(localclientnum)
{
	self notify(#"heli_comlink_lights_off");
	if(isdefined(self.light_fx_handles_heli_comlink))
	{
		for(i = 0; i < self.light_fx_handles_heli_comlink.size; i++)
		{
			if(isdefined(self.light_fx_handles_heli_comlink[i]))
			{
				deletefx(localclientnum, self.light_fx_handles_heli_comlink[i]);
			}
		}
		self.light_fx_handles_heli_comlink = undefined;
	}
}

/*
	Name: updatemarkerthread
	Namespace: helicopter
	Checksum: 0x496DDDAA
	Offset: 0x10A8
	Size: 0x120
	Parameters: 1
	Flags: Linked
*/
function updatemarkerthread(localclientnum)
{
	self endon(#"death");
	player = self;
	killstreakcorebundle = getscriptbundle("killstreak_core");
	while(isdefined(player.markerobj))
	{
		viewangles = getlocalclientangles(localclientnum);
		forwardvector = vectorscale(anglestoforward(viewangles), killstreakcorebundle.ksmaxairdroptargetrange);
		results = bullettrace(player geteye(), player geteye() + forwardvector, 0, player);
		player.markerobj.origin = results[#"position"];
		waitframe(1);
	}
}

/*
	Name: stopcrateeffects
	Namespace: helicopter
	Checksum: 0x5C303358
	Offset: 0x11D0
	Size: 0x102
	Parameters: 1
	Flags: Linked
*/
function stopcrateeffects(localclientnum)
{
	crate = self;
	if(isdefined(crate.thrusterfxhandle0))
	{
		stopfx(localclientnum, crate.thrusterfxhandle0);
	}
	if(isdefined(crate.thrusterfxhandle1))
	{
		stopfx(localclientnum, crate.thrusterfxhandle1);
	}
	if(isdefined(crate.thrusterfxhandle2))
	{
		stopfx(localclientnum, crate.thrusterfxhandle2);
	}
	if(isdefined(crate.thrusterfxhandle3))
	{
		stopfx(localclientnum, crate.thrusterfxhandle3);
	}
	crate.thrusterfxhandle0 = undefined;
	crate.thrusterfxhandle1 = undefined;
	crate.thrusterfxhandle2 = undefined;
	crate.thrusterfxhandle3 = undefined;
}

/*
	Name: cleanupthrustersthread
	Namespace: helicopter
	Checksum: 0x73A0D008
	Offset: 0x12E0
	Size: 0x74
	Parameters: 1
	Flags: None
*/
function cleanupthrustersthread(localclientnum)
{
	crate = self;
	crate notify(#"cleanupthrustersthread_singleton");
	crate endon(#"cleanupthrustersthread_singleton");
	crate waittill(#"death");
	crate stopcrateeffects(localclientnum);
}

/*
	Name: marker_state_changed
	Namespace: helicopter
	Checksum: 0x51A8DCB2
	Offset: 0x1360
	Size: 0x264
	Parameters: 7
	Flags: None
*/
function marker_state_changed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	player = self;
	killstreakcorebundle = getscriptbundle("killstreak_core");
	if(bwastimejump == 1)
	{
		player.markerfx = killstreakcorebundle.fxvalidlocation;
	}
	else
	{
		if(bwastimejump == 2)
		{
			player.markerfx = killstreakcorebundle.fxinvalidlocation;
		}
		else
		{
			player.markerfx = undefined;
		}
	}
	if(isdefined(player.markerobj) && !player.markerobj hasdobj(fieldname))
	{
		return;
	}
	if(isdefined(player.markerfxhandle))
	{
		killfx(fieldname, player.markerfxhandle);
		player.markerfxhandle = undefined;
	}
	if(isdefined(player.markerfx))
	{
		if(!isdefined(player.markerobj))
		{
			player.markerobj = spawn(fieldname, (0, 0, 0), "script_model");
			player.markerobj.angles = vectorscale((1, 0, 0), 270);
			player.markerobj setmodel(#"wpn_t7_none_world");
			player.markerobj util::waittill_dobj(fieldname);
			player thread updatemarkerthread(fieldname);
		}
		player.markerfxhandle = util::playfxontag(fieldname, player.markerfx, player.markerobj, "tag_origin");
	}
	else if(isdefined(player.markerobj))
	{
		player.markerobj delete();
	}
}

