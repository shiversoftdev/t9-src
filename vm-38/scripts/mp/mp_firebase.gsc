#using script_35bcb1965d840fd1;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\load_shared.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace mp_firebase;

/*
	Name: function_b3b6dc60
	Namespace: mp_firebase
	Checksum: 0x31BDC658
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b3b6dc60()
{
	level notify(742737129);
}

/*
	Name: main
	Namespace: mp_firebase
	Checksum: 0x9C62C43E
	Offset: 0xE0
	Size: 0x7C
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	level thread function_876cf680();
	load::main();
	level.scene_streamer_ignore[#"hash_20c99388c9759530"] = 1;
	level.scene_streamer_ignore[#"hash_2cf8409da46598ab"] = 1;
	compass::setupminimap("");
}

/*
	Name: function_876cf680
	Namespace: mp_firebase
	Checksum: 0x9D20613D
	Offset: 0x168
	Size: 0xF4
	Parameters: 0
	Flags: None
*/
function function_876cf680()
{
	var_a139d000 = strtok("sd sd_cdl", " ");
	str_gametype = util::get_game_type();
	if(isinarray(var_a139d000, str_gametype))
	{
		hidemiscmodels("cave_cover_01");
		array::delete_all(getentarray("cave_cover_01", "targetname"));
	}
	array::run_all(getentarray("cave_cover_01", "targetname"), &disconnectpaths, undefined, 0);
}

