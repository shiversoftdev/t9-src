#namespace animationstatenetwork;

/*
	Name: initnotetrackhandler
	Namespace: animationstatenetwork
	Checksum: 0x79AA0200
	Offset: 0x60
	Size: 0x10
	Parameters: 0
	Flags: AutoExec
*/
function autoexec initnotetrackhandler()
{
	level._notetrack_handler = [];
}

/*
	Name: runnotetrackhandler
	Namespace: animationstatenetwork
	Checksum: 0x145DC21F
	Offset: 0x78
	Size: 0x8C
	Parameters: 1
	Flags: Private, Event
*/
event private runnotetrackhandler(eventstruct)
{
	/#
		assert(isarray(eventstruct.notetracks));
	#/
	for(index = 0; index < eventstruct.notetracks.size; index++)
	{
		handlenotetrack(eventstruct.entity, eventstruct.notetracks[index]);
	}
}

/*
	Name: handlenotetrack
	Namespace: animationstatenetwork
	Checksum: 0x24BF49A7
	Offset: 0x110
	Size: 0x84
	Parameters: 2
	Flags: Linked, Private
*/
function private handlenotetrack(entity, notetrack)
{
	notetrackhandler = level._notetrack_handler[notetrack];
	if(!isdefined(notetrackhandler))
	{
		return;
	}
	if(isfunctionptr(notetrackhandler))
	{
		[[notetrackhandler]](entity);
	}
	else
	{
		entity setblackboardattribute(notetrackhandler.blackboardattributename, notetrackhandler.blackboardvalue);
	}
}

/*
	Name: registernotetrackhandlerfunction
	Namespace: animationstatenetwork
	Checksum: 0x19347EE2
	Offset: 0x1A0
	Size: 0xC4
	Parameters: 2
	Flags: Linked
*/
function registernotetrackhandlerfunction(notetrackname, notetrackfuncptr)
{
	/#
		assert(isstring(notetrackname), "");
	#/
	/#
		assert(isfunctionptr(notetrackfuncptr), "");
	#/
	/#
		assert(!isdefined(level._notetrack_handler[notetrackname]), ("" + notetrackname) + "");
	#/
	level._notetrack_handler[notetrackname] = notetrackfuncptr;
}

/*
	Name: registerblackboardnotetrackhandler
	Namespace: animationstatenetwork
	Checksum: 0xCC79A96E
	Offset: 0x270
	Size: 0x5C
	Parameters: 3
	Flags: Linked
*/
function registerblackboardnotetrackhandler(notetrackname, blackboardattributename, blackboardvalue)
{
	notetrackhandler = spawnstruct();
	notetrackhandler.blackboardattributename = blackboardattributename;
	notetrackhandler.blackboardvalue = blackboardvalue;
	level._notetrack_handler[notetrackname] = notetrackhandler;
}

