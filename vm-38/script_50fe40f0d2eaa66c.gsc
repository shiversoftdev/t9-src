#using scripts\core_common\system_shared.gsc;
#using script_c8d806d2487b617;
#using script_152c3f4ffef9e588;

#namespace namespace_81546b33;

/*
	Name: function_5858a2ab
	Namespace: namespace_81546b33
	Checksum: 0xB3FAFC33
	Offset: 0x78
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_5858a2ab()
{
	level notify(1875307814);
}

/*
	Name: __init__system__
	Namespace: namespace_81546b33
	Checksum: 0x8E809C1
	Offset: 0x98
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	/#
		system::register(#"hash_7b2d0df8fb9099a8", &function_70a657d8, undefined, undefined, #"radiation");
	#/
}

/*
	Name: function_70a657d8
	Namespace: namespace_81546b33
	Checksum: 0x1CDFA5E
	Offset: 0xF0
	Size: 0x4C
	Parameters: 0
	Flags: Private
*/
function private function_70a657d8()
{
	/#
		if(!namespace_956bd4dd::function_ab99e60c())
		{
			return;
		}
		level thread _setup_devgui();
		level thread function_aa32646f();
	#/
}

/*
	Name: _setup_devgui
	Namespace: namespace_81546b33
	Checksum: 0xF3366EE5
	Offset: 0x148
	Size: 0x20C
	Parameters: 0
	Flags: Private
*/
function private _setup_devgui()
{
	/#
		while(!canadddebugcommand())
		{
			waitframe(1);
		}
		path = "";
		cmd = "";
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		adddebugcommand(((("" + path) + "") + cmd) + "");
		path = "";
		adddebugcommand(("" + path) + "");
		adddebugcommand(("" + path) + "");
		adddebugcommand(("" + path) + "");
		adddebugcommand(("" + path) + "");
	#/
}

/*
	Name: function_aa32646f
	Namespace: namespace_81546b33
	Checksum: 0xCC6AC33B
	Offset: 0x360
	Size: 0x8
	Parameters: 0
	Flags: Private
*/
function private function_aa32646f()
{
	/#
	#/
}

