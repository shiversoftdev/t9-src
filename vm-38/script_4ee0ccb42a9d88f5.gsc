#using script_1dafe158a70189fd;
#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using scripts\core_common\spawner_shared.gsc;

#namespace namespace_72d82355;

/*
	Name: function_d5576240
	Namespace: namespace_72d82355
	Checksum: 0xABEF044C
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d5576240()
{
	level notify(307598140);
}

#namespace namespace_363fe686;

/*
	Name: init
	Namespace: namespace_363fe686
	Checksum: 0x7CED4030
	Offset: 0xA0
	Size: 0x54
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	namespace_1f694fcd::registerbrutusinterfaceattributes();
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"brutus", &function_517fd069);
}

/*
	Name: function_651f04c3
	Namespace: namespace_363fe686
	Checksum: 0xA338EF4E
	Offset: 0x100
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_651f04c3()
{
	/#
		assert(isdefined(self.ai));
	#/
}

/*
	Name: function_517fd069
	Namespace: namespace_363fe686
	Checksum: 0xE96B30F5
	Offset: 0x130
	Size: 0x62
	Parameters: 0
	Flags: Linked, Private
*/
function private function_517fd069()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_666b2409;
	self.___archetypeonbehavecallback = &function_3cdbfffd;
}

/*
	Name: function_3cdbfffd
	Namespace: namespace_363fe686
	Checksum: 0xDAEF7FAF
	Offset: 0x1A0
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3cdbfffd(entity)
{
}

/*
	Name: function_666b2409
	Namespace: namespace_363fe686
	Checksum: 0x955FE402
	Offset: 0x1B8
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_666b2409(entity)
{
	self.__blackboard = undefined;
	self function_517fd069();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_363fe686
	Checksum: 0x80F724D1
	Offset: 0x1F0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
}

/*
	Name: function_f9f08bb1
	Namespace: namespace_363fe686
	Checksum: 0x6E797976
	Offset: 0x200
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_f9f08bb1(message)
{
	/#
		if(getdvarint(#"hash_4aefa984c0b2ea80", 0))
		{
			println("" + message);
		}
	#/
}

/*
	Name: function_f8aa76ea
	Namespace: namespace_363fe686
	Checksum: 0x352492E3
	Offset: 0x260
	Size: 0x44
	Parameters: 4
	Flags: Linked
*/
function function_f8aa76ea(entity, attribute, oldvalue, value)
{
	if(value)
	{
		oldvalue function_d4c687c9();
	}
}

