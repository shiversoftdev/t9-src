#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_b28d86fd;

/*
	Name: function_eca83c7b
	Namespace: namespace_b28d86fd
	Checksum: 0x531C3BE2
	Offset: 0xE0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_eca83c7b()
{
	level notify(-1179307622);
}

/*
	Name: __init__system__
	Namespace: namespace_b28d86fd
	Checksum: 0x506E2165
	Offset: 0x100
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_41cb195ec280085c", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_b28d86fd
	Checksum: 0xB6DA1C97
	Offset: 0x148
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_149b9c514fee8fc3", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_b28d86fd
	Checksum: 0x4B5ACD78
	Offset: 0x1B0
	Size: 0x344
	Parameters: 0
	Flags: Linked, Private
*/
function private on_begin()
{
	callback::function_33f0ddd3(&function_33f0ddd3);
	foreach(player in getplayers())
	{
		player thread zm_trial_util::function_bf710271();
		player zm_trial_util::function_7dbb1712(1);
	}
	a_t_traps = getentarray("zombie_trap", "targetname");
	str_text = #"hash_24a438482954901";
	foreach(t_trap in a_t_traps)
	{
		if(!is_true(t_trap._trap_in_use) && is_true(t_trap.var_b3166dc1))
		{
			t_trap zm_traps::trap_set_string(str_text, t_trap.zombie_cost);
		}
	}
	a_ai = getaiteamarray(level.zombie_team);
	foreach(ai in a_ai)
	{
		if(isalive(ai) && (ai.var_6f84b820 === #"elite" || ai.var_6f84b820 === #"special"))
		{
			ai.takedamage = 1;
			ai.allowdeath = 1;
			ai kill();
		}
	}
	level.var_b38bb71 = 1;
	level.var_ef0aada0 = 1;
	level zm_trial::function_25ee130(1);
	level thread function_70594057();
}

/*
	Name: on_end
	Namespace: namespace_b28d86fd
	Checksum: 0x53B72FA9
	Offset: 0x500
	Size: 0x210
	Parameters: 1
	Flags: Linked, Private
*/
function private on_end(round_reset)
{
	callback::function_824d206(&function_33f0ddd3);
	level.var_b38bb71 = undefined;
	level.var_ef0aada0 = undefined;
	level zm_trial::function_25ee130(0);
	foreach(player in getplayers())
	{
		player thread zm_trial_util::function_dc0859e();
		player zm_trial_util::function_7dbb1712(1);
	}
	a_t_traps = getentarray("zombie_trap", "targetname");
	str_text = #"hash_23c1c09e94181fdb";
	foreach(t_trap in a_t_traps)
	{
		if(!is_true(t_trap._trap_in_use) && is_true(t_trap.var_b3166dc1))
		{
			t_trap zm_traps::trap_set_string(str_text, t_trap.zombie_cost);
		}
	}
}

/*
	Name: function_33f0ddd3
	Namespace: namespace_b28d86fd
	Checksum: 0x8DFB9B96
	Offset: 0x718
	Size: 0x10C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_33f0ddd3(s_event)
{
	if(s_event.event === "give_weapon" && !zm_loadout::function_2ff6913(s_event.weapon))
	{
		self function_28602a03(s_event.weapon, 1, 1);
		if(s_event.weapon.dualwieldweapon != level.weaponnone)
		{
			self function_28602a03(s_event.weapon.dualwieldweapon, 1, 1);
		}
		if(s_event.weapon.altweapon != level.weaponnone)
		{
			self function_28602a03(s_event.weapon.altweapon, 1, 1);
		}
	}
}

/*
	Name: is_active
	Namespace: namespace_b28d86fd
	Checksum: 0xDC8FEB07
	Offset: 0x830
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	s_challenge = zm_trial::function_a36e8c38(#"hash_149b9c514fee8fc3");
	return isdefined(s_challenge);
}

/*
	Name: function_70594057
	Namespace: namespace_b28d86fd
	Checksum: 0x3A19DB3D
	Offset: 0x870
	Size: 0xAC
	Parameters: 0
	Flags: Linked
*/
function function_70594057()
{
	level endon(#"hash_7646638df88a3656", #"end_game");
	level waittill(#"zombie_total_set");
	n_kills = 0;
	while(true)
	{
		level waittill(#"trap_kill", #"hash_528d7b7f7d6c51a1", #"hash_317f58ba0d580c27", #"hash_148b3ce521088846");
		n_kills++;
	}
}

