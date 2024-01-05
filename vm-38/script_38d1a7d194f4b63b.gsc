#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;

#namespace hint_tutorial;

/*
	Name: function_8b172e82
	Namespace: hint_tutorial
	Checksum: 0x28A6B757
	Offset: 0xC8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_8b172e82()
{
	level notify(909343192);
}

/*
	Name: __init__system__
	Namespace: hint_tutorial
	Checksum: 0xBFA6031F
	Offset: 0xE8
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register("hint_tutorial", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: hint_tutorial
	Checksum: 0x10F4A4F8
	Offset: 0x128
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	clientfield::register("toplayer", "hint_pause_state", 1, 1, "int", &function_22315c10, 1, 0);
}

/*
	Name: function_22315c10
	Namespace: hint_tutorial
	Checksum: 0xF6C458D0
	Offset: 0x180
	Size: 0xC2
	Parameters: 7
	Flags: Linked, Private
*/
function private function_22315c10(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump)
{
	switch(bwastimejump)
	{
		case 1:
		{
			function_5ea2c6e3("cp_hint_tutorial_duck", 0.1, 1);
			break;
		}
		case 0:
		{
			function_ed62c9c2("cp_hint_tutorial_duck", 0.1);
			break;
		}
	}
}

