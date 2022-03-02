#using scripts\core_common\rat_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\cp_common\util.gsc;

#namespace rat;

/*
	Name: function_d3ed7671
	Namespace: rat
	Checksum: 0x88C0BFE4
	Offset: 0x80
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_d3ed7671()
{
	level notify(1250878621);
}

/*
	Name: function_89f2df9
	Namespace: rat
	Checksum: 0xD5463D36
	Offset: 0xA0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	/#
		system::register(#"rat", &function_70a657d8, undefined, undefined, undefined);
	#/
}

/*
	Name: function_70a657d8
	Namespace: rat
	Checksum: 0x4B218A57
	Offset: 0xE8
	Size: 0x42
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		init();
		level.rat.common.gethostplayer = &util::gethostplayer;
	#/
}

