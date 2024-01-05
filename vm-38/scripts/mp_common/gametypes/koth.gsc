#using scripts\mp_common\gametypes\globallogic.gsc;
#using script_50d0f08de978328d;

#namespace koth;

/*
	Name: function_83df1ba
	Namespace: koth
	Checksum: 0x88C4C28E
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_83df1ba()
{
	level notify(888776384);
}

/*
	Name: main
	Namespace: koth
	Checksum: 0xA0B1F616
	Offset: 0x90
	Size: 0x2C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	globallogic::init();
	namespace_d150537f::init();
}

