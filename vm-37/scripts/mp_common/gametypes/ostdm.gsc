#using script_1cc417743d7c262d;
#using scripts\mp_common\gametypes\os.gsc;
#using scripts\mp_common\gametypes\tdm.gsc;

#namespace namespace_140b10cf;

/*
	Name: main
	Namespace: namespace_140b10cf
	Checksum: 0xB65D92DB
	Offset: 0xA0
	Size: 0x64
	Parameters: 1
	Flags: Event
*/
event main(eventstruct)
{
	tdm::main();
	os::turn_back_time("tdm");
	globallogic_audio::set_leader_gametype_dialog("osStartTdm", "", "gameBoost", "gameBoost");
}

