#using script_2dc48f46bfeac894;
#using script_6b2be07726845c37;
#using scripts\core_common\battlechatter.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace gravity_spikes;

/*
	Name: function_8e9b43f6
	Namespace: gravity_spikes
	Checksum: 0x1FDB9EE5
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8e9b43f6()
{
	level notify(1338850950);
}

/*
	Name: function_89f2df9
	Namespace: gravity_spikes
	Checksum: 0x4BB679E0
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"gravity_spikes", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: gravity_spikes
	Checksum: 0x5CCE3FC2
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
	ability_player::register_gadget_activation_callbacks(7, &function_20bb376d, undefined);
}

/*
	Name: function_20bb376d
	Namespace: gravity_spikes
	Checksum: 0x5727C9DB
	Offset: 0x158
	Size: 0xE2
	Parameters: 2
	Flags: None
*/
function function_20bb376d(var_3245778e, weapon)
{
	self battlechatter::function_bd715920(weapon, undefined, self geteye(), self);
	playfx("weapon/fx8_hero_grvity_slam_takeoff_3p", self.origin);
	if(isdefined(self.var_ea1458aa))
	{
		self.var_ea1458aa.var_6799f1da = 0;
		if(!self isonground() && isdefined(self.var_700a5910) && isdefined(self.challenge_jump_begin) && self.var_700a5910 > self.challenge_jump_begin)
		{
			self.var_ea1458aa.var_6799f1da = 1;
		}
	}
}

