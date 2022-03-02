#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace cheat;

/*
	Name: function_506e3b6
	Namespace: cheat
	Checksum: 0x7C3D45E2
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_506e3b6()
{
	level notify(337451712);
}

/*
	Name: function_89f2df9
	Namespace: cheat
	Checksum: 0x952A970E
	Offset: 0xB8
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
	Checksum: 0x742AE414
	Offset: 0x100
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
	Checksum: 0x5E2EE51
	Offset: 0x168
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
	Checksum: 0x4F54537E
	Offset: 0x190
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
	Checksum: 0x1A32121F
	Offset: 0x1B0
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
	Checksum: 0xF2D4231A
	Offset: 0x228
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
	Checksum: 0x9985E848
	Offset: 0x2C8
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
	Checksum: 0x7E278B30
	Offset: 0x368
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
	Checksum: 0xA56C112C
	Offset: 0x428
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
	Checksum: 0x7305CB35
	Offset: 0x498
	Size: 0x22
	Parameters: 0
	Flags: None
*/
function is_cheating()
{
	return level flag::get("has_cheated");
}

