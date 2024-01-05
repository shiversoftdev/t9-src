#using scripts\core_common\system_shared.csc;
#using script_544e81d6e48b88c0;
#using script_13da4e6b98ca81a1;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\audio_shared.csc;

#namespace namespace_8a203916;

/*
	Name: function_1dcead70
	Namespace: namespace_8a203916
	Checksum: 0xB6FA8E15
	Offset: 0xC0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_1dcead70()
{
	level notify(-1850704805);
}

/*
	Name: __init__system__
	Namespace: namespace_8a203916
	Checksum: 0x9139301
	Offset: 0xE0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_62a9656d2aaa46aa", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_8a203916
	Checksum: 0x1D0073E5
	Offset: 0x128
	Size: 0x54
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	callback::add_callback(#"territory", &function_59941838);
	callback::function_a880899e(&function_a880899e);
}

/*
	Name: function_59941838
	Namespace: namespace_8a203916
	Checksum: 0xEBD73744
	Offset: 0x188
	Size: 0x34
	Parameters: 2
	Flags: Linked, Private
*/
function private function_59941838(local_client_num, eventstruct)
{
	namespace_99c84a33::function_bb3bbc2c("overhead_spectate_cam", 64);
}

/*
	Name: function_a880899e
	Namespace: namespace_8a203916
	Checksum: 0xCDFA11C7
	Offset: 0x1C8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_a880899e(eventparams)
{
	localclientnum = eventparams.localclientnum;
	if(!codcaster::function_b8fe9b52(localclientnum))
	{
		if(eventparams.enabled)
		{
			self codeplaypostfxbundle("pstfx_spawn_cam");
		}
		else
		{
			self codestoppostfxbundle("pstfx_spawn_cam");
		}
	}
}

