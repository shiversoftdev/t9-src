#using scripts\core_common\dogtags.csc;
#using script_78825cbb1ab9f493;
#using scripts\core_common\player\player_insertion.csc;

#namespace namespace_f2e23b4a;

/*
	Name: function_8a4997a
	Namespace: namespace_f2e23b4a
	Checksum: 0x10C02850
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8a4997a()
{
	level notify(-1267775477);
}

/*
	Name: main
	Namespace: namespace_f2e23b4a
	Checksum: 0xA0B1F616
	Offset: 0x98
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_17baa64d::init();
	dogtags::init();
}

