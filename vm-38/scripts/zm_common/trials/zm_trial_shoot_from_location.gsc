#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_shoot_from_location;

/*
	Name: function_4180ca4d
	Namespace: zm_trial_shoot_from_location
	Checksum: 0x6C40EDBB
	Offset: 0x110
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4180ca4d()
{
	level notify(-546093148);
}

/*
	Name: __init__system__
	Namespace: zm_trial_shoot_from_location
	Checksum: 0x6091AE76
	Offset: 0x130
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_shoot_from_location", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_shoot_from_location
	Checksum: 0xF4B81E0
	Offset: 0x178
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"shoot_from_location", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_shoot_from_location
	Checksum: 0x6555684C
	Offset: 0x1E0
	Size: 0x258
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	if(util::get_map_name() == "zm_office")
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
	Name: on_end
	Namespace: zm_trial_shoot_from_location
	Checksum: 0xBBB85407
	Offset: 0x440
	Size: 0x20A
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	callback::function_824d206(&function_33f0ddd3);
	if(util::get_map_name() == "zm_office")
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
		player thread zm_trial_util::function_dc0859e();
	}
	level.var_7f31a12d = undefined;
}

/*
	Name: function_3658663
	Namespace: zm_trial_shoot_from_location
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
			self zm_trial_util::function_dc0859e();
			var_407eb07 = 0;
		}
		else if(!var_f2b6fe6e && !var_407eb07)
		{
			self zm_trial_util::function_bf710271();
			var_407eb07 = 1;
		}
		waitframe(1);
	}
}

/*
	Name: function_33f0ddd3
	Namespace: zm_trial_shoot_from_location
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

