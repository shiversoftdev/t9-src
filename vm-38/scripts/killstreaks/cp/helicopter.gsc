#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;

#namespace helicopter;

/*
	Name: function_8471776c
	Namespace: helicopter
	Checksum: 0xFC9D24FA
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8471776c()
{
	level notify(-2087711312);
}

/*
	Name: __init__system__
	Namespace: helicopter
	Checksum: 0x6350D898
	Offset: 0xC0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"helicopter", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: helicopter
	Checksum: 0xF1F5E4F9
	Offset: 0x110
	Size: 0x74
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	if(sessionmodeismultiplayergame() || sessionmodeiswarzonegame())
	{
		killstreaks::register_killstreak("killstreak_helicopter_comlink" + "_cp", &usekillstreakhelicopter);
	}
	init_shared();
}

