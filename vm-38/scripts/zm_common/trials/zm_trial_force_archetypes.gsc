#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_force_archetypes;

/*
	Name: function_24c0cf55
	Namespace: zm_trial_force_archetypes
	Checksum: 0x5B596A92
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_24c0cf55()
{
	level notify(970726886);
}

/*
	Name: __init__system__
	Namespace: zm_trial_force_archetypes
	Checksum: 0xFD174B5E
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_force_archetypes", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_force_archetypes
	Checksum: 0x98E4D814
	Offset: 0xE0
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
	zm_trial::register_challenge(#"force_archetypes", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_force_archetypes
	Checksum: 0xCAD7ECBF
	Offset: 0x148
	Size: 0x104
	Parameters: 4
	Flags: Private
*/
function private on_begin(var_34259a50, var_1d00ec07, var_10cad39b, var_f9ab255c)
{
	archetypes = [3:var_f9ab255c, 2:var_10cad39b, 1:var_1d00ec07, 0:var_34259a50];
	arrayremovevalue(archetypes, undefined, 0);
	self.var_c54c0d81 = [];
	foreach(archetype in archetypes)
	{
		self.var_c54c0d81[archetype] = 1;
	}
}

/*
	Name: on_end
	Namespace: zm_trial_force_archetypes
	Checksum: 0xED06E10C
	Offset: 0x258
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	self.var_c54c0d81 = undefined;
}

/*
	Name: function_ff2a74e7
	Namespace: zm_trial_force_archetypes
	Checksum: 0x67C806B4
	Offset: 0x278
	Size: 0x52
	Parameters: 1
	Flags: None
*/
function function_ff2a74e7(archetype)
{
	challenge = zm_trial::function_a36e8c38(#"force_archetypes");
	if(!isdefined(challenge))
	{
		return 0;
	}
	return isdefined(challenge.var_c54c0d81[archetype]);
}

