#using scripts\mp_common\gametypes\tdm.gsc;
#using scripts\mp_common\gametypes\os.gsc;
#using script_1cc417743d7c262d;

#namespace ostdm;

/*
	Name: function_e46297dd
	Namespace: ostdm
	Checksum: 0xF3A52ADF
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e46297dd()
{
	level notify(-172041440);
}

/*
	Name: main
	Namespace: ostdm
	Checksum: 0x34292B11
	Offset: 0xC0
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

