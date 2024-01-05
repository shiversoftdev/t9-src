#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace music_shared;

/*
	Name: function_249bf126
	Namespace: music_shared
	Checksum: 0x1407CC85
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_249bf126()
{
	level notify(1440479198);
}

#namespace music;

/*
	Name: __init__system__
	Namespace: music
	Checksum: 0x3BCB7100
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"music", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: music
	Checksum: 0x9C6E15AC
	Offset: 0xE8
	Size: 0x64
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.activemusicstate = "";
	level.nextmusicstate = "";
	level.musicstates = [];
	util::register_system(#"musiccmd", &musiccmdhandler);
}

/*
	Name: musiccmdhandler
	Namespace: music
	Checksum: 0x35338C5F
	Offset: 0x158
	Size: 0x6C
	Parameters: 3
	Flags: Linked
*/
function musiccmdhandler(clientnum, state, oldstate)
{
	if(oldstate != "death")
	{
		level._lastmusicstate = oldstate;
	}
	oldstate = tolower(oldstate);
	soundsetmusicstate(oldstate);
}

