#using script_3fda550bc6e1089a;
#using script_6c8abe14025b47c4;
#using scripts\core_common\system_shared.gsc;

#namespace helicopter;

/*
	Name: function_89f2df9
	Namespace: helicopter
	Checksum: 0xDB0DFEEF
	Offset: 0xA0
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
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
	if(sessionmodeismultiplayergame() || function_f99d2668())
	{
		killstreaks::function_e4ef8390("killstreak_helicopter_comlink" + "_cp", &usekillstreakhelicopter);
	}
	init_shared();
}

