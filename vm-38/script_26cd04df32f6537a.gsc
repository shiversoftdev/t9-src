#using script_2c5daa95f8fec03c;
#using script_3aa0f32b70d4f7cb;
#using scripts\core_common\ai\zombie_utility.gsc;
#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;

#namespace namespace_e942233b;

/*
	Name: function_aa1f7568
	Namespace: namespace_e942233b
	Checksum: 0xD9E3605D
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_aa1f7568()
{
	level notify(2088739555);
}

#namespace namespace_5df129e7;

/*
	Name: init
	Namespace: namespace_5df129e7
	Checksum: 0xC3EFD89D
	Offset: 0xB8
	Size: 0xA4
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"tormentor", &function_d0439ae2);
	spawner::add_archetype_spawn_function(#"tormentor", &zombie_utility::zombiespawnsetup);
	spawner::function_89a2cd87(#"tormentor", &function_bac4724a);
}

/*
	Name: function_d0439ae2
	Namespace: namespace_5df129e7
	Checksum: 0xC54F72DC
	Offset: 0x168
	Size: 0x56
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d0439ae2()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_71825c43;
	self.zombie_think_done = 1;
}

/*
	Name: function_71825c43
	Namespace: namespace_5df129e7
	Checksum: 0x5878FF88
	Offset: 0x1C8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_71825c43(entity)
{
	entity.__blackboard = undefined;
	entity function_d0439ae2();
}

/*
	Name: function_9668f61f
	Namespace: namespace_5df129e7
	Checksum: 0x9F8E2504
	Offset: 0x200
	Size: 0x4A
	Parameters: 0
	Flags: Linked
*/
function function_9668f61f()
{
	self.stumble = 0;
	self.var_b1c7a59d = gettime();
	self.var_eabe8c08 = gettime();
	self.var_4db55459 = 0;
	self.var_8198a38c = 30;
	self.var_b91eb4e5 = 15;
}

/*
	Name: function_bac4724a
	Namespace: namespace_5df129e7
	Checksum: 0xDD673004
	Offset: 0x258
	Size: 0x66
	Parameters: 0
	Flags: Linked
*/
function function_bac4724a()
{
	function_9668f61f();
	namespace_81245006::initweakpoints(self);
	self callback::function_d8abfc3d(#"on_ai_killed", &function_c24ab28e);
	self.should_zigzag = 0;
}

/*
	Name: function_c24ab28e
	Namespace: namespace_5df129e7
	Checksum: 0x1DF04669
	Offset: 0x2C8
	Size: 0x16
	Parameters: 1
	Flags: Linked, Private
*/
function private function_c24ab28e(params)
{
	self.takedamage = 0;
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_5df129e7
	Checksum: 0x80F724D1
	Offset: 0x2E8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
}

