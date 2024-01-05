#namespace ai_blackboard;

/*
	Name: function_ad099e4c
	Namespace: ai_blackboard
	Checksum: 0xFFBEF5BA
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ad099e4c()
{
	level notify(102183226);
}

#namespace blackboard;

/*
	Name: main
	Namespace: blackboard
	Checksum: 0xAF313305
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	_initializeblackboard();
}

/*
	Name: _initializeblackboard
	Namespace: blackboard
	Checksum: 0xB0020FAB
	Offset: 0xA0
	Size: 0x24
	Parameters: 0
	Flags: Linked, Private
*/
function private _initializeblackboard()
{
	level.__ai_blackboard = [];
	level thread _updateevents();
}

/*
	Name: _updateevents
	Namespace: blackboard
	Checksum: 0x187886E2
	Offset: 0xD0
	Size: 0x1AE
	Parameters: 0
	Flags: Linked, Private
*/
function private _updateevents()
{
	waittime = 1 * (float(function_60d95f53()) / 1000);
	updatemillis = int(waittime * 1000);
	while(true)
	{
		foreach(events in level.__ai_blackboard)
		{
			liveevents = [];
			foreach(event in events)
			{
				event.ttl = event.ttl - updatemillis;
				if(event.ttl > 0)
				{
					liveevents[liveevents.size] = event;
				}
			}
			level.__ai_blackboard[eventname] = liveevents;
		}
		wait(waittime);
	}
}

/*
	Name: addblackboardevent
	Namespace: blackboard
	Checksum: 0xD22E2C8D
	Offset: 0x288
	Size: 0x1A2
	Parameters: 3
	Flags: Linked
*/
function addblackboardevent(eventname, data, timetoliveinmillis)
{
	/#
		/#
			assert(isstring(eventname) || ishash(eventname), "");
		#/
		/#
			assert(isdefined(data), "");
		#/
		/#
			assert(isint(timetoliveinmillis) && timetoliveinmillis > 0, "");
		#/
	#/
	event = spawnstruct();
	event.data = data;
	event.timestamp = gettime();
	event.ttl = timetoliveinmillis;
	if(!isdefined(level.__ai_blackboard[eventname]))
	{
		level.__ai_blackboard[eventname] = [];
	}
	else if(!isarray(level.__ai_blackboard[eventname]))
	{
		level.__ai_blackboard[eventname] = array(level.__ai_blackboard[eventname]);
	}
	level.__ai_blackboard[eventname][level.__ai_blackboard[eventname].size] = event;
}

/*
	Name: getblackboardevents
	Namespace: blackboard
	Checksum: 0x1FCB3744
	Offset: 0x438
	Size: 0x34
	Parameters: 1
	Flags: Linked
*/
function getblackboardevents(eventname)
{
	if(isdefined(level.__ai_blackboard[eventname]))
	{
		return level.__ai_blackboard[eventname];
	}
	return [];
}

/*
	Name: removeblackboardevents
	Namespace: blackboard
	Checksum: 0x22ECAF41
	Offset: 0x478
	Size: 0x30
	Parameters: 1
	Flags: None
*/
function removeblackboardevents(eventname)
{
	if(isdefined(level.__ai_blackboard[eventname]))
	{
		level.__ai_blackboard[eventname] = undefined;
	}
}

