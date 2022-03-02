#namespace blackboard;

/*
	Name: function_4180bd55
	Namespace: blackboard
	Checksum: 0x85D9226B
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4180bd55()
{
	level notify(1714384782);
}

/*
	Name: registerblackboardattribute
	Namespace: blackboard
	Checksum: 0x5FD05A3F
	Offset: 0x80
	Size: 0x11C
	Parameters: 4
	Flags: None
*/
function registerblackboardattribute(entity, attributename, defaultattributevalue, getterfunction)
{
	/#
		assert(isdefined(entity.__blackboard), "");
	#/
	/#
		assert(!isdefined(entity.__blackboard[attributename]), ("" + attributename) + "");
	#/
	if(isdefined(getterfunction))
	{
		/#
			assert(isfunctionptr(getterfunction));
		#/
		entity.__blackboard[attributename] = getterfunction;
	}
	else
	{
		if(!isdefined(defaultattributevalue))
		{
			defaultattributevalue = undefined;
		}
		entity.__blackboard[attributename] = defaultattributevalue;
	}
	/#
		if(isactor(entity))
		{
			entity trackblackboardattribute(attributename);
		}
	#/
}

/*
	Name: getstructblackboardattribute
	Namespace: blackboard
	Checksum: 0x103B8158
	Offset: 0x1A8
	Size: 0xC0
	Parameters: 2
	Flags: Linked
*/
function getstructblackboardattribute(struct, attributename)
{
	/#
		assert(isstruct(struct) || isentity(struct));
	#/
	if(isfunctionptr(struct.__blackboard[attributename]))
	{
		getterfunction = struct.__blackboard[attributename];
		attributevalue = struct [[getterfunction]]();
		return attributevalue;
	}
	return struct.__blackboard[attributename];
}

/*
	Name: setstructblackboardattribute
	Namespace: blackboard
	Checksum: 0xBD3FD081
	Offset: 0x278
	Size: 0xEC
	Parameters: 3
	Flags: None
*/
function setstructblackboardattribute(struct, attributename, attributevalue)
{
	/#
		assert(isstruct(struct) || isentity(struct));
	#/
	if(isdefined(struct.__blackboard[attributename]))
	{
		if(!isdefined(attributevalue) && isfunctionptr(struct.__blackboard[attributename]))
		{
			return;
		}
		/#
			assert(!isfunctionptr(struct.__blackboard[attributename]), "");
		#/
	}
	struct.__blackboard[attributename] = attributevalue;
}

/*
	Name: createblackboardforentity
	Namespace: blackboard
	Checksum: 0x2582D08
	Offset: 0x370
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function createblackboardforentity(entity)
{
	if(!isdefined(entity.__blackboard))
	{
		entity.__blackboard = [];
		if(isentity(entity))
		{
			entity createblackboardentries();
		}
	}
	if(!isdefined(level._setblackboardattributefunc))
	{
		level._setblackboardattributefunc = &setblackboardattribute;
	}
}

/*
	Name: cloneblackboardfromstruct
	Namespace: blackboard
	Checksum: 0xADEDF93
	Offset: 0x3F8
	Size: 0xFC
	Parameters: 1
	Flags: None
*/
function cloneblackboardfromstruct(struct)
{
	/#
		assert(isstruct(struct) || isentity(struct));
	#/
	blackboard = [];
	if(isdefined(struct.__blackboard))
	{
		foreach(k, v in struct.__blackboard)
		{
			blackboard[k] = getstructblackboardattribute(struct, k);
		}
	}
	return blackboard;
}

