#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_add_special;

/*
	Name: __init__system__
	Namespace: zm_trial_add_special
	Checksum: 0x16E470D9
	Offset: 0x78
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_add_special", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_add_special
	Checksum: 0x5069D886
	Offset: 0xC0
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
	zm_trial::register_challenge(#"add_special", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_add_special
	Checksum: 0xAF897DEE
	Offset: 0x128
	Size: 0x184
	Parameters: 5
	Flags: Private
*/
function private on_begin(enemy_type, var_1f950d4d, var_81dcf087, var_d631185a, var_fe1bdf31)
{
	level.var_1c7412f9 = enemy_type;
	switch(getplayers().size)
	{
		case 1:
		{
			level.var_e34a018e = zm_trial::function_5769f26a(var_1f950d4d);
			break;
		}
		case 2:
		{
			level.var_e34a018e = zm_trial::function_5769f26a(var_81dcf087);
			break;
		}
		case 3:
		{
			level.var_e34a018e = zm_trial::function_5769f26a(var_d631185a);
			break;
		}
		case 4:
		{
			level.var_e34a018e = zm_trial::function_5769f26a(var_fe1bdf31);
			break;
		}
	}
	zm_round_spawning::function_c1571721(&function_51ec9e09);
	zm_round_spawning::function_54fee373(&function_1b1d71e7);
	zm_round_spawning::function_2876740e(level.var_1c7412f9, &function_a7c00976);
}

/*
	Name: on_end
	Namespace: zm_trial_add_special
	Checksum: 0xDCE99086
	Offset: 0x2B8
	Size: 0x8A
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_round_spawning::function_9bf14a10(level.var_1c7412f9, &function_a7c00976);
	zm_round_spawning::function_510039c1(&function_51ec9e09);
	zm_round_spawning::function_375519eb(&function_1b1d71e7);
	level.var_1c7412f9 = undefined;
	level.var_e34a018e = undefined;
}

/*
	Name: is_active
	Namespace: zm_trial_add_special
	Checksum: 0xE18BA9F4
	Offset: 0x350
	Size: 0x60
	Parameters: 1
	Flags: None
*/
function is_active(str_archetype)
{
	challenge = zm_trial::function_a36e8c38(#"add_special");
	if(isdefined(str_archetype))
	{
		return isdefined(challenge) && level.var_1c7412f9 === str_archetype;
	}
	return isdefined(challenge);
}

/*
	Name: function_a7c00976
	Namespace: zm_trial_add_special
	Checksum: 0x1FA282F4
	Offset: 0x3C0
	Size: 0x10
	Parameters: 1
	Flags: None
*/
function function_a7c00976(n_max)
{
	return 999;
}

/*
	Name: function_51ec9e09
	Namespace: zm_trial_add_special
	Checksum: 0xB6A8BBB
	Offset: 0x3D8
	Size: 0x6C
	Parameters: 1
	Flags: None
*/
function function_51ec9e09(n_points)
{
	if(isdefined(level.var_819e7dfd[level.var_1c7412f9].var_f6a3b5b0))
	{
		var_dbce0c44 = level.var_819e7dfd[level.var_1c7412f9].var_f6a3b5b0 * level.var_e34a018e;
	}
	else
	{
		var_dbce0c44 = 1600;
	}
	return var_dbce0c44;
}

/*
	Name: function_1b1d71e7
	Namespace: zm_trial_add_special
	Checksum: 0x9D0DA13F
	Offset: 0x450
	Size: 0xD4
	Parameters: 1
	Flags: None
*/
function function_1b1d71e7(var_8997f0f2)
{
	a_str_archetypes = getarraykeys(var_8997f0f2);
	foreach(str_archetype in a_str_archetypes)
	{
		if(str_archetype === level.var_1c7412f9)
		{
			var_8997f0f2[str_archetype] = level.var_e34a018e;
			continue;
		}
		var_8997f0f2[str_archetype] = 0;
	}
	return var_8997f0f2;
}

