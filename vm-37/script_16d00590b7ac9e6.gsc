#namespace animationselectortable;

/*
	Name: registeranimationselectortableevaluator
	Namespace: animationselectortable
	Checksum: 0xDCCB1743
	Offset: 0x60
	Size: 0xA4
	Parameters: 2
	Flags: Linked
*/
function registeranimationselectortableevaluator(functionname, functionptr)
{
	if(!isdefined(level._astevaluatorscriptfunctions))
	{
		level._astevaluatorscriptfunctions = [];
	}
	functionname = tolower(functionname);
	/#
		assert(isdefined(functionname) && isdefined(functionptr));
	#/
	/#
		assert(!isdefined(level._astevaluatorscriptfunctions[functionname]));
	#/
	level._astevaluatorscriptfunctions[functionname] = functionptr;
}

