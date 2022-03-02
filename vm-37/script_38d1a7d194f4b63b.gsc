#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_fe8e9929;

/*
	Name: function_89f2df9
	Namespace: namespace_fe8e9929
	Checksum: 0x8D7D7549
	Offset: 0xC8
	Size: 0x34
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register("hint_tutorial", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_fe8e9929
	Checksum: 0x2F1C17B1
	Offset: 0x108
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
	Namespace: namespace_fe8e9929
	Checksum: 0x638EA701
	Offset: 0x160
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

