#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace spy_med_pack;

/*
	Name: function_5f0c7fad
	Namespace: spy_med_pack
	Checksum: 0xE0380DA9
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5f0c7fad()
{
	level notify(-1892312741);
}

/*
	Name: __init__system__
	Namespace: spy_med_pack
	Checksum: 0xA3072FD3
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"spy_med_pack", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: spy_med_pack
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_b9c8f3cf
	Namespace: spy_med_pack
	Checksum: 0xCC8EA141
	Offset: 0xF8
	Size: 0x3C
	Parameters: 7
	Flags: Private
*/
function private function_b9c8f3cf(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
}

