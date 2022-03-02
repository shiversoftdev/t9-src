#using script_27c22e1d8df4d852;
#using script_6021ce59143452c3;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_35baff41;

/*
	Name: function_89f2df9
	Namespace: namespace_35baff41
	Checksum: 0x53BF6D51
	Offset: 0xA8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_62ed3e0f56513ba7", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_35baff41
	Checksum: 0x52291A0A
	Offset: 0xF0
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_2c07cbb8e8fd2060", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_35baff41
	Checksum: 0x9A40E950
	Offset: 0x158
	Size: 0x9C
	Parameters: 1
	Flags: Private
*/
function private function_d1de6a85(var_6ad4e7c6)
{
	fasttravel_triggers = struct::get_array("fasttravel_trigger", "targetname");
	/#
		assert(isdefined(fasttravel_triggers));
	#/
	namespace_b22c99a5::function_2976fa44(fasttravel_triggers.size);
	namespace_b22c99a5::function_dace284(0);
	level thread function_25f146be();
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_35baff41
	Checksum: 0x5B3D231B
	Offset: 0x200
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private function_9e7b3f4d(round_reset)
{
	namespace_b22c99a5::function_f3dbeda7();
	if(!round_reset)
	{
		fasttravel_triggers = struct::get_array("fasttravel_trigger", "targetname");
		/#
			assert(isdefined(fasttravel_triggers));
		#/
		if(function_c83a4a77() < fasttravel_triggers.size)
		{
			zm_trial::fail(#"hash_6d65e724625758f1");
		}
	}
}

/*
	Name: function_c83a4a77
	Namespace: namespace_35baff41
	Checksum: 0xED258465
	Offset: 0x2B0
	Size: 0xF2
	Parameters: 0
	Flags: Private
*/
function private function_c83a4a77()
{
	fasttravel_triggers = struct::get_array("fasttravel_trigger", "targetname");
	/#
		assert(isdefined(fasttravel_triggers));
	#/
	count = 0;
	foreach(trigger in fasttravel_triggers)
	{
		if(is_true(trigger.unitrigger_stub.used))
		{
			count++;
		}
	}
	return count;
}

/*
	Name: function_25f146be
	Namespace: namespace_35baff41
	Checksum: 0x568E8676
	Offset: 0x3B0
	Size: 0x5E
	Parameters: 0
	Flags: Private
*/
function private function_25f146be()
{
	self endon(#"disconnect");
	level endon(#"hash_7646638df88a3656");
	while(true)
	{
		namespace_b22c99a5::function_dace284(function_c83a4a77());
		waitframe(1);
	}
}

