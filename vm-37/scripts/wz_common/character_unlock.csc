#using script_309ce7f5a9a023de;
#using scripts\core_common\item_inventory.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace character_unlock;

/*
	Name: __init__system__
	Namespace: character_unlock
	Checksum: 0x2C1A2F8A
	Offset: 0x80
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"character_unlock", &function_70a657d8, undefined, undefined, #"character_unlock_fixup");
}

/*
	Name: function_70a657d8
	Namespace: character_unlock
	Checksum: 0x80F724D1
	Offset: 0xD0
	Size: 0x4
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_d2294476
	Namespace: character_unlock
	Checksum: 0x3F2A47BF
	Offset: 0xE0
	Size: 0x1C
	Parameters: 3
	Flags: None
*/
function function_d2294476(var_2ab9d3bd, var_f532cd9f, var_3afaa57b)
{
}

