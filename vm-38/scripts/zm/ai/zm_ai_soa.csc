#using script_182ec5b35e8dcb93;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_ai_soa;

/*
	Name: function_d24696c6
	Namespace: zm_ai_soa
	Checksum: 0x23B6967F
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d24696c6()
{
	level notify(1030433640);
}

/*
	Name: __init__system__
	Namespace: zm_ai_soa
	Checksum: 0x3DC7DB49
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_ai_soa", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_ai_soa
	Checksum: 0x80F724D1
	Offset: 0xE0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

