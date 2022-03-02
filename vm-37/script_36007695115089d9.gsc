#using script_1304295570304027;
#using script_5495f0bb06045dc7;
#using script_b9a55edd207e4ca;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_cf48051e;

/*
	Name: function_89f2df9
	Namespace: namespace_cf48051e
	Checksum: 0x58DD0E00
	Offset: 0x90
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
	Namespace: namespace_cf48051e
	Checksum: 0x64BA93D8
	Offset: 0xE0
	Size: 0x50
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_2938acdc::init();
	namespace_5c32f369::init();
	level.onstartgametype = &function_d81f6eb7;
	level.var_61d4f517 = 0;
}

/*
	Name: function_d81f6eb7
	Namespace: namespace_cf48051e
	Checksum: 0xCB80822B
	Offset: 0x138
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function function_d81f6eb7()
{
	namespace_17baa64d::function_d81f6eb7();
	namespace_5c32f369::onstartgametype();
}

/*
	Name: function_62730899
	Namespace: namespace_cf48051e
	Checksum: 0xFFED026
	Offset: 0x168
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_62730899()
{
	if(isdefined(level.territory) && level.territory.name != "zoo")
	{
		namespace_2938acdc::function_4212369d();
	}
}

