#using scripts\core_common\system_shared.gsc;

#namespace classicmode;

/*
	Name: function_76a9ce6d
	Namespace: classicmode
	Checksum: 0x129E7294
	Offset: 0x68
	Size: 0x14
	Parameters: 0
	Flags: AutoExec, Private, 16
*/
function private autoexec function_76a9ce6d()
{
	level notify(965517216);
}

/*
	Name: __init__system__
	Namespace: classicmode
	Checksum: 0x4E9E2709
	Offset: 0x88
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"classicmode", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: classicmode
	Checksum: 0x9A77A97B
	Offset: 0xD0
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	level.classicmode = getgametypesetting(#"classicmode");
	if(level.classicmode)
	{
		enableclassicmode();
	}
}

/*
	Name: enableclassicmode
	Namespace: classicmode
	Checksum: 0xC249700E
	Offset: 0x128
	Size: 0x164
	Parameters: 0
	Flags: Linked
*/
function enableclassicmode()
{
	setdvar(#"playerenergy_slideenergyenabled", 0);
	setdvar(#"trm_maxsidemantleheight", 0);
	setdvar(#"trm_maxbackmantleheight", 0);
	setdvar(#"player_swimming_enabled", 0);
	setdvar(#"player_swimheightratio", 0.9);
	setdvar(#"jump_slowdownenable", 1);
	setdvar(#"sprint_allowrestore", 0);
	setdvar(#"sprint_allowrechamber", 0);
	setdvar(#"cg_blur_time", 500);
	setdvar(#"tu11_enableclassicmode", 1);
}

