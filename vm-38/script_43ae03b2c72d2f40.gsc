#using script_3fda550bc6e1089a;
#using script_6c8abe14025b47c4;
#using scripts\core_common\system_shared.gsc;

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
	level notify(2087711312);
}

/*
	Name: function_89f2df9
	Namespace: helicopter
	Checksum: 0x6350D898
	Offset: 0xC0
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
	Checksum: 0xF1F5E4F9
	Offset: 0x110
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

