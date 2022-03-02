#namespace ai_interface;

/*
	Name: function_6a8ca704
	Namespace: ai_interface
	Checksum: 0x229D0BA2
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6a8ca704()
{
	level notify(893872920);
}

/*
	Name: main
	Namespace: ai_interface
	Checksum: 0xA6106F93
	Offset: 0xD8
	Size: 0x34
	Parameters: 0
	Flags: AutoExec
*/
function autoexec main()
{
	/#
		level.__ai_debuginterface = getdvarint(#"ai_debuginterface", 0);
	#/
}

/*
	Name: _checkvalue
	Namespace: ai_interface
	Checksum: 0x74B923BB
	Offset: 0x118
	Size: 0x31A
	Parameters: 3
	Flags: Private
*/
function private _checkvalue(archetype, attributename, value)
{
	/#
		attribute = level.__ai_interface[archetype][attributename];
		switch(attribute[#"type"])
		{
			case "_interface_entity":
			{
				break;
			}
			case "_interface_match":
			{
				possiblevalues = attribute[#"values"];
				/#
					assert(!isarray(possiblevalues) || isinarray(possiblevalues, value), ((("" + value) + "") + attributename) + "");
				#/
				break;
			}
			case "_interface_numeric":
			{
				maxvalue = attribute[#"max_value"];
				minvalue = attribute[#"min_value"];
				/#
					assert(isint(value) || isfloat(value), ((("" + attributename) + "") + value) + "");
				#/
				/#
					assert(!isdefined(maxvalue) && !isdefined(minvalue) || (value <= maxvalue && value >= minvalue), ((((("" + value) + "") + minvalue) + "") + maxvalue) + "");
				#/
				break;
			}
			case "_interface_vector":
			{
				if(isdefined(value))
				{
					/#
						assert(isvec(value), ((("" + attributename) + "") + value) + "");
					#/
				}
				break;
			}
			default:
			{
				/#
					assert(((("" + attribute[#"type"]) + "") + attributename) + "");
				#/
				break;
			}
		}
	#/
}

/*
	Name: _checkprerequisites
	Namespace: ai_interface
	Checksum: 0xA5020092
	Offset: 0x440
	Size: 0x30C
	Parameters: 2
	Flags: Private
*/
function private _checkprerequisites(entity, attribute)
{
	/#
		if(isdefined(level.__ai_debuginterface) && level.__ai_debuginterface > 0)
		{
			/#
				assert(isentity(entity) || isstruct(entity), "");
			#/
			/#
				assert(isactor(entity) || isvehicle(entity) || isstruct(entity) || isbot(entity), "");
			#/
			/#
				assert(isstring(attribute), "");
			#/
			/#
				assert(isarray(entity.__interface), (("" + function_9e72a96(entity.archetype)) + "") + "");
			#/
			/#
				assert(isarray(level.__ai_interface), "");
			#/
			/#
				assert(isarray(level.__ai_interface[entity.archetype]), ("" + function_9e72a96(entity.archetype)) + "");
			#/
			/#
				assert(isarray(level.__ai_interface[entity.archetype][attribute]), (("" + attribute) + "") + function_9e72a96(entity.archetype) + "");
			#/
			/#
				assert(isstring(level.__ai_interface[entity.archetype][attribute][#"type"]), ("" + attribute) + "");
			#/
		}
	#/
}

/*
	Name: _checkregistrationprerequisites
	Namespace: ai_interface
	Checksum: 0xD844C171
	Offset: 0x758
	Size: 0xC4
	Parameters: 3
	Flags: Private
*/
function private _checkregistrationprerequisites(archetype, attribute, callbackfunction)
{
	/#
		/#
			assert(function_7a600918(archetype), "");
		#/
		/#
			assert(function_7a600918(attribute), "");
		#/
		/#
			assert(!isdefined(callbackfunction) || isfunctionptr(callbackfunction), "");
		#/
	#/
}

/*
	Name: _initializelevelinterface
	Namespace: ai_interface
	Checksum: 0x3194A2CB
	Offset: 0x828
	Size: 0x50
	Parameters: 1
	Flags: Linked, Private
*/
function private _initializelevelinterface(archetype)
{
	if(!isdefined(level.__ai_interface))
	{
		level.__ai_interface = [];
	}
	if(!isdefined(level.__ai_interface[archetype]))
	{
		level.__ai_interface[archetype] = [];
	}
}

#namespace ai;

/*
	Name: createinterfaceforentity
	Namespace: ai
	Checksum: 0x9A3FDDF3
	Offset: 0x880
	Size: 0x26
	Parameters: 1
	Flags: Linked
*/
function createinterfaceforentity(entity)
{
	if(!isdefined(entity.__interface))
	{
		entity.__interface = [];
	}
}

/*
	Name: getaiattribute
	Namespace: ai
	Checksum: 0x40291483
	Offset: 0x8B0
	Size: 0x7C
	Parameters: 2
	Flags: Linked
*/
function getaiattribute(entity, attribute)
{
	/#
		ai_interface::_checkprerequisites(entity, attribute);
	#/
	if(!isdefined(entity.__interface[attribute]))
	{
		return level.__ai_interface[entity.archetype][attribute][#"default_value"];
	}
	return entity.__interface[attribute];
}

/*
	Name: hasaiattribute
	Namespace: ai
	Checksum: 0xBE1745E7
	Offset: 0x938
	Size: 0x7A
	Parameters: 2
	Flags: Linked
*/
function hasaiattribute(entity, attribute)
{
	return isdefined(entity) && isdefined(attribute) && isdefined(entity.archetype) && isdefined(level.__ai_interface) && isdefined(level.__ai_interface[entity.archetype]) && isdefined(level.__ai_interface[entity.archetype][attribute]);
}

/*
	Name: registerentityinterface
	Namespace: ai
	Checksum: 0x364F2D6E
	Offset: 0x9C0
	Size: 0x154
	Parameters: 4
	Flags: None
*/
function registerentityinterface(archetype, attribute, defaultvalue, callbackfunction)
{
	/#
		ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
	#/
	ai_interface::_initializelevelinterface(archetype);
	/#
		/#
			assert(!isdefined(level.__ai_interface[archetype][attribute]), ((("" + attribute) + "") + archetype) + "");
		#/
	#/
	level.__ai_interface[archetype][attribute] = [];
	level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
	level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
	level.__ai_interface[archetype][attribute][#"type"] = "_interface_entity";
	/#
		ai_interface::_checkvalue(archetype, attribute, defaultvalue);
	#/
}

/*
	Name: registermatchedinterface
	Namespace: ai
	Checksum: 0x9C3B4FDD
	Offset: 0xB20
	Size: 0x1BC
	Parameters: 5
	Flags: Linked
*/
function registermatchedinterface(archetype, attribute, defaultvalue, possiblevalues, callbackfunction)
{
	/#
		ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
		/#
			assert(!isdefined(possiblevalues) || isarray(possiblevalues), "");
		#/
	#/
	ai_interface::_initializelevelinterface(archetype);
	/#
		/#
			assert(!isdefined(level.__ai_interface[archetype][attribute]), ((("" + attribute) + "") + archetype) + "");
		#/
	#/
	level.__ai_interface[archetype][attribute] = [];
	level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
	level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
	level.__ai_interface[archetype][attribute][#"type"] = "_interface_match";
	level.__ai_interface[archetype][attribute][#"values"] = possiblevalues;
	/#
		ai_interface::_checkvalue(archetype, attribute, defaultvalue);
	#/
}

/*
	Name: registernumericinterface
	Namespace: ai
	Checksum: 0xF58FEF53
	Offset: 0xCE8
	Size: 0x2EC
	Parameters: 6
	Flags: None
*/
function registernumericinterface(archetype, attribute, defaultvalue, minimum, maximum, callbackfunction)
{
	/#
		ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
		/#
			assert(!isdefined(minimum) || isint(minimum) || isfloat(minimum), "");
		#/
		/#
			assert(!isdefined(maximum) || isint(maximum) || isfloat(maximum), "");
		#/
		/#
			assert(!isdefined(minimum) && !isdefined(maximum) || (isdefined(minimum) && isdefined(maximum)), "");
		#/
		/#
			assert(!isdefined(minimum) && !isdefined(maximum) || minimum <= maximum, (("" + attribute) + "") + "");
		#/
	#/
	ai_interface::_initializelevelinterface(archetype);
	/#
		/#
			assert(!isdefined(level.__ai_interface[archetype][attribute]), ((("" + attribute) + "") + archetype) + "");
		#/
	#/
	level.__ai_interface[archetype][attribute] = [];
	level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
	level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
	level.__ai_interface[archetype][attribute][#"max_value"] = maximum;
	level.__ai_interface[archetype][attribute][#"min_value"] = minimum;
	level.__ai_interface[archetype][attribute][#"type"] = "_interface_numeric";
	/#
		ai_interface::_checkvalue(archetype, attribute, defaultvalue);
	#/
}

/*
	Name: registervectorinterface
	Namespace: ai
	Checksum: 0x5B050346
	Offset: 0xFE0
	Size: 0x154
	Parameters: 4
	Flags: None
*/
function registervectorinterface(archetype, attribute, defaultvalue, callbackfunction)
{
	/#
		ai_interface::_checkregistrationprerequisites(archetype, attribute, callbackfunction);
	#/
	ai_interface::_initializelevelinterface(archetype);
	/#
		/#
			assert(!isdefined(level.__ai_interface[archetype][attribute]), ((("" + attribute) + "") + archetype) + "");
		#/
	#/
	level.__ai_interface[archetype][attribute] = [];
	level.__ai_interface[archetype][attribute][#"callback"] = callbackfunction;
	level.__ai_interface[archetype][attribute][#"default_value"] = defaultvalue;
	level.__ai_interface[archetype][attribute][#"type"] = "_interface_vector";
	/#
		ai_interface::_checkvalue(archetype, attribute, defaultvalue);
	#/
}

/*
	Name: setaiattribute
	Namespace: ai
	Checksum: 0x956ADD97
	Offset: 0x1140
	Size: 0x110
	Parameters: 3
	Flags: Linked
*/
function setaiattribute(entity, attribute, value)
{
	/#
		ai_interface::_checkprerequisites(entity, attribute);
		ai_interface::_checkvalue(entity.archetype, attribute, value);
	#/
	oldvalue = entity.__interface[attribute];
	if(!isdefined(oldvalue))
	{
		oldvalue = level.__ai_interface[entity.archetype][attribute][#"default_value"];
	}
	entity.__interface[attribute] = value;
	callback = level.__ai_interface[entity.archetype][attribute][#"callback"];
	if(isfunctionptr(callback))
	{
		[[callback]](entity, attribute, oldvalue, value);
	}
}

