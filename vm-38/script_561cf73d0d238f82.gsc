#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_c498bb05;

/*
	Name: function_4f90823b
	Namespace: namespace_c498bb05
	Checksum: 0x44CEBF1A
	Offset: 0xB0
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_4f90823b()
{
	level notify(1071966432);
}

/*
	Name: function_89f2df9
	Namespace: namespace_c498bb05
	Checksum: 0xBBFAF91
	Offset: 0xD0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"hash_34176c075d085060", undefined, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_c498bb05
	Checksum: 0x8F8A8322
	Offset: 0x118
	Size: 0x5C
	Parameters: 0
	Flags: AutoExec, Linked
*/
function autoexec function_8ac3bea9()
{
	var_4c520d72 = getentarray("window_trigger", "targetname");
	array::thread_all(var_4c520d72, &callback::function_35a12f19, &function_82c985d1);
}

/*
	Name: function_82c985d1
	Namespace: namespace_c498bb05
	Checksum: 0xC7B6785E
	Offset: 0x180
	Size: 0xC6
	Parameters: 1
	Flags: Linked
*/
function function_82c985d1(var_1482c45a)
{
	if(!isdefined(self.busy))
	{
		self.busy = 0;
	}
	if(is_false(self.busy))
	{
		level endon(#"game_ended");
		if(!isdefined(self.scene))
		{
			self.scene = struct::get(self.target);
		}
		self.busy = 1;
		self.scene scene::play(self.scene.scriptbundlename, "gust");
		self.busy = 0;
	}
}

