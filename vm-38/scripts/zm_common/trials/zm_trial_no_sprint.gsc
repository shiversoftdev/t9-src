#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_no_sprint;

/*
	Name: function_ce74025a
	Namespace: zm_trial_no_sprint
	Checksum: 0xB07BF381
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ce74025a()
{
	level notify(853560288);
}

/*
	Name: __init__system__
	Namespace: zm_trial_no_sprint
	Checksum: 0xB4DDDA90
	Offset: 0xB8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_no_sprint", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_no_sprint
	Checksum: 0xFF8ABFBA
	Offset: 0x100
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
	zm_trial::register_challenge(#"no_sprint", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_no_sprint
	Checksum: 0xF9A1C2E6
	Offset: 0x168
	Size: 0xE8
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	callback::on_spawned(&function_dc856fd8);
	foreach(player in getplayers())
	{
		player allowsprint(0);
		player._allow_sprint = 0;
		player thread function_dc856fd8();
		player thread function_31f500f();
	}
}

/*
	Name: on_end
	Namespace: zm_trial_no_sprint
	Checksum: 0xD771AF4A
	Offset: 0x258
	Size: 0xD8
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	callback::remove_on_spawned(&function_dc856fd8);
	foreach(player in getplayers())
	{
		player notify(#"allow_sprint");
		player._allow_sprint = undefined;
		player allowsprint(1);
	}
}

/*
	Name: function_dc856fd8
	Namespace: zm_trial_no_sprint
	Checksum: 0x7CF8D11A
	Offset: 0x338
	Size: 0xC0
	Parameters: 0
	Flags: Private
*/
function private function_dc856fd8()
{
	self notify("374b3a40e7866d07");
	self endon("374b3a40e7866d07");
	self endon(#"disconnect", #"allow_sprint");
	self allowsprint(0);
	while(true)
	{
		self waittill(#"crafting_fail", #"crafting_success", #"bgb_update");
		if(isalive(self))
		{
			self allowsprint(0);
		}
	}
}

/*
	Name: function_31f500f
	Namespace: zm_trial_no_sprint
	Checksum: 0xDC8FD732
	Offset: 0x400
	Size: 0xA2
	Parameters: 0
	Flags: Private
*/
function private function_31f500f()
{
	self endon(#"disconnect", #"allow_sprint");
	while(true)
	{
		if(isalive(self) && self sprintbuttonpressed())
		{
			self zm_trial_util::function_97444b02();
			while(self sprintbuttonpressed())
			{
				waitframe(1);
			}
		}
		waitframe(1);
	}
}

