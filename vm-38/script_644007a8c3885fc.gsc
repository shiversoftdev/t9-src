#using scripts\core_common\system_shared.csc;
#using script_309ce7f5a9a023de;

#namespace namespace_1c7b37c6;

/*
	Name: function_c45584a3
	Namespace: namespace_1c7b37c6
	Checksum: 0xA4D103A
	Offset: 0x70
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_c45584a3()
{
	level notify(218379163);
}

/*
	Name: __init__system__
	Namespace: namespace_1c7b37c6
	Checksum: 0x661A1E3D
	Offset: 0x90
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_28a40055ae0e64e0", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: __init
	Namespace: namespace_1c7b37c6
	Checksum: 0xC37B622B
	Offset: 0xD8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec
*/
function autoexec __init()
{
	function_41453b43();
}

/*
	Name: function_70a657d8
	Namespace: namespace_1c7b37c6
	Checksum: 0x80F724D1
	Offset: 0xF8
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: item_remover
	Namespace: namespace_1c7b37c6
	Checksum: 0x48A48C64
	Offset: 0x108
	Size: 0x34
	Parameters: 2
	Flags: Linked
*/
function item_remover(func1, param1)
{
	if(!isdefined(param1))
	{
		return;
	}
	if(isdefined(func1))
	{
		[[func1]](param1);
	}
}

/*
	Name: item_replacer
	Namespace: namespace_1c7b37c6
	Checksum: 0xD980B600
	Offset: 0x148
	Size: 0x4A
	Parameters: 3
	Flags: Linked
*/
function item_replacer(func1, var_f3ef555b, var_e3c89f9)
{
	if(!isdefined(var_f3ef555b) || !isdefined(var_e3c89f9))
	{
		return;
	}
	if(isdefined(func1))
	{
		[[func1]](var_f3ef555b, var_e3c89f9);
	}
}

/*
	Name: function_41453b43
	Namespace: namespace_1c7b37c6
	Checksum: 0x25249D8E
	Offset: 0x1A0
	Size: 0x4E
	Parameters: 0
	Flags: Linked
*/
function function_41453b43()
{
	var_87d0eef8 = &item_world_fixup::remove_item;
	var_74257310 = &item_world_fixup::add_item_replacement;
	var_f8a4c541 = &item_world_fixup::function_6991057;
}

