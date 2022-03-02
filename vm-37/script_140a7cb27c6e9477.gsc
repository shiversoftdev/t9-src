#using script_18a9e529264a3d29;
#using scripts\core_common\system_shared.csc;

#namespace namespace_ea4e2c95;

/*
	Name: function_89f2df9
	Namespace: namespace_ea4e2c95
	Checksum: 0xBA3DAC57
	Offset: 0xF8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec function_89f2df9()
{
	system::register(#"bowie_knife", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: namespace_ea4e2c95
	Checksum: 0x80F724D1
	Offset: 0x150
	Size: 0x4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
}

/*
	Name: function_8ac3bea9
	Namespace: namespace_ea4e2c95
	Checksum: 0x2A0F02D6
	Offset: 0x160
	Size: 0xB4
	Parameters: 0
	Flags: Linked, Private
*/
function private function_8ac3bea9()
{
	level.var_8e4168e9 = "bowie_knife";
	level.var_63af3e00 = "bowie_flourish";
	var_57858dd5 = "zombie_fists_bowie";
	if(namespace_cb7cafc3::function_166646a6() == 1)
	{
		level.var_8e4168e9 = "bowie_knife_story_1";
		level.var_63af3e00 = "bowie_flourish_story_1";
		var_57858dd5 = "zombie_fists_bowie_story_1";
	}
	level.var_1c0d76f8 = getweapon(hash(level.var_8e4168e9));
}

