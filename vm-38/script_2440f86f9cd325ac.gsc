#using script_1a9763988299e68d;
#using script_2a5bf5b4a00cee0d;
#using script_40f967ad5d18ea74;
#using script_47851dbeea22fe66;
#using script_164a456ce05c3483;
#using script_4d748e58ce25b60c;
#using script_5f20d3b434d24884;
#using script_1b0b07ff57d1dde3;
#using script_1ee011cd0961afd7;
#using script_350cffecd05ef6cf;
#using script_5701633066d199f2;
#using script_1b01e95a6b5270fd;
#using script_17dcb1172e441bf6;
#using script_74a56359b7d02ab6;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_3ddea5d0;

/*
	Name: function_d60a1bab
	Namespace: namespace_3ddea5d0
	Checksum: 0xBF4222BA
	Offset: 0x1B0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d60a1bab()
{
	level notify(-622341467);
}

#namespace namespace_3a8e4a3;

/*
	Name: function_98acc465
	Namespace: namespace_3a8e4a3
	Checksum: 0x3F2091C2
	Offset: 0x1D0
	Size: 0x2CE
	Parameters: 0
	Flags: Linked
*/
function function_98acc465()
{
	self endon(#"death");
	self physicslaunch(self.origin, vectorscale((0, 0, 1), 10));
	self.health = 250 + (level.doa.var_6c58d51 * 500);
	if(self.type === 33)
	{
		self.health = self.health + 1000;
	}
	self thread function_b968c4a9();
	self thread function_5160690e();
	self.team = "allies";
	wait(1);
	self makesentient();
	self.threatbias = 0;
	namespace_ec06fe4a::addpoi(self);
	self.var_ef88bfeb = 1;
	self waittill(#"pickup_timeout");
	wait(1);
	self namespace_e32bb68::function_3a59ec34("zmb_egg_hatch");
	self namespace_83eb6304::function_3ecfde67("egg_hatch");
	if(isdefined(self.prize))
	{
		prize = self.prize;
	}
	else
	{
		prize = doa_pickups::function_2c9923d7(function_137dd3d5(self.type));
	}
	origin = namespace_ec06fe4a::function_65ee50ba(self.origin, 10) + vectorscale((0, 0, 1), 12);
	if(([[ prize ]]->function_5ce4fb28()) != 13)
	{
		prize = doa_pickups::itemspawn(prize, origin, undefined, 1, 1);
	}
	else
	{
		prize = doa_pickups::function_b8f6a8cd(level.doa.var_9a6327ee, origin, 1, 1, randomfloatrange(1, 3));
	}
	level notify(#"hash_1ebd993fc32acc25", {#egg:self, #prize:prize});
	util::wait_network_frame();
	self.pickup = undefined;
}

/*
	Name: function_137dd3d5
	Namespace: namespace_3a8e4a3
	Checksum: 0x7FDF6114
	Offset: 0x4A8
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_137dd3d5(type)
{
	if(type == 33)
	{
		return 16;
	}
	roll = randomint(100);
	if(roll < 2)
	{
		return 16;
	}
	if(roll < 6)
	{
		return 8;
	}
	if(roll < 16)
	{
		return 9;
	}
	if(roll <= 40)
	{
		return 15;
	}
	return 13;
}

/*
	Name: function_22c4e231
	Namespace: namespace_3a8e4a3
	Checksum: 0xF2F40FC5
	Offset: 0x550
	Size: 0x8E
	Parameters: 1
	Flags: Linked
*/
function function_22c4e231(hop)
{
	if(hop)
	{
		self physicslaunch(self.origin, (randomintrange(-10, 10), randomintrange(-10, 10), 30));
		self namespace_e32bb68::function_3a59ec34("zmb_egg_shake");
		self.var_860a34b9 = undefined;
	}
}

/*
	Name: function_b968c4a9
	Namespace: namespace_3a8e4a3
	Checksum: 0x6E7CFFDB
	Offset: 0x5E8
	Size: 0xCC
	Parameters: 0
	Flags: Linked
*/
function function_b968c4a9()
{
	self notify("e69adfe87a2f27d");
	self endon("e69adfe87a2f27d");
	self endon(#"death");
	result = undefined;
	result = level waittill(#"hash_c1cceae4479f2e5");
	var_831e477b = vectorscale(vectornormalize((self.origin - result.origin) + vectorscale((0, 0, 1), 1000)), 80);
	self physicslaunch(self.origin, var_831e477b);
	self thread function_b968c4a9();
}

/*
	Name: function_5160690e
	Namespace: namespace_3a8e4a3
	Checksum: 0xDECB7887
	Offset: 0x6C0
	Size: 0x256
	Parameters: 0
	Flags: Linked
*/
function function_5160690e()
{
	self endon(#"death");
	while(true)
	{
		var_4534d463 = array::get_all_closest(self.origin, getaiteamarray("axis"), undefined, 4, 48);
		for(i = 0; i < var_4534d463.size; i++)
		{
			zombie = var_4534d463[i];
			if(is_true(zombie.var_1c8b76d3))
			{
				continue;
			}
			zombie setentitytarget(self);
			dir = (vectornormalize(self.origin - zombie.origin)) * 30;
			self physicslaunch(self.origin, (dir[0], dir[1], dir[2] + 10));
			self.health = self.health - 40;
			if(self.health < 0)
			{
				self namespace_e32bb68::function_3a59ec34("zmb_explode");
				self namespace_83eb6304::function_3ecfde67("egg_explode");
				physicsexplosionsphere(self.origin, 200, 128, 2);
				self radiusdamage(self.origin, 72, 2000, 1000);
				playrumbleonposition("grenade_rumble", self.origin);
				waitframe(1);
				self.pickup = undefined;
				return;
			}
		}
		wait(1);
		self.var_9eba8716 = getclosestpointonnavmesh(self.origin, 64, 16);
	}
}

