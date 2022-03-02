#namespace behavior_state_machine;

/*
	Name: function_4fe407dc
	Namespace: behavior_state_machine
	Checksum: 0x4BE735F1
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4fe407dc()
{
	level notify(109807879);
}

#namespace behaviorstatemachine;

/*
	Name: registerbsmscriptapiinternal
	Namespace: behaviorstatemachine
	Checksum: 0x50CBE010
	Offset: 0x80
	Size: 0xBC
	Parameters: 2
	Flags: Linked
*/
function registerbsmscriptapiinternal(functionname, scriptfunction)
{
	if(!isdefined(level._bsmscriptfunctions))
	{
		level._bsmscriptfunctions = [];
	}
	/#
		assert(isdefined(scriptfunction) && isdefined(scriptfunction), "");
	#/
	/#
		if(!is_true(level.var_70f1c402))
		{
			/#
				assert(!isdefined(level._bsmscriptfunctions[functionname]), "");
			#/
		}
	#/
	level._bsmscriptfunctions[functionname] = scriptfunction;
}

