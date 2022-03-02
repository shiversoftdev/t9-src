#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace perks;

/*
	Name: function_9b2d1837
	Namespace: perks
	Checksum: 0x3633F37A
	Offset: 0xF0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9b2d1837()
{
	level notify(587089867);
}

/*
	Name: function_89f2df9
	Namespace: perks
	Checksum: 0x45295B7F
	Offset: 0x110
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"perks", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: perks
	Checksum: 0x101BB13A
	Offset: 0x158
	Size: 0x84
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("allplayers", "flying", 1, 1, "int");
	callback::on_spawned(&on_player_spawned);
	callback::on_loadout(&on_loadout);
	level.var_222e62a6 = 1;
}

/*
	Name: on_player_spawned
	Namespace: perks
	Checksum: 0x8976DABF
	Offset: 0x1E8
	Size: 0x1C
	Parameters: 0
	Flags: Linked
*/
function on_player_spawned()
{
	self thread monitorflight();
}

/*
	Name: on_loadout
	Namespace: perks
	Checksum: 0xE718E425
	Offset: 0x210
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function on_loadout()
{
	self thread monitorgpsjammer();
	self thread monitorsengrenjammer();
}

/*
	Name: monitorflight
	Namespace: perks
	Checksum: 0xBBBE2654
	Offset: 0x250
	Size: 0xB4
	Parameters: 0
	Flags: Linked
*/
function monitorflight()
{
	self endon(#"death", #"disconnect");
	self.flying = 0;
	while(isdefined(self))
	{
		flying = !self isonground() || self isplayerswimming();
		if(self.flying != flying)
		{
			self clientfield::set("flying", flying);
			self.flying = flying;
		}
		waitframe(1);
	}
}

/*
	Name: monitorgpsjammer
	Namespace: perks
	Checksum: 0x9836640F
	Offset: 0x310
	Size: 0x5C4
	Parameters: 0
	Flags: Linked
*/
function monitorgpsjammer()
{
	self notify("37c17b8bd3a27be3");
	self endon("37c17b8bd3a27be3");
	self endon(#"death", #"disconnect");
	require_perk = 1;
	/#
		require_perk = 0;
	#/
	if(require_perk && self hasperk(#"specialty_gpsjammer") == 0)
	{
		return;
	}
	self clientfield::set("gps_jammer_active", (self hasperk(#"specialty_gpsjammer") ? 1 : 0));
	graceperiods = self function_ee4a9054(#"hash_37972a2f1d9bd52");
	minspeed = self function_ee4a9054(#"min_speed");
	mindistance = self function_ee4a9054(#"min_distance");
	timeperiod = self function_ee4a9054("time_period");
	timeperiodsec = float(timeperiod) / 1000;
	minspeedsq = minspeed * minspeed;
	mindistancesq = mindistance * mindistance;
	if(minspeedsq == 0)
	{
		return;
	}
	/#
		assert(timeperiodsec >= 0.05);
	#/
	if(timeperiodsec < 0.05)
	{
		return;
	}
	hasperk = 1;
	statechange = 0;
	faileddistancecheck = 0;
	currentfailcount = 0;
	timepassed = 0;
	timesincedistancecheck = 0;
	previousorigin = self.origin;
	gpsjammerprotection = 0;
	while(true)
	{
		/#
			graceperiods = self function_ee4a9054(#"hash_37972a2f1d9bd52");
			minspeed = self function_ee4a9054(#"min_speed");
			mindistance = self function_ee4a9054(#"min_distance");
			timeperiod = self function_ee4a9054("");
			timeperiodsec = float(timeperiod) / 1000;
			minspeedsq = minspeed * minspeed;
			mindistancesq = mindistance * mindistance;
		#/
		gpsjammerprotection = 0;
		if(util::isusingremote() || is_true(self.isplanting) || is_true(self.isdefusing))
		{
			gpsjammerprotection = 1;
		}
		else
		{
			if(timesincedistancecheck > 1)
			{
				timesincedistancecheck = 0;
				if(distancesquared(previousorigin, self.origin) < mindistancesq)
				{
					faileddistancecheck = 1;
				}
				else
				{
					faileddistancecheck = 0;
				}
				previousorigin = self.origin;
			}
			velocity = self getvelocity();
			speedsq = lengthsquared(velocity);
			if(speedsq > minspeedsq && faileddistancecheck == 0)
			{
				gpsjammerprotection = 1;
			}
		}
		if(gpsjammerprotection == 1 && self hasperk(#"specialty_gpsjammer"))
		{
			/#
				if(getdvarint(#"scr_debug_perk_gpsjammer", 0) != 0)
				{
					sphere(self.origin + vectorscale((0, 0, 1), 70), 12, (0, 0, 1), 1, 1, 16, 3);
				}
			#/
			currentfailcount = 0;
			if(hasperk == 0)
			{
				statechange = 0;
				hasperk = 1;
				self clientfield::set("gps_jammer_active", 1);
			}
		}
		else
		{
			currentfailcount++;
			if(hasperk == 1 && currentfailcount >= graceperiods)
			{
				statechange = 1;
				hasperk = 0;
				self clientfield::set("gps_jammer_active", 0);
			}
		}
		if(statechange == 1)
		{
			level notify(#"radar_status_change");
		}
		timesincedistancecheck = timesincedistancecheck + timeperiodsec;
		wait(timeperiodsec);
	}
}

/*
	Name: monitorsengrenjammer
	Namespace: perks
	Checksum: 0x72B30334
	Offset: 0x8E0
	Size: 0x5E4
	Parameters: 0
	Flags: Linked
*/
function monitorsengrenjammer()
{
	self endon(#"death", #"disconnect");
	require_perk = 1;
	/#
		require_perk = 0;
	#/
	if(require_perk && self hasperk(#"specialty_sengrenjammer") == 0)
	{
		return;
	}
	self clientfield::set("sg_jammer_active", (self hasperk(#"specialty_sengrenjammer") ? 1 : 0));
	graceperiods = getdvarint(#"perk_sgjammer_graceperiods", 4);
	minspeed = getdvarint(#"perk_sgjammer_min_speed", 100);
	mindistance = getdvarint(#"perk_sgjammer_min_distance", 10);
	timeperiod = getdvarint(#"perk_sgjammer_time_period", 200);
	timeperiodsec = float(timeperiod) / 1000;
	minspeedsq = minspeed * minspeed;
	mindistancesq = mindistance * mindistance;
	if(minspeedsq == 0)
	{
		return;
	}
	/#
		assert(timeperiodsec >= 0.05);
	#/
	if(timeperiodsec < 0.05)
	{
		return;
	}
	hasperk = 1;
	statechange = 0;
	faileddistancecheck = 0;
	currentfailcount = 0;
	timepassed = 0;
	timesincedistancecheck = 0;
	previousorigin = self.origin;
	sgjammerprotection = 0;
	while(true)
	{
		/#
			graceperiods = getdvarint(#"perk_sgjammer_graceperiods", graceperiods);
			minspeed = getdvarint(#"perk_sgjammer_min_speed", minspeed);
			mindistance = getdvarint(#"perk_sgjammer_min_distance", mindistance);
			timeperiod = getdvarint(#"perk_sgjammer_time_period", timeperiod);
			timeperiodsec = float(timeperiod) / 1000;
			minspeedsq = minspeed * minspeed;
			mindistancesq = mindistance * mindistance;
		#/
		sgjammerprotection = 0;
		if(util::isusingremote() || is_true(self.isplanting) || is_true(self.isdefusing))
		{
			sgjammerprotection = 1;
		}
		else
		{
			if(timesincedistancecheck > 1)
			{
				timesincedistancecheck = 0;
				if(distancesquared(previousorigin, self.origin) < mindistancesq)
				{
					faileddistancecheck = 1;
				}
				else
				{
					faileddistancecheck = 0;
				}
				previousorigin = self.origin;
			}
			velocity = self getvelocity();
			speedsq = lengthsquared(velocity);
			if(speedsq > minspeedsq && faileddistancecheck == 0)
			{
				sgjammerprotection = 1;
			}
		}
		if(sgjammerprotection == 1 && self hasperk(#"specialty_sengrenjammer"))
		{
			/#
				if(getdvarint(#"scr_debug_perk_sengrenjammer", 0) != 0)
				{
					sphere(self.origin + vectorscale((0, 0, 1), 65), 12, (0, 1, 0), 1, 1, 16, 3);
				}
			#/
			currentfailcount = 0;
			if(hasperk == 0)
			{
				statechange = 0;
				hasperk = 1;
				self clientfield::set("sg_jammer_active", 1);
			}
		}
		else
		{
			currentfailcount++;
			if(hasperk == 1 && currentfailcount >= graceperiods)
			{
				statechange = 1;
				hasperk = 0;
				self clientfield::set("sg_jammer_active", 0);
			}
		}
		if(statechange == 1)
		{
			level notify(#"radar_status_change");
		}
		timesincedistancecheck = timesincedistancecheck + timeperiodsec;
		wait(timeperiodsec);
	}
}

