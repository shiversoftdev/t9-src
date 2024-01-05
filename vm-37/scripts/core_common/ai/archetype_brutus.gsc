#using scripts\core_common\ai\archetype_brutus_interface.gsc;
#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using scripts\core_common\spawner_shared.gsc;

#namespace archetypebrutus;

/*
	Name: init
	Namespace: archetypebrutus
	Checksum: 0x1D72EEDC
	Offset: 0x80
	Size: 0x54
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	brutusinterface::registerbrutusinterfaceattributes();
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"brutus", &function_517fd069);
}

/*
	Name: function_651f04c3
	Namespace: archetypebrutus
	Checksum: 0x98185FE9
	Offset: 0xE0
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
	Namespace: archetypebrutus
	Checksum: 0x3B854B4F
	Offset: 0x110
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
	Namespace: archetypebrutus
	Checksum: 0x519351C
	Offset: 0x180
	Size: 0xC
	Parameters: 1
	Flags: Linked, Private
*/
function private function_3cdbfffd(entity)
{
}

/*
	Name: function_666b2409
	Namespace: archetypebrutus
	Checksum: 0x2E8AC5EC
	Offset: 0x198
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
	Namespace: archetypebrutus
	Checksum: 0x80F724D1
	Offset: 0x1D0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
}

/*
	Name: function_f9f08bb1
	Namespace: archetypebrutus
	Checksum: 0xDDDC433C
	Offset: 0x1E0
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_f9f08bb1(message)
{
	/#
		if(getdvarint(#"scr_brutusdebug", 0))
		{
			println("" + message);
		}
	#/
}

/*
	Name: function_f8aa76ea
	Namespace: archetypebrutus
	Checksum: 0xC6F2C616
	Offset: 0x240
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

