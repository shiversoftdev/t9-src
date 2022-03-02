#using scripts\core_common\dogtags.csc;
#using scripts\core_common\util_shared.csc;

#namespace conf;

/*
	Name: function_d7fb60ed
	Namespace: conf
	Checksum: 0xC6A5D878
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d7fb60ed()
{
	level notify(765371239);
}

/*
	Name: main
	Namespace: conf
	Checksum: 0xED613C05
	Offset: 0x90
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	dogtags::init();
}

