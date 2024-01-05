#using script_2618e0f3e5e11649;
#using script_799de24f8ad427f7;
#using script_1940fc077a028a81;
#using script_3411bb48d41bd3b;
#using script_3357acf79ce92f4b;
#using script_65488ba3b5a08252;
#using script_7d5c9b91cf8d272b;
#using scripts\core_common\flag_shared.gsc;
#using script_522aeb6ae906391e;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace namespace_5665d8db;

/*
	Name: function_fc71e78c
	Namespace: namespace_5665d8db
	Checksum: 0xC35DD284
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fc71e78c()
{
	level notify(-901481038);
}

/*
	Name: __init__system__
	Namespace: namespace_5665d8db
	Checksum: 0x5198F53E
	Offset: 0xE8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_2bb3180ae90516b3", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_5665d8db
	Checksum: 0xEE1CA957
	Offset: 0x130
	Size: 0x64
	Parameters: 0
	Flags: None
*/
function function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"hash_7c09b683edfb0e96", &function_b82e0a5d);
	spawner::function_89a2cd87(#"hash_7c09b683edfb0e96", &function_545f669b);
}

/*
	Name: function_b82e0a5d
	Namespace: namespace_5665d8db
	Checksum: 0xD7E6E421
	Offset: 0x1A0
	Size: 0x5C
	Parameters: 0
	Flags: None
*/
function function_b82e0a5d()
{
	self.ai.var_870d0893 = 1;
	self.var_97ca51c7 = 4;
	self flag::set(#"hash_7b1f9f26f086bf39");
	setup_awareness(self);
}

/*
	Name: function_545f669b
	Namespace: namespace_5665d8db
	Checksum: 0x80F724D1
	Offset: 0x208
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function function_545f669b()
{
}

/*
	Name: setup_awareness
	Namespace: namespace_5665d8db
	Checksum: 0xBD4FE79A
	Offset: 0x218
	Size: 0x204
	Parameters: 1
	Flags: Private
*/
function private setup_awareness(entity)
{
	entity.has_awareness = 1;
	entity.ignorelaststandplayers = 1;
	entity.var_e453bcfa = 10;
	entity.var_91a026f2 = 10;
	entity.var_7ee943e1 = 10;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::register_state(entity, #"wander", &awareness::function_9c9d96b5, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::register_state(entity, #"investigate", &awareness::function_b41f0471, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::register_state(entity, #"chase", &awareness::function_978025e4, &awareness::function_39da6c3c, &awareness::function_b9f81e8b, &awareness::function_5c40e824);
	awareness::set_state(self, #"wander");
	entity callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &function_d1a74442);
	entity thread awareness::function_fa6e010d();
}

/*
	Name: function_d1a74442
	Namespace: namespace_5665d8db
	Checksum: 0xCDFF9EF4
	Offset: 0x428
	Size: 0x84
	Parameters: 1
	Flags: None
*/
function function_d1a74442(params)
{
	self endon(#"death");
	if(isdefined(self.attackable))
	{
		namespace_85745671::function_2b925fa5(self);
	}
	self.var_98f1f37c = 1;
	self.allowdeath = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

