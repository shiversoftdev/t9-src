#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace cheat;

/*
	Name: function_89f2df9
	Namespace: cheat
	Checksum: 0x3D444A75
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"cheat", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: cheat
	Checksum: 0xFB804340
	Offset: 0xE0
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.cheatstates = [];
	level.cheatfuncs = [];
	level.cheatdvars = [];
	level flag::init("has_cheated");
	level thread death_monitor();
}

/*
	Name: player_init
	Namespace: cheat
	Checksum: 0x86072AB5
	Offset: 0x148
	Size: 0x1C
	Parameters: 0
	Flags: None
*/
function player_init()
{
	self thread specialfeaturesmenu();
}

/*
	Name: death_monitor
	Namespace: cheat
	Checksum: 0x387E687C
	Offset: 0x170
	Size: 0x14
	Parameters: 0
	Flags: None
*/
function death_monitor()
{
	setdvars_based_on_varibles();
}

/*
	Name: setdvars_based_on_varibles
	Namespace: cheat
	Checksum: 0x71820B77
	Offset: 0x190
	Size: 0x6C
	Parameters: 0
	Flags: None
*/
function setdvars_based_on_varibles()
{
	/#
		for(index = 0; index < level.cheatdvars.size; index++)
		{
			setdvar(level.cheatdvars[index], level.cheatstates[level.cheatdvars[index]]);
		}
	#/
}

/*
	Name: addcheat
	Namespace: cheat
	Checksum: 0x732FB00C
	Offset: 0x208
	Size: 0x96
	Parameters: 2
	Flags: None
*/
function addcheat(toggledvar, cheatfunc)
{
	/#
		setdvar(toggledvar, 0);
	#/
	level.cheatstates[toggledvar] = getdvarint(toggledvar, 0);
	level.cheatfuncs[toggledvar] = cheatfunc;
	if(level.cheatstates[toggledvar])
	{
		[[cheatfunc]](level.cheatstates[toggledvar]);
	}
}

/*
	Name: checkcheatchanged
	Namespace: cheat
	Checksum: 0x3135432D
	Offset: 0x2A8
	Size: 0x96
	Parameters: 1
	Flags: None
*/
function checkcheatchanged(toggledvar)
{
	cheatvalue = getdvarint(toggledvar, 0);
	if(level.cheatstates[toggledvar] == cheatvalue)
	{
		return;
	}
	if(cheatvalue)
	{
		level flag::set("has_cheated");
	}
	level.cheatstates[toggledvar] = cheatvalue;
	[[level.cheatfuncs[toggledvar]]](cheatvalue);
}

/*
	Name: specialfeaturesmenu
	Namespace: cheat
	Checksum: 0x94EB24C1
	Offset: 0x348
	Size: 0xB8
	Parameters: 0
	Flags: None
*/
function specialfeaturesmenu()
{
	level endon(#"unloaded");
	addcheat("sf_use_ignoreammo", &ignore_ammomode);
	level.cheatdvars = getarraykeys(level.cheatstates);
	for(;;)
	{
		for(index = 0; index < level.cheatdvars.size; index++)
		{
			checkcheatchanged(level.cheatdvars[index]);
		}
		wait(0.5);
	}
}

/*
	Name: ignore_ammomode
	Namespace: cheat
	Checksum: 0x68D9233
	Offset: 0x408
	Size: 0x64
	Parameters: 1
	Flags: None
*/
function ignore_ammomode(cheatvalue)
{
	if(cheatvalue)
	{
		setsaveddvar(#"player_sustainammo", 1);
	}
	else
	{
		setsaveddvar(#"player_sustainammo", 0);
	}
}

/*
	Name: is_cheating
	Namespace: cheat
	Checksum: 0xF86C20F8
	Offset: 0x478
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function is_cheating()
{
	return level flag::get("has_cheated");
}

