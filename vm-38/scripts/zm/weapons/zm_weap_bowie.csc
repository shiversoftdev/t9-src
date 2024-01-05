#using scripts\zm_common\zm_maptable.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_weap_bowie;

/*
	Name: function_e03c0537
	Namespace: zm_weap_bowie
	Checksum: 0x9AFBCACB
	Offset: 0xF8
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_e03c0537()
{
	level notify(1717795478);
}

/*
	Name: __init__system__
	Namespace: zm_weap_bowie
	Checksum: 0xAACA5B8F
	Offset: 0x118
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
	Offset: 0x170
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
	Checksum: 0xB10C05DC
	Offset: 0x180
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

