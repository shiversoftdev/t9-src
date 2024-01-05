#using scripts\killstreaks\killstreak_bundles.csc;
#using scripts\killstreaks\flak_drone.csc;
#using scripts\core_common\vehicle_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\helicopter_sounds_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\struct.csc;

#namespace helicopter;

/*
	Name: init_shared
	Namespace: helicopter
	Checksum: 0x43C6A83B
	Offset: 0x1F0
	Size: 0x2B4
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.var_164c3b65))
	{
		level.var_164c3b65 = {};
		flak_drone::init_shared();
		params = getscriptbundle("killstreak_helicopter_guard");
		level._effect[#"heli_guard_light"][#"friendly"] = params.var_667eb0de;
		level._effect[#"heli_guard_light"][#"enemy"] = params.var_1d8c24a8;
		clientfield::register("vehicle", "heli_warn_targeted", 1, 1, "int", &warnmissilelocking, 0, 0);
		clientfield::register("vehicle", "heli_warn_locked", 1, 1, "int", &warnmissilelocked, 0, 0);
		clientfield::register("vehicle", "heli_warn_fired", 1, 1, "int", &warnmissilefired, 0, 0);
		clientfield::register("vehicle", "heli_comlink_bootup_anim", 1, 1, "int", &heli_comlink_bootup_anim, 0, 0);
		clientfield::register("vehicle", "active_camo", 1, 3, "int", &active_camo_changed, 0, 0);
		callback::on_spawned(&on_player_spawned);
		callback::on_vehicle_spawned(&on_vehicle_spawned);
		bundle = getscriptbundle("killstreak_helicopter_comlink");
		if(isdefined(bundle))
		{
			vehicle::add_vehicletype_callback(bundle.ksvehicle, &killstreak_bundles::spawned, bundle);
		}
	}
}

/*
	Name: on_player_spawned
	Namespace: helicopter
	Checksum: 0x246FDB4
	Offset: 0x4B0
	Size: 0x9E
	Parameters: 1
	Flags: None
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
	Name: on_vehicle_spawned
	Namespace: helicopter
	Checksum: 0xE3668F5F
	Offset: 0x558
	Size: 0x34
	Parameters: 1
	Flags: None
*/
function on_vehicle_spawned(localclientnum)
{
	if(self.type == "helicopter")
	{
		self thread startfx_loop(localclientnum);
	}
}

/*
	Name: setupanimtree
	Namespace: helicopter
	Checksum: 0xB4DB4E0E
	Offset: 0x598
	Size: 0x4C
	Parameters: 0
	Flags: None
*/
function setupanimtree()
{
	if(isdefined(self) && self hasanimtree() == 0)
	{
		self useanimtree("generic");
	}
}

/*
	Name: active_camo_changed
	Namespace: helicopter
	Checksum: 0xBD9B41B7
	Offset: 0x5F0
	Size: 0xB4
	Parameters: 7
	Flags: None
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
	Checksum: 0x9FA44AD2
	Offset: 0x6B0
	Size: 0x184
	Parameters: 2
	Flags: None
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
	Checksum: 0x3C176A2D
	Offset: 0x840
	Size: 0x50
	Parameters: 7
	Flags: None
*/
function heli_comlink_bootup_anim(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
}

/*
	Name: warnmissilelocking
	Namespace: helicopter
	Checksum: 0xB204CED9
	Offset: 0x898
	Size: 0x7C
	Parameters: 7
	Flags: None
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
	Checksum: 0x99BC624E
	Offset: 0x920
	Size: 0x7C
	Parameters: 7
	Flags: None
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
	Checksum: 0x43A8C83F
	Offset: 0x9A8
	Size: 0x7C
	Parameters: 7
	Flags: None
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
	Checksum: 0x30F098C9
	Offset: 0xA30
	Size: 0x156
	Parameters: 1
	Flags: None
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
	Checksum: 0x740E49C9
	Offset: 0xB90
	Size: 0x22A
	Parameters: 1
	Flags: None
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
	Checksum: 0x54580E9D
	Offset: 0xDC8
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
	Checksum: 0x63245B23
	Offset: 0xEB8
	Size: 0x54
	Parameters: 2
	Flags: None
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
	Checksum: 0x867696DA
	Offset: 0xF18
	Size: 0x194
	Parameters: 1
	Flags: None
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
	Checksum: 0x61DD652F
	Offset: 0x10B8
	Size: 0x96
	Parameters: 1
	Flags: None
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

