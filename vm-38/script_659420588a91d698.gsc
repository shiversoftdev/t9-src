#using script_14f4a3c583c77d4b;
#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_d920a65;

/*
	Name: function_4180ca4d
	Namespace: namespace_d920a65
	Checksum: 0x6C40EDBB
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4180ca4d()
{
	level notify(546093148);
}

/*
	Name: function_89f2df9
	Namespace: namespace_d920a65
	Checksum: 0x6091AE76
	Offset: 0x130
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7fb45fd668e2069a", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d920a65
	Checksum: 0xF4B81E0
	Offset: 0x178
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_1b6ebc56a697d63d", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_d920a65
	Checksum: 0x6555684C
	Offset: 0x1E0
	Size: 0x258
	Parameters: 0
	Flags: Private
*/
function private function_d1de6a85()
{
	if(util::function_53bbf9d2() == "zm_office")
	{
		elevator1 = getent("elevator1", "targetname");
		elevator2 = getent("elevator2", "targetname");
		elevator1.cost = 0;
		elevator2.cost = 0;
		trigger1 = getent(elevator1.targetname + "_buy", "script_noteworthy");
		trigger2 = getent(elevator2.targetname + "_buy", "script_noteworthy");
		trigger1 sethintstring(level.var_31560d97, elevator1.cost);
		trigger2 sethintstring(level.var_31560d97, elevator2.cost);
	}
	str_targetname = "trials_shoot_from_location";
	level.var_7f31a12d = getentarray(str_targetname, "targetname");
	/#
		assert(level.var_7f31a12d.size, "");
	#/
	callback::function_33f0ddd3(&function_33f0ddd3);
	foreach(player in getplayers())
	{
		player thread function_3658663();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_d920a65
	Checksum: 0xBBB85407
	Offset: 0x440
	Size: 0x20A
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	callback::function_824d206(&function_33f0ddd3);
	if(util::function_53bbf9d2() == "zm_office")
	{
		elevator1 = getent("elevator1", "targetname");
		elevator2 = getent("elevator2", "targetname");
		elevator1.cost = 500;
		elevator2.cost = 500;
		trigger1 = getent(elevator1.targetname + "_buy", "script_noteworthy");
		trigger2 = getent(elevator2.targetname + "_buy", "script_noteworthy");
		trigger1 sethintstring(level.var_31560d97, elevator1.cost);
		trigger2 sethintstring(level.var_31560d97, elevator2.cost);
	}
	foreach(player in getplayers())
	{
		player thread namespace_b22c99a5::function_dc0859e();
	}
	level.var_7f31a12d = undefined;
}

/*
	Name: function_3658663
	Namespace: namespace_d920a65
	Checksum: 0x4E64AECF
	Offset: 0x658
	Size: 0x156
	Parameters: 0
	Flags: Private
*/
function private function_3658663()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	var_407eb07 = 0;
	while(true)
	{
		var_f2b6fe6e = 0;
		foreach(var_3953f2a9 in level.var_7f31a12d)
		{
			if(self istouching(var_3953f2a9))
			{
				var_f2b6fe6e = 1;
				break;
			}
		}
		if(var_f2b6fe6e && var_407eb07)
		{
			self namespace_b22c99a5::function_dc0859e();
			var_407eb07 = 0;
		}
		else if(!var_f2b6fe6e && !var_407eb07)
		{
			self namespace_b22c99a5::function_bf710271();
			var_407eb07 = 1;
		}
		waitframe(1);
	}
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_d920a65
	Checksum: 0xB37196C1
	Offset: 0x7B8
	Size: 0x11C
	Parameters: 1
	Flags: Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon")
	{
		var_f2b6fe6e = 0;
		foreach(var_3953f2a9 in level.var_7f31a12d)
		{
			if(self istouching(var_3953f2a9))
			{
				var_f2b6fe6e = 1;
				break;
			}
		}
		if(!var_f2b6fe6e && !zm_loadout::function_2ff6913(s_event.weapon))
		{
			self function_28602a03(s_event.weapon, 1, 1);
		}
	}
}

