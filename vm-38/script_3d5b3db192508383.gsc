#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace dynent_use;

/*
	Name: function_a68f4922
	Namespace: dynent_use
	Checksum: 0xA2F92035
	Offset: 0xA0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_a68f4922()
{
	level notify(1602405812);
}

/*
	Name: function_89f2df9
	Namespace: dynent_use
	Checksum: 0x8819E156
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"dynent_use", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: dynent_use
	Checksum: 0xFA111617
	Offset: 0x108
	Size: 0xA4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	if(!(isdefined(getgametypesetting(#"hash_56ab3c042b783de6")) ? getgametypesetting(#"hash_56ab3c042b783de6") : 0))
	{
		return;
	}
	clientfield::function_a8bbc967("hudItems.dynentUseHoldProgress", #"hud_items", #"hash_5ba72a5aa3320082", 13000, 5, "float", undefined, 0, 0);
}

