#using scripts\core_common\dogtags.csc;
#using scripts\core_common\util_shared.csc;

#namespace conf;

/*
	Name: main
	Namespace: conf
	Checksum: 0xE56EBB43
	Offset: 0x70
	Size: 0x1C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	dogtags::init();
}

