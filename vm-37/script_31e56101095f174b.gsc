#using script_30e0aa25775a6927;

#namespace planner;

/*
	Name: _blackboardsapplyundostate
	Namespace: planner
	Checksum: 0x4E3B4E86
	Offset: 0xC0
	Size: 0x11C
	Parameters: 2
	Flags: Linked, Private
*/
function private _blackboardsapplyundostate(planner, state)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	foreach(blackboard in planner.blackboards)
	{
		if(isdefined(state[key]))
		{
			plannerblackboard::undo(blackboard, state[key]);
			continue;
		}
		planner.blackboards[key] = undefined;
	}
}

/*
	Name: _blackboardscalculateundostate
	Namespace: planner
	Checksum: 0x7F48AA78
	Offset: 0x1E8
	Size: 0x10A
	Parameters: 1
	Flags: Linked, Private
*/
function private _blackboardscalculateundostate(planner)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	state = [];
	foreach(key, blackboard in planner.blackboards)
	{
		state[key] = plannerblackboard::getundostacksize(blackboard) - 1;
	}
	return state;
}

/*
	Name: _blackboardsreadmode
	Namespace: planner
	Checksum: 0x7796BFA
	Offset: 0x300
	Size: 0xE8
	Parameters: 1
	Flags: Linked, Private
*/
function private _blackboardsreadmode(planner)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	foreach(blackboard in planner.blackboards)
	{
		plannerblackboard::setreadmode(blackboard);
	}
}

/*
	Name: _blackboardsreadwritemode
	Namespace: planner
	Checksum: 0xD3C132C8
	Offset: 0x3F0
	Size: 0xE8
	Parameters: 1
	Flags: Linked, Private
*/
function private _blackboardsreadwritemode(planner)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	foreach(blackboard in planner.blackboards)
	{
		plannerblackboard::setreadwritemode(blackboard);
	}
}

/*
	Name: _initializeplannerfunctions
	Namespace: planner
	Checksum: 0xF4FBF88A
	Offset: 0x4E0
	Size: 0x50
	Parameters: 1
	Flags: Linked, Private
*/
function private _initializeplannerfunctions(functype)
{
	if(!isdefined(level._plannerscriptfunctions))
	{
		level._plannerscriptfunctions = [];
	}
	if(!isdefined(level._plannerscriptfunctions[functype]))
	{
		level._plannerscriptfunctions[functype] = [];
	}
}

/*
	Name: _plancalculateplanindex
	Namespace: planner
	Checksum: 0xA49D4371
	Offset: 0x538
	Size: 0x1E
	Parameters: 1
	Flags: Linked, Private
*/
function private _plancalculateplanindex(planner)
{
	return planner.plan.size - 1;
}

/*
	Name: _planexpandaction
	Namespace: planner
	Checksum: 0x5DDA1522
	Offset: 0x560
	Size: 0x280
	Parameters: 2
	Flags: Linked, Private
*/
function private _planexpandaction(planner, action)
{
	planner.api = action.api;
	pixbeginevent(action.api);
	aiprofile_beginentry(action.api);
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isstruct(action));
	#/
	/#
		assert(action.type == "");
	#/
	/#
		assert(isarray(planner.plan));
	#/
	actionfuncs = plannerutility::getplanneractionfunctions(action.api);
	actioninfo = spawnstruct();
	actioninfo.name = action.api;
	if(isdefined(actionfuncs[#"parameterize"]))
	{
		_blackboardsreadwritemode(planner);
		actioninfo.params = [[actionfuncs[#"parameterize"]]](planner, action.constants);
		/#
			assert(isstruct(actioninfo.params), ("" + action.api) + "");
		#/
		_blackboardsreadmode(planner);
	}
	else
	{
		actioninfo.params = spawnstruct();
	}
	planner.plan[planner.plan.size] = actioninfo;
	planner.api = undefined;
	aiprofile_endentry();
	pixendevent();
	return true;
}

/*
	Name: _planexpandpostcondition
	Namespace: planner
	Checksum: 0xE01FE0AD
	Offset: 0x7E8
	Size: 0x170
	Parameters: 2
	Flags: Linked, Private
*/
function private _planexpandpostcondition(planner, postcondition)
{
	planner.api = postcondition.api;
	pixbeginevent(postcondition.api);
	aiprofile_beginentry(postcondition.api);
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isstruct(postcondition));
	#/
	/#
		assert(postcondition.type == "");
	#/
	_blackboardsreadwritemode(planner);
	postconditionfunc = plannerutility::getplannerapifunction(postcondition.api);
	[[postconditionfunc]](planner, postcondition.constants);
	_blackboardsreadmode(planner);
	planner.api = undefined;
	aiprofile_endentry();
	pixendevent();
	return true;
}

/*
	Name: _planexpandprecondition
	Namespace: planner
	Checksum: 0x5CB0F8FA
	Offset: 0x960
	Size: 0x160
	Parameters: 2
	Flags: Linked, Private
*/
function private _planexpandprecondition(planner, precondition)
{
	planner.api = precondition.api;
	pixbeginevent(precondition.api);
	aiprofile_beginentry(precondition.api);
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isstruct(precondition));
	#/
	/#
		assert(precondition.type == "");
	#/
	_blackboardsreadmode(planner);
	preconditionfunc = plannerutility::getplannerapifunction(precondition.api);
	result = [[preconditionfunc]](planner, precondition.constants);
	planner.api = undefined;
	aiprofile_endentry();
	pixendevent();
	return result;
}

/*
	Name: _planfindnextsibling
	Namespace: planner
	Checksum: 0x59FE439E
	Offset: 0xAC8
	Size: 0x60
	Parameters: 3
	Flags: Linked, Private
*/
function private _planfindnextsibling(planner, parentnodeentry, currentchildindex)
{
	/#
		assert(isstruct(planner));
	#/
	return parentnodeentry.node.children[currentchildindex + 1];
}

/*
	Name: _planstackhasnodes
	Namespace: planner
	Checksum: 0xFF178164
	Offset: 0xB30
	Size: 0x44
	Parameters: 1
	Flags: Linked, Private
*/
function private _planstackhasnodes(planner)
{
	/#
		assert(isstruct(planner));
	#/
	return planner.nodestack.size > 0;
}

/*
	Name: _planstackpeeknode
	Namespace: planner
	Checksum: 0x66B42BFB
	Offset: 0xB80
	Size: 0x88
	Parameters: 1
	Flags: Linked, Private
*/
function private _planstackpeeknode(planner)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(planner.nodestack.size > 0);
	#/
	nodeentry = planner.nodestack[planner.nodestack.size - 1];
	return nodeentry;
}

/*
	Name: _planstackpopnode
	Namespace: planner
	Checksum: 0xAB925368
	Offset: 0xC10
	Size: 0xA4
	Parameters: 1
	Flags: Linked, Private
*/
function private _planstackpopnode(planner)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(planner.nodestack.size > 0);
	#/
	nodeentry = planner.nodestack[planner.nodestack.size - 1];
	planner.nodestack[planner.nodestack.size - 1] = undefined;
	return nodeentry;
}

/*
	Name: _planstackpushnode
	Namespace: planner
	Checksum: 0x53718AB5
	Offset: 0xCC0
	Size: 0x10C
	Parameters: 3
	Flags: Linked, Private
*/
function private _planstackpushnode(planner, node, childindex)
{
	if(!isdefined(childindex))
	{
		childindex = undefined;
	}
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isstruct(node));
	#/
	nodeentry = spawnstruct();
	nodeentry.childindex = (isdefined(childindex) ? childindex : -1);
	nodeentry.node = node;
	nodeentry.planindex = _plancalculateplanindex(planner);
	nodeentry.undostate = _blackboardscalculateundostate(planner);
	planner.nodestack[planner.nodestack.size] = nodeentry;
}

/*
	Name: _planpushvalidparent
	Namespace: planner
	Checksum: 0xA882C907
	Offset: 0xDD8
	Size: 0x272
	Parameters: 3
	Flags: Linked, Private
*/
function private _planpushvalidparent(planner, childnodeentry, result)
{
	while(_planstackhasnodes(planner))
	{
		parentnodeentry = _planstackpeeknode(planner);
		/#
			assert(isdefined(parentnodeentry));
		#/
		switch(parentnodeentry.node.type)
		{
			case "sequence":
			{
				if(result)
				{
					nextchildnode = _planfindnextsibling(planner, parentnodeentry, childnodeentry.childindex);
					if(isdefined(nextchildnode))
					{
						_planstackpushnode(planner, nextchildnode, childnodeentry.childindex + 1);
						return 1;
					}
				}
				else
				{
					_undoplan(planner, parentnodeentry.planindex);
					_blackboardsapplyundostate(planner, parentnodeentry.undostate);
				}
				_planstackpopnode(planner);
				break;
			}
			case "selector":
			case "planner":
			{
				if(!result)
				{
					_undoplan(planner, parentnodeentry.planindex);
					_blackboardsapplyundostate(planner, parentnodeentry.undostate);
					nextchildnode = _planfindnextsibling(planner, parentnodeentry, childnodeentry.childindex);
					if(isdefined(nextchildnode))
					{
						_planstackpushnode(planner, nextchildnode, childnodeentry.childindex + 1);
						return 1;
					}
				}
				_planstackpopnode(planner);
				break;
			}
			default:
			{
				_planstackpopnode(planner);
				break;
			}
		}
		childnodeentry = parentnodeentry;
	}
	return result;
}

/*
	Name: _planprocessstack
	Namespace: planner
	Checksum: 0x720438A7
	Offset: 0x1058
	Size: 0x23A
	Parameters: 1
	Flags: Linked, Private
*/
function private _planprocessstack(planner)
{
	/#
		assert(isstruct(planner));
	#/
	result = 1;
	waitedinthrottle = 0;
	while(_planstackhasnodes(planner))
	{
		planner.planstarttime = getrealtime();
		nodeentry = _planstackpeeknode(planner);
		switch(nodeentry.node.type)
		{
			case "action":
			{
				result = _planexpandaction(planner, nodeentry.node);
				break;
			}
			case "postcondition":
			{
				result = _planexpandpostcondition(planner, nodeentry.node);
				break;
			}
			case "precondition":
			{
				result = _planexpandprecondition(planner, nodeentry.node);
				break;
			}
			case "selector":
			case "sequence":
			case "planner":
			{
				_planstackpushnode(planner, nodeentry.node.children[0], 0);
				continue;
			}
			default:
			{
				/#
					assert(0, ("" + nodeentry.node.type) + "");
				#/
				break;
			}
		}
		result = _planpushvalidparent(planner, nodeentry, result);
	}
}

/*
	Name: _undoplan
	Namespace: planner
	Checksum: 0x9DE94444
	Offset: 0x12A0
	Size: 0xE0
	Parameters: 2
	Flags: Linked, Private
*/
function private _undoplan(planner, planindex)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.plan));
	#/
	/#
		assert(planindex < planner.plan.size);
	#/
	for(index = planner.plan.size - 1; index > planindex && index >= 0; index--)
	{
		planner.plan[index] = undefined;
	}
}

/*
	Name: addaction
	Namespace: planner
	Checksum: 0x40E232F4
	Offset: 0x1388
	Size: 0x58
	Parameters: 3
	Flags: None
*/
function addaction(parent, actionname, constants)
{
	node = createaction(actionname, constants);
	addchild(parent, node);
	return node;
}

/*
	Name: addchild
	Namespace: planner
	Checksum: 0x92E84546
	Offset: 0x13E8
	Size: 0xAC
	Parameters: 2
	Flags: Linked
*/
function addchild(parent, node)
{
	/#
		assert(isstruct(parent));
	#/
	/#
		assert(isstruct(node));
	#/
	/#
		assert(isarray(parent.children));
	#/
	parent.children[parent.children.size] = node;
}

/*
	Name: addgoto
	Namespace: planner
	Checksum: 0x1CC2B8A7
	Offset: 0x14A0
	Size: 0x2C
	Parameters: 2
	Flags: None
*/
function addgoto(parent, gotonode)
{
	addchild(parent, gotonode);
}

/*
	Name: addselector
	Namespace: planner
	Checksum: 0x2495F4F
	Offset: 0x14D8
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function addselector(parent)
{
	node = createselector();
	addchild(parent, node);
	return node;
}

/*
	Name: addsequence
	Namespace: planner
	Checksum: 0xAE1332CD
	Offset: 0x1520
	Size: 0x40
	Parameters: 1
	Flags: None
*/
function addsequence(parent)
{
	node = createsequence();
	addchild(parent, node);
	return node;
}

/*
	Name: addpostcondition
	Namespace: planner
	Checksum: 0x43EA14E6
	Offset: 0x1568
	Size: 0x58
	Parameters: 3
	Flags: None
*/
function addpostcondition(parent, functionname, constants)
{
	node = createpostcondition(functionname, constants);
	addchild(parent, node);
	return node;
}

/*
	Name: addprecondition
	Namespace: planner
	Checksum: 0x90022365
	Offset: 0x15C8
	Size: 0x58
	Parameters: 3
	Flags: None
*/
function addprecondition(parent, functionname, constants)
{
	node = createprecondition(functionname, constants);
	addchild(parent, node);
	return node;
}

/*
	Name: cancel
	Namespace: planner
	Checksum: 0x2E468AC3
	Offset: 0x1628
	Size: 0x42
	Parameters: 1
	Flags: None
*/
function cancel(planner)
{
	/#
		assert(isstruct(planner));
	#/
	planner.cancel = 1;
}

/*
	Name: createaction
	Namespace: planner
	Checksum: 0x60079D27
	Offset: 0x1678
	Size: 0xBA
	Parameters: 2
	Flags: Linked
*/
function createaction(actionname, constants)
{
	/#
		assert(!isdefined(constants) || isarray(constants));
	#/
	/#
		assert(ishash(actionname));
	#/
	node = spawnstruct();
	node.type = "action";
	node.api = actionname;
	node.constants = constants;
	return node;
}

/*
	Name: createplanner
	Namespace: planner
	Checksum: 0xF0F1EBBB
	Offset: 0x1740
	Size: 0xBC
	Parameters: 1
	Flags: Linked
*/
function createplanner(name)
{
	/#
		assert(ishash(name));
	#/
	planner = spawnstruct();
	planner.cancel = 0;
	planner.children = [];
	planner.name = name;
	planner.planning = 0;
	planner.type = "planner";
	planner.blackboards = [];
	planner.blackboards[0] = plannerblackboard::create([]);
	return planner;
}

/*
	Name: createpostcondition
	Namespace: planner
	Checksum: 0xB494FD64
	Offset: 0x1808
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function createpostcondition(functionname, constants)
{
	/#
		assert(ishash(functionname));
	#/
	/#
		assert(!isdefined(constants) || isarray(constants));
	#/
	/#
		assert(isfunctionptr(plannerutility::getplannerapifunction(functionname)), ("" + function_9e72a96(functionname)) + "");
	#/
	node = spawnstruct();
	node.type = "postcondition";
	node.api = functionname;
	node.constants = constants;
	return node;
}

/*
	Name: createprecondition
	Namespace: planner
	Checksum: 0xDC664785
	Offset: 0x1930
	Size: 0x11A
	Parameters: 2
	Flags: Linked
*/
function createprecondition(functionname, constants)
{
	/#
		assert(ishash(functionname));
	#/
	/#
		assert(!isdefined(constants) || isarray(constants));
	#/
	/#
		assert(isfunctionptr(plannerutility::getplannerapifunction(functionname)), ("" + function_9e72a96(functionname)) + "");
	#/
	node = spawnstruct();
	node.type = "precondition";
	node.api = functionname;
	node.constants = constants;
	return node;
}

/*
	Name: createselector
	Namespace: planner
	Checksum: 0x9BFA96AA
	Offset: 0x1A58
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function createselector()
{
	node = spawnstruct();
	node.children = [];
	node.type = "selector";
	return node;
}

/*
	Name: createsequence
	Namespace: planner
	Checksum: 0x719E54FC
	Offset: 0x1AA0
	Size: 0x3E
	Parameters: 0
	Flags: Linked
*/
function createsequence()
{
	node = spawnstruct();
	node.children = [];
	node.type = "sequence";
	return node;
}

/*
	Name: createsubblackboard
	Namespace: planner
	Checksum: 0xBF16909F
	Offset: 0x1AE8
	Size: 0xD0
	Parameters: 1
	Flags: None
*/
function createsubblackboard(planner)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	newblackboardindex = planner.blackboards.size;
	defaultvalues = [];
	planner.blackboards[newblackboardindex] = plannerblackboard::create(defaultvalues);
	plannerblackboard::setreadwritemode(planner.blackboards[newblackboardindex]);
	return newblackboardindex;
}

/*
	Name: getblackboardattribute
	Namespace: planner
	Checksum: 0x54D1DBD0
	Offset: 0x1BC0
	Size: 0x11A
	Parameters: 3
	Flags: None
*/
function getblackboardattribute(planner, attribute, blackboardindex)
{
	if(!isdefined(blackboardindex))
	{
		blackboardindex = 0;
	}
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isstring(attribute) || ishash(attribute));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	/#
		assert(isstruct(planner.blackboards[blackboardindex]));
	#/
	return plannerblackboard::getattribute(planner.blackboards[blackboardindex], attribute);
}

/*
	Name: getblackboardvalues
	Namespace: planner
	Checksum: 0xEAE65078
	Offset: 0x1CE8
	Size: 0xB6
	Parameters: 2
	Flags: None
*/
function getblackboardvalues(planner, blackboardindex)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	/#
		assert(isstruct(planner.blackboards[blackboardindex]));
	#/
	return planner.blackboards[blackboardindex].values;
}

/*
	Name: getsubblackboard
	Namespace: planner
	Checksum: 0xE6367D0E
	Offset: 0x1DA8
	Size: 0xA8
	Parameters: 2
	Flags: None
*/
function getsubblackboard(planner, blackboardindex)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	/#
		assert(blackboardindex > 0 && blackboardindex < planner.blackboards.size);
	#/
	return planner.blackboards[blackboardindex];
}

/*
	Name: plan
	Namespace: planner
	Checksum: 0x6EB669BF
	Offset: 0x1E58
	Size: 0x276
	Parameters: 5
	Flags: None
*/
function plan(planner, blackboardvalues, maxframetime, starttime, var_302e19d3)
{
	if(!isdefined(maxframetime))
	{
		maxframetime = 3;
	}
	if(!isdefined(starttime))
	{
		starttime = undefined;
	}
	if(!isdefined(var_302e19d3))
	{
		var_302e19d3 = 0;
	}
	pixbeginevent(planner.name);
	aiprofile_beginentry(planner.name);
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(blackboardvalues));
	#/
	planner.cancel = 0;
	planner.maxframetime = maxframetime;
	planner.plan = [];
	planner.planning = 1;
	planner.planstarttime = starttime;
	if(!isdefined(planner.planstarttime))
	{
		planner.planstarttime = getrealtime();
	}
	if(!var_302e19d3)
	{
		planner.blackboards = [];
		planner.blackboards[0] = plannerblackboard::create(blackboardvalues);
	}
	planner.nodestack = [];
	_planstackpushnode(planner, planner);
	_planprocessstack(planner);
	planner.nodestack = [];
	planner.planning = 0;
	foreach(subblackboard in planner.blackboards)
	{
		plannerblackboard::clearundostack(subblackboard);
	}
	aiprofile_endentry();
	pixendevent();
	return planner.plan;
}

/*
	Name: printplanner
	Namespace: planner
	Checksum: 0x3AEB0284
	Offset: 0x20D8
	Size: 0xDC
	Parameters: 2
	Flags: None
*/
function printplanner(planner, filename)
{
	/#
		/#
			assert(isstruct(planner));
		#/
		file = openfile(filename, "");
		printid = randomint(2147483647);
		_printplannernode(file, planner, 0, printid);
		_printclearprintid(planner);
		closefile(file);
	#/
}

/*
	Name: _printclearprintid
	Namespace: planner
	Checksum: 0x171420AF
	Offset: 0x21C0
	Size: 0x8C
	Parameters: 1
	Flags: Private
*/
function private _printclearprintid(plannernode)
{
	/#
		plannernode.printid = undefined;
		if(isdefined(plannernode.children))
		{
			for(index = 0; index < plannernode.children.size; index++)
			{
				if(isdefined(plannernode.children[index].printid))
				{
					_printclearprintid(plannernode.children[index]);
				}
			}
		}
	#/
}

/*
	Name: function_3af5bab0
	Namespace: planner
	Checksum: 0xA0F9DD98
	Offset: 0x2258
	Size: 0x24C
	Parameters: 1
	Flags: Private
*/
function private function_3af5bab0(node)
{
	/#
		text = node.type;
		if(isdefined(node.name))
		{
			text = text + ("" + node.name);
		}
		if(isdefined(node.api))
		{
			text = text + ("" + node.api);
		}
		if(isdefined(node.constants))
		{
			text = text + "";
			first = 1;
			foreach(value in node.constants)
			{
				if(!first)
				{
					text = text + "";
				}
				if(isint(value) || isfloat(value))
				{
					text = text + ((key + "") + value);
				}
				else
				{
					if(isstring(value))
					{
						text = text + (((key + "") + value) + "");
					}
					else
					{
						if(isarray(value))
						{
							text = text + (key + "");
						}
						else if(!isdefined(value))
						{
							text = text + (key + "");
						}
					}
				}
				first = 0;
			}
		}
		if(isdefined(node.name) || isdefined(node.api))
		{
			text = text + "";
		}
		return text;
	#/
}

/*
	Name: _printplannernode
	Namespace: planner
	Checksum: 0x1B09D9F6
	Offset: 0x24B0
	Size: 0x1A4
	Parameters: 4
	Flags: Private
*/
function private _printplannernode(file, plannernode, indent, printid)
{
	/#
		/#
			assert(isstruct(plannernode));
		#/
		indentspace = "";
		for(index = 0; index < indent; index++)
		{
			indentspace = indentspace + "";
		}
		text = "";
		if(plannernode.printid === printid)
		{
			text = text + "";
			text = text + function_3af5bab0(plannernode);
			fprintln(file, indentspace + text);
			return;
		}
		plannernode.printid = printid;
		text = function_3af5bab0(plannernode);
		fprintln(file, indentspace + text);
		if(isdefined(plannernode.children))
		{
			for(index = 0; index < plannernode.children.size; index++)
			{
				_printplannernode(file, plannernode.children[index], indent + 1, printid);
			}
		}
	#/
}

/*
	Name: setblackboardattribute
	Namespace: planner
	Checksum: 0xD4394257
	Offset: 0x2660
	Size: 0x144
	Parameters: 5
	Flags: None
*/
function setblackboardattribute(planner, attribute, value, blackboardindex, readonly)
{
	if(!isdefined(blackboardindex))
	{
		blackboardindex = 0;
	}
	if(!isdefined(readonly))
	{
		readonly = 0;
	}
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isstring(attribute) || ishash(attribute));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	/#
		assert(isstruct(planner.blackboards[blackboardindex]));
	#/
	plannerblackboard::setattribute(planner.blackboards[blackboardindex], attribute, value, readonly);
}

/*
	Name: subblackboardcount
	Namespace: planner
	Checksum: 0x3D36E78C
	Offset: 0x27B0
	Size: 0x76
	Parameters: 1
	Flags: None
*/
function subblackboardcount(planner)
{
	/#
		assert(isstruct(planner));
	#/
	/#
		assert(isarray(planner.blackboards));
	#/
	return planner.blackboards.size - 1;
}

#namespace plannerutility;

/*
	Name: createplannerfromasset
	Namespace: plannerutility
	Checksum: 0xCB3AD28C
	Offset: 0x2830
	Size: 0x45C
	Parameters: 1
	Flags: None
*/
function createplannerfromasset(assetname)
{
	htnasset = gethierarchicaltasknetwork(assetname);
	if(isdefined(htnasset) && htnasset.nodes.size > 0)
	{
		plannernodes = [];
		if(htnasset.nodes.size >= 1)
		{
			node = htnasset.nodes[0];
			plannernodes[0] = planner::createplanner(node.name);
		}
		for(nodeindex = 1; nodeindex < htnasset.nodes.size; nodeindex++)
		{
			node = htnasset.nodes[nodeindex];
			switch(node.type)
			{
				case "action":
				{
					plannernodes[nodeindex] = planner::createaction(node.name, node.constants);
					break;
				}
				case "postcondition":
				{
					plannernodes[nodeindex] = planner::createpostcondition(node.name, node.constants);
					break;
				}
				case "precondition":
				{
					plannernodes[nodeindex] = planner::createprecondition(node.name, node.constants);
					break;
				}
				case "planner":
				{
					plannernodes[nodeindex] = planner::createplanner(node.name);
					break;
				}
				case "selector":
				{
					plannernodes[nodeindex] = planner::createselector();
					break;
				}
				case "sequence":
				{
					plannernodes[nodeindex] = planner::createsequence();
					break;
				}
				case "goto":
				{
					plannernodes[nodeindex] = spawnstruct();
					break;
				}
			}
		}
		for(nodeindex = 0; nodeindex < htnasset.nodes.size; nodeindex++)
		{
			parentnode = plannernodes[nodeindex];
			htnnode = htnasset.nodes[nodeindex];
			if(!isdefined(htnnode.childindexes) || htnnode.type == #"goto")
			{
				continue;
			}
			for(childindex = 0; childindex < htnnode.childindexes.size; childindex++)
			{
				/#
					assert(htnnode.childindexes[childindex] < plannernodes.size);
				#/
				childnum = htnnode.childindexes[childindex];
				childnode = plannernodes[childnum];
				htnchildnode = htnasset.nodes[childnum];
				while(htnchildnode.type === #"goto")
				{
					/#
						assert(isdefined(htnchildnode.childindexes));
					#/
					/#
						assert(htnchildnode.childindexes.size == 1);
					#/
					childnum = htnchildnode.childindexes[0];
					childnode = plannernodes[childnum];
					htnchildnode = htnasset.nodes[childnum];
				}
				planner::addchild(parentnode, childnode);
			}
		}
		return plannernodes[0];
	}
}

/*
	Name: getplannerapifunction
	Namespace: plannerutility
	Checksum: 0x340B8858
	Offset: 0x2C98
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function getplannerapifunction(functionname)
{
	/#
		assert(ishash(functionname) && functionname != "", "");
	#/
	/#
		assert(isdefined(level._plannerscriptfunctions[#"api"][functionname]), ("" + function_9e72a96(functionname)) + "");
	#/
	return level._plannerscriptfunctions[#"api"][functionname];
}

/*
	Name: getplanneractionfunctions
	Namespace: plannerutility
	Checksum: 0xB8A7A8F2
	Offset: 0x2D60
	Size: 0xBE
	Parameters: 1
	Flags: Linked
*/
function getplanneractionfunctions(actionname)
{
	/#
		assert(ishash(actionname) && actionname != "", "");
	#/
	/#
		assert(isdefined(level._plannerscriptfunctions[#"action"][actionname]), ("" + function_9e72a96(actionname)) + "");
	#/
	return level._plannerscriptfunctions[#"action"][actionname];
}

/*
	Name: registerplannerapi
	Namespace: plannerutility
	Checksum: 0x7EE144F7
	Offset: 0x2E28
	Size: 0x12E
	Parameters: 2
	Flags: None
*/
function registerplannerapi(functionname, functionptr)
{
	/#
		assert(ishash(functionname) && functionname != "", "");
	#/
	/#
		assert(isfunctionptr(functionptr), ("" + function_9e72a96(functionname)) + "");
	#/
	planner::_initializeplannerfunctions(#"api");
	/#
		assert(!isdefined(level._plannerscriptfunctions[#"api"][functionname]), ("" + functionname) + "");
	#/
	level._plannerscriptfunctions[#"api"][functionname] = functionptr;
}

/*
	Name: registerplanneraction
	Namespace: plannerutility
	Checksum: 0x73C02D54
	Offset: 0x2F60
	Size: 0x220
	Parameters: 5
	Flags: None
*/
function registerplanneraction(actionname, paramfuncptr, initializefuncptr, updatefuncptr, terminatefuncptr)
{
	/#
		assert(ishash(actionname) && actionname != "", "");
	#/
	planner::_initializeplannerfunctions("Action");
	/#
		assert(!isdefined(level._plannerscriptfunctions[#"action"][actionname]), ("" + function_9e72a96(actionname)) + "");
	#/
	level._plannerscriptfunctions[#"action"][actionname] = [];
	if(isfunctionptr(paramfuncptr))
	{
		level._plannerscriptfunctions[#"action"][actionname][#"parameterize"] = paramfuncptr;
	}
	if(isfunctionptr(initializefuncptr))
	{
		level._plannerscriptfunctions[#"action"][actionname][#"initialize"] = initializefuncptr;
	}
	if(isfunctionptr(updatefuncptr))
	{
		level._plannerscriptfunctions[#"action"][actionname][#"update"] = updatefuncptr;
	}
	if(isfunctionptr(terminatefuncptr))
	{
		level._plannerscriptfunctions[#"action"][actionname][#"terminate"] = terminatefuncptr;
	}
}

