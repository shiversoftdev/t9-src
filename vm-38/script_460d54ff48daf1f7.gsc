#using script_19f3d8b7a687a3f1;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace namespace_af5c1c0c;

/*
	Name: function_f4e0308e
	Namespace: namespace_af5c1c0c
	Checksum: 0x4A4693B3
	Offset: 0x118
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_f4e0308e()
{
	level notify(-1291805388);
}

/*
	Name: init
	Namespace: namespace_af5c1c0c
	Checksum: 0xCD45BAAE
	Offset: 0x138
	Size: 0x19C
	Parameters: 0
	Flags: Linked
*/
function init()
{
	clientfield::function_91cd7763("string", "sr_vote_prompt.header", #"hash_469205ac2d4fe20c", #"header", 1, undefined, 0, 0);
	clientfield::register_clientuimodel("sr_vote_prompt.numPlayersNeeded", #"hash_469205ac2d4fe20c", #"hash_2f2580a3787aa336", 1, 2, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("sr_vote_prompt.show", #"hash_469205ac2d4fe20c", #"show", 1, 1, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("sr_vote_prompt.starter", #"hash_469205ac2d4fe20c", #"starter", 1, 7, "int", undefined, 0, 0);
	clientfield::register_clientuimodel("sr_vote_prompt.status", #"hash_469205ac2d4fe20c", #"status", 1, 2, "int", undefined, 0, 0);
	namespace_52c8f34d::function_70a657d8();
}

