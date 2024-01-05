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
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_7510272;

/*
	Name: function_7a1f39d2
	Namespace: namespace_7510272
	Checksum: 0x64E0A21F
	Offset: 0x208
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7a1f39d2()
{
	level notify(-797955722);
}

#namespace namespace_e8bada13;

/*
	Name: function_a53db30e
	Namespace: namespace_e8bada13
	Checksum: 0xCE6C13D9
	Offset: 0x228
	Size: 0x114
	Parameters: 2
	Flags: Linked
*/
function function_a53db30e(owner, origin)
{
	monkey_bomb = namespace_ec06fe4a::function_e22ae9b3(origin, "zombietron_monkey_bomb");
	if(!isdefined(monkey_bomb))
	{
		return;
	}
	monkey_bomb.owner = owner;
	monkey_bomb.var_7f3187c5 = sqr(300);
	arrayremovevalue(level.doa.var_af6d47dd, undefined);
	level.doa.var_af6d47dd[level.doa.var_af6d47dd.size] = monkey_bomb;
	monkey_bomb namespace_e32bb68::function_3a59ec34("evt_doa_pickup_monkeybomb_music");
	monkey_bomb namespace_83eb6304::function_3ecfde67("monkey_light");
	monkey_bomb thread function_b9934c1d();
}

/*
	Name: function_b9934c1d
	Namespace: namespace_e8bada13
	Checksum: 0xF49D2DFC
	Offset: 0x348
	Size: 0x214
	Parameters: 0
	Flags: Linked
*/
function function_b9934c1d()
{
	self endon(#"death");
	self thread scene::play(#"hash_2b352ec1d391daaa", self);
	timeout = self.owner doa_fate::function_4808b985(8);
	self thread util::delay(timeout - 1.5, "death", &function_4e61e1d);
	var_de3026af = gettime() + (int(8 * 1000));
	var_eb45b51d = var_de3026af - 1500;
	var_e5180c2e = 0;
	do
	{
		waitframe(1);
		time = gettime();
		if(time > var_eb45b51d && var_e5180c2e == 0)
		{
			var_e5180c2e = 1;
			self namespace_83eb6304::function_3ecfde67("monkey_reveal");
		}
	}
	while(time < var_de3026af);
	self radiusdamage(self.origin, 256, 6000, 4000, self.owner, "MOD_EXPLOSIVE", getweapon(#"frag_grenade"));
	self namespace_83eb6304::function_3ecfde67("monkey_detonate");
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_monkeybomb_explode");
	self namespace_ec06fe4a::function_8c808737();
	wait(1);
	self delete();
}

/*
	Name: function_4e61e1d
	Namespace: namespace_e8bada13
	Checksum: 0x90179202
	Offset: 0x568
	Size: 0x24
	Parameters: 0
	Flags: Linked
*/
function function_4e61e1d()
{
	self namespace_e32bb68::function_3a59ec34("evt_doa_pickup_monkeybomb_byebye");
}

