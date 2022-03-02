#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace music;

/*
	Name: function_89f2df9
	Namespace: music
	Checksum: 0x2A66618
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"music", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: music
	Checksum: 0x483D09B8
	Offset: 0xC8
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
	Checksum: 0xDC621DDA
	Offset: 0x138
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

