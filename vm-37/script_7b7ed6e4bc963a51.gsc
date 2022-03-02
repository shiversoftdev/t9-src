#namespace blackboard;

/*
	Name: main
	Namespace: blackboard
	Checksum: 0xA74AD6CB
	Offset: 0x60
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
	Checksum: 0xAB1EFB24
	Offset: 0x80
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
	Checksum: 0x2C4C51B7
	Offset: 0xB0
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
	Checksum: 0xB49E94BD
	Offset: 0x268
	Size: 0x1A2
	Parameters: 3
	Flags: Linked
*/
function addblackboardevent(eventname, data, timetoliveinmillis)
{
	/#
		/#
			assert(isstring(eventname) || function_7a600918(eventname), "");
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
	Checksum: 0x328CC708
	Offset: 0x418
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
	Checksum: 0xE70DA460
	Offset: 0x458
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

