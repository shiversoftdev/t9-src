#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_d339795c;

/*
	Name: function_89f2df9
	Namespace: namespace_d339795c
	Checksum: 0x891D949D
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_512e2b902c77dcea", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_d339795c
	Checksum: 0x9ED1C01E
	Offset: 0xE0
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
	zm_trial::register_challenge(#"hash_5c3f988812660d49", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_d339795c
	Checksum: 0x7D4C46AA
	Offset: 0x148
	Size: 0xD8
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(perk_count)
{
	/#
		assert(isdefined(level.var_b8be892e));
	#/
	self.var_851a4ca6 = zm_trial::function_5769f26a(perk_count);
	foreach(player in getplayers())
	{
		player thread function_2a5b280f(self);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_d339795c
	Checksum: 0x1B8638D1
	Offset: 0x228
	Size: 0x28E
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	foreach(player in getplayers())
	{
		player namespace_b22c99a5::function_f3aacffb();
	}
	if(!round_reset)
	{
		/#
			assert(isdefined(level.var_b8be892e));
		#/
		var_57807cdc = [];
		foreach(player in getplayers())
		{
			/#
				assert(isdefined(player.var_a53b9221));
			#/
			if(player.var_a53b9221 < self.var_851a4ca6)
			{
				array::add(var_57807cdc, player, 0);
			}
		}
		if(var_57807cdc.size == 1)
		{
			zm_trial::fail(#"hash_397117e332ee81a0" + self.var_851a4ca6, var_57807cdc);
		}
		else if(var_57807cdc.size > 1)
		{
			zm_trial::fail(#"hash_4cf7d929e75b3da3" + self.var_851a4ca6, var_57807cdc);
		}
	}
	foreach(player in getplayers())
	{
		player.var_a53b9221 = undefined;
	}
}

/*
	Name: function_c9934172
	Namespace: namespace_d339795c
	Checksum: 0x12A36D38
	Offset: 0x4C0
	Size: 0xB4
	Parameters: 0
	Flags: Private
*/
function private function_c9934172()
{
	if(self.sessionstate != "spectator")
	{
		self.var_a53b9221 = 0;
		foreach(var_83225a27 in level.var_b8be892e)
		{
			if(self hasperk(var_83225a27))
			{
				self.var_a53b9221++;
			}
		}
	}
}

/*
	Name: function_2a5b280f
	Namespace: namespace_d339795c
	Checksum: 0x281A5F87
	Offset: 0x580
	Size: 0xF4
	Parameters: 1
	Flags: Private
*/
function private function_2a5b280f(challenge)
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	self.var_a53b9221 = 0;
	var_fa5d7ea0 = 0;
	self namespace_b22c99a5::function_63060af4(0);
	while(true)
	{
		self function_c9934172();
		if(self.var_a53b9221 >= challenge.var_851a4ca6)
		{
			if(!var_fa5d7ea0)
			{
				self namespace_b22c99a5::function_63060af4(1);
				var_fa5d7ea0 = 1;
			}
		}
		else if(var_fa5d7ea0)
		{
			self namespace_b22c99a5::function_63060af4(0);
			var_fa5d7ea0 = 0;
		}
		waitframe(1);
	}
}

