#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_distance_traveled;

/*
	Name: __init__system__
	Namespace: zm_trial_distance_traveled
	Checksum: 0xDAB27CAD
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_trial_distance_traveled", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_trial_distance_traveled
	Checksum: 0x8CB7BD9
	Offset: 0xE8
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
	zm_trial::register_challenge(#"distance_traveled", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: zm_trial_distance_traveled
	Checksum: 0x8D38CA1A
	Offset: 0x150
	Size: 0x194
	Parameters: 1
	Flags: Private
*/
function private on_begin(var_38282db8)
{
	var_38282db8 = zm_trial::function_5769f26a(var_38282db8);
	foreach(player in getplayers())
	{
		player thread function_ed4d5d4(var_38282db8);
	}
	level.var_4220f02a = array(getweapon(#"launcher_standard_t8"), getweapon(#"hash_138efe2bb30be63c"), getweapon(#"hash_138f012bb30beb55"), getweapon(#"hash_46ad37ce8122812e"), getweapon(#"hash_138f002bb30be9a2"), getweapon(#"hash_3a8348f19a7e7629"));
}

/*
	Name: on_end
	Namespace: zm_trial_distance_traveled
	Checksum: 0x7E3BA81F
	Offset: 0x2F0
	Size: 0x16
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	level.var_4220f02a = undefined;
}

/*
	Name: is_active
	Namespace: zm_trial_distance_traveled
	Checksum: 0xDE4DEB51
	Offset: 0x310
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"distance_traveled");
	return isdefined(challenge);
}

/*
	Name: function_ed4d5d4
	Namespace: zm_trial_distance_traveled
	Checksum: 0x38FB67E2
	Offset: 0x350
	Size: 0x240
	Parameters: 1
	Flags: None
*/
function function_ed4d5d4(var_38282db8)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656", #"end_game", #"hash_43a461e5c99d52a0");
	n_distance_traveled = 0;
	self zm_trial_util::function_2190356a(int(n_distance_traveled), 1);
	self zm_trial_util::function_c2cd0cba(var_38282db8);
	wait(12);
	var_31409e15 = self.origin;
	while(true)
	{
		var_abf38d09 = distance(self.origin, var_31409e15) * 0.0254;
		if(isalive(self))
		{
			if(self function_e7985d50())
			{
				while(self function_e7985d50())
				{
					var_31409e15 = self.origin;
					waitframe(1);
				}
			}
			else
			{
				n_distance_traveled = n_distance_traveled + var_abf38d09;
			}
		}
		if(n_distance_traveled < var_38282db8)
		{
			self zm_trial_util::function_2190356a(int(n_distance_traveled), 1);
			self zm_trial_util::function_c2cd0cba(var_38282db8);
		}
		else
		{
			self zm_trial_util::function_2190356a(var_38282db8);
			self zm_trial_util::function_c2cd0cba(var_38282db8);
			zm_trial::fail(#"hash_1ab078fa9460e7c9", array(self));
			level notify(#"hash_43a461e5c99d52a0");
			return;
		}
		var_31409e15 = self.origin;
		waitframe(1);
	}
}

/*
	Name: function_e7985d50
	Namespace: zm_trial_distance_traveled
	Checksum: 0x91F01705
	Offset: 0x598
	Size: 0x148
	Parameters: 0
	Flags: None
*/
function function_e7985d50()
{
	if(is_true(self.var_16735873) || self util::function_88c74107() || is_true(self.var_ffe2c4d7) || is_true(self.var_25c3de32))
	{
		return true;
	}
	w_weapon = self getcurrentweapon();
	w_weapon = zm_weapons::get_base_weapon(w_weapon);
	var_f77522bb = self getnormalizedmovement();
	if(isarray(level.var_4220f02a) && self isfiring() && isinarray(level.var_4220f02a, w_weapon) && var_f77522bb == (0, 0, 0))
	{
		return true;
	}
	return false;
}

