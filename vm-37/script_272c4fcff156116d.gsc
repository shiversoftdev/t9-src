#using scripts\core_common\system_shared.gsc;

#namespace activities;

/*
	Name: __init__system__
	Namespace: activities
	Checksum: 0x68D3D72F
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"activities", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: activities
	Checksum: 0x9E4F14E5
	Offset: 0xD0
	Size: 0x3A
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	level.activities = {};
	level.activities.var_7e507488 = clientsysregister("a:obj");
}

/*
	Name: function_b73af3c
	Namespace: activities
	Checksum: 0x18B6AAC6
	Offset: 0x118
	Size: 0x22
	Parameters: 1
	Flags: None
*/
function function_b73af3c(name)
{
	level.activities.levelname = name;
}

/*
	Name: function_59e67711
	Namespace: activities
	Checksum: 0x21B702B1
	Offset: 0x148
	Size: 0x144
	Parameters: 1
	Flags: None
*/
function function_59e67711(objective)
{
	/#
		assert(!issubstr(objective, ""), "");
	#/
	if(isdefined(level.activities.levelname))
	{
		clientsyssetstate(level.activities.var_7e507488, (((((("0," + objective) + ",") + level.gameskill) + ",") + level.var_1c5d2bf4) + ",") + level.activities.levelname);
		level.activities.levelname = undefined;
	}
	else
	{
		clientsyssetstate(level.activities.var_7e507488, (((("1," + objective) + ",") + level.gameskill) + ",") + level.var_1c5d2bf4);
	}
}

