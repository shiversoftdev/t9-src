#using script_17a9d06bf819b2d3;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace namespace_3bb7295f;

/*
	Name: __init__system__
	Namespace: namespace_3bb7295f
	Checksum: 0x3B23A4F4
	Offset: 0x98
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_4e2289c68f35238d", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_3bb7295f
	Checksum: 0xF8128085
	Offset: 0xE0
	Size: 0x6C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	namespace_5b1144e::function_5ae4a10c(array(#"p8_wz_snowball_pile", #"p8_wz_snowball_pile_sml"), "snowball_pile", #"hash_34daeba184b6d103", undefined, #"hash_2236529fd654a6b9");
}

