#using script_27c22e1d8df4d852;
#using script_3f9e0dc8454d98e1;
#using script_6021ce59143452c3;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_50e678c1;

/*
	Name: function_b51621dd
	Namespace: namespace_50e678c1
	Checksum: 0x815DA58D
	Offset: 0x88
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b51621dd()
{
	level notify(1977290592);
}

/*
	Name: function_89f2df9
	Namespace: namespace_50e678c1
	Checksum: 0xC07782C8
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_70d5f32b9c283313", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_50e678c1
	Checksum: 0x70E81ABA
	Offset: 0xF0
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
	zm_trial::register_challenge(#"hash_547de32b173ee2a4", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_50e678c1
	Checksum: 0xCA93190F
	Offset: 0x158
	Size: 0x1F4
	Parameters: 5
	Flags: Private
*/
function private function_d1de6a85(var_60bdad5f, var_36c3cc24, var_4ee27b15, var_3bc46181, var_1f6e1e99)
{
	switch(level.players.size)
	{
		case 1:
		{
			self.var_28433a54 = zm_trial::function_5769f26a(var_36c3cc24);
			break;
		}
		case 2:
		{
			self.var_28433a54 = zm_trial::function_5769f26a(var_4ee27b15);
			break;
		}
		case 3:
		{
			self.var_28433a54 = zm_trial::function_5769f26a(var_3bc46181);
			break;
		}
		case 4:
		{
			self.var_28433a54 = zm_trial::function_5769f26a(var_1f6e1e99);
			break;
		}
	}
	self.var_358e6a29 = self.var_28433a54;
	self.var_e6e7a65d = (isdefined(zombie_utility::function_d2dfacfd(#"rebuild_barrier_cap_per_round")) ? zombie_utility::function_d2dfacfd(#"rebuild_barrier_cap_per_round") : 0);
	zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", self.var_28433a54);
	self.var_a84ac7c8 = var_60bdad5f;
	namespace_b22c99a5::function_2976fa44(self.var_358e6a29);
	namespace_b22c99a5::function_dace284(0);
	self thread function_738e3a43();
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_50e678c1
	Checksum: 0x41CC5390
	Offset: 0x358
	Size: 0x74
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	if(!round_reset)
	{
		if(self.var_28433a54 > 0)
		{
			zm_trial::fail(self.var_a84ac7c8);
		}
	}
	namespace_b22c99a5::function_f3dbeda7();
	zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", self.var_e6e7a65d);
}

/*
	Name: function_738e3a43
	Namespace: namespace_50e678c1
	Checksum: 0x2784BC8D
	Offset: 0x3D8
	Size: 0x188
	Parameters: 0
	Flags: Private
*/
function private function_738e3a43()
{
	level endon(#"hash_7646638df88a3656");
	var_812095a3 = 0;
	while(self.var_28433a54)
	{
		waitresult = undefined;
		waitresult = level waittill(#"rebuild_board");
		var_c7ff10eb = 0;
		var_812095a3++;
		if(var_812095a3 >= 5)
		{
			var_c7ff10eb = 1;
			var_812095a3 = 0;
		}
		if(self.var_358e6a29 > zombie_utility::function_d2dfacfd(#"rebuild_barrier_cap_per_round"))
		{
			self.var_e6e7a65d = zombie_utility::function_d2dfacfd(#"rebuild_barrier_cap_per_round");
			zombie_utility::set_zombie_var(#"rebuild_barrier_cap_per_round", self.var_358e6a29);
		}
		if(isdefined(waitresult.points))
		{
			self.var_28433a54 = self.var_28433a54 - waitresult.points;
		}
		self.var_28433a54 = math::clamp(self.var_28433a54, 0, 1000);
		namespace_b22c99a5::function_dace284(int(self.var_358e6a29 - self.var_28433a54));
	}
}

