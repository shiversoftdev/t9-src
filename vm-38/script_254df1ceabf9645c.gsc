#using script_335d0650ed05d36d;
#using script_b9a55edd207e4ca;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace fireteam_tdm;

/*
	Name: function_4c5ed09d
	Namespace: fireteam_tdm
	Checksum: 0xC463C95C
	Offset: 0x98
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4c5ed09d()
{
	level notify(60164097);
}

/*
	Name: function_89f2df9
	Namespace: fireteam_tdm
	Checksum: 0x8D4F2EFC
	Offset: 0xB8
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_112a74f076cda31", &function_62730899, undefined, undefined, #"territory");
}

/*
	Name: main
	Namespace: fireteam_tdm
	Checksum: 0x8DA42481
	Offset: 0x108
	Size: 0x44
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_2938acdc::init();
	spawning::addsupportedspawnpointtype("tdm");
	level.var_61d4f517 = 1;
}

/*
	Name: function_62730899
	Namespace: fireteam_tdm
	Checksum: 0xEFB9A796
	Offset: 0x158
	Size: 0x74
	Parameters: 0
	Flags: Private
*/
function private function_62730899()
{
	/#
		if(getdvarint(#"hash_2609d7ba41b379e3", 0))
		{
			return;
		}
	#/
	if(isdefined(level.territory) && level.territory.name != "zoo")
	{
		namespace_2938acdc::function_4212369d();
	}
}

