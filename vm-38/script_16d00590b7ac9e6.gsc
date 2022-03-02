#namespace animation_selector_table;

/*
	Name: function_102df6b3
	Namespace: animation_selector_table
	Checksum: 0x9192A323
	Offset: 0x60
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_102df6b3()
{
	level notify(298438323);
}

#namespace animationselectortable;

/*
	Name: registeranimationselectortableevaluator
	Namespace: animationselectortable
	Checksum: 0x845416CD
	Offset: 0x80
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

