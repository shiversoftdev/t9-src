#using scripts\mp_common\gametypes\dm.gsc;
#using scripts\mp_common\gametypes\os.gsc;
#using script_1cc417743d7c262d;

#namespace osdm;

/*
	Name: function_ca2b9286
	Namespace: osdm
	Checksum: 0xF5A79939
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_ca2b9286()
{
	level notify(1230197793);
}

/*
	Name: main
	Namespace: osdm
	Checksum: 0x5ADB89E0
	Offset: 0xC0
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	dm::main();
	os::turn_back_time("dm");
	globallogic_audio::set_leader_gametype_dialog("osStartFfa", "", "gameBoost", "gameBoost");
}

