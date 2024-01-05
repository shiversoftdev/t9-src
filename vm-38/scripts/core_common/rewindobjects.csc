#using scripts\core_common\system_shared.csc;

#namespace rewindobjects;

/*
	Name: function_f4749dcc
	Namespace: rewindobjects
	Checksum: 0x75A95D14
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f4749dcc()
{
	level notify(-378612056);
}

/*
	Name: __init__system__
	Namespace: rewindobjects
	Checksum: 0x9BA7B76B
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"rewindobjects", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: rewindobjects
	Checksum: 0x797B3793
	Offset: 0xF8
	Size: 0x10
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.rewindwatcherarray = [];
}

/*
	Name: initrewindobjectwatchers
	Namespace: rewindobjects
	Checksum: 0x6EEF6E9A
	Offset: 0x110
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function initrewindobjectwatchers(localclientnum)
{
	level.rewindwatcherarray[localclientnum] = [];
	createnapalmrewindwatcher(localclientnum);
	createairstrikerewindwatcher(localclientnum);
	level thread watchrewindableevents(localclientnum);
}

/*
	Name: watchrewindableevents
	Namespace: rewindobjects
	Checksum: 0xAE569C98
	Offset: 0x180
	Size: 0x168
	Parameters: 1
	Flags: None
*/
function watchrewindableevents(localclientnum)
{
	for(;;)
	{
		if(isdefined(level.rewindwatcherarray[localclientnum]))
		{
			rewindwatcherkeys = getarraykeys(level.rewindwatcherarray[localclientnum]);
			for(i = 0; i < rewindwatcherkeys.size; i++)
			{
				rewindwatcher = level.rewindwatcherarray[localclientnum][rewindwatcherkeys[i]];
				if(!isdefined(rewindwatcher))
				{
					continue;
				}
				if(!isdefined(rewindwatcher.event))
				{
					continue;
				}
				timekeys = getarraykeys(rewindwatcher.event);
				for(j = 0; j < timekeys.size; j++)
				{
					timekey = timekeys[j];
					if(rewindwatcher.event[timekey].inprogress == 1)
					{
						continue;
					}
					if(getservertime(0) >= timekey)
					{
						rewindwatcher thread startrewindableevent(localclientnum, timekey);
					}
				}
			}
		}
		wait(0.1);
	}
}

/*
	Name: startrewindableevent
	Namespace: rewindobjects
	Checksum: 0x97B21488
	Offset: 0x2F0
	Size: 0x1F8
	Parameters: 2
	Flags: None
*/
function startrewindableevent(localclientnum, timekey)
{
	player = function_5c10bd79(localclientnum);
	level endon("demo_jump" + localclientnum);
	self.event[timekey].inprogress = 1;
	allfunctionsstarted = 0;
	while(allfunctionsstarted == 0)
	{
		allfunctionsstarted = 1;
		/#
			assert(isdefined(self.timedfunctions));
		#/
		timedfunctionkeys = getarraykeys(self.timedfunctions);
		for(i = 0; i < timedfunctionkeys.size; i++)
		{
			timedfunction = self.timedfunctions[timedfunctionkeys[i]];
			timedfunctionkey = timedfunctionkeys[i];
			if(self.event[timekey].timedfunction[timedfunctionkey] == 1)
			{
				continue;
			}
			starttime = timekey + (int(timedfunction.starttimesec * 1000));
			if(starttime > getservertime(0))
			{
				allfunctionsstarted = 0;
				continue;
			}
			self.event[timekey].timedfunction[timedfunctionkey] = 1;
			level thread [[timedfunction.func]](localclientnum, starttime, timedfunction.starttimesec, self.event[timekey].data);
		}
		wait(0.1);
	}
}

/*
	Name: createnapalmrewindwatcher
	Namespace: rewindobjects
	Checksum: 0x4AF5BC61
	Offset: 0x4F0
	Size: 0x44
	Parameters: 1
	Flags: None
*/
function createnapalmrewindwatcher(localclientnum)
{
	napalmrewindwatcher = createrewindwatcher(localclientnum, "napalm");
	timeincreasebetweenplanes = 0;
}

/*
	Name: createairstrikerewindwatcher
	Namespace: rewindobjects
	Checksum: 0xE4D7D2BA
	Offset: 0x540
	Size: 0x36
	Parameters: 1
	Flags: None
*/
function createairstrikerewindwatcher(localclientnum)
{
	airstrikerewindwatcher = createrewindwatcher(localclientnum, "airstrike");
}

/*
	Name: createrewindwatcher
	Namespace: rewindobjects
	Checksum: 0xA832FDBF
	Offset: 0x580
	Size: 0xF0
	Parameters: 2
	Flags: None
*/
function createrewindwatcher(localclientnum, name)
{
	player = function_5c10bd79(localclientnum);
	if(!isdefined(level.rewindwatcherarray[localclientnum]))
	{
		level.rewindwatcherarray[localclientnum] = [];
	}
	rewindwatcher = getrewindwatcher(localclientnum, name);
	if(!isdefined(rewindwatcher))
	{
		rewindwatcher = spawnstruct();
		level.rewindwatcherarray[localclientnum][level.rewindwatcherarray[localclientnum].size] = rewindwatcher;
	}
	rewindwatcher.name = name;
	rewindwatcher.event = [];
	rewindwatcher thread resetondemojump(localclientnum);
	return rewindwatcher;
}

/*
	Name: resetondemojump
	Namespace: rewindobjects
	Checksum: 0x75511966
	Offset: 0x678
	Size: 0x154
	Parameters: 1
	Flags: None
*/
function resetondemojump(localclientnum)
{
	for(;;)
	{
		level waittill("demo_jump" + localclientnum);
		self.inprogress = 0;
		timedfunctionkeys = getarraykeys(self.timedfunctions);
		for(i = 0; i < timedfunctionkeys.size; i++)
		{
			self.timedfunctions[timedfunctionkeys[i]].inprogress = 0;
		}
		eventkeys = getarraykeys(self.event);
		for(i = 0; i < eventkeys.size; i++)
		{
			self.event[eventkeys[i]].inprogress = 0;
			timedfunctionkeys = getarraykeys(self.event[eventkeys[i]].timedfunction);
			for(index = 0; index < timedfunctionkeys.size; index++)
			{
				self.event[eventkeys[i]].timedfunction[timedfunctionkeys[index]] = 0;
			}
		}
	}
}

/*
	Name: addtimedfunction
	Namespace: rewindobjects
	Checksum: 0xDDEB655A
	Offset: 0x7D8
	Size: 0xC2
	Parameters: 3
	Flags: None
*/
function addtimedfunction(name, func, relativestarttimeinsecs)
{
	if(!isdefined(self.timedfunctions))
	{
		self.timedfunctions = [];
	}
	/#
		assert(!isdefined(self.timedfunctions[name]));
	#/
	self.timedfunctions[name] = spawnstruct();
	self.timedfunctions[name].inprogress = 0;
	self.timedfunctions[name].func = func;
	self.timedfunctions[name].starttimesec = relativestarttimeinsecs;
}

/*
	Name: getrewindwatcher
	Namespace: rewindobjects
	Checksum: 0xDC85F7AE
	Offset: 0x8A8
	Size: 0x92
	Parameters: 2
	Flags: None
*/
function getrewindwatcher(localclientnum, name)
{
	if(!isdefined(level.rewindwatcherarray[localclientnum]))
	{
		return undefined;
	}
	for(watcher = 0; watcher < level.rewindwatcherarray[localclientnum].size; watcher++)
	{
		if(level.rewindwatcherarray[localclientnum][watcher].name == name)
		{
			return level.rewindwatcherarray[localclientnum][watcher];
		}
	}
	return undefined;
}

/*
	Name: addrewindableeventtowatcher
	Namespace: rewindobjects
	Checksum: 0xE536A819
	Offset: 0x948
	Size: 0x10C
	Parameters: 2
	Flags: None
*/
function addrewindableeventtowatcher(starttime, data)
{
	if(isdefined(self.event[starttime]))
	{
		return;
	}
	self.event[starttime] = spawnstruct();
	self.event[starttime].data = data;
	self.event[starttime].inprogress = 0;
	if(isdefined(self.timedfunctions))
	{
		timedfunctionkeys = getarraykeys(self.timedfunctions);
		self.event[starttime].timedfunction = [];
		for(i = 0; i < timedfunctionkeys.size; i++)
		{
			timedfunctionkey = timedfunctionkeys[i];
			self.event[starttime].timedfunction[timedfunctionkey] = 0;
		}
	}
}

/*
	Name: servertimedmoveto
	Namespace: rewindobjects
	Checksum: 0x2F4ED240
	Offset: 0xA60
	Size: 0x13C
	Parameters: 5
	Flags: None
*/
function servertimedmoveto(localclientnum, startpoint, endpoint, starttime, duration)
{
	level endon("demo_jump" + localclientnum);
	timeelapsed = (getservertime(0) - starttime) * 0.001;
	/#
		assert(duration > 0);
	#/
	dojump = 1;
	if(timeelapsed < 0.02)
	{
		dojump = 0;
	}
	if(timeelapsed < duration)
	{
		movetime = duration - timeelapsed;
		if(dojump)
		{
			jumppoint = getpointonline(startpoint, endpoint, timeelapsed / duration);
			self.origin = jumppoint;
		}
		self moveto(endpoint, movetime, 0, 0);
		return true;
	}
	self.origin = endpoint;
	return false;
}

/*
	Name: servertimedrotateto
	Namespace: rewindobjects
	Checksum: 0xDFBDCB31
	Offset: 0xBA8
	Size: 0xFC
	Parameters: 6
	Flags: None
*/
function servertimedrotateto(localclientnum, angles, starttime, duration, timein, timeout)
{
	level endon("demo_jump" + localclientnum);
	timeelapsed = (getservertime(0) - starttime) * 0.001;
	if(!isdefined(timein))
	{
		timein = 0;
	}
	if(!isdefined(timeout))
	{
		timeout = 0;
	}
	/#
		assert(duration > 0);
	#/
	if(timeelapsed < duration)
	{
		rotatetime = duration - timeelapsed;
		self rotateto(angles, rotatetime, timein, timeout);
		return true;
	}
	self.angles = angles;
	return false;
}

/*
	Name: waitforservertime
	Namespace: rewindobjects
	Checksum: 0x7EC1C7CF
	Offset: 0xCB0
	Size: 0x38
	Parameters: 2
	Flags: None
*/
function waitforservertime(localclientnum, timefromstart)
{
	while(timefromstart > getservertime(0))
	{
		waitframe(1);
	}
}

/*
	Name: removecliententonjump
	Namespace: rewindobjects
	Checksum: 0x2E53605B
	Offset: 0xCF0
	Size: 0x84
	Parameters: 2
	Flags: None
*/
function removecliententonjump(clientent, localclientnum)
{
	clientent endon(#"complete");
	player = function_5c10bd79(localclientnum);
	level waittill("demo_jump" + localclientnum);
	clientent notify(#"delete");
	clientent forcedelete();
}

/*
	Name: getpointonline
	Namespace: rewindobjects
	Checksum: 0x9905A7C8
	Offset: 0xD80
	Size: 0x8E
	Parameters: 3
	Flags: None
*/
function getpointonline(startpoint, endpoint, ratio)
{
	nextpoint = (startpoint[0] + ((endpoint[0] - startpoint[0]) * ratio), startpoint[1] + ((endpoint[1] - startpoint[1]) * ratio), startpoint[2] + ((endpoint[2] - startpoint[2]) * ratio));
	return nextpoint;
}

