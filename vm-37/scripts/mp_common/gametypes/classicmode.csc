#using scripts\core_common\system_shared.csc;

#namespace classicmode;

/*
	Name: __init__system__
	Namespace: classicmode
	Checksum: 0xE1B1807D
	Offset: 0x68
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
	Checksum: 0xE825D3C0
	Offset: 0xB0
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
	Checksum: 0xA55ABCA0
	Offset: 0x108
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

