#using script_17539b09f594dc50;
#using script_35d655b3a0e4a949;
#using script_51b0fb46d4a05f60;
#using script_6b418dbafc965acc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\visionset_mgr_shared.csc;

#namespace abilities;

/*
	Name: function_497cf8f
	Namespace: abilities
	Checksum: 0x995251CB
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_497cf8f()
{
	level notify(1663470537);
}

/*
	Name: function_89f2df9
	Namespace: abilities
	Checksum: 0xCEC9CD49
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"abilities", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: abilities
	Checksum: 0x80F724D1
	Offset: 0x118
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}
