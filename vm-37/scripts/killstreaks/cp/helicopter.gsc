#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;

#namespace helicopter;

/*
	Name: __init__system__
	Namespace: helicopter
	Checksum: 0xDB0DFEEF
	Offset: 0xA0
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
	Checksum: 0x3EA6EC27
	Offset: 0xF0
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

