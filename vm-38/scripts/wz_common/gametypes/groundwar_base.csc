#using script_78825cbb1ab9f493;
#using scripts\core_common\player\player_insertion.csc;

#namespace groundwar_base;

/*
	Name: function_fd52c48d
	Namespace: groundwar_base
	Checksum: 0xF9D35DF7
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_fd52c48d()
{
	level notify(-219809791);
}

/*
	Name: main
	Namespace: groundwar_base
	Checksum: 0xED613C05
	Offset: 0x90
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_17baa64d::init();
}

