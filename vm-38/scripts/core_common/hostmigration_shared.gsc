#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\values_shared.gsc;

#namespace hostmigration_shared;

/*
	Name: function_24bd793
	Namespace: hostmigration_shared
	Checksum: 0x9CDD68FE
	Offset: 0x108
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_24bd793()
{
	level notify(1093367743);
}

#namespace hostmigration;

/*
	Name: updatetimerpausedness
	Namespace: hostmigration
	Checksum: 0xF56615C7
	Offset: 0x128
	Size: 0xBC
	Parameters: 0
	Flags: None
*/
function updatetimerpausedness()
{
	shouldbestopped = isdefined(level.hostmigrationtimer);
	if(!level.timerstopped && shouldbestopped)
	{
		level.timerstopped = 1;
		level.playabletimerstopped = 1;
		level.timerpausetime = gettime();
	}
	else if(level.timerstopped && !shouldbestopped)
	{
		level.timerstopped = 0;
		level.playabletimerstopped = 0;
		level.discardtime = level.discardtime + (gettime() - level.timerpausetime);
	}
}

/*
	Name: pausetimer
	Namespace: hostmigration
	Checksum: 0x79B064D5
	Offset: 0x1F0
	Size: 0x10
	Parameters: 0
	Flags: None
*/
function pausetimer()
{
	level.migrationtimerpausetime = gettime();
}

/*
	Name: resumetimer
	Namespace: hostmigration
	Checksum: 0x5C5452E8
	Offset: 0x208
	Size: 0x28
	Parameters: 0
	Flags: None
*/
function resumetimer()
{
	level.discardtime = level.discardtime + (gettime() - level.migrationtimerpausetime);
}

/*
	Name: locktimer
	Namespace: hostmigration
	Checksum: 0x115BE52E
	Offset: 0x238
	Size: 0x80
	Parameters: 0
	Flags: None
*/
function locktimer()
{
	level endon(#"host_migration_begin", #"host_migration_end");
	for(;;)
	{
		currtime = gettime();
		waitframe(1);
		if(!level.timerstopped && isdefined(level.discardtime))
		{
			level.discardtime = level.discardtime + (gettime() - currtime);
		}
	}
}

/*
	Name: matchstarttimerconsole_internal
	Namespace: hostmigration
	Checksum: 0xE1FC79B5
	Offset: 0x2C0
	Size: 0x72
	Parameters: 1
	Flags: Linked
*/
function matchstarttimerconsole_internal(counttime)
{
	waittillframeend();
	level endon(#"match_start_timer_beginning");
	luinotifyevent(#"create_prematch_timer", 2, gettime() + (int(counttime * 1000)), 1);
	wait(counttime);
}

/*
	Name: matchstarttimerconsole
	Namespace: hostmigration
	Checksum: 0xB8F8B5F8
	Offset: 0x340
	Size: 0xEC
	Parameters: 2
	Flags: Linked
*/
function matchstarttimerconsole(type, duration)
{
	level notify(#"match_start_timer_beginning");
	waitframe(1);
	counttime = int(duration);
	if(isdefined(level.host_migration_activate_visionset_func))
	{
		level thread [[level.host_migration_activate_visionset_func]]();
	}
	var_5654073f = counttime >= 2;
	if(var_5654073f)
	{
		matchstarttimerconsole_internal(counttime);
	}
	if(isdefined(level.host_migration_deactivate_visionset_func))
	{
		level thread [[level.host_migration_deactivate_visionset_func]]();
	}
	luinotifyevent(#"prematch_timer_ended", 1, var_5654073f);
}

/*
	Name: hostmigrationwait
	Namespace: hostmigration
	Checksum: 0x1AA0881C
	Offset: 0x438
	Size: 0xBA
	Parameters: 0
	Flags: None
*/
function hostmigrationwait()
{
	level endon(#"game_ended");
	if(level.hostmigrationreturnedplayercount < (level.players.size * 2) / 3)
	{
		thread matchstarttimerconsole("waiting_for_teams", 20);
		hostmigrationwaitforplayers();
	}
	potm::function_f22ccf4a();
	level notify(#"host_migration_countdown_begin");
	thread matchstarttimerconsole("match_starting_in", 5);
	wait(5);
}

/*
	Name: waittillhostmigrationcountdown
	Namespace: hostmigration
	Checksum: 0xE763F1F2
	Offset: 0x500
	Size: 0x44
	Parameters: 0
	Flags: None
*/
function waittillhostmigrationcountdown()
{
	level endon(#"host_migration_end");
	if(!isdefined(level.hostmigrationtimer))
	{
		return;
	}
	level waittill(#"host_migration_countdown_begin");
}

/*
	Name: hostmigrationwaitforplayers
	Namespace: hostmigration
	Checksum: 0xF30D07BE
	Offset: 0x550
	Size: 0x20
	Parameters: 0
	Flags: Linked
*/
function hostmigrationwaitforplayers()
{
	level endon(#"hostmigration_enoughplayers");
	wait(15);
}

/*
	Name: hostmigrationtimerthink_internal
	Namespace: hostmigration
	Checksum: 0xB466DCE1
	Offset: 0x578
	Size: 0xE4
	Parameters: 0
	Flags: Linked
*/
function hostmigrationtimerthink_internal()
{
	level endon(#"host_migration_begin", #"host_migration_end");
	self.hostmigrationcontrolsfrozen = 0;
	while(!isalive(self))
	{
		self waittill(#"spawned");
	}
	self.hostmigrationcontrolsfrozen = 1;
	val::set(#"hostmigration", "freezecontrols", 1);
	val::set(#"hostmigration", "disablegadgets", 1);
	level waittill(#"host_migration_end");
}

/*
	Name: hostmigrationtimerthink
	Namespace: hostmigration
	Checksum: 0x2A3B5556
	Offset: 0x668
	Size: 0x94
	Parameters: 0
	Flags: None
*/
function hostmigrationtimerthink()
{
	self endon(#"disconnect");
	level endon(#"host_migration_begin");
	hostmigrationtimerthink_internal();
	if(self.hostmigrationcontrolsfrozen)
	{
		val::reset(#"hostmigration", "freezecontrols");
		val::reset(#"hostmigration", "disablegadgets");
	}
}

/*
	Name: waittillhostmigrationdone
	Namespace: hostmigration
	Checksum: 0x15109E43
	Offset: 0x708
	Size: 0x44
	Parameters: 0
	Flags: Linked
*/
function waittillhostmigrationdone()
{
	if(!isdefined(level.hostmigrationtimer))
	{
		return 0;
	}
	starttime = gettime();
	level waittill(#"host_migration_end");
	return gettime() - starttime;
}

/*
	Name: waittillhostmigrationstarts
	Namespace: hostmigration
	Checksum: 0x1E9331A6
	Offset: 0x758
	Size: 0x38
	Parameters: 1
	Flags: Linked
*/
function waittillhostmigrationstarts(duration)
{
	if(isdefined(level.hostmigrationtimer))
	{
		return;
	}
	level endon(#"host_migration_begin");
	wait(duration);
}

/*
	Name: waitlongdurationwithhostmigrationpause
	Namespace: hostmigration
	Checksum: 0xA0342DE6
	Offset: 0x798
	Size: 0x13C
	Parameters: 1
	Flags: Linked
*/
function waitlongdurationwithhostmigrationpause(duration)
{
	if(duration == 0)
	{
		return;
	}
	/#
		assert(duration > 0);
	#/
	starttime = gettime();
	endtime = gettime() + (int(duration * 1000));
	while(gettime() < endtime)
	{
		waittillhostmigrationstarts((float(endtime - gettime())) / 1000);
		if(isdefined(level.hostmigrationtimer))
		{
			timepassed = waittillhostmigrationdone();
			endtime = endtime + timepassed;
		}
	}
	/#
		if(gettime() != endtime)
		{
			println((("" + gettime()) + "") + endtime);
		}
	#/
	waittillhostmigrationdone();
	return gettime() - starttime;
}

/*
	Name: waitlongdurationwithhostmigrationpauseemp
	Namespace: hostmigration
	Checksum: 0x22335C8E
	Offset: 0x8E0
	Size: 0x15E
	Parameters: 1
	Flags: None
*/
function waitlongdurationwithhostmigrationpauseemp(duration)
{
	if(duration == 0)
	{
		return;
	}
	/#
		assert(duration > 0);
	#/
	starttime = gettime();
	empendtime = gettime() + (int(duration * 1000));
	level.empendtime = empendtime;
	while(gettime() < empendtime)
	{
		waittillhostmigrationstarts((float(empendtime - gettime())) / 1000);
		if(isdefined(level.hostmigrationtimer))
		{
			timepassed = waittillhostmigrationdone();
			if(isdefined(empendtime))
			{
				empendtime = empendtime + timepassed;
			}
		}
	}
	/#
		if(gettime() != empendtime)
		{
			println((("" + gettime()) + "") + empendtime);
		}
	#/
	waittillhostmigrationdone();
	level.empendtime = undefined;
	return gettime() - starttime;
}

/*
	Name: waitlongdurationwithgameendtimeupdate
	Namespace: hostmigration
	Checksum: 0x343D229E
	Offset: 0xA48
	Size: 0x196
	Parameters: 1
	Flags: None
*/
function waitlongdurationwithgameendtimeupdate(duration)
{
	if(duration == 0)
	{
		return;
	}
	/#
		assert(duration > 0);
	#/
	starttime = gettime();
	endtime = gettime() + (int(duration * 1000));
	while(gettime() < endtime)
	{
		waittillhostmigrationstarts((float(endtime - gettime())) / 1000);
		while(isdefined(level.hostmigrationtimer))
		{
			endtime = endtime + 1000;
			setgameendtime(int(endtime));
			wait(1);
		}
	}
	/#
		if(gettime() != endtime)
		{
			println((("" + gettime()) + "") + endtime);
		}
	#/
	while(isdefined(level.hostmigrationtimer))
	{
		endtime = endtime + 1000;
		setgameendtime(int(endtime));
		wait(1);
	}
	return gettime() - starttime;
}

/*
	Name: migrationawarewait
	Namespace: hostmigration
	Checksum: 0x4D6A5E6E
	Offset: 0xBE8
	Size: 0xF0
	Parameters: 1
	Flags: None
*/
function migrationawarewait(durationms)
{
	waittillhostmigrationdone();
	endtime = gettime() + durationms;
	timeremaining = durationms;
	while(true)
	{
		event = level util::waittill_level_any_timeout(float(timeremaining) / 1000, self, "game_ended", "host_migration_begin");
		if(event != "host_migration_begin")
		{
			return;
		}
		timeremaining = endtime - gettime();
		if(timeremaining <= 0)
		{
			return;
		}
		endtime = gettime() + durationms;
		waittillhostmigrationdone();
	}
}

/*
	Name: function_8d332f88
	Namespace: hostmigration
	Checksum: 0xAA373EBD
	Offset: 0xCE0
	Size: 0x140
	Parameters: 1
	Flags: Linked
*/
function function_8d332f88(durationms)
{
	waittillhostmigrationdone();
	endtime = gettime() + durationms;
	timeremaining = durationms;
	while(true)
	{
		if(is_true(level.var_e80a117f))
		{
			waitframe(1);
			continue;
		}
		event = level util::waittill_level_any_timeout(float(timeremaining) / 1000, self, "game_ended", "host_migration_begin", "esports_game_paused");
		if(event != "host_migration_begin" && event != "esports_game_paused")
		{
			return;
		}
		timeremaining = endtime - gettime();
		if(timeremaining <= 0)
		{
			return;
		}
		if(event == "host_migration_begin")
		{
			endtime = gettime() + durationms;
			waittillhostmigrationdone();
		}
	}
}

