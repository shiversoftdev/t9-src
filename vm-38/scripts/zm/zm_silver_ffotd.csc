#using scripts\core_common\system_shared.csc;

#namespace zm_silver_ffotd;

/*
	Name: function_6bf36e04
	Namespace: zm_silver_ffotd
	Checksum: 0x4CD146B5
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_6bf36e04()
{
	level notify(-618144890);
}

/*
	Name: __init__system__
	Namespace: zm_silver_ffotd
	Checksum: 0xE86CCB23
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"zm_silver_ffotd", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_silver_ffotd
	Checksum: 0x80F724D1
	Offset: 0xD0
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

