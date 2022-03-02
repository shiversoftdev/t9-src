#using script_6021ce59143452c3;
#using script_61a734c95edc17aa;
#using scripts\core_common\system_shared.gsc;
#using scripts\zm_common\zm_bgb.gsc;

#namespace namespace_a90d606b;

/*
	Name: function_89f2df9
	Namespace: namespace_a90d606b
	Checksum: 0xF1FDB10A
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_5e833052f96b85bd", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_a90d606b
	Checksum: 0x592AA161
	Offset: 0xC8
	Size: 0x5C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!zm_trial::function_b47f6aba())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_684ed24d7aec001c", &function_d1de6a85, &function_9e7b3f4d);
}

/*
	Name: function_d1de6a85
	Namespace: namespace_a90d606b
	Checksum: 0x81954A41
	Offset: 0x130
	Size: 0xD8
	Parameters: 0
	Flags: Linked, Private
*/
function private function_d1de6a85()
{
	level zm_trial::function_2b3a3307(1);
	level zm_trial::function_19a1098f(1);
	foreach(player in getplayers())
	{
		player bgb::take();
		player bgb_pack::function_ac9cb612(1);
	}
}

/*
	Name: function_9e7b3f4d
	Namespace: namespace_a90d606b
	Checksum: 0xFDD94551
	Offset: 0x210
	Size: 0xC8
	Parameters: 1
	Flags: Linked, Private
*/
function private function_9e7b3f4d(round_reset)
{
	level zm_trial::function_2b3a3307(0);
	level zm_trial::function_19a1098f(0);
	foreach(player in getplayers())
	{
		player bgb_pack::function_ac9cb612(0);
	}
}

/*
	Name: is_active
	Namespace: namespace_a90d606b
	Checksum: 0x1A28AAE9
	Offset: 0x2E0
	Size: 0x32
	Parameters: 0
	Flags: Linked
*/
function is_active()
{
	challenge = zm_trial::function_a36e8c38(#"hash_684ed24d7aec001c");
	return isdefined(challenge);
}

