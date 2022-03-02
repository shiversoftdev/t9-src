#namespace plannerblackboard;

/*
	Name: main
	Namespace: plannerblackboard
	Checksum: 0x9FDAA42E
	Offset: 0x70
	Size: 0x34
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	/#
		level.__ai_debugplannerblackboard = getdvarint(#"ai_debugplannerblackboard", 0);
	#/
}

/*
	Name: clearundostack
	Namespace: plannerblackboard
	Checksum: 0x11D07D02
	Offset: 0xB0
	Size: 0x3E
	Parameters: 1
	Flags: Linked
*/
function clearundostack(blackboard)
{
	/#
		assert(isstruct(blackboard));
	#/
	blackboard.undostack = [];
}

/*
	Name: create
	Namespace: plannerblackboard
	Checksum: 0xE7BA320B
	Offset: 0xF8
	Size: 0x80
	Parameters: 1
	Flags: Linked
*/
function create(&blackboardvalues)
{
	/#
		assert(isarray(blackboardvalues));
	#/
	blackboard = spawnstruct();
	blackboard.undostack = [];
	blackboard.values = blackboardvalues;
	setreadmode(blackboard);
	return blackboard;
}

/*
	Name: getattribute
	Namespace: plannerblackboard
	Checksum: 0xC74B8BA
	Offset: 0x180
	Size: 0xF8
	Parameters: 2
	Flags: Linked
*/
function getattribute(blackboard, attribute)
{
	/#
		assert(isstruct(blackboard));
	#/
	/#
		assert(isstring(attribute) || function_7a600918(attribute));
	#/
	/#
		assert(isarray(blackboard.values));
	#/
	value = blackboard.values[attribute];
	if(isarray(value))
	{
		return arraycopy(value);
	}
	return value;
}

/*
	Name: getundostacksize
	Namespace: plannerblackboard
	Checksum: 0x6B4CD41E
	Offset: 0x280
	Size: 0x70
	Parameters: 1
	Flags: Linked
*/
function getundostacksize(blackboard)
{
	/#
		assert(isstruct(blackboard));
	#/
	/#
		assert(isarray(blackboard.undostack));
	#/
	return blackboard.undostack.size;
}

/*
	Name: setattribute
	Namespace: plannerblackboard
	Checksum: 0xB70EE786
	Offset: 0x2F8
	Size: 0x2AC
	Parameters: 4
	Flags: Linked
*/
function setattribute(blackboard, attribute, value, readonly)
{
	if(!isdefined(readonly))
	{
		readonly = 0;
	}
	/#
		assert(isstruct(blackboard));
	#/
	/#
		assert(isstring(attribute) || function_7a600918(attribute));
	#/
	/#
		assert(isarray(blackboard.values));
	#/
	/#
		assert(isarray(blackboard.undostack));
	#/
	/#
		assert(blackboard.mode === "");
	#/
	/#
		if(isdefined(level.__ai_debugplannerblackboard) && level.__ai_debugplannerblackboard > 0 && !readonly)
		{
			/#
				assert(!isstruct(value), "");
			#/
			if(isarray(value))
			{
				foreach(entryvalue in value)
				{
					/#
						assert(!isstruct(entryvalue), "");
					#/
				}
			}
		}
	#/
	stackvalue = spawnstruct();
	stackvalue.attribute = attribute;
	stackvalue.value = blackboard.values[attribute];
	blackboard.undostack[blackboard.undostack.size] = stackvalue;
	blackboard.values[attribute] = value;
}

/*
	Name: setreadmode
	Namespace: plannerblackboard
	Checksum: 0xF90B91CF
	Offset: 0x5B0
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function setreadmode(blackboard)
{
	blackboard.mode = "r";
}

/*
	Name: setreadwritemode
	Namespace: plannerblackboard
	Checksum: 0xC212E5DA
	Offset: 0x5D8
	Size: 0x1A
	Parameters: 1
	Flags: Linked
*/
function setreadwritemode(blackboard)
{
	blackboard.mode = "rw";
}

/*
	Name: undo
	Namespace: plannerblackboard
	Checksum: 0x5C872E91
	Offset: 0x600
	Size: 0x144
	Parameters: 2
	Flags: Linked
*/
function undo(blackboard, stackindex)
{
	/#
		assert(isstruct(blackboard));
	#/
	/#
		assert(isarray(blackboard.values));
	#/
	/#
		assert(isarray(blackboard.undostack));
	#/
	/#
		assert(stackindex < blackboard.undostack.size);
	#/
	for(index = blackboard.undostack.size - 1; index > stackindex; index--)
	{
		stackvalue = blackboard.undostack[index];
		blackboard.values[stackvalue.attribute] = stackvalue.value;
		arrayremoveindex(blackboard.undostack, index);
	}
}

