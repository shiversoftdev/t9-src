#using script_43548f456dfe4be4;
#using scripts\core_common\system_shared.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace killstreaks;

/*
	Name: function_134cf5e6
	Namespace: killstreaks
	Checksum: 0x688CD522
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_134cf5e6()
{
	level notify(1410907296);
}

/*
	Name: __init__system__
	Namespace: killstreaks
	Checksum: 0x38DF8766
	Offset: 0xA0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"killstreaks", &function_70a657d8, undefined, undefined, #"weapons");
}

/*
	Name: function_70a657d8
	Namespace: killstreaks
	Checksum: 0x427E6B5
	Offset: 0xF0
	Size: 0x34
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: killstreaks
	Checksum: 0x451A461A
	Offset: 0x130
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function init()
{
	/#
		level.killstreak_init_start_time = getmillisecondsraw();
		thread debug_ricochet_protection();
	#/
	function_447e6858();
	callback::callback(#"hash_45f35669076bc317");
	killstreakrules::init();
	/#
		level.killstreak_init_end_time = getmillisecondsraw();
		elapsed_time = level.killstreak_init_end_time - level.killstreak_init_start_time;
		println(("" + elapsed_time) + "");
		level thread killstreak_debug_think();
	#/
}

