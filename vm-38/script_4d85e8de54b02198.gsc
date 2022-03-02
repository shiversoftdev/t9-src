#namespace animation_state_machine_notetracks;

/*
	Name: function_94ad7dd9
	Namespace: animation_state_machine_notetracks
	Checksum: 0xA7ADFFE0
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_94ad7dd9()
{
	level notify(792120915);
}

#namespace animationstatenetwork;

/*
	Name: initnotetrackhandler
	Namespace: animationstatenetwork
	Checksum: 0x59E4F092
	Offset: 0x80
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
	Checksum: 0x7B71A8
	Offset: 0x98
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
	Checksum: 0x4F76DA15
	Offset: 0x130
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
	Checksum: 0xD2A7C853
	Offset: 0x1C0
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
	Checksum: 0xB6F83B8B
	Offset: 0x290
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

