#using script_522aeb6ae906391e;
#using script_59f07c660e6710a5;
#using scripts\core_common\spawner_shared.gsc;

#namespace namespace_baa4b777;

/*
	Name: init
	Namespace: namespace_baa4b777
	Checksum: 0xFD0FC90D
	Offset: 0x78
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
	Checksum: 0xF0BEBB0F
	Offset: 0xC8
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
	Checksum: 0x91DDC4A2
	Offset: 0xF8
	Size: 0x7A
	Parameters: 0
	Flags: Private
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
	Checksum: 0xE38EE36C
	Offset: 0x180
	Size: 0x1C
	Parameters: 1
	Flags: Private
*/
function private function_580889d1(entity)
{
	function_fa765ef3();
}

/*
	Name: function_2c84ab00
	Namespace: namespace_baa4b777
	Checksum: 0x8C52F9C8
	Offset: 0x1A8
	Size: 0x1C
	Parameters: 1
	Flags: Private
*/
function private function_2c84ab00(entity)
{
	function_fa765ef3();
}

/*
	Name: function_b8053d02
	Namespace: namespace_baa4b777
	Checksum: 0x2D881B07
	Offset: 0x1D0
	Size: 0x2C
	Parameters: 1
	Flags: Private
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
	Offset: 0x208
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private registerbehaviorscriptfunctions()
{
}

/*
	Name: function_fa765ef3
	Namespace: namespace_baa4b777
	Checksum: 0x732A5213
	Offset: 0x218
	Size: 0x2A
	Parameters: 0
	Flags: Private
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
	Checksum: 0x70588C04
	Offset: 0x250
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

