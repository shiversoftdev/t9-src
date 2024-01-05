#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace status_effect_movement_speed;

/*
	Name: __init__system__
	Namespace: status_effect_movement_speed
	Checksum: 0x8F1D8032
	Offset: 0x80
	Size: 0x3C
	Parameters: 0
	Flags: AutoExec, Private
*/
function private autoexec __init__system__()
{
	system::register(#"status_effect_movement_speed", &function_70a657d8, undefined, undefined, undefined);
}

/*
	Name: function_70a657d8
	Namespace: status_effect_movement_speed
	Checksum: 0xEA073B87
	Offset: 0xC8
	Size: 0x4C
	Parameters: 0
	Flags: Linked, Private
*/
function private function_70a657d8()
{
	status_effect::function_6f4eaf88(getstatuseffect("movement"));
	status_effect::function_5bae5120(8, &function_f7e9c0bb);
}

/*
	Name: function_f7e9c0bb
	Namespace: status_effect_movement_speed
	Checksum: 0x80F724D1
	Offset: 0x120
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function function_f7e9c0bb()
{
}

