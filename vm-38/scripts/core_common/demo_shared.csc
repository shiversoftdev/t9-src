#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace demo_shared;

/*
	Name: function_9eb68cc3
	Namespace: demo_shared
	Checksum: 0xB5E76579
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_9eb68cc3()
{
	level notify(1782858838);
}

#namespace demo;

/*
	Name: __init__system__
	Namespace: demo
	Checksum: 0x59B4E56
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"demo", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: demo
	Checksum: 0x82F535DE
	Offset: 0xE8
	Size: 0x18
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!isdemoplaying())
	{
		return;
	}
}

