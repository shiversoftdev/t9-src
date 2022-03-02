#namespace behavior_tree_utility;

/*
	Name: function_4077410d
	Namespace: behavior_tree_utility
	Checksum: 0x447189B0
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4077410d()
{
	level notify(1028627392);
}

#namespace behaviortreenetworkutility;

/*
	Name: registerbehaviortreescriptapi
	Namespace: behaviortreenetworkutility
	Checksum: 0x39369A3D
	Offset: 0x80
	Size: 0xE4
	Parameters: 3
	Flags: Linked
*/
function registerbehaviortreescriptapi(functionname, functionptr, allowedcallsperframe)
{
	if(!isdefined(level._behaviortreescriptfunctions))
	{
		level._behaviortreescriptfunctions = [];
	}
	/#
		assert(isdefined(functionname) && isdefined(functionptr), "");
	#/
	/#
		if(!is_true(level.var_70f1c402))
		{
			/#
				assert(!isdefined(level._behaviortreescriptfunctions[functionname]), "");
			#/
		}
	#/
	level._behaviortreescriptfunctions[functionname] = functionptr;
	if(isdefined(allowedcallsperframe))
	{
		registerlimitedbehaviortreeapi(functionname, allowedcallsperframe);
	}
}

/*
	Name: registerbehaviortreeaction
	Namespace: behaviortreenetworkutility
	Checksum: 0x669ECA6
	Offset: 0x170
	Size: 0x1EA
	Parameters: 4
	Flags: Linked
*/
function registerbehaviortreeaction(actionname, startfuncptr, updatefuncptr, terminatefuncptr)
{
	if(!isdefined(level._behaviortreeactions))
	{
		level._behaviortreeactions = [];
	}
	/#
		assert(isdefined(actionname), "");
	#/
	/#
		if(!is_true(level.var_70f1c402))
		{
			/#
				assert(!isdefined(level._behaviortreeactions[actionname]), ("" + actionname) + "");
			#/
		}
	#/
	level._behaviortreeactions[actionname] = array();
	if(isdefined(startfuncptr))
	{
		/#
			assert(isfunctionptr(startfuncptr), "");
		#/
		level._behaviortreeactions[actionname][#"bhtn_action_start"] = startfuncptr;
	}
	if(isdefined(updatefuncptr))
	{
		/#
			assert(isfunctionptr(updatefuncptr), "");
		#/
		level._behaviortreeactions[actionname][#"bhtn_action_update"] = updatefuncptr;
	}
	if(isdefined(terminatefuncptr))
	{
		/#
			assert(isfunctionptr(terminatefuncptr), "");
		#/
		level._behaviortreeactions[actionname][#"bhtn_action_terminate"] = terminatefuncptr;
	}
}

