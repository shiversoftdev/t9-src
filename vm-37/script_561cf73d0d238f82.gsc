#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace namespace_c498bb05;

/*
	Name: __init__system__
	Namespace: namespace_c498bb05
	Checksum: 0xAB283FA5
	Offset: 0xB0
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"hash_34176c075d085060", undefined, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_c498bb05
	Checksum: 0xAC61B1BA
	Offset: 0xF8
	Size: 0x5C
	Parameters: 0
	Flags: Linked, AutoExec
*/
function autoexec function_8ac3bea9()
{
	var_4c520d72 = getentarray("window_trigger", "targetname");
	array::thread_all(var_4c520d72, &callback::on_trigger, &function_82c985d1);
}

/*
	Name: function_82c985d1
	Namespace: namespace_c498bb05
	Checksum: 0x605827B0
	Offset: 0x160
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

