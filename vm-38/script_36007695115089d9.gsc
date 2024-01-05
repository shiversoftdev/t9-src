#using script_5495f0bb06045dc7;
#using script_b9a55edd207e4ca;
#using script_1304295570304027;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_cf48051e;

/*
	Name: function_f6ac272e
	Namespace: namespace_cf48051e
	Checksum: 0xCE9286DD
	Offset: 0x90
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f6ac272e()
{
	level notify(1234865714);
}

/*
	Name: __init__system__
	Namespace: namespace_cf48051e
	Checksum: 0x7BAFDD6C
	Offset: 0xB0
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
	Namespace: namespace_cf48051e
	Checksum: 0xC79144F4
	Offset: 0x100
	Size: 0x50
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	namespace_2938acdc::init();
	namespace_5c32f369::init();
	level.onstartgametype = &on_start_game_type;
	level.var_61d4f517 = 0;
}

/*
	Name: on_start_game_type
	Namespace: namespace_cf48051e
	Checksum: 0x932359DF
	Offset: 0x158
	Size: 0x24
	Parameters: 0
	Flags: None
*/
function on_start_game_type()
{
	namespace_17baa64d::on_start_game_type();
	namespace_5c32f369::onstartgametype();
}

/*
	Name: function_62730899
	Namespace: namespace_cf48051e
	Checksum: 0xE36E0026
	Offset: 0x188
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

