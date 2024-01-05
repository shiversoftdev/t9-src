#using script_b9a55edd207e4ca;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using script_335d0650ed05d36d;
#using scripts\core_common\death_circle.gsc;

#namespace fireteam_tdm;

/*
	Name: __init__system__
	Namespace: fireteam_tdm
	Checksum: 0x9CF9A62B
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_112a74f076cda31", &function_62730899, undefined, undefined, #"territory");
}

/*
	Name: main
	Namespace: fireteam_tdm
	Checksum: 0x70C40F7B
	Offset: 0xE8
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
	Checksum: 0xFFFA2CDF
	Offset: 0x138
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

