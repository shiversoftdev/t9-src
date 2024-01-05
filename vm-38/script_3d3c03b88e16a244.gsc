#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using scripts\core_common\spawner_shared.gsc;

#namespace namespace_a84b7a30;

/*
	Name: function_7f6c7f05
	Namespace: namespace_a84b7a30
	Checksum: 0x4F26329
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_7f6c7f05()
{
	level notify(-848954924);
}

#namespace namespace_baa4b777;

/*
	Name: init
	Namespace: namespace_baa4b777
	Checksum: 0x83E51516
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec
*/
function autoexec init()
{
	registerbehaviorscriptfunctions();
	spawner::add_archetype_spawn_function(#"hash_7c0d83ac1e845ac2", &function_f9fa2bbb);
}

/*
	Name: function_acf96b05
	Namespace: namespace_baa4b777
	Checksum: 0x9944B7AF
	Offset: 0xE8
	Size: 0x24
	Parameters: 0
	Flags: Private
*/
function private function_acf96b05()
{
	/#
		assert(isdefined(self.ai));
	#/
}

/*
	Name: function_f9fa2bbb
	Namespace: namespace_baa4b777
	Checksum: 0xCDEB0367
	Offset: 0x118
	Size: 0x7A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_f9fa2bbb()
{
	blackboard::createblackboardforentity(self);
	ai::createinterfaceforentity(self);
	self.___archetypeonanimscriptedcallback = &function_b8053d02;
	self.___archetypeonbehavecallback = &function_2c84ab00;
	self.var_7401c936 = &function_580889d1;
}

/*
	Name: function_580889d1
	Namespace: namespace_baa4b777
	Checksum: 0x8B5FFFB5
	Offset: 0x1A0
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_580889d1(entity)
{
	function_fa765ef3();
}

/*
	Name: function_2c84ab00
	Namespace: namespace_baa4b777
	Checksum: 0x1CA671D2
	Offset: 0x1C8
	Size: 0x1C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_2c84ab00(entity)
{
	function_fa765ef3();
}

/*
	Name: function_b8053d02
	Namespace: namespace_baa4b777
	Checksum: 0x2B93C0F3
	Offset: 0x1F0
	Size: 0x2C
	Parameters: 1
	Flags: Linked, Private
*/
function private function_b8053d02(entity)
{
	self.__blackboard = undefined;
	self function_f9fa2bbb();
}

/*
	Name: registerbehaviorscriptfunctions
	Namespace: namespace_baa4b777
	Checksum: 0x80F724D1
	Offset: 0x228
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private registerbehaviorscriptfunctions()
{
}

/*
	Name: function_fa765ef3
	Namespace: namespace_baa4b777
	Checksum: 0x58679D25
	Offset: 0x238
	Size: 0x2A
	Parameters: 0
	Flags: Linked, Private
*/
function private function_fa765ef3()
{
	if(is_true(self.is_companion))
	{
		self.pushable = 0;
	}
}

/*
	Name: function_ee21651d
	Namespace: namespace_baa4b777
	Checksum: 0x65F2663F
	Offset: 0x270
	Size: 0x54
	Parameters: 1
	Flags: Private
*/
function private function_ee21651d(message)
{
	/#
		if(getdvarint(#"hash_71bbda417e2a07e9", 0))
		{
			println("" + message);
		}
	#/
}

