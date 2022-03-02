#using script_135d639e83b15d2f;
#using script_1940fc077a028a81;
#using script_3357acf79ce92f4b;
#using script_3411bb48d41bd3b;
#using script_522aeb6ae906391e;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;

#namespace namespace_45b55437;

/*
	Name: function_bd3a094a
	Namespace: namespace_45b55437
	Checksum: 0xA6577BB9
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_bd3a094a()
{
	level notify(1019229742);
}

/*
	Name: function_89f2df9
	Namespace: namespace_45b55437
	Checksum: 0x86040F00
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_7d755ebddd333af6", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_45b55437
	Checksum: 0xE0D8E524
	Offset: 0x118
	Size: 0x34
	Parameters: 0
	Flags: Linked
*/
function function_70a657d8()
{
	spawner::add_archetype_spawn_function(#"hulk", &function_a8e554a7);
}

/*
	Name: function_a8e554a7
	Namespace: namespace_45b55437
	Checksum: 0xC5871E84
	Offset: 0x158
	Size: 0x2C
	Parameters: 0
	Flags: Linked
*/
function function_a8e554a7()
{
	function_db7f78a1();
	function_fb4a1aa3(self);
}

/*
	Name: function_db7f78a1
	Namespace: namespace_45b55437
	Checksum: 0x17305109
	Offset: 0x190
	Size: 0x32
	Parameters: 0
	Flags: Linked, Private
*/
function private function_db7f78a1()
{
	blackboard::createblackboardforentity(self);
	self.___archetypeonanimscriptedcallback = &function_4668e5c8;
}

/*
	Name: function_4668e5c8
	Namespace: namespace_45b55437
	Checksum: 0x45DBA2B8
	Offset: 0x1D0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_4668e5c8(entity)
{
	entity.__blackboard = undefined;
	entity function_db7f78a1();
}

/*
	Name: function_fb4a1aa3
	Namespace: namespace_45b55437
	Checksum: 0x3CD699F3
	Offset: 0x208
	Size: 0x214
	Parameters: 1
	Flags: Linked, Private
*/
function private function_fb4a1aa3(entity)
{
	entity.fovcosine = 0.5;
	entity.maxsightdistsqrd = sqr(1000);
	entity.var_f9a12c59 = 1;
	entity.var_ed35eeb2 = 1;
	entity.var_1267fdea = 1;
	self callback::function_d8abfc3d(#"on_ai_damage", &awareness::function_5f511313);
	awareness::function_dad6ba0e(entity, #"wander", &awareness::function_9c9d96b5, &awareness::function_4ebe4a6d, &awareness::function_b264a0bc, undefined, &awareness::function_555d960b);
	awareness::function_dad6ba0e(entity, #"investigate", &awareness::function_b41f0471, &awareness::function_9eefc327, &awareness::function_34162a25, undefined, &awareness::function_a360dd00);
	awareness::function_dad6ba0e(entity, #"chase", &awareness::function_978025e4, &awareness::function_39da6c3c, &awareness::function_b9f81e8b, &awareness::function_5c40e824);
	awareness::set_state(entity, #"wander");
	entity callback::function_d8abfc3d(#"hash_10ab46b52df7967a", &function_bf7037e9);
	entity thread awareness::function_fa6e010d();
}

/*
	Name: function_bf7037e9
	Namespace: namespace_45b55437
	Checksum: 0x4511FC69
	Offset: 0x428
	Size: 0x74
	Parameters: 1
	Flags: Linked
*/
function function_bf7037e9(params)
{
	self endon(#"death");
	if(isdefined(self.attackable))
	{
		namespace_85745671::function_2b925fa5(self);
	}
	self.var_98f1f37c = 1;
	self kill(undefined, undefined, undefined, undefined, 0, 1);
}

