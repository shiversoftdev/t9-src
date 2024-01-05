#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace demo;

/*
	Name: __init__system__
	Namespace: demo
	Checksum: 0xAAB4E922
	Offset: 0x80
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
	Checksum: 0xCE665D71
	Offset: 0xC8
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

