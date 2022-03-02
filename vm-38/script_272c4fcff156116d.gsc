#using scripts\core_common\system_shared.gsc;

#namespace namespace_1ef8852a;

/*
	Name: function_e7022dc0
	Namespace: namespace_1ef8852a
	Checksum: 0x7A5C253E
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e7022dc0()
{
	level notify(540721458);
}

#namespace activities;

/*
	Name: function_89f2df9
	Namespace: activities
	Checksum: 0xE1D2329F
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"activities", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: activities
	Checksum: 0xE82AE9A6
	Offset: 0xF0
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
	Checksum: 0x7CBECD74
	Offset: 0x138
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
	Checksum: 0x29132605
	Offset: 0x168
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

