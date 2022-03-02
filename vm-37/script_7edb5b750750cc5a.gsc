#using script_43548f456dfe4be4;
#using script_6c8abe14025b47c4;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace killstreaks;

/*
	Name: function_89f2df9
	Namespace: killstreaks
	Checksum: 0x8082A111
	Offset: 0x80
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"killstreaks", &function_70a657d8, undefined, undefined, #"weapons");
}

/*
	Name: function_70a657d8
	Namespace: killstreaks
	Checksum: 0xE67622B2
	Offset: 0xD0
	Size: 0x34
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	init_shared();
	callback::on_start_gametype(&init);
}

/*
	Name: init
	Namespace: killstreaks
	Checksum: 0xD8F5B153
	Offset: 0x110
	Size: 0xF4
	Parameters: 0
	Flags: None
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

