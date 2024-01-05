#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_35baff41;

/*
	Name: function_9e9078e4
	Namespace: namespace_35baff41
	Checksum: 0x7121EF66
	Offset: 0xA8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9e9078e4()
{
	level notify(1849886497);
}

/*
	Name: __init__system__
	Namespace: namespace_35baff41
	Checksum: 0xFBD1B02A
	Offset: 0xC8
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_62ed3e0f56513ba7", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_35baff41
	Checksum: 0xAF20BA38
	Offset: 0x110
	Size: 0x5C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(!zm_trial::is_trial_mode())
	{
		return;
	}
	zm_trial::register_challenge(#"hash_2c07cbb8e8fd2060", &on_begin, &on_end);
}

/*
	Name: on_begin
	Namespace: namespace_35baff41
	Checksum: 0x41DA9168
	Offset: 0x178
	Size: 0x9C
	Parameters: 1
	Flags: Private
*/
function private on_begin(var_6ad4e7c6)
{
	fasttravel_triggers = struct::get_array("fasttravel_trigger", "targetname");
	/#
		assert(isdefined(fasttravel_triggers));
	#/
	zm_trial_util::function_2976fa44(fasttravel_triggers.size);
	zm_trial_util::function_dace284(0);
	level thread function_25f146be();
}

/*
	Name: on_end
	Namespace: namespace_35baff41
	Checksum: 0xABF6A94C
	Offset: 0x220
	Size: 0xA4
	Parameters: 1
	Flags: Private
*/
function private on_end(round_reset)
{
	zm_trial_util::function_f3dbeda7();
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
	Checksum: 0x9A3B8C66
	Offset: 0x2D0
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
	Checksum: 0x62263ED2
	Offset: 0x3D0
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
		zm_trial_util::function_dace284(function_c83a4a77());
		waitframe(1);
	}
}

