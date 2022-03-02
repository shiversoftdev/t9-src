#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;

#namespace annihilator;

/*
	Name: function_b274c3f7
	Namespace: annihilator
	Checksum: 0x39ECB3E5
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_b274c3f7()
{
	level notify(910933600);
}

/*
	Name: function_89f2df9
	Namespace: annihilator
	Checksum: 0x1D744B80
	Offset: 0x98
	Size: 0x44
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"annihilator", &__init__, undefined, undefined, #"killstreaks");
}

/*
	Name: __init__
	Namespace: annihilator
	Checksum: 0x80F724D1
	Offset: 0xE8
	Size: 0x4
	Parameters: 0
	Flags: None
*/
function __init__()
{
}

