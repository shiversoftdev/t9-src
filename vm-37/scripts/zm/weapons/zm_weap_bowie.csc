#using scripts\zm_common\zm_maptable.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_weap_bowie;

/*
	Name: __init__system__
	Namespace: zm_weap_bowie
	Checksum: 0xBA3DAC57
	Offset: 0xF8
	Size: 0x4C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"bowie_knife", &function_70a657d8, &function_8ac3bea9, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: zm_weap_bowie
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
	Namespace: zm_weap_bowie
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
	if(zm_maptable::get_story() == 1)
	{
		level.var_8e4168e9 = "bowie_knife_story_1";
		level.var_63af3e00 = "bowie_flourish_story_1";
		var_57858dd5 = "zombie_fists_bowie_story_1";
	}
	level.w_bowie_knife = getweapon(hash(level.var_8e4168e9));
}

