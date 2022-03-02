#using script_13da4e6b98ca81a1;
#using script_544e81d6e48b88c0;
#using scripts\core_common\audio_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\system_shared.csc;

#namespace namespace_8a203916;

/*
	Name: function_89f2df9
	Namespace: namespace_8a203916
	Checksum: 0xA17D4E7A
	Offset: 0xC0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_62a9656d2aaa46aa", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_8a203916
	Checksum: 0x25C9CD71
	Offset: 0x108
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
	Checksum: 0x73B65DF6
	Offset: 0x168
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
	Checksum: 0x69300AB1
	Offset: 0x1A8
	Size: 0x7C
	Parameters: 1
	Flags: Linked
*/
function function_a880899e(var_aa127355)
{
	localclientnum = var_aa127355.localclientnum;
	if(!codcaster::function_b8fe9b52(localclientnum))
	{
		if(var_aa127355.enabled)
		{
			self codeplaypostfxbundle("pstfx_spawn_cam");
		}
		else
		{
			self codestoppostfxbundle("pstfx_spawn_cam");
		}
	}
}

