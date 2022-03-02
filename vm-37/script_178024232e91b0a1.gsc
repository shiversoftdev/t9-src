#namespace behaviorstatemachine;

/*
	Name: registerbsmscriptapiinternal
	Namespace: behaviorstatemachine
	Checksum: 0xF16509C0
	Offset: 0x60
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

