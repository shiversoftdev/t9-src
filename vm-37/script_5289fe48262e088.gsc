#using script_4eecbd20dc9a462c;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace chopper_gunner;

/*
	Name: __init__system__
	Namespace: chopper_gunner
	Checksum: 0x54989146
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"chopper_gunner", &function_70a657d8, undefined, undefined, #"killstreaks");
}

/*
	Name: function_70a657d8
	Namespace: chopper_gunner
	Checksum: 0x1FE02AB6
	Offset: 0xE8
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_e8c18978::function_70a657d8();
	clientfield::register("vehicle", "" + #"hash_164696e86d29988d", 1, 1, "int", &function_d4e58332, 0, 0);
}

/*
	Name: function_d4e58332
	Namespace: chopper_gunner
	Checksum: 0xD463C4DB
	Offset: 0x160
	Size: 0x64
	Parameters: 7
	Flags: Linked, Private
*/
function private function_d4e58332(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	if(bwastimejump)
	{
		self thread scene::stop(#"chopper_gunner_door_open_client");
	}
}

