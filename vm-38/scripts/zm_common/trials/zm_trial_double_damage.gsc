#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_double_damage;

/*
	Name: function_bfe46000
	Namespace: zm_trial_double_damage
	Checksum: 0x1DBD7C05
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bfe46000()
{
	level notify(-843487083);
}

/*
	Name: __init__system__
	Namespace: zm_trial_double_damage
	Checksum: 0x28C55A0C
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_double_damage", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_double_damage
	Checksum: 0x3844B6DA
	Offset: 0xF8
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
	zm_trial::register_challenge(#"double_damage", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_double_damage
	Checksum: 0xD9AA34B9
	Offset: 0x160
	Size: 0x84
	Parameters: 0
	Flags: Private
*/
function private on_begin()
{
	self.var_42fe565a = level.var_c739ead9;
	self.var_c98099cd = level.var_cfbc34ae;
	self.var_3ab281b2 = level.var_5a59b382;
	self.var_c7f3b69b = level.var_97850f30;
	level.var_c739ead9 = 2;
	level.var_cfbc34ae = 2;
	level.var_5a59b382 = 2;
	level.var_97850f30 = 2;
}

/*
	Name: on_end
	Namespace: zm_trial_double_damage
	Checksum: 0xC4D9C763
	Offset: 0x1F0
	Size: 0x4C
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level.var_c739ead9 = self.var_42fe565a;
	level.var_cfbc34ae = self.var_c98099cd;
	level.var_5a59b382 = self.var_3ab281b2;
	level.var_97850f30 = self.var_c7f3b69b;
}

/*
	Name: is_active
	Namespace: zm_trial_double_damage
	Checksum: 0x7F4BD3EA
	Offset: 0x248
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"double_damage");
	return isdefined(challenge);
}

