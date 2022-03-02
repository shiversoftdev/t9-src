#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\fx_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\vehicle_shared.csc;

#namespace qrdrone;

/*
	Name: function_496bacb8
	Namespace: qrdrone
	Checksum: 0x8A421A70
	Offset: 0x198
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_496bacb8()
{
	level notify(1742032994);
}

/*
	Name: init_shared
	Namespace: qrdrone
	Checksum: 0xCA1680C0
	Offset: 0x1B8
	Size: 0x174
	Parameters: 0
	Flags: None
*/
function init_shared()
{
	if(!isdefined(level.var_2444b2ee))
	{
		level.var_2444b2ee = {};
		type = "qrdrone_mp";
		clientfield::register("vehicle", "qrdrone_state", 1, 3, "int", &statechange, 0, 0);
		clientfield::register("vehicle", "qrdrone_countdown", 1, 1, "int", &start_blink, 0, 0);
		clientfield::register("vehicle", "qrdrone_timeout", 1, 1, "int", &final_blink, 0, 0);
		clientfield::register("vehicle", "qrdrone_out_of_range", 1, 1, "int", &out_of_range_update, 0, 0);
		vehicle::add_vehicletype_callback("qrdrone_mp", &spawned);
	}
}

/*
	Name: spawned
	Namespace: qrdrone
	Checksum: 0x7E8E9E1D
	Offset: 0x338
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function spawned(localclientnum)
{
	self util::waittill_dobj(localclientnum);
	self thread restartfx(localclientnum, 0);
	self thread collisionhandler(localclientnum);
	self thread enginestutterhandler(localclientnum);
	self thread qrdrone_watch_distance();
}

/*
	Name: statechange
	Namespace: qrdrone
	Checksum: 0x788AB66B
	Offset: 0x3C8
	Size: 0x7C
	Parameters: 7
	Flags: None
*/
function statechange(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	self endon(#"death");
	self util::waittill_dobj(fieldname);
	self restartfx(fieldname, bwastimejump);
}

/*
	Name: restartfx
	Namespace: qrdrone
	Checksum: 0x2A46D684
	Offset: 0x450
	Size: 0x14C
	Parameters: 2
	Flags: None
*/
function restartfx(localclientnum, blinkstage)
{
	self notify(#"restart_fx");
	/#
		println("" + blinkstage);
	#/
	switch(blinkstage)
	{
		case 0:
		{
			self spawn_solid_fx(localclientnum);
			break;
		}
		case 1:
		{
			self.fx_interval = 1;
			self spawn_blinking_fx(localclientnum);
			break;
		}
		case 2:
		{
			self.fx_interval = 0.133;
			self spawn_blinking_fx(localclientnum);
			break;
		}
		case 3:
		{
			self notify(#"stopfx");
			self notify(#"fx_death");
			return;
		}
	}
	self thread watchrestartfx(localclientnum);
}

/*
	Name: watchrestartfx
	Namespace: qrdrone
	Checksum: 0xC881A77A
	Offset: 0x5A8
	Size: 0x94
	Parameters: 1
	Flags: None
*/
function watchrestartfx(localclientnum)
{
	self endon(#"death");
	level waittill(#"demo_jump", #"player_switch", #"killcam_begin", #"killcam_end");
	self restartfx(localclientnum, clientfield::get("qrdrone_state"));
}

/*
	Name: spawn_solid_fx
	Namespace: qrdrone
	Checksum: 0xF13888ED
	Offset: 0x648
	Size: 0x2A
	Parameters: 1
	Flags: None
*/
function spawn_solid_fx(localclientnum)
{
	if(self function_4add50a7())
	{
	}
}

/*
	Name: spawn_blinking_fx
	Namespace: qrdrone
	Checksum: 0xEDAB2D6E
	Offset: 0x680
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function spawn_blinking_fx(localclientnum)
{
	self thread blink_fx_and_sound(localclientnum, "wpn_qr_alert");
}

/*
	Name: blink_fx_and_sound
	Namespace: qrdrone
	Checksum: 0x6458FCD2
	Offset: 0x6B8
	Size: 0x13E
	Parameters: 2
	Flags: None
*/
function blink_fx_and_sound(localclientnum, soundalias)
{
	self endon(#"death");
	self endon(#"restart_fx");
	self endon(#"fx_death");
	if(!isdefined(self.interval))
	{
		self.interval = 1;
	}
	while(true)
	{
		self playsound(localclientnum, soundalias);
		self spawn_solid_fx(localclientnum);
		util::server_wait(localclientnum, self.interval / 2);
		self notify(#"stopfx");
		util::server_wait(localclientnum, self.interval / 2);
		self.interval = self.interval / 1.17;
		if(self.interval < 0.1)
		{
			self.interval = 0.1;
		}
	}
}

/*
	Name: cleanupfx
	Namespace: qrdrone
	Checksum: 0x3D53563B
	Offset: 0x800
	Size: 0x74
	Parameters: 2
	Flags: None
*/
function cleanupfx(localclientnum, handle)
{
	self waittill(#"death", #"blink", #"stopfx", #"restart_fx");
	stopfx(localclientnum, handle);
}

/*
	Name: start_blink
	Namespace: qrdrone
	Checksum: 0x222D3EB5
	Offset: 0x880
	Size: 0x56
	Parameters: 7
	Flags: None
*/
function start_blink(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		return;
	}
	self notify(#"blink");
}

/*
	Name: final_blink
	Namespace: qrdrone
	Checksum: 0x5A46DEE8
	Offset: 0x8E0
	Size: 0x56
	Parameters: 7
	Flags: None
*/
function final_blink(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(!bwastimejump)
	{
		return;
	}
	self.interval = 0.133;
}

/*
	Name: out_of_range_update
	Namespace: qrdrone
	Checksum: 0x8253E2EF
	Offset: 0x940
	Size: 0x9C
	Parameters: 7
	Flags: None
*/
function out_of_range_update(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	model = getuimodel(function_1df4c3b0(fieldname, #"vehicle_info"), "outOfRange");
	if(isdefined(model))
	{
		setuimodelvalue(model, bwastimejump);
	}
}

/*
	Name: loop_local_sound
	Namespace: qrdrone
	Checksum: 0x9A056AC6
	Offset: 0x9E8
	Size: 0x16E
	Parameters: 4
	Flags: None
*/
function loop_local_sound(localclientnum, alias, interval, fx)
{
	self endon(#"death");
	self endon(#"stopfx");
	level endon(#"demo_jump");
	level endon(#"player_switch");
	if(!isdefined(self.interval))
	{
		self.interval = fx;
	}
	while(true)
	{
		self playsound(alias, interval);
		self spawn_solid_fx(alias);
		util::server_wait(alias, self.interval / 2);
		self notify(#"stopfx");
		util::server_wait(alias, self.interval / 2);
		self.interval = self.interval / 1.17;
		if(self.interval < 0.1)
		{
			self.interval = 0.1;
		}
	}
}

/*
	Name: check_for_player_switch_or_time_jump
	Namespace: qrdrone
	Checksum: 0xF3BEB49C
	Offset: 0xB60
	Size: 0x104
	Parameters: 1
	Flags: None
*/
function check_for_player_switch_or_time_jump(localclientnum)
{
	self endon(#"death");
	level waittill(#"demo_jump", #"player_switch", #"killcam_begin");
	self notify(#"stopfx");
	waittillframeend();
	self thread blink_light(localclientnum);
	if(isdefined(self.blinkstarttime) && self.blinkstarttime <= getservertime(0))
	{
		self.interval = 1;
		self thread start_blink(localclientnum, 1);
	}
	else
	{
		self spawn_solid_fx(localclientnum);
	}
	self thread check_for_player_switch_or_time_jump(localclientnum);
}

/*
	Name: blink_light
	Namespace: qrdrone
	Checksum: 0xB28C41AD
	Offset: 0xC70
	Size: 0x17C
	Parameters: 1
	Flags: None
*/
function blink_light(localclientnum)
{
	self endon(#"death");
	level endon(#"demo_jump");
	level endon(#"player_switch");
	level endon(#"killcam_begin");
	self waittill(#"blink");
	if(!isdefined(self.blinkstarttime))
	{
		self.blinkstarttime = getservertime(0);
	}
	if(self function_4add50a7())
	{
		self thread loop_local_sound(localclientnum, "wpn_qr_alert", 1, level._effect[#"qrdrone_viewmodel_light"]);
	}
	else
	{
		if(self function_ca024039())
		{
			self thread loop_local_sound(localclientnum, "wpn_qr_alert", 1, level._effect[#"qrdrone_friendly_light"]);
		}
		else
		{
			self thread loop_local_sound(localclientnum, "wpn_qr_alert", 1, level._effect[#"qrdrone_enemy_light"]);
		}
	}
}

/*
	Name: collisionhandler
	Namespace: qrdrone
	Checksum: 0xA5DDCF7
	Offset: 0xDF8
	Size: 0x120
	Parameters: 1
	Flags: None
*/
function collisionhandler(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		waitresult = undefined;
		waitresult = self waittill(#"veh_collision");
		hip = waitresult.velocity;
		hitn = waitresult.normal;
		hit_intensity = waitresult.intensity;
		driver_local_client = self getlocalclientdriver();
		if(isdefined(driver_local_client))
		{
			player = function_5c10bd79(driver_local_client);
			if(isdefined(player))
			{
				if(hit_intensity > 15)
				{
					player playrumbleonentity(driver_local_client, "damage_heavy");
				}
				else
				{
					player playrumbleonentity(driver_local_client, "damage_light");
				}
			}
		}
	}
}

/*
	Name: enginestutterhandler
	Namespace: qrdrone
	Checksum: 0xDAA1DEC9
	Offset: 0xF20
	Size: 0x70
	Parameters: 1
	Flags: None
*/
function enginestutterhandler(localclientnum)
{
	self endon(#"death");
	while(true)
	{
		self waittill(#"veh_engine_stutter");
		if(self function_4add50a7())
		{
			function_36e4ebd4(localclientnum, "rcbomb_engine_stutter");
		}
	}
}

/*
	Name: getminimumflyheight
	Namespace: qrdrone
	Checksum: 0x6708729D
	Offset: 0xF98
	Size: 0x138
	Parameters: 0
	Flags: None
*/
function getminimumflyheight()
{
	if(!isdefined(level.airsupportheightscale))
	{
		level.airsupportheightscale = 1;
	}
	airsupport_height = struct::get("air_support_height", "targetname");
	if(isdefined(airsupport_height))
	{
		planeflyheight = airsupport_height.origin[2];
	}
	else
	{
		/#
			println("");
		#/
		planeflyheight = 850;
		if(isdefined(level.airsupportheightscale))
		{
			level.airsupportheightscale = getdvarint(#"scr_airsupportheightscale", level.airsupportheightscale);
			planeflyheight = planeflyheight * getdvarint(#"scr_airsupportheightscale", level.airsupportheightscale);
		}
		if(isdefined(level.forceairsupportmapheight))
		{
			planeflyheight = planeflyheight + level.forceairsupportmapheight;
		}
	}
	return planeflyheight;
}

/*
	Name: qrdrone_watch_distance
	Namespace: qrdrone
	Checksum: 0xBEB12579
	Offset: 0x10D8
	Size: 0x2B8
	Parameters: 0
	Flags: None
*/
function qrdrone_watch_distance()
{
	self endon(#"death");
	qrdrone_height = struct::get("qrdrone_height", "targetname");
	if(isdefined(qrdrone_height))
	{
		self.maxheight = qrdrone_height.origin[2];
	}
	else
	{
		self.maxheight = int(getminimumflyheight());
	}
	self.maxdistance = 12800;
	level.mapcenter = getmapcenter();
	self.minheight = level.mapcenter[2] - 800;
	inrangepos = self.origin;
	soundent = spawn(0, self.origin, "script_origin");
	soundent linkto(self);
	self thread qrdrone_staticstopondeath(soundent);
	while(true)
	{
		if(!self qrdrone_in_range())
		{
			staticalpha = 0;
			while(!self qrdrone_in_range())
			{
				if(isdefined(self.heliinproximity))
				{
					dist = distance(self.origin, self.heliinproximity.origin);
					staticalpha = 1 - ((dist - 150) / 150);
				}
				else
				{
					dist = distance(self.origin, inrangepos);
					staticalpha = min(1, dist / 200);
				}
				sid = soundent playloopsound(#"veh_qrdrone_static_lp", 0.2);
				self vehicle::set_static_amount(staticalpha * 2);
				waitframe(1);
			}
			self thread qrdrone_staticfade(staticalpha, soundent, sid);
		}
		inrangepos = self.origin;
		waitframe(1);
	}
}

/*
	Name: qrdrone_in_range
	Namespace: qrdrone
	Checksum: 0xD920B270
	Offset: 0x1398
	Size: 0x56
	Parameters: 0
	Flags: None
*/
function qrdrone_in_range()
{
	if(self.origin[2] < self.maxheight && self.origin[2] > self.minheight)
	{
		if(self function_4826630a())
		{
			return true;
		}
	}
	return false;
}

/*
	Name: qrdrone_staticfade
	Namespace: qrdrone
	Checksum: 0x93596442
	Offset: 0x13F8
	Size: 0xFE
	Parameters: 3
	Flags: None
*/
function qrdrone_staticfade(staticalpha, sndent, sid)
{
	self endon(#"death");
	while(self qrdrone_in_range())
	{
		staticalpha = staticalpha - 0.05;
		if(staticalpha <= 0)
		{
			sndent stopallloopsounds(0.5);
			self vehicle::set_static_amount(0);
			break;
		}
		setsoundvolumerate(sid, 0.6);
		setsoundvolume(sid, staticalpha);
		self vehicle::set_static_amount(staticalpha * 2);
		waitframe(1);
	}
}

/*
	Name: qrdrone_staticstopondeath
	Namespace: qrdrone
	Checksum: 0x97A67899
	Offset: 0x1500
	Size: 0x54
	Parameters: 1
	Flags: None
*/
function qrdrone_staticstopondeath(sndent)
{
	self waittill(#"death");
	sndent stopallloopsounds(0.1);
	sndent delete();
}

