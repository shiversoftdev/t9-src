#using script_2618e0f3e5e11649;
#using script_799de24f8ad427f7;
#using script_1940fc077a028a81;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_77b61a4178efdbc4;
#using script_3a704cbcf4081bfb;
#using scripts\core_common\ai\archetype_mimic.gsc;
#using script_522aeb6ae906391e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_3d98def3;

/*
	Name: function_22b1e805
	Namespace: namespace_3d98def3
	Checksum: 0xA318EE60
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_22b1e805()
{
	level notify(-2076732397);
}

/*
	Name: __init__system__
	Namespace: namespace_3d98def3
	Checksum: 0x253C859C
	Offset: 0x138
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_e87958e045f8b8d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3d98def3
	Checksum: 0xA043FF30
	Offset: 0x180
	Size: 0x10C
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"mimic", &function_76433e31);
	spawner::function_89a2cd87(#"mimic", &function_820e5ac3);
	level.var_f8d5dd16 = &function_bc29cf28;
	level.var_64aa9d51 = &function_64aa9d51;
	level.var_f29dd47 = &function_f29dd47;
	callback::add_callback(#"hash_7cdee03c16eb684a", &namespace_14c07d4f::function_218c4ce8);
	namespace_ce1f29cc::add_archetype_spawn_function(#"mimic", &function_21de8113);
}

/*
	Name: function_76433e31
	Namespace: namespace_3d98def3
	Checksum: 0x98BF3E1C
	Offset: 0x298
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_76433e31()
{
	self.ai.var_870d0893 = 1;
	self.var_1c0eb62a = 180;
	self.var_97ca51c7 = 4;
	setup_awareness(self);
	self callback::function_d8abfc3d(#"hash_29cb63a7ebb5d699", &function_5c2b66f6);
	self callback::function_d8abfc3d(#"hash_484127e0cbd8f8cb", &function_7c591227);
}

/*
	Name: function_820e5ac3
	Namespace: namespace_3d98def3
	Checksum: 0x82C208C2
	Offset: 0x348
	Size: 0xA4
	Parameters: 0
	Flags: Linked
*/
function function_820e5ac3()
{
	if(!is_true(self.var_2ca2d270) && isdefined(self.favoriteenemy))
	{
		awareness::set_state(self, #"chase");
	}
	else
	{
		if(!isdefined(self.var_43c4bc66))
		{
			awareness::set_state(self, #"hidden");
		}
		else
		{
			awareness::set_state(self, #"wander");
		}
	}
}

/*
	Name: function_21de8113
	Namespace: namespace_3d98def3
	Checksum: 0xD76D98DA
	Offset: 0x3F8
	Size: 0x12
	Parameters: 0
	Flags: Linked, Private
*/
function private function_21de8113()
{
	self.var_43c4bc66 = 1;
}

/*
	Name: setup_awareness
	Namespace: namespace_3d98def3
	Checksum: 0x156C5C11
	Offset: 0x418
	Size: 0x21C
	Parameters: 1
	Flags: Linked, Private
*/
function private setup_awareness(entity)
{
	entity.has_awareness = 1;
	entity.ignorelaststandplayers = 1;
	entity.var_e453bcfa = 10;
	entity.var_91a026f2 = 10;
	entity.var_7ee943e1 = 10;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::register_state(entity, #"hidden", &function_7c29f2ef, undefined, undefined, undefined, undefined);
	awareness::register_state(entity, #"wander", &awareness::function_9c9d96b5, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::register_state(entity, #"investigate", &awareness::function_b41f0471, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::register_state(entity, #"chase", &function_f5ed7704, &awareness::function_39da6c3c, &awareness::function_b9f81e8b, &awareness::function_5c40e824);
	entity callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &function_5394f283);
	entity thread awareness::function_fa6e010d();
}

/*
	Name: function_5394f283
	Namespace: namespace_3d98def3
	Checksum: 0x5BC09110
	Offset: 0x640
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_5394f283(params)
{
	self endon(#"death");
	if(isdefined(self.attackable))
	{
		namespace_85745671::function_2b925fa5(self);
	}
	self.var_98f1f37c = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

/*
	Name: function_5c2b66f6
	Namespace: namespace_3d98def3
	Checksum: 0x1856A59F
	Offset: 0x6C0
	Size: 0x24
	Parameters: 1
	Flags: Linked
*/
function function_5c2b66f6(prop)
{
	awareness::pause(self);
}

/*
	Name: function_7c591227
	Namespace: namespace_3d98def3
	Checksum: 0xF4E33718
	Offset: 0x6F0
	Size: 0x84
	Parameters: 1
	Flags: Linked
*/
function function_7c591227(params)
{
	awareness::resume(self);
	var_1be227f1 = array::random(params.var_ef7458f2);
	awareness::function_c241ef9a(self, var_1be227f1, 10);
	awareness::set_state(self, #"chase");
}

/*
	Name: function_7c29f2ef
	Namespace: namespace_3d98def3
	Checksum: 0xB7432AD0
	Offset: 0x780
	Size: 0x86
	Parameters: 1
	Flags: Linked
*/
function function_7c29f2ef(entity)
{
	entity endon(#"death");
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_walk");
	if(is_true(entity.var_2ca2d270) || awareness::function_49170ec2(entity))
	{
		return;
	}
	entity.should_hide = 1;
}

/*
	Name: function_f5ed7704
	Namespace: namespace_3d98def3
	Checksum: 0xADF122FB
	Offset: 0x810
	Size: 0x9C
	Parameters: 1
	Flags: Linked
*/
function function_f5ed7704(entity)
{
	self.fovcosine = 0;
	self.maxsightdistsqrd = sqr(3000);
	self.var_1267fdea = 0;
	entity setblackboardattribute("_locomotion_speed", "locomotion_speed_run");
	if(!isdefined(self.var_43c4bc66))
	{
		entity.var_78f5fd91 = #"hidden";
	}
	awareness::function_978025e4(entity);
}

/*
	Name: function_3ebfec3e
	Namespace: namespace_3d98def3
	Checksum: 0xD42AF887
	Offset: 0x8B8
	Size: 0x2C
	Parameters: 1
	Flags: None
*/
function function_3ebfec3e(entity)
{
	entity.var_78f5fd91 = undefined;
	awareness::function_b9f81e8b(entity);
}

/*
	Name: function_bc29cf28
	Namespace: namespace_3d98def3
	Checksum: 0x361DFEA0
	Offset: 0x8F0
	Size: 0x126
	Parameters: 0
	Flags: Linked
*/
function function_bc29cf28()
{
	var_6be77126 = [4:#"safehouse", 3:#"explore_chests_small", 2:#"explore_chests_large", 1:#"explore_chests", 0:#"ammo_cache"];
	var_68fc2252 = zm_destination_manager::function_506afb9e(level.var_7d45d0d4.currentdestination, var_6be77126);
	for(i = 0; i < var_68fc2252.size; i++)
	{
		if(!isdefined(var_68fc2252[i].trigger))
		{
			var_68fc2252[i] = "";
		}
	}
	arrayremovevalue(var_68fc2252, "", 0);
	return (isdefined(var_68fc2252) ? var_68fc2252 : []);
}

/*
	Name: function_64aa9d51
	Namespace: namespace_3d98def3
	Checksum: 0x264F34AC
	Offset: 0xA20
	Size: 0x16
	Parameters: 2
	Flags: Linked
*/
function function_64aa9d51(origin, var_783fc5e)
{
	return [];
}

/*
	Name: function_f29dd47
	Namespace: namespace_3d98def3
	Checksum: 0xF66456F8
	Offset: 0xA40
	Size: 0x2A
	Parameters: 2
	Flags: Linked
*/
function function_f29dd47(prop_origin, var_3b5d9ccd)
{
	return array::random(var_3b5d9ccd);
}

