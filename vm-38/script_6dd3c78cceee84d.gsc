#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_weapons.gsc;

#namespace namespace_42dceb2d;

/*
	Name: function_e8ed4594
	Namespace: namespace_42dceb2d
	Checksum: 0x447D6168
	Offset: 0xB8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e8ed4594()
{
	level notify(1827584516);
}

/*
	Name: function_89f2df9
	Namespace: namespace_42dceb2d
	Checksum: 0x2264E251
	Offset: 0xD8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7d30e1a6dcbaf5df", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_42dceb2d
	Checksum: 0xC9903967
	Offset: 0x120
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
	zm_trial::register_challenge(#"hash_3d1eec1f4849b380", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_42dceb2d
	Checksum: 0xADF8F532
	Offset: 0x188
	Size: 0xE0
	Parameters: 2
	Flags: Private
*/
function private function_d1de6a85(n_min_time, n_max_time)
{
	level.var_935c100a = zm_trial::function_5769f26a(n_min_time);
	level.var_33146b2e = zm_trial::function_5769f26a(n_max_time);
	foreach(player in getplayers())
	{
		player thread function_6a04c6e6();
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_42dceb2d
	Checksum: 0x1B05F119
	Offset: 0x270
	Size: 0xE8
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	level notify(#"hash_34f9cf7500b33c6b");
	foreach(player in getplayers())
	{
		player val::reset(#"hash_7d2b25df35ca5b3", "freezecontrols");
		player val::reset(#"hash_7d2b25df35ca5b3", "ignoreme");
	}
}

/*
	Name: is_active
	Namespace: namespace_42dceb2d
	Checksum: 0xD71964B4
	Offset: 0x360
	Size: 0x32
	Parameters: 0
	Flags: None
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_3d1eec1f4849b380");
	return isdefined(challenge);
}

/*
	Name: function_6a04c6e6
	Namespace: namespace_42dceb2d
	Checksum: 0xC5BBA150
	Offset: 0x3A0
	Size: 0xC8
	Parameters: 0
	Flags: Private
*/
function private function_6a04c6e6()
{
	self endon(#"disconnect");
	level endon(#"hash_34f9cf7500b33c6b", #"end_game");
	while(true)
	{
		wait(randomfloatrange(level.var_935c100a, level.var_33146b2e));
		if(isalive(self))
		{
			if(self isusingoffhand())
			{
				self forceoffhandend();
			}
			self zm_bgb_anywhere_but_here::activation(0);
		}
	}
}

