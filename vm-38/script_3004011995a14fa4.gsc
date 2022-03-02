#using script_3a2fac1479c56997;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\zm_common\zm_utility.csc;

#namespace zm_progress;

/*
	Name: function_53d721e6
	Namespace: zm_progress
	Checksum: 0x860345DF
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_53d721e6()
{
	level notify(1263656936);
}

/*
	Name: function_89f2df9
	Namespace: zm_progress
	Checksum: 0x929312AE
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"zm_progress", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_progress
	Checksum: 0xDDC5A3FA
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	zm_build_progress::register();
}

