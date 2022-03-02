#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\dm.gsc;
#using scripts\mp_common\gametypes\os.gsc;

#namespace namespace_82ae72f6;

/*
	Name: main
	Namespace: namespace_82ae72f6
	Checksum: 0x20D53F71
	Offset: 0xA0
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

