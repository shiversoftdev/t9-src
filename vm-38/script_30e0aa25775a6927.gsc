#namespace planner_blackboard;

/*
	Name: function_dc255b49
	Namespace: planner_blackboard
	Checksum: 0x9E9AE2EF
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_dc255b49()
{
	level notify(986354667);
}

#namespace plannerblackboard;

/*
	Name: main
	Namespace: plannerblackboard
	Checksum: 0xC5CE24CF
	Offset: 0x90
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
	Checksum: 0xE9CDF164
	Offset: 0xD0
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
	Checksum: 0x42FA3A9B
	Offset: 0x118
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
	Checksum: 0xE8913676
	Offset: 0x1A0
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
		assert(isstring(attribute) || ishash(attribute));
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
	Checksum: 0xB39A1657
	Offset: 0x2A0
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
	Checksum: 0x14DA3484
	Offset: 0x318
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
		assert(isstring(attribute) || ishash(attribute));
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
	Checksum: 0x7CC370CF
	Offset: 0x5D0
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
	Checksum: 0xD68B0840
	Offset: 0x5F8
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
	Checksum: 0xBD476E95
	Offset: 0x620
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

